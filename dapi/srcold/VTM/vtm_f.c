/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved. 
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * 	  Copyright (c)        1984                    by Dennis H. Klatt
 * 	  Copyright (c) 1984 Digital Equipment Corporation, Maynard, Mass.
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
 *    File Name:	vtm_f.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *                DECtalk Vocal Tract Model, Floating point version
 *
 ***********************************************************************
 *    Revision History:
 *   001	1-Sep-84 	DK  	Initial creation
 *   002 	17-Jan-85 	DK  	Add "multi-pulse" excitation
 *		                    	(currently disabled).
 *   003 	19-Feb-85 	DK  	New Code: Change meaning of TILT to
 *                    			"spread glottis".
 *   004 	10-Mar-85 	DK  	Reorganize to look more like code used on chip.
 *   005 	16-Apr-85 	DK  	Set R6PB = -3728, R6PC = -851
 *                    			( F = 4900, BW = 2500 )
 *   006 	30-Apr-85 	DK  	Boost gain in cascade F1 to better avoid limit
 *                    			cycles. Try new random number generator.
 *   007 	13-Jul-85 	DK  	Do not modulate breathiness noise, make glottal
 *                    			closure occur at end of a period, --> T0
 *                    			continuous when NOPEN changes, fix lptilt()
 *                    			(MAJOR ERROR), also delete spdef par TILToff.
 *   008 	15-Jul-85 	DK  	TEMPORARY CHANGES FOR FIGURE GENERATION.
 *                    			see SHOW_VOICING.
 *   009 	22-Jul-85 	DK  	Add print statements for comparison with SPC
 *                    			code.
 *   010 	24-Jul-85 	DK  	Add small constant to output to avoid sign-bit
 *                    			noise. Use new variable "AVlind" to delay
 *                    			change in AV.
 *   011 	29-Jul-85 	DK  	Make sure R1ca does not overflow alotted bits.
 *   012 	10-Oct-92 	BH  	Clearly separated comments from code and
 *                    			added a consistent indentation style.
 *                    			Removed the changes added in 8 (SHOW_VOICING).
 *                    			Added in-line functions for filtering. The new
 *                    			functions are:
 *                    			TWO_ZERO_FILTER and TWO_POLE_FILTER.
 *                    			Set f6p and b6p to get the correct values for
 *                    			p6_a1 and p6_a2.
 *   013 	11-Feb-93 	BH  	Re-wrote to use floating point. The nasal
 *                    			anti-resonator and the nasal resonator were
 *                    			merged into one biquadratic filter. All filters
 *                    			are now in-line macros defined in include file
 *                    			"mfilter.h". Filter gains have been combined
 *                    			and/or moved around. There are a lot of
 *                    			gain multipliers which are only needed to stay
 *                    			compatible with the integer Vocal Tract Model
 *                    			driver code.
 *  014 	11-Mar-80 	??  	Modified version of synthesizer described in
 *								J. Acoust. Soc. Am., Mar. 1980. -- new voicing
 *								source.
 *  015		03-Apr-95 	CJL		File was fvtm.c. Is now vtm_f.c
 *  016		4/7/99 		eab		Modified SP_ for universal phonemes
 *  017		10/16/00	cab		Fixed copyrigjht info and formatted comment section.
 */

/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/

#include <stdio.h>
#include <math.h>

#include "vtm_fp.h"
#include "vtm_fdef.h"
#include "vfport.h"
//#include "vfphdefs.h"
#include "ph_defs.h"
#include "vtm_f.h"       /*  Variables used by the vocal tract model   */
#include "vtmtabf.h"     /*  Tables used by the vocal tract model      */
#include "vfmfiltr.h"    /*  Filters Macros                            */
#include "vfmd2pol.h"    /*  Two pole filter design Macro              */

/**********************************************************************/
/*  Symbol Definitions.                                               */
/**********************************************************************/

#define  OUTPUT_SCALE_FACTOR        8.0
#define  MAXIMUM_FREQUENCY_SCALING  0.45
#define  FRAME_TIME_IN_MSEC         0.0064
#define  NOISE_TILT_A1              0.75
#define  Q12_INVERSE_SCALE          0.000244140625

/**********************************************************************/
/* Global variable used by macro DESIGN_TWO_POLE_FILTER()             */
/**********************************************************************/

FLTPNT_T MaximumFrequency = DEFAULT_MAXIMUM_FREQUENCY;

/**********************************************************************/
/*  Sample rate scaling parameters for time and frequency.            */
/**********************************************************************/

unsigned int uiSampleRate = DEFAULT_SAMPLE_RATE;
FLTPNT_T SampleRate = (FLTPNT_T)DEFAULT_SAMPLE_RATE;
FLTPNT_T SampleRateScale = DEFAULT_SAMPLE_RATE_SCALE;
FLTPNT_T InverseSampleRateScale = DEFAULT_INVERSE_SAMPLE_RATE_SCALE;
unsigned int uiNumberOfSamplesPerFrame = DEFAULT_NUMBER_SAMPLES_PER_FRAME;

unsigned int uiCurrentSpeaker = 0;

/**********************************************************************/
/*  Speaker defined gain factors.                                     */
/**********************************************************************/

FLTPNT_T OutputScaleFactor = 0.0;

  /********************************************************************/
  /*  Variables to hold the input parameters.                         */
  /********************************************************************/

  FLTPNT_T T0inS4;  /*  Pitch period ( pitch from 50 to 165 )  */
  FLTPNT_T F1inHZ;  /*  First formant in Hz,       200 to 1300 */
  FLTPNT_T F2inHZ;  /*  Second formant in Hz,      550 to 3000 */
  FLTPNT_T F3inHZ;  /*  Third formant in Hz,      1200 to 4800 */
  FLTPNT_T FZinHZ;  /*  Nasal zero in Hz,          248 to  528 */
  FLTPNT_T B1inHZ;  /*  First formant bw in Hz,     40 to 1000 */
  FLTPNT_T B2inHZ;  /*  Second formant bw in Hz,    40 to 1000 */
  FLTPNT_T B3inHZ;  /*  Third formant bw in Hz,     40 to 1000 */
  S16_T AVinDB;     /*  Amp of voicing in dB,        0 to   70 */
  S16_T APinDB;     /*  Amp of aspiration in dB,     0 to   70 */
  S16_T A2inDB;     /*  Amp of F2 frication in dB,   0 to   80 */
  S16_T A3inDB;     /*  Amp of F3 frication in dB,   0 to   80 */
  S16_T A4inDB;     /*  Amp of F4 frication in dB,   0 to   80 */
  S16_T A5inDB;     /*  Amp of F5 frication in dB,   0 to   80 */
  S16_T A6inDB;     /*  Amp of F6                    0 to   80 */
  S16_T ABinDB;     /*  Amp of bypass fric. in dB,   0 to   80 */
  S16_T TiltInDB;   /*  Voicing spectral tilt in dB, 0 to   24 */

  /********************************************************************/
  /*  Counters                                                        */
  /********************************************************************/

  unsigned int uiNs;  /*  Number of samples into current frame */
  unsigned int uiVoicePeriodSampleNumber;
                    /*  Current loc in voicing period at 4 * Fs       */
  int nsr4;  /*  Counter of 4 samples in glottal source loop   */
  int Index;

  /********************************************************************/
  /*  Counter limits                                                  */
  /********************************************************************/

  int iNumOpenSamples;  /*  Number of samples in open phase of period   */
  int iPositionToStartNoiseModulation;

  /********************************************************************/
  /*  Signals.                                                        */
  /********************************************************************/

  FLTPNT_T DifferentiatedGlottalFlow;
  FLTPNT_T Noise;       /*  Output of Random number generator  */
  FLTPNT_T DifferentiatedVoicing;
  FLTPNT_T NoiseOutput; /*  Output of parallel resonators      */
  FLTPNT_T Output;      /*  Output signal from the VTM         */

  /********************************************************************/
  /*  Resonator and anti-resonator delays.                            */
  /********************************************************************/

  FLTPNT_T p2_Delay_1 = 0.0;
  FLTPNT_T p2_Delay_2 = 0.0;
  FLTPNT_T p3_Delay_1 = 0.0;
  FLTPNT_T p3_Delay_2 = 0.0;
  FLTPNT_T p4_Delay_1 = 0.0;
  FLTPNT_T p4_Delay_2 = 0.0;
  FLTPNT_T p5_Delay_1 = 0.0;
  FLTPNT_T p5_Delay_2 = 0.0;
  FLTPNT_T p6_Delay_1 = 0.0;
  FLTPNT_T p6_Delay_2 = 0.0;
  FLTPNT_T c1_Delay_1 = 0.0;
  FLTPNT_T c1_Delay_2 = 0.0;
  FLTPNT_T c2_Delay_1 = 0.0;
  FLTPNT_T c2_Delay_2 = 0.0;
  FLTPNT_T c3_Delay_1 = 0.0;
  FLTPNT_T c3_Delay_2 = 0.0;
  FLTPNT_T c4_Delay_1 = 0.0;
  FLTPNT_T c4_Delay_2 = 0.0;
  FLTPNT_T c5_Delay_1 = 0.0;
  FLTPNT_T c5_Delay_2 = 0.0;
  FLTPNT_T NasalDelay_1 = 0.0;
  FLTPNT_T NasalDelay_2 = 0.0;
  FLTPNT_T LowPassDelay_1 = 0.0;
  FLTPNT_T LowPassDelay_2 = 0.0;
  FLTPNT_T NoiseDelay_1 = 0.0;
  FLTPNT_T NoiseDelay_2 = 0.0;
  FLTPNT_T VoiceTiltDelay = 0.0;
  FLTPNT_T NoiseTiltDelay = 0.0;

  /********************************************************************/
  /*  Coefficients of parallel resonators for formants 2 through 6.   */
  /********************************************************************/

  FLTPNT_T p2_b0;
  FLTPNT_T p2_a1;
  FLTPNT_T p2_a2;
  FLTPNT_T p3_b0;
  FLTPNT_T p3_a1;
  FLTPNT_T p3_a2;
  FLTPNT_T p4_b0;
  FLTPNT_T p5_b0;
  FLTPNT_T p6_b0;

  /********************************************************************/
  /*  Coefficients of cascade resonators for formants 2 through 6.    */
  /********************************************************************/

  FLTPNT_T CascadePathGain;
  FLTPNT_T c1_b0;
  FLTPNT_T c1_a1;
  FLTPNT_T c1_a2;
  FLTPNT_T c2_b0;
  FLTPNT_T c2_a1;
  FLTPNT_T c2_a2;
  FLTPNT_T c3_b0;
  FLTPNT_T c3_a1;
  FLTPNT_T c3_a2;

  /********************************************************************/
  /*  Coefficients for the noise source filters.                      */
  /********************************************************************/

  FLTPNT_T GlottalSourceTilt_a1 = 0.0;
  FLTPNT_T GlottalSourceTilt_b0 = 0.0;

  /********************************************************************/
  /*  The bandwidths of F2 and F3 for the frication path.             */
  /********************************************************************/

  FLTPNT_T b2p;  /*  Bandwidth of parallel 2th formant         */
  FLTPNT_T b3p;  /*  Bandwidth of parallel 3th formant         */

  /********************************************************************/
  /*  The nasal anti-resonator filter coefficients.                   */
  /********************************************************************/

  FLTPNT_T Nasal_b0;
  FLTPNT_T Nasal_b1;
  FLTPNT_T Nasal_b2;

  /********************************************************************/
  /*  Variables used to generate the glottal waveform.                */
  /********************************************************************/

  FLTPNT_T T0; /* Fundamental period in output samples times 4 */
  FLTPNT_T a = 0.0; /*  Makes glottal pulse when open          */
  FLTPNT_T b = 0.0; /*  Makes glottal pulse when open          */

  /********************************************************************/
  /*  Variable gain factors.                                          */
  /********************************************************************/

  FLTPNT_T LaryngealSourceGain = 0.0;
  FLTPNT_T SpeakerBreathinessPitchSyncGain;
  FLTPNT_T LaryngealSourcePitchSyncGain = 0.0;
  FLTPNT_T AsperationGain = 0.0;
  FLTPNT_T BypassNoiseGain = 0.0;
  FLTPNT_T p3_gain;  /*  Gain factor for parallel 3rd formant  */
  FLTPNT_T p2_gain;  /*  Gain factor for parallel 2nd formant  */

  /********************************************************************/
  /* Variables used by macro DESIGN_TWO_POLE_FILTER()                 */
  /********************************************************************/

  FLTPNT_T Freq;
  FLTPNT_T BW;
  FLTPNT_T Radius;
  FLTPNT_T Temp;

/**********************************************************************/
/**********************************************************************/
/*  speech_waveform_generator                                         */
/**********************************************************************/
/**********************************************************************/

void speech_waveform_generator()
{
  static S16_T *variabpars;

  /********************************************************************/
  /********************************************************************/
  /*  Read variable parameters for one frame of speech. The frame     */
  /*  time is defined by constant FRAME_TIME_IN_MSEC.                 */
  /*  18 words are read. Voice excited parameters are updated pitch   */
  /*  synchronously to avoid waveform glitches.                       */
  /********************************************************************/
  /********************************************************************/

  variabpars = &parambuff[1];

  /********************************************************************/
  /* This is a time, so it should be scaled if fs != 10K.             */
  /********************************************************************/

  T0inS4 = SampleRateScale * (FLTPNT_T)variabpars[OUT_T0];

  /********************************************************************/
  /*  Scale F1inHZ, F2inHZ, and F3inHZ up or down in frequency        */
  /*  according to spdef FormantScale. Use trick to reduce scaling    */
  /*  performed if F1inHZ or F2inHZ is relatively low.                */
  /********************************************************************/

  F1inHZ = FormantScale * (FLTPNT_T)variabpars[OUT_F1]
    + ( 256.0 - 256.0 * FormantScale );

  F2inHZ = FormantScale * (FLTPNT_T)variabpars[OUT_F2]
    + ( 512.0 - 512.0 * FormantScale );

  F3inHZ = FormantScale * (FLTPNT_T)variabpars[OUT_F3];

  FZinHZ = InverseSampleRateScale * (FLTPNT_T)variabpars[OUT_FZ];

  B1inHZ = (FLTPNT_T)variabpars[OUT_B1];
  B2inHZ = (FLTPNT_T)variabpars[OUT_B2];
  B3inHZ = (FLTPNT_T)variabpars[OUT_B3];

  AVinDB = variabpars[OUT_AV];
  APinDB = variabpars[OUT_AP];
  A2inDB = variabpars[OUT_A2];
  A3inDB = variabpars[OUT_A3];
  A4inDB = variabpars[OUT_A4];
  A5inDB = variabpars[OUT_A5];
  A6inDB = variabpars[OUT_A6];
  ABinDB = variabpars[OUT_AB];

  TiltInDB = variabpars[OUT_TLT] - 12;    /*  Tilt in dB at 3 kHz     */

  AsperationGain = SpeakerAsperationGain * dBtoLinear[APinDB + 10];

  if ( SampleRate < 9500.0 )
  {
    p2_gain = SpeakerFricationGain * dBtoLinear[A2inDB + 12];
    p3_gain = SpeakerFricationGain * dBtoLinear[A3inDB + 10];
    p4_b0 = SpeakerFricationGain * dBtoLinear[A4inDB + 13];
    p6_b0 = SpeakerFricationGain * dBtoLinear[A6inDB + 5];
  }
  else
  {
    p2_gain = SpeakerFricationGain * dBtoLinear[A2inDB + 12];
    p3_gain = SpeakerFricationGain * dBtoLinear[A3inDB + 10];
    p4_b0 = SpeakerFricationGain * dBtoLinear[A4inDB + 7];
    p5_b0 = SpeakerFricationGain * dBtoLinear[A5inDB + 6];
    p6_b0 = SpeakerFricationGain * dBtoLinear[A6inDB + 5];
  }

  BypassNoiseGain = SpeakerFricationGain * dBtoLinear[ABinDB + 5];

  /********************************************************************/
  /*  Set coeficients of variable parallel resonator F2.              */
  /********************************************************************/

  b2p = 210.0;

  DESIGN_TWO_POLE_FILTER( p2_a1, p2_a2, p2_b0, F2inHZ, b2p );

  p2_b0 = 2.0 * p2_gain * p2_b0;

  /********************************************************************/
  /*  Set coeficients of variable parallel resonator F3.              */
  /********************************************************************/

  b3p = 280.0;

  DESIGN_TWO_POLE_FILTER( p3_a1, p3_a2, p3_b0, F3inHZ, b3p );

  p3_b0 = 2.0 * p3_gain * p3_b0;

  /********************************************************************/
  /********************************************************************/
  /*  MAIN LOOP. Calculate each sample of the current frame.          */
  /********************************************************************/
  /********************************************************************/

  for ( uiNs = 0; uiNs < uiNumberOfSamplesPerFrame; uiNs++ )
  {
    /******************************************************************/
    /******************************************************************/
    /*  NOISE GENERATOR FOR FRICATION AND ASPIRATION                  */
    /******************************************************************/
    /******************************************************************/

    RandomNumber = RandomNumber * RandomMultiplier + RandomAddend;
    Noise = 0.25 * (FLTPNT_T)RandomNumber;

    /******************************************************************/
    /*  Tilt down aspiration noise spectrum at high freqs by low-pass */
    /*  filtering.                                                    */
    /******************************************************************/

    MINIMUM_ONE_POLE_FILTER( Noise,
                             Noise,
                             NoiseTiltDelay,
                             NOISE_TILT_A1 );

    /******************************************************************/
    /*  Filter with Pi-rotated anti-resonator. (This is the same as   */
    /*  an ordinary anti-resonator except for the b1 coefficient has  */
    /*  it's sign flipped). Frequency = 3500, Bandwidth = 1600.       */
    /******************************************************************/

    MINIMUM_TWO_ZERO_FILTER( NoiseOutput,
                             Noise,
                             NoiseDelay_1,
                             NoiseDelay_2,
                             Noise_b1,
                             Noise_b2 );
    Noise = NoiseOutput;

    /******************************************************************/
    /*  Amplitude modulate the noise. Reduce noise amplitude during   */
    /*  the second half of the glottal period if                      */
    /*  LaryngealSourceGain" > 0.0. Otherwise                         */
    /*  iPositionToStartNoiseModulation is set to 0.                  */
    /******************************************************************/

    if ( uiVoicePeriodSampleNumber < iPositionToStartNoiseModulation )
      Noise = 0.5 * Noise;

    /******************************************************************/

	doit();

    /******************************************************************/
    /*  Tilt the Glottal Source frequency spectrum down by TiltInDB   */
    /*  dB at 3 kHz, Use a one pole IIR filter (also known as a decay */
    /*  averager). Note that the LowPass_b0 gain term and the         */
    /*  SpeakerVoicingGain are both included in GlottalSourceTilt_b0. */
    /******************************************************************/

    ONE_POLE_FILTER( DifferentiatedVoicing,
                     DifferentiatedVoicing,
                     VoiceTiltDelay,
                     GlottalSourceTilt_a1,
                     GlottalSourceTilt_b0 );

    /******************************************************************/
    /*  Add breathiness to voicing.                                   */
    /******************************************************************/

    DifferentiatedVoicing += SpeakerBreathinessPitchSyncGain * Noise;

    /******************************************************************/
    /*  Apply the variable gain to the breathy voicing.               */
    /******************************************************************/

    DifferentiatedVoicing *= LaryngealSourcePitchSyncGain;

    /******************************************************************/
    /*  Add aspiration to the voicing.                                */
    /******************************************************************/

    DifferentiatedVoicing += AsperationGain * Noise;

    /******************************************************************/
    /******************************************************************/
    /*                                                                */
    /*  CASCADE VOCAL TRACT, EXCITED BY LARYNGEAL SOURCES             */
    /*                                                                */
    /*  Nasal anti-resonator and nasal resonator, then formants f5c,  */
    /*  f4c, F3inHZ, F2inHZ, and F1inHZ.                              */
    /*                                                                */
    /*  The Nasal Anti-resonator and Resonator have been combined in  */
    /*  a biquadratic filter. They were formerly implemented as a two */
    /*  zero filter followed by a two pole filter. The gain of the    */
    /*  former two pole filter "NasalResonator_b0" has been included  */
    /*  in the gain of the cascade path.                              */
    /*                                                                */
    /******************************************************************/
    /******************************************************************/

    BIQUADRATIC_FILTER( Output,
                        DifferentiatedVoicing,
                        NasalDelay_1,
                        NasalDelay_2,
                        NasalResonator_a1,
                        NasalResonator_a2,
                        Nasal_b0,
                        Nasal_b1,
                        Nasal_b2 );

    /******************************************************************/
    /*  Fifth Formant of Cascade Vocal Tract.                         */
    /*  This filter is not used if the sample rate is too low.        */
    /******************************************************************/

    if ( SampleRate > 9500.0 )
    {
      MINIMUM_TWO_POLE_FILTER( Output,
                               Output,
                               c5_Delay_1,
                               c5_Delay_2,
                               c5_a1,
                               c5_a2 );
    }
    else
    {
      Output = c5_b0 * Output;
    }

    /******************************************************************/
    /*  Fourth Formant of Cascade Vocal Tract.                        */
    /******************************************************************/

    MINIMUM_TWO_POLE_FILTER( Output,
                             Output,
                             c4_Delay_1,
                             c4_Delay_2,
                             c4_a1,
                             c4_a2 );

    /******************************************************************/
    /*  Third Formant of Cascade Vocal Tract.                         */
    /******************************************************************/

    MINIMUM_TWO_POLE_FILTER( Output,
                             Output,
                             c3_Delay_1,
                             c3_Delay_2,
                             c3_a1,
                             c3_a2 );

    /******************************************************************/
    /*  Second Formant of Cascade Vocal Tract.                        */
    /******************************************************************/

    MINIMUM_TWO_POLE_FILTER( Output,
                             Output,
                             c2_Delay_1,
                             c2_Delay_2,
                             c2_a1,
                             c2_a2 );

    /******************************************************************/
    /*  First Formant of Cascade Vocal Tract                          */
    /*  This filter includes the gain for the cascade path.           */
    /******************************************************************/

    TWO_POLE_FILTER( Output,
                     Output,
                     c1_Delay_1,
                     c1_Delay_2,
                     c1_a1,
                     c1_a2,
                     CascadePathGain );

    /******************************************************************/
    /******************************************************************/
    /*  PARALLEL VOCAL TRACT                                          */
    /*  Excited by frication noise source. Uses formant frequencies   */
    /*  f6p, f5p, f4p, F3inHz, F2inHz and bypass path, outputs added  */
    /*  with alternating sign.                                        */
    /******************************************************************/
    /******************************************************************/

    /******************************************************************/
    /*  Sixth Formant of Parallel Vocal Tract.                        */
    /******************************************************************/

    TWO_POLE_FILTER( NoiseOutput,
                     Noise,
                     p6_Delay_1,
                     p6_Delay_2,
                     p6_a1,
                     p6_a2,
                     p6_b0 );

    Output = NoiseOutput - Output;

    /******************************************************************/
    /*  Fifth Formant of Parallel Vocal Tract.                        */
    /*  This filter is not used if the sample rate is too low.        */
    /******************************************************************/

    if ( SampleRate > 9500.0 )
    {
      TWO_POLE_FILTER( NoiseOutput,
                       Noise,
                       p5_Delay_1,
                       p5_Delay_2,
                       p5_a1,
                       p5_a2,
                       p5_b0 );

      Output = NoiseOutput - Output;
    }

    /******************************************************************/
    /*  Fourth Formant of Parallel Vocal Tract.                       */
    /******************************************************************/

    TWO_POLE_FILTER( NoiseOutput,
                     Noise,
                     p4_Delay_1,
                     p4_Delay_2,
                     p4_a1,
                     p4_a2,
                     p4_b0 );

    Output = NoiseOutput - Output;

    /******************************************************************/
    /*  Third Formant of Parallel Vocal Tract.                        */
    /******************************************************************/

    TWO_POLE_FILTER( NoiseOutput,
                     Noise,
                     p3_Delay_1,
                     p3_Delay_2,
                     p3_a1,
                     p3_a2,
                     p3_b0 );

    Output = NoiseOutput - Output;

    /******************************************************************/
    /*  Second Formant of Parallel Vocal Tract.                       */
    /******************************************************************/

    TWO_POLE_FILTER( NoiseOutput,
                     Noise,
                     p2_Delay_1,
                     p2_Delay_2,
                     p2_a1,
                     p2_a2,
                     p2_b0 );

    Output = NoiseOutput - Output;

    /******************************************************************/
    /*  Add bypass noise.                                             */
    /******************************************************************/

    Output = BypassNoiseGain * Noise - Output;

    /******************************************************************/
    /*  Perform scaling and clipping for 16 bit output.               */
    /******************************************************************/

    Output = Output * OutputScaleFactor;

    if ( Output > 32767.0 )
      Output = 32767.0;
    else
      if ( Output < -32768.0 )
        Output = -32768.0;

    iwave[uiNs] = (S16_T)( Output );
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
  static SPD_CHIP * pSpeakerDefinition;
  static int iDeltaGainInDB;

  /********************************************************************/
  /*  Variables to hold the speaker definition.                       */
  /********************************************************************/

  static FLTPNT_T f4c;  /*  Frequency of fixed cascade 4th formant    */
  static FLTPNT_T b4c;  /*  Bandwidth of fixed cascade 4th formant    */
  static FLTPNT_T f5c;  /*  Frequency of fixed cascade 5th formant    */
  static FLTPNT_T b5c;  /*  Bandwidth of fixed cascade 5th formant    */
  static FLTPNT_T f4p;  /*  Frequency of fixed parallel 4th formant   */
  static FLTPNT_T b4p;  /*  Bandwidth of fixed parallel 4th formant   */
  static FLTPNT_T f5p;  /*  Frequency of fixed parallel 5th formant   */
  static FLTPNT_T b5p;  /*  Bandwidth of fixed parallel 5th formant   */
  static FLTPNT_T f6p;  /*  Frequency of fixed parallel 6th formant   */
  static FLTPNT_T b6p;  /*  Bandwidth of fixed parallel 6th formant   */
  static FLTPNT_T fnp;  /*  Frequency of fixed nasal formant          */
  static FLTPNT_T bnp;  /*  Bandwidth of fixed nasal formant          */
  static FLTPNT_T flp;  /*  Freq. of fixed glottal decimating filter  */
  static FLTPNT_T blp;  /*  BW of fixed glottal decimating filter     */
  static FLTPNT_T rlpg; /*  Gain of down-sampling low-pass filter     */

  static S16_T avg;     /*  Gain factor for voicing                   */
  static S16_T abrg;    /*  Gain factor for breathiness               */
  static S16_T apg;     /*  Gain factor for aspiration                */
  static S16_T afg;     /*  Gain factor for frication                 */
  static S16_T rnpg;    /*  Gain factor for nasal pole resonator      */
  static S16_T a5gain;  /*  Gain in dB for the 5th cascade resonator. */
  static S16_T a4gain;  /*  Gain in dB for the 4th cascade resonator. */
  static S16_T a3gain;  /*  Gain in dB for the 3rd cascade resonator. */
  static S16_T a2gain;  /*  Gain in dB for the 2nd cascade resonator. */
  static S16_T a1gain;  /*  Gain in dB for the 1st cascade resonator. */

  static FLTPNT_T c3_gain;  /*  Gain factor for cascade 3rd formant   */
  static FLTPNT_T c2_gain;  /*  Gain factor for cascade 2nd formant   */
  static FLTPNT_T c1_gain;  /*  Gain factor for cascade 1st formant   */

  /********************************************************************/
  /* Variables used by macro DESIGN_TWO_POLE_FILTER()                 */
  /********************************************************************/

  static FLTPNT_T Freq;
  static FLTPNT_T BW;
  static FLTPNT_T Radius;
  static FLTPNT_T Temp;

  pSpeakerDefinition = (SPD_CHIP *)&parambuff[1];

  /********************************************************************/
  /*  Constants used in Random number generation and noise filtering. */
  /********************************************************************/

  RandomMultiplier = 20077;
  RandomAddend = 12345;
  Noise_b1 = -0.711181640625;
  Noise_b2 = 0.365966796875;

  /********************************************************************/
  /*  Parallel 6th formant.                                           */
  /*  Resonator constant "p6_b0" is set in function                   */
  /*  speech_waveform_generator() from A6inDB.                        */
  /*  f6p = 4884.0 Hz. and b6p = 1145.0 Hz.                           */
  /*  It is not necessary to change these with a nominal change in    */
  /*  sample rate.                                                    */
  /********************************************************************/

  p6_a1 = -1.39208984375;
  p6_a2 = -0.487060546875;

  /********************************************************************/
  /*  Coefficients for fixed nasal formant.                           */
  /*  Gain parameter "NasalResonator_b0" is set below by speaker      */
  /*  definition parameter "rnpg". Note possible future change, this  */
  /*  could vary from speaker to speaker.                             */
  /********************************************************************/

  fnp = 300.0;
  bnp = 80.0;

  DESIGN_TWO_POLE_FILTER( NasalResonator_a1,
                          NasalResonator_a2,
                          Temp,
                          fnp,
                          bnp );

  /********************************************************************/
  /*  Coefficients for fixed downsampling low-pass filter             */
  /********************************************************************/

  if ( SampleRate < 9500.0 )
  {
    flp = 948.0;
    blp = 800.0;
  }
  else
  {
    flp = 948.0;
    blp = 615.0;
  }

  rlpg = 0.5859375;

  DESIGN_TWO_POLE_FILTER( LowPass_a1, LowPass_a2, LowPass_b0, flp, blp );

  LowPass_b0 = 2.0 * LowPass_b0 * rlpg;

  /********************************************************************/
  /*  Begin set coeficients of speaker-def controlled resonators.     */
  /*  Cascade fourth formant                                          */
  /********************************************************************/

  f4c = pSpeakerDefinition->r4cb;   /*  1                             */
  b4c = pSpeakerDefinition->r4cc;   /*  2                             */

  DESIGN_TWO_POLE_FILTER( c4_a1, c4_a2, Temp, f4c, b4c );

  /********************************************************************/
  /*  Cascade fifth formant                                           */
  /********************************************************************/

  f5c = pSpeakerDefinition->r5cb;   /*  3                             */
  b5c = pSpeakerDefinition->r5cc;   /*  4                             */

  DESIGN_TWO_POLE_FILTER( c5_a1, c5_a2, Temp, f5c, b5c );

  /********************************************************************/
  /*  Parallel fourth formant                                         */
  /********************************************************************/

  f4p = pSpeakerDefinition->r4pb;   /*  5                             */
  b4p = 400.0;

  DESIGN_TWO_POLE_FILTER( p4_a1, p4_a2, Temp, f4p, b4p );

  /********************************************************************/
  /*  Parallel fifth formant                                          */
  /********************************************************************/

  f5p = pSpeakerDefinition->r5pb;    /*  6                            */
  b5p = 500.0;

  DESIGN_TWO_POLE_FILTER( p5_a1, p5_a2, Temp, f5p, b5p );

  /********************************************************************/
  /*  End of set coeficients of speaker definition controlled         */
  /*  resonators.                                                     */
  /********************************************************************/

  /********************************************************************/
  /*  The following parameter deleted 12-JUL-85                       */
  /*  TLToff = pSpeakerDefinition->tltoff;  7                         */
  /********************************************************************/

  /********************************************************************/
  /*  Jitter parameter converted to negative if T0Jitter currently    */
  /*  negative.                          8                            */
  /********************************************************************/

  if ( T0Jitter < 0 )
    T0Jitter = - Q12_INVERSE_SCALE * (FLTPNT_T)pSpeakerDefinition->t0jit;
  else
    T0Jitter = Q12_INVERSE_SCALE * (FLTPNT_T)pSpeakerDefinition->t0jit;

  /********************************************************************/
  /*  Gains of cascade resonators.                                    */
  /********************************************************************/

  a5gain = pSpeakerDefinition->r5ca;    /*  9                         */
  a4gain = pSpeakerDefinition->r4ca;    /*  10                        */
  a3gain = pSpeakerDefinition->r3ca;    /*  11                        */
  a2gain = pSpeakerDefinition->r2ca;    /*  12                        */
  a1gain = pSpeakerDefinition->r1ca;    /*  13                        */

  if ( SampleRate < 9500.0 )
  {
    c5_b0 = 1.0;
    c4_b0 = 0.6309573448 * dBtoLinear[a4gain];
  }
  else
  {
    c5_b0 = dBtoLinear[a5gain];
    c4_b0 = dBtoLinear[a4gain];
  }
  
  c3_gain = dBtoLinear[a3gain];
  c2_gain = dBtoLinear[a2gain];
  c1_gain = dBtoLinear[a1gain];

  /********************************************************************/
  /*  Constants that determine the duration of the open phase of the  */
  /*  glottal period.                                                 */
  /********************************************************************/

  k1 = Q12_INVERSE_SCALE *
    (FLTPNT_T)pSpeakerDefinition->nopen1; /* 14                         */
  k2 = Q12_INVERSE_SCALE *
    (FLTPNT_T)pSpeakerDefinition->nopen2; /* 15                         */

  /********************************************************************/
  /*  Breathiness coefficient.                                        */
  /*  Scale up by 8 to correct for a frac4mul() of this Q15 gain.     */
  /*  Apply arbitrary scale factor of 0.125 to all Speaker gains.     */
  /********************************************************************/

  abrg = pSpeakerDefinition->aturb;     /*  16                        */
  SpeakerBreathinessGain = 4.0 * dBtoLinear[abrg];

  /********************************************************************/
  /*  T0range = pSpeakerDefinition->f0scale;  17  (Not used)    */
  /********************************************************************/

  /********************************************************************/
  /*  Scale factor for variable formants F1inHZ, F2inHZ, and F3inHZ.  */
  /********************************************************************/

  FormantScale =
    Q12_INVERSE_SCALE * (FLTPNT_T)pSpeakerDefinition->fnscale;
                                        /*  18                        */

  /********************************************************************/
  /*  Overall gain of frication source relative to other sources.     */
  /*  Apply arbitrary scale factor of 0.125 to all Speaker gains.     */
  /********************************************************************/

  afg = pSpeakerDefinition->afgain;     /*  19                        */
  SpeakerFricationGain = dBtoLinear[afg];

  if ( SampleRate < 9500.0 )
    SpeakerFricationGain *= 20;

  /********************************************************************/
  /*  Gain of the nasal pole resonator of cascade filter section.     */
  /********************************************************************/

  rnpg = pSpeakerDefinition->rnpgain;   /*  20                        */
  NasalResonator_b0 = dBtoLinear[rnpg];

  /********************************************************************/
  /*                                                                  */
  /*  Combine most of the cascade path gains. It must now be done     */
  /*  this way to stay compatible with the driver for the integer     */
  /*  version of the vocal tract model. In the integer vocal tract    */
  /*  model all of the filter gains are scaled up by 2. They are not  */
  /*  scaled up by two in macro DESIGN_TWO_POLE_FILTER() so the       */
  /*  following gain corrections must be applied to the cascade path. */
  /*  Also the new Nasal anti-resonator gain is equal to 1.0. The     */
  /*  integer vocal tract model nasal anti-resonator had a gain of    */
  /*  88. Thus the Partial Cascade Path Gain also contains speaker    */
  /*  defined gains of cascade formant 4, cascade formant 5, and      */
  /*  finally the speaker defined gain of the nasal resonator.        */
  /*  Scale up by 8 to correct for a frac4mul() of this Q15 gain.     */
  /*                                                                  */
  /*  items.                                                          */
  /*                                                                  */
  /*    ITEM             GAIN CORRECTION                              */
  /*                                                                  */
  /*    c1_b0 extra factor of 2.0 (c1_b0 scaled up in integer model.) */
  /*    c1_gain               2.0                                     */
  /*    c2_gain               2.0                                     */
  /*    c3_gain               2.0                                     */
  /*    Nasal Anti-Resonator  88.0                                    */
  /*    Nasal Resonator      NasalResonator_b0                        */
  /*    c4_b0                                                         */
  /*    c5_b0                                                         */
  /*                                                                  */
  /********************************************************************/

  PartialCascadePathGain = 4264.0 * c1_gain * c2_gain * c3_gain
    * c4_b0 * c5_b0 * NasalResonator_b0;

  /********************************************************************/
  /*  Overall gain of the voicing source relative to other sources.   */
  /*  Scale up by 16 to correct for the differentiated glottal pulse  */
  /*  generator. The pulse generator in this model produces a         */
  /*  waveform that is scaled down by 16 relative to the integer      */
  /*  vocal tract model. (This saves one multiply per sample at 4     */
  /*  the output sample rate ).                                       */
  /*  Scale up by 8 to correct for a frac4mul() of this Q15 gain.     */
  /*  Apply arbitrary scale factor of 0.125 to all Speaker gains.     */
  /********************************************************************/

  avg = pSpeakerDefinition->azgain;     /*  21                        */
  SpeakerVoicingGain = 16.0 * dBtoLinear[avg];

  /********************************************************************/
  /*  Overall gain of aspiration source relative to other sources.    */
  /*  Scale up by 8 to correct for a frac4mul() of this Q15 gain.     */
  /*  Apply arbitrary scale factor of 0.125 to all Speaker gains.     */
  /********************************************************************/

  apg = pSpeakerDefinition->apgain;     /*  22                        */
  SpeakerAsperationGain = 8.0 * dBtoLinear[apg];

  /********************************************************************/
  /*  Calculate the output scale factor based on the delta gain in dB */
  /********************************************************************/

  iDeltaGainInDB = (int)pSpeakerDefinition->osgain;

  OutputScaleFactor = OUTPUT_SCALE_FACTOR;

  if ( iDeltaGainInDB <= 0 )
  {
    OutputScaleFactor =
      OutputScaleFactor * dBtoLinear[87+iDeltaGainInDB];
  }
  else
  {
    OutputScaleFactor =
      OutputScaleFactor / dBtoLinear[87-iDeltaGainInDB];
  }

  /********************************************************************/
  /*  Get the current speaker value so that it may be returned by     */
  /*  function TextToSpeechGetSpeaker().                              */
  /********************************************************************/

  uiCurrentSpeaker = (unsigned int)pSpeakerDefinition->speaker;

  return;
}

/**********************************************************************/
/**********************************************************************/
/*  Function to Set the Sample Rate the vocal tract model outputs.    */
/**********************************************************************/
/**********************************************************************/

extern short last_voice;

void SetSampleRate( unsigned int uiSampRate )
{
  /********************************************************************/
  /*  Calculate the model sample dependant parameters.                */
  /********************************************************************/

  uiSampleRate = uiSampRate;
  SampleRate = (FLTPNT_T)uiSampleRate;
  SampleRateScale = SampleRate * 0.0001;
  InverseSampleRateScale = 1.0 / SampleRateScale;
  MaximumFrequency = MAXIMUM_FREQUENCY_SCALING * SampleRate;
  uiNumberOfSamplesPerFrame =
    (unsigned int)( SampleRate * FRAME_TIME_IN_MSEC + 0.5 );

  /********************************************************************/
  /*  Update the speaker definition for the new sample rate.          */
  /********************************************************************/

/* 03-Apr-1995 CJL Comment out Alpha features.*/
/*  KS.async_voice = last_voice;*/
/*  KS.async_change |= ASYNC_voice;*/

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: InitializeVTM                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: September 27, 1993                                          */
/*                                                                    */
/*  Floating Point Vocal Tract Model Initialization                   */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void InitializeVTM()
{
  static S16_T *variabpars;

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
  delr1b = 0.5 * ( F1inHZ * F1inHZ );
  c1_a2 += (F1inHZ);
  c1_a1 -= (delr1b + (F1inHZ));
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
  if ( uiVoicePeriodSampleNumber == iNumOpenSamples )
{
  c1_a2 -= (F1inHZ);
  c1_a1 += (delr1b + (F1inHZ));
}
*/

#ifndef DECVOC

doit()
{
/*insert function from decvoc.c */
}

#endif

