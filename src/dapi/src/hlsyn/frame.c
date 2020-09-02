/*****************************************************************************/
/**  SenSyn - Version 2.2                                                   **/
/**                                                                         **/
/**  Copyright (c) 1991-1997 by Sensimetrics Corporation                    **/
/**  All rights reserved.                                                   **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  frame.c - synthesize one frame
 *
 *  Eric P. Carlson
 *
 *  Modification History:
 *
 *     6 Oct 1997  reb:  called InterPolePair rather than SetPolePair for
 *                 nasal pole resonators.
 *    30 Apr 1997  reb:  used HLSYNAPI instead of FLAV_STDCALL.
 *    27 Aug 1996  reb:  include flavor.h, check FLAV_STCALL in def'n of LLSynthesize.
 *    08 Aug 1996  reb:  archived as version 2.2 (no changes).
 *    27 Mar 1995  Win32 MSVC version
 *    29 Aug 1993  version 2.0 (library version)
 *    23 Feb 1993  changed casts in sigmx calculation, version 1.1
 *    27 Feb 1992  update formant_1s here, but DF1/DB1 pitch-synchronously
 *    21 Nov 1991  moved spectral_tilt, formant_1s to be pitch-synchronous
 *     5 Nov 1991  removed sample.c and init_syn.c, renamed to frame.c
 */

#include "flavor.h"

#include <math.h>		/* needed for power and fabs function */
#include <limits.h>		/* for LONG_MAX and LONG_MIN */
#include "llsyn.h"

Float next_sample(LLSynth * synth, LLFrame * frame);

/* ---------------------------------------------------------------------- */

int HLSYNAPI
LLSynthesize(LLSynth *synth, LLFrame *frame,short *wave)
{
  int index;
  int clip;
  Float sample;

  /* setup amplitudes */
  synth->coefs.asp_amp = frame->Ah ?
    dB2amp(synth->spkr.GH + frame->Ah + A_AH) : 0;
  synth->coefs.fric_amp = frame->Af ?
    dB2amp(synth->spkr.GF + frame->Af + A_AF) : 0;
  synth->coefs.f1p_amp = dB2amp(A_A1);
  synth->coefs.f2p_amp = dB2amp(frame->A2f + A_A2F);
  synth->coefs.f3p_amp = dB2amp(frame->A3f + A_A3F);
  synth->coefs.f4p_amp = dB2amp(frame->A4f + A_A4F);
  synth->coefs.f5p_amp = dB2amp(frame->A5f + A_A5F);
  synth->coefs.f6p_amp = dB2amp(frame->A6f + A_A6F);
  synth->coefs.bypass_amp = dB2amp(frame->Ab + A_AB);
  synth->coefs.npv_amp = dB2amp(frame->ANV + A_ANV);
  synth->coefs.f1v_amp = dB2amp(frame->A1V + A_A1V);
  synth->coefs.f2v_amp = dB2amp(frame->A2V + A_A2V);
  synth->coefs.f3v_amp = dB2amp(frame->A3V + A_A3V);
  synth->coefs.f4v_amp = dB2amp(frame->A4V + A_A4V);
  synth->coefs.tpv_amp = dB2amp(frame->ATV + A_ATV);

  /* setup resonators */
  /* formant_1_cascade is also setup pitch-synchronously in voice.cpp */
  InterPolePair(&synth->formant_1_cascade,
    frame->F1 + (synth->state.glottis_open ? frame->DF1 : 0),
    frame->B1 + (synth->state.glottis_open ? frame->DB1 : 0),
    synth->spkr.SR);
  InterPolePair(&synth->formant_2_cascade, frame->F2, frame->B2,
    synth->spkr.SR);
  InterPolePair(&synth->formant_3_cascade, frame->F3, frame->B3,
    synth->spkr.SR);
  SetPolePair(&synth->formant_4_cascade, frame->F4, frame->B4,
    synth->spkr.SR);
  SetPolePair(&synth->formant_5_cascade, frame->F5, frame->B5,
    synth->spkr.SR);
  SetPolePair(&synth->formant_6_cascade, frame->F6, frame->B6,
    synth->spkr.SR);
  SetPolePair(&synth->formant_7_cascade, 6500, 500, synth->spkr.SR);
  SetPolePair(&synth->formant_8_cascade, 7500, 600, synth->spkr.SR);
  InterPolePair(&synth->nasal_pole_cascade, frame->FNP, frame->BNP,
    synth->spkr.SR);
  SetZeroPair(&synth->nasal_zero_cascade, frame->FNZ, frame->BNZ,
    synth->spkr.SR);
  SetPolePair(&synth->trach_pole_cascade, frame->FTP, frame->BTP,
    synth->spkr.SR);
  SetZeroPair(&synth->trach_zero_cascade, frame->FTZ, frame->BTZ,
    synth->spkr.SR);
  InterPolePair(&synth->formant_2_parallel, frame->F2, frame->B2F,
    synth->spkr.SR);
  InterPolePair(&synth->formant_3_parallel, frame->F3, frame->B3F,
    synth->spkr.SR);
  SetPolePair(&synth->formant_4_parallel, frame->F4, frame->B4F,
    synth->spkr.SR);
  SetPolePair(&synth->formant_5_parallel, frame->F5, frame->B5F,
    synth->spkr.SR);
  SetPolePair(&synth->formant_6_parallel, frame->F6, frame->B6F,
    synth->spkr.SR);
  InterPolePair(&synth->nasal_pole_special, frame->FNP, frame->BNP,
    synth->spkr.SR);
  /* formant_1_special is also setup pitch-synchronously in voice.cpp */
  InterPolePair(&synth->formant_1_special,
    frame->F1 + (synth->state.glottis_open ? frame->DF1 : 0),
    frame->B1 + (synth->state.glottis_open ? frame->DB1 : 0),
    synth->spkr.SR);
  InterPolePair(&synth->formant_2_special, frame->F2, frame->B2,
    synth->spkr.SR);
  InterPolePair(&synth->formant_3_special, frame->F3, frame->B3,
    synth->spkr.SR);
  SetPolePair(&synth->formant_4_special, frame->F4, frame->B4,
    synth->spkr.SR);
  SetPolePair(&synth->trach_pole_special, frame->FTP, frame->BTP,
    synth->spkr.SR);

  /* setup noise source */
  if (synth->spkr.SB && !frame->Af && !frame->Ah)
    synth->state.random = synth->spkr.RS;

  /* synthesize some samples */
  for (clip=0,index = 0; index < synth->spkr.UI; index++) {
    sample = next_sample(synth, frame);
    if (sample <= 32767)
      if (sample >= -32768)
	wave[index] = (INT16) (sample );	/* round, not truncate */
      else{
	clip=1;
	wave[index] = -32768;
        }
    else{
      clip=1;
      wave[index] = 32767;
      }
  }
  
  return clip;
}
