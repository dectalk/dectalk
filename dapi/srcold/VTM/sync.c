/************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 * 007	tek		01aug97		Bats423: use precalculated MsecPerSample
 * 008	tek		01aug97		Bats 404 (and 256, 267); handle new sync pkt types.
 *		tek		13nov97		merge in above aug97 changes
 * xx	tek		07jan98		support visual notification in DAPI (bats 546)
 * xx	tek		12feb98		fix detection of no-more-audio in WFASTP
 * 011  MGS		05/22/1998	Added include pf playaudd.h for __osf__
 * xx	tek		16sep98		change WFASTP to bail out on reset
 * xx	tek		30sep98		free visual marks on reset to avoid memory leak
 * 014  ETT		10/05/1998  Added Linux code.
 * 014	GL		11/20/1998	BATS#828 use VTM_DEBUG to replace _DEBUG
 * 015	tek		13jan98		bats850: use PumpModeMessage when sleeping.
 * 016	mfg	    13apr99		to fixed ACCESS32 studder for ARM211 tek fix
 * 017  nal		06/12/2000	Warning removal
 * 018	MGS		07/14/2000	Sapi 5 additions
 * 019	MGS		10/05/2000	Redhat 6.2 and linux warning removal
 * 020 	CAB		10/16/2000	Changed copyright info
 * 021	MFG		12/21/2000	fixed Windows CE warnings
 * 022	MGS		02/08/2001	Added some Linux debugging code
 * 023  CAB		02/12/2001	Updated copyright info
 * 024	MGS		02/28/2001	Merged in base changes needed for ACCESS32 merge
 * 025	MGS		03/27/2001	Visual marks for Tru64
 * 026	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 027	MFG		05/29/2001	Included dectalkf.h
 * 028	MGS		06/19/2001	Solaris Port BATS#972, Fixed next phoneme in visual marks
 * 029	MGS		02/26/2002	Trial SDK Noise
 * 030	MGS		03/20/2002	Single threaded vtm
 * 031	MGS		03/21/2002	Single threaded ph
 * 032	MGS		04/03/2002	Single threaded lts
 */

/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/

/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
#include <windows.h>
#include <mmsystem.h>
#include "dectalkf.h"
#include "port.h"
#include "defs.h"
#include "kernel.h"
#include "ph_def.h"    /* MVP : Now phinst.h includes phdefs.h */
#include "samprate.h"
#include "tts.h"
#include "playaud.h"
#include "vtminst.h"            /* MVP MI */
#endif
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#include "playaudd.h"
#include "opthread.h"
#ifdef VXWORKS
#include <time.h>
#include <timers.h>
#else
#include <sys/time.h>
#endif
#include <unistd.h>
#include <stdlib.h>
#if !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
#include <mmsystem.h>
#endif
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

#ifdef UNDER_CE
extern DWORD timeGetTime(void);
#endif
#ifdef VTM_DEBUG
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#undef timeGetTime
#define timeGetTime() (unsigned long)(time(NULL))
#undef OutputDebugString
#define OutputDebugString(x) printf(x)
#endif	/* defined __osf__ || defined __linux__ */
#endif	/* VTM_DEBUG */

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

// tek 08jan98 bats546 this now returns a value.
static DWORD WaitForAudioSampleToPlay( PKSD_T ,LPAUDIO_HANDLE_T, DWORD);

/**********************************************************************/
/*  Start of the VTM thread.                                          */
/**********************************************************************/
/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
DWORD __stdcall sync_main( LPTTS_HANDLE_T phTTS )
#endif
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
OP_THREAD_ROUTINE(sync_main, LPTTS_HANDLE_T phTTS)
#endif
{
  DWORD control;
  DWORD	dwSampleToWaitFor=0;	//tek 07aug97 sapi notifications
//#ifdef WIN32 // this is for visual notifications.  we may want to turn these on for UNIX
  DWORD dwTimeSamplePlayed=0;	// tek 08jan98 bats 546
//#endif
  DWORD dwSyncParams[3];
  LPAUDIO_HANDLE_T pAudioHandle;
  /*MVP : Get the instance kernel_share data structure,instance VTM thread data */
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  //PVTM_T pVtm_t = phTTS->pVTMThreadData; // MGS warning removal
  LPARAM	lparmIndexValue=0; // 01aug97 bats 404 et al
  
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
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
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
	OP_SetEvent( phTTS->hSyncEvent );
#endif
	break;	// end of the basic SPC_type_sync

	case SPC_type_visual: // tek 27aug97
		// this is a lot like the index types below, but that was getting so 
		// cluttered that I put it in a separate case arm. 
		read_pipe( pKsd_t->sync_pipe, dwSyncParams, 3 );  // get the rest of the pkt
//#ifdef WIN32 // tek 08jan98 we only process these for WIN32 for now.
		// wait for it to play
		if (dwSyncParams[2]) //toss nulls
		{
#ifdef __osf__ 
			PVISUAL_DATA pvdData = (PVISUAL_DATA)((((long)(dwSyncParams[1])) << 32) | (long)(dwSyncParams[2])); // tek 21sep98
#else
			PVISUAL_DATA pvdData = (PVISUAL_DATA)(dwSyncParams[2]); // tek 21sep98
#endif
			dwSampleToWaitFor = (DWORD)((PVISUAL_DATA)(pvdData))->qTimeStamp&0x00000000FFFFFFFF; // NAL warning removal
			// tek 03sep97 note that we always get a visual notification before we send any samples, 
			// so we need to bump this by one so that this first notification doesn't happen
			// before we catually start playing audio..
			if (dwSampleToWaitFor == 0)
				dwSampleToWaitFor = 1;

#ifdef VTM_DEBUG //tek 17aug97
			{
				char szTemp[256]="";
				sprintf(szTemp,"sync: should wait for %lu at %lu\n",
					dwSampleToWaitFor,
					timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //VTM_DEBUG

		 	if (   (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
				 &&(!pKsd_t->halting)
			   )
			  {
				dwTimeSamplePlayed = WaitForAudioSampleToPlay( phTTS->pKernelShareData,
									  pAudioHandle,
									  dwSampleToWaitFor
							);
			  }
			else
			{
#ifdef VTM_DEBUG
				{
				char szTemp[256]="";
				sprintf(szTemp,"sync: did not wait?\n");
				OutputDebugString(szTemp);
				}
#endif //VTM_DEBUG

			}
#ifdef VTM_DEBUG //tek 17aug97
			{
				char szTemp[256]="";
				sprintf(szTemp,"sync: VisMes=%u, pMarkData=0x%08lx exactSamp:%ld at %lu\n",
					phTTS->uiID_Visual_Message,
					dwSyncParams[2],
					dwSampleToWaitFor,
					timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //VTM_DEBUG

			// tek 07jan98 bats 546
			// the report format is different for DAPI and SAPI;
			// SAPI takes the Visual_Data and unpacks it in the 
			// API code (which receives the Report_TTS_Status),
			// but DAPI needs to pack up the data and free the
			// structure because the user may be ignoring this
			// (which would be a memory leak if we passed back the
			// pvd pointer..).
			// the DAPI wparam is the time (compatible with timeGetTime())
			// that the phoneme actually started to play)
			
			//tek 21sep98 toss any visual marks if we're halting.
			if (pKsd_t->halting)
			{
#ifdef VTM_DEBUG
				char szTemp[256];
				sprintf(szTemp, "sync freeing %08lx due to halting at %lu\n",
					pvdData, timeGetTime());
				OutputDebugString(szTemp);
#endif //VTM_DEBUG
				free(pvdData);
			}
			else
			{
#ifdef OLEDECTALK // the SAPI version..
			  Report_TTS_Status(  phTTS,
								phTTS->uiID_Visual_Message,
								(WPARAM)0,
								(LPARAM)dwSyncParams[2]);
#else // !OLEDECTALK, the DAPI version
			  {
				  PHONEME_TAG ptTag;
				  // fill in the fields..
				  if (phTTS->uiFullRangeMarks)
				  {
					  ptTag.pmData2.cThisPhoneme = pvdData->dwPhoneme;
					  ptTag.pmData2.cNextPhoneme = pvdData->dwNextPhoneme;
				  }
				  else
				  {
					  ptTag.pmData.cThisPhoneme = pvdData->cEnginePhoneme;
					  ptTag.pmData.cNextPhoneme = pvdData->cNextEnginePhoneme;
				  }
				  ptTag.pmData.wDuration = (WORD)(pvdData->dwDuration);

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
				if (phTTS->uiID_Visual_Message!=0xDEADC0DE)
#endif
				{
				  if (phTTS->uiFullRangeMarks)
				  {
					  Report_TTS_Status(  phTTS,
								phTTS->uiID_Visual_Message,
								(WPARAM)dwTimeSamplePlayed,
								(LPARAM)(&ptTag));				  
				  }
				  else
				  {
					  Report_TTS_Status(  phTTS,
								phTTS->uiID_Visual_Message,
								(WPARAM)dwTimeSamplePlayed,
								(LPARAM)ptTag.dwData);				  
				  }
				}
				// free the holder of the data..
				free(pvdData);

			  }
#endif //OLEDECTALK
			}
		}
//#endif //WIN32

	break; // end of SPC_type_visual


	case SPC_type_index:
	case (SPC_type_index|SPC_subtype_bookmark):	//tek 01aug97 bats 404
	case (SPC_type_index|SPC_subtype_wordpos):
	case (SPC_type_index|SPC_subtype_start):
	case (SPC_type_index|SPC_subtype_stop):
	case (SPC_type_index|SPC_subtype_volume):
	case (SPC_type_index|SPC_subtype_noise):
	// tek 15aug97 these are now all changed to always either process the
	// mark or free the contained memory,

	read_pipe( pKsd_t->sync_pipe, dwSyncParams, 3 );


	  /************************************************************/
	  /*  If the audio device is being used then wait for the     */
	  /*  specified audio sample to play.                         */
	  /************************************************************/
#ifdef OLEDECTALK
		// the sample to wait for is now tucked inside a MARK_DATA structure
		// within the vtm task.. unpack it.
		dwSampleToWaitFor = ((PMARK_DATA)(dwSyncParams[2]))->qTimeStamp&0x00000000FFFFFFFF;
#else //OLEDECTALK
		dwSampleToWaitFor = dwSyncParams[2];
#endif //OLEDECTALK
	  //tek 07aug97
#ifdef VTM_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"Sync (type %x) waiting for sample %08lx at %lu\n",
				(int)control,dwSampleToWaitFor,timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //VTM_DEBUG

	  if (   (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
		   &&(!pKsd_t->halting)
		 )
	  {
		WaitForAudioSampleToPlay( phTTS->pKernelShareData,
							  pAudioHandle,
							  dwSampleToWaitFor
					);
	  }

	  if ( ! pKsd_t->halting ) // we have to look again after sleeping
	  {
		  // tek 01aug97 bats404 

		  // glue together the two halves of the index value..
		  lparmIndexValue =  (LPARAM)( (dwSyncParams[0]<<16) | (dwSyncParams[1]&0xFFFF));
#ifdef VTM_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"Sync type %d param[2]=%08lx at %lu\n",
				control, dwSyncParams[2],timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //VTM_DEBUG


		  // report the event..

		  switch(control)
		  {
		  case (SPC_type_index|SPC_subtype_bookmark):
#ifdef OLEDECTALK
		    lparmIndexValue = (LPARAM)(dwSyncParams[2]);
			if (lparmIndexValue) //toss nulls
#endif //OLEDECTALK
				Report_TTS_Status(phTTS,phTTS->uiID_Bookmark_Message,(WPARAM)TTS_INDEX_BOOKMARK,lparmIndexValue);
			break;
		  case (SPC_type_index|SPC_subtype_wordpos):
#ifdef OLEDECTALK
		    lparmIndexValue = (LPARAM)(dwSyncParams[2]);
			if (lparmIndexValue) //toss nulls
#endif //OLEDECTALK
 				Report_TTS_Status(phTTS,phTTS->uiID_Wordpos_Message,(WPARAM)TTS_INDEX_WORDPOS,lparmIndexValue);
			break;
		  case (SPC_type_index|SPC_subtype_start):
#ifdef OLEDECTALK
		    lparmIndexValue = (LPARAM)(dwSyncParams[2]);
			if (lparmIndexValue) //toss nulls
#endif //OLEDECTALK
 				Report_TTS_Status(phTTS,phTTS->uiID_Start_Message,(WPARAM)TTS_INDEX_START,lparmIndexValue);
			break;
		  case (SPC_type_index|SPC_subtype_stop):
#ifdef OLEDECTALK
#ifdef VTM_DEBUG
			  {
				  OutputDebugString("SPC_subtype_stop being reported.\n");
			  }
#endif //VTM_DEBUG
		    lparmIndexValue = (LPARAM)(dwSyncParams[2]);
			if (lparmIndexValue) //toss nulls
#endif //OLEDECTALK
 				Report_TTS_Status(phTTS,phTTS->uiID_Stop_Message,(WPARAM)TTS_INDEX_STOP,lparmIndexValue);
			break;

		  default:
 			Report_TTS_Status(phTTS,phTTS->uiID_Index_Message,(WPARAM)TTS_INDEX_MARK,(LPARAM)dwSyncParams[0]);
			break;
		  } // switch

	  }	// (  ! pKsd_t->halting )
	  else
	  {
#ifdef OLEDECTALK
		  // free the memory
#ifdef VTM_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"Sync freeing %08lx at %lu\n",
				dwSyncParams[2],timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //VTM_DEBUG

		  free((void *)(dwSyncParams[2]));
#endif //OLEDECTALK
	  }
	break;  //end of special subtypes

	default:
	  break;
	}
  }
/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
  return( FALSE );
#endif
#ifdef __osf__
  OP_ExitThread(phTTS->uiThreadError);
  OP_THREAD_RETURN;
#endif
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  OP_ExitThread(&phTTS->uiThreadError);
  OP_THREAD_RETURN;
#endif
}

// tek 08jan98 bats 546 DAPI visual mark changes
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
/*    time, in system milliseconds, when the sample actually played.                 */
/*    (note that this is a bogus number for non-Windows at this point;*/
/*    other systems don't use the information.)                       */
/*                                                                    */
/**********************************************************************/

static DWORD WaitForAudioSampleToPlay( PKSD_T pKsd_t ,
									  LPAUDIO_HANDLE_T pAudioHandle,
									  DWORD dwSampleNumber
									  )
{
#ifndef SINGLE_THREADED
	UINT uiVtmCount=0;
	UINT uiPhCount;
	UINT uiLtsCount;
#endif
	int	iQueueCount;
	DWORD dwPosition=0;
	int iSleepTimeInMsec;
	MMRESULT mmStatus;
	double		dMsecPerSample=0;	//22may97 tek
	DWORD	dwTime=0;	// tek 08jan98 bats 546 this generally
	// holds the current system time, but is
	// not used for OSF.
#if defined __osf__ || defined __linux__ || defined _SPARC_SOLARIS_
	struct timeval tv;
#endif
#ifdef VXWORKS
	struct timespec ts;
#endif
#ifndef OLEDECTALK // tek 30jun97 not used in SAPI
	//WAVEFORMATEX	wfexWaveFormat;	//22may97 tek // NAL warning removal
#endif //OLEDECTALK
	
	//22may97 tek calculate the factor we use to figure our sleeps
	// 01aug97 tek bats 423
	// this is now precalculated when the format is set.
	
	if (  (pAudioHandle)
		&&(pAudioHandle->dMsecPerSample)
		)
	{
		dMsecPerSample = pAudioHandle->dMsecPerSample;
	}
	else
	{
		dMsecPerSample = 0.01; // dummy in case we're not fully init'd
	}
	
	
	while ( TRUE )
	{
		/******************************************************************/
		/*  If halting then return.                                       */
		/******************************************************************/
		
		if ( pKsd_t->halting )
			return dwTime;
		
		// tek 31jul97 bats 422
		// if we were asked to wait for sample "-1", just return,
		if (dwSampleNumber >= 0xFFFFFFFE)
			return dwTime;
		
		/******************************************************************/
		/*  When the audio sample "dwSampleNumber" plays then             */
		/*  synchronization has been achieved.                            */
		/******************************************************************/
		
		mmStatus = PA_GetPosition( pAudioHandle, &dwPosition, FALSE );
#ifdef WIN32
		// we only keep track of time on windows systems
		dwTime = timeGetTime();
#endif //WIN32
#if defined __osf__ || defined __linux__ || defined _SPARC_SOLARIS_
		gettimeofday(&tv,NULL);
		dwTime=(tv.tv_sec%1000000)*1000 + (tv.tv_usec/1000);
#endif
#ifdef VXWORKS
		clock_gettime(CLOCK_REALTIME,&ts);
		dwTime=(ts.tv_sec%1000000)*1000 + (ts.tv_nsec/1000000);
#endif
		
#ifdef VTM_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"WFASTP: waiting for %08lx, now=%08lx\n",
				dwSampleNumber, dwPosition);
			OutputDebugString(szTemp);
		}
#endif //VTM_DEBUG
		
		if ( mmStatus == MMSYSERR_NOERROR )
		{
			if ( dwPosition < dwSampleNumber )
			{
				/******************************************************************/
				/*  If halting then return.                                       */
				/******************************************************************/
				
				if ( pKsd_t->halting )
					return dwTime;	// tek 14sep98 abort if halting..
				
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
					// tek 03sep97
					// I don't think that is a good indicator of whether the audio has
					// started to play. In the case of a short block of text to speak,
					// these pipes could empty before the audio device actually
					// gets around to playing samples. What we need to do is make
					// sure that there isn't anything waiting to send (in addition 
					// to these tests..) I suspect, however, that we only have to 
					// worry about this for SAPI, because the startup path is long
					// in that case.
					
					// tek 12feb98 fixed: we use PA_GetQWPosition to get the sum of the
					// samples in the queue and those already sent.
					
#ifndef SINGLE_THREADED
					uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
					uiPhCount = pipe_count( pKsd_t->ph_pipe );
					uiLtsCount = pipe_count( pKsd_t->lts_pipe );
#endif
#ifdef OLEDECTALK
					{
						// tek 12feb98 do this correctly.
						QWORD qwCount=0;
						PA_GetQWPosition(pAudioHandle, &qwCount);
						iQueueCount = (qwCount>0) ? 1:0;
					}
#else //OLEDECTALK
#ifdef SAPI5DECTALK
					iQueueCount = pAudioHandle->pAudioQueue->iQueueCount; // tek 07apr99 DAPI needs this too, at least on CE
#else
					iQueueCount = pAudioHandle->pPlayAudioRing->iQueueCount; // tek 07apr99 DAPI needs this too, at least on CE
#endif

#endif //OLEDECTALK
					
#ifdef VTM_DEBUG
					{
						char szTemp[256]="";
						sprintf(szTemp,"WFASTP: pos=0; vtm=%u ph=%u lts=%u q= %d\n",
							uiVtmCount, uiPhCount, uiLtsCount, iQueueCount );
						OutputDebugString(szTemp);
					}
#endif //VTM_DEBUG
					
					if ( (iQueueCount == 0) 
#ifndef SINGLE_THREADED
						&& ( uiVtmCount == 0 )
						&& ( uiPhCount == 0 )
						&& ( uiLtsCount == 0 )
#endif
						)
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
				if (   (iSleepTimeInMsec < SLEEP_TIME_MARGIN)
					&& (dwPosition != 0) ) // tek 13apr99 never play "close enough" if not started!
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
				
				/* wake up the timer thread, incase it is stuck */
				OP_SetEvent(pAudioHandle->hevTimerThreadActive);

				/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32

			PumpModeMessage(pAudioHandle);
				Sleep((DWORD)iSleepTimeInMsec );
#endif
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
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
		return dwTime; // panic exit?
	}
  }
  // normal exit; if this is a WIN32 system, we calculate the actual
  // time that the sample played. (tek 08jan98 bats 546)
#ifdef WIN32
  {
	  long lTemp=0;
#ifdef VTM_DEBUG
	  {
		  char szTemp[256]="";
		  sprintf(szTemp,"WFASTP: done! now=%ld, pos=%ld, num=%ld, ",
			  dwTime, dwPosition, dwSampleNumber);
		  OutputDebugString(szTemp);
	  }
#endif //VTM_DEBUG  
	  lTemp = (long)( ((long)dwPosition-(long)dwSampleNumber) * dMsecPerSample ); // NAL warning removal
	  dwTime  = dwTime - lTemp;
#ifdef VTM_DEBUG
	  {
		  char szTemp[256]="";
		  sprintf(szTemp,"act=%ld [%08lx] (temp=%ld)\n",
			  dwTime, dwTime, lTemp);
		  OutputDebugString(szTemp);
	  }
#endif //VTM_DEBUG  
  }
#endif //WIN32
  return dwTime;
}
