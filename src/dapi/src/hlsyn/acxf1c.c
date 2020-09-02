/*****************************************************************************/
/**  HLsyn - Version 2.2                                                    **/
/**                                                                         **/
/** Copyright (c) 1993-1996 by Sensimetrics Corporation                     **/
/** All rights reserved.                                                    **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  acxf1c.c - compute acx,f1c
 *
 *  coded by J. Erik Moore, 12/93
 *
 *  Modification History:
 *
 *    27 Aug 1996   reb:  include flavor.h
 *    08 Aug 1996   reb:  archived as version 2.2 (no changes).
 *    13 SEP 2001   eab: Removed f3 constraint on laterals with Ken's consultation
 *	  14 JUL 2002	cab	  Fixed #ifdef	
 */

#include "flavor.h"

#if defined(DEBUG) || defined(WARNINGS)
#include <stdio.h>	/* for printf in warning routines */
#endif

#include <math.h>	/* for sqrt */
#include "hlsyn.h"


#define UNCOMPUTABLE -1.f


/*****
	Function declarations.
*****/
float HelmholtzFrequency(float ConstrictionArea,float Volume,float Length,
			float ZeroAreaNaturalFrequency);
float R1fromal(HLFrame *frame,HLSpeaker *speaker);
float R1fromab(HLFrame *frame,HLSpeaker *speaker);
float HelmholtzConstriction(float LowestNaturalFrequency,
	float Volume,float Length,float ZeroAreaNaturalFrequency);
float Compute_acl(HLFrame *frame,HLSpeaker *speaker);
float Compute_acd(HLFrame *frame,HLSpeaker *speaker);
void Set_acx_loc(HLFrame *frame,HLState *state);

void Tongue_acx_f1c(HLFrame *frame,HLSpeaker *speaker, HLState *state)

{
  float R1al,R1ab;
#ifdef TONGUE_BODY_AREA
  float temp;
#endif

  if(frame->ab < 30.0f || frame->al < 30.0f || frame->atb <30.0f) 
	// EAB Ken agreed this should only apply when
	//there is a constriction 
	//saves computes too!
  {
	  //eab feb 10,2003 in discussion with KEn don't apply these results to f1 unless 
	  //a constrivtion is present
  /*****
    Compute the area adjusted f1, which is the minimum f1
    of f1,R1al, and R1ab.
  *****/

  R1al = HelmholtzFrequency(MMSQ_TO_CMSQ(frame->al),speaker->Val,
    speaker->Lc_al,speaker->HelmholtzZeroAreaFrequency);

  /*****
    There may be some additional modification here due to
    alveopalatal or dental.  It is discussed in the chapter
    on page 34.
  *****/
  if( frame->ab <= frame->atb)
  R1ab = HelmholtzFrequency(MMSQ_TO_CMSQ(frame->ab),speaker->Vab,
    speaker->Lc_ab,speaker->HelmholtzZeroAreaFrequency);
  else
	R1ab = HelmholtzFrequency(MMSQ_TO_CMSQ(frame->atb),speaker->Vab,
    speaker->Lc_ab,speaker->HelmholtzZeroAreaFrequency);
	//Bug if ab and al are both closed then r1ab==raal
  //and we revert to further back

  
  if(R1al<R1ab && R1al < frame->f1 )
    state->f1c = R1al;

  else if(R1ab <= R1al && R1ab < frame->f1)

    state->f1c = R1ab;

  else

    state->f1c = frame->f1;
  }
  else
  {
	  state->f1c = frame->f1;
  }

  /*****
    Compute the minimum constriction area (acx) and its 
    location (loc) which is the minimum of acl,acd,al and ab.
  *****/

  state->acl = Compute_acl(frame,speaker);
#ifndef TONGUE_BODY_AREA
  state->acd = Compute_acd(frame,speaker);
#else
  temp = Compute_acd(frame,speaker);
  if (temp < frame->atb)
	  state->acd = temp;
  else
	  state->acd = frame->atb;

#endif


  Set_acx_loc(frame,state);
}

float HelmholtzFrequency(float ConstrictionArea,float Volume,float Length,
float ZeroAreaNaturalFrequency)

{
  float temp;

  /*****
    This routine expects CGS units.
      *****/

//  temp=(float)(SPEEDSOUND * SPEEDSOUND * ConstrictionArea /
//    (4. * PI * PI * Volume * Length));
  temp=(float)(1253160000.0f * ConstrictionArea /
    (39.478417604f * Volume * Length));
  return (float)DTsqrt( temp + 
    ZeroAreaNaturalFrequency * ZeroAreaNaturalFrequency);
}

float HelmholtzConstriction(float LowestNaturalFrequency,
float Volume,float Length,float ZeroAreaNaturalFrequency)

{
  float temp;

  /*****
    This routine expects CGS units.
      *****/

  /* RDK Needs a look */
  temp=(float)(Volume * Length * 3.150309426119e-8f);// * 4. * PI*PI / (SPEEDSOUND*SPEEDSOUND));

  return ((LowestNaturalFrequency*LowestNaturalFrequency-
    ZeroAreaNaturalFrequency*ZeroAreaNaturalFrequency)* temp);
}


float Compute_acl(HLFrame *frame,HLSpeaker *speaker)

{

  if( (speaker->f1Min < frame->f1 && frame->f1 < speaker->f1Max) 
	&& (  (frame->f2 < speaker->f2RetroflexMax &&
	       frame->f3 < speaker->f3RetroflexMax )
            ||(frame->f2 < speaker->f2LateralMax &&
	       frame->f3 > speaker->f3LateralMin ) 
	   )
    )
    /*****
      Cannot be negative if all values are positive
    *****/
    return ((frame->f1/speaker->aclFreq)
      *(frame->f1/speaker->aclFreq)*speaker->Kacl);

  else
    return UNCOMPUTABLE;
}

float Compute_acd(HLFrame *frame,HLSpeaker *speaker)

{
  float acd,temp;

  /*****
    This routine will generate figure 2.10 and comments from
    Ken Stevens.  It does not exactly match the text in the 
    December 93 version of the chapter.

    Units in this routine are mixed.  The Helmholtz routine
    uses CGS.  The higer frequency portion gives mm^2 using
    the constants given in the chapter.
  *****/
#ifndef TONGUE_BODY_AREA_stillvalid_ 
  if(frame->f1 < speaker->acd_f1Break){
    acd = HelmholtzConstriction(frame->f1,speaker->Vacd,
      speaker->Lc_acd,speaker->HelmholtzZeroAreaFrequency);
    acd = CMSQ_TO_MMSQ(acd); /* Convert to mm^2 */
  }
   else
   {
    temp = (speaker->f1HiShift - frame->f1)
      /speaker->HelmholtzZeroAreaFrequency;
    acd = speaker->KHi * temp * temp - speaker->KHi;
  }

 
#else 
  {
    temp = ((speaker->f1HiShift) - frame->f1)
      /speaker->HelmholtzZeroAreaFrequency;
    acd = speaker->KHi * temp * temp - speaker->KHi;
  }
#endif
  if(acd > speaker->acdMax){
#ifdef WARNINGS
      printf("acd was %f, set to acdMax\n",acd);
#endif
      return speaker->acdMax;
  }

  else if(acd < 0.0){
#ifdef WARNINGS
      printf("acd was %f, set to 0\n",acd);
#endif
      return 0.f;
  }

  else
    return acd;
}

void Set_acx_loc(HLFrame *frame,HLState *state)

{
  float LiquidDorsumArea,LipsBladeArea;
  short LiquidDorsumPlace,LipsBladePlace;

  /*****
    In this routine the location of the smallest area and the size of the
    smallest area are set.  If two areas are equal then the one that is
    furthest back from the lips is used.
  *****/

  /*****
    Sort through the Liquid and Dorsum areas first.
  *****/

  if(state->acl==UNCOMPUTABLE){
    LiquidDorsumArea = state->acd;
    LiquidDorsumPlace = DORSUM;
  }

  else if(state->acd<=state->acl){
    LiquidDorsumArea = state->acd;
    LiquidDorsumPlace = DORSUM;
  }

  else{
    LiquidDorsumArea = state->acl;
    LiquidDorsumPlace = LIQUID;
  }


  /*****
    Sort through the lips and blade next.
  *****/
  
  
	  
  if(frame->ab<=frame->al){
    LipsBladeArea=frame->ab;
    LipsBladePlace=BLADE;
  }

  else{
    LipsBladeArea=frame->al;
    LipsBladePlace=LIPS;
  }
  

  /*****
    Finally, set the loc and acx.
    acx will be positive.
  *****/

  if(LiquidDorsumArea<=LipsBladeArea){
    state->acx=LiquidDorsumArea;
    state->loc=LiquidDorsumPlace;
  }

  else{
    state->acx=LipsBladeArea;
    state->loc=LipsBladePlace;
  }		
}
