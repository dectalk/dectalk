/*****************************************************************************/
/**  SenSyn - Version 2.2                                                   **/
/**                                                                         **/
/**  Copyright (c) 1991-1997 by Sensimetrics Corporation                    **/
/**  All rights reserved.                                                   **/
/**                                                                         **/
/*****************************************************************************/

/*  llsyn.h - SenSyn top-level declarations
 *
 *  coded by Eric P. Carlson
 *
 *  Modification History:
 *
 *    30 Apr 1997  reb:  used HLSYNAPI rather than FLAV_STDCALL.
 *    27 Aug 1996  reb:  include flavor.h, check FLAV_STDCALL in decl of 
 *                       LLSynthesize, LLInit.
 *    08 Aug 1996  reb:  archived as version 2.2 (no changes).
 *    27 Mar 1995  Win32 MSVC version
 *    29 Aug 1993  added Speaker
 *    26 Aug 1993  original
 */

#ifndef LLSYN_H
#define LLSYN_H

#include "flavor.h"
#include "reson.h"
#include "synth.h"

typedef struct tagSpeaker {
  short DU;
  short UI;
  short SR;
  short NF;
  short SS;
  short RS;
  short SB;
  short CP;
  short OS;
  short GV;
  short GH;
  short GF;
} Speaker;

typedef struct tagLLSynth {
  Synthesizer state;
  Coefficients coefs;
  Speaker spkr;
  Resonator glottal_pulse, spectral_tilt,
    nasal_pole_cascade, formant_1_cascade, formant_2_cascade,
    formant_3_cascade, formant_4_cascade, formant_5_cascade,
    formant_6_cascade, formant_7_cascade, formant_8_cascade,
    formant_2_parallel, formant_3_parallel, formant_4_parallel,
    formant_5_parallel, formant_6_parallel, trach_pole_cascade,
    formant_1_special, formant_2_special, formant_3_special,
    formant_4_special, nasal_pole_special, trach_pole_special;
  Resonator nasal_zero_cascade, trach_zero_cascade;	/* anti-resonators */
  Float out[NUM_OUTPUTS];
} LLSynth;

typedef struct tagLLFrame {
  short F0;
  short AV;
  short OQ;
  short SQ;
  short TL;
  short FL;
  short DI;
  short Ah;
  short Af;

  short F1;
  short B1;
  short DF1;
  short DB1;
  short F2;
  short B2;
  short F3;
  short B3;
  short F4;
  short B4;
  short F5;
  short B5;
  short F6;
  short B6;

  short FNP;
  short BNP;
  short FNZ;
  short BNZ;
  short FTP;
  short BTP;
  short FTZ;
  short BTZ;

  short A2f;
  short A3f;
  short A4f;
  short A5f;
  short A6f;
  short Ab;
  short B2F;
  short B3F;
  short B4F;
  short B5F;
  short B6F;

  short ANV;
  short A1V;
  short A2V;
  short A3V;
  short A4V;
  short ATV;
} LLFrame;


#ifdef __cplusplus
extern "C" {
#endif

extern int HLSYNAPI
LLSynthesize(LLSynth *synth, LLFrame *frame, short *wave);

extern void HLSYNAPI
LLInit(LLSynth *synth, Speaker *spkr);

#ifdef __cplusplus
}
#endif

#endif
