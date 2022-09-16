/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	vtm_f.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  This include file declares the global variables used by the
 *  DECtalk floating point vocal tract model fvtm.c
 *
 ***********************************************************************
 *    Revision History:
 * 001	MGS		10/26/2000		removed global variable from include file.
								This file is included in 5 source files and the variable were declared 5 times.
 * 002	CAB		01/19/2001		Fixed copyright info
 */

#ifndef VTM_F_H
#define VTM_F_H

#define  DEFAULT_SAMPLE_RATE  11025
#define  DEFAULT_SAMPLE_RATE_SCALE  1.1025
#define  DEFAULT_INVERSE_SAMPLE_RATE_SCALE  0.907029478458
#define  DEFAULT_MAXIMUM_FREQUENCY 4961
#define  MAXIMUM_FRAME_SIZE  100
#define  DEFAULT_NUMBER_SAMPLES_PER_FRAME  71

typedef short  S16_T;
typedef int    S32_T;
typedef double FLTPNT_T;

#if 0
/**********************************************************************/
/**********************************************************************/
/*  Define input parameter array and the audio sample output array    */
/*  for the vocal tract model. The input parameter array is used to   */
/*  store "speaker" and "voice" parameters from function "ph".        */
/**********************************************************************/
/**********************************************************************/

S16_T parambuff[33];
S16_T iwave[MAXIMUM_FRAME_SIZE];

/**********************************************************************/
/*  Variable used to generate the noise waveform.                     */
/**********************************************************************/

S16_T RandomNumber;  /*  Varible used by random number generator      */
S32_T RandomMultiplier; /*  Magic constant to make next random number */
S32_T RandomAddend;  /*  Magic constant to make next random number    */

/**********************************************************************/
/*  Variables used to generate the glottal waveform.                  */
/**********************************************************************/

FLTPNT_T k1;        /*  Equals nopen1 for glottal period duration.    */
FLTPNT_T k2;        /*  Equals nopen2 for glottal period duration.    */
FLTPNT_T T0Jitter;  /*  Alternating jitter for voicing period         */

/**********************************************************************/
/*  Speaker defined gain factors.                                     */
/**********************************************************************/

FLTPNT_T PartialCascadePathGain;
FLTPNT_T SpeakerVoicingGain;
FLTPNT_T SpeakerBreathinessGain;
FLTPNT_T SpeakerAsperationGain;
FLTPNT_T SpeakerFricationGain;

FLTPNT_T FormantScale; /*  Scale factor for F1, F2, & F3              */

/**********************************************************************/
/*  Speaker defined resonator coefficients.                           */
/**********************************************************************/

FLTPNT_T p4_a1;
FLTPNT_T p4_a2;

FLTPNT_T p5_a1;
FLTPNT_T p5_a2;

FLTPNT_T p6_a1;
FLTPNT_T p6_a2;

FLTPNT_T c4_b0;
FLTPNT_T c4_a1;
FLTPNT_T c4_a2;

FLTPNT_T c5_b0;
FLTPNT_T c5_a1;
FLTPNT_T c5_a2;

/**********************************************************************/
/*  The nasal resonator filter coefficients.                          */
/**********************************************************************/

FLTPNT_T NasalResonator_b0;
FLTPNT_T NasalResonator_a1;
FLTPNT_T NasalResonator_a2;

/**********************************************************************/
/*  Coefficients for the down-sampling low pass filter.               */
/**********************************************************************/

FLTPNT_T LowPass_b0;
FLTPNT_T LowPass_a1;
FLTPNT_T LowPass_a2;

/**********************************************************************/
/*  Coefficients for the noise source filters.                        */
/**********************************************************************/

FLTPNT_T Noise_b1;
FLTPNT_T Noise_b2;
#endif // #if 0

#endif
