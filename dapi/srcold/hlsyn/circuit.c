/*****************************************************************************/
/**  HLsyn - Version 2.2                                                    **/
/**                                                                         **/
/** Copyright (c) 1993-1998 by Sensimetrics Corporation                     **/
/** All rights reserved.                                                    **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  circuit.c - analyze the speech circuit for Pm and agx
 *
 *  coded by J. Erik Moore, 2/94
 *      
 *  Modification History:
 *
 *  25 Mar 1998  reb:  bring negative an's up to zero.
 *  27 Oct 1997  reb:  fixed bug in handling of ag<0; made handling of ag, ap, 
 *               Cg, and Cw < 0 uniform.
 *   6 Oct 1997  reb:  removed Brent's algorithm code to brent.c; reworked 
 *               iterative integration of the circuit dynamics to avoid 
 *               stiffness problems (when Cw is approx. zero).
 *  30 Apr 1997  reb:  protect against division by zero in calculation of delta 
 *               t over Cw when dc = -100; remove "fudge" of cases Pm < Ps, 
 *               Pm < 0 and instead use FLOW_SQRT.
 *  13 Nov 1996  reb:  moved ps from HLSpeaker to HLFrame, changed instances 
 *               of Ps to ps to reflect this, moved Cw and Cg from HLSpeaker 
 *               to HLState, added Cwm and Cgm to HLSpeaker; added agf to 
 *               HLState, computed it in SpeechCircuit (similarly to agx) and 
 *               used it rather than agx in computation of Pm.
 *  27 Aug 1996  reb:  include flavor.h
 *  08 Aug 1996  reb:  archived as version 2.2 (no changes).
 *  15 Feb 1994  original, from a cleaned up pmuguc.c from Williams;
 *	         circuit solved completely different 2 equations
 *   8 Mar 1994  one algebraic equation, 1D Brent's method with 2 state
 *               equations, one for agx and the other for Pcw
 *  11 Jul 1994  ag can be specified as ag<0 to compensate for Pm increasing
 *		 agx.  agx is always agx>=0 where agx=0 if ag+f(Pm)<=0.  The
 *		 equations need agx>=0.
 *	10 Oct 2002 mfg:ifdef out Process.h not supported under WinCE
 *
 */

#include "flavor.h"
#ifdef ARM7
#pragma arm section code="CIRCODE", rwdata="CIRRWDATA", rodata="CIRRODATA", zidata="CIRDATA"
#endif

#if (defined(DEBUG) && !defined(UNDER_CE)) || (defined(WARNINGS) && !defined(UNDER_CE)) 

#include <stdio.h>	/* for printf on error */
#include <stdlib.h>	/* for exit on error */
#include <process.h>	/* for exit on error */
#endif

#include <math.h>
#include "hlsyn.h"

typedef struct
  {
  float rootTwoOverRho;
  float ag;
  float acx;
  float an;
  float ap;
  float ue;
  float ps;
  float Lg;
  float Cg;
  float Cw;
  float A;
  float B;
  } PmRootFunctionArgs;


/*****
  Brent
*****/
#ifdef LOWCOMPUTE_MITSU
#define CIRCUIT_TOL 4.0e+2f /* Root tolerance */
#else
#define CIRCUIT_TOL 2.0e-3f /* Root tolerance */
#endif
static BrentFunctionType PmRootFunction;



/*****
  This routine solves the lumped element circuit of the mouth and nose.

  We assume that all of the resistances except the wall
  resistance are kinematic resistances where:

  	  R = rho U/(2 A*A)
	  
  where U is flow and A is the area of the opening.

  The nonlinear equations to be solved are:

  dQw/dt = Uw = -ue + sqrt(2/rho) * (agf*FLOW_SQRT(ps-Pm) - (acx+an)*FLOW_SQRT(Pm))
  Rw * Uw = Pm - Pcw
  Qw = Cw * Pcw

  where Qw is the "charge" on the wall capacitance, Uw the flow 
  through this capacitance, agf is the pressure-adjusted glottal area, 
  ps is the source pressure behind the glottis, Pm is the pressure in 
  the mouth, Pcw is the pressure accross the wall capacitance, Rw is 
  the wall resistance (assumed constant), ue is the shunt flow due to 
  volume expansion, an is the area of the nasal opening, acx is the area 
  of the smallest oral constriction, Cw is the compliance of the walls, 
  and FLOW_SQRT(p) is sqrt(p) if p >= 0 and -sqrt(-p) if p <= 0.

  Because this initial-value problem is stiff, the usual numerical solution
  schemes (e.g. Euler's method [= state machines]) are unstable for small 
  values of Cw.  So a so-called "implicit" method is used.  Specifically, 
  we can timestep Qw using the scheme 

  newQw = oldQw + 0.5 * (oldUw + newUw) * deltaT
  
  and eliminating Qw in favor of Pcw and expressing newPcw 
  in terms of newPm and newUw (via Pcw = Pm - Rw * Uw) yields

  newCw * newPm - (Rw*newCw + deltaT/2) * newUw = oldCw * oldPcw + oldUw * deltaT/2

  or equivalently:

  newUw = A * newPm - B

  where A = newCw / (Rw * newCw + deltaT/2), 
  and   B = (oldCw * oldPcw + oldUw * deltaT/2) / (Rw * newCw + deltaT/2)
  are known.

  But using Uw = -ue + ... given above lets us eliminate newUw in 
  favor of newPm (and known quantities at the new time), resulting in 
  an equation for newPm which can be solved via Brent's algorithm.  
  Then, having obtained newPm we can calculate newUw.

  Finally, once newPm and newUw are known newPcw can be found via

  newPcw = newPm - Rw * newUw,

  and then the cycle can be repeated at the next time step.

  We really should look into more powerful numerical integration methods for 
  this problem (the above is only second-order), or at least some form of 
  intelligent step-size adjustment.
  *****/

#define NEXT_Uw(Pm, p) \
  ((p)->A * (Pm) - (p)->B)

void
SpeechCircuit(HLFrame *frame,HLFrame *oldframe,HLSpeaker *speaker,
		   HLState *state,HLState *oldstate)

{
  short NumInterpolations,interp,BracketReturn;

  float agprev,agstep,acxprev,acxstep,anprev,anstep,ueprev,uestep;
  float apprev,apstep,Cgprev,Cgstep,Cwprev,Cwstep,psprev,psstep;
  float Pm,Pcw,Uw,oldCw,deltaTOver2,RwCwPlusDeltaTOver2;
  float MinGuess,MaxGuess;
  float NumInterpolationsDivider;
  PmRootFunctionArgs otherArgs;
  
  /*****
    Set up for the interpolations on areas and ue
  *****/
if(oldstate->Pm <= 2.0e+03f)
{
	NumInterpolations = 1;
	NumInterpolationsDivider = 1.0f;
}
else
if (oldstate->Pm < 4.0e+3f)
{ 
	NumInterpolations = 2;
	NumInterpolationsDivider = 0.5f;
}
else
{
	NumInterpolations = 4;//round(speaker->UpdateInterval / speaker->NewtonInterpTimeStep); 
	NumInterpolationsDivider = 0.25f;
}

  agprev = MMSQ_TO_CMSQ(oldframe->ag);
  agstep = (MMSQ_TO_CMSQ(frame->ag) - agprev) * NumInterpolationsDivider;

  acxprev = MMSQ_TO_CMSQ(oldstate->acx);
  acxstep = (MMSQ_TO_CMSQ(state->acx) - acxprev) * NumInterpolationsDivider;

  anprev = MAX(0.0f, MMSQ_TO_CMSQ(oldframe->an));
  anstep = (MAX(0.0f, MMSQ_TO_CMSQ(frame->an)) - anprev) * NumInterpolationsDivider;

  ueprev = oldframe->ue;
  uestep = (frame->ue - ueprev) * NumInterpolationsDivider;
  
  apprev = MMSQ_TO_CMSQ(oldframe->ap);
  apstep = (MMSQ_TO_CMSQ(frame->ap) - apprev) * NumInterpolationsDivider;

  psprev = CMWATER_TO_CGS(oldframe->ps);
  psstep = (CMWATER_TO_CGS(frame->ps) - psprev) * NumInterpolationsDivider;

  state->Cg = speaker->Cgm + speaker->KCg * 0.01f * frame->dc * speaker->Cgm;
  Cgprev = oldstate->Cg;
  Cgstep = (state->Cg - Cgprev) * NumInterpolationsDivider;

  state->Cw = speaker->Cwm + speaker->KCw * 0.01f * frame->dc * speaker->Cwm;
  Cwprev = oldstate->Cw;
  Cwstep = (state->Cw - Cwprev) * NumInterpolationsDivider;


  /*****
    Compute actual update time interval deltaT.  It might not be exactly
    NewtonInterpTimeStep, b/c NumInterpolations must be integer.
  *****/

  deltaTOver2 = 0.5f * speaker->UpdateInterval* NumInterpolationsDivider;

  /*****
    Do some of the computation initially so we do not need to do it
    on every iteration and every convergence.
  *****/
  
  otherArgs.rootTwoOverRho = 41.885390829169f; //(float)DTsqrt(2.0 / RHO);
  otherArgs.Lg = speaker->Lg;
  
  /*****
    Use last frame as initial state
  *****/
  
  Pm = oldstate->Pm;
  Pcw = oldstate->Pcw;
  Uw = oldstate->Uw;
  otherArgs.Cw = oldstate->Cw < 0.0f ?  0.0f : oldstate->Cw; /* make it non-negative */
  
  for(interp=1;interp<=NumInterpolations;++interp){
    
    /* First update the controlling parameters and old state info. */
    otherArgs.ag = agprev + agstep * interp;
    otherArgs.acx = acxprev + acxstep * interp;
    otherArgs.an = anprev + anstep * interp;
    otherArgs.ap = apprev + apstep * interp;
    otherArgs.ap = otherArgs.ap < 0.0f ? 0.0f : otherArgs.ap; /* make it non-negative */
    otherArgs.ue = ueprev + uestep * interp;
    otherArgs.ps = psprev + psstep * interp;
    otherArgs.Cg = Cgprev + Cgstep * interp;
    otherArgs.Cg = otherArgs.Cg < 0.0f ?  0.0f : otherArgs.Cg; /* make it non-negative */
    oldCw = otherArgs.Cw;
    otherArgs.Cw = Cwprev + Cwstep * interp;
    otherArgs.Cw = otherArgs.Cw < 0.0f ?  0.0f : otherArgs.Cw; /* make it non-negative */


    /* For efficiency pre-compute coefficients inside the equation for Pm. */

    RwCwPlusDeltaTOver2 =
      speaker->Rw * otherArgs.Cw + deltaTOver2;
    otherArgs.A = otherArgs.Cw / RwCwPlusDeltaTOver2;
    otherArgs.B =
      (oldCw * Pcw + Uw * deltaTOver2) / RwCwPlusDeltaTOver2;


    /* Next update Pm. */

    MinGuess = 0.0f;
    MaxGuess = 7840.0f;//speaker->Psm*98;

if( state->Pm > 100.0f)
{

    BracketReturn =
      BrentBracket(&PmRootFunction, (void *) &otherArgs,
          &MinGuess, &MaxGuess, BRENT_BRACKET_DEFAULT_FACTOR,
          BRENT_BRACKET_DEFAULT_NTRY);
    if(!BracketReturn){
#ifdef DEBUG
      printf("Unable to bracket root of Pm Root Function\n");
      exit(1);
#endif
    }
}

    Pm = Brent(&PmRootFunction, (void *) &otherArgs,
          MinGuess, MaxGuess, (float)CIRCUIT_TOL, 
          BRENT_DEFAULT_ITMAX, BRENT_DEFAULT_EPS);


    /* Using the new Pm update Uw. */

    Uw = NEXT_Uw(Pm, &otherArgs);


    /* Finally update the Pcw value. */

    Pcw = Pm - speaker->Rw * Uw;
  }
  
  state->Pm = Pm;
  state->Pcw = Pcw;
  
  /*****
    areas are in sq. mm.
  *****/
  state->agx =
    frame->ag
    + CMSQ_TO_MMSQ(state->Pm * (state->Cg < 0.0f ? 0.0f : state->Cg) * speaker->Lg);
  state->agx = (state->agx < 0.0f) ? 0.0f : state->agx; /* While ag can be ag<0, agx must be agx>=0 */
  state->agf = state->agx + (frame->ap < 0.0f ?  0.0f : frame->ap); /* Just in case we get ap < 0 as input. */

  /*****
    Flows are in CGS
  *****/
  state->Ug = (float)(
    FLOW_SQRT(2.0f * (CMWATER_TO_CGS(frame->ps) - state->Pm) / RHO)
    * MMSQ_TO_CMSQ(state->agf)
    );
  
  state->Uacx = (float)(FLOW_SQRT(2.0f * state->Pm / RHO) * MMSQ_TO_CMSQ(state->acx));
  state->Un = (float)(FLOW_SQRT(2.0f * state->Pm / RHO) * MAX(0.0f, MMSQ_TO_CMSQ(frame->an)));
  
  /*****
    Uw does not include the flow through ue just the flow through Rw
  *****/
  state->Uw = state->Ug - state->Uacx - state->Un - frame->ue;
}



static float
PmRootFunction(float Pm, void* pVoidOtherArgs)
{
  PmRootFunctionArgs* pOtherArgs = (PmRootFunctionArgs *) pVoidOtherArgs;
  float agx0, agf, Uw;

  agx0 = pOtherArgs->ag + Pm * pOtherArgs->Cg * pOtherArgs->Lg; /* agx = max(agx0,0) */
  agf = (agx0 < 0.0f ?  0.0f : agx0) + pOtherArgs->ap;
  Uw = (float)(
    -(pOtherArgs->ue) +
    pOtherArgs->rootTwoOverRho *
      (agf * FLOW_SQRT(pOtherArgs->ps - Pm)
        - (pOtherArgs->acx + pOtherArgs->an) * FLOW_SQRT(Pm))
    );
  return Uw - NEXT_Uw(Pm, pOtherArgs);
  }



