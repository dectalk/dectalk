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
 *    File Name:	decvoc_i.c
 *    Author:		
 *    Creation Date:
 *
 *    Functionality:
 *    DECtalk Vocal Tract Model, Integer version
 *    Klatt synthesizer as implimented on the TI SPC
 *    Modified version of synthesizer described in
 *    J. Acoust. Soc. Am., Mar. 1980. -- new voicing source.
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
 *                    two_zero_filter, two_zero_filter_2 and
 *                    two_pole_filter.
 *                    Set f6p and b6p to get the correct values for
 *                    r6pb and r6pc.
 *  13. 14-JUL-92 BH  Made VTM work at sample rates 8K, 10K, and 11K.
 *  14. 23-MAR-95 CJL Change this file from decvoc.c to decvoc_i.c,
 *						change include files to new names, add
 *						vtm_ip.h and auto-generate proto files.
 *	15. 16-JAN-96 SIK Removed white space inbetween # and include in places
 * 					  where #include is commented out.
 */

#include "vtm_ip.h"
#include "vtm_idef.h"
/* 16-JAN-96 SIK Removed white space inbetween # and include in places
 * 					  where #include is commented out. */
/*#include "viport.h"*/
#include "viphdefs.h" 
/* 16-JAN-96 SIK Removed white space inbetween # and include in places
 * 					  where #include is commented out. */
/*#include "vismprat.h"*/   /*  Constants used by the vocal tract model   */
#include "vtm_i.h"      /*  Variables used by the vocal tract model   */ 
/* 16-JAN-96 SIK Removed white space inbetween # and include in places
 * 					  where #include is commented out. */
/*#include "vtmtabli.h"*/   /*  Tables used by the vocal tract model      */
#include "vtmfunci.h"   /*  Functions used by the vocal tract model   */



doit()
{
    /******************************************************************/
    /*  NOISE GENERATOR                                               */
    /******************************************************************/
    /******************************************************************/

    randomx = randomx * ranmul + ranadd;
    noise = randomx >> 2;

    /******************************************************************/
    /*  RANDOM NUMBER FOR FRICATION AND ASPIRATION                    */
    /*  Tilt down aspiration noise spectrum at high freqs by low-pass */
    /*  filtering. noise = noise + 0.75 * last noise                  */
    /******************************************************************/

    noise += frac1mul( 24574, nolast );
    nolast = noise;

    /******************************************************************/
    /*                                                                */
    /*  Filter with Pi-rotated antiresonator. (This is the same as an */
    /*  ordinary antiresonator except for the b-coef has it's sign    */
    /*  flipped). Frequency = 3500, Bandwidth = 1600.                 */
    /*                                                                */
    /*  This is a three zero filter, but is implemented as a special  */
    /*  case because one of the multipliers is 1.0. The input and     */
    /*  output variable is "noise".                                   */
    /*                                                                */
    /******************************************************************/

    two_zero_filter_2( noise, ablas1, ablas2, noiseb, noisec );

    /******************************************************************/
    /*  Amplitude modulate noise. Reduce noise amplitude during the   */
    /*  second half of the glottal period if "avlin" > 0. "nmod" is   */
    /*  set to 0 if "avlin" is zero, i.e. the glottal source is off.  */
    /******************************************************************/

    if ( nper < nmod )
      noise >>= 1;


	/******************************************************************/
    /*  PERIODIC VOICING WAVEFORM                                     */
    /*  A period has duration of T0 samples, nper is the counter of   */
    /*  current time. During the first nper = 0 to ( T0 - nopen )     */
    /*  samples, the glottis is closed. The glottis opens at time     */
    /*  ( T0 - nopen ), and closes at time T0.                        */
    /******************************************************************/

    for ( nsr4 = 0; nsr4 < 4; nsr4++ )
    {
      /****************************************************************/
      /*  Compute next value of voicing wave. Calculate glottal pulse */
      /*  at 4 times normal sample rate to minimize the quantization  */
      /*  of the glottal period.                                      */
      /****************************************************************/

      /****************************************************************/
      /*  Future upgrade ?                                            */
      /*  When glottis closes, reduce F1 and B1.                      */
      /****************************************************************/

#if   F1_B1_UPGRADE

      f1_b1_down();
#endif

      /****************************************************************/
      /*  voicing has fixed waveshape, at**2 - bt**3                  */
      /****************************************************************/

      if ( nper > ( T0 - nopen ))
      {
        a -= b;             /*  Fixed waveshape at**2 - bt**3         */
        voice0 += a >> 4;   /*  Differentiated glottal flow.          */
        avlind = avlin;     /*  Delay action of "avlin" change.       */
      }
      else
      {
        voice0 = 0;
      }

      /****************************************************************/
      /*  Scale the glottal waveform using the speaker dependant      */
      /*  parameter "avgain".                                         */
      /****************************************************************/

      voice = frac4mul( voice0, avgain );

      /****************************************************************/
      /*  SOME PARAMETERS ARE UPDATED PITCH SYNCHRONOUSLY             */
      /*  (at sample before glottal close time)                       */
      /****************************************************************/

      if ( nper == T0 )
      {
        /**************************************************************/
        /*  Reset period when 'nper' reaches T0, glottis about to     */
        /*  open.                                                     */
        /**************************************************************/

        nper = 0;

        /**************************************************************/
        /*  'avlin' moved to 'avlind' after half period.              */
        /**************************************************************/

        avlin = amptable[AVinDB + 4];  /*  Convert from dB to linear. */

        T0 = T0inS4;          /*  T0inS4 remembers period in case     */
                              /*  more than 1 period in cur frame.    */
        temp = frac4mul( t0jitr, T0 ); /*  Add jitter, if any.        */
        T0 +=  temp;
        t0jitr = -t0jitr;     /*  Change sign for alternating jitter. */

        /**************************************************************/
        /*  aturb1 is the Speaker definition breathiness coeficient   */
        /**************************************************************/

        aturb1 = Aturb << 2;

        if ( F1inHZ < 250 )
          F1inHZ = 250;

        /**************************************************************/
        /*  Use a one pole iir filter to tilt the glottal source.     */
        /**************************************************************/

        switch( uiSampleRateChange )
        {
        case SAMPLE_RATE_INCREASE:

          decay = 1094 * (S32)TILTDB;
          break;

        case SAMPLE_RATE_DECREASE:

          decay = 1073 * (S32)TILTDB;
          break;

        case NO_SAMPLE_RATE_CHANGE:

          decay = 1094 * (S32)TILTDB;
          break;

        default:

          break;
        }

        if ( decay >= 0 )
          one_minus_decay = 32767 - decay;
        else
          one_minus_decay = 32767;

        /**************************************************************/
        /*  Set to "nmod" during the first half of the period.        */
        /*  Modulate the amplitude of the noise if "avlin" > 0, i.e.  */
        /*  the glottal source is enabled.                            */
        /**************************************************************/

        nmod = 0;

        if ( avlin > 0 )
          nmod = T0 >> 1;

        nopen = frac1mul( k1, T0 ) + k2;   /*  in open part of period */

        nopen += ( TILTDB << 2 );      /*  Longer if TILTDB increases */

        if ( nopen < 40 )
          nopen = 40;        /*  Min is 40                            */
        else
          if ( nopen > 263 )
            nopen = 263;     /*  Max is 263                           */

        if ( nopen >= (( T0 * 3 ) >> 2 ))
          nopen = (( T0 * 3 ) >> 2 );    /*  or 3/4 T0                */

        /**************************************************************/
        /*  Reset a & b, which determine shape of glottal waveform.   */
        /*  Let a = (b * nopen) / 3 without doing the divide.         */
        /**************************************************************/

        b = B0[nopen-40];
        temp = b + 1;

        if ( nopen > 95 )
        {
          temp = (S32)temp * nopen;
          a = frac1mul( 10923, temp );
        }
        else
        {
          temp = frac1mul( 10923, temp );
          a = (S32)temp * nopen;
        }

        /**************************************************************/
        /*  Set coeficients of variable cascade resonators.           */
        /**************************************************************/

        R3ca = d2pole_cf123( &r3cb, &r3cc, F3inHZ, B3inHZ, r3cg );
        R2ca = d2pole_cf123( &r2cb, &r2cc, F2inHZ, B2inHZ, r2cg );
        R1ca = d2pole_cf123( &r1cb, &r1cc, F1inHZ, B1inHZ, r1cg );

        /**************************************************************/
        /*  Scale up R1 gain here.                                    */
        /**************************************************************/

        if ( R1ca > 16383 )
          R1ca = 16383;

        R1ca = R1ca << 1;

        /**************************************************************/
        /*  Future upgrade ?                                          */
        /*  Set pitch-synchronous changes to F1.                      */
        /**************************************************************/

#if     F1_B1_UPGRADE

        f1_b1_up();
#endif

        /**************************************************************/
        /*  Set coeficients of nasal zero antiresonator by table      */
        /*  lookup.                                                   */
        /**************************************************************/

        temp = ( FZinHZ >> 3 ) - 31;

        if ( temp > 34 )
          temp = 34;

        rnza = azero_tab[temp];
        rnzb = bzero_tab[temp];
        rnzc = czero_tab[temp];
      }

      /****************************************************************/
      /*  Downsampling low-pass filter.                               */
      /*  Decimate the glottal pulse from a 40 KHz rate to 10 KHz.    */
      /*  The variable 'rlpd1' is the output of downsampling low-pass */
      /*  filter and is copied back to the variable 'voice'. 'nper'   */
      /*  is the 40 KHz sample counter.                               */
      /****************************************************************/

      two_pole_filter( voice, rlpd1, rlpd2, rlpa, rlpb, rlpc );

      voice = rlpd1;
      nper++;
    }

 }
