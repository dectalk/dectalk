/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995,1998. All rights reserved.
 * Copyright (c)        1984                    by Dennis H. Klatt
 * Copyright (c) 1984 Digital Equipment Corporation, Maynard, Mass.
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
 *    File Name:	vtm_f.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *                DECtalk Vocal Tract Model, Floating point version
 *
 ***********************************************************************
 *    Revision History:
 *   1.  1-Sep-84 DK  Initial creation
 *   2. 17-Jan-85 DK  Add "multi-pulse" excitation
 *                    (currently disabled).
 *   3. 19-Feb-85 DK  New Code: Change meaning of TILT to
 *                    "spread glottis".
 *   4. 10-Mar-85 DK  Reorganize to look more like code used on chip.
 *   5. 16-Apr-85 DK  Set R6PB = -3728, R6PC = -851
 *                    ( F = 4900, BW = 2500 )
 *   6. 30-Apr-85 DK  Boost gain in cascade F1 to better avoid limit
 *                    cycles. Try new random number generator.
 *   7. 13-Jul-85 DK  Do not modulate breathiness noise, make glottal
 *                    closure occur at end of a period, --> T0
 *                    continuous when NOPEN changes, fix lptilt()
 *                    (MAJOR ERROR), also delete spdef par TILToff.
 *   8. 15-Jul-85 DK  TEMPORARY CHANGES FOR FIGURE GENERATION.
 *                    see SHOW_VOICING.
 *   9. 22-Jul-85 DK  Add print statements for comparison with SPC
 *                    code.
 *  10. 24-Jul-85 DK  Add small constant to output to avoid sign-bit
 *                    noise. Use new variable "AVlind" to delay
 *                    change in AV.
 *  11. 29-Jul-85 DK  Make sure R1ca does not overflow alotted bits.
 *  12. 10-Oct-92 BH  Clearly separated comments from code and
 *                    added a consistent indentation style.
 *                    Removed the changes added in 8 (SHOW_VOICING).
 *                    Added in-line functions for filtering. The new
 *                    functions are:
 *                    TWO_ZERO_FILTER and TWO_POLE_FILTER.
 *                    Set f6p and b6p to get the correct values for
 *                    p6_a1 and p6_a2.
 *  13. 11-Feb-93 BH  Re-wrote to use floating point. The nasal
 *                    anti-resonator and the nasal resonator were
 *                    merged into one biquadratic filter. All filters
 *                    are now in-line macros defined in include file
 *                    "mfilter.h". Filter gains have been combined
 *                    and/or moved around. There are a lot of
 *                    gain multipliers which are only needed to stay
 *                    compatible with the integer Vocal Tract Model
 *                    driver code.
 *  14. 11-Mar-80 ??  Modified version of synthesizer described in
 *						J. Acoust. Soc. Am., Mar. 1980. -- new voicing
 *						source.
 *  15. 03-Apr-95 CJL File was fvtm.c. Is now vtm_f.c
 *  16.	25mar98	tek		FVTM Integration (file now vtm_fa.c)
 *  17. 05/22/1998 MGS changed case of TTS.H for __osf__
 */

#include "dectalkf.h"

#ifdef FP_VTM // control who gets compiled with this define

/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/

#include <stdio.h>
#include <math.h>
#include "port.h"
/* changed case of TTS.H to tts.h for __osf__ */
#include "tts.h"

#include "vtm_fp.h"
#include "vtm_fdef.h"
//#include "vfport.h"
#include "vfphdefs.h"
#include "vtm_f.h"       /*  Variables used by the vocal tract model   */
#include "vtmtabf.h"     /*  Tables used by the vocal tract model      */
#include "vfmfiltr.h"    /*  Filters Macros                            */
#include "vfmd2pol.h"    /*  Two pole filter design Macro              */
#include "vtminst.h"

/**********************************************************************/
/*  Symbol Definitions.                                               */
/**********************************************************************/
//
// in order to make the actual parameters in the filter macros
// somewhat independent, we'll paper over them with what is the
// REAL definition within this file..
#if 1
#define SampleRateScale (vtmLocal.fSampleRateScale)
#define FormantScale (vtmLocal.fFormantScale)
#define InverseSampleRateScale (vtmLocal.fInverseSampleRateScale)
#define MaximumFrequency (vtmLocal.fMaximumFrequency)
#else
#define SampleRateScale (pVtm_t->fSampleRateScale)
#define FormantScale (pVtm_t->fFormantScale)
#define InverseSampleRateScale (pVtm_t->fInverseSampleRateScale)
#define MaximumFrequency (pVtm_t->fMaximumFrequency)
#endif //0

#define  OUTPUT_SCALE_FACTOR        8.0
#define  MAXIMUM_FREQUENCY_SCALING  0.45
#define  FRAME_TIME_IN_MSEC         0.0064
#define  NOISE_TILT_A1              0.75
#define  Q12_INVERSE_SCALE          0.000244140625
  /********************************************************************/
  /*  Constants used in Random number generation and noise filtering. */
  /********************************************************************/

#define  RandomMultiplier  (20077)
#define  RandomAddend  (12345)
#define  Noise_b1  (-0.711181640625)
#define  Noise_b2  (0.365966796875)



  /********************************************************************/
  /*  Parallel 6th formant.                                           */
  /*  Resonator constant "p6_b0" is set in function                   */
  /*  speech_waveform_generator() from A6inDB.                        */
  /*  f6p = 4884.0 Hz. and b6p = 1145.0 Hz.                           */
  /*  It is not necessary to change these with a nominal change in    */
  /*  sample rate.                                                    */
  /********************************************************************/

#define  p6_a1 (-1.39208984375)
#define  p6_a2 (-0.487060546875)

  /********************************************************************/
  /*  Coefficients for fixed nasal formant.                           */
  /*  Gain parameter "NasalResonator_b0" is set below by speaker      */
  /*  definition parameter "rnpg". Note possible future change, this  */
  /*  could vary from speaker to speaker.                             */
  /********************************************************************/

#define  FNP (290.0)
#define  BNP (80.0)

/**********************************************************************/
/* Global variable used by macro DESIGN_TWO_POLE_FILTER()             */
/**********************************************************************/

//FLTPNT_T MaximumFrequency = DEFAULT_MAXIMUM_FREQUENCY;

void DumpInstanceData( LPTTS_HANDLE_T phTTS);
/**********************************************************************/
/**********************************************************************/
/*  speech_waveform_generator                                         */
/**********************************************************************/
/**********************************************************************/

void speech_waveform_generator(LPTTS_HANDLE_T phTTS)
{
  /********************************************************************/
  /*  Counters                                                        */
  /********************************************************************/
#define SWG_INIT_VALUE (12345)
                 /*  Current loc in voicing period at 4 * Fs       */
  int nsr4=SWG_INIT_VALUE;  /*  Counter of 4 samples in glottal source loop   */
  int Index=SWG_INIT_VALUE;
  unsigned int uiNs=SWG_INIT_VALUE;	// position within frame
  // local variables from the speech packet
  S16_T AVinDB=SWG_INIT_VALUE;     /*  Amp of voicing in dB,        0 to   70 */
  S16_T APinDB=SWG_INIT_VALUE;     /*  Amp of aspiration in dB,     0 to   70 */
  S16_T A2inDB=SWG_INIT_VALUE;     /*  Amp of F2 frication in dB,   0 to   80 */
  S16_T A3inDB=SWG_INIT_VALUE;     /*  Amp of F3 frication in dB,   0 to   80 */
  S16_T A4inDB=SWG_INIT_VALUE;     /*  Amp of F4 frication in dB,   0 to   80 */
  S16_T A5inDB=SWG_INIT_VALUE;     /*  Amp of F5 frication in dB,   0 to   80 */
  S16_T A6inDB=SWG_INIT_VALUE;     /*  Amp of F6                    0 to   80 */
  S16_T ABinDB=SWG_INIT_VALUE;     /*  Amp of bypass fric. in dB,   0 to   80 */
  S16_T TiltInDB=SWG_INIT_VALUE;   /*  Voicing spectral tilt in dB, 0 to   24 */
  
  FLTPNT_T F1inHZ=SWG_INIT_VALUE;  /*  First formant in Hz,       200 to 1300 */
  FLTPNT_T F2inHZ=SWG_INIT_VALUE;  /*  Second formant in Hz,      550 to 3000 */
  FLTPNT_T F3inHZ=SWG_INIT_VALUE;  /*  Third formant in Hz,      1200 to 4800 */
  FLTPNT_T FZinHZ=SWG_INIT_VALUE;  /*  Nasal zero in Hz,          248 to  528 */
  FLTPNT_T B1inHZ=SWG_INIT_VALUE;  /*  First formant bw in Hz,     40 to 1000 */
  FLTPNT_T B2inHZ=SWG_INIT_VALUE;  /*  Second formant bw in Hz,    40 to 1000 */
  FLTPNT_T B3inHZ=SWG_INIT_VALUE;  /*  Third formant bw in Hz,     40 to 1000 */
  int T0inS4=SWG_INIT_VALUE;  /*  Pitch period ( pitch from 50 to 165 )  */
#ifdef NEW_VTM
  FLTPNT_T FNPinHZ;
   int Glot_step;
  FLTPNT_T glotnoise;
#endif


  FLTPNT_T p2_b0=SWG_INIT_VALUE;
  FLTPNT_T p2_a1=SWG_INIT_VALUE;
  FLTPNT_T p2_a2=SWG_INIT_VALUE;
  FLTPNT_T p3_b0=SWG_INIT_VALUE;
  FLTPNT_T p3_a1=SWG_INIT_VALUE;
  FLTPNT_T p3_a2=SWG_INIT_VALUE;
  FLTPNT_T p4_b0=SWG_INIT_VALUE;
  FLTPNT_T p5_b0=SWG_INIT_VALUE;
  FLTPNT_T p6_b0=SWG_INIT_VALUE;
  
  FLTPNT_T p3_gain=SWG_INIT_VALUE;  /*  Gain factor for parallel 3rd formant  */
  FLTPNT_T p2_gain=SWG_INIT_VALUE;  /*  Gain factor for parallel 2nd formant  */


  FLTPNT_T b2p=SWG_INIT_VALUE;  /*  Bandwidth of parallel 2th formant         */
  FLTPNT_T b3p=SWG_INIT_VALUE;  /*  Bandwidth of parallel 3th formant         */

  FLTPNT_T AsperationGain=SWG_INIT_VALUE;
  FLTPNT_T BypassNoiseGain=SWG_INIT_VALUE;

  FLTPNT_T Noise=SWG_INIT_VALUE;       /*  Output of Random number generator  */
  FLTPNT_T NoiseOutput=SWG_INIT_VALUE; /*  Output of parallel resonators      */
  FLTPNT_T Output=SWG_INIT_VALUE;      /*  Output signal from the VTM         */



  //S16_T RandomNumber=SWG_INIT_VALUE;  /*  Varible used by random number generator   */

  int iTemp;

  static S16_T *variabpars;
  PVTM_T pVtm_t = phTTS->pVTMThreadData;
  VTM_T vtmLocal;	// a place to keep instance variables while we're inside
					// this routine.. for performance..
  /********************************************************************/
  /* Variables used by macro DESIGN_TWO_POLE_FILTER()                 */
  /********************************************************************/

  FLTPNT_T Freq=SWG_INIT_VALUE;	
  FLTPNT_T BW=SWG_INIT_VALUE;		
  FLTPNT_T Radius=SWG_INIT_VALUE;	
  FLTPNT_T Temp=SWG_INIT_VALUE;	

  memcpy(&vtmLocal,pVtm_t,sizeof(VTM_T)); // fill up the local copy

  DumpInstanceData(phTTS);

  /********************************************************************/
  /********************************************************************/
  /*  Read variable parameters for one frame of speech. The frame     */
  /*  time is defined by constant FRAME_TIME_IN_MSEC.                 */
  /*  18 words are read. Voice excited parameters are updated pitch   */
  /*  synchronously to avoid waveform glitches.                       */
  /********************************************************************/
  /********************************************************************/

  variabpars = &vtmLocal.parambuff[1];

  // tek 30mar98 copy this code from the integer VTM..
  // this basically papers over the fact that the PH code doesn't init correctly
  // on a speakerdef,a nd tries to smooth some things it shouldn't. So, we
  // ignore the first (one?) packets after a speakerdef.

  if( vtmLocal.ldspdef != 0)
  {
    vtmLocal.ldspdef++;
   variabpars[OUT_AV]=-4; // results in zero
   variabpars[OUT_AP]=-10; // results in zer0
   variabpars[OUT_A2]=0;
   variabpars[OUT_A3]=0;
   variabpars[OUT_A4]=0;
   variabpars[OUT_A5]=0;
   variabpars[OUT_A6]=0;
   variabpars[OUT_AB]=0;
	if ( vtmLocal.ldspdef > 1) // this constant sets the # of packets to ignore.
	{
		 vtmLocal.ldspdef = 0;
	}
  }

  /********************************************************************/
  /* This is a time, so it should be scaled if fs != 10K.             */
  /********************************************************************/

  T0inS4 =(int)( SampleRateScale * (FLTPNT_T)variabpars[OUT_T0]);

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



  AsperationGain = vtmLocal.SpeakerAsperationGain * dBtoLinear[APinDB + 10];

  if ( vtmLocal.SampleRate < 9500 )
  {
    p2_gain = vtmLocal.SpeakerFricationGain * dBtoLinear[A2inDB + 12];
    p3_gain = vtmLocal.SpeakerFricationGain * dBtoLinear[A3inDB + 10];
    p4_b0 = vtmLocal.SpeakerFricationGain * dBtoLinear[A4inDB + 13];
    p6_b0 = vtmLocal.SpeakerFricationGain * dBtoLinear[A6inDB + 5];
	// tek 24mar98 why is there no p5 here? I think we need one.
	// I have no idea what the constant should be.
    p5_b0 = vtmLocal.SpeakerFricationGain * dBtoLinear[A5inDB + 5];
  }
  else
  {
    p2_gain = vtmLocal.SpeakerFricationGain * dBtoLinear[A2inDB + 12];
    p3_gain = vtmLocal.SpeakerFricationGain * dBtoLinear[A3inDB + 10];
    p4_b0 = vtmLocal.SpeakerFricationGain * dBtoLinear[A4inDB + 7];
    p5_b0 = vtmLocal.SpeakerFricationGain * dBtoLinear[A5inDB + 6];
    p6_b0 = vtmLocal.SpeakerFricationGain * dBtoLinear[A6inDB + 5];
  }

  BypassNoiseGain = vtmLocal.SpeakerFricationGain * dBtoLinear[ABinDB + 5];
#ifdef NEW_VTM
  /* Isn't really used yet but needs to be left in for compatibility 
  it's a place holder EAB 5/27/98*/
	FNPinHZ=variabpars[OUT_FNP];
	Glot_step = variabpars[OUT_GS];
#endif

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

  //RandomNumber = vtmLocal.randomx; // tek 24mar98 keep this local

  for ( uiNs = 0; uiNs < vtmLocal.uiNumberOfSamplesPerFrame; uiNs++ )
  {
    /******************************************************************/
    /******************************************************************/
    /*  NOISE GENERATOR FOR FRICATION AND ASPIRATION                  */
    /******************************************************************/
    /******************************************************************/

    vtmLocal.randomx = vtmLocal.randomx * RandomMultiplier + RandomAddend;
    Noise = 0.25 * (FLTPNT_T)vtmLocal.randomx;

    /******************************************************************/
    /*  Tilt down aspiration noise spectrum at high freqs by low-pass */
    /*  filtering.                                                    */
    /******************************************************************/

    MINIMUM_ONE_POLE_FILTER( Noise,
                             Noise,
                             vtmLocal.NoiseTiltDelay,
                             NOISE_TILT_A1 );

    /******************************************************************/
    /*  Filter with Pi-rotated anti-resonator. (This is the same as   */
    /*  an ordinary anti-resonator except for the b1 coefficient has  */
    /*  it's sign flipped). Frequency = 3500, Bandwidth = 1600.       */
    /******************************************************************/

    MINIMUM_TWO_ZERO_FILTER( NoiseOutput,
                             Noise,
                             vtmLocal.NoiseDelay_1,
                             vtmLocal.NoiseDelay_2,
                             Noise_b1,
                             Noise_b2 );
    Noise = NoiseOutput;

    /******************************************************************/
    /*  Amplitude modulate the noise. Reduce noise amplitude during   */
    /*  the second half of the glottal period if                      */
    /*  LaryngealSourceGain" > 0.0. Otherwise                         */
    /*  iPositionToStartNoiseModulation is set to 0.                  */
    /******************************************************************/

    if ( vtmLocal.uiVoicePeriodSampleNumber < vtmLocal.iPositionToStartNoiseModulation )
      Noise = 0.5 * Noise;

    /******************************************************************/
#ifdef ACI_LICENSE
	doit();
#else //ACI_LICENSE
    for ( nsr4 = 0; nsr4 < 4; nsr4++ )
    {
      /****************************************************************/
      /*  Future upgrade ?                                            */
      /*  When glottis closes, reduce F1 and B1.                      */
      /****************************************************************/

#ifdef  F1_B1_UPGRADE

      f1_b1_down();
#endif

      /****************************************************************/
      /*  Compute next value of voicing wave. Calculate glottal pulse */
      /*  at 4 times output sample rate to minimize the quantization  */
      /*  of the glottal period. The voicing waveform has a fixed     */
      /*  waveshape defined by the equation:    2    3                */
      /*                                      at - bt                 */
      /*                                                              */
      /*  Delay a "LaryngealSourceGain" change.                       */
      /****************************************************************/

      if ( vtmLocal.uiVoicePeriodSampleNumber > ((int)vtmLocal.T0 - vtmLocal.iNumOpenSamples ))
      {
        vtmLocal.a -= vtmLocal.b;
        vtmLocal.DifferentiatedGlottalFlow += vtmLocal.a;
        vtmLocal.LaryngealSourcePitchSyncGain = vtmLocal.LaryngealSourceGain;
#ifdef NEW_VTM
		if(vtmLocal.LaryngealSourcePitchSyncGain > 40 && glotnoise == 0)
		{
			glotnoise= vtmLocal.SpeakerBreathinessPitchSyncGain *32000;
		}
#endif

      }
      else
      {
#ifdef NEW_VTM
		   /* EAB 4/26/98 When glot_step is a big number, much greater then 10 it represents a more sinusoidal type of vocaliztion
		  and when it is 10 or less it represents an exponential decay which is similar to instantaneous closure in males
		  but with less high frequency energy as seen in many female voice and some males*/

		  if(Glot_step)
			{
				if(vtmLocal.DifferentiatedGlottalFlow <Glot_step)
				{
					if (Glot_step < 4)
					{
					//	vtmLocal.DifferentiatedGlottalFlow -=  (vtmLocal.DifferentiatedGlottalFlow >>Glot_step);
					}
					else
					{
					vtmLocal.DifferentiatedGlottalFlow += Glot_step;
					}
				}else 
					vtmLocal.DifferentiatedGlottalFlow  = 0;

			/* exponential decay could cause a long dc build up, beside I'm assuming physiologically
				that at some point the cords just collapse trying 2000 for that figure 4/27/98*/

				if(vtmLocal.DifferentiatedGlottalFlow > -2000)
				{
					vtmLocal.DifferentiatedGlottalFlow  = 0;
				}

			}
			else 


				vtmLocal.DifferentiatedGlottalFlow  = 0;


#else
        vtmLocal.DifferentiatedGlottalFlow = 0.0;
#endif /*NEW_VTM*/
      }

      /****************************************************************/
      /*  Perform pitch synchronous update of some parameters. The    */
      /*  parameter update is performed at the sample before the      */
      /*  glottis opens.                                              */
      /****************************************************************/

      if ( vtmLocal.uiVoicePeriodSampleNumber == (int)vtmLocal.T0 )
      {
        /**************************************************************/
        /*  Reset period when 'uiVoicePeriodSampleNumber' reaches T0, */
        /*  when the glottis about to open                            */
        /**************************************************************/

        vtmLocal.uiVoicePeriodSampleNumber = 0;

        /**************************************************************/
        /*  LaryngealSourceGain moved to LaryngealSourcePitchSyncGain */
        /*  after half of a pitch period.                             */
        /*  Include the gain of the downsampling low pass filter in   */
        /*  LaryngealSourceGain to stay compatible with the integer   */
        /*  vocal tract model. Scale up by 8 to correct for a         */
        /*  frac4mul() of this Q15 gain.                              */
        /**************************************************************/

        vtmLocal.LaryngealSourceGain = 8.0 * dBtoLinear[AVinDB + 4];

        vtmLocal.T0 = T0inS4;          /*  T0inS4 remembers period in case     */
                              /*  more than 1 period in cur. frame.   */
        iTemp = vtmLocal.T0Jitter * vtmLocal.T0; ;  /*  Add jitter, if any.              */
        vtmLocal.T0 +=  iTemp;
        vtmLocal.T0Jitter = - vtmLocal.T0Jitter;  /*  Cause jitter to alternate.        */

        /**************************************************************/
        /*  SpeakerBreathinessPitchSyncGain is the Speaker definition */
        /*  breathiness coeficient                                    */
        /**************************************************************/

        vtmLocal.SpeakerBreathinessPitchSyncGain = vtmLocal.SpeakerBreathinessGain;

        /**************************************************************/
        /*  Calculate the coefficients of a one pole filter (decay    */
        /*  averager) which will be used to tilt the spectrum of the  */
        /*  glottal source down by TiltInDB dB at 3 kHz.              */
        /**************************************************************/

        vtmLocal.GlottalSourceTilt_a1 = 0.0333862304 * (FLTPNT_T)TiltInDB;

        if ( vtmLocal.GlottalSourceTilt_a1 >= 0.0 )
          vtmLocal.GlottalSourceTilt_b0 = 1.0 - vtmLocal.GlottalSourceTilt_a1;
        else
          vtmLocal.GlottalSourceTilt_b0 = 1.0;

        /**************************************************************/
        /*  Scale the glottal waveform using the speaker dependant    */
        /*  parameter "SpeakerVoicingGain". Include the gain of the   */
        /*  decimation low pass filter here.                          */
        /**************************************************************/

        vtmLocal.GlottalSourceTilt_b0 *= vtmLocal.LowPass_b0 * vtmLocal.SpeakerVoicingGain;

        /**************************************************************/
        /*  Set to "iPositionToStartNoiseModulation" during the       */
        /*  first half of the period. Modulate the amplitude of the   */
        /*  noise if "LaryngealSourceGain" > 0.0.                     */
        /**************************************************************/

        vtmLocal.iPositionToStartNoiseModulation = 0;

        if ( vtmLocal.LaryngealSourceGain > 0.0 )
          vtmLocal.iPositionToStartNoiseModulation = (int)( 0.5 * vtmLocal.T0 );

        /**************************************************************/
        /*  Make the open portion of the differentiated glottal       */
        /*  waveform longer as TiltInDB increases.                    */
        /**************************************************************/

        vtmLocal.iNumOpenSamples = (int)( vtmLocal.k1 * vtmLocal.T0 + vtmLocal.k2);
        vtmLocal.iNumOpenSamples += ( TiltInDB << 2 );

        /**************************************************************/
        /*  Bound the open portion of the glottal waveform.           */
        /**************************************************************/

        if ( vtmLocal.iNumOpenSamples < 40 )
        {
          vtmLocal.iNumOpenSamples = 40;
        }
        else
        {
          if ( vtmLocal.iNumOpenSamples > 263 )
          {
            vtmLocal.iNumOpenSamples = 263;
          }
        }

        if ( vtmLocal.iNumOpenSamples >= (int)( 0.75 * vtmLocal.T0 ))
          vtmLocal.iNumOpenSamples = (int)( 0.75 * vtmLocal.T0 );

        /**************************************************************/
        /*  Reset a & b, which determine shape of glottal waveform.   */
        /**************************************************************/

        vtmLocal.b = 0.0625 * B0[vtmLocal.iNumOpenSamples-40];
        vtmLocal.a = 0.333333333333333 * vtmLocal.b * (FLTPNT_T)vtmLocal.iNumOpenSamples;

        /**************************************************************/
        /*  Calculate coeficients of the variable cascade resonators. */
        /**************************************************************/

        DESIGN_TWO_POLE_FILTER( vtmLocal.c3_a1, vtmLocal.c3_a2, vtmLocal.c3_b0, F3inHZ, B3inHZ );

        DESIGN_TWO_POLE_FILTER( vtmLocal.c2_a1, vtmLocal.c2_a2, vtmLocal.c2_b0, F2inHZ, B2inHZ );

        DESIGN_TWO_POLE_FILTER( vtmLocal.c1_a1, vtmLocal.c1_a2, vtmLocal.c1_b0, F1inHZ, B1inHZ );

        vtmLocal.CascadePathGain = vtmLocal.PartialCascadePathGain * vtmLocal.c3_b0 * vtmLocal.c2_b0 * vtmLocal.c1_b0;

        /**************************************************************/
        /*  Future upgrade ?                                          */
        /*  Set pitch-synchronous changes to F1.                      */
        /**************************************************************/

#ifdef  F1_B1_UPGRADE

        f1_b1_up();
#endif

        /**************************************************************/
        /*  Set coeficients of the nasal zero anti-resonator by table */
        /*  lookup.                                                   */
        /**************************************************************/

        Index = (int)( 0.125 * FZinHZ );

        vtmLocal.Nasal_b0 = Nasal_b0_Table[Index];
        vtmLocal.Nasal_b1 = Nasal_b1_Table[Index];
        vtmLocal.Nasal_b2 = Nasal_b2_Table[Index];
      }

      /****************************************************************/
      /*  Downsampling low-pass filter.                               */
      /*  Decimate the glottal pulse sample rate by 4.                */
      /****************************************************************/

      MINIMUM_TWO_POLE_FILTER( vtmLocal.DifferentiatedVoicing,
                               vtmLocal.DifferentiatedGlottalFlow,
                               vtmLocal.LowPassDelay_1,
                               vtmLocal.LowPassDelay_2,
                               vtmLocal.LowPass_a1,
                               vtmLocal.LowPass_a2 );

      vtmLocal.uiVoicePeriodSampleNumber++;
    }

#endif //ACI_LICENSE


    /******************************************************************/
    /*  Tilt the Glottal Source frequency spectrum down by TiltInDB   */
    /*  dB at 3 kHz, Use a one pole IIR filter (also known as a decay */
    /*  averager). Note that the LowPass_b0 gain term and the         */
    /*  SpeakerVoicingGain are both included in GlottalSourceTilt_b0. */
    /******************************************************************/

    ONE_POLE_FILTER( vtmLocal.DifferentiatedVoicing,
                     vtmLocal.DifferentiatedVoicing,
                     vtmLocal.VoiceTiltDelay,
                     vtmLocal.GlottalSourceTilt_a1,
                     vtmLocal.GlottalSourceTilt_b0 );

    /******************************************************************/
    /*  Add breathiness to voicing.                                   */
    /******************************************************************/
#ifdef NEW_VTM
	{
			/* eab 4/14/98 glotnoise nissing clear to zero to reset*/
	 if(glotnoise > 300)
		 glotnoise -= 300;
	else if(glotnoise > 0)/* eab 4/16/98 for debug kater can be just else*/
		glotnoise = 0;
	vtmLocal.DifferentiatedVoicing += glotnoise * Noise;
	

	}
#else

    vtmLocal.DifferentiatedVoicing += vtmLocal.SpeakerBreathinessPitchSyncGain * Noise;
#endif /*new_vtm*/

    /******************************************************************/
    /*  Apply the variable gain to the breathy voicing.               */
    /******************************************************************/

    vtmLocal.DifferentiatedVoicing *= vtmLocal.LaryngealSourcePitchSyncGain;

    /******************************************************************/
    /*  Add aspiration to the voicing.                                */
    /******************************************************************/

    vtmLocal.DifferentiatedVoicing += AsperationGain * Noise;

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
                        vtmLocal.DifferentiatedVoicing,
                        vtmLocal.NasalDelay_1,
                        vtmLocal.NasalDelay_2,
                        vtmLocal.NasalResonator_a1,
                        vtmLocal.NasalResonator_a2,
                        vtmLocal.Nasal_b0,
                        vtmLocal.Nasal_b1,
                        vtmLocal.Nasal_b2 );

    /******************************************************************/
    /*  Fifth Formant of Cascade Vocal Tract.                         */
    /*  This filter is not used if the sample rate is too low.        */
    /******************************************************************/

    if ( vtmLocal.SampleRate >= 9500 )
    {
      MINIMUM_TWO_POLE_FILTER( Output,
                               Output,
                               vtmLocal.c5_Delay_1,
                               vtmLocal.c5_Delay_2,
                               vtmLocal.c5_a1,
                               vtmLocal.c5_a2 );
    }
    else
    {
      Output = vtmLocal.c5_b0 * Output;
    }

    /******************************************************************/
    /*  Fourth Formant of Cascade Vocal Tract.                        */
    /******************************************************************/

    MINIMUM_TWO_POLE_FILTER( Output,
                             Output,
                             vtmLocal.c4_Delay_1,
                             vtmLocal.c4_Delay_2,
                             vtmLocal.c4_a1,
                             vtmLocal.c4_a2 );

    /******************************************************************/
    /*  Third Formant of Cascade Vocal Tract.                         */
    /******************************************************************/

    MINIMUM_TWO_POLE_FILTER( Output,
                             Output,
                             vtmLocal.c3_Delay_1,
                             vtmLocal.c3_Delay_2,
                             vtmLocal.c3_a1,
                             vtmLocal.c3_a2 );

    /******************************************************************/
    /*  Second Formant of Cascade Vocal Tract.                        */
    /******************************************************************/

    MINIMUM_TWO_POLE_FILTER( Output,
                             Output,
                             vtmLocal.c2_Delay_1,
                             vtmLocal.c2_Delay_2,
                             vtmLocal.c2_a1,
                             vtmLocal.c2_a2 );

    /******************************************************************/
    /*  First Formant of Cascade Vocal Tract                          */
    /*  This filter includes the gain for the cascade path.           */
    /******************************************************************/

    TWO_POLE_FILTER( Output,
                     Output,
                     vtmLocal.c1_Delay_1,
                     vtmLocal.c1_Delay_2,
                     vtmLocal.c1_a1,
                     vtmLocal.c1_a2,
                     vtmLocal.CascadePathGain );

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
                     vtmLocal.p6_Delay_1,
                     vtmLocal.p6_Delay_2,
                     p6_a1,
                     p6_a2,
                     p6_b0 );

    Output = NoiseOutput - Output;

    /******************************************************************/
    /*  Fifth Formant of Parallel Vocal Tract.                        */
    /*  This filter is not used if the sample rate is too low.        */
    /******************************************************************/

    if ( vtmLocal.SampleRate >= 9500 )
    {
      TWO_POLE_FILTER( NoiseOutput,
                       Noise,
                       vtmLocal.p5_Delay_1,
                       vtmLocal.p5_Delay_2,
                       vtmLocal.p5_a1,
                       vtmLocal.p5_a2,
                       p5_b0 );

      Output = NoiseOutput - Output;
    }

    /******************************************************************/
    /*  Fourth Formant of Parallel Vocal Tract.                       */
    /******************************************************************/

    TWO_POLE_FILTER( NoiseOutput,
                     Noise,
                     vtmLocal.p4_Delay_1,
                     vtmLocal.p4_Delay_2,
                     vtmLocal.p4_a1,
                     vtmLocal.p4_a2,
                     p4_b0 );

    Output = NoiseOutput - Output;

    /******************************************************************/
    /*  Third Formant of Parallel Vocal Tract.                        */
    /******************************************************************/

    TWO_POLE_FILTER( NoiseOutput,
                     Noise,
                     vtmLocal.p3_Delay_1,
                     vtmLocal.p3_Delay_2,
                     p3_a1,
                     p3_a2,
                     p3_b0 );

    Output = NoiseOutput - Output;

    /******************************************************************/
    /*  Second Formant of Parallel Vocal Tract.                       */
    /******************************************************************/

    TWO_POLE_FILTER( NoiseOutput,
                     Noise,
                     vtmLocal.p2_Delay_1,
                     vtmLocal.p2_Delay_2,
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

    Output = Output * vtmLocal.OutputScaleFactor;

    if ( Output > 32767.0 )
      Output = 32767.0;
    else
      if ( Output < -32768.0 )
        Output = -32768.0;

    vtmLocal.iwave[uiNs] = (S16_T)( Output );
  }


  memcpy(pVtm_t,&vtmLocal,sizeof(VTM_T)); // put back the local copy
  return;
}

#pragma optimize("g",off)	// we need to do this, because the agressive optimizations
							// that we normally do seem to lose some of the instance
							// data across calls..!

// in order to make the actual parameters in the filter macros
// somewhat independent, we'll paper over them with what is the
// REAL definition within this file.. outside of speech_waveform_generator, they have
// different meanings.. (no local copy..)
#undef SampleRateScale
#define SampleRateScale (pVtm_t->fSampleRateScale)
#undef FormantScale
#define FormantScale (pVtm_t->fFormantScale)
#undef InverseSampleRateScale
#define InverseSampleRateScale (pVtm_t->fInverseSampleRateScale)
#undef MaximumFrequency
#define MaximumFrequency (pVtm_t->fMaximumFrequency)


// tek 26mar98 new function to reset the instance data to a known state.
void InitializeInstanceData(LPTTS_HANDLE_T phTTS)
{
 PVTM_T pVtm_t = phTTS->pVTMThreadData;

  // initialize every parameter in the instance data..

 // except fot the stuff that doesn't get loaded by the speakerdef!
#define VTM_INITIAL_VALUE (0)
  pVtm_t->SpeakerAsperationGain=1;
  pVtm_t->SpeakerFricationGain=1;
  pVtm_t->OutputScaleFactor=1;
  pVtm_t->SpeakerBreathinessGain=1;
  pVtm_t->SpeakerVoicingGain=1;
  pVtm_t->PartialCascadePathGain=1;
  //pVtm_t->fMaximumFrequency = DEFAULT_MAXIMUM_FREQUENCY;
  pVtm_t->uiVoicePeriodSampleNumber=0;
  pVtm_t->iNumOpenSamples=0; 
  pVtm_t->iPositionToStartNoiseModulation=0;
  pVtm_t->DifferentiatedGlottalFlow=0;
  pVtm_t->DifferentiatedVoicing=0;
  pVtm_t->k1=0;    
  pVtm_t->k2=0;
  pVtm_t->T0Jitter=0;
  pVtm_t->a=0;
  pVtm_t->b=0;
  pVtm_t->LowPass_b0=VTM_INITIAL_VALUE;
  pVtm_t->LowPass_a1=VTM_INITIAL_VALUE;
  pVtm_t->LowPass_a2=VTM_INITIAL_VALUE;
  pVtm_t->NasalResonator_b0=VTM_INITIAL_VALUE;
  pVtm_t->NasalResonator_a1=VTM_INITIAL_VALUE;
  pVtm_t->NasalResonator_a2=VTM_INITIAL_VALUE;
  pVtm_t->p2_Delay_1=0;
  pVtm_t->p2_Delay_2=0;
  pVtm_t->p3_Delay_1=0;
  pVtm_t->p3_Delay_2=0;
  pVtm_t->p4_Delay_1=0;
  pVtm_t->p4_Delay_2=0;
  pVtm_t->p5_Delay_1=0;
  pVtm_t->p5_Delay_2=0;
  pVtm_t->p6_Delay_1=0;
  pVtm_t->p6_Delay_2=0;
  pVtm_t->c1_Delay_1=0;
  pVtm_t->c1_Delay_2=0;
  pVtm_t->c2_Delay_1=0;
  pVtm_t->c2_Delay_2=0;
  pVtm_t->c3_Delay_1=0;
  pVtm_t->c3_Delay_2=0;
  pVtm_t->c4_Delay_1=0;
  pVtm_t->c4_Delay_2=0;
  pVtm_t->c5_Delay_1=0;
  pVtm_t->c5_Delay_2=0;
  pVtm_t->NasalDelay_1=0;
  pVtm_t->NasalDelay_2=0;
  pVtm_t->LowPassDelay_1=0;
  pVtm_t->LowPassDelay_2=0;
  pVtm_t->NoiseDelay_1=0;
  pVtm_t->NoiseDelay_2=0;
  pVtm_t->VoiceTiltDelay=0;
  pVtm_t->NoiseTiltDelay=0;
  pVtm_t->p4_a1=VTM_INITIAL_VALUE;
  pVtm_t->p4_a2=VTM_INITIAL_VALUE;
  pVtm_t->p5_a1=VTM_INITIAL_VALUE;
  pVtm_t->p5_a2=VTM_INITIAL_VALUE;
  pVtm_t->CascadePathGain=VTM_INITIAL_VALUE;
  pVtm_t->c1_b0=VTM_INITIAL_VALUE;
  pVtm_t->c1_a1=VTM_INITIAL_VALUE;
  pVtm_t->c1_a2=VTM_INITIAL_VALUE;
  pVtm_t->c2_b0=VTM_INITIAL_VALUE;
  pVtm_t->c2_a1=VTM_INITIAL_VALUE;
  pVtm_t->c2_a2=VTM_INITIAL_VALUE;
  pVtm_t->c3_b0=VTM_INITIAL_VALUE;
  pVtm_t->c3_a1=VTM_INITIAL_VALUE;
  pVtm_t->c3_a2=VTM_INITIAL_VALUE;
  pVtm_t->c4_b0=VTM_INITIAL_VALUE;
  pVtm_t->c4_a1=VTM_INITIAL_VALUE;
  pVtm_t->c4_a2=VTM_INITIAL_VALUE;
  pVtm_t->c5_b0=VTM_INITIAL_VALUE;
  pVtm_t->c5_a1=VTM_INITIAL_VALUE;
  pVtm_t->c5_a2=VTM_INITIAL_VALUE;
  pVtm_t->GlottalSourceTilt_a1=VTM_INITIAL_VALUE;
  pVtm_t->GlottalSourceTilt_b0=VTM_INITIAL_VALUE;
  pVtm_t->Nasal_b0=VTM_INITIAL_VALUE;
  pVtm_t->Nasal_b1=VTM_INITIAL_VALUE;
  pVtm_t->Nasal_b2=VTM_INITIAL_VALUE;
  pVtm_t->T0=0; 
  pVtm_t->b0=0; 
  pVtm_t->LaryngealSourceGain=0;
  pVtm_t->SpeakerBreathinessPitchSyncGain=0;	// these must be zero to keep the VTM quiet 
  pVtm_t->LaryngealSourcePitchSyncGain=0;		// after a new spdef (they will be left from the last one)

}


/**********************************************************************/
/**********************************************************************/
/*  Function: read_speaker_definition                                 */
/*  Read a 22 words speaker definition packet.                        */
/**********************************************************************/
/**********************************************************************/

#define RSP_INIT_VALUE (13579)
void read_speaker_definition(LPTTS_HANDLE_T phTTS)
{
   SP_CHIP * pSpeakerDefinition;
   int iDeltaGainInDB=RSP_INIT_VALUE;

  /********************************************************************/
  /*  Variables to hold the speaker definition.                       */
  /********************************************************************/

   FLTPNT_T f4c=RSP_INIT_VALUE;  /*  Frequency of fixed cascade 4th formant    */
   FLTPNT_T b4c=RSP_INIT_VALUE;  /*  Bandwidth of fixed cascade 4th formant    */
   FLTPNT_T f5c=RSP_INIT_VALUE;  /*  Frequency of fixed cascade 5th formant    */
   FLTPNT_T b5c=RSP_INIT_VALUE;  /*  Bandwidth of fixed cascade 5th formant    */
   FLTPNT_T f4p=RSP_INIT_VALUE;  /*  Frequency of fixed parallel 4th formant   */
   FLTPNT_T b4p=RSP_INIT_VALUE;  /*  Bandwidth of fixed parallel 4th formant   */
   FLTPNT_T f5p=RSP_INIT_VALUE;  /*  Frequency of fixed parallel 5th formant   */
   FLTPNT_T b5p=RSP_INIT_VALUE;  /*  Bandwidth of fixed parallel 5th formant   */
   //FLTPNT_T f6p;  /*  Frequency of fixed parallel 6th formant   */
   //FLTPNT_T b6p;  /*  Bandwidth of fixed parallel 6th formant   */
   FLTPNT_T fnp=FNP;  /*  Frequency of fixed nasal formant          */
   FLTPNT_T bnp=BNP;  /*  Bandwidth of fixed nasal formant          */
   FLTPNT_T flp=RSP_INIT_VALUE;  /*  Freq. of fixed glottal decimating filter  */
   FLTPNT_T blp=RSP_INIT_VALUE;  /*  BW of fixed glottal decimating filter     */
   FLTPNT_T rlpg=RSP_INIT_VALUE; /*  Gain of down-sampling low-pass filter     */

   S16_T avg=RSP_INIT_VALUE;     /*  Gain factor for voicing                   */
   S16_T abrg=RSP_INIT_VALUE;    /*  Gain factor for breathiness               */
   S16_T apg=RSP_INIT_VALUE;     /*  Gain factor for aspiration                */
   S16_T afg=RSP_INIT_VALUE;     /*  Gain factor for frication                 */
   S16_T rnpg=RSP_INIT_VALUE;    /*  Gain factor for nasal pole resonator      */
   S16_T a5gain=RSP_INIT_VALUE;  /*  Gain in dB for the 5th cascade resonator. */
   S16_T a4gain=RSP_INIT_VALUE;  /*  Gain in dB for the 4th cascade resonator. */
   S16_T a3gain=RSP_INIT_VALUE;  /*  Gain in dB for the 3rd cascade resonator. */
   S16_T a2gain=RSP_INIT_VALUE;  /*  Gain in dB for the 2nd cascade resonator. */
   S16_T a1gain=RSP_INIT_VALUE;  /*  Gain in dB for the 1st cascade resonator. */

   FLTPNT_T c3_gain=RSP_INIT_VALUE;  /*  Gain factor for cascade 3rd formant   */
   FLTPNT_T c2_gain=RSP_INIT_VALUE;  /*  Gain factor for cascade 2nd formant   */
   FLTPNT_T c1_gain=RSP_INIT_VALUE;  /*  Gain factor for cascade 1st formant   */

  /********************************************************************/
  /* Variables used by macro DESIGN_TWO_POLE_FILTER()                 */
  /********************************************************************/

   FLTPNT_T Freq=RSP_INIT_VALUE;
   FLTPNT_T BW=RSP_INIT_VALUE;
   FLTPNT_T Radius=RSP_INIT_VALUE;
   FLTPNT_T Temp=RSP_INIT_VALUE;
  // get the goods..
  PVTM_T pVtm_t = phTTS->pVTMThreadData;

   pVtm_t->ldspdef = 1; // set the flag to skip packets on init

  // reset the VTM state..
  InitializeInstanceData(phTTS);


  pSpeakerDefinition	= (SP_CHIP *)&(pVtm_t->parambuff[1]);  //spdeftochip = &(pVtm_t->parambuff[1]);

  DESIGN_TWO_POLE_FILTER( pVtm_t->NasalResonator_a1,
                          pVtm_t->NasalResonator_a2,
                          Temp,
                          fnp,
                          bnp );

  /********************************************************************/
  /*  Coefficients for fixed downsampling low-pass filter             */
  /********************************************************************/

  if ( pVtm_t->SampleRate < 9500.0 )
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

  DESIGN_TWO_POLE_FILTER( pVtm_t->LowPass_a1, pVtm_t->LowPass_a2, pVtm_t->LowPass_b0, flp, blp );

  pVtm_t->LowPass_b0 = 2.0 * pVtm_t->LowPass_b0 * rlpg;

  /********************************************************************/
  /*  Begin set coeficients of speaker-def controlled resonators.     */
  /*  Cascade fourth formant                                          */
  /********************************************************************/

  f4c = pSpeakerDefinition->r4cb;   /*  1                             */
  b4c = pSpeakerDefinition->r4cc;   /*  2                             */

  DESIGN_TWO_POLE_FILTER( pVtm_t->c4_a1, pVtm_t->c4_a2, Temp, f4c, b4c );
#ifdef _DEBUG
 //DEBUGDEBUGDEBUG
  { char szTemp[256];
  sprintf(szTemp,"f4c:%f b4c:%f c4_a1:%f c4_a2:%f\n",
	  f4c,b4c,pVtm_t->c4_a1, pVtm_t->c4_a2);
  OutputDebugString(szTemp);
  }
 //DEBUGDEBUGDEBUG
#endif //_DEBUG


  /********************************************************************/
  /*  Cascade fifth formant                                           */
  /********************************************************************/

  f5c = pSpeakerDefinition->r5cb;   /*  3                             */
  b5c = pSpeakerDefinition->r5cc;   /*  4                             */

  DESIGN_TWO_POLE_FILTER( pVtm_t->c5_a1, pVtm_t->c5_a2, Temp, f5c, b5c );
#ifdef _DEBUG
 //DEBUGDEBUGDEBUG
  { char szTemp[256];
  sprintf(szTemp,"f4c:%f b4c:%f c4_a1:%f c4_a2:%f\n",
	  f4c,b4c,pVtm_t->c4_a1, pVtm_t->c4_a2);
  OutputDebugString(szTemp);
  }
 //DEBUGDEBUGDEBUG
#endif //_DEBUG

  /********************************************************************/
  /*  Parallel fourth formant                                         */
  /********************************************************************/

  f4p = pSpeakerDefinition->r4pb;   /*  5                             */
  b4p = 400.0;

  DESIGN_TWO_POLE_FILTER( pVtm_t->p4_a1, pVtm_t->p4_a2, Temp, f4p, b4p );

  /********************************************************************/
  /*  Parallel fifth formant                                          */
  /********************************************************************/

  f5p = pSpeakerDefinition->r5pb;    /*  6                            */
  b5p = 500.0;

  DESIGN_TWO_POLE_FILTER( pVtm_t->p5_a1, pVtm_t->p5_a2, Temp, f5p, b5p );

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

  if ( pVtm_t->T0Jitter < 0 )
    pVtm_t->T0Jitter = (int)(- Q12_INVERSE_SCALE * (FLTPNT_T)pSpeakerDefinition->t0jit);
  else
    pVtm_t->T0Jitter = (int)(Q12_INVERSE_SCALE * (FLTPNT_T)pSpeakerDefinition->t0jit);

  /********************************************************************/
  /*  Gains of cascade resonators.                                    */
  /********************************************************************/

  a5gain = pSpeakerDefinition->r5ca;    /*  9                         */
  a4gain = pSpeakerDefinition->r4ca;    /*  10                        */
  a3gain = pSpeakerDefinition->r3ca;    /*  11                        */
  a2gain = pSpeakerDefinition->r2ca;    /*  12                        */
  a1gain = pSpeakerDefinition->r1ca;    /*  13                        */

  if ( pVtm_t->SampleRate < 9500 )
  {
    pVtm_t->c5_b0 = 1.0;
    pVtm_t->c4_b0 = 0.6309573448 * dBtoLinear[a4gain];
  }
  else
  {
    pVtm_t->c5_b0 = dBtoLinear[a5gain];
    pVtm_t->c4_b0 = dBtoLinear[a4gain];
  }
  
  c3_gain = dBtoLinear[a3gain];
  c2_gain = dBtoLinear[a2gain];
  c1_gain = dBtoLinear[a1gain];

  /********************************************************************/
  /*  Constants that determine the duration of the open phase of the  */
  /*  glottal period.                                                 */
  /********************************************************************/

  pVtm_t->k1 = Q12_INVERSE_SCALE *
    (FLTPNT_T)pSpeakerDefinition->nopen1; /* 14                         */
  pVtm_t->k2 = Q12_INVERSE_SCALE *
    (FLTPNT_T)pSpeakerDefinition->nopen2; /* 15                         */

  /********************************************************************/
  /*  Breathiness coefficient.                                        */
  /*  Scale up by 8 to correct for a frac4mul() of this Q15 gain.     */
  /*  Apply arbitrary scale factor of 0.125 to all Speaker gains.     */
  /********************************************************************/

  abrg = pSpeakerDefinition->aturb;     /*  16                        */
  pVtm_t->SpeakerBreathinessGain = 4.0 * dBtoLinear[abrg];

  /********************************************************************/
  /*  T0range = pSpeakerDefinition->f0scale;  17  (Not used)    */
  /********************************************************************/

  /********************************************************************/
  /*  Scale factor for variable formants F1inHZ, F2inHZ, and F3inHZ.  */
  /********************************************************************/

  FormantScale =
    (Q12_INVERSE_SCALE) * (FLTPNT_T) pSpeakerDefinition->fnscale;
                                        /*  18                        */

  /********************************************************************/
  /*  Overall gain of frication source relative to other sources.     */
  /*  Apply arbitrary scale factor of 0.125 to all Speaker gains.     */
  /********************************************************************/

  afg = pSpeakerDefinition->afgain;     /*  19                        */
  pVtm_t->SpeakerFricationGain = dBtoLinear[afg];

  if ( pVtm_t->SampleRate < 9500 )
    pVtm_t->SpeakerFricationGain *= 20;

  /********************************************************************/
  /*  Gain of the nasal pole resonator of cascade filter section.     */
  /********************************************************************/

  rnpg = pSpeakerDefinition->rnpgain;   /*  20                        */
  pVtm_t->NasalResonator_b0 = dBtoLinear[rnpg];

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

  pVtm_t->PartialCascadePathGain = 11264.0 * c1_gain * c2_gain * c3_gain
    * pVtm_t->c4_b0 * pVtm_t->c5_b0 * pVtm_t->NasalResonator_b0;

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
  pVtm_t->SpeakerVoicingGain = 16.0 * dBtoLinear[avg];

  /********************************************************************/
  /*  Overall gain of aspiration source relative to other sources.    */
  /*  Scale up by 8 to correct for a frac4mul() of this Q15 gain.     */
  /*  Apply arbitrary scale factor of 0.125 to all Speaker gains.     */
  /********************************************************************/

  apg = pSpeakerDefinition->apgain;     /*  22                        */
  pVtm_t->SpeakerAsperationGain = 8.0 * dBtoLinear[apg];

  /********************************************************************/
  /*  Calculate the output scale factor based on the delta gain in dB */
  /********************************************************************/

  iDeltaGainInDB = (int)pSpeakerDefinition->osgain;

  pVtm_t->OutputScaleFactor = OUTPUT_SCALE_FACTOR;

  if ( iDeltaGainInDB <= 0 )
  {
    pVtm_t->OutputScaleFactor =
      pVtm_t->OutputScaleFactor * dBtoLinear[87+iDeltaGainInDB];
  }
  else
  {
    pVtm_t->OutputScaleFactor =
      pVtm_t->OutputScaleFactor / dBtoLinear[87-iDeltaGainInDB];
  }

  /********************************************************************/
  /*  Get the current speaker value so that it may be returned by     */
  /*  function TextToSpeechGetSpeaker().                              */
  /********************************************************************/

  phTTS->pKernelShareData->uiCurrentSpeaker = (unsigned int)pSpeakerDefinition->speaker;


  DumpInstanceData(phTTS);

  return;
}

/**********************************************************************/
/**********************************************************************/
/*  Function to Set the Sample Rate the vocal tract model outputs.    */
/**********************************************************************/
/**********************************************************************/

extern short last_voice;

void SetSampleRate( LPTTS_HANDLE_T phTTS,  unsigned int uiSampRate )
{
  // get the goods..
  PVTM_T pVtm_t = phTTS->pVTMThreadData;
  /********************************************************************/
  /*  Calculate the model sample dependant parameters.                */
  /********************************************************************/

  phTTS->pKernelShareData->uiSampleRate = uiSampRate;
  pVtm_t->SampleRate = (FLTPNT_T)uiSampRate;
  SampleRateScale = pVtm_t->SampleRate * 0.0001;
  InverseSampleRateScale = 1.0 / SampleRateScale;
  MaximumFrequency = MAXIMUM_FREQUENCY_SCALING * pVtm_t->SampleRate;
  pVtm_t->uiNumberOfSamplesPerFrame =
    (unsigned int)( pVtm_t->SampleRate * FRAME_TIME_IN_MSEC + 0.5 );
// tek 24mar98 make note of what we chose for the number of samples..
#ifdef _DEBUG
  {
	  char szTemp[256];
	  sprintf(szTemp,"Sample rate=%f, SampPerFrame=%d\n",
		  pVtm_t->SampleRate, pVtm_t->uiNumberOfSamplesPerFrame);
	  OutputDebugString(szTemp);
  }
#endif //_DEBUG
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

void InitializeVTM(LPTTS_HANDLE_T phTTS)
{
  static S16_T *variabpars;
  PVTM_T pVtm_t = phTTS->pVTMThreadData;


  InitializeInstanceData(phTTS);

  /********************************************************************/
  /*  Set up parameters for frame of speech. The parameters will      */
  /*  flush the VTM.                                                  */
  /********************************************************************/

  variabpars = &pVtm_t->parambuff[1];

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

  speech_waveform_generator(phTTS);
  speech_waveform_generator(phTTS);
  speech_waveform_generator(phTTS);
  speech_waveform_generator(phTTS);

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

void DumpInstanceData( LPTTS_HANDLE_T phTTS)
{

#ifdef FP_VTM // things used by the FP vocal tract
#ifdef _DEBUG
  PVTM_T pVtm_t = phTTS->pVTMThreadData;
  char szTemp[256];
	sprintf(szTemp,"fSampleRateScale %f\n",pVtm_t->fSampleRateScale);
	OutputDebugString(szTemp);
	sprintf(szTemp,"fFormantScale %f\n",pVtm_t->fFormantScale);
	OutputDebugString(szTemp);
	sprintf(szTemp,"fInverseSampleRateScale %f\n",pVtm_t->fInverseSampleRateScale);
	OutputDebugString(szTemp);
/**********************************************************************/
/*  Speaker defined gain factors.                                     */
/**********************************************************************/
	sprintf(szTemp,"SpeakerAsperationGain %f\n",pVtm_t->SpeakerAsperationGain);
	OutputDebugString(szTemp);
	sprintf(szTemp,"SpeakerFricationGain %f\n",pVtm_t->SpeakerFricationGain);
	OutputDebugString(szTemp);
	sprintf(szTemp,"OutputScaleFactor %f\n",pVtm_t->OutputScaleFactor);
	OutputDebugString(szTemp);
	sprintf(szTemp,"SpeakerBreathinessGain %f\n",pVtm_t->SpeakerBreathinessGain);
	OutputDebugString(szTemp);
	sprintf(szTemp,"SpeakerVoicingGain %f\n",pVtm_t->SpeakerVoicingGain);
	OutputDebugString(szTemp);
	sprintf(szTemp,"PartialCascadePathGain %f\n",pVtm_t->PartialCascadePathGain);
	OutputDebugString(szTemp);

 
  /********************************************************************/
  /*  Counters                                                        */
  /********************************************************************/

  //unsigned int uiNs;  /*  Number of samples into current frame */
  //unsigned int uiVoicePeriodSampleNumber;

  /********************************************************************/
  /*  Counter limits                                                  */
  /********************************************************************/

  //int iNumOpenSamples;  /*  Number of samples in open phase of period   */
  //int iPositionToStartNoiseModulation;


	sprintf(szTemp,"fMaximumFrequency %f\n",pVtm_t->fMaximumFrequency);
	OutputDebugString(szTemp);

  /********************************************************************/
  /*  Signals.                                                        */
  /********************************************************************/

	sprintf(szTemp,"DifferentiatedGlottalFlow %f\n",pVtm_t->DifferentiatedGlottalFlow);
	OutputDebugString(szTemp);
	sprintf(szTemp,"DifferentiatedVoicing %f\n",pVtm_t->DifferentiatedVoicing);
	OutputDebugString(szTemp);


	sprintf(szTemp,"k1 %f\n",pVtm_t->k1); 
	OutputDebugString(szTemp);       /*  Equals nopen1 for glottal period duration.    */
	sprintf(szTemp,"k2 %f\n",pVtm_t->k2); 
	OutputDebugString(szTemp);       /*  Equals nopen2 for glottal period duration.    */
	sprintf(szTemp,"T0Jitter %f\n",pVtm_t->T0Jitter);
	OutputDebugString(szTemp); /*  Alternating jitter for voicing period         */
	sprintf(szTemp,"a %f\n",pVtm_t->a);
	OutputDebugString(szTemp); /*  Makes glottal pulse when open          */
	sprintf(szTemp,"b %f\n",pVtm_t->b);
	OutputDebugString(szTemp); /*  Makes glottal pulse when open          */


/**********************************************************************/
/*  Coefficients for the down-sampling low pass filter.               */
/**********************************************************************/

	sprintf(szTemp,"LowPass_b0 %f\n",pVtm_t->LowPass_b0);
	OutputDebugString(szTemp);
	sprintf(szTemp,"LowPass_a1 %f\n",pVtm_t->LowPass_a1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"LowPass_a2 %f\n",pVtm_t->LowPass_a2);
	OutputDebugString(szTemp);


/**********************************************************************/
/*  The nasal resonator filter coefficients.                          */
/**********************************************************************/

	sprintf(szTemp,"NasalResonator_b0 %f\n",pVtm_t->NasalResonator_b0);
	OutputDebugString(szTemp);
	sprintf(szTemp,"NasalResonator_a1 %f\n",pVtm_t->NasalResonator_a1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"NasalResonator_a2 %f\n",pVtm_t->NasalResonator_a2);
	OutputDebugString(szTemp);



  /********************************************************************/
  /*  Resonator and anti-resonator delays.                            */
  /********************************************************************/

	sprintf(szTemp,"p2_Delay_1 %f\n",pVtm_t->p2_Delay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p2_Delay_2 %f\n",pVtm_t->p2_Delay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p3_Delay_1 %f\n",pVtm_t->p3_Delay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p3_Delay_2 %f\n",pVtm_t->p3_Delay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p4_Delay_1 %f\n",pVtm_t->p4_Delay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p4_Delay_2 %f\n",pVtm_t->p4_Delay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p5_Delay_1 %f\n",pVtm_t->p5_Delay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p5_Delay_2 %f\n",pVtm_t->p5_Delay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p6_Delay_1 %f\n",pVtm_t->p6_Delay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p6_Delay_2 %f\n",pVtm_t->p6_Delay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c1_Delay_1 %f\n",pVtm_t->c1_Delay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c1_Delay_2 %f\n",pVtm_t->c1_Delay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c2_Delay_1 %f\n",pVtm_t->c2_Delay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c2_Delay_2 %f\n",pVtm_t->c2_Delay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c3_Delay_1 %f\n",pVtm_t->c3_Delay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c3_Delay_2 %f\n",pVtm_t->c3_Delay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c4_Delay_1 %f\n",pVtm_t->c4_Delay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c4_Delay_2 %f\n",pVtm_t->c4_Delay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c5_Delay_1 %f\n",pVtm_t->c5_Delay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c5_Delay_2 %f\n",pVtm_t->c5_Delay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"NasalDelay_1 %f\n",pVtm_t->NasalDelay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"NasalDelay_2 %f\n",pVtm_t->NasalDelay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"LowPassDelay_1 %f\n",pVtm_t->LowPassDelay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"LowPassDelay_2 %f\n",pVtm_t->LowPassDelay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"NoiseDelay_1 %f\n",pVtm_t->NoiseDelay_1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"NoiseDelay_2 %f\n",pVtm_t->NoiseDelay_2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"VoiceTiltDelay %f\n",pVtm_t->VoiceTiltDelay);
	OutputDebugString(szTemp);
	sprintf(szTemp,"NoiseTiltDelay %f\n",pVtm_t->NoiseTiltDelay);
	OutputDebugString(szTemp);

  /********************************************************************/
  /*  Coefficients of parallel resonators for formants 2 through 6.   */
  /********************************************************************/

	sprintf(szTemp,"p4_a1 %f\n",pVtm_t->p4_a1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p4_a2 %f\n",pVtm_t->p4_a2);
	OutputDebugString(szTemp);

	sprintf(szTemp,"p5_a1 %f\n",pVtm_t->p5_a1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"p5_a2 %f\n",pVtm_t->p5_a2);
	OutputDebugString(szTemp);
  /********************************************************************/
  /*  Coefficients of cascade resonators for formants 2 through 6.    */
  /********************************************************************/

	sprintf(szTemp,"CascadePathGain %f\n",pVtm_t->CascadePathGain);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c1_b0 %f\n",pVtm_t->c1_b0);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c1_a1 %f\n",pVtm_t->c1_a1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c1_a2 %f\n",pVtm_t->c1_a2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c2_b0 %f\n",pVtm_t->c2_b0);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c2_a1 %f\n",pVtm_t->c2_a1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c2_a2 %f\n",pVtm_t->c2_a2);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c3_b0 %f\n",pVtm_t->c3_b0);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c3_a1 %f\n",pVtm_t->c3_a1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c3_a2 %f\n",pVtm_t->c3_a2);

	OutputDebugString(szTemp);
	sprintf(szTemp,"c4_b0 %f\n",pVtm_t->c4_b0);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c4_a1 %f\n",pVtm_t->c4_a1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c4_a2 %f\n",pVtm_t->c4_a2);
	OutputDebugString(szTemp);

	sprintf(szTemp,"c5_b0 %f\n",pVtm_t->c5_b0);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c5_a1 %f\n",pVtm_t->c5_a1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"c5_a2 %f\n",pVtm_t->c5_a2);
	OutputDebugString(szTemp);

  /********************************************************************/
  /*  Coefficients for the noise source filters.                      */
  /********************************************************************/

	sprintf(szTemp,"GlottalSourceTilt_a1 %f\n",pVtm_t->GlottalSourceTilt_a1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"GlottalSourceTilt_b0 %f\n",pVtm_t->GlottalSourceTilt_b0);
	OutputDebugString(szTemp);

  /********************************************************************/
  /*  The bandwidths of F2 and F3 for the frication path.             */
  /********************************************************************/

  /********************************************************************/
  /*  The nasal anti-resonator filter coefficients.                   */
  /********************************************************************/

	sprintf(szTemp,"Nasal_b0 %f\n",pVtm_t->Nasal_b0);
	OutputDebugString(szTemp);
	sprintf(szTemp,"Nasal_b1 %f\n",pVtm_t->Nasal_b1);
	OutputDebugString(szTemp);
	sprintf(szTemp,"Nasal_b2 %f\n",pVtm_t->Nasal_b2);
	OutputDebugString(szTemp);

  /********************************************************************/
  /*  Variables used to generate the glottal waveform.                */
  /********************************************************************/

	sprintf(szTemp,"T0 %f\n",pVtm_t->T0);
	OutputDebugString(szTemp); /* Fundamental period in output samples times 4 */
	sprintf(szTemp,"b0 %f\n",pVtm_t-> b0);
	OutputDebugString(szTemp); /*  Makes glottal pulse when open          */

  /********************************************************************/
  /*  Variable gain factors.                                          */
  /********************************************************************/

	sprintf(szTemp,"LaryngealSourceGain %f\n",pVtm_t->LaryngealSourceGain);
	OutputDebugString(szTemp);
	sprintf(szTemp,"SpeakerBreathinessPitchSyncGain %f\n",pVtm_t->SpeakerBreathinessPitchSyncGain);
	OutputDebugString(szTemp);
	sprintf(szTemp,"LaryngealSourcePitchSyncGain %f\n",pVtm_t->LaryngealSourcePitchSyncGain);
	OutputDebugString(szTemp);
#endif //_DEBUG
#endif //FP_VTM
}


#endif //FP_VTM
