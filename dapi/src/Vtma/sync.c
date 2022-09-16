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
 *    DECtalk Synchronization task                               
 *                                                               
 *    ASYNCHRONOUS MESSAGES.                                       
 *    This thread may send synchronization messages to the  
 *    window procedure specified by the window handle passed in  
 *    function TextToSpeechStartup(). The user may wish to handle
 *    these messages. The message number will be ID_TTS_Index.   
 *
 ***********************************************************************
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001  BH 		11/15/1995	Initial release
 * 002	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 * 003	TEK		05/22/1997	Repaired highlighting time calculations
 * 004	TEK		06/09/1997	Typing changes
 * 005	tek		19jun97		more typing changes
 * 006	tek		31jul97		temporary patch for bats422
 * 007  ETT		10/05/1998      Added Linux code.
 */

/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/

/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
#include <windows.h>
#include <mmsystem.h>
#include "port.h"
#include "defs.h"
#include "kernel.h"
#include "ph_def.h"    /* MVP : Now phinst.h includes phdefs.h */
#include "samprate.h"
#include "tts.h"
#include "playaud.h"
#include "vtminst.h"            /* MVP MI */
#endif
#if defined (__osf__) || defined (__linux__)
#include "opthread.h"
#include <mmsystem.h>
#include "port.h"
#include "tts.h"
#include "ttsapi.h"
#include "defs.h"
#include "kernel.h"
#include "ph_def.h"    /* MVP : Now phinst.h includes phdefs.h */
#include "samprate.h"
#include "vtminst.h"            /* MVP MI */
#endif
/*extern FILE * pFileDebug;*/  /*MVP MI comment it out :never used */

/**********************************************************************/
/*  Symbol Definitions                                                */
/**********************************************************************/
#ifdef TYPING_MODE
#define  MAXIMUM_SLEEP_TIME_IN_MSEC   30
#else
#define  MAXIMUM_SLEEP_TIME_IN_MSEC   200
#endif //TYPING_MODE

#define  MINIMUM_SLEEP_TIME_IN_MSEC   20

#ifdef TYPING_MODE
// 22may97 tek
// for the assistive market, we try to deliver index marks more
// precisely
#define SLEEP_TIME_BIAS		(50)		// msec we shave off the sleep request
#define SLEEP_TIME_MARGIN	(10)		// msec early we can return a mark.
#endif //TYPING_MODE

/**********************************************************************/
/*  External variables.                                               */
/**********************************************************************/

/*extern double SamplePeriod;*/    /* MVP :moved to Kernel_share_data */

/**********************************************************************/
/*  Function prototypes                                               */
/**********************************************************************/

static void WaitForAudioSampleToPlay( PKSD_T ,LPAUDIO_HANDLE_T, DWORD);

/**********************************************************************/
/*  Start of the VTM thread.                                          */
/**********************************************************************/
/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
DWORD __stdcall sync_main( LPTTS_HANDLE_T phTTS )
#endif
#if defined (__osf__) || defined (__linux__)
OP_THREAD_ROUTINE(sync_main, LPTTS_HANDLE_T phTTS)
#endif
{
  DWORD control;
  DWORD dwSyncParams[3];
  LPAUDIO_HANDLE_T pAudioHandle;
  /*MVP : Get the instance kernel_share data structure,instance VTM thread data */
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  PVTM_T pVtm_t = phTTS->pVTMThreadData;
  
#if defined (__osf__) || defined (__linux__)
  /* Initialize thread error field to no error */
  phTTS->uiThreadError = MMSYSERR_NOERROR;
#endif
  
  /********************************************************************/
  /*  Get the Audio Handle.                                           */
  /********************************************************************/

  pAudioHandle = phTTS->pAudioHandle;

  /********************************************************************/
  /*  Loop and process parameter blocks.                              */
  /********************************************************************/


  for(;;)
  {
	read_pipe( pKsd_t->sync_pipe, &control, 1 );

	switch ( control )
	{
	case SPC_type_sync:

	read_pipe( pKsd_t->sync_pipe, dwSyncParams, 1 );

#ifdef TYPING_MODE
	// never wait for the sample to play when we're in typing mode..
	if (!phTTS->bInTypingMode)
#endif //TYPING_MODE

	if ( ! pKsd_t->halting )
	{
	  /************************************************************/
	  /*  If the audio device is being used then wait for the     */
	  /*  specified audio sample to play.                         */
	  /************************************************************/

	  if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
	  {

		WaitForAudioSampleToPlay( phTTS->pKernelShareData,
							  pAudioHandle,
					  dwSyncParams[0]
					);
	  }
	}

/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
	SetEvent( phTTS->hSyncEvent );
#endif
#if defined (__osf__) || defined (__linux__)
	OP_SetEvent( phTTS->hSyncEvent );
#endif
	break;

	case SPC_type_index:

	read_pipe( pKsd_t->sync_pipe, dwSyncParams, 3 );

	if ( ! pKsd_t->halting )
	{
	  /************************************************************/
	  /*  If the audio device is being used then wait for the     */
	  /*  specified audio sample to play.                         */
	  /************************************************************/

	  if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
	  {
		WaitForAudioSampleToPlay( phTTS->pKernelShareData,
							  pAudioHandle,
					  dwSyncParams[2]
					);
	  }

	  if ( ! pKsd_t->halting )
		/*
		SendMessage( phTTS->hWnd,
			 phTTS->uiID_Index_Message,
			 (WPARAM)dwSyncParams[1],
			 (LPARAM)dwSyncParams[0] );
		*/
		//MVP: Replaced above SendMessage with Report_TTS_status :New Audio code:FIXME:dwSyncParams[0]
		Report_TTS_Status(phTTS,phTTS->uiID_Index_Message,(WPARAM)TTS_INDEX_MARK,(LPARAM)dwSyncParams[0]);

	}
	break;

	default:
	  break;
	}
  }
/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
  return( FALSE );
#endif
#if defined (__osf__) || defined (__linux__)
  OP_ExitThread(phTTS->uiThreadError);
  OP_THREAD_RETURN;
#endif
}

/**********************************************************************/
/*                                                                    */
/*  Function: WaitForAudioSampleToPlay                                */
/*  Author: Bill Hallahan                                             */
/*  Date: August 17, 1993                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function will block until either the specified audio  */
/*    sample plays or the global halting flag is set.                 */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*    pKsd_t            A pointer to instance specific kernel         */
/*                                              share data.(MVP)                                                          */
/*    pAudioHandle      A pointer to an audio handle of type          */
/*                      AUDIO_HANDLE_T                                */
/*                                                                    */
/*    dwSampleNumber    A DWORD which is the sample number of the     */
/*                      audio sample which must be played before      */
/*                      this function will return. The function       */
/*                      will also return if the global halting flag   */
/*                      is set.                                       */
/*    MVP : MI the "SamplePeriod" arg is removed                                          */
/*                                                                                                            */
/*    SamplePeriod      A double equal to the reciprocal of the       */
/*                      audio sample rate.                            */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    none.                                                           */
/*                                                                    */
/**********************************************************************/

static void WaitForAudioSampleToPlay( PKSD_T pKsd_t ,
									  LPAUDIO_HANDLE_T pAudioHandle,
					  DWORD dwSampleNumber
					)
{
  UINT uiVtmCount;
  UINT uiPhCount;
  UINT uiLtsCount;
  DWORD dwPosition;
  int iSleepTimeInMsec;
  MMRESULT mmStatus;
  double		dMsecPerSample=0;	//22may97 tek
#ifndef OLEDECTALK // tek 30jun97 not used in SAPI
  WAVEFORMATEX	wfexWaveFormat;	//22may97 tek
#endif //OLEDECTALK

  //22may97 tek calculate the factor we use to figure our sleeps
  // tek 30jun97& 31jul97 bats 422
  // this doesn't work right in SAPI, so for now SAPI gets a fudged value
  // (it's not all that important..)
#ifndef OLEDECTALK
  PA_GetFormat(pAudioHandle,&wfexWaveFormat);
  dMsecPerSample = (double)(1000)/(double)(wfexWaveFormat.nAvgBytesPerSec);
#else
  dMsecPerSample = (double)(1./22050.);
#endif //OLEDECTALK

  while ( TRUE )
  {
	/******************************************************************/
	/*  If halting then return.                                       */
	/******************************************************************/

	if ( pKsd_t->halting )
	  return;

	// tek 31jul97 bats 422
	// if we were asked to wait for sample "-1", just return,
	if (dwSampleNumber >= 0xFFFFFFFE)
		return;

	/******************************************************************/
	/*  When the audio sample "dwSampleNumber" plays then             */
	/*  synchronization has been achieved.                            */
	/******************************************************************/
	
	mmStatus = PA_GetPosition( pAudioHandle, &dwPosition, FALSE );
	
	if ( mmStatus == MMSYSERR_NOERROR )
	{
	  if ( dwPosition < dwSampleNumber )
	  {
	if ( dwPosition == 0 )
	{
	  /************************************************************/
	  /*  If the current audio position is zero then one of two   */
	  /*  conditions is possible. Either the audio has not        */
	  /*  started playing yet, or the wave output device has      */
	  /*  closed. If the position is zero then check to see if    */
	  /*  the pipes that are read in the lts, ph and vtm threads  */
	  /*  are empty. If they are empty, then exit this function.  */
	  /************************************************************/

	  uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
	  uiPhCount = pipe_count( pKsd_t->ph_pipe );
	  uiLtsCount = pipe_count( pKsd_t->lts_pipe );

	  if (( uiVtmCount == 0 )
		&& ( uiPhCount == 0 )
		&& ( uiLtsCount == 0 ))
		break;
	}

	// 22may97 tek  this calculation needs to account for 
	// the fact taht we get position reports in "bytes", but
	// need to calculate time.
	iSleepTimeInMsec =
	  (int)( dMsecPerSample * (double)( dwSampleNumber - dwPosition) );

#ifdef TYPING_MODE
	//22may97 tek
	// apply the bias and margin to the calculated sleep to return
	// with more precision
	if (iSleepTimeInMsec < SLEEP_TIME_MARGIN)
	{
		break;
	}
	iSleepTimeInMsec -= SLEEP_TIME_BIAS; // try to wake up early

#endif //TYPING_MODE

	if ( iSleepTimeInMsec > MAXIMUM_SLEEP_TIME_IN_MSEC )
	{
	  iSleepTimeInMsec = MAXIMUM_SLEEP_TIME_IN_MSEC;
	}
	else
	{
	  // tek 22may97 sleep very little when we get close in
	  if ( iSleepTimeInMsec < MINIMUM_SLEEP_TIME_IN_MSEC )
		iSleepTimeInMsec = 1;
	}

/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
	Sleep((DWORD)iSleepTimeInMsec );
#endif
#if defined (__osf__) || defined (__linux__)
	OP_Sleep((DWORD)iSleepTimeInMsec );
#endif
	  }
	  else
	  {
	break;
	  }
	}
	else
	{
		return; // panic exit?
	}
  }
  return;
}
