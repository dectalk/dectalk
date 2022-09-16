/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	vtm_fdef.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  This include declares functions used by the DECtalk vocal tract
 *  model vtm.c
 *
 ***********************************************************************
 *    Revision History:
 * 0001 31-Mar-95 CJL File new.
 * 0001 08-Apr-98 GL  BATS#648 change "#if 0" to "#if MSDOS".
 */

#ifndef VTM_FDEF_H
#define VTM_FDEF_H
/* GL 04/08/1998  BATS#648, this section needed by decvoc_f.c build in MSDOS */
#if MSDOS   // not used with any C VTM
#include "vtm_f.h"

  /********************************************************************/
  /*  Counter limits                                                  */
  /********************************************************************/

extern int iNumOpenSamples;  /*  Number of samples in open phase of period   */
extern int iPositionToStartNoiseModulation;

  /********************************************************************/
  /*  Counters                                                        */
  /********************************************************************/

extern int nsr4;  /*  Counter of 4 samples in glottal source loop   */
extern int Index;
extern unsigned int uiVoicePeriodSampleNumber;
                    /*  Current loc in voicing period at 4 * Fs       */

  /********************************************************************/
  /*  Variables used to generate the glottal waveform.                */
  /********************************************************************/

extern FLTPNT_T T0; /* Fundamental period in output samples times 4 */
extern FLTPNT_T a; /*  Makes glottal pulse when open          */
extern FLTPNT_T b; /*  Makes glottal pulse when open          */

  /********************************************************************/
  /*  Signals.                                                        */
  /********************************************************************/

extern FLTPNT_T DifferentiatedGlottalFlow;
extern FLTPNT_T DifferentiatedVoicing;

  /********************************************************************/
  /*  Variable gain factors.                                          */
  /********************************************************************/

extern FLTPNT_T LaryngealSourceGain;
extern FLTPNT_T SpeakerBreathinessPitchSyncGain;
extern FLTPNT_T LaryngealSourcePitchSyncGain;

  /********************************************************************/
  /*  Variables to hold the input parameters.                         */
  /********************************************************************/

extern FLTPNT_T T0inS4;  /*  Pitch period ( pitch from 50 to 165 )  */
extern FLTPNT_T F1inHZ;  /*  First formant in Hz,       200 to 1300 */
extern FLTPNT_T F2inHZ;  /*  Second formant in Hz,      550 to 3000 */
extern FLTPNT_T F3inHZ;  /*  Third formant in Hz,      1200 to 4800 */
extern FLTPNT_T FZinHZ;  /*  Nasal zero in Hz,          248 to  528 */
extern FLTPNT_T B1inHZ;  /*  First formant bw in Hz,     40 to 1000 */
extern FLTPNT_T B2inHZ;  /*  Second formant bw in Hz,    40 to 1000 */
extern FLTPNT_T B3inHZ;  /*  Third formant bw in Hz,     40 to 1000 */
extern S16_T TiltInDB;   /*  Voicing spectral tilt in dB, 0 to   24 */
extern S16_T AVinDB;     /*  Amp of voicing in dB,        0 to   70 */

  /********************************************************************/
  /* Variables used by macro DESIGN_TWO_POLE_FILTER()                 */
  /********************************************************************/

extern FLTPNT_T Freq;
extern FLTPNT_T BW;
extern FLTPNT_T Radius;
extern FLTPNT_T Temp;

  /********************************************************************/
  /*  Coefficients for the noise source filters.                      */
  /********************************************************************/

extern FLTPNT_T GlottalSourceTilt_a1;
extern FLTPNT_T GlottalSourceTilt_b0;

  /********************************************************************/
  /*  Coefficients of cascade resonators for formants 2 through 6.    */
  /********************************************************************/

extern FLTPNT_T CascadePathGain;
extern FLTPNT_T c1_b0;
extern FLTPNT_T c1_a1;
extern FLTPNT_T c1_a2;
extern FLTPNT_T c2_b0;
extern FLTPNT_T c2_a1;
extern FLTPNT_T c2_a2;
extern FLTPNT_T c3_b0;
extern FLTPNT_T c3_a1;
extern FLTPNT_T c3_a2;

  /********************************************************************/
  /*  The nasal anti-resonator filter coefficients.                   */
  /********************************************************************/

extern FLTPNT_T Nasal_b0;
extern FLTPNT_T Nasal_b1;
extern FLTPNT_T Nasal_b2;

  /********************************************************************/
  /*  Resonator and anti-resonator delays.                            */
  /********************************************************************/

extern FLTPNT_T LowPassDelay_1;
extern FLTPNT_T LowPassDelay_2;

/**/
/**********************************************************************/
/*                                                                    */
/*  Includes externs for the tables used by the floating point        */
/*  DECtalk vocal tract model vtm.c. From include File: vtmtabf.h.    */
/*                                                                    */
/**********************************************************************/

/**********************************************************************/
/*                                                                    */
/*  Constant B0 controls shape of glottal pulse as a function         */
/*  of desired duration of open phase N0.                             */
/*                                                                    */
/**********************************************************************/

extern FLTPNT_T B0[];

/**********************************************************************/
/*                                                                    */
/*  Data arrays for conversion of nasal antiresonator FZinHZ & BW to  */
/*  difference equation coeficients b0, b1, and b2.                   */
/*                                                                    */
/**********************************************************************/

extern FLTPNT_T Nasal_b0_Table[];

extern FLTPNT_T Nasal_b1_Table[];

extern FLTPNT_T Nasal_b2_Table[];

/**********************************************************************/
/*                                                                    */
/*  Convertion table, db to linear,                                   */
/*                                                                    */
/**********************************************************************/

extern FLTPNT_T dBtoLinear[];

/**********************************************************************/
/*                                                                    */
/*  Cosine table used by function setb()                              */
/*                                                                    */
/**********************************************************************/

extern FLTPNT_T CosineTable[];

/**********************************************************************/
/*                                                                    */
/*  Radius table used by function setc()                              */
/*                                                                    */
/**********************************************************************/

extern FLTPNT_T radius_table[];

/**********************************************************************/
/* Global variable used by macro DESIGN_TWO_POLE_FILTER()             */
/**********************************************************************/

extern FLTPNT_T MaximumFrequency;

/**********************************************************************/
/*  Sample rate scaling parameters for time and frequency.            */
/**********************************************************************/

extern unsigned int uiSampleRate;
extern FLTPNT_T SampleRate;
extern FLTPNT_T SampleRateScale;
extern FLTPNT_T InverseSampleRateScale;
extern unsigned int uiNumberOfSamplesPerFrame;

extern unsigned int uiCurrentSpeaker;

/**********************************************************************/
/*  Speaker defined gain factors.                                     */
/**********************************************************************/

extern FLTPNT_T OutputScaleFactor;
#endif //MSDOS

#endif
