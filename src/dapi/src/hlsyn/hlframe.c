/*****************************************************************************/
/**  HLsyn - Version 2.2                                                    **/
/**                                                                         **/
/** Copyright (c) 1993-1998 by Sensimetrics Corporation                     **/
/** All rights reserved.                                                    **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  hlframe.c - map one frame of HL parameters to LL parameters
 *
 *  coded by J. Erik Moore, 12/93
 *
 *  Modification History:
 *
 *   9 Dec 1998  reb:  adjust f0 to get F0 only if f0 > 0 (otherwise let 
 *                     F0 = 0) and do not let adjustments make F0 < 0; 
 *                     adjust f1c rather than F1 for tracheal coupling, and 
 *                     do so only when agf (not agx) exceeds agm; similarly, 
 *                     adjust B3, B4, B5 for tracheal coupling only when 
 *                     agf (rather than agx) exceeds agm.
 *   6 Oct 1997  reb:  calculate adjustments to F1, B3, B4, B5 using agf 
 *                     rather than agx; fixed comment describing adjustment 
 *                     of spectral tilt for ap, made local routines static, 
 *                     do not set AV, AF or AH to zero just because ag (or 
 *                     ag + ap) is zero.
 *   2 Jun 1997  reb:  allow AF, AH (but not AV) nonzero when ag <= 0 but 
 *                     ap > 0; fixed bug in adjustment of TL for ap (convert 
 *                     ap to cgs units).
 *  30 Apr 1997  reb:  changed amount of adjustment of F0 for transglottal 
 *                     pressure (do not divide by the default subglottal 
 *                     pressure); changed sign of adjustment of F0 for 
 *                     compliance/stiffness; corrected amount of adjustment 
 *                     of TL for ap to have correct behavior as ap --> 0 by 
 *                     including a term for viscous resistance; calculate B1 
 *                     and B2 using transglottal pressure instead of ps; set 
 *                     AV to zero if ps < Pm; used absolute value of trans-
 *                     glottal pressure to calculate AH (to avoid logs of 
 *                     negatives); used HLSYNAPI instead of FLAV_STDCALL; 
 *                     introduced FLOAT_EPS and used it to keep from taking log 0.
 *  13 Nov 1996  reb:  moved ps from HLSpeaker to HLFrame, changed instances 
 *                     of Ps to ps to reflect this; set AV = 0 when 
 *                     transglottal pressure is below AVPressureThreshold 
 *                     minus KdPTdc times dc; put decl of Tongue_acx_f1c under 
 *                     control of FLAV_NO_ACXF1C; call MapGlottalFormantsNotF1 
 *                     after Speech Circuit and include adjustments in F0 for 
 *                     vowel height, transglottal pressure, and stiffness; in 
 *                     SourceAmplitudes calculate AH based on agf rather than 
 *                     agx; in SourceSpecifics add a correction term to TL based 
 *                     on ap and ps; in GlottalInteraction use new formula for 
 *                     B1 and B2 based on agf and ps.  
 *  09 Sep 1996  reb:  bug fix in new calculation of AV from agx
 *                     (removed a discontinuity in the graph).
 *  27 Aug 1996  reb:  new calculation of AV from agm (added 
 *                     AVPressureThreshold, KdAV0, KdAV1);
 *                     if ag >= agHiKLSourceCutoff then AV = AH = AF = 0; 
 *                     included flavor.h, checked FLAV_STDCALL in def'n 
 *                     of HLSynthesizeLLFrame, checked FLAV_NO_ACXF1C.
 *  08 Aug 1996  reb:  archived as version 2.2 (no changes).
 *  27 Mar 1995  Win32 MSVC version; B6 = 1000 (epc)
 *  20 Sep 1995  if (ag <= 0.), then AV = AH = AF = 0;
 *               if (AV == 0), then F0 = 0 (epc)
 *
 *	21 Oct 2002	mfg:ifdef out Process.h not supported under WinCE
 */

#include "flavor.h"

#if (defined(DEBUG) && !defined(UNDER_CE)) || (defined(WARNINGS) && !defined(UNDER_CE)) 
#include <stdio.h>	/* for printf on error */
#include <stdlib.h>	/* for exit on error */
#include <process.h>	/* for exit on error */
#endif

#include <math.h>	/* for log10 */
#include "hlsyn.h"
#ifndef FAKE_HLSYN_notyet
#ifdef EPSON_ARM7
const TableRow	f1LOverATable[MAXF1LOVERA]={
{  180.f	/* Hz */,1000.f		/* 1/cm */},
{  200.f	/* Hz */,25.f		/* 1/cm */},
{  250.f	/* Hz */,20.f		/* 1/cm */},
{  300.f	/* Hz */,10.f		/* 1/cm */},
{  350.f	/* Hz */,7.f		/* 1/cm */},
{  400.f	/* Hz */,5.f		/* 1/cm */},
{  450.f	/* Hz */,4.f		/* 1/cm */},
{  500.f	/* Hz */,3.f		/* 1/cm */},
{  600.f	/* Hz */,2.5f		/* 1/cm */},
{  700.f	/* Hz */,2.f		/* 1/cm */},
{  800.f	/* Hz */,1.8f		/* 1/cm */}
};

const float anfnTable_fno = 500.f;		/* Hz */
const TableRow	anfnTable[MAXANFN]={
	{   0.f	/* sq mm */,500.f	/* Hz */},
	{  10.f	/* sq mm */,580.f	/* Hz */},
	{  20.f	/* sq mm */,660.f	/* Hz */},
	{  30.f	/* sq mm */,730.f	/* Hz */},
	{  40.f	/* sq mm */,780.f	/* Hz */},
	{  50.f	/* sq mm */,810.f	/* Hz */},
	{  60.f	/* sq mm */,840.f	/* Hz */},
	{  70.f	/* sq mm */,870.f	/* Hz */},
	{  80.f	/* sq mm */,900.f	/* Hz */}};
#else
TableRow	f1LOverATable[MAXF1LOVERA];
float anfnTable_fno;
TableRow	anfnTable[MAXANFN];
#endif
#endif //fake_hlsyn
/*****
    External function declarations
*****/
#ifndef FLAV_NO_ACXF1C
void Tongue_acx_f1c(HLFrame *frame,HLSpeaker *speaker,HLState *state);
#endif
void SpeechCircuit(HLFrame *frame,HLFrame *oldframe,HLSpeaker *speaker,
		   HLState *state,HLState *oldstate);
void SetNasals_f1x(HLFrame *frame,HLSpeaker *speaker,HLState *state,
    LLFrame *llframe);

/*****
    Module function declarations
*****/

static void MapGlottalFormantsNotF1(HLFrame *frame,HLSpeaker *speaker,
    HLState *state,LLFrame *llframe);
static void FricativeFilters(HLFrame *frame,HLSpeaker *speaker,HLState *state,
    LLFrame *llframe);
static void SourceAmplitudes(HLFrame *frame,HLSpeaker *speaker,HLState *state,
		      HLState *oldstate,LLFrame *llframe);
static float InterpolateAF(HLSpeaker *speaker,HLState *state,HLState *oldstate);
static void GlottalInteraction(HLFrame *frame,HLSpeaker *speaker,HLState *state,
    LLFrame *llframe);
static void SourceSpecifics(HLFrame *frame,HLSpeaker *speaker,HLState *state,
    LLFrame *llframe);
static void UnusedLLParameters(LLFrame *llframe);

void HLSYNAPI
HLSynthesizeLLFrame(HLFrame *frame, HLFrame *oldframe, HLSpeaker *speaker,
					       HLState *state, HLState *oldstate, LLFrame *llframe)

{
/* removed spaces before #'s */
#ifdef FLAV_NO_ACXF1C
  state->f1c = frame->f1;
#else
  /* acxf1c.c */
  Tongue_acx_f1c(frame,speaker,state);
#endif
#ifndef  FAKE_HLSYN 
  /* circuit.c */
  SpeechCircuit(frame,oldframe,speaker,state,oldstate);

  /* hlframe.c */
  MapGlottalFormantsNotF1(frame,speaker,state,llframe);

  /* nasalf1x.c */
  SetNasals_f1x(frame,speaker,state,llframe);
#endif
  /* hlframe.c */
#ifndef FAKE_HLSYN
  SourceAmplitudes(frame,speaker,state,oldstate,llframe);
#else
  //FAKE_HLSYN
#endif
  /* hlframe.c, depends on value of AF */
  FricativeFilters(frame,speaker,state,llframe);
#ifndef FAKE_HLSYN
  /* hlframe.c */
  GlottalInteraction(frame,speaker,state,llframe);

  /* hlframe.c */
  SourceSpecifics(frame,speaker,state,llframe);

  /* hlframe.c */
  UnusedLLParameters(llframe);
#endif
}

static void
MapGlottalFormantsNotF1(HLFrame *frame,HLSpeaker *speaker,
    HLState *state,LLFrame *llframe)

{
  if( frame->f0 > 0.0f ) {
    llframe->NF0 = (short)(
      frame->f0 + 0.5f /* round, not truncate */
#ifdef in_phdraw //help help help the 
      /* Correction term for vowel height */ 
      + (frame->f1 <= speaker->f0_vowelshift_f1_break ?
          speaker->Kf1 * frame->f0 * (speaker->f1_neutral - speaker->f0_vowelshift_f1_break) : 
          (frame->f1 < speaker->f1_neutral ?
            speaker->Kf1 * frame->f0 * (speaker->f1_neutral - frame->f1) : 
            0.0f))

      /* Correction term for transglottal pressure */
      + speaker->Kpd * (frame->ps - CGS_TO_CMWATER(state->Pm) - speaker->Psm)

      /* Correction term for glottal stiffness */
      - speaker->Kdf0dc * frame->dc

#endif
      );

    if( llframe->NF0 < 0 ) /* don't let it go negative! */
      llframe->NF0 = 0;
  }
  else
    llframe->NF0 = 0;

  /* Adjust f1c for tracheal coupling */
  //if f1 high area is decreased causing glottal spread and adjustment of f1
  //at high f1 it hasn't been analysed and also with breathiness (chink) people porbably compromise 
  //so do it only for lower f1's
  if(frame->an < 3.0f && state->f1c < 185.0f)
  if( state->agf > speaker->agm && state->f1c < speaker->F1T )
    state->f1c += speaker->KdF * (1.0f - state->f1c/speaker->F1T) * (state->agf - speaker->agm);

  llframe->NF2 = (short)frame->f2;
  llframe->NF3 = (short)frame->f3;
  llframe->NF4 = (short)frame->f4;
  llframe->NF5 = (short)speaker->F5;

}

static void
FricativeFilters(HLFrame *frame,HLSpeaker *speaker,HLState *state,
    LLFrame *llframe)

{
  /*****
    Zero all of the gains initially
  *****/

  llframe->NA2F = 0;
  llframe->NA3F = 0;
  llframe->NA4F = 0;
  llframe->NA5F = 0;
  llframe->NA6F = 0;
  llframe->NAB = 0;

  /****
    First, set the gains of the parallel fricative filter
  ****/
#ifndef FAKE_HLSYN
  if(llframe->NAF > speaker->AFThreshold)
#endif
  {
    switch (state->loc){
      case LIPS: /* Labial */
        llframe->NAB = (short)speaker->LabialAB;
        break;

      case BLADE: /* Alveolar */

	/*****
	  It seems that one may want to specify f2,f3 out of the
	  region defined in the f2,f3 plane.  In the instance that
	  this occurs, this routine sets the gains to zero.
	*****/

#ifdef INVTMIONT
	if(   frame->f2>ALV_F2_MAX || frame->f3>ALV_F3_MAX
	  || frame->f2<ALV_F2_MIN || frame->f3<ALV_F3_MIN){
	  llframe->A2f = 0;
	  llframe->A3f = 0;
	  llframe->A4f = 0;
	  llframe->A5f = 0;
	  llframe->Ab = 0;
	}

	else{
	  llframe->A2f = (short)ALVEOLAR(frame->f2,frame->f3).A2F;
	  llframe->A3f = (short)ALVEOLAR(frame->f2,frame->f3).A3F;
	  llframe->A4f = (short)ALVEOLAR(frame->f2,frame->f3).A4F;
	  llframe->A5f = (short)ALVEOLAR(frame->f2,frame->f3).A5F;
	  llframe->Ab = (short)ALVEOLAR(frame->f2,frame->f3).AB;
	}
#endif
        break;

      case DORSUM: /* Pal/Velar */

		  
		  {
			  		  if(frame->place == 40)
			  {
				  if(frame->f2 > (speaker->PalVelar_f2Offset 
					  + speaker->PalVelar_f2Overf3_Slope * frame->f3))
				  {
					  llframe->NA3F = (short)speaker->PalVelarA3F;
				  }
				  else
				  {
					  llframe->NA2F = 45;
					  llframe->NA3F = 0;
					  llframe->NA5F = 45; 
				  }
				  break;
			  }
		  else if(frame->place == 42)
		  {
				llframe->NA2F = 45;
				llframe->NA3F = 0;
				llframe->NA5F = 40; 
				break;

		  }

		  else if(frame->place == 45)
			  {
				  llframe->NA2F = 0;
				  llframe->NA3F = 45;
				  llframe->NA5F = 50;
				  break;
			  }
		  else if(frame->place == 80)
			  {			  
				  llframe->NA2F = 50;
				  llframe->NA3F =  0;
				  llframe->NA4F = 30;
				  llframe->NA5F =  30;	  
				  break;
				  
			  }
			  
		
				else
				{
#ifdef DEBUG
		   if(frame->f2 > (speaker->PalVelar_f2Offset 
					  + speaker->PalVelar_f2Overf3_Slope * frame->f3))
				  {
					  llframe->NA3F = (short)speaker->PalVelarA3F;
				  }
				  else
				  {
					  llframe->NA2F = speaker->PalVelarA2F;
					  llframe->NA3F = 0;
					  llframe->NA5F = speaker->PalVelarA5F; 
				  }
				  break;  
		  
			  //printf(" Oh shucks, I need a diaper change. \n");
#endif			  
		  
		  
		  }
		  }
		  
      case LIQUID: /* Lateral/Retroflex */
	if(frame->f3<speaker->f3RetroflexMax)
	  /* Retroflex */
	  llframe->NA3F = (short)speaker->RetroflexA3F;
	else
	  /* Must be lateral */
	  llframe->NA3F = (short)speaker->LateralA3F;
        break;
      
#ifdef DEBUG
      default:
        printf(" Should not reach default (FricativeGains)");
        exit(1);
        break;
#endif
    }
    
    /*****
      The sixth formant is a loose end.  It is not used by the HLSyn code
      but is by the LLsyn code.  The gain is set to the Klatt default value.
	  It's actually was used as not a sixth formant but a broad band high
	  frequency energy add. The frequency wa set to nyquist-500 and the bandwidth
	  to 1200. It was also used in conjunction with AB to subtract a littl high freuency
	  energy based on the fact that the parallel tract adds with alternate sign.
    *****/
    
    llframe->NA6F = (short)speaker->A6f;

  }

  /*****
    The 6th formant is a loose end.  It is not used especially
    by HLSYN but is by LLSYN and cannot
    really be removed so is set to Klatt defaults.
  *****/

  llframe->NF6 = (short)speaker->F6;

  /*****
    Then set the bandwidths of the fricative filter to default values.  
    OR do we set them to the values of the regular bandwidths.
  *****/

  llframe->NB2F = (short)speaker->B2F;
  llframe->NB3F = (short)speaker->B3F;
  llframe->NB4F = (short)speaker->B4F;
  llframe->NB5F = (short)speaker->B5F;
  llframe->NB6F = (short)speaker->B6F;
  llframe->NDB1 = (short)state->Pm; //this is to eventual bring in pressure rules

}

static void
SourceAmplitudes(HLFrame *frame,HLSpeaker *speaker,HLState *state,
		      HLState *oldstate,LLFrame *llframe)

{
  /*****
    The pressures in this routine need to be in CM H20.
    Pm is stored in dynes/cm^2 and ps is stored in CM H20.
    The areas used in this routine must be in cm^2.  Recall that
    all of the areas are stored in mm^2.
  *****/

  if (frame->ag >= speaker->agHiKLSourceCutoff)
  	llframe->NAF = 0;
  else
  	llframe->NAF = (short)InterpolateAF(speaker,state,oldstate);

  /*****
    Compute AV dependent on the actual size of the glottal opening (agx).  
    NOTE: 20. log10( (ps-Pm) ^ (3/2)) is equivalent to: 30. log10( ps-Pm )
  *****/

  if( state->agx < speaker->agMin 
   || state->agx > speaker->agAVModalOffsetMax + speaker->agm 
   || frame->ag >= speaker->agHiKLSourceCutoff
   || frame->ps - CGS_TO_CMWATER(state->Pm) < FLOAT_EPS
   || frame->ps - CGS_TO_CMWATER(state->Pm) < 
        speaker->AVPressureThreshold 
        - speaker->KdPTdc * frame->dc )
    llframe->NAV = 0;

  else if (state->agx < speaker->agm) 
    llframe->NAV = (short)(
      30. * DTlog10(frame->ps - CGS_TO_CMWATER(state->Pm)) 
      + speaker->Kv 
      - speaker->KdAV0 * MMSQ_TO_CMSQ(speaker->agm - state->agx)
      );
  
  else if (state->agx < speaker->agm + speaker->agAVModalOffsetOnOff) 
    llframe->NAV = (short)(
      30. * DTlog10(frame->ps - CGS_TO_CMWATER(state->Pm)) 
      + speaker->Kv 
      - speaker->KdAV * MMSQ_TO_CMSQ(state->agx - speaker->agm)
      );
  
  else

    llframe->NAV = (short)(
      30. * DTlog10(frame->ps - CGS_TO_CMWATER(state->Pm)) 
      + speaker->Kv 
      - speaker->KdAV * MMSQ_TO_CMSQ(speaker->agAVModalOffsetOnOff)
      - speaker->KdAV1 * MMSQ_TO_CMSQ(state->agx - speaker->agm 
                                       -speaker->agAVModalOffsetOnOff)
      );
  
  /*****
    Must not be negative. From Williams.
  *****/
  
  if(llframe->NAV < 0)
    llframe->NAV = 0;

  if(llframe->NAV == 0)
    llframe->NF0 = 0;

  /*****
    Compute AH, conditions are from Dave Williams code hlkl.c
  *****/

  if(state->agf < speaker->agMin
    || frame->ag >= speaker->agHiKLSourceCutoff
    || (frame->an <= 0. && state->acx <= 0.)
    || fabs(frame->ps - CGS_TO_CMWATER(state->Pm)) < FLOAT_EPS
    || state->agf < FLOAT_EPS )
    llframe->NAH = 0;

  else

  {
    llframe->NAH = (short)(
      30.f * DTlog10((float)fabs(frame->ps - CGS_TO_CMWATER(state->Pm)))
      + 10.0f * DTlog10(MMSQ_TO_CMSQ(state->agf))
      + speaker->Ka 
      );	  

  }
  /*****
    Must not be negative. From Williams.
  *****/
      
  if(llframe->NAH < 0)
    llframe->NAH = 0;

}


static float
InterpolateAF(HLSpeaker *speaker,HLState *state,HLState *oldstate)

{
  short i;
  int NumberAFInterpolations;
  float acx,Pm,AF;
  float acxPrev,acxStep,PmPrev,PmStep,MaxAF=0.0f;

  /*****
    Set up the interpolation on acx and Pm.  The interpolation
    is in between the previous frame and the current frame.
    Pm must be in CM H20.  acx must be in cm^2.
  *****/

  if(state->agx <= 0.0f || state->acx <= 0.0f) /* From hlkl.c */
    return 0.0f;

  NumberAFInterpolations = (int)(speaker->UpdateInterval
    / speaker->AFInterpTimeStep);
  
  acxPrev = MMSQ_TO_CMSQ(oldstate->acx);
  acxStep = ( MMSQ_TO_CMSQ(state->acx) - acxPrev )
    / (float) NumberAFInterpolations;

  PmPrev = CGS_TO_CMWATER(oldstate->Pm);
  PmStep = (CGS_TO_CMWATER(state->Pm) - PmPrev) 
    / (float) NumberAFInterpolations;

  for(i=1;i <= NumberAFInterpolations; ++i){
    acx = acxPrev + i * acxStep;
    Pm = PmPrev + i * PmStep;

    /*****
      Must find the maximum in the interpolation of:

      AF = 20 log10 ( Pm ^ (3/2) * acx ^ (1/2) ) + Kf
    *****/

    /*****
      If there is no pressure in the mouth then there
      will be no fricative.  Also complete closure will
      not cause frication.
    *****/

    if(Pm < FLOAT_EPS || acx < FLOAT_EPS){
#ifdef WARNINGS
	printf(" Pm or acx non-positive in InterpolateAF");
#endif
	AF=0.0f;
    }
    else
		//helpme
		//Note acx here is in csm ie. 10 = .1f
      AF = (float)(30.0f * DTlog10(Pm) + 10.0f * DTlog10(acx) + speaker->Kf);

//temp change choose average not max
    //if(i==1)
      MaxAF = (MaxAF+AF)/2;

    //else if(AF > MaxAF)
      //MaxAF = AF;
  }

  /*****
    Must not be negative. from Williams
  *****/
  
  if(MaxAF < 0)
    MaxAF = 0.0f;
  
  return AF;
}

static void
GlottalInteraction(HLFrame *frame,HLSpeaker *speaker,HLState *state,LLFrame *llframe)

{
  llframe->NF1 = (short)state->f1x;  /* glottal coupling is accounted for in f1c */

  if(state->agf > speaker->agm){
    llframe->NB3 = (short)(speaker->B3m 
      + (state->agf - speaker->agm) * speaker->KB3);
    llframe->NB4 = (short)(speaker->B4m 
      + (state->agf - speaker->agm) * speaker->KB4);
    llframe->NB5 = (short)(speaker->B5m 
      + (state->agf - speaker->agm) * speaker->KB5);
  }

  else{
    llframe->NB3 = (short)speaker->B3m;
    llframe->NB4 = (short)speaker->B4m;
    llframe->NB5 = (short)speaker->B5m;
  }	
  
  if( state->agf > speaker->agm ) {
    float a,b,Ptransg;
    
//    a = (float) (SPEEDSOUND * SPEEDSOUND * DTsqrt(RHO / 2.0f) / PI);
    a = (float) 9523445.0372631f; //(SPEEDSOUND * SPEEDSOUND * DTsqrt(RHO / 2.0f) / PI);
    a /= speaker->Av > L_EPS * L_EPS ?
            speaker->Av :
            (
#ifdef WARNINGS
            printf("GlottalInteraction:  used default cross-sectional area of vocal tract."),
#endif
            3.5f
            );

    a /= speaker->Lv > L_EPS ?
            speaker->Lv :
            (
#ifdef WARNINGS
            printf("GlottalInteraction:  used default length of vocal tract."),
#endif
            17.0f
            );
  
//    b = (float)(2.0f * PI * PI * RHO) * speaker->Lvg * speaker->Lvg;
    b = (float) 2.2502698034486e-2f* speaker->Lvg * speaker->Lvg;

    Ptransg = (float) fabs(CMWATER_TO_CGS(frame->ps) - state->Pm);
  
    llframe->NB1 = (short)(
      state->b1x
      + a * MMSQ_TO_CMSQ(state->agf - speaker->agm) 
          * DTsqrt(Ptransg) / (Ptransg + b * state->f1x * state->f1x)
      );
    llframe->NB2 = (short)(
      speaker->B2m 
      + a * MMSQ_TO_CMSQ(state->agf - speaker->agm) 
          * DTsqrt(Ptransg) / (Ptransg + b * frame->f2 * frame->f2)
      );
  }
  
  else {
    llframe->NB1 = (short)state->b1x;
    llframe->NB2 = (short)speaker->B2m;
  }
}

static void
SourceSpecifics(HLFrame *frame,HLSpeaker *speaker,HLState *state,
    LLFrame *llframe)
{
  float acx_anMax,TLFloat,m,RkApCubedOverRho,RvApCubedOverRho,SixkHzpiT, apCgs, apCgs2;
  /*****
    Compute OQ
  *****/
  llframe->NOQ = (short)(speaker->OQm + (state->agx - speaker->agm)
    * speaker->KOQ);
  if(llframe->NOQ > speaker->OQMax)
    llframe->NOQ = (short)speaker->OQMax;
  else if(llframe->NOQ < speaker->OQMin)
    llframe->NOQ = (short)speaker->OQMin;
  /*****
    Compute TL
  *****/
  acx_anMax = state->acx > frame->an ? state->acx : frame->an;
  if( acx_anMax < speaker->TLBreakArea ){
    TLFloat = speaker->TLm +( (speaker->TLBreakArea - acx_anMax)
       + (state->agx - speaker->agm) ) * speaker->KTL;
  }
  else
    TLFloat = speaker->TLm + (state->agx - speaker->agm) * speaker->KTL;

  /*****
    Include posterior glottal opening correction on TL.
  *****/
  
  m = fabs(speaker->At) > L_EPS * L_EPS ? 
        speaker->Lt / speaker->At :
        (
#ifdef WARNINGS
        printf("SourceSpecifics:  used default area of trachea."),
#endif
        speaker->Lt / 2.5f
        );
  
  m += fabs(speaker->Av) > L_EPS ?
        speaker->Lv / speaker->Av :
        (
#ifdef WARNINGS
        printf("SourceSpecifics:  used default cross-sectional area of vocal tract."),
#endif
        speaker->Lv / 3.5f
        );
  
  /* The additional tilt at 3kHz is 20 log10 (6kHz pi T), assuming 1/(2 pi T) <= 3kHz, 
     where 
                         RHO (m + (Lvg/ap))
                    T = --------------------                       (a time constant),
                             Rk  +  Rv
        
                         RHO  U     sqrt(2 RHO / |ps - Pm|)
                   Rk = -------- = -------------------------       (kinematic resistance),
                          ap^2               ap
        
                         12 MU Lvg Lhp^2
                   Rv = -----------------                          (viscous resistance).
                              ap^3
     
     and if 1/(2 pi T) > 3kHz, i.e. T < 1/(6 pi kHz) then we replace T by 1/(6 pi kHz).  */

  apCgs = MMSQ_TO_CMSQ(frame->ap);
  apCgs2=apCgs* apCgs;
//  RkApCubedOverRho = (float) DTsqrt(2.0f * fabs(CMWATER_TO_CGS(frame->ps) - state->Pm) / RHO) * apCgs * apCgs;
  RkApCubedOverRho = (float) DTsqrt((float)fabs(CMWATER_TO_CGS(frame->ps) - state->Pm) * 1754.385964912f) * apCgs2;
//  RvApCubedOverRho = 12.0f * (float)(MU/RHO) * speaker->Lvg * speaker->Lhp * speaker->Lhp;
  RvApCubedOverRho = (float)2.0421052631578f * speaker->Lvg * speaker->Lhp * speaker->Lhp;
  SixkHzpiT = 6000.0f * (float)PI * apCgs2 * (m*apCgs + speaker->Lvg)
               / (RkApCubedOverRho + RvApCubedOverRho);
  
  TLFloat += 20.0f * (float) DTlog10(SixkHzpiT < 1.0f ?  1.0f : SixkHzpiT);

  /*****
    Include formant spacing correction on TL
  *****/
  
  llframe->NTL = (short)(TLFloat + (speaker->SFromf4 * frame->f4 
    - speaker->SDefault) * speaker->dBTLforPctS
      / (speaker->PctSfordBTL * speaker->SDefault));

  if(llframe->NTL > speaker->TLMax)
    llframe->NTL = (short)speaker->TLMax;

  else if(llframe->NTL < speaker->TLMin)
    llframe->NTL = (short)speaker->TLMin;

  /*****
    Compute DI, note range expression is different from
    hlkl.c
  *****/

  if(state->agx > speaker->agDIMin && state->agx < speaker->agm)
    llframe->NDI = (short)(((speaker->agm - state->agx)/state->agx) * speaker->KDI);

  else
    llframe->NDI = 0;
}

static void
UnusedLLParameters(LLFrame *llframe)

{
  /*****
    The current version of HLSYN does not compute
    values for the tracheal pole/zero pair.  They
    are eliminated by setting them equal to one
    another.
  *****/

  llframe->NFTP = llframe->NFTZ = REMOVE_FORMANT;
  llframe->NBTP = llframe->NBTZ = REMOVE_BANDWIDTH;

  /*****
    Only the Klatt natural source is used so the
    LF source parameter SQ is set to 0.
  *****/

  llframe->NSQ = 0;

  /*****
    The flutter is not set by HLSYN
  *****/

  llframe->NFL = 0;

  /*****
    The two first formant modifiers DF1 and DB1 are not used
  *****/

  llframe->NDF1 = 0;
  //llframe->DB1 =0;

  /*****
    The special parallel synthesizer for voiced speech is
    not used by the HL synthesizer.  Its gains are set
    to zero.
  *****/

  llframe->NANV = 0;
  llframe->NA1V = 0;
  llframe->NA2V = 0;
  llframe->NA3V = 0;
  llframe->NA4V = 0;
  llframe->NATV = 0;
  
  /*****
    Set B6, it is not used in ll but aesthetically set to 0
  *****/
  
  llframe->NB6 = 1000;
}
