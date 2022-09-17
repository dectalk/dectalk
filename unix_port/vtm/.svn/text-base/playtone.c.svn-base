/************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:    opthread.h
 *    Author:       Bill Hallahan
 *    Creation Date:15-NOV-1995
 *
 *    Functionality:
 *    Tone Generation code for DTMF and single tone.
 *
 ***********************************************************************
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001  BH 		11/15/195	Initial release
 * 002	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 */

/**********************************************************************/
/*  Include files.                                                    */
/**********************************************************************/

#ifdef WIN32
#include <windows.h>
#endif

/* GL 04/21/1997  change this for OSF build */
#ifdef __osf__
/*#include "dtmmedefs.h"*/
#include "opthread.h"
#endif


#include <math.h>
#include <malloc.h>
#include "kernel.h"	   /* For PKSD_T definition */
#include "tts.h"	   /* For TTS_HANDLE_T definition  */
#include "sinetab.h"

/**********************************************************************/
/*  Symbol definitions.                                               */
/**********************************************************************/

#define  RISE_TIME       0.002
#define  MAX_TONE_BLOCK   1024
#define  TONE_SYMBOL    0x7FFF

/**********************************************************************/
/*  External function prototypes.                                     */
/**********************************************************************/

extern void OutputData( LPTTS_HANDLE_T,
                        short *,
                        unsigned int,
                        DWORD,
                        DWORD );

/**********************************************************************/
/*  Function prototypes.                                              */
/**********************************************************************/

static double Tone( double, double * );

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PlayTones                                               */
/*  Author: Bill Hallahan                                             */
/*  Date: June 29, 1994                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function generates and plays tone waveforms. Up to two     */
/*    two tones may be generated.                                     */
/*                                                                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS             A pointer to a structure of type              */
/*                      TTS_HANDLE_T.                                 */
/*                                                                    */
/*    DurationInMsec    A double that is equal to the duration of the */
/*                      tone burst in milli-seconds.                  */
/*                                                                    */
/*    Freq_0            A double that is equal to the frequency of    */
/*                      tone 0 in Hertz.                              */
/*                                                                    */
/*    Amp_0             A double that is equal to the amplitude of    */
/*                      tone 0.                                       */
/*                                                                    */
/*    Freq_1            A double that is equal to the frequency of    */
/*                      tone 1 in Hertz.                              */
/*                                                                    */
/*    Amp_1             A double that is equal to the amplitude of    */
/*                      tone 1.                                       */
/*                                                                    */
/*    SampleRate        A double that is equal to the sample rate     */
/*                      in seconds.                                   */
/*  MVP : MI the below 2 args are removed.                            */
/*    SamplePeriod      A double that is equal to the sampling period */
/*                      in seconds.                                   */
/*                                                                    */
/*    bCancel           The address of a cancel flag.                 */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function will return a value of FALSE if successful.       */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

BOOL PlayTones( LPTTS_HANDLE_T phTTS,
                double DurationInMsec,
                double Freq_0,
                double Amp_0,
                double Freq_1,
                double Amp_1,
                double SampleRate
                )
{
  int i;
  int iRiseSamples;
  int iCenterSamples;
  int iCenterCount;
  int iSynthCount;
  int iTotalSamples;
  double * pRiseBuffer;
  double * pRise;
  short * pToneBuffer;
  short * pBuffer;
  double Sample;
  double PhaseIncrement_0;
  double Phase_0;
  double PhaseIncrement_1;
  double Phase_1;
  DWORD dwDurationInFrames;
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  /********************************************************************/
  /*  Calculate the duration in frames.                               */
  /********************************************************************/

  dwDurationInFrames = (int)( 0.15625 * DurationInMsec );

  /********************************************************************/
  /*  Calculate the tone generation parameters.                       */
  /********************************************************************/

  iTotalSamples = (int)( 0.001 * DurationInMsec * SampleRate );
  iRiseSamples = (int)((double)RISE_TIME * SampleRate );
  iCenterSamples = iTotalSamples - ( iRiseSamples << 1 );

  if ( iCenterSamples < 0 )
  {
    iRiseSamples = iCenterSamples >> 1;
    iCenterSamples = 0;
  }

  /********************************************************************/
  /*  Allocate the tone audio buffer.                                 */
  /********************************************************************/

  pToneBuffer = (short *)malloc( MAX_TONE_BLOCK * sizeof(short));

  if ( pToneBuffer == NULL )
  {
    return( TRUE );
  }

  /********************************************************************/
  /*  Allocate the rise gain buffer.                                  */
  /********************************************************************/

  pRiseBuffer = (double *)malloc( iRiseSamples * sizeof(double));

  if ( pRiseBuffer == NULL )
  {
    return( TRUE );
  }

  /******************************************************************/
  /*  Build the rise time table.                                    */
  /******************************************************************/

  PhaseIncrement_0 = 0.25 * TWO_PI_EQUIVALENT / (double)iRiseSamples;
  Phase_0 = 0.0;

  pRise = pRiseBuffer;

  for ( i = 0; i < iRiseSamples; i++ )
  {
    Sample = SineTable[(int)Phase_0];
    *pRise++ = Sample * Sample;
    Phase_0 += PhaseIncrement_0;
  }

  /********************************************************************/
  /*  Generate tones.                                                 */
  /********************************************************************/

  PhaseIncrement_0 = Freq_0 * pKsd_t->SamplePeriod * TWO_PI_EQUIVALENT;
  Phase_0 = 0.0;
  PhaseIncrement_1 = Freq_1 * pKsd_t->SamplePeriod * TWO_PI_EQUIVALENT;
  Phase_1 = 0.0;

  /********************************************************************/
  /*  Generate Samples during the rise time portion of the tone.      */
  /********************************************************************/

  pBuffer = pToneBuffer;

  for ( i = 0; i < iRiseSamples; i++ )
  {
    Sample  = Amp_0 * Tone( PhaseIncrement_0, &Phase_0 );
    Sample += Amp_1 * Tone( PhaseIncrement_1, &Phase_1 );
    *pBuffer++ = (short)( pRiseBuffer[i] * Sample );
  }

  /********************************************************************/
  /*  Play the rise time portion of the tone waveform.                */
  /*  Also send the duration which is in multiples of 6.4 msec.       */
  /********************************************************************/

  OutputData( phTTS,
              pToneBuffer,
              iRiseSamples,
              TONE_SYMBOL,
              (DWORD)( 0.15625 * DurationInMsec ));

  /********************************************************************/
  /*  Generate the center portion of the tone.                        */
  /********************************************************************/

  iCenterCount = 0;

  while (( iCenterCount < iCenterSamples ) && ( ! pKsd_t->halting))
  {
    iSynthCount = iCenterSamples - iCenterCount;

    if ( iSynthCount > MAX_TONE_BLOCK )
    {
      iSynthCount = MAX_TONE_BLOCK;
    }

    pBuffer = pToneBuffer;

    for ( i = 0; i < iSynthCount; i++ )
    {
      Sample  = Amp_0 * Tone( PhaseIncrement_0, &Phase_0 );
      Sample += Amp_1 * Tone( PhaseIncrement_1, &Phase_1 );
      *pBuffer++ = (short)Sample;
    }

    iCenterCount += iSynthCount;

    /******************************************************************/
    /*  Queue the samples.                                            */
    /******************************************************************/

    OutputData( phTTS, pToneBuffer, iSynthCount, TONE_SYMBOL, 0 );
  }

  /********************************************************************/
  /*  Generate Samples during the fall time portion of the tone.      */
  /********************************************************************/

  pBuffer = pToneBuffer;

  for ( i = iRiseSamples - 1; i >= 0; i-- )
  {
    Sample  = Amp_0 * Tone( PhaseIncrement_0, &Phase_0 );
    Sample += Amp_1 * Tone( PhaseIncrement_1, &Phase_1 );
    *pBuffer++ = (short)( pRiseBuffer[i] * Sample );
  }

  /********************************************************************/
  /*  Play the fall time portion of the tone waveform.                */
  /********************************************************************/

  OutputData( phTTS, pToneBuffer, iRiseSamples, TONE_SYMBOL, 0 );

  /********************************************************************/
  /*  Free the rise gain buffer and the tone audio buffer.            */
  /********************************************************************/

  free( pRiseBuffer );
  free( pToneBuffer );

  return( FALSE );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: Tone                                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: June 29, 1994                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function generates a single tone sample.                   */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    PhaseIncrement    A value of type double that is equal to the   */
/*                      phase increment for the desired tone          */
/*                      frequency at the current sample rate.         */
/*                                                                    */
/*    pPhase            A pointer to a double that contains the       */
/*                      current phase of the tone sinusoid.           */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a double equal to the next tone sample.   */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static double Tone( double PhaseIncrement, double * pPhase )
{
  double Sample;

  /********************************************************************/
  /*  Synthesize tone sample 1.                                       */
  /********************************************************************/

  Sample = SineTable[(int)*pPhase];

  *pPhase += PhaseIncrement;

  if ( *pPhase >= TWO_PI_EQUIVALENT )
    *pPhase -= TWO_PI_EQUIVALENT;

  return( Sample );
}
