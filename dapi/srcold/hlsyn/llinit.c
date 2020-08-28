/*****************************************************************************/
/**  SenSyn - Version 2.2                                                   **/
/**                                                                         **/
/** Copyright (c) 1991-1997 by Sensimetrics Corporation                     **/
/** All rights reserved.                                                    **/
/**                                                                         **/
/*****************************************************************************/

/*  llinit.cpp - synthesizer initialization
 *
 *  e.p.carlson
 *
 *   6 Oct 1997  reb:  Initialized coef A for nasal pole resonators.
 *  30 Apr 1997  reb:  Used HLSYNAPI rather than FLAV_STDCALL.
 *  27 Aug 1996  reb:  include flavor.h, check FLAV_STDCALL in def'n of 
 *                     LLInit.
 *  08 Aug 1996  reb:  made floating-point constants single-precision; 
 *                     archived as version 2.2.
 *  27 Mar 1995  Win32 MSVC version
 *  26 Aug 1993  version 2.0
 *   5 Nov 1991  removed from spyn.c
 */

#include "flavor.h"

#include "llsyn.h"

/* ---------------------------------------------------------------------- */
/* initialize synthesizer */

void HLSYNAPI
LLInit(LLSynth *synth, Speaker *spkr)
{
  /*****
    Changed speaker to pass by reference -Erik
  *****/
  
  synth->state.parallel_only_flag = spkr->CP;
  synth->state.num_casc_formants = spkr->NF;
  synth->state.num_samples = spkr->UI;
  synth->state.output_select = spkr->OS;

  synth->state.glottis_open = 0;
  synth->state.period_ctr = 0;
  synth->state.global_time = 0;
  synth->state.pulse = 0;
  synth->state.voicing_time = 0;
  synth->state.voicing_amp = 0.f;
  synth->state.voicing_state = 0;
  synth->state.glottal_state = 0.f;
  synth->state.asp_state = 0.f;
  synth->state.integrator = 0.f;
  synth->state.random = spkr->RS;
  synth->state.F0 = 0;
  synth->state.FL = 0;
  synth->state.OQ = 0;
  synth->state.SQ = 0;
  synth->state.DI = 0;
  synth->state.AV = 0;
  synth->state.close_shortened = 0;
  synth->state.close_time = 0;

  ClearResonator(&synth->glottal_pulse);
  ClearResonator(&synth->spectral_tilt);
  ClearResonator(&synth->nasal_pole_cascade);
  ClearResonator(&synth->formant_1_cascade);
  ClearResonator(&synth->formant_2_cascade);
  ClearResonator(&synth->formant_3_cascade);
  ClearResonator(&synth->formant_4_cascade);
  ClearResonator(&synth->formant_5_cascade);
  ClearResonator(&synth->formant_6_cascade);
  ClearResonator(&synth->formant_7_cascade);
  ClearResonator(&synth->formant_8_cascade);
  ClearResonator(&synth->formant_2_parallel);
  ClearResonator(&synth->formant_3_parallel);
  ClearResonator(&synth->formant_4_parallel);
  ClearResonator(&synth->formant_5_parallel);
  ClearResonator(&synth->formant_6_parallel);
  ClearResonator(&synth->nasal_zero_cascade);
  ClearResonator(&synth->trach_pole_cascade);
  ClearResonator(&synth->trach_zero_cascade);
  ClearResonator(&synth->formant_1_special);
  ClearResonator(&synth->formant_2_special);
  ClearResonator(&synth->formant_3_special);
  ClearResonator(&synth->formant_4_special);
  ClearResonator(&synth->nasal_pole_special);
  ClearResonator(&synth->trach_pole_special);

  
  /* Need initialize Coef A for those formants InterPolePair()'ed */
  
  synth->formant_1_cascade.Coef.A = 0.f;
  synth->formant_2_cascade.Coef.A = 0.f;
  synth->formant_3_cascade.Coef.A = 0.f;
  synth->nasal_pole_cascade.Coef.A = 0.f;

  synth->formant_2_parallel.Coef.A = 0.f;
  synth->formant_3_parallel.Coef.A = 0.f;

  synth->formant_1_special.Coef.A = 0.f;
  synth->formant_2_special.Coef.A = 0.f;
  synth->formant_3_special.Coef.A = 0.f;
  synth->nasal_pole_special.Coef.A = 0.f;
}
