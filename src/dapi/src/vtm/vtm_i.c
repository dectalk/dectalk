/*
 ***********************************************************************
 *
 *                           Copyright (c)
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * 	  Copyright (c)        1984                    by Dennis H. Klatt
 *    Copyright (c) 1984 Digital Equipment Corporation, Maynard, Mass.
 *    Copyright (c) 1993 Digital Equipment Corporation, Maynard, Mass.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	vtm_i.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 * 0001 23-MAR-95 	CJL 	Add vtm_ip.h and auto-generate proto files
 *                    		add vtm_idef.h to contain symbol definitions.
 * 0002 10/16/00	CAB		Changed copyright info
 */

/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/

#include "vtm_ip.h"
#include "vtm_idef.h"
#include "viport.h"
#include "viphdefs.h"
#include "vismprat.h"   /*  Constants used by the vocal tract model   */
#include "vtm_i.h"      /*  Variables used by the vocal tract model   */
#include "vtmtabli.h"   /*  Tables used by the vocal tract model      */
#include "vtmfunci.h"   /*  Functions used by the vocal tract model   */

#define  F1_B1_UPGRADE  0
int short arg1,arg2,arg3; /*eab 3/18/95 for math functions*/
/**********************************************************************/
/*  Function prototypes                                               */
/* 23-mar-95 cjl Replaced by vtm_ip.h.                                                            */
/**********************************************************************/
/*void speech_waveform_generator();                                                                       */
/*void read_speaker_definition();                                                                         */
/*void SetSampleRate( unsigned int uiSampRate );                                          */
/*void InitializeVTM();                                                                                           */
/**********************************************************************/
/**********************************************************************/
/*  speech_waveform_generator                                         */
/**********************************************************************/
/**********************************************************************/

void speech_waveform_generator()
{
  S16 *variabpars;

  /********************************************************************/
  /********************************************************************/
  /*  READ VARIABLE PARAMETERS FOR ONE FRAME (64 SAMPLES) OF SPEECH   */
  /********************************************************************/
  /********************************************************************/

  variabpars = &parambuff[1];

  /********************************************************************/
  /********************************************************************/
  /*                                                                  */
  /*  Scaling for various sample rates is done in the following       */
  /*  fashion.                                                        */
  /*                                                                  */
  /*  If the sample rate is modified then the formant frequencies,    */
  /*  bandwidths, and the pitch period are all scaled. If the sample  */
  /*  rate is decreased the fifth formant is eliminated, and the gain */
  /*  r2pg is lowered to prevent overload.                            */
  /*                                                                  */
  /********************************************************************/
  /********************************************************************/

  /********************************************************************/
  /* T0inS4 is a time, so it should be scaled if fs != 10K.           */
  /********************************************************************/

  T0inS4 = variabpars[OUT_T0];

  switch( uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    T0inS4 = frac1mul( rate_scale, T0inS4 ) << 1;
    break;

  case SAMPLE_RATE_DECREASE:

    T0inS4 = frac1mul( rate_scale, T0inS4 );
    break;

  case NO_SAMPLE_RATE_CHANGE:

    break;

  default:

    break;
  }


  F1inHZ = variabpars[OUT_F1];
  F1inHZ = frac4mul( F1inHZ, fnscal ) +(S16) ((4096 - (S32)fnscal ) >> 4);
  F2inHZ = variabpars[OUT_F2];
  F2inHZ = frac4mul( F2inHZ, fnscal ) + (S16) ((4096 - (S32)fnscal ) >> 3);
  F3inHZ = variabpars[OUT_F3];
  F3inHZ = frac4mul( F3inHZ, fnscal );

  /********************************************************************/
  /*  Scale the nasal anti-resonator frequency for the sample rate.   */
  /********************************************************************/

  FZinHZ = variabpars[OUT_FZ];

  switch( uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    FZinHZ = frac1mul( inv_rate_scale, FZinHZ );
    break;

  case SAMPLE_RATE_DECREASE:

    FZinHZ = frac1mul( inv_rate_scale, FZinHZ ) << 1;
    break;

  case NO_SAMPLE_RATE_CHANGE:

    break;

  default:

    break;
  }

  B1inHZ = variabpars[OUT_B1];
  B2inHZ = variabpars[OUT_B2];
  B3inHZ = variabpars[OUT_B3];
  AVinDB = variabpars[OUT_AV];
  APinDB = variabpars[OUT_AP];
  A2inDB = variabpars[OUT_A2];
  A3inDB = variabpars[OUT_A3];
  A4inDB = variabpars[OUT_A4];
  A5inDB = variabpars[OUT_A5];
  A6inDB = variabpars[OUT_A6];
  ABinDB = variabpars[OUT_AB];
  TILTDB = variabpars[OUT_TLT] - 12;  /*  Tilt in dB at 3 kHz         */

  APlin = amptable[APinDB + 10];      /*  Convert dB to linear        */
  r2pg = amptable[A2inDB + 13];       /*  Convert dB to linear        */
  r3pg = amptable[A3inDB + 10];       /*  Convert dB to linear        */
  r4pa = amptable[A4inDB + 7];        /*  Convert dB to linear        */
  r5pa = amptable[A5inDB + 6];        /*  Convert dB to linear        */
  r6pa = amptable[A6inDB + 5];        /*  Convert dB to linear        */
  ABlin = amptable[ABinDB + 5];       /*  Convert dB to linear        */

  APlin = frac4mul( APlin, APgain );  /*  Scale asp by spdef GV       */
  r2pg = frac1mul( r2pg, AFgain );    /*  Scale A2 by spdef GF        */
  r3pg = frac1mul( r3pg, AFgain );    /*  Scale A3 by spdef GF        */
  r4pa = frac1mul( r4pa, AFgain );    /*  Scale A4 by spdef GF        */
  r5pa = frac1mul( r5pa, AFgain );    /*  Scale A5 by spdef GF        */
  r6pa = frac1mul( r6pa, AFgain );    /*  Scale A6 by spdef GF        */
  ABlin = frac4mul( ABlin, AFgain );  /*  Scale AB by spdef GF        */

  /********************************************************************/
  /*  Set coeficients of variable parallel resonator R2.              */
  /********************************************************************/

  b2p = 210;
  r2pa = d2pole_pf( &r2pb, &r2pc, F2inHZ, b2p, r2pg );

  /********************************************************************/
  /*  Set coeficients of variable parallel resonator R3.              */
  /********************************************************************/

  b3p = 280;
  r3pa = d2pole_pf( &r3pb, &r3pc, F3inHZ, b3p, r3pg );

  /********************************************************************/
  /********************************************************************/
  /*  MAIN LOOP. Calculate each sample of the current frame.          */
  /********************************************************************/
  /********************************************************************/

  for ( ns = 0; ns < uiNumberOfSamplesPerFrame; ns++ )
  {
    /******************************************************************/
    /******************************************************************/
    /*  NOISE GENERATOR                                               */
    /******************************************************************/
    doit();

       /******************************************************************/
    /*  Tilt spectrum down by TILTDB dB at 3 kHz,                     */
    /*  use 1-pole iir filter.                                        */
    /******************************************************************/

    voice = frac1mul( one_minus_decay, voice )
	      + frac1mul( decay, vlast );
    vlast = voice;

    /******************************************************************/
    /*  Add breathiness to voicing. Increase noise if Aspiration.     */
    /******************************************************************/

    voice += frac1mul( aturb1, noise );

    /******************************************************************/
    /*  Set variable gain of voicing.                                 */
    /*  24-Jul-85  "avlin" moved to "avlind" after half a period.     */
    /******************************************************************/

    voice = frac4mul( avlind, voice );

    /******************************************************************/
    /*  Add aspiration to voicing.                                    */
    /******************************************************************/

    voice += frac1mul( APlin, noise );

    /******************************************************************/
    /******************************************************************/
    /*                                                                */
    /*  CASCADE VOCAL TRACT, EXCITED BY LARYNGEAL SOURCES             */
    /*                                                                */
    /*  Nasal antiresonator, then formants fnp, f5c, f4c, F3inHZ      */
    /*  F2inHZ, and F1inHZ                                            */
    /*                                                                */
    /******************************************************************/
    /******************************************************************/

    /******************************************************************/
    /*  Nasal Antiresonator of Cascade Vocal Tract:                   */
    /*  rnzout = (rnza * voice) + (rnzb * rnzd1) + (rnzc * rnzd2)     */
    /******************************************************************/

    two_zero_filter( voice, rnzout, rnzd1, rnzd2, rnza, rnzb, rnzc );

    /******************************************************************/
    /*  Nasal Resonator of Cascade Vocal Tract                        */
    /*  output is rnpd1.                                              */
    /******************************************************************/

    two_pole_filter( rnzout, rnpd1, rnpd2, rnpa, rnpb, rnpc );

    /******************************************************************/
    /*  Fifth Formant                                                 */
    /*  output is r5cd1.                                              */
    /******************************************************************/

    if ( uiSampleRate > 9500 )
    {
      two_pole_filter( rnpd1, r5cd1, r5cd2, R5ca, R5cb, R5cc );
    }
    else
    {
      r5cd1 = frac4mul( R5ca, rnpd1 ) >> 1;
    }

    /******************************************************************/
    /*  Fourth Formant                                                */
    /*  output is r4cd1.                                              */
    /******************************************************************/

    two_pole_filter( r5cd1, r4cd1, r4cd2, R4ca, R4cb, R4cc );

    /******************************************************************/
    /*  Third Formant                                                 */
    /*  output is r3cd1.                                              */
    /******************************************************************/

    two_pole_filter( r4cd1, r3cd1, r3cd2, R3ca, r3cb, r3cc );

    /******************************************************************/
    /*  Second Formant                                                */
    /*  output is r2cd1.                                              */
    /******************************************************************/

    two_pole_filter( r3cd1, r2cd1, r2cd2, R2ca, r2cb, r2cc );

    /******************************************************************/
    /*  First Formant of Cascade Vocal Tract                          */
    /*  output is r1cd1.                                              */
    /******************************************************************/

    two_pole_filter( r2cd1, r1cd1, r1cd2, R1ca, r1cb, r1cc );

    out = r1cd1;

    /******************************************************************/
    /******************************************************************/
    /*                                                                */
    /*  PARALLEL VOCAL TRACT                                          */
    /*                                                                */
    /*  Excited by frication noise source. Uses formant frequencies   */
    /*  f6p, f5p, f4p, F3inHz, F2inHz and bypass path, outputs added  */
    /*  with alternating sign to prevent overflow.                    */
    /*                                                                */
    /******************************************************************/
    /******************************************************************/

    /******************************************************************/
    /*  Sixth Formant of Parallel Vocal Tract                         */
    /******************************************************************/

    two_pole_filter( noise, r6pd1, r6pd2, r6pa, r6pb, r6pc );

    out = r6pd1 - out;

    /******************************************************************/
    /*  Fifth Formant of Parallel Vocal Tract                         */
    /*  Fifth parallel formant effectively out of circuit if the      */
    /*  sample rate is low enough.                                    */
    /******************************************************************/

    if ( uiSampleRate > 9600 )
    {
      two_pole_filter( noise, r5pd1, r5pd2, r5pa, R5pb, r5pc );
    }
    else
    {
      r5pd1 = 0;
    }

    out = r5pd1 - out;

    /******************************************************************/
    /*  Fourth Formant of Parallel Vocal Tract                        */
    /******************************************************************/

    two_pole_filter( noise, r4pd1, r4pd2, r4pa, R4pb, r4pc );

    out = r4pd1 - out;

    /******************************************************************/
    /*  Third Formant of Parallel Vocal Tract                         */
    /******************************************************************/

    two_pole_filter( noise, r3pd1, r3pd2, r3pa, r3pb, r3pc );

    out = r3pd1 - out;

    /******************************************************************/
    /*  Second Formant of Parallel Vocal Tract                        */
    /******************************************************************/

    two_pole_filter( noise, r2pd1, r2pd2, r2pa, r2pb, r2pc );

    out = r2pd1 - out;

    about = frac1mul( ABlin, noise );  /*  Output of bypass path      */

    out = about - out;

    /******************************************************************/
    /*  Bring the signal level up near +/-32767.                      */
    /*  If the sample rate is 8000 Hz. then the peak signal level is  */
    /*  approximately 8000. This is because of the parameters in file */
    /*  phvdef.c for a sample rate of 8000 Hz.                        */
    /*                                                                */
    /*  Very occasionaly a large impulse will be generated. Clip it.  */
    /*  This allows running the volume level much higher.             */
    /******************************************************************/

    if ( uiSampleRate < 9500 )
    {
      if ( out > 8191 )
	out = 8191;
      else
	if ( out < -8192 )
	  out = -8192;

      iwave[ns] = out << 2;
    }
    else
    {
      if ( out > 16383 )
	out = 16383;
      else
	if ( out < -16384 )
	  out = -16384;

      iwave[ns] = out << 1;
    }
  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*  Function: read_speaker_definition                                 */
/*  Read a 22 words speaker definition packet.                        */
/**********************************************************************/
/**********************************************************************/

void read_speaker_definition() 
{
  S16 *spdeftochip;
  
  spdeftochip = &parambuff[1];

  /********************************************************************/
  /*  Constants used in random number generation.                     */
  /********************************************************************/

  ranmul = 20077;
  ranadd = 12345;

  /********************************************************************/
  /*  Constants used to filter the noise.                             */
  /********************************************************************/

  switch( uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    noiseb = -2913;
    noisec = 1499;
    break;

  case SAMPLE_RATE_DECREASE:

    noiseb = -1873;
    noisec = 1499;
    break;

  case NO_SAMPLE_RATE_CHANGE:

    noiseb = -2913;
    noisec = 1499;
    break;

  default:

    break;
  }

  /********************************************************************/
  /*  Parallel 6th formant                                            */
  /*  Resonator constant "r6pa" is set elsewhere from A6inDB.         */
  /********************************************************************/

  r6pb = -5702;
  r6pc = -1995;

  /********************************************************************/
  /*  Coefficients for fixed nasal formant.                           */
  /*  Gain parameter "rnpa" is set below by speaker definition        */
  /*  parameter "rnpg". Note possible future change, this could vary  */
  /*  from speaker to speaker.                                        */
  /********************************************************************/

  fnp = 290;
  bnp = 70;
  d2pole_pf( &rnpb, &rnpc, fnp, bnp, 0 );

  /********************************************************************/
  /*  Coefficients for fixed downsampling low-pass filter             */
  /********************************************************************/

  switch( uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    flp = 948;
    blp = 615;
    rlpg = 2400;
    break;

  case SAMPLE_RATE_DECREASE:

    flp = 698;
    blp = 453;
    rlpg = 2400;
    break;

  case NO_SAMPLE_RATE_CHANGE:

    flp = 860;
    blp = 558;
    rlpg = 2400;
    break;

  default:

    break;
  }

  rlpa = d2pole_pf( &rlpb, &rlpc, flp, blp, rlpg );

  /********************************************************************/
  /*  Begin set coeficients of speaker-def controlled resonators.     */
  /*  Cascade fourth formant                                          */
  /********************************************************************/

  f4c = ((SPD_CHIP *)spdeftochip)->r4cb;   /*  1                       */
  b4c = ((SPD_CHIP *)spdeftochip)->r4cc;   /*  2                       */

  d2pole_cf45( &R4cb, &R4cc, f4c, b4c, 0 );

  /********************************************************************/
  /*  Cascade fifth formant                                           */
  /********************************************************************/

  f5c = ((SPD_CHIP *)spdeftochip)->r5cb;   /*  3                       */
  b5c = ((SPD_CHIP *)spdeftochip)->r5cc;   /*  4                       */

  d2pole_cf45( &R5cb, &R5cc, f5c, b5c, 0 );

  /********************************************************************/
  /*  Parallel fourth formant                                         */
  /********************************************************************/

  f4p = ((SPD_CHIP *)spdeftochip)->r4pb;   /*  5                       */
  b4p = 400;

  d2pole_pf( &R4pb, &r4pc, f4p, b4p, 0 );

  /********************************************************************/
  /*  Parallel fifth formant                                          */
  /********************************************************************/

  f5p = ((SPD_CHIP *)spdeftochip)->r5pb;    /*  6                      */
  b5p = 500;

  d2pole_pf( &R5pb, &r5pc, f5p, b5p, 0 );

  /********************************************************************/
  /*  End of set coeficients of speaker definition controlled         */
  /*  resonators.                                                     */
  /********************************************************************/

  /********************************************************************/
  /*  The following parameter deleted 12-JUL-85                       */
  /*  TLToff = ((SPD_CHIP *)spdeftochip)->tltoff;      7               */
  /********************************************************************/

  /********************************************************************/
  /*  Jitter parameter has it's sign flipped from the current value.  */
  /*  t0jitr is a time, so it should be scaled if fs != 10K.          */
  /********************************************************************/

  if ( t0jitr < 0 )
    t0jitr = -((SPD_CHIP *)spdeftochip)->t0jit;    /*  8               */
  else
    t0jitr = ((SPD_CHIP *)spdeftochip)->t0jit;

  switch( uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    t0jitr = frac1mul( rate_scale, t0jitr ) << 1;
    break;

  case SAMPLE_RATE_DECREASE:

    t0jitr = frac1mul( rate_scale, t0jitr );
    break;

  case NO_SAMPLE_RATE_CHANGE:

    break;

  default:

    break;
  }

  /********************************************************************/
  /*  Gains of cascade resonators (used to keep signal in high order  */
  /*  bits).                                                          */
  /********************************************************************/

  a5gain = ((SPD_CHIP *)spdeftochip)->r5ca;    /*  9                   */
  R5ca = amptable[a5gain];
  a4gain = ((SPD_CHIP *)spdeftochip)->r4ca;    /*  10                  */
  R4ca = amptable[a4gain];
  a3gain = ((SPD_CHIP *)spdeftochip)->r3ca;    /*  11                  */
  r3cg = amptable[a3gain];
  a2gain = ((SPD_CHIP *)spdeftochip)->r2ca;    /*  12                  */
  r2cg = amptable[a2gain];
  a1gain = ((SPD_CHIP *)spdeftochip)->r1ca;    /*  13                  */
  r1cg = amptable[a1gain];

  /********************************************************************/
  /*  Constants that determine the duration of the open phase of the  */
  /*  glottal period.                                                 */
  /********************************************************************/

  k1 = ((SPD_CHIP *)spdeftochip)->nopen1;      /* 14                   */
  k2 = ((SPD_CHIP *)spdeftochip)->nopen2;      /* 15                   */

  /********************************************************************/
  /*  Breathiness coefficient.                                        */
  /********************************************************************/

  Aturb = ((SPD_CHIP *)spdeftochip)->aturb;    /*  16                  */
  Aturb = amptable[Aturb];

  /********************************************************************/
  /*  T0range = ((SPD_CHIP *)spdeftochip)->f0scale;  17  (Not used)    */
  /********************************************************************/

  /********************************************************************/
  /*  Scale factor for variable formants F1inHZ, F2inHZ, and F3inHZ.  */
  /********************************************************************/

  fnscal = ((SPD_CHIP *)spdeftochip)->fnscale;     /*  18              */

  /********************************************************************/
  /*  Overall gain of frication source re other sources               */
  /********************************************************************/

  afg = ((SPD_CHIP *)spdeftochip)->afgain;     /*  19                  */
  AFgain = amptable[afg];

  /********************************************************************/
  /*  Gain of the nasal pole resonator of cascade filter section.     */
  /********************************************************************/

  rnpg = ((SPD_CHIP *)spdeftochip)->rnpgain;   /*  20                  */
  rnpa = amptable[rnpg];

  /********************************************************************/
  /*  Overall gain of voicing source relative to other sources        */
  /********************************************************************/

  avg = ((SPD_CHIP *)spdeftochip)->azgain;     /*  21                  */
  avgain = amptable[avg];

  /********************************************************************/
  /*  Overall gain of aspiration source relative to other sources     */
  /********************************************************************/

  apg = ((SPD_CHIP *)spdeftochip)->apgain;     /*  22                  */
  APgain = amptable[apg];

  uiCurrentSpeaker = (DWORD)((SPD_CHIP *)spdeftochip)->speaker;

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: InitializeVTM                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: September 27, 1993                                          */
/*                                                                    */
/*  Vocal Tract Model Initialization                                  */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void InitializeVTM()
{
  static S16 *variabpars;

  /********************************************************************/
  /*  Set up parameters for frame of speech. The parameters will      */
  /*  flush the VTM.                                                  */
  /********************************************************************/

  variabpars = &parambuff[1];

  variabpars[OUT_T0] = 100;
  variabpars[OUT_F1] = 2000;
  variabpars[OUT_F2] = 2000;
  variabpars[OUT_F3] = 2000;
  variabpars[OUT_FZ] = 290;
  variabpars[OUT_B1] = 2000;
  variabpars[OUT_B2] = 2000;
  variabpars[OUT_B3] = 2000;
  variabpars[OUT_AV] = 0;
  variabpars[OUT_AP] = 0;
  variabpars[OUT_A2] = 0;
  variabpars[OUT_A3] = 0;
  variabpars[OUT_A4] = 0;
  variabpars[OUT_A5] = 0;
  variabpars[OUT_A6] = 0;
  variabpars[OUT_AB] = 0;
  variabpars[OUT_TLT] = 18;

  /********************************************************************/
  /*  Call multiple times till the filter delays decay enough.        */
  /********************************************************************/

  speech_waveform_generator();
  speech_waveform_generator();
  speech_waveform_generator();
  speech_waveform_generator();

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: f1_b1_up()                                              */
/*                                                                    */
/*  PROPOSED NEW CODE FOR DECTALK III                                 */
/*  Set pitch-synchronous changes to F1 (5% increase when glottis     */
/*  open), and B1 (add amount = f1/2 when glottis open).              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

/*
f1_b1_up()
{
  delr1b = frac4mul( F1inHZ, F1inHZ ) >> 1;
  r1cc += (F1inHZ);
  r1cb -= (delr1b + (F1inHZ));
}
*/

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: f1_b1_down()                                            */
/*                                                                    */
/*  PROPOSED NEW CODE FOR DECTALK III                                 */
/*  Glottis closes at this sample, reduce F1 and B1.                  */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

/*
f1_b1_down()
{
  if ( nper == nopen )
{
  r1cc -= (F1inHZ);
  r1cb += (delr1b + (F1inHZ));
}
*/

/**********************************************************************/
/**********************************************************************/
/*  Function to Set the Sample Rate the vocal tract model outputs.    */
/*  Currently this will only accept sample rates of 8000 Hz and       */
/*  11025 Hz.                                                         */
/**********************************************************************/
/**********************************************************************/

extern short last_voice;

void SetSampleRate( unsigned int uiSampRate )
{
  /********************************************************************/
  /*  Set the global sample rate dependant parameters.                */
  /*  Some day these should be moved into the TTS handle.             */
  /********************************************************************/

  uiSampleRate = uiSampRate;
  SampleRate = (double)uiSampleRate;
  SamplePeriod = 1.0 / SampleRate;

  /********************************************************************/
  /*  Setup for either 8, 10, or 11.025 kHz.                          */
  /********************************************************************/

  if ( uiSampleRate == PC_SAMPLE_RATE )
  {
    bEightKHz = FALSE;

    /******************************************************************/
    /*  Set the vocal tract model to 11 KHz.                          */
    /******************************************************************/

    uiSampleRateChange = SAMPLE_RATE_INCREASE;
    rate_scale = 18063;   /*  Equals 1.1 in Q14 format for 11 KHz.    */
    inv_rate_scale = 29722;    /*  Equals 0.909 in Q15 format.        */
    uiNumberOfSamplesPerFrame = 71;
  }
  else
  {
    if ( uiSampleRate == MULAW_SAMPLE_RATE )
   {
      bEightKHz = TRUE;

      /****************************************************************/
      /*  Set the vocal tract model to 8 KHz.                         */
      /****************************************************************/

      uiSampleRateChange = SAMPLE_RATE_DECREASE;
      rate_scale = 26214;    /*  Equals 0.8 in Q15 format for 8 KHz */
      inv_rate_scale = 20480;    /*  Equals 1.25 in Q14 format.     */
      uiNumberOfSamplesPerFrame = 51;
    }
    else
    {
      uiSampleRateChange = NO_SAMPLE_RATE_CHANGE;
    }
  }

  /********************************************************************/
  /*  Update the speaker definition for the new sample rate.          */
  /********************************************************************/

/*  KS.async_voice = last_voice; */
/*  KS.async_change |= ASYNC_voice; for alpha model */

  return;
}



/**********************************************************************/
/*                                                                    */
/*                DECtalk Vocal Tract Model                           */
/*                                                                    */
/* Copyright (c)        1984                    by Dennis H. Klatt    */
/* Copyright (c) 1984 Digital Equipment Corporation, Maynard, Mass.   */
/*                                                                    */
/* Edit history:                                                      */
/*                                                                    */
/*   1.  1-Sep-84 DK  Initial creation                                */
/*                                                                    */
/*   2. 17-Jan-85 DK  Add "multi-pulse" excitation                    */
/*                    (currently disabled).                           */
/*                                                                    */
/*   3. 19-Feb-85 DK  New Code: Change meaning of TILT to             */
/*                    "spread glottis".                               */
/*                                                                    */
/*   4. 10-Mar-85 DK  Reorganize to look more like code used on chip. */
/*                                                                    */
/*   5. 16-Apr-85 DK  Set R6PB = -3728, R6PC = -851                   */
/*                    ( F = 4900, BW = 2500 )                         */
/*                                                                    */
/*   6. 30-Apr-85 DK  Boost gain in cascade F1 to better avoid limit  */
/*                    cycles. Try new random number generator.        */
/*                                                                    */
/*   7. 13-Jul-85 DK  Do not modulate breathiness noise, make glottal */
/*                    closure occur at end of a period, --> T0        */
/*                    continuous when NOPEN changes, fix lptilt()     */
/*                    (MAJOR ERROR), also delete spdef par TILToff.   */
/*                                                                    */
/*   8. 15-Jul-85 DK  TEMPORARY CHANGES FOR FIGURE GENERATION.        */
/*                    see SHOW_VOICING.                               */
/*                                                                    */
/*   9. 22-Jul-85 DK  Add print statements for comparison with SPC    */
/*                    code.                                           */
/*                                                                    */
/*  10. 24-Jul-85 DK  Add small constant to output to avoid sign-bit  */
/*                    noise. Use new variable "AVlind" to delay       */
/*                    change in AV.                                   */
/*                                                                    */
/*  11. 29-Jul-85 DK  Make sure R1ca does not overflow alotted bits.  */
/*                                                                    */
/*  12. 10-Oct-92 BH  Clearly separated comments from code and        */
/*                    added a consistent indentation style.           */
/*                    Removed the changes added in 8 (SHOW_VOICING).  */
/*                    Added in-line functions for filtering. The new  */
/*                    functions are:                                  */
/*                    two_zero_filter, two_zero_filter_2 and          */
/*                    two_pole_filter.                                */
/*                    Set f6p and b6p to get the correct values for   */
/*                    r6pb and r6pc.                                  */
/*                                                                    */
/*  13. 14-JUL-92 BH  Made VTM work at sample rates 8K, 10K, and 11K. */
/*                                                                    */
/*    Klatt synthesizer as implimented on the TI SPC                  */
/*    Modified version of synthesizer described in                    */
/*    J. Acoust. Soc. Am., Mar. 1980. -- new voicing source.          */
/*                                                                    */
/**********************************************************************/

#ifndef DECVOC

doit()
{
/*insert function from decvoc.c */
}

#endif
