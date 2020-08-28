// CEtalkDlg.cpp : implementation file
// COMMENTS
/*
	001	06/27/2000	CAB		Added extra spaces in OnSchedulingButton() to display correctly ce devices
	002 07/05/2000	CAB		Fixed programs inability to close after it crashes
    003 07/06/2000	CAB		Changed result to mmStatus to conform to other programs 
	004 07/07/2000	CAB	    Corrected spelling of phones to phonemes
	005 03/30/2000	MFG		Fixed the caaned text in the edit window
	006 04/01/2003	MFG		Changed the output text of the app
*/

#include "stdafx.h"
#include "CEtalk.h"
#include "CEtalkDlg.h"


#include "ttsapi.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

// Global variables

/////////////////////////////////////////////////////////////////////////////
// CCEtalkDlg dialog

CCEtalkDlg::CCEtalkDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CCEtalkDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CCEtalkDlg)
	m_text = _T("");
	m_clear = FALSE;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CCEtalkDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CCEtalkDlg)
	DDX_Control(pDX, IDC_TEXT, m_textBox);
	DDX_Text(pDX, IDC_TEXT, m_text);
	DDX_Check(pDX, IDC_CLEAR, m_clear);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CCEtalkDlg, CDialog)
	//{{AFX_MSG_MAP(CCEtalkDlg)
	ON_BN_CLICKED(IDC_PLAY, OnPlay)
	ON_BN_CLICKED(IDC_EMAIL_BUTTON, OnEmailButton)
	ON_BN_CLICKED(IDC_SCHEDULING_BUTTON, OnSchedulingButton)
	ON_BN_CLICKED(IDC_SALES_BUTTON, OnSalesButton)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCEtalkDlg message handlers

LPTTS_HANDLE_T phTTS;

BOOL CCEtalkDlg::OnInitDialog()
{
	MMRESULT mmStatus;
	wchar_t szError[200];	// Error string

	CDialog::OnInitDialog();
	

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	CenterWindow(GetDesktopWindow());	// center to the hpc screen



	// TODO: Add extra initialization here
	phTTS = NULL;
	mmStatus = TextToSpeechStartup(NULL, &phTTS, WAVE_MAPPER, REPORT_OPEN_ERROR);
	if (mmStatus != MMSYSERR_NOERROR)
	{
		// CAB 07/06/2000
		if ( mmStatus == MMSYSERR_INVALPARAM )
		{
			MessageBox(TEXT("Dictionary not found!"), TEXT("TTS startup failed"),
					   MB_OK | MB_ICONSTOP);
		}
		else
		{
			swprintf( szError, TEXT("TTS startup failed\n\nError = %d\n\nExiting out of application"),
                      mmStatus );
			MessageBox(szError, TEXT("CEtalk"), MB_OK | MB_ICONSTOP );
		}
		
		if (phTTS != NULL)
		{
			TextToSpeechShutdown(phTTS);	
		}
		
		// Close dialog window
		CDialog::DestroyWindow();
		return FALSE;
	}
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CCEtalkDlg::OnPlay() 
{
	wchar_t str[1024];
	unsigned int loc = 0;
	

	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	wcscpy(str,LPCTSTR(m_text));




	if (phTTS != NULL)	TextToSpeechSpeak(phTTS, str, TTS_FORCE);
	if (m_clear) {
		m_text = _T("");
		UpdateData(FALSE);
	}
	m_textBox.SetFocus();
	return;
}

void CCEtalkDlg::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	if (phTTS != NULL)	TextToSpeechShutdown(phTTS);
	CDialog::PostNcDestroy();
}


void CCEtalkDlg::OnEmailButton() 
{
TextToSpeechSpeak(phTTS, _T("[:np]"), TTS_FORCE);
m_textBox.SetWindowText(_T("From John Oelfke, 1/16/2003, 3:42 pm\t\t\t\t\t\t\
Paul, \t\t\t\t\t\t\t\t\t\
This is to confirm our meeting for the 21st, at 9:00 AM, at the Washington Conference Room. \
We are planning to cover the following agenda items.  The value of the new DECtalk version 5.0; \
adding it to your key applications; expanding your market penetration; and adding ASR in  \
the next 6 months."));

}

	 void CCEtalkDlg::OnSchedulingButton() 
{
	TextToSpeechSpeak(phTTS, _T("[:nw]"), TTS_FORCE);
	m_textBox.SetWindowText(_T("9:00 to 10:00, DECtalk Staff Meeting.\t\t\t\t\t\t\
10:00 to 11:00, One on One with Tom Murdock.\t\t\t\t\t\
11:00 to 12:00, Preparation Time for General Managers Meeting.\t\t\t\
12:00 to 1:00, Lunch with Lynn Shepherd and Roger Dudely, Discuss ASR Solution. \t\
1:00 to 3:00, Next Release of DECtalk Meeting.\t\t\t\t\t\t\
3:00 to 4:00, Marketing Collateral Review.\t\t\t\t\t\
4:00 to 7:00, 9 holes at Country Club."));
}


void CCEtalkDlg::OnSalesButton() 
{
	TextToSpeechSpeak(phTTS, _T("[:np]"), TTS_FORCE);
	m_textBox.SetWindowText(_T("The significant advantage of formant technology, verses \
concatenated text to speech synthesis is the increase in intelligibility, and the significant \
reductions in memory usage.  Since DECtalk simulates the human vocal track, to create speech, \
rather than storing concatenated recorded words or phonemes, it requires less memory, which \
is very important in hand-held battery operated devices.  Intelligibility is key  because \
information that is not understood by the user is NOT communication. It is just noise! \
DECtalk can add intonation to words, and a word does not have to be in the dictionary to \
be spoken."));
}
