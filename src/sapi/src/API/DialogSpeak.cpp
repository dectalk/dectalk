// DialogSpeak.cpp: implementation of the CDialogSpeak class.
// tek 11sep98
// tek 14sep98		init m_bStopping, cnahge to match CTestBufNotify's 
//				new destruction method, repair several StopSpeaking
//				isues, pump messages while waiting around.
// tek	13jan99	use the private message pump (CMode->PeekAndPump) to
//				move messages while idle.
//
//////////////////////////////////////////////////////////////////////



#include <malloc.h>
#include <assert.h>
#include "dtlktts.h"
#include "DialogSpeak.h"
#include "bufnotify.h"

#ifdef MM_DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif



//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CDialogSpeak::CDialogSpeak()
{

	m_pszText = NULL;
	m_bStarting = FALSE;
	m_bStopping = FALSE;
	m_ttdData.bTestTextStarted =FALSE;
	m_ttdData.bTestTextRunning =FALSE;
	m_ttdData.bTestTextDone =FALSE;
	m_pCMode = NULL;
#ifdef MM_DEBUG
	OutputDebugString("CDialogSpeak constructed\n");
#endif //MM_DEBUG

}

CDialogSpeak::~CDialogSpeak()
{
	StopSpeaking();
	// hang out until the thread dies.. so we don't kill the data structs
	// prematurely..
	m_ccsCriticalSection.Lock();
	while (	m_ttdData.bTestTextStarted || m_ttdData.bTestTextRunning)
	{
		m_ccsCriticalSection.Unlock();
		if (!m_pCMode->PeekAndPump()) //08jan99 this is a member fn now..
			break;
		Sleep(10);
		m_ccsCriticalSection.Lock();
	}
	// let go of the private 'no-notify' mode
	if (m_pCMode)
		m_pCMode->m_bDoNotNotify = FALSE;
	m_ccsCriticalSection.Unlock();

	// StopSpeaking() will free any m_pszText laying around..

#ifdef MM_DEBUG
	OutputDebugString("CDialogSpeak destructed\n");
#endif //MM_DEBUG
}

void CDialogSpeak::SetCMode(CMode *pCMode)
{
	
	m_pCMode = pCMode;
	StopSpeaking(); // abort any user speech
					// so we can kill off notifications
					// once we get a pCMode..	// immediately stop user notifications.
	// Start "no notify" mode..
	m_pCMode->m_bDoNotNotify = TRUE;
}

HRESULT CDialogSpeak::Speak(CString &csText)
{
	DWORD dwLength=0;
	assert(m_pCMode); // gotta have a mode pointer..
#ifdef MM_DEBUG
		{
			char szTemp[256];
			sprintf(szTemp,"CDialogSpeak::Speak at %lu\n",
				timeGetTime());
			OutputDebugString(szTemp);
//			ODSFlush();
		}
#endif //MM_DEBUG

	StopSpeaking(); // shut any pending text down.
	
	m_ccsCriticalSection.Lock(); // own the variables
	// If we're called before the last call spawned, bail out here.
	// (rather than waiting for the lock to free)
	if (m_bStarting || m_bStopping)
	{
#ifdef MM_DEBUG
		{
			char szTemp[256];
			sprintf(szTemp,"CDialogSpeak::Speak BUSY abort (starting=%d,Stopping=%d)\n",
				m_bStarting, m_bStopping);
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG
		m_ccsCriticalSection.Unlock();
		return ERROR_BUSY;
	}

	m_bStarting = TRUE;
	// stay locked until we've started the thread..



	// find the length of the input string, and allocate a buffer..
	dwLength = csText.GetLength();
	// we need to add a mark, so make the buffer somewhat bigger
	dwLength += 20;
	// alloc the memory..
	m_pszText = (char *)malloc(dwLength);
	if (m_pszText == NULL) // oops, no memory.
	{
		m_bStarting = FALSE; // ok, we're clear..
		m_ccsCriticalSection.Unlock();
		return ERROR_NOT_ENOUGH_MEMORY;
	}	
	// put the text in the buffer..
	strcpy(m_pszText,csText);
	// fill in the ttdata struct..
	m_ttdData.sData.pData = m_pszText;
	m_ttdData.sData.dwSize = dwLength;
	m_ttdData.pCMode = m_pCMode;
	m_ttdData.pccsCriticalSection = &m_ccsCriticalSection;

	// spawn the thread that does the work.
	AfxBeginThread(ThreadRoutine ,(LPVOID)&m_ttdData);
	m_ttdData.bTestTextStarted = TRUE;
	m_bStarting=FALSE;

	m_ccsCriticalSection.Unlock();

	// all done..
	return 0;


}

void CDialogSpeak::StopSpeaking()
{
	// shut down the synthesizer and free the text buffer.
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CDialogSpeak::StopSpeaking at %lu\n",timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

	assert(m_pCMode); // gotta have a mode pointer..
	// check to see that we haven't collided with a startup..
	while (m_ttdData.bTestTextStarted && !m_ttdData.bTestTextRunning)
	{
		if (!m_pCMode->PeekAndPump())
			break;
		Sleep(1);
	}

	// we need to be inside the critical section to do this.. so
	// that another Speak doesn't step on us..
	m_ccsCriticalSection.Lock();
	if (m_bStopping)
	{
		// oops. already stopping..
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CDialogSpeak::StopSpeaking abort; already m_bStopping %lu\n",timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
		m_ccsCriticalSection.Unlock();
		return;
	}

	m_bStopping = TRUE;
	m_ttdData.bTestTextDone = TRUE; // signal the thread to stop.
	// we can come out from the crit sec now, and let the thread wind down
	m_ccsCriticalSection.Unlock();
	// Reset the synthesizer
	m_pCMode->m_pModeITTSCentralA->AudioReset();
	// wait for completion..
	while (m_ttdData.bTestTextRunning)
	{
		if (!m_pCMode->PeekAndPump())
			break;
		Sleep(50);
		if (!m_pCMode->PeekAndPump())
			break;
	}

	// tidy up and exit
	m_ccsCriticalSection.Lock();
	m_ttdData.bTestTextDone = FALSE;
	if (m_pszText)
	{
		free(m_pszText);
		m_pszText = NULL;
	}
	m_bStopping = FALSE; // all done

#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CDialogSpeak::StopSpeaking exit %lu\n",timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	m_ccsCriticalSection.Unlock();
}


UINT CDialogSpeak::ThreadRoutine(LPVOID pvData)
{
	// the data field is assumed large enough to stick on a little more..
	CTestBufNotify *ptbnNotifySink = new CTestBufNotify;
	HRESULT hRes;
	CCriticalSection *pCC;
	int iShutdownCount=0;
	DWORD dwTemp;

	TTDATA *pTTData = (TTDATA *)pvData;
	pCC = pTTData->pccsCriticalSection;
	// take the critical section to be sure nobody pulls the data
	// out from under us.
	pCC->Lock();	SDATA *psdData = &pTTData->sData;
	char *szEditData = (char *)psdData->pData;
	CMode *pCMode = pTTData->pCMode;
	pTTData->bTestTextDone = FALSE;
	pTTData->bTestTextRunning = TRUE;
	// ok, we're in control of the memory buffer now.
	pCC->Unlock();
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CDialogSpeak::ThreadRoutine running at %lu\n",
			timeGetTime());
	OutputDebugString(szTemp);
	}
#endif //M_DEBUG	
	// add in a bookmark to tag the end..
	strcat(szEditData, "\\mrk=1\\");
	// update the length
	psdData->dwSize = strlen(szEditData);
    // Put the text buffer into the engine's speaking queue, and give
    // the engine the address of the ITTSBufNotifySink interface for
    // buffer-related notifications.
	// tek this will have to be adjusted for unicode support.
	if (pCMode)
	{
		// we wil be using the notify sink ourselves, so we have to 
		// take a ref to it..
		ptbnNotifySink->AddRef();
#ifdef M_DEBUG
			{
				char szTemp[256];
				sprintf(szTemp,"CDialogSpeak::ThreadRoutine TextData (sink=%08lx) at %lu\n",
					ptbnNotifySink,timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //M_DEBUG
			hRes = (pCMode->m_pModeITTSCentralA)->TextData(CHARSET_TEXT,
			TTSDATAFLAG_TAGGED,
			*psdData, 
			ptbnNotifySink, 
			IID_ITTSBufNotifySink);
		
		
		// stand around and wait for the bookmark to show up..
		
		// spin for the mark
		while (!pTTData->bTestTextDone) // in case of abort
		{
			DWORD dwLastBookmark=0;
			// bail out immediately if GetLastBookmark fails
			if (ptbnNotifySink->GetLastBookmark(&dwLastBookmark))
			{
				break;
			}
			// bail out if we saw the mark we're looking for
			if (dwLastBookmark == 1)
			{
				break;
			}
			
			if (!pCMode->PeekAndPump())
				break;
			Sleep(10);			
			if (!pCMode->PeekAndPump())
				break;
#ifdef M_DEBUG
			{
				char szTemp[256];
				sprintf(szTemp,"CDialogSpeak::ThreadRoutine polling for bookmark at %lu\n",
					timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //M_DEBUG
		}
		
		// wait a little longer so that things settle out
		// we have to be careful to pump messages here 
		// else the synthesizer will get stuck.
		iShutdownCount=0;
		// GetLastBookmark will return TRUE (actually, E_FAIL) when 
		// the "done" message arrives.
		while (   iShutdownCount<200
			   && (!ptbnNotifySink->GetLastBookmark(&dwTemp)) )
		{
			iShutdownCount++;
			if (!pCMode->PeekAndPump())	// pump some messages..
				break;
			Sleep(50);
			if (!pCMode->PeekAndPump())
				break;
		}
	}
#ifdef M_DEBUG
	if (iShutdownCount>=199) // did we abort?
	{
		char szTemp[256];
		sprintf(szTemp,"iShutdownCount timeout at %lu\n",timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	// release the sink ref
	ptbnNotifySink->Release();

#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CDialogSpeak::ThreadRoutine (TestTextDone=%d) exiting at %lu\n",
			pTTData->bTestTextDone,timeGetTime());
	OutputDebugString(szTemp);
	}
#endif //M_DEBUG	


	// lock and tell the world we're done.
	pCC->Lock();
	pTTData->bTestTextStarted = FALSE;
	pTTData->bTestTextRunning = FALSE;
	pCC->Unlock();
	return 0;
}
