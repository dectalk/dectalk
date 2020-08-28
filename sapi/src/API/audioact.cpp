// File name: audioact.cpp
// Author   : Murthy Parakala
// Version  : 1.0
// Date     : January 03,1996

// Copyright (c) 1996-1998 Digital Equipment Corporation

// Description: This file contains the interface routines to be called
// by audio-destination object to configure DECtalk speech engine,
// for various audio activities.

/* revision history:
 *
 * 01aug97	tek		bats423: add helper fcn for position, fix DECGetAudioParams
 * 04aug97	tek		sapi fixes: add funtions to support QW timestamps..
 * 07aug97	tek		sapi fixes: correct getaudioposition during reset
 * 12nov97	tek		the above aug97 fixes merged in
 * 19nov97  cjl     change speech.h to local
 * 12feb98	tek		fix DECResumeAudio for the pause-textdata-resume case
 * 09mar98	tek		sapi backend timing (group h)
 * 16mar98	tek		bats 608/609/620: audio format.
 * 18mar98      cjl             Removed specific path for dectalkf.h.
 * 20mar98	tek		bats630: try to behave when doing TTSSync while not claimed
 * 11sep98	tek		return E_FAIL if trying to set a destination bookmark while unclaimed
 * 08oct98	tek		also fail in AudActSetBookmark if audio not active
 *
 */

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
							  // audqueue.c  (low-level DECtalk audio)
							  // auddest.cpp (OLE-interface audio)

// tek 01aug97 bats 423
// this routine is used by PA_GetPosition to get the 
// current audio position without having to go through the message-passing 
// mechanism (which is prone to hanging during reset)
extern "C"{
	
void AudActGetAudioPosition(LPAUDIO_PARAMS_T pAudioParams, DWORD *pdwPosition)
{
	DWORD temp;
	if (pAudioParams->pcMode)
	{
		((PCMode)pAudioParams->pcMode)->DECGetAudioPosition(&temp);
		*pdwPosition=(DWORD)temp;
	}
	else
	{
		*pdwPosition = 0; // audio not up yet?
	}
}
// tek 04aug97 qw position support
void AudActGetQWAudioPosition(LPAUDIO_PARAMS_T pAudioParams, QWORD *pqwPosition)
{
	if (pAudioParams->pcMode)
	{
		((PCMode)pAudioParams->pcMode)->DECGetQWAudioPosition(pqwPosition);
	}
	else
	{
		*pqwPosition = 0; // audio not up yet?
	}
}

// tek 22aug97 bookmark timing support
HRESULT AudActSetBookmark(LPAUDIO_PARAMS_T pAudioParams, DWORD dwMarkID)
{
	
	PCMode pcMode = (PCMode)pAudioParams->pcMode;
	int iQueueCount;
	if (pcMode) // make sure we have a good pointer..
	{
#ifdef SAPI_GROUP_H_TIMING		// In order to put the bookmark in the right place, we have to 
		// spit out all the samples. Make sure we're not in reset, though..
		while (  !pAudioParams->bInAudioReset
			&& pAudioParams->pAudioQueue->iQueueCount )
		{
			// have to spit out more samples. 
			EnterCriticalSection(pAudioParams->pcsQueueCount);
			iQueueCount = pAudioParams->pAudioQueue->iQueueCount;
			iQueueCount -= pcMode->SendAudioToDestinationBuffer(iQueueCount);
			LeaveCriticalSection(pAudioParams->pcsQueueCount);
			// if we've been left with some samples, then we have a LOT of 
			// audio queued and we can afford to fall asleep here to avoid
			// monopolizing the CPU..
			if (iQueueCount)
			{
				// tek if this happened because audio hasn't started yet, 
				// return a failure - which will cause the old timer-based
				// method to be used.
				// We can't sleep here if audio hasn't started, because then
				// the message that starts audio won't ever happen.
				if (pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_ACTIVE)
				{
#ifdef M_DEBUG
					OutputDebugString("AudActSetBookmark returning E_FAIl because audio not started (qc nonzero).\n");
#endif //M_DEBUG
					return (E_FAIL); // can't set bookmarks when audio isn't running.
				}
				Sleep(100);
			}
		}
#endif // SAPI_GROUP_H_TIMING

		// tek 08oct98 the above tests don't cover the case where we've done
		// absolutely nothing (sample count is zero, audio is inactive). We
		// need to return FAIL in that case, so that we don't end up out-of-order
		// at the very beginning. For some reason the audio destination doesn't
		// reliably return FAIL in this case..
		if (pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_ACTIVE)
		{
#ifdef M_DEBUG
			OutputDebugString("AudActSetBookmark returning E_FAIl because audio not started (qc zero).\n");
#endif //M_DEBUG
			return (E_FAIL); // can't set bookmarks when audio isn't running.
		}

		// now set the bookmark..
		return ((PCMode)pAudioParams->pcMode)->DECSetBookmark(dwMarkID);
	}
	else
	{
		return (E_FAIL);
	}
	
	
}
	
} // extern "C"

void CMode::DECPauseAudio()
{
	LPAUDIO_PARAMS_T pAudioParams = m_pDECtalk->pAudioHandle;

	ResetEvent(pAudioParams->hAudioNotPaused);
	pAudioParams->bPaused = TRUE;
#ifdef M_DEBUG //tek 21aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"DECPauseAudio exit at %lu\n",
			timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
}

void CMode::DECResumeAudio()
{
	LPAUDIO_PARAMS_T pAudioParams = m_pDECtalk->pAudioHandle;

#ifndef SAPI_GROUP_H_TIMING
	SetEvent(pAudioParams->hAudioNotPaused);
	pAudioParams->bPaused = FALSE;
#ifdef M_DEBUG //tek 21aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"DECResumeAudio cleared bPaused at %lu\n",
			timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	//Unblock the timer thread
    OP_SetEvent( pAudioParams->hevTimerThreadActive );
#else // SAPI_GROUP_H_TIMING
	// tek 06mar98 move the changing of the pause flag to after we kick
	// audio so that we don't end up in a race with samples being queued.
	// hold the device state until after that to avoid any state changes
	// (this should not deadlock because we make no blocking calls in here.)
	EnterCriticalSection(pAudioParams->pcsAudioDeviceState);
#endif // SAPI_GROUP_H_TIMING

	// MVP :Check the audio device state. If it is INACTIVE,Send the
	// message ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE to the mode
	// window to play the audio.
	// (This condition occurs ,when the user
	// first press the "Pause" button and then press the 
	// Play (TextData)button.(The Play logic can't set the audio device 
	// state to ACTIVE,because the audio device is Paused.
	// But the audio data is queued in the queue buffer)
	// On Pressing the Resume button ,the device state will be INACTIVE.
	// To play the Data in the queue buffer ,you have to send the above
	// mentioned message,when the audio device state is INACTIVE.)
	// 
#ifdef M_DEBUG //tek 21aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"DECResumeAudio device state=%lu  at %lu\n",
			pAudioParams->dwAudioDeviceState, timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	// tek 12feb98 this should always be sent, else we can't start in
	// the pause-textdata-resume scenario.
	//EnterCriticalSection(pAudioParams->pcsAudioDeviceState);
	//if(pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE)
	//{
	//	LeaveCriticalSection(pAudioParams->pcsAudioDeviceState);
#ifndef SAPI_GROUP_H_TIMING
		SendMessage(hWndMain,ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,0L,0L);
#else // SAPI_GROUP_H_TIMING
		// this MUST BE A POST, not a send..
		PostMessage(hWndMain,ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,0L,0L);
#endif // SAPI_GROUP_H_TIMING
	//}
	//else
	//	LeaveCriticalSection(pAudioParams->pcsAudioDeviceState);
#ifdef SAPI_GROUP_H_TIMING
	// tek 06mar98 ...
	// I believe we have to do this after we POST the send_samples message..
	SetEvent(pAudioParams->hAudioNotPaused);
	pAudioParams->bPaused = FALSE;
#ifdef M_DEBUG //tek 21aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"DECResumeAudio cleared bPaused at %lu\n",
			timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	LeaveCriticalSection(pAudioParams->pcsAudioDeviceState);

	//Unblock the timer thread
    OP_SetEvent( pAudioParams->hevTimerThreadActive );

#endif // SAPI_GROUP_H_TIMING
}

void CMode::DECAudioReset()
{
	LPAUDIO_PARAMS_T pAudioParams = m_pDECtalk->pAudioHandle;
	
	EnterCriticalSection(pAudioParams->pcsAudioDeviceState);
	pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_INACTIVE;
	LeaveCriticalSection(pAudioParams->pcsAudioDeviceState);
	SetEvent(pAudioParams->hAudioDeviceInactive);	
// MVP: On Reset, Reset the Pause flag to false if it is true.
	if(pAudioParams->bPaused)
		pAudioParams->bPaused = FALSE;
}


void CMode::DECGetAudioVolume(LPDWORD pdwVolume)
{
	m_pAudioIAudio->LevelGet(pdwVolume);
}

void CMode::DECSetAudioVolume(DWORD dwVolume)
{
	m_pAudioIAudio->LevelSet(dwVolume);
}

void CMode::DECGetAudioPosition(LPDWORD pdwPosition)
{
	LPAUDIO_PARAMS_T pAudioParams = m_pDECtalk->pAudioHandle;
	QWORD qwTimeStamp;

#ifdef _DEBUG_	//tek 08aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"CMode::DECGetAudioPosition state=%lx, reset=%d pause=%d at %lu\n",
			pAudioParams->dwAudioDeviceState,
			(int)(pAudioParams->bInAudioReset),
			pAudioParams->bPaused,
			timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

	EnterCriticalSection(pAudioParams->pcsAudioDeviceState);
  	if (  (pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE ) // tek 07aug97
		&&(!pAudioParams->bInAudioReset)							 // fix incorrect waits in reset.
	   )
  	{
		LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

		m_pAudioIAudio->PosnGet(&qwTimeStamp);
		*pdwPosition = qwTimeStamp & 0x00000000FFFFFFFF;
		*pdwPosition += pAudioParams->dwPositionBase;
  	}
  	else
  	{
		LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
		// tek 20mar98 bats 630: if we're not claimed, then the concept
		// of PosnGet  makes no sense. So, return TotalGet here and 
		// pray.
		if (!m_fClaimed)
		{
			m_pAudioIAudio->TotalGet(&qwTimeStamp);
			*pdwPosition = qwTimeStamp & 0x00000000FFFFFFFF;
		}
		else
		{
			*pdwPosition = pAudioParams->dwPositionBase;
		}
  	}

}
// tek 04aug97 sapi fixes: qw timestamp support
void CMode::DECGetQWAudioPosition(QWORD *pqwPosition)
{
	int	iQueueCount=0;
	QWORD qwCount=0;

	LPAUDIO_PARAMS_T pAudioParams = m_pDECtalk->pAudioHandle;
	// we have to pick up the samples that haven't yet
	// been sent as well as the ones that have already gone.
	EnterCriticalSection( pAudioParams->pcsQueueCount );
	iQueueCount = pAudioParams->pAudioQueue->iQueueCount;
	// we probalby have to hold the critical section so that
	// we don't double-count; hopefully there isn't a 
	// deadlock lurking in there somewhere..
	m_pAudioIAudio->TotalGet(&qwCount);
#ifdef M_DEBUG
	{
		char szTemp[256]="";
		sprintf(szTemp,"CMode::DECGetQWAudioPosition: iQueue=%u TotalGet=%lu\n",
			iQueueCount, (DWORD)qwCount);
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	LeaveCriticalSection( pAudioParams->pcsQueueCount );
	qwCount += iQueueCount;
	*pqwPosition = qwCount;

}
// tek 22aug97 bookmark timing support
HRESULT CMode::DECSetBookmark(DWORD dwMarkId)
{
#ifdef M_DEBUG
	{
		char szTemp[256]="";
		QWORD qwPosn=0;
		QWORD qwTotal=0;
		m_pAudioIAudio->PosnGet(&qwPosn);
		m_pAudioIAudio->TotalGet(&qwTotal);
		sprintf(szTemp,"CMode::DECSetBookmark setting mark %lx posn=%lu total=%lu at %lu\n",
			dwMarkId, (DWORD)qwPosn, (DWORD)qwTotal, timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	return m_pAudioIAudioDest->BookMark(dwMarkId);
}

void CMode::DECGetAudioParams(LPWAVEFORMATEX pWaveFormatGet)
{
	SDATA  sData;
	// tek 01aug97 bats 423
	// the call to WaveFormatGet returns a new SDATA to us,
	// which we then have to copy into the callers area..


	m_pAudioIAudio->WaveFormatGet(&sData);
	memcpy(pWaveFormatGet,sData.pData, sizeof(WAVEFORMATEX));

	// gotta free that block
	CoTaskMemFree(sData.pData);

}

MMRESULT CMode::DECSetAudioParams(LPWAVEFORMATEX pWaveFormatToSet)
{
	// tek 16mar98 this never worked, and should never be called.
	// (bats 608/609/620)
#if	0
	SDATA  sData;
	DWORD dwSampleRate;
	DWORD dwNumberOfChannels;
	DWORD dwBytesPerSample;
//	DWORD dwWaveFormatSize;
// 	MMRESULT mmStatus;
	LPAUDIO_PARAMS_T pAudioParams = m_pDECtalk->pAudioHandle;
	
	/******************************************************************/
	/*  If the audio device is not inactive then return an error.     */
	/******************************************************************/

	EnterCriticalSection( pAudioParams->pcsAudioDeviceState );

	if ( pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE )
	{
	  LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

	  return( MMSYSERR_ALLOCATED );
	}
	else
	{
		LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

		if ( pWaveFormatToSet->wFormatTag == WAVE_FORMAT_PCM )
		{
			/******************************************************************/
			/*  The wFormatTag element is equal to WAVE_FORMAT_PCM.           */
			/******************************************************************/
			dwSampleRate = pWaveFormatToSet->nSamplesPerSec;
			dwNumberOfChannels = pWaveFormatToSet->nChannels;
			dwBytesPerSample = pWaveFormatToSet->wBitsPerSample >> 3;

			/******************************************************************/
			/*  Initialize other WAVEFORMATEX structure elements.             */
			/******************************************************************/

			pWaveFormatToSet->nAvgBytesPerSec =
			  dwSampleRate * dwNumberOfChannels * dwBytesPerSample;
			pWaveFormatToSet->nBlockAlign =
			  (WORD)( dwNumberOfChannels * dwBytesPerSample );
			//pWaveFormatToSet->cbSize = 0;	 //MVP: Should not change it.06/13/96
			//MVP:Currently [:play]command doesn't work.
			//This function has to add additional logic of allocating space of
			//"cbsize" in waveformat etc..SEE Playaud.c for PA_SetForamt function.
		}

		sData.pData = pWaveFormatToSet;
		sData.dwSize = sizeof(WAVEFORMATEX);

		if	((FAILED(m_pAudioIAudio->WaveFormatSet(sData)))
		  && ( pWaveFormatToSet->wBitsPerSample == 16 ))
		{	
			/**************************************************************/
			/*  Initialize other WAVEFORMATEX structure elements for 8    */
			/*  bit data.                                                 */
			/**************************************************************/

			pWaveFormatToSet->nAvgBytesPerSec = dwSampleRate * dwNumberOfChannels;
			pWaveFormatToSet->nBlockAlign = (WORD)dwNumberOfChannels;
			pWaveFormatToSet->wBitsPerSample = 8;
			if(FAILED(m_pAudioIAudio->WaveFormatSet(sData)))
				return(MMSYSERR_ERROR);
	        /**************************************************************/
        	/*  Reset the WAVEFORMATEX structure elements for 16 bit      */
        	/*  data.                                                     */
        	/**************************************************************/
        	pWaveFormatToSet->nAvgBytesPerSec =
          	dwSampleRate * dwNumberOfChannels << 1;
        	pWaveFormatToSet->nBlockAlign = (WORD)( dwNumberOfChannels << 1 );
        	pWaveFormatToSet->wBitsPerSample = 16;
		}
	}

	return MMSYSERR_NOERROR;
#else //0
	return MMSYSERR_ERROR;
#endif //0
}


/******************************end of audioact.cpp********************/
