/*****************************************************************************/
/**  HLsyn - Version 2.2                                                    **/
/**                                                                         **/
/** Copyright (c) 1993-1998 by Sensimetrics Corporation                     **/
/** All rights reserved.                                                    **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  nasalf1x.c - compute FNP,FNZ and nasal effected f1 (f1c->f1x)
 *
 *  coded by J. Erik Moore, 12/93
 *
 *  Modification History:
 *
 *    25 Mar 1998   reb:  passed f1c to FiniteBracketFNP and used it as a 
 *                        lower bound on the location of the root (fixes a 
 *                        bug that arose if f1c >> fn); made FINITE_OFFSET 
 *                        a float constant; in NasalPole renamed Brac_fn and 
 *                        Brac_fp to Brac_low and Brac_high, if bracketing 
 *                        fails returned a rough guess for FNP, and solve for 
 *                        FNP directly if K2 is sufficiently small; in 
 *                        NasalFirstFormant extrapolated a and b values before 
 *                        the first entries in the ana and anb tables (fixes 
 *                        problems when an is zero or just slightly above); 
 *                        replaced an by MAX(0, an) where appropriate.
 *     6 Oct 1997   reb:  replaced REMOVE_NASAL_POLE_ZERO by speaker->fno 
 *                        and REMOVE_BANDWIDTH by speaker->NasalBandwidth;
 *                        replaced hard-coded constants in computation of 
 *                        fm, b1x. BNP by references to speaker constants; 
 *                        changed arguments of NasalPole, NasalFirstFormant, 
 *                        NasalZero (to enable swapping f1x and FNP if desired);
 *                        used general-purpose Brent routine instead of
 *                        FNP_zbrent (needed to swap arguments of 
 *                        SusceptanceSum to do this); made local routines 
 *                        static, moved definition of FNPVars here from hlsyn.h, 
 *                        introduced AN_NO_NASAL_BREAKPOINT.
 *    21 Aug 1996   reb:  in calculation of FNPvars.fp (NasalPole), replaced 
 *                        some hard-coded constants by references to 
 *                        speaker->fp_f2BreakPoint; used 
 *                        REMOVE_NASAL_POLE_ZERO to set FNZ, FNP when 
 *                        an = 0; included flavor.h
 *    08 Aug 1996   reb:  archived as version 2.2 (no changes).
 *	  09 Oct 2002	mfg:  ifdef out Process.h not supported under WinCE
 */

#include "flavor.h"

#if (defined(DEBUG) && !defined(UNDER_CE)) || (defined(WARNINGS) && !defined(UNDER_CE)) 

#include <stdio.h>	/* for printf on error */
#include <stdlib.h>	/* for exit on error */
#include <process.h>	/* for exit on error */
#endif

#include <math.h>	/* for sqrt */
#include "hlsyn.h"


#define FINITE_OFFSET 0.1f
#define MAX_FINITE_ITERATIONS 50
#define FINITE_BRACKETED 1
#define NOT_FINITE_BRACKETED 0


/* For Brent */
#define ITMAX 100	/* Max allowed iterations */
#define EPS 3.0e-8f	/* Machine floating point precision */
#define FNP_TOL	1.0e-5f	/* Root tolerance (From Dave Williams code) */

/* Define a structure for the useful values in NasalPole */
typedef struct FNPVarsTag{
  float K1;
  float K2;
  float fn;
  float fp;
  float f1c;
} FNPVars;

/*****
	Local module function declarations
*****/

static void NasalZero(HLFrame *frame,HLSpeaker *speaker,HLState *state,
		float *pFNZ, float *pBNZ);
static float Compute_fm(HLFrame *frame,HLSpeaker *speaker);
static float InterpolateTable(TableRow TheTable[],short TableLength,
			float Column1Point);
static float LinearInterpolate(float x,float x1,float y1,float x2,float y2);
static void NasalFirstFormant(HLFrame *frame,HLSpeaker *speaker,HLState *state, 
                       float *pf1x, float *pb1x);
static void NasalPole(HLFrame *frame,HLSpeaker *speaker,HLState *state,
		float *pFNP, float *pBNP);
static BrentFunctionType SusceptanceSum;
static int FiniteBracketFNP(FNPVars* FNPvars,float f1c,float *Brac_low,float *Brac_high);



void
SetNasals_f1x(HLFrame *frame,HLSpeaker *speaker,HLState *state,
  LLFrame *llframe)

{
  if(frame->an <= AN_NO_NASAL_BREAKPOINT){
    /*****
      Nasal cavity does not connect to oral cavity.
      f1 is not modified by the nasals.  There is
      no nasal pole or zero.  This is done by setting
      them equal to one another and some arbitrary
      value so they cancel out.
    *****/

    state->f1x = state->f1c;
    state->b1x = speaker->B1m;
    llframe->NFNZ = llframe->NFNP = (short) (speaker->fno + 0.5f);
    llframe->NBNZ = llframe->NBNP = (short) (NasalBandwidth + 0.5f);
  }
  else {
    float FNZ, BNZ, FNP, BNP;

    NasalFirstFormant(frame,speaker,state,&state->f1x,&state->b1x);
    NasalZero(frame,speaker,state,&FNZ,&BNZ);
    NasalPole(frame,speaker,state,&FNP,&BNP);
    llframe->NFNZ = (short) (FNZ );
    llframe->NBNZ = (short) (BNZ );
    llframe->NFNP = (short) (FNP );
    llframe->NBNP = (short) (BNP );
  }
}

static void
NasalZero(HLFrame *frame,HLSpeaker *speaker,HLState *state,
               float *pFNZ, float *pBNZ)

{
  float fn,fm,LOverA,MmOverMn,an = MAX(0.0f, frame->an);

  /*****
    The an to fn table is based on an assumed fno.  If fno
    is different then the result is scaled.
  *****/

  fn = InterpolateTable(anfnTable,MAXANFN,an) *
    (speaker->fno / anfnTable_fno);

  fm = Compute_fm(frame,speaker);

  /*****
    We must use the constriction modified f1 (f1c) to
    compute any nasal interactions.
  *****/

  LOverA = InterpolateTable(f1LOverATable,MAXF1LOVERA,
    state->f1c);

  MmOverMn = (float)(LOverA * an / (3.7f * an + 100.f));

  *pFNZ = fn * (float) DTsqrt((1.f + MmOverMn) 
                            / (1.f + MmOverMn * fn * fn /(fm * fm)) );

#ifdef DEBUG
  if(!( (fn > *pFNZ && fm < *pFNZ) 
    || (fn < *pFNZ && fm > *pFNZ))){

    printf("FNZ must be between fn and fm in NasalZero.");
    exit(1);
  }

  if(fn >= fm){
    printf("fn should be less than fm.");
    exit(1);
  }
#endif
  /*****
    Compute the bandwidth of the nasal zero.
    From nasals.c, by Dave Williams
    Should this be f1c or f1x or f1?  Dave was using f1c times the
    alveolar scale (M/F) factor.
    Ken and Corine thought that this was correct.
  *****/

  if(state->f1c < speaker->BNZ_f1BreakPoint)
    *pBNZ = NasalBandwidth;

  else
    *pBNZ = NasalBandwidth + 100.0f * MmOverMn;

}

static float
Compute_fm(HLFrame *frame,HLSpeaker *speaker)

{
  float fm,r;


  /*****
    Must use f1 here because these effects are irrespective
    of the closure acx.
  *****/

  if(frame->f1 >= speaker->fm_f1BreakPoint)
    fm = (float)(0.8f * frame->f2 + 0.2f * frame->f3);

  else{
    r = (float)(1.0f + 0.0143f * (frame->f1 - speaker->fm_f1BreakPoint));
    fm = (float)(r * (0.8f * frame->f2 + 0.2f * frame->f3) 
      + (1.-r) * 3000.);
  }

  return fm;

}

static float
InterpolateTable(TableRow TheTable[],short TableLength,
  float Column1Point)

{
  float Column2Point=0.0f;
  short i,Column2Set=NO;

  /*****
    It is assumed that Column1 is always increasing in its
    values.
  *****/


  /*****
    If any value is off the table then its values are set
    to be either the minimum of maximum on the table.
  *****/

  if(TheTable[0].Column1 >= Column1Point){
    Column2Set=YES;
    Column2Point = TheTable[0].Column2;
  }

  else if(TheTable[TableLength-1].Column1 <= Column1Point){
    Column2Set=YES;
    Column2Point = TheTable[TableLength-1].Column2;
  }

  else for(i=0;i<TableLength-1;++i)
    if(Column1Point >= TheTable[i].Column1
      && Column1Point < TheTable[i+1].Column1){
      Column2Point= LinearInterpolate(Column1Point,TheTable[i].Column1,
	TheTable[i].Column2,TheTable[i+1].Column1,TheTable[i+1].Column2);
      Column2Set = YES;
      break;
    }

  if(Column2Set==NO){
#ifdef DEBUG
    printf(" InterpolateTable finished without a value.");
    exit(1);
#endif
  }

  return Column2Point;
}

static float
LinearInterpolate(float x,float x1,float y1,float x2,float y2)

{
  float Slope,yIntercept;

#ifdef DEBUG
  if( (x2-x1) == 0.0f ){
    printf(" Cannot linear interpolate equal x values.");
    exit(1);
  }
#endif

  Slope = (y2-y1)/(x2-x1);
  yIntercept = y1 - Slope * x1;

  return (Slope * x + yIntercept);
}

static void
NasalFirstFormant(HLFrame *frame,HLSpeaker *speaker,HLState *state,
                       float *pf1x, float *pb1x)

{
  float Qf1c,Qfno,a,b,c,temp,an = MAX(0.0f, frame->an);

  /*****
    First, compute the bandwidth of the first formant b1x
    This was adapted from nasals.c in the Dave Williams
    version of the code.
  *****/

  temp = speaker->B1m + MMSQ_TO_CMSQ(an) 
    * NasalBandwidth;

  if(state->f1c <= speaker->fno)
    *pb1x = temp;

  else{
    if(an <= speaker->BNP_B1_anLow)
      *pb1x = NasalBandwidth;

    else if(an >= speaker->BNP_B1_anHigh)
      *pb1x = temp;

    else
      *pb1x = LinearInterpolate(an,
                speaker->BNP_B1_anLow,NasalBandwidth,
                speaker->BNP_B1_anHigh,temp);
  }


  /*****
    For the case of f1x which is arbitrarily the smaller
    solution to the sum of the susceptances B's, it is
    acceptable to approximate the Bn and the (Bp + Bm) as
    straight lines.  The slopes are determined from the
    tables.
  *****/

  c = InterpolateTable(speaker->f1cTable,MAXF1C,state->f1c);

  if( state->f1c >= speaker->fno )
    {
    a = InterpolateTable(speaker->anaTable,MAXANA,an);
    if( an < speaker->anaTable[0].Column1 )
      { /* interpolate from the first tabulated value of a to 
           a = +infinity at an = 0, using a hyperbola a = const/an */
      Qf1c = an * c;
      Qfno = speaker->anaTable[0].Column1 * a;
      }
    else
      {
      Qf1c = c;
      Qfno = a;
      }
    }
  else
    {
    b = InterpolateTable(speaker->anbTable,MAXANB,an);
    if( an < speaker->anbTable[0].Column1 )
      { /* linearly interpolate from the first tabulated value 
           of b to b = 0 at an = 0 */
      Qf1c = speaker->anbTable[0].Column1 * c;
      Qfno = an * b;
      }
    else
      {
      Qf1c = c;
      Qfno = b;
      }
    }

  if( fabs(Qf1c + Qfno) < FLOAT_EPS )
    {
    *pf1x = (state->f1c + speaker->fno) / 2.0f; /* a guess */
#ifdef DEBUG
    printf("Zero division in NasalFirstFormant.\n");
    exit(1);
#endif
    }
  else
    *pf1x = (Qf1c * state->f1c + Qfno * speaker->fno) / (Qf1c + Qfno);

  return;
}

static void
NasalPole(HLFrame *frame,HLSpeaker *speaker,HLState *state,
               float *pFNP, float *pBNP)

{
  FNPVars FNPvars;
  float Brac_low,Brac_high,temp,an = MAX(0.0f, frame->an);

  /*****
    First, compute the bandwidth of the nasal pole
    This was adapted from nasals.c in the Dave Williams
    version of the code.
  *****/

  temp = speaker->B1m + MMSQ_TO_CMSQ(an) 
    * NasalBandwidth;

  if(state->f1c <= speaker->fno){

    if(an <= speaker->BNP_B1_anLow)
      *pBNP = NasalBandwidth;

    else if(an >= speaker->BNP_B1_anHigh)
      *pBNP = temp;

    else
      *pBNP = LinearInterpolate(an,
                speaker->BNP_B1_anLow,NasalBandwidth,
                speaker->BNP_B1_anHigh,temp);
  }
  else
    *pBNP = temp;


  /*****
    Compute the frequency of the nasal pole.
  *****/

  FNPvars.fn = InterpolateTable(anfnTable,MAXANFN,an) 
    * (speaker->fno / anfnTable_fno);

  if(frame->f2 >= speaker->fp_f2BreakPoint)
    FNPvars.fp = (float)
	    (0.00036f * state->f1c * (frame->f2 - speaker->fp_f2BreakPoint) 
         + (speaker->fp_f2BreakPoint - 100.f));
  else
    FNPvars.fp = (float)(frame->f2 - 100.f);

#ifdef DEBUG
  if(FNPvars.fp==FNPvars.fn){
    printf("fp must not equal fn in NasalPole.");
    exit(1);
  }
#endif

  if(FNPvars.fp <= FNPvars.fn)
    *pFNP = 0.5f * (FNPvars.fp + FNPvars.fn);

  else{
    /*****
      Must search for an FNP which
      sets the susceptances Bm + Bp + Bn = 0
    *****/

    FNPvars.K1 = (float)(speaker->PharangealArea / (RHO * SPEEDSOUND));
    FNPvars.K2 = InterpolateTable(speaker->anK2Table,MAXANK2,an);
    FNPvars.f1c = state->f1c;

    if( SusceptanceSum((1.0f + 2.5f * FLT_EPSILON) * FNPvars.fn, (void*)&FNPvars) >= 0.0f )
      /* K2 is (essentially) zero; the Bn hyperbola degenerates to an L */
      *pFNP = MAX(state->f1c, FNPvars.fn);

    else if(FiniteBracketFNP(&FNPvars,state->f1c,&Brac_low,&Brac_high)==FINITE_BRACKETED)
      *pFNP = Brent(&SusceptanceSum,(void*)&FNPvars,Brac_low,Brac_high,
                (float)FNP_TOL,ITMAX,(float)EPS);
    else{
      *pFNP = 0.5f * (FNPvars.fp + FNPvars.fn); /* rough guess */
#ifdef DEBUG
      printf("Unable to bracket nasal pole");
      exit(1);
#endif
    }
  }
}

static float
SusceptanceSum(float FNPGuess,void *FNPvars0)

{
  float Bn,BpPlusBm;
  FNPVars* FNPvars = (FNPVars *) FNPvars0;

  Bn = -FNPvars->K2 / (FNPGuess - FNPvars->fn);

  BpPlusBm = (float)(FNPvars->K1 * tan (PI/2. * 
    (FNPGuess - FNPvars->f1c)/(FNPvars->fp - FNPvars->f1c)));

  return Bn + BpPlusBm;
}

static int
FiniteBracketFNP(FNPVars* FNPvars,float f1c,float *Brac_low,float *Brac_high)

/*****
This routine brackets the root of the susceptance function 
(SusceptanceSum).  This root is the Nasal Pole.  
The routine uses fp and fn (fn<fp).  The susceptance
function is assumed to evaluate to +infinity as one aproaches fp
from fn.  The susceptance function is assumed to be -infinity
as one approaches fn from fp.  It is assumed that the susceptance 
function is monotone increasing fn and fp, and that the root is 
greater than or equal to f1c.  This routine returns a number 
(*Brac_low) between the root and fn which evaluates to a finite 
negative number and and another number (*Brac_high) between 
the root and fp which evaluates to a positive number.  The 
routine also returns FINITE_BRACKETED if it was successful and 
NOT_FINITE_BRACKETED if not.
*****/

{
  float min_f, max_f;
  short i;


#ifdef DEBUG
  if(FNPvars->fn>=FNPvars->fp){
    printf("fn must be less than fp in FiniteBracketFNP");
    exit(1);
  }
#endif
  
  /* Root is known to lie above fn and f1c, and below fp, 
     and one must avoid the singularities at fn and fp.  */
  
  if( FNPvars->fn >= f1c )
    {
    *Brac_low = (float)(
      FNPvars->fn + FINITE_OFFSET	* (FNPvars->fp - FNPvars->fn)
      );
    min_f = FNPvars->fn;
    }
  else
    min_f = *Brac_low = f1c;

  *Brac_high = (float)(
    FNPvars->fn + (1.0f-FINITE_OFFSET) * (FNPvars->fp - FNPvars->fn)
    );

  max_f = FNPvars->fp;
  

  /* Decrease lower endpoint 'till the function is negative there. */

  for( i = 0; i < MAX_FINITE_ITERATIONS; i++ )
    if( SusceptanceSum(*Brac_low,(void*)FNPvars) <= 0.0f )
      break;
    else
      *Brac_low -= (float)((1.0f-FINITE_OFFSET) * (*Brac_low - min_f));

  if( i == MAX_FINITE_ITERATIONS )
    return NOT_FINITE_BRACKETED;
  

  /* Increase upper endpoint 'till the function is positive there. */

  for( i = 0; i < MAX_FINITE_ITERATIONS; i++ )
    if( SusceptanceSum(*Brac_high,(void*)FNPvars) >= 0.0f )
      break;
    else
      *Brac_high += (float)((1.0f-FINITE_OFFSET) * (max_f - *Brac_high));

  if( i == MAX_FINITE_ITERATIONS )
    return NOT_FINITE_BRACKETED;

  return FINITE_BRACKETED;
}
