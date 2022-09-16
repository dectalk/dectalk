// File name: auddest.cpp
// Author   : Murthy Parakala
// Version  : 1.0
// Date     : December 18,1995

// Copyright (c) 1995-1998 Digital Equipment Corporation

// Description: This file contains the routines to interface low-level
// DECtalk audio with audio-destination object to make DECtalk software
// an OLE application.

// 12nov97	tek		clean up and fix things that never worked. Grr.
//					(this is a general audio cleanup, motivated by the
//					need to get SAPI to work correctly - especially
//					in the area of notifications and stuttering)
//					(the original dates of the changes are in aug97)
// 19nov97  cjl     change speech.h to local
// 30jan98	tek		BATS556: guard against DestroyAudioObjects when 
//					m_pDECtalk isn't yet valid.
// 11feb98	tek		Fix screeching bug (odd number of bytes being queued),
//					and spurious clear of m_fPaused in PrepareRingBufferToSendSamples
//					(12feb) don't DataSet if not claimed in SendAudioToDestinationBuffer
//					(12feb) don't look at bRanDry in ProcessAudio (both are pause bugs)
// 09mar98	tek		sapi backend timing (group h)
// 18mar98	tek		bats 608/609/620: audio format support
// 18mar98      cjl             Removed specific path for dectalkf.h.
// 12may98	tek		bats665: correctly handle files as audio destination
// 13may98	tek		bats666: don't unclaim until m_bTextDataDone
// 08jun98	tek		sapi dialogs
// 06aug98	tek		bats739: avoid spurious AudioStop when using a file destination
// 30sep98	tek		correct startup and buffering when writing to files
//

#include "dectalkf.h"


#ifndef _AFXDLL  //tek 08jun98 MFC for dialogs
#include <windows.h>
#else //_AFxDLL
#include "stdafx.h"
#endif //_AFXDLL

#include <mmsystem.h>         // Multi-media specific header file

#include <objbase.h>          // OLE component-object model specific header file
#include <objerror.h>         // OLE specific error reporting
// cjl 19nov97 change speech.h to local
#include "speech.h"
#include "dtlktts.h"          // CMode (speech engine mode class)
#include "audiodef.h"         // Common header file between
#include "opthread.h"		  // audqueue.c  (low-level DECtalk audio)
							  // auddest.cpp (OLE-interface audio)

#define  MAXIMUM_WRITE_LENGTH               12402   // (1378*8)	(more than 1/2 sec of audio)
#define  STARTUP_WRITE_SIZE                 4134   // 3*1378
#define  MAXIMUM_BUFFERS_QUEUED                3
#define  NOTHING_SENT						   0
#ifdef DEBUG
static FILE *fDebug = NULL;
#endif


void CMode::SendMoreAudioSamplesOnNotifyFreeSpace(DWORD dwNotifiedCurrentFreeBufferLength)
{
	INT iLength;
	LPAUDIO_PARAMS_T pAudioParams = NULL;
	LPQUEUE_T pAudioQueue = NULL;
	CHAR c;

	pAudioParams = m_pDECtalk->pAudioHandle;
	pAudioQueue = pAudioParams->pAudioQueue;


	// MVP: The QueueCount should have value 0 only when it has
	// reached the end of text to be spoken

	EnterCriticalSection(pAudioParams->pcsQueueCount);
	iLength = pAudioQueue->iQueueCount;
	LeaveCriticalSection(pAudioParams->pcsQueueCount);
#ifdef _DEBUG // tek 08aug97
		{
			char szTemp[256]="";
			sprintf(szTemp,"CMode::SendMoreAudioSamplesOnNotifyFreeSpace iLength=%d, CurFree=%lu done(%08lx)=%d at %lu\n",
				iLength,dwNotifiedCurrentFreeBufferLength,&m_bTextDataDoneFlag,(int)m_bTextDataDoneFlag,timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //_DEBUG
   if (iLength==0 && !m_bTextDataDoneFlag)
   {
	   pAudioParams->bAudioRanDry = TRUE;
   }
					  
   else if((!pAudioParams->bAudioIsFile) // tek bats665 12may98 meaningless for files.
	    && (dwNotifiedCurrentFreeBufferLength == m_dwAudioDestObjectBufferLength)
		&& (!iLength))
	{
		// tek 15aug97 This is a LOT different. The processing of the
		// stop message conditionally sets the TextDataDone flag, which
	    // now means we ran out of input text. If we get here when that 
	    // is set, we can unclaim the audio as a prelude to completion.
#ifndef SAPI_GROUP_H_TIMING
		if (m_bTextDataDoneFlag)
		{

#ifdef _DEBUG // tek 08aug97
			{
				char szTemp[256]="";
				sprintf(szTemp,"CMode::SendMoreAudioSamplesOnNotifyFreeSpace Unclaim count=%d at %lu\n",
					iLength,timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //_DEBUG

			m_pAudioIAudio->UnClaim();
	  		m_fClaimed = FALSE;
			// tek 08aug97 move this state change to AudioStop to avoid
			// premature notifications
			//EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
			//pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_INACTIVE;
			//LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
			//SetEvent( pAudioParams->hAudioDeviceInactive );
			//Unblock the timer thread
			OP_SetEvent( pAudioParams->hevTimerThreadActive );
		}
#else  // SAPI_GROUP_H_TIMING

	    //
	    // tek 06mar98 no again. Let the timer do the unclaim for us.
		//Unblock the timer thread
			OP_SetEvent( pAudioParams->hevTimerThreadActive );

#endif // SAPI_GROUP_H_TIMING
	}
	else
	{

		EnterCriticalSection(pAudioParams->pcsQueueCount);
		iLength = (pAudioQueue->iQueueCount <
					(int)dwNotifiedCurrentFreeBufferLength)
					? pAudioQueue->iQueueCount :(int)dwNotifiedCurrentFreeBufferLength;

		LeaveCriticalSection(pAudioParams->pcsQueueCount);
		if(iLength >0)
		{
			//SendAudioToDestinationBuffer(iStartupWriteLength);
			PrepareRingBufferToSendSamples(pAudioParams);
		}

	}
	/********************************************************************/
	/*  Signal that the Queue is (potentially) not full.                */
	/********************************************************************/
	SetEvent( pAudioParams->hQueueNotFull );
}




void CMode::DestroyAudioObjects()
{
  LPAUDIO_PARAMS_T pAudioParams = NULL;
  LPQUEUE_T pAudioQueue = NULL;
  THREAD_STATUS_T ThreadStatus;
  //tek 29jan98 we can be called under some conditions without having a
  // valid m_pDECtalk. Abort if so.
  if (!m_pDECtalk)
	  return;

  pAudioParams = m_pDECtalk->pAudioHandle;
  /********************************************************************/
  /*  Return if NULL handle.                                          */
  /********************************************************************/

  if (!pAudioParams)
	return;
  /******************************************************************/
  /*  Cause the timer thread to exit.                               */
  /******************************************************************/

  if ( pAudioParams->hTimerThread != NULL )
  {
     pAudioParams->bTimerExit = TRUE;

     if ( pAudioParams->hevTimerThreadActive != NULL )
     {
        OP_SetEvent( pAudioParams->hevTimerThreadActive );
     }

     OP_WaitForThreadTermination( pAudioParams->hTimerThread,
                                   &ThreadStatus );
  }

  SetEvent( pAudioParams->hAudioDeviceInactive );
  SetEvent( pAudioParams->hAudioNotPaused );
  
  /******************************************************************/
  /*  Free the Audio Queue memory.                                  */
  /******************************************************************/

	pAudioQueue = pAudioParams->pAudioQueue;

	if ( pAudioQueue != NULL )
	{
	  /****************************************************************/
	  /*  Free Memory for the Audio Queue sample buffer.              */
	  /****************************************************************/

	  if ( pAudioQueue->pQueueStart != NULL )
		free( pAudioQueue->pQueueStart );

	  /****************************************************************/
	  /*  Free Memory for the Audio Queue Structure.                  */
	  /****************************************************************/

	  free( pAudioQueue );
	}

	/******************************************************************/
	/*  Free the "Queue Audio Busy" critical section object.          */
	/******************************************************************/

	if ( pAudioParams->pcsQueueAudioBusy != NULL )
	{
	  DeleteCriticalSection( pAudioParams->pcsQueueAudioBusy );
	  free( pAudioParams->pcsQueueAudioBusy );
	}

	/******************************************************************/
	/*  Free the "Queue Count" critical section object.               */
	/******************************************************************/

	if ( pAudioParams->pcsQueueCount != NULL )
	{
	  DeleteCriticalSection( pAudioParams->pcsQueueCount );
	  free( pAudioParams->pcsQueueCount );
	}

	/******************************************************************/
	/*  Free the "Audio Device State" critical section object.        */
	/******************************************************************/

	if ( pAudioParams->pcsAudioDeviceState != NULL )
	{
	  DeleteCriticalSection( pAudioParams->pcsAudioDeviceState );
	  free( pAudioParams->pcsAudioDeviceState );
	}

	/******************************************************************/
	/*  Free the handle to the "Queue Not Full" event.                */
	/******************************************************************/

	if ( pAudioParams->hQueueNotFull != NULL )
	  CloseHandle( pAudioParams->hQueueNotFull );

    /******************************************************************/
    /*  Destroy the "Timer Thread Active" event.                      */
    /******************************************************************/

    OP_DestroyEvent( pAudioParams->hevTimerThreadActive );

	/******************************************************************/
	/*  Free the handle to the "Audio Not Paused" event.              */
	/******************************************************************/

	if ( pAudioParams->hAudioNotPaused != NULL )
	  CloseHandle( pAudioParams->hAudioNotPaused );

	/******************************************************************/
	/*  Free the handle to the "Audio Device Inactive" event.         */
	/******************************************************************/

	if ( pAudioParams->hAudioDeviceInactive != NULL )
	  CloseHandle( pAudioParams->hAudioDeviceInactive );


	/******************************************************************/
	/*  Free the audio handle.                                        */
	/******************************************************************/
	free( pAudioParams );

  return;
}



INT CMode::SendAudioToDestinationBuffer(INT iLength)
{
	LPAUDIO_PARAMS_T pAudioParams;
	LPQUEUE_T pAudioQueue;
	DWORD dwBufferSizeAvailable;
	BOOL  bEOF;
	INT iNumberOfSamplesToSend;
	CHAR c;

	pAudioParams = m_pDECtalk->pAudioHandle;
	pAudioQueue = pAudioParams->pAudioQueue;
#ifdef _DEBUG // tek 08aug97
		{
			char szTemp[256]="";
			sprintf(szTemp,"CMode::SendAudioToDestinationBuffer(%d) at %lu\n",
				iLength,timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //_DEBUG
#ifdef SAPI_GROUP_H_TIMING

	EnterCriticalSection( pAudioParams->pcsQueueCount );   //tek 05mar98 we need to be careful about race condx!
	// now that we're in here, we can double-check that there is actually
	// something that we can send.. if we're in a race, the loser will possibly
	// see nothing to send..
	if (!pAudioQueue->iQueueCount)
	{
#ifdef _DEBUG
		{
			char szTemp[256];
			sprintf(szTemp,"CMode::SendAudioToDestinationBuffer not sending: iQueueCount=0 at %ld\n",
				timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //_DEBUG
		LeaveCriticalSection( pAudioParams->pcsQueueCount );
		return NOTHING_SENT;
	}
	// make sure that we won't try to send more than actually exists
	// (again, this is only important in a race)
	if (iLength > pAudioQueue->iQueueCount)
	{
		iLength = pAudioQueue->iQueueCount;
	}
	// tek 06mar98 end of race handling

#endif // SAPI_GROUP_H_TIMING

	// tek 12feb98 if we're not claimed, don't send anything (because the
	// destination will toss it). This is the pause-textdata-resume case.
#ifndef SAPI_GROUP_H_TIMING
	if (!m_fClaimed)
#else // SAPI_GROUP_H_TIMING
	// tek 06mar98 we also can't send if we're paused, because if we send
	// all the available samples, the PrepareRingBufferToSendSamples that 
	// happens as a result of the resume will see that we have nothing to 
	// send and will unclaim - causing a spurious stop-start.
	if (   (!m_fClaimed)
		|| (m_fPaused)
		)
	{
#ifdef _DEBUG
		{
			char szTemp[256];
			sprintf(szTemp,"CMode::SendAudioToDestinationBuffer not sending: claim=%d pause=%d at %ld\n",
				(int)m_fClaimed, (int)m_fPaused, timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //_DEBUG
		LeaveCriticalSection( pAudioParams->pcsQueueCount );
#endif // SAPI_GROUP_H_TIMING

		// tek 23sep98 if we're not paused AND we're writing to a file, 
		// do NOT bail out here. We don't have to worry about stuttering,
		// so just attempt the write.
		if (  (m_fPaused)
			||(!pAudioParams->bAudioIsFile) )
		{
		return NOTHING_SENT;
		}
		else
		{
#ifdef _DEBUG
			{
				char szTemp[256];
				sprintf(szTemp,"CMode::SendAudioToDestinationBuffer dest is file; will send at %ld\n",
					(int)m_fClaimed, (int)m_fPaused, timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //_DEBUG
		}
#ifdef SAPI_GROUP_H_TIMING
	}
#endif //SAPI_GROUP_H_TIMING

	m_pAudioIAudioDest->FreeSpace(&dwBufferSizeAvailable,&bEOF);
	// tek bats665 12may98 FreeSpace lies if the destination is a file.
	// overwrite the return value here.
	if (pAudioParams->bAudioIsFile)
	{
		dwBufferSizeAvailable = iLength;
	}

	// tek 06mar98 dead code removed here.
	// (Get1Char, etc)

	// tek 08aug97 the eventual state we end up in is that we keep trying to 
	// send a lot, but there is only enough room for a little; this leaves us
	// processing a LOT of FreeSpace/DataSet pairs with very little data
	// actually moving.. So, if there isn't enough space to send at least
	// 1/4 of the amount we've been asked to send, don't even bother.
	if (dwBufferSizeAvailable < (iLength/4))
	{
 #ifdef _DEBUG // tek 08aug97
		{
			char szTemp[256]="";
			sprintf(szTemp,"CMode::SendAudioToDestinationBuffer: only %lu bytes free; punting\n",
				dwBufferSizeAvailable);
			OutputDebugString(szTemp);
		}
#endif //_DEBUG
#ifdef SAPI_GROUP_H_TIMING
		LeaveCriticalSection( pAudioParams->pcsQueueCount ); // tek 06mar98
#endif //SAPI_GROUP_H_TIMING
		return NOTHING_SENT;
	}

	// tek 08aug97 after each of the various DataSet calls, clear the RanDry flag.
	if(!dwBufferSizeAvailable)
	{
#ifdef SAPI_GROUP_H_TIMING
		LeaveCriticalSection( pAudioParams->pcsQueueCount ); // tek 06mar98
#endif
		return NOTHING_SENT;
	} 

	iNumberOfSamplesToSend = (iLength < (int)dwBufferSizeAvailable) ? 
								iLength :(int)dwBufferSizeAvailable;
#ifdef _DEBUG // tek 08aug97
		{
			char szTemp[256]="";
			sprintf(szTemp,"CMode::SendAudioToDestinationBuffer might send  %d at %lu\n",
				iNumberOfSamplesToSend,timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //_DEBUG

#ifdef DEBUG
	fprintf(fDebug,"Outpos in SendAudio [%d]\n",(pAudioQueue->iOutputPosition));
	fprintf(fDebug,"The Samples to send in SendAudio[%d]\n",iNumberOfSamplesToSend);
#endif
	if(pAudioQueue->iOutputPosition + iNumberOfSamplesToSend >= pAudioQueue->iQueueLength)
	{
		int iNumberOfSamplesToWrap,iNumberOfSamplesToReachEndOfQueue;
#ifdef DEBUG		
		fprintf(fDebug,"Outpos:[%d] and QueueLen[%d]\n",
			pAudioQueue->iOutputPosition,pAudioQueue->iQueueLength);
		fprintf(fDebug,"Wrapping at the output for queue\n");
#endif

		iNumberOfSamplesToReachEndOfQueue  = pAudioQueue->iQueueLength
											- pAudioQueue->iOutputPosition;

		iNumberOfSamplesToWrap = iNumberOfSamplesToSend - iNumberOfSamplesToReachEndOfQueue;

		if(iNumberOfSamplesToReachEndOfQueue >0)
		{
#ifdef DEBUG
			fprintf(fDebug,"DataSet to reach END ofQueue[%d]\n",
				iNumberOfSamplesToReachEndOfQueue);
#endif
			m_pAudioIAudioDest->DataSet(pAudioQueue->pQueueOutput,
									iNumberOfSamplesToReachEndOfQueue); // MVP : You reached end of queue
			pAudioParams->bAudioRanDry = FALSE; //tek 08aug97
		}
		if(iNumberOfSamplesToWrap >0)
		{
#ifdef DEBUG
			fprintf(fDebug,"DataSet to Wrap around Queue[%d]\n",
				iNumberOfSamplesToWrap);
#endif
			m_pAudioIAudioDest->DataSet(pAudioQueue->pQueueStart,
									iNumberOfSamplesToWrap);
			pAudioParams->bAudioRanDry = FALSE; //tek 08aug97

		}

		pAudioQueue->pQueueOutput = pAudioQueue->pQueueStart + iNumberOfSamplesToWrap;
		pAudioQueue->iOutputPosition = iNumberOfSamplesToWrap;
	}
	else
	{
#ifdef DEBUG
			fprintf(fDebug,"Normal DataSet [%d]\n",
				iNumberOfSamplesToSend);
			fprintf(fDebug,"Outpos in Noraml DataSet [%d]\n",
				pAudioQueue->iOutputPosition);
#endif
		m_pAudioIAudioDest->DataSet(pAudioQueue->pQueueOutput,iNumberOfSamplesToSend);
		pAudioParams->bAudioRanDry = FALSE; //tek 08aug97

		pAudioQueue->pQueueOutput += iNumberOfSamplesToSend;
		pAudioQueue->iOutputPosition += iNumberOfSamplesToSend;
	}
	// MVP: Store NoOFsamplesQueued sofar here
	//pAudioParams->dwSamplesPlayed +=iNumberOfSamplesToSend;

#ifndef SAPI_GROUP_H_TIMING
	EnterCriticalSection( pAudioParams->pcsQueueCount );
#else
	//EnterCriticalSection( pAudioParams->pcsQueueCount );   //tek 05mar98 we need to hold this earlier!
#endif // SAPI_GROUP_H_TIMING
	pAudioQueue->iQueueCount -= iNumberOfSamplesToSend;
	LeaveCriticalSection( pAudioParams->pcsQueueCount );

	// tek 08aug97  Signal that the Queue is (potentially) not full.                */
	SetEvent( pAudioParams->hQueueNotFull );
#ifdef SAPI_GROUP_H_TIMING


	// tek 20feb98 start audio here, if we haven't started it yet..
	if (   !m_fStarted
		&& !m_fPaused)
	{
		// if there have been at least STARTUP_WRITE_SIZE bytes queued, start.
		// because the counts don't return to zero, we have to look at the
		// deiiference between the total and played counts. Further, because
		// PosnGet lies when audio isn't playing, we have to keep track of the
		// starting time ourselves (in m_qwBaseAudioPosition)
		QWORD qwCountT=0, qwCount=0;
		m_pAudioIAudio->TotalGet(&qwCountT);
		qwCount = qwCountT - m_qwBaseAudioPosition;

		// tek 23sep98 if this is a file, just start writing.
		if (   (qwCount>STARTUP_WRITE_SIZE)
			|| (pAudioParams->bAudioIsFile) )
		{
#ifdef _DEBUG
			{
				char szTemp[256];
				sprintf(szTemp,"CMode::SendAudioToDestinationBuffer ->Start (%ld samples) at %ld\n",
					(DWORD)(qwCount), timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //_DEBUG
			m_fStarted = TRUE;
			m_pAudioIAudio->Start();
		}

	}

#endif //SAPI_GROUP_H_TIMING

	return(iNumberOfSamplesToSend);
}



void CMode::PrepareRingBufferToSendSamples(LPAUDIO_PARAMS_T pAudioParams)
{
	int iQueueCount;
	int iNumberOfSamplesToSend=0; // tek08aug97
	LPQUEUE_T pAudioQueue;
	int iStartupWriteLength =  STARTUP_WRITE_SIZE;
#ifdef DEBUG
	DWORD dwBufferSizeAvailable;
	BOOL  bEOF;
#endif
	/********************************************************************/
	/*  Get the Queue Count. If it changes between here and the end of  */
	/*  this function, that's OK.                                       */
	/********************************************************************/

   /********************************************************************/

	pAudioQueue = pAudioParams->pAudioQueue;
/*
	m_pAudioIAudioDest->FreeSpace(&dwBufferSizeAvailable,&bEOF);

	if(!dwBufferSizeAvailable)
	{
#ifdef DEBUG
		fprintf(fDebug,"There is 0 BYTES FREE IN CACHE,Not supposed to reach HERE\n");
#endif
		return;
	} 
*/	
	EnterCriticalSection( pAudioParams->pcsQueueCount );
	iQueueCount = pAudioQueue->iQueueCount;
#ifdef DEBUG
	fprintf( fDebug, "First iDataSet with queueCount of[%d]\n", iQueueCount );
#endif
	LeaveCriticalSection( pAudioParams->pcsQueueCount );

	/********************************************************************/
	/*  If the ResetAudio() function clears the audio queue just after  */
	/*  the waveOutOpen() function completes, then it is possible to    */
	/*  get here with no audio in the queue. In this case, close the    */
	/*  wave output device.                                             */
	/********************************************************************/
	// tek 08aug97 this strategy of sending lots of tiny buffers 
	// results in a barrage of FreeSpace notifications from the 
	// destination object, and while we're scurrying around dealing
	// with those we can't generate new samples.. resulting in a 
	// spurious AudioStop and thus a pile of problems.. So, instead
	// of breaking things into STARTUP_WRITE_SIZE chunks, make the
	// first one be that size (this probably has to happen to keep
	// things responsive) and then break what's left into two chunks
	// (but not less than STARTUP_WRITE_SIZE)

	if ( iQueueCount >0)
	{
		int i;
		// tek 08aug97 send the first block.
		// if we have a LOT of samples to send, don't send the minimum-sized
		// one first..
		if (iQueueCount < MAXIMUM_WRITE_LENGTH)
		{
			if(iStartupWriteLength >iQueueCount)
				iStartupWriteLength = iQueueCount;
    		iQueueCount -= SendAudioToDestinationBuffer(iStartupWriteLength);
		}
		// now, try to break the block in two..
		if (iQueueCount > 2*STARTUP_WRITE_SIZE)
		{

			// the "2+" makes sure that we leave a bit of stuff laying
			// around once we get into the loop
			// tek 09feb98 have to do the & ~1 because this is BYTES and
			// in general there are 2 BYTES per SAMPLE.. sending an odd
			// number of bytes is a bad, bad thing todo!
			iNumberOfSamplesToSend = (2+(iQueueCount>>1)) & ~1;
			// try not to write TOO much each time; but make it reasonable..
			if (iNumberOfSamplesToSend >  MAXIMUM_WRITE_LENGTH*2)
				iNumberOfSamplesToSend = MAXIMUM_WRITE_LENGTH*2;
		}
		else
		{
			// this will result in either a buffer of STARTUP_WRITE_SIZE,
			// or nothing.
			iNumberOfSamplesToSend = STARTUP_WRITE_SIZE;
		}
		for (i=0;(i<MAXIMUM_BUFFERS_QUEUED) && (iQueueCount >0);i++)
		{
			// make sure we only send what's left..
			// as a result of the "2+" above, this will leave the
			// the last buffer around if we're not too close to done.
			// as a result of that second clause above, this will not
			// send anything if there wasn't enough to do two 
			// minimum-sized packets.
			if(iNumberOfSamplesToSend <= iQueueCount)
			{
	    		iQueueCount -= SendAudioToDestinationBuffer(iNumberOfSamplesToSend);
			}
			else
			{
				break; // all done.
			}
		}
	}
	else
	{
#ifdef _DEBUG
		{
			char szTemp[256];
			sprintf(szTemp,"CMode::PrepareRingBufferToSendSamples queuecount is zero\n");
			OutputDebugString(szTemp);
		}
#endif //_DEBUG
	//  CloseAudioDevice( pAudioParams );
	// MVP: Never call here m_pAudioIAudio->Stop.Just Unclaim the device.The UnClaim call
	// plays out if any audio is left in the buffer.If you call "Stop" before "UnClaim",It
	// clears the audio buffer and stops playing.This was the cause for the earlier
	// "Resume" problem for not speaking last tiny audio.
		if (m_fClaimed && m_bTextDataDoneFlag) // tek 13may98 bats666 don't do it until all text is done!
		{
		// 06mar98 tek No. Fire off the timer and let the timer do the unclaim.
			// 12mar98 tek but then NOBODY unclaims..

			m_pAudioIAudio->UnClaim();
			m_fClaimed = FALSE;
			// m_fPaused = FALSE; // tek 11feb98 why did we want to do this?
			// tek 08aug97 move state change to AudioStop in order to 
			// avoid premature notifications..
			//EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
			//pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_INACTIVE;
			//LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
			//SetEvent( pAudioParams->hAudioDeviceInactive );
			//Unblock the timer thread
			OP_SetEvent( pAudioParams->hevTimerThreadActive );
		}
	}
}





void CMode::SetAudioSampleOutFormat()
{
	// tek 18mar98 bats608/609/620 use the new flags..
	// Flag to specify 8-bit(TRUE) or 16-bit(FALSE) audio samples
	// pMode->m_bAudioDriver was set in CMode::FInit routine
	m_pDECtalk->pAudioHandle->bAudioIsEightBit = m_bAudioIsEightBit;
	m_pDECtalk->pAudioHandle->bAudioIsMulaw = m_bAudioIsMulaw;
}

/**********************************************************************/
/* Function Name : OpenAudioDevice   								  */
/* Author		 : Murthy Parakala									  */
/* Purpose		 : This is a member function of CMode class.		  */
/*				   This routine claims the audio device,Starts the    */
/*				   audio device to play audio samples using interface */
/*				   functions provided by audio-destination object.    */
/*				   The state of audio device is maintained in member  */
/*				   variables as m_fClaimed,m_fPaused,m_fdataPending	  */
/**********************************************************************/

HRESULT CMode::OpenAudioDevice()
{
	HRESULT hRes = 0;
	LPAUDIO_PARAMS_T pAudioParams =NULL;

	pAudioParams = m_pDECtalk->pAudioHandle;

	// Claim the device		  
	if (!m_fClaimed && !m_fPaused)
	{
#ifdef SAPI_GROUP_H_TIMING
		QWORD qwCount=0;

#endif // SAPI_GROUP_H_TIMING
		hRes = m_pAudioIAudio->Claim();
		if (hRes)
			return hRes;
		m_fClaimed = TRUE;
#ifndef SAPI_GROUP_H_TIMING
		hRes = m_pAudioIAudio->Start();
		if (hRes)
			return hRes;
#else //SAPI_GROUP_H_TIMING
		// tek 20feb98 I don't think we always want to start here..
		//hRes = m_pAudioIAudio->Start();
		//if (hRes)
		//	return hRes;
		// in fact, I think we want to Stop here! (to avoid a stutter.)
		// tek 06aug98 unless we're in file, where it doesn't matter and
		// and it will cause a spurious notification (bats 739)
		if (!pAudioParams->bAudioIsFile)
		{
			m_pAudioIAudio->Stop();
			m_fStarted = FALSE;
		}
		// we have to keep track of the base position here, because 
		// PosnGet does not reliably return the current position when 
		// stopped and we need to know what we've queued so that 
		// we know when to start.
		m_pAudioIAudio->TotalGet(&qwCount);
		m_qwBaseAudioPosition = qwCount;

#endif // SAPI_GROUP_H_TIMING
		m_fDataPending = TRUE;
		EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
		pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_ACTIVE;
		LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
		ResetEvent( pAudioParams->hAudioDeviceInactive );
	}
   	else if (!m_fClaimed && m_fPaused) 	 //when Audio paused 
   	{
		m_fDataPending = TRUE;	  
	}
   	else if (m_fClaimed && !m_fPaused)  //when Audio Resumed 
   	{
		m_fDataPending = TRUE;
	}
   	else 
   	{
	  // Bad error
	  //return ResultFromScode(E_FAIL);
	  hRes = E_FAIL;
	};
	
	return hRes;
}

/**********************************************************************/
/* Function Name : ProcessAudio										  */
/* Author		 : Murthy Parakala									  */
/* Purpose		 : This is a member function of CMode class.		  */
/*				   This routine is called when QueueAudio sends		  */
/*				   ID_SEND_SAMPLES_FROM_ENGINEQUEUE to the mode window*/
/*				   It bascially opens an audio device if it is not    */
/*				   already opened,and sends audio samples to audio	  */
/*				   destination object's internal memory to play the   */
/*				   audio.											  */
/**********************************************************************/

HRESULT CMode::ProcessAudio()
{
	HRESULT hRes = 0;

#ifdef DEBUG
	static int i=0;
	char deb[200];
	if(fDebug == NULL)
		fDebug = fopen("debug.log", "a");
 	sprintf(deb,"In ProcessAudio.........Starting up**[%d]",i);
	fprintf(fDebug,"%s\n",deb);
	i++;
//	fprintf(fDebug,"In ProcessAudio.........Starting up**");
#endif
#ifdef _DEBUG // tek 08aug97
		{
			char szTemp[256]="";
			sprintf(szTemp,"CMode::ProcessAudio, qcount=%d at %lu\n",
				m_pDECtalk->pAudioHandle->pAudioQueue->iQueueCount,
				timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //_DEBUG

		//tek 08aug97 clear the request flag..
		m_pDECtalk->pAudioHandle->bSendSamplesRequested = FALSE;


    if ( (m_pDECtalk->pAudioHandle->dwAudioDeviceState == 
		  AUDIO_DEVICE_INACTIVE ) &&
		 (!m_pDECtalk->pAudioHandle->bPaused))
	{
  	  if((hRes = OpenAudioDevice()) == E_FAIL)
	  	  return hRes;
	  // 8-bit or 16-bit audio
	  SetAudioSampleOutFormat();
	  
	  PrepareRingBufferToSendSamples(m_pDECtalk->pAudioHandle);
	}
	// tek 12feb98 this should ALWAYS happen, so that we can resume from a paused state.
	else //if (m_pDECtalk->pAudioHandle->bAudioRanDry)	//tek 08aug97 send more if we ran out earlier..
	{
		m_pDECtalk->pAudioHandle->bAudioRanDry = FALSE;
		PrepareRingBufferToSendSamples(m_pDECtalk->pAudioHandle);
	}



	return hRes;
}

/**************************end of auddest.cpp*********************************/

