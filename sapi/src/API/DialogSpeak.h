// DialogSpeak.h: interface for the CDialogSpeak class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_DIALOGSPEAK_H__0688AF21_3DBD_11D2_A42F_004005A17674__INCLUDED_)
#define AFX_DIALOGSPEAK_H__0688AF21_3DBD_11D2_A42F_004005A17674__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "stdafx.h"
#include <afxmt.h> // for critical sections

// structure for holding the testtext data
typedef struct TTDATA_TAG {
	volatile SDATA sData;
	volatile BOOL bTestTextDone;	// thread is done
	volatile BOOL bTestTextRunning;	// thread is running
	volatile BOOL bTestTextStarted; // thread has been spawned
	CMode	*pCMode;
	CCriticalSection	*pccsCriticalSection;
} TTDATA, *PTTDATA;


class CDialogSpeak : public CObject  
{
public:
	CDialogSpeak();
	virtual ~CDialogSpeak();
	void SetCMode(CMode *pCMode);
	HRESULT Speak(CString &csText);
	void StopSpeaking();
	static UINT ThreadRoutine(LPVOID pvData);

protected:
	CMode *m_pCMode;
	TTDATA	m_ttdData;
	BOOL m_bStarting;
	BOOL m_bStopping;
	CCriticalSection  m_ccsCriticalSection; // locks start/stop of the synth

	char *m_pszText;

private:

};

#endif // !defined(AFX_DIALOGSPEAK_H__0688AF21_3DBD_11D2_A42F_004005A17674__INCLUDED_)
