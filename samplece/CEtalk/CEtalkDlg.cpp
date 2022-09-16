// CEtalkDlg.cpp : implementation file
// Comments
// 001 	CAB	Fixed spelling error and fixed display of schelduling text
//          by adding extra spaces.

#include "stdafx.h"
#include "CEtalk.h"
#include "CEtalkDlg.h"


#include "ttsapi.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


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
	CDialog::OnInitDialog();
	MMRESULT result;
	

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	CenterWindow(GetDesktopWindow());	// center to the hpc screen



	// TODO: Add extra initialization here
	phTTS = NULL;
	result = TextToSpeechStartup(NULL, &phTTS, WAVE_MAPPER, REPORT_OPEN_ERROR);
	if (result != MMSYSERR_NOERROR) {
		MessageBox(TEXT("Failed to start DECtalk"), TEXT("CEtalk"), MB_OK);
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
	m_textBox.SetWindowText(_T("From George Smith, 7/16/98, 3:42 pm\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\
Paul,\t\t\t\t\t\t\t\t\t\
This is to confirm our meeting, for the 21st, at 9:00 AM, at the Washington Conference Room.  \
We are planning to cover the following agenda items.  Investments in new products, adding key \
application, to our technology products, to expand market penetration, and sales and \
marketing programs for the 1st quarter.")); 	
}

void CCEtalkDlg::OnSchedulingButton() 
{
	TextToSpeechSpeak(phTTS, _T("[:np]"), TTS_FORCE);
	m_textBox.SetWindowText(_T("9:00 to 10:00, DECtalk Staff Meeting.\t\t\t\t\t\t\
10:00 to 11:00, One on One with Jack Smith.\t\t\t\t\t\
11:00 to 12:00, Preparation Time for General Managers Meeting.\t\t\t\
12:00 to 1:00, Lunch with Paul Hiles and Annie Bacon, Discuss Email application.         \t\
1:00 to 3:00, Re-engineering Meeting.\t\t\t\t\t\t\
3:00 to 4:00, Marketing Collateral Review.\t\t\t\t\t\
4:00 to 7:00, 9 holes at Country Club."));
}

void CCEtalkDlg::OnSalesButton() 
{
	TextToSpeechSpeak(phTTS, _T("[:np]"), TTS_FORCE);
	m_textBox.SetWindowText(_T("The significant advantage of, formant technology, verses \
concatenated text to speech synthesis, is the significant reductions in memory usage.  Since \
DECtalk simulates the human vocal track, to create speech, rather than storing concatenated \
recorded words or phonemes, it requires less memory, which is very important in hand-held \
battery operated devices.  DECtalk can add intonation to words, and a word does not have to \
be in the dictionary to be spoken."));
}
