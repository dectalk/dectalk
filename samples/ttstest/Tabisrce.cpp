/******************************************************************************\
*       tabisrce.cpp
*
*       Implements functionality of CPropertyPage derived classes displayed
*       as tabs on the main application window.
*
*       This code and information is provided "as is" without warranty
*       of any kind, either expressed or implied, including but not
*       limited to the implied warranties of merchantability and/or
*       fitness for a particular purpose.
*
*       Copyright (C) 1995 Microsoft Corporation.  All Rights Reserved.
*
\******************************************************************************/

#include "stdafx.h"

#include <speech.h>
#include <tchar.h>
#include "bufcvt.h"

#include "resource.h"
#include "tabisrce.h"
#include "ttstst.h"
#include "ttsdlg.h"
#include "ttsfnc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/****************************************************************************

                           PROPERTY PAGE MAPS

****************************************************************************/

/////////////////////////////////////////////////////////////////////////////
// CTabITTSCentral property page

IMPLEMENT_DYNCREATE(CTabITTSCentral, CPropertyPage)

CTabITTSCentral::CTabITTSCentral() : CPropertyPage(CTabITTSCentral::IDD)
{
	//{{AFX_DATA_INIT(CTabITTSCentral)
	//}}AFX_DATA_INIT
}

CTabITTSCentral::~CTabITTSCentral()
{
}

void CTabITTSCentral::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTabITTSCentral)
	DDX_Control(pDX, IDC_CHECK_TAGGED, m_checkTagged);
	DDX_Control(pDX, IDC_BUTTON_REGISTER, m_buttonRegister);
	DDX_Control(pDX, IDC_BUTTON_UNREGISTER, m_buttonUnRegister);
	DDX_Control(pDX, IDC_TOFILETIME, m_btnToFileTime);
	DDX_Control(pDX, IDC_TOFILETIMEOUTPUT, m_ToFileTimeOutput);
	DDX_Control(pDX, IDC_POSNGET, m_btnPosnGet);
	DDX_Control(pDX, IDC_EDIT_TEXTDATA, m_editTextData);
	DDX_Control(pDX, IDC_ENGCTLPAUSE, m_EngPaused);
	DDX_Control(pDX, IDC_POSGETOUTPUT, m_PosGetOutput);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CTabITTSCentral, CPropertyPage)
	//{{AFX_MSG_MAP(CTabITTSCentral)
	ON_BN_CLICKED(IDC_ENGCTLPAUSE, OnEngctlpause)
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_BUTTON_TEXTDATA, OnButtonTextdata)
	ON_BN_CLICKED(IDC_POSNGET, OnPosnGet)
	ON_BN_CLICKED(IDC_BUTTON_RESET, OnButtonReset)
	ON_BN_CLICKED(IDC_BUTTON_REGISTER, OnButtonRegister)
	ON_BN_CLICKED(IDC_BUTTON_UNREGISTER, OnButtonUnRegister)
	ON_BN_CLICKED(IDC_BUTTON_PHONEME, OnButtonPhoneme)
	ON_BN_CLICKED(IDC_BUTTON_INJECT, OnButtonInject)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CTabITTSAttr property page

IMPLEMENT_DYNCREATE(CTabITTSAttr, CPropertyPage)

CTabITTSAttr::CTabITTSAttr() : CPropertyPage(CTabITTSAttr::IDD)
{
	//{{AFX_DATA_INIT(CTabITTSAttr)
	//}}AFX_DATA_INIT
}

CTabITTSAttr::~CTabITTSAttr()
{
}

void CTabITTSAttr::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTabITTSAttr)
	DDX_Control(pDX, IDC_EDIT_ATTRIB_VOL_L, m_volumeLow);
	DDX_Control(pDX, IDC_EDIT_ATTRIB_VOL_H, m_volumeHigh);
	DDX_Control(pDX, IDC_EDIT_ATTRIB_SPEED, m_editSpeed);
	DDX_Control(pDX, IDC_EDIT_ATTRIB_REALTIME, m_editRealTime);
	DDX_Control(pDX, IDC_EDIT_ATTRIB_PITCH, m_editPitch);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CTabITTSAttr, CPropertyPage)
	//{{AFX_MSG_MAP(CTabITTSAttr)
	ON_BN_CLICKED(IDC_BUTTON_PITCHSET, OnButtonPitchSet)
	ON_BN_CLICKED(IDC_BUTTON_PITCHGET, OnButtonPitchGet)
	ON_BN_CLICKED(IDC_BUTTON_REALTIMEGET, OnButtonRealTimeGet)
	ON_BN_CLICKED(IDC_BUTTON_REALTIMESET, OnButtonRealTimeSet)
	ON_BN_CLICKED(IDC_BUTTON_SPEEDSET, OnButtonSpeedSet)
	ON_BN_CLICKED(IDC_BUTTON_SPEEDGET, OnButtonSpeedGet)
	ON_BN_CLICKED(IDC_BUTTON_VOLUMESET, OnButtonVolumeSet)
	ON_BN_CLICKED(IDC_BUTTON_VOLUMEGET, OnButtonVolumeGet)
	ON_BN_CLICKED(IDC_BUTTON_PITCHMIN, OnButtonPitchMin)
	ON_BN_CLICKED(IDC_BUTTON_PITCHMAX, OnButtonPitchMax)
	ON_BN_CLICKED(IDC_BUTTON_RTMIN, OnButtonRtMin)
	ON_BN_CLICKED(IDC_BUTTON_RTMAX, OnButtonRtMax)
	ON_BN_CLICKED(IDC_BUTTON_SPEEDMIN, OnButtonSpeedMin)
	ON_BN_CLICKED(IDC_BUTTON_SPEEDMAX, OnButtonSpeedMax)
	ON_BN_CLICKED(IDC_BUTTON_VOLMIN, OnButtonVolMin)
	ON_BN_CLICKED(IDC_BUTTON_VOLMAX, OnButtonVolMax)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CTabITTSDialogs property page

IMPLEMENT_DYNCREATE(CTabITTSDialogs, CPropertyPage)

CTabITTSDialogs::CTabITTSDialogs() : CPropertyPage(CTabITTSDialogs::IDD)
{
	//{{AFX_DATA_INIT(CTabITTSDialogs)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

CTabITTSDialogs::~CTabITTSDialogs()
{
}

void CTabITTSDialogs::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTabITTSDialogs)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CTabITTSDialogs, CPropertyPage)
	//{{AFX_MSG_MAP(CTabITTSDialogs)
	ON_BN_CLICKED(IDC_ITTSDLGGENERAL, OnIttsdlggeneral)
	ON_BN_CLICKED(IDC_ITTSDLGLEX, OnIttsdlglex)
	ON_BN_CLICKED(IDC_ITTSDLGABOUT, OnIttsdlgabout)
	ON_BN_CLICKED(IDC_ITTSDLGTRANSLATE, OnIttsdlgtranslate)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTabILexPronounce property page

IMPLEMENT_DYNCREATE(CTabILexPronounce, CPropertyPage)

CTabILexPronounce::CTabILexPronounce() : CPropertyPage(CTabILexPronounce::IDD)
{
	//{{AFX_DATA_INIT(CTabILexPronounce)
	//}}AFX_DATA_INIT
}

CTabILexPronounce::~CTabILexPronounce()
{
}

void CTabILexPronounce::Output(LPCTSTR str)
{
//	m_NotifyOut.ReplaceSel(str);
}

void CTabILexPronounce::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTabILexPronounce)
	DDX_Control(pDX, IDC_COMBO_VOICEPTOFSPCH, m_comboVPTOFSP);
	DDX_Control(pDX, IDC_EDIT_TEXT, m_editText);
	DDX_Control(pDX, IDC_COMBO_VOICECHARSET, m_comboVCHSET);
	//}}AFX_DATA_MAP
	if(pDX->m_bSaveAndValidate == FALSE)
	{
		 m_comboVPTOFSP.SetCurSel(0);
		 m_comboVCHSET.SetCurSel(0);
	}
}


BEGIN_MESSAGE_MAP(CTabILexPronounce, CPropertyPage)
	//{{AFX_MSG_MAP(CTabILexPronounce)
	ON_BN_CLICKED(IDC_BUTTON_GET, OnButtonGet)
	ON_BN_CLICKED(IDC_BUTTON_REMOVE, OnButtonRemove)
	ON_BN_CLICKED(IDC_BUTTON_ADD, OnButtonAdd)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()



/****************************************************************************

                        PROPERTY PAGE MESSAGE HANDLERS

****************************************************************************/

/////////////////////////////////////////////////////////////////////////////
// CTabITTSCentral message handlers

void CTabITTSCentral::OnTimer(UINT nIDEvent) 
{
	if( nIDEvent == ID_TIMERPOSTRACK ) OnPositionget();
		
	CPropertyPage::OnTimer(nIDEvent);
}


void CTabITTSCentral::OnEngctlpause() 
{
	TCHAR tmpstr[80];
	HRESULT hRes;

	if(!gpITTSCentral)
	{
		MessageBox(TEXT("No Engine mode loaded yet."),TEXT("Error"),MB_OK);
		return;
	}

	ASSERT(gpEng != NULL);
	gpEng->bPaused = m_EngPaused.GetCheck();

	// Pause the engine based on current state...
	if( gpEng->bPaused )
	{
		hRes = gpITTSCentral->AudioPause();
		if( hRes ) _stprintf( tmpstr, TEXT("\r\nError Pausing audio.\r\n"));
		else _stprintf( tmpstr, TEXT("\r\nAudio paused.\r\n"));
	}
	else
	{
		hRes = gpITTSCentral->AudioResume();
		if( hRes ) _stprintf( tmpstr, TEXT("\r\nError Resuming audio.\r\n"));
		else _stprintf( tmpstr, TEXT("\r\nAudio resumed.\r\n"));
	}

	MainOutput( tmpstr );
}

void CALLBACK EXPORT CTabITTSCentral::OnPositionget() 
{
	TCHAR  buf[256];
	QWORD qTimestamp;

	if (gpITTSCentral)
	{
		HRESULT hRes = gpITTSCentral->PosnGet( &qTimestamp );

		_stprintf( buf,TEXT("Pos: %08x %08x"), (DWORD)(qTimestamp>>32), (DWORD)(qTimestamp&0xffffffff) );

		m_PosGetOutput.SetWindowText( buf );

		if( m_btnToFileTime.GetCheck() )
		{
			FILETIME ft;
			hRes = gpITTSCentral->ToFileTime(&qTimestamp, &ft);
			if(SUCCEEDED(hRes))
				_stprintf( buf,TEXT("L/H: %08x %08x"), (DWORD) ft.dwLowDateTime, (DWORD) ft.dwHighDateTime );
			else
				_stprintf( buf, TEXT("ERR: ToFileTime()"));
		}
		else
		{
			_stprintf(buf, TEXT(""));
		}
		m_ToFileTimeOutput.SetWindowText( buf );
	}
}


/////////////////////////////////////////////////////////////////////////////
// CTabITTSDialogs message handlers

void CTabITTSDialogs::OnIttsdlggeneral() 
{
	if(gpITTSDialogs)
		HRESULT hRes = gpITTSDialogs->GeneralDlg( m_hWnd, NULL );
}

void CTabITTSDialogs::OnIttsdlglex() 
{
	if(gpITTSDialogs)
		HRESULT hRes = gpITTSDialogs->LexiconDlg( m_hWnd, NULL);
}

void CTabITTSDialogs::OnIttsdlgabout() 
{
	if(gpITTSDialogs)
		HRESULT hRes = gpITTSDialogs->AboutDlg( m_hWnd, NULL );
}

void CTabITTSDialogs::OnIttsdlgtranslate() 
{
	if(gpITTSDialogs)
		HRESULT hRes = gpITTSDialogs->TranslateDlg( m_hWnd, NULL );
}

void CTabITTSCentral::OnButtonTextdata() 
{
	if(gpITTSCentral)
	{
		CString editStr;
		SDATA text;

		m_editTextData.GetWindowText(editStr);

		APIALLOC(pOutStr, editStr.GetLength());
		APIA2SCVT(pOutStr, editStr);

		text.pData = pOutStr;
		text.dwSize = APISIZEOFBUF(pOutStr);

		DWORD dwFlags;
		if(m_checkTagged.GetCheck() == 1)
			dwFlags = TTSDATAFLAG_TAGGED;
		else
			dwFlags = NULL;
		
		HRESULT hRes;
		if(gpTestBufNotify)
			hRes = gpITTSCentral->TextData(CHARSET_TEXT, dwFlags, text, gpTestBufNotify, IID_ITTSBufNotifySink);
		else
			hRes = gpITTSCentral->TextData(CHARSET_TEXT, dwFlags, text, NULL, IID_ITTSBufNotifySink);

	 	if(FAILED(hRes))
		{
			TCHAR buf[256];
			_stprintf(buf, TEXT("ITTSCentral::TextData() failed with hRes = %lX.\r\n"), (DWORD) hRes);
			MainOutput(buf);
		}

		APIFREE(pOutStr);
	}
}

void CTabITTSCentral::OnPosnGet() 
{
	ASSERT(gpEng != NULL);
	if( (gpEng->bPosTracking = m_btnPosnGet.GetCheck()) )
		SetTimer( ID_TIMERPOSTRACK, 1000, NULL );
	else
	{
		KillTimer( ID_TIMERPOSTRACK );
		m_PosGetOutput.SetWindowText( TEXT("") );
	}
}

void CTabITTSCentral::OnButtonReset() 
{
	if(gpITTSCentral)
	{
		gpITTSCentral->AudioReset();
      m_EngPaused.SetCheck(0);
   	ASSERT(gpEng != NULL);
   	gpEng->bPaused = m_EngPaused.GetCheck();
	}
}


/////////////////////////////////////////////////////////////////////////////
// CTabITTSAttr message handlers

void CTabITTSAttr::OnButtonPitchSet() 
{
	if(!gpITTSAttributes)
		return;

	CString str;
	TCHAR buf[256];
	m_editPitch.GetWindowText(str);
	long lPitch = _ttol(str);
	if(lPitch < 0 || lPitch > 65535)
	{
		MessageBox(TEXT("Please type a pitch from 0 to 65535"));
		return;
	}
	WORD wPitch = LOWORD(lPitch);
	HRESULT hRes = gpITTSAttributes->PitchSet(wPitch);
	if(FAILED(hRes))
	{
		_stprintf(buf, TEXT("ITTSAttributes::PitchSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonPitchGet();	// update edit control
	}
}

void CTabITTSAttr::OnButtonPitchGet() 
{
	if(!gpITTSAttributes)
		return;

	TCHAR buf[256];
	WORD wPitch;

	HRESULT hRes = gpITTSAttributes->PitchGet(&wPitch);
	if(FAILED(hRes))
	{
		_stprintf(buf, TEXT("ITTSAttributes::PitchGet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		_stprintf( buf, TEXT("%d"), (WORD) wPitch );
		m_editPitch.SetSel( 0, -1 );
		m_editPitch.ReplaceSel( buf );
	}
}

void CTabITTSAttr::OnButtonRealTimeSet() 
{
	if(!gpITTSAttributes)
		return;

	CString str;
	TCHAR buf[256];
	m_editRealTime.GetWindowText(str);
	long lRealTime = _ttol(str);
	if(lRealTime < 0)
	{
		MessageBox(TEXT("Please type a pitch from 0 to  2147483647 (can't handle full DWORD)"));
		return;
	}
	DWORD dwRealTime = (DWORD) lRealTime;
	HRESULT hRes = gpITTSAttributes->RealTimeSet(dwRealTime);
	if(FAILED(hRes))
	{
		_stprintf(buf, TEXT("ITTSAttributes::RealTimeSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonRealTimeGet();	// update edit control
	}
}

void CTabITTSAttr::OnButtonRealTimeGet() 
{
	if(!gpITTSAttributes)
		return;

	TCHAR buf[256];
	DWORD dwRealTime;

	HRESULT hRes = gpITTSAttributes->RealTimeGet(&dwRealTime);
	if(FAILED(hRes))
	{
		_stprintf(buf, TEXT("ITTSAttributes::RealTimeGet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		_stprintf( buf, TEXT("%ld"), (DWORD) dwRealTime );
		m_editRealTime.SetSel( 0, -1 );
		m_editRealTime.ReplaceSel( buf );
	}
}

void CTabITTSAttr::OnButtonSpeedSet() 
{
	if(!gpITTSAttributes)
		return;

	CString str;
	TCHAR buf[256];
	m_editSpeed.GetWindowText(str);
	long lSpeed = _ttol(str);
	if(lSpeed < 0)
	{
		MessageBox(TEXT("Please type a speed from 0 to  2147483647 (can't handle full DWORD)"));
		return;
	}
	DWORD dwSpeed = (DWORD) lSpeed;
	HRESULT hRes = gpITTSAttributes->SpeedSet(dwSpeed);
	if(FAILED(hRes))
	{
		_stprintf(buf, TEXT("ITTSAttributes::SpeedSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonSpeedGet();	// update edit control
	}
}

void CTabITTSAttr::OnButtonSpeedGet() 
{
	if(!gpITTSAttributes)
		return;

	TCHAR buf[256];
	DWORD dwSpeed;

	HRESULT hRes = gpITTSAttributes->SpeedGet(&dwSpeed);
	if(FAILED(hRes))
	{
		_stprintf(buf, TEXT("ITTSAttributes::SpeedGet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		_stprintf( buf, TEXT("%ld"), (DWORD) dwSpeed );
		m_editSpeed.SetSel( 0, -1 );
		m_editSpeed.ReplaceSel( buf );
	}
}

void CTabITTSAttr::OnButtonVolumeSet() 
{
	if(!gpITTSAttributes)
		return;

	CString str;
	TCHAR buf[256];
	m_volumeHigh.GetWindowText(str);
	long lVolumeH = _ttol(str);
	if(lVolumeH < 0 || lVolumeH > 65535)
	{
		MessageBox(TEXT("Please type a volume from 0 to  65535 for the high word (right channel)."));
		return;
	}
	m_volumeLow.GetWindowText(str);
	long lVolumeL = _ttol(str);
	if(lVolumeL < 0 || lVolumeL > 65535)
	{
		MessageBox(TEXT("Please type a volume from 0 to  65535 for the low word (left channel)."));
		return;
	}
	DWORD dwVolume = ((lVolumeH << 16) & 0xFFFF0000) | lVolumeL;
	HRESULT hRes = gpITTSAttributes->VolumeSet(dwVolume);
	if(FAILED(hRes))
	{
		_stprintf(buf, TEXT("ITTSAttributes::VolumeSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonVolumeGet();	// update edit control
	}
}

void CTabITTSAttr::OnButtonVolumeGet() 
{
	if(!gpITTSAttributes)
		return;

	TCHAR buf[256];
	DWORD dwVolume;

	HRESULT hRes = gpITTSAttributes->VolumeGet(&dwVolume);
	if(FAILED(hRes))
	{
		_stprintf(buf, TEXT("ITTSAttributes::VolumeGet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		DWORD dwVolTemp = (dwVolume >> 16) & 0x0000FFFF;
		_stprintf( buf, TEXT("%ld"), (DWORD) dwVolTemp );
		m_volumeHigh.SetSel( 0, -1 );
		m_volumeHigh.ReplaceSel( buf );

		dwVolTemp = dwVolume & 0x0000FFFF;
		_stprintf( buf, TEXT("%ld"), (DWORD) dwVolTemp );
		m_volumeLow.SetSel( 0, -1 );
		m_volumeLow.ReplaceSel( buf );
	}
}

BOOL CTabITTSAttr::OnSetActive() 
{
	if(!CPropertyPage::OnSetActive())
		return FALSE;
	
	HRESULT hRes;
	TCHAR buf[256];

	if(gpITTSAttributes)
	{
		WORD wPitch;
		hRes = gpITTSAttributes->PitchGet(&(wPitch));		
		if(FAILED(hRes))
		{
			_stprintf(buf, TEXT("ITTSAttributes::PitchGet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
			MainOutput(buf);
			wPitch = 0xFFFF;
		}
		_stprintf( buf, TEXT("%d"), (WORD) wPitch );
		m_editPitch.SetSel( 0, -1 );
		m_editPitch.ReplaceSel( buf );

		DWORD dwRealTime;
		hRes = gpITTSAttributes->RealTimeGet(&(dwRealTime));		
		if(FAILED(hRes))
		{
			_stprintf(buf, TEXT("ITTSAttributes::RealTimeGet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
			MainOutput(buf);
			dwRealTime = 0xFFFFFFFF;
		}
		_stprintf( buf, TEXT("%ld"), (DWORD) dwRealTime );
		m_editRealTime.SetSel( 0, -1 );
		m_editRealTime.ReplaceSel( buf );

		DWORD dwSpeed;
		hRes = gpITTSAttributes->SpeedGet(&(dwSpeed));		
		if(FAILED(hRes))
		{
			_stprintf(buf, TEXT("ITTSAttributes::SpeedGet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
			MainOutput(buf);
			dwSpeed = 0xFFFFFFFF;
		}
		_stprintf( buf, TEXT("%ld"), (DWORD) dwSpeed );
		m_editSpeed.SetSel( 0, -1 );
		m_editSpeed.ReplaceSel( buf );

		DWORD dwVolume;
		hRes = gpITTSAttributes->VolumeGet(&(dwVolume));		
		if(FAILED(hRes))
		{
			_stprintf(buf, TEXT("ITTSAttributes::VolumeGet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
			MainOutput(buf);
			dwVolume = 0xFFFFFFFF;
		}

		DWORD dwVolTemp = (dwVolume & 0xFFFF0000) >> 16;
		_stprintf( buf, TEXT("%ld"), (DWORD) dwVolTemp );
		m_volumeHigh.SetSel( 0, -1 );
		m_volumeHigh.ReplaceSel( buf );

		dwVolTemp = dwVolume & 0x0000FFFF;
		_stprintf( buf, TEXT("%ld"), (DWORD) dwVolTemp );
		m_volumeLow.SetSel( 0, -1 );
		m_volumeLow.ReplaceSel( buf );
	}

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CTabITTSNotify property page

IMPLEMENT_DYNCREATE(CTabITTSNotify, CPropertyPage)

CTabITTSNotify::CTabITTSNotify() : CPropertyPage(CTabITTSNotify::IDD)
{
	//{{AFX_DATA_INIT(CTabITTSNotify)
	//}}AFX_DATA_INIT
}

CTabITTSNotify::~CTabITTSNotify()
{
}

void CTabITTSNotify::Output(LPCTSTR str)
{
	m_NotifyOut.ReplaceSel(str);
}

void CTabITTSNotify::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTabITTSNotify)
	DDX_Control(pDX, IDC_NOTIFYOUTPUT, m_NotifyOut);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CTabITTSNotify, CPropertyPage)
	//{{AFX_MSG_MAP(CTabITTSNotify)
	ON_BN_CLICKED(IDC_NOTIFYATTRIBCHANGED, OnNotifyAttribChanged)
	ON_BN_CLICKED(IDC_NOTIFYAUDIOSTART, OnNotifyAudioStart)
	ON_BN_CLICKED(IDC_NOTIFYAUDIOSTOP, OnNotifyAudioStop)
	ON_BN_CLICKED(IDC_NOTIFYVISUAL, OnNotifyVisual)
	ON_BN_CLICKED(IDC_NOTIFYBOOKMARK, OnNotifyBookMark)
	ON_BN_CLICKED(IDC_NOTIFYTEXTDATADONE, OnNotifyTextDataDone)
	ON_BN_CLICKED(IDC_NOTIFYTEXTDATASTARTED, OnNotifyTextDataStarted)
	ON_BN_CLICKED(IDC_NOTIFYWORDPOSITION, OnNotifyWordPosition)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


void CTabITTSCentral::OnButtonRegister() 
{
	if(!gpITTSCentral || !gpTestNotify)
		return;
	
	DWORD dwKey;
	TCHAR buf[256];
	HRESULT hRes = gpITTSCentral->Register(gpTestNotify, IID_ITTSNotifySink, &dwKey);
	if(FAILED(hRes))
	{
		_stprintf(buf, TEXT("\r\nITTSCentral::Register() failed with HRESULT=%lX!\r\n"), (DWORD) hRes); 
	 	MainOutput(buf);
	}
	else
	{
		gdwKeyList.AddHead(dwKey);
		_stprintf(buf, TEXT("\r\nITTSCentral::Register() succeeded: dwKey=%ld!\r\n"), (DWORD) dwKey); 
	 	MainOutput(buf);
	}
}

void CTabITTSCentral::OnButtonUnRegister() 
{
	if(!gpITTSCentral || !gpTestNotify)
		return;
	
	if(!gdwKeyList.IsEmpty())
	{
		TCHAR buf[256];
		DWORD dwKey = gdwKeyList.RemoveHead();
		HRESULT hRes = gpITTSCentral->UnRegister(dwKey);
		if(FAILED(hRes))
		{
			_stprintf(buf, TEXT("\r\nITTSCentral::UnRegister(%ld) failed with HRESULT=%lX!\r\n"), (DWORD) dwKey, (DWORD) hRes); 
		 	MainOutput(buf);
		}
		else
		{
			_stprintf(buf, TEXT("\r\nITTSCentral::UnRegister(%ld) succeeded!\r\n"), (DWORD) dwKey); 
		 	MainOutput(buf);
		}
	}
}

/////////////////////////////////////////////////////////////////////////////
// CTabITTSNotify message handlers

void CTabITTSNotify::OnNotifyAttribChanged() 
{
	ASSERT(gpEng != NULL);
	gpEng->Not.bAttribChanged = IsDlgButtonChecked(IDC_NOTIFYATTRIBCHANGED);
}

void CTabITTSNotify::OnNotifyAudioStart() 
{
	ASSERT(gpEng != NULL);
	gpEng->Not.bAudioStart = IsDlgButtonChecked(IDC_NOTIFYAUDIOSTART);
}

void CTabITTSNotify::OnNotifyAudioStop() 
{
	ASSERT(gpEng != NULL);
	gpEng->Not.bAudioStop = IsDlgButtonChecked(IDC_NOTIFYAUDIOSTOP);
}

void CTabITTSNotify::OnNotifyVisual() 
{
	ASSERT(gpEng != NULL);
	gpEng->Not.bVisual = IsDlgButtonChecked(IDC_NOTIFYVISUAL);
}

void CTabITTSNotify::OnNotifyBookMark() 
{
	ASSERT(gpEng != NULL);
	gpEng->Not.bBookMark = IsDlgButtonChecked(IDC_NOTIFYBOOKMARK);
}

void CTabITTSNotify::OnNotifyTextDataDone() 
{
	ASSERT(gpEng != NULL);
	gpEng->Not.bTextDataDone = IsDlgButtonChecked( IDC_NOTIFYTEXTDATADONE );
}

void CTabITTSNotify::OnNotifyTextDataStarted() 
{
	ASSERT(gpEng != NULL);
	gpEng->Not.bTextDataStarted = IsDlgButtonChecked( IDC_NOTIFYTEXTDATASTARTED );
}

void CTabITTSNotify::OnNotifyWordPosition() 
{
	ASSERT(gpEng != NULL);
	gpEng->Not.bWordPosition = IsDlgButtonChecked( IDC_NOTIFYWORDPOSITION );
}

/////////////////////////////////////////////////////////////////////////////
// CTabITTSCentral message handlers

void CTabITTSCentral::OnButtonPhoneme() 
{
	if(gpITTSCentral)
	{
		CString editStr;

		m_editTextData.GetWindowText(editStr);
		
		CPhonemeDlg dlg;

		dlg.m_editText = editStr;

		dlg.DoModal();
	}
}
/////////////////////////////////////////////////////////////////////////////
// CPhonemeDlg dialog


CPhonemeDlg::CPhonemeDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CPhonemeDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CPhonemeDlg)
	m_editText = TEXT("");
	m_editPhoneme = TEXT("");
	//}}AFX_DATA_INIT
}


void CPhonemeDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPhonemeDlg)
	DDX_Control(pDX, IDC_RADIO_ENG, m_radioEng);
	DDX_Text(pDX, IDC_EDIT_TEXT, m_editText);
	DDX_Text(pDX, IDC_EDIT_PHONEME, m_editPhoneme);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPhonemeDlg, CDialog)
	//{{AFX_MSG_MAP(CPhonemeDlg)
	ON_BN_CLICKED(IDC_BUTTON_PHONEME, OnButtonPhoneme)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CPhonemeDlg message handlers

void CPhonemeDlg::FormatPhoneme(PSDATA pdPhoneme, VOICECHARSET vCharSet)
{
	BOOL bSpeechIsUnicode;
#if defined(_S_UNICODE)
	bSpeechIsUnicode = TRUE;
#else
	bSpeechIsUnicode = FALSE;
#endif
	if((vCharSet == CHARSET_IPAPHONETIC) && !bSpeechIsUnicode)
	{
		// display an error, CHARSET_IPAPHONETIC should have failed for ANSI API
		m_editPhoneme = TEXT("The ANSI version of ITTSCentral::Phoneme() should fail when passed CHARSET_IPAPHONETIC!\r\n");
	}
	else
	{
#define TEMPLEN (64)
#define NUMCHARS (6)
			TCHAR hexStr[TEMPLEN];
			TCHAR* pHexStr = hexStr;
			TCHAR asciiStr[TEMPLEN];
			TCHAR* pAsciiStr = asciiStr;
			TCHAR tempStr[TEMPLEN];
			TCHAR* pTempStr = tempStr;
			CString outStr;

		if(sizeof(WCHAR) == sizeof(APICAST)) // phonemes are WCHAR
		{
			// print out as HEX ASCII table, NUMCHARS chars / line
			WCHAR* pwChar = (WCHAR*) pdPhoneme->pData;
			WCHAR* pwPhonemeEnd = (WCHAR*) ((CHAR*) pwChar + pdPhoneme->dwSize - 2); 
			DWORD count = 0;
			DWORD numLines =	(pdPhoneme->dwSize/(NUMCHARS * sizeof(WCHAR)))	// number of full lines
									+ ((pdPhoneme->dwSize%(NUMCHARS * sizeof(WCHAR)))? 1 : 0); // add one line if remainder
			
			for(DWORD i = 0; i < numLines; i++)
			{
				hexStr[0] = TEXT('\0');
				asciiStr[0] = TEXT('\0');
				for(int j = 0; j < NUMCHARS; j++)
				{
					_stprintf(pTempStr, TEXT("%04lx "), (DWORD) *pwChar);
					_tcscat(pHexStr, pTempStr);
				 
					if(_istprint(*pwChar))
					{
						_stprintf(pTempStr, TEXT("%c"), (TCHAR) *pwChar);
						_tcscat(pAsciiStr, pTempStr);
					}
					else
					{
						_tcscat(pAsciiStr, TEXT("."));
					}
					if(pwChar < pwPhonemeEnd)
						pwChar++;
				}
				outStr += hexStr;	 // "0000 0000 0000 0000 "
				outStr += asciiStr;  // "...."
				outStr += TEXT("\r\n");
			}
			m_editPhoneme = outStr;
		}
		else
		{
			// print out as HEX ASCII table, NUMCHARS chars / line
			CHAR* pwChar = (CHAR*) pdPhoneme->pData;
			CHAR* pwPhonemeEnd = (CHAR*) ((CHAR*) pwChar + pdPhoneme->dwSize - 1); 
			DWORD count = 0;
			DWORD numLines =	(pdPhoneme->dwSize/(NUMCHARS * sizeof(CHAR)))	// number of full lines
									+ ((pdPhoneme->dwSize%(NUMCHARS * sizeof(CHAR)))? 1 : 0); // add one line if remainder
			
			for(DWORD i = 0; i < numLines; i++)
			{
				hexStr[0] = TEXT('\0');
				asciiStr[0] = TEXT('\0');
				for(int j = 0; j < NUMCHARS; j++)
				{
					_stprintf(pTempStr, TEXT("%02x "), (WORD) *pwChar);
					_tcscat(pHexStr, pTempStr);
				 
					if(_istprint(*pwChar))
					{
						_stprintf(pTempStr, TEXT("%c"), (TCHAR) *pwChar);
						_tcscat(pAsciiStr, pTempStr);
					}
					else
					{
						_tcscat(pAsciiStr, TEXT("."));
					}
					if(pwChar < pwPhonemeEnd)
						pwChar++;
				}
				outStr += hexStr;	 // "00 00 00 00 "
				outStr += asciiStr;  // "...."
				outStr += TEXT("\r\n");
			}
			m_editPhoneme = outStr;
		}
	}

	UpdateData(FALSE); // update edit controls with current CString data
}

#define DUMP_PHONEME	 0
 
void CPhonemeDlg::OnButtonPhoneme() 
{
	if(!gpITTSCentral)
		return;

	SDATA text;
	HRESULT hRes;
	VOICECHARSET vCharSet;
	if(m_radioEng.GetCheck() == 1) // IDC_RADIO_ENG is checked
		vCharSet = CHARSET_ENGINEPHONETIC;
	else
		vCharSet = CHARSET_IPAPHONETIC;

	SDATA dPhoneme;
	PSDATA pdPhoneme = &dPhoneme;
	memset(pdPhoneme, NULL, sizeof(dPhoneme));

	UpdateData(TRUE);	// get the current edit contents in m_editText

	APIALLOC(pwStr, m_editText.GetLength());
	APIA2SCVT(pwStr, m_editText);
	
	text.pData = pwStr;
	text.dwSize = APISIZEOFBUF(pwStr);

	AfxGetApp()->BeginWaitCursor();
	// Call ITTSCentral::Phoneme();
	TCHAR buf[256];
	hRes = gpITTSCentral->Phoneme(vCharSet, NULL, text, pdPhoneme);
	APIFREE(pwStr);  // release memory referenced by text


#if DUMP_PHONEME
	TCHAR* pdumpbuf = new TCHAR[(m_editText.GetLength() + 1) * 2]; // overkill, but should be safe
	CString charSet;
	if(vCharSet == CHARSET_ENGINEPHONETIC)
		charSet = TEXT("CHARSET_ENGINEPHONETIC");
	else
		charSet = TEXT("CHARSET_IPAPHONETIC");
	_stprintf(pdumpbuf, TEXT("HRESULT %lX = Phoneme(%s, NULL, *pData= \"%s\", pdPhoneme)\r\n   returns: pdPhoneme->pData = 0x%lx and ->dwSize = 0x%lx\r\n"),
					(DWORD) hRes,
					(LPCTSTR) charSet,
					(LPCTSTR) m_editText,
					(DWORD) dPhoneme.pData,
					(DWORD) dPhoneme.dwSize);
	MainOutput(pdumpbuf);
#endif

	if(FAILED(hRes))
	{
		_stprintf(buf, TEXT("ITTSCentral::Phoneme() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
		m_editPhoneme = TEXT("");
		UpdateData(FALSE);
		return;
	}
	else
	{
		if(pdPhoneme == NULL || pdPhoneme->pData == NULL || pdPhoneme->dwSize == 0)
		{
			MainOutput(TEXT("ITTSCentral::Phoneme() succeeded but did not properly fill out pdPhoneme!\r\n"));
			m_editPhoneme = TEXT("");
			UpdateData(FALSE);
			return;
		}
	}
	
	// Phoneme() succeeded, continue processing & clean up memory
	FormatPhoneme(pdPhoneme, vCharSet);

	IMalloc* pIMalloc;
	hRes = CoGetMalloc(MEMCTX_TASK, &pIMalloc);
	if(SUCCEEDED(hRes))
	{
#if DUMP_PHONEME
		// extra stuff for testing
		if(pIMalloc->DidAlloc(pdPhoneme->pData) == 1)
		{
			ULONG size = pIMalloc->GetSize(pdPhoneme->pData);
			_stprintf(pdumpbuf, TEXT("   pIMalloc->GetSize(pdPhoneme->pData) = 0x%lx, dump of pData follows:\r\n"), (ULONG) size);
			MainOutput(pdumpbuf);
			delete [] pdumpbuf; // finished with this buffer
			MainOutput(m_editPhoneme);
		}
#endif
		pIMalloc->Free(pdPhoneme->pData);	// free the data allocated by Phoneme()
		pIMalloc->Release();
	}
	AfxGetApp()->EndWaitCursor();
}

BOOL CPhonemeDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	m_radioEng.SetCheck(1); // check IDC_RADIO_ENG

	// use a fixed width font for IDC_EDIT_PHONEME
	m_font.CreateStockObject(ANSI_FIXED_FONT);
	GetDlgItem(IDC_EDIT_PHONEME)->SetFont(&m_font);
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
/////////////////////////////////////////////////////////////////////////////
// CInjectDlg dialog


CInjectDlg::CInjectDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CInjectDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CInjectDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CInjectDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CInjectDlg)
	DDX_Control(pDX, IDC_EDIT_TAG, m_editTag);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CInjectDlg, CDialog)
	//{{AFX_MSG_MAP(CInjectDlg)
	ON_BN_CLICKED(IDC_BUTTON_TEXTDATA, OnButtonTextData)
	ON_BN_CLICKED(IDC_BUTTON_INJECT, OnButtonInject)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CInjectDlg message handlers

void CInjectDlg::OnButtonTextData() 
{
	// Call CTabITTSCentral handler
	((CTTStstDlg*) AfxGetMainWnd())->m_Cent.DoTextData();
}

void CTabITTSCentral::OnButtonInject() 
{
	CInjectDlg dlg;
	
	dlg.DoModal();	
}

void CInjectDlg::OnButtonInject() 
{
	if(!gpITTSCentral)
		return;

	// Inject the tag...
	CString tagStr;
	m_editTag.GetWindowText(tagStr);

	APIALLOC(pOutStr, tagStr.GetLength());
	APIA2SCVT(pOutStr, tagStr);

	HRESULT hRes = gpITTSCentral->Inject(pOutStr);
	if(FAILED(hRes))
	{
		TCHAR buf[256];
		_stprintf(buf, TEXT("ITTSCentral::Inject() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}

	APIFREE(pOutStr);	
}

#define MAXLEXTEXT (2048)
void CTabILexPronounce::OnButtonGet() 
{
	MessageBox(TEXT("Please try a later version."), TEXT("Not yet implemented..."));	
	return;
}

void CTabILexPronounce::OnButtonRemove() 
{
	MessageBox(TEXT("Please try a later version."), TEXT("Not yet implemented..."));	
}

void CTabILexPronounce::OnButtonAdd() 
{
	MessageBox(TEXT("Please try a later version."), TEXT("Not yet implemented..."));	
}

void CTabITTSAttr::OnButtonPitchMin() 
{
	if(!gpITTSAttributes)
		return;

	HRESULT hRes = gpITTSAttributes->PitchSet(TTSATTR_MINPITCH);
	if(FAILED(hRes))
	{
		TCHAR buf[256];
		_stprintf(buf, TEXT("ITTSAttributes::PitchSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonPitchGet();	// update edit control
	}
}

void CTabITTSAttr::OnButtonPitchMax() 
{
	if(!gpITTSAttributes)
		return;

	HRESULT hRes = gpITTSAttributes->PitchSet(TTSATTR_MAXPITCH);
	if(FAILED(hRes))
	{
		TCHAR buf[256];
		_stprintf(buf, TEXT("ITTSAttributes::PitchSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonPitchGet();	// update edit control
	}
	
}

void CTabITTSAttr::OnButtonRtMin() 
{
	if(!gpITTSAttributes)
		return;

	HRESULT hRes = gpITTSAttributes->RealTimeSet(TTSATTR_MINREALTIME);
	if(FAILED(hRes))
	{
		TCHAR buf[256];
		_stprintf(buf, TEXT("ITTSAttributes::RealTimeSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonRealTimeGet();	// update edit control
	}
}

void CTabITTSAttr::OnButtonRtMax() 
{
	if(!gpITTSAttributes)
		return;

	HRESULT hRes = gpITTSAttributes->RealTimeSet(TTSATTR_MAXREALTIME);
	if(FAILED(hRes))
	{
		TCHAR buf[256];
		_stprintf(buf, TEXT("ITTSAttributes::RealTimeSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonRealTimeGet();	// update edit control
	}
}

void CTabITTSAttr::OnButtonSpeedMin() 
{
	if(!gpITTSAttributes)
		return;

	HRESULT hRes = gpITTSAttributes->SpeedSet(TTSATTR_MINSPEED);
	if(FAILED(hRes))
	{
		TCHAR buf[256];
		_stprintf(buf, TEXT("ITTSAttributes::SpeedSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonSpeedGet();	// update edit control
	}
}

void CTabITTSAttr::OnButtonSpeedMax() 
{
	if(!gpITTSAttributes)
		return;

	HRESULT hRes = gpITTSAttributes->SpeedSet(TTSATTR_MAXSPEED);
	if(FAILED(hRes))
	{
		TCHAR buf[256];
		_stprintf(buf, TEXT("ITTSAttributes::SpeedSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonSpeedGet();	// update edit control
	}
}

void CTabITTSAttr::OnButtonVolMin() 
{
	if(!gpITTSAttributes)
		return;

	HRESULT hRes = gpITTSAttributes->VolumeSet(TTSATTR_MINVOLUME);
	if(FAILED(hRes))
	{
		TCHAR buf[256];
		_stprintf(buf, TEXT("ITTSAttributes::VolumeSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonVolumeGet();	// update edit control
	}
}

void CTabITTSAttr::OnButtonVolMax() 
{
	if(!gpITTSAttributes)
		return;

	HRESULT hRes = gpITTSAttributes->VolumeSet(TTSATTR_MAXVOLUME);
	if(FAILED(hRes))
	{
		TCHAR buf[256];
		_stprintf(buf, TEXT("ITTSAttributes::VolumeSet() failed with hRes = %lX.\r\n"), (DWORD) hRes);
		MainOutput(buf);
	}
	else
	{
		OnButtonVolumeGet();	// update edit control
	}
}
