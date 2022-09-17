/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	decvoc_f.c
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
 *  15. 03-Apr-95 CJL File was fdecvoc.c. Is now DECVOC_F.C 
 *  16. 16-JAN-96 SIK Removed white space inbetween # and include in places
 *      where #include is commented out 
 */

/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/

#include <stdio.h>
#include <math.h>
#include "vtm_fp.h"
#include "vtm_fdef.h"

#include "vfport.h"
#include "vfphdefs.h"
/*  16. 16-JAN-96 SIK Removed white space inbetween # and include in places
 *      where #include is commented out */
/*#include "vtm_f.h"*/       /*  Variables used by the vocal tract model   */
/*#include "vtmtabf.h"*/     /*  Tables used by the vocal tract model      */
#include "vfmfiltr.h"    /*  Filters Macros                            */
#include "vfmd2pol.h"    /*  Two pole filter design Macro              */

    /******************************************************************/
    /*  PERIODIC VOICING WAVEFORM                                     */
    /*  A period has duration of T0 samples,                          */
    /*  uiVoicePeriodSampleNumber is the counter of current time.     */
    /*  During the first 0 to ( T0 - iNumOpenSamples ) samples the    */
    /*  glottis is is closed. The glottis opens at time               */
    /*  ( T0 - iNumOpenSamples ), and closes at time T0.              */
    /******************************************************************/
    /******************************************************************/
/*THIS IS THE START OF THE TRADE SECRET PART */
/*#IFDEF doit*/
int doit()
	{
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

      if ( uiVoicePeriodSampleNumber > ((int)T0 - iNumOpenSamples ))
      {
        a -= b;
        DifferentiatedGlottalFlow += a;
        LaryngealSourcePitchSyncGain = LaryngealSourceGain;
      }
      else
      {
        DifferentiatedGlottalFlow = 0.0;
      }

      /****************************************************************/
      /*  Perform pitch synchronous update of some parameters. The    */
      /*  parameter update is performed at the sample before the      */
      /*  glottis opens.                                              */
      /****************************************************************/

      if ( uiVoicePeriodSampleNumber == (int)T0 )
      {
        /**************************************************************/
        /*  Reset period when 'uiVoicePeriodSampleNumber' reaches T0, */
        /*  when the glottis about to open                            */
        /**************************************************************/

        uiVoicePeriodSampleNumber = 0;

        /**************************************************************/
        /*  LaryngealSourceGain moved to LaryngealSourcePitchSyncGain */
        /*  after half of a pitch period.                             */
        /*  Include the gain of the downsampling low pass filter in   */
        /*  LaryngealSourceGain to stay compatible with the integer   */
        /*  vocal tract model. Scale up by 8 to correct for a         */
        /*  frac4mul() of this Q15 gain.                              */
        /**************************************************************/

        LaryngealSourceGain = 8.0 * dBtoLinear[AVinDB + 4];

        T0 = T0inS4;          /*  T0inS4 remembers period in case     */
                              /*  more than 1 period in cur. frame.   */
        Temp = T0Jitter * T0; ;  /*  Add jitter, if any.              */
        T0 +=  Temp;
        T0Jitter = - T0Jitter;  /*  Cause jitter to alternate.        */

        /**************************************************************/
        /*  SpeakerBreathinessPitchSyncGain is the Speaker definition */
        /*  breathiness coeficient                                    */
        /**************************************************************/

        SpeakerBreathinessPitchSyncGain = SpeakerBreathinessGain;

        /**************************************************************/
        /*  Calculate the coefficients of a one pole filter (decay    */
        /*  averager) which will be used to tilt the spectrum of the  */
        /*  glottal source down by TiltInDB dB at 3 kHz.              */
        /**************************************************************/

        GlottalSourceTilt_a1 = 0.0333862304 * (FLTPNT_T)TiltInDB;

        if ( GlottalSourceTilt_a1 >= 0.0 )
          GlottalSourceTilt_b0 = 1.0 - GlottalSourceTilt_a1;
        else
          GlottalSourceTilt_b0 = 1.0;

        /**************************************************************/
        /*  Scale the glottal waveform using the speaker dependant    */
        /*  parameter "SpeakerVoicingGain". Include the gain of the   */
        /*  decimation low pass filter here.                          */
        /**************************************************************/

        GlottalSourceTilt_b0 *= LowPass_b0 * SpeakerVoicingGain;

        /**************************************************************/
        /*  Set to "iPositionToStartNoiseModulation" during the       */
        /*  first half of the period. Modulate the amplitude of the   */
        /*  noise if "LaryngealSourceGain" > 0.0.                     */
        /**************************************************************/

        iPositionToStartNoiseModulation = 0;

        if ( LaryngealSourceGain > 0.0 )
          iPositionToStartNoiseModulation = (int)( 0.5 * T0 );

        /**************************************************************/
        /*  Make the open portion of the differentiated glottal       */
        /*  waveform longer as TiltInDB increases.                    */
        /**************************************************************/

        iNumOpenSamples = (int)( k1 * T0 + k2);
        iNumOpenSamples += ( TiltInDB << 2 );

        /**************************************************************/
        /*  Bound the open portion of the glottal waveform.           */
        /**************************************************************/

        if ( iNumOpenSamples < 40 )
        {
          iNumOpenSamples = 40;
        }
        else
        {
          if ( iNumOpenSamples > 263 )
          {
            iNumOpenSamples = 263;
          }
        }

        if ( iNumOpenSamples >= (int)( 0.75 * T0 ))
          iNumOpenSamples = (int)( 0.75 * T0 );

        /**************************************************************/
        /*  Reset a & b, which determine shape of glottal waveform.   */
        /**************************************************************/

        b = 0.0625 * B0[iNumOpenSamples-40];
        a = 0.333333333333333 * b * (FLTPNT_T)iNumOpenSamples;

        /**************************************************************/
        /*  Calculate coeficients of the variable cascade resonators. */
        /**************************************************************/

        DESIGN_TWO_POLE_FILTER( c3_a1, c3_a2, c3_b0, F3inHZ, B3inHZ );

        DESIGN_TWO_POLE_FILTER( c2_a1, c2_a2, c2_b0, F2inHZ, B2inHZ );

        DESIGN_TWO_POLE_FILTER( c1_a1, c1_a2, c1_b0, F1inHZ, B1inHZ );

        CascadePathGain = PartialCascadePathGain * c3_b0 * c2_b0 * c1_b0;

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

        Nasal_b0 = Nasal_b0_Table[Index];
        Nasal_b1 = Nasal_b1_Table[Index];
        Nasal_b2 = Nasal_b2_Table[Index];
      }

      /****************************************************************/
      /*  Downsampling low-pass filter.                               */
      /*  Decimate the glottal pulse sample rate by 4.                */
      /****************************************************************/

      MINIMUM_TWO_POLE_FILTER( DifferentiatedVoicing,
                               DifferentiatedGlottalFlow,
                               LowPassDelay_1,
                               LowPassDelay_2,
                               LowPass_a1,
                               LowPass_a2 );

      uiVoicePeriodSampleNumber++;
    }
    }
/*#endif*/
/*This is the end of the doit code*/
