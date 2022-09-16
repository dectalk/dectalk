// skipdemoDlg.cpp : implementation file
//

#include "stdafx.h"
#include "skipdemo.h"
#include "skipdemoDlg.h"

#include "ttsapi.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define INCREMENT_PLURAL	"words"
#define INCREMENT_SINGLE	"word"

extern "C" {
	void TTSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);
}

unsigned long int CurrentIndexMark = 0;
BOOL speaking = FALSE;

/////////////////////////////////////////////////////////////////////////////
// CSkipdemoDlg dialog

CSkipdemoDlg::CSkipdemoDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSkipdemoDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSkipdemoDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	m_hStopIcon = AfxGetApp()->LoadIcon(IDI_STOP);
	m_hPlayIcon = AfxGetApp()->LoadIcon(IDI_PLAY);
}

void CSkipdemoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSkipdemoDlg)
	DDX_Control(pDX, IDC_EDITBOX, m_text);
	DDX_Control(pDX, IDC_TIMESLIDE, m_timeslide);
	DDX_Control(pDX, IDC_STOP, m_stop);
	DDX_Control(pDX, IDC_PLAY, m_play);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CSkipdemoDlg, CDialog)
	//{{AFX_MSG_MAP(CSkipdemoDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_HSCROLL()
	ON_BN_CLICKED(IDC_PLAY, OnPlay)
	ON_BN_CLICKED(IDC_STOP, OnStop)
	ON_BN_CLICKED(IDC_SKIPAHEAD, OnSkipahead)
	ON_BN_CLICKED(IDC_SKIPBACK, OnSkipback)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSkipdemoDlg message handlers

BOOL CSkipdemoDlg::OnInitDialog()
{
	char text[50];

	CDialog::OnInitDialog();

	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	m_play.SetIcon(m_hPlayIcon);
	m_stop.SetIcon(m_hStopIcon);

	m_timeslide.SetRange(1,10,TRUE);
	if (m_timeslide.GetPos() != 1)	sprintf(text,"%d %s",m_timeslide.GetPos(),INCREMENT_PLURAL);
	else							sprintf(text,"1 %s",INCREMENT_SINGLE);
	SetDlgItemText(IDC_TIME, text);

	if (TextToSpeechStartupEx(&phTTS, WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, NULL) != MMSYSERR_NOERROR) {
		phTTS = NULL;
		return FALSE;
	}
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CSkipdemoDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

HCURSOR CSkipdemoDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CSkipdemoDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
	char text[50];

	CDialog::OnHScroll(nSBCode, nPos, pScrollBar);
	if (m_timeslide.GetPos() != 1)	sprintf(text,"%d %s",m_timeslide.GetPos(),INCREMENT_PLURAL);
	else							sprintf(text,"1 %s",INCREMENT_SINGLE);
	SetDlgItemText(IDC_TIME, text);
}

BOOL CSkipdemoDlg::DestroyWindow() 
{
	if (phTTS != NULL)	TextToSpeechShutdown(phTTS);	
	return CDialog::DestroyWindow();
}

void CSkipdemoDlg::OnPlay() 
{
	char temp[65535];
	char line[255];
	unsigned int ptr, cnt;
	int index;

	if (speaking)	return;

	if (m_text.GetWindowText(temp, 65535) > 0) {
		ptr = 0;
		index = 1;
		while (ptr < strlen(temp)) {
			cnt = 0;
			while (temp[ptr] > 32) {
				line[cnt] = temp[ptr];
				ptr++;
				cnt++;
			}
			while (temp[ptr] < 33)	ptr++;
			line[cnt++] = '\0';
			sprintf(line,"%s[:i m %d] ",line, index++);
			TextToSpeechSpeak(phTTS, line, TTS_NORMAL);
		}
		sprintf(line,"");
		TextToSpeechSpeak(phTTS, line, TTS_FORCE);
	}
}

void CSkipdemoDlg::OnStop() 
{
	TextToSpeechReset(phTTS, FALSE);
}

void CSkipdemoDlg::OnSkipahead() 
{
	char temp[65535];
	char line[255];
	unsigned int ptr, cnt;
	int index, dest;

	if (!speaking)	return;

	dest = m_timeslide.GetPos() + CurrentIndexMark + 1;
	TextToSpeechReset(phTTS,FALSE);
	CurrentIndexMark = dest - 1;
	if (m_text.GetWindowText(temp, 65535) > 0) {
		ptr = 0;
		index = 1;
		while (ptr < strlen(temp)) {
			cnt = 0;
			while (temp[ptr] > 32) {
				line[cnt] = temp[ptr];
				ptr++;
				cnt++;
			}
			while (temp[ptr] < 33)	ptr++;
			line[cnt++] = '\0';
			sprintf(line,"%s[:i m %d] ",line, index++);
			if (index > dest)	TextToSpeechSpeak(phTTS, line, TTS_NORMAL);
		}
		sprintf(line,"");
		TextToSpeechSpeak(phTTS, line, TTS_FORCE);
	}
}

void CSkipdemoDlg::OnSkipback() 
{
	char temp[65535];
	char line[255];
	unsigned int ptr, cnt;
	int index, dest;

	if (!speaking)	return;

	dest = (CurrentIndexMark + 2) - m_timeslide.GetPos();
	if (dest < 0)	dest = 0;
	TextToSpeechReset(phTTS,FALSE);
	if (dest > 1)	CurrentIndexMark = dest - 2;
	else			CurrentIndexMark = 0;
	if (m_text.GetWindowText(temp, 65535) > 0) {
		ptr = 0;
		index = 1;
		while (ptr < strlen(temp)) {
			cnt = 0;
			while (temp[ptr] > 32) {
				line[cnt] = temp[ptr];
				ptr++;
				cnt++;
			}
			while (temp[ptr] < 33)	ptr++;
			line[cnt++] = '\0';
			sprintf(line,"%s[:i m %d] ",line, index++);
			if (index > dest)	TextToSpeechSpeak(phTTS, line, TTS_NORMAL);
		}
		sprintf(line,"");
		TextToSpeechSpeak(phTTS, line, TTS_FORCE);
	}
}

extern "C" {

void TTSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg) {
	switch( lParam1 )
	{
		case TTS_INDEX_MARK:
			CurrentIndexMark = lParam2;
			break;
		case TTS_AUDIO_PLAY_STOP:
			speaking = FALSE;
			break;
		case TTS_AUDIO_PLAY_START:
			speaking = TRUE;
			break;
		case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
		case ERROR_IN_AUDIO_WRITE:
		case ERROR_GETTING_DEVICE_CAPABILITIES:
		default:
			break;
	}
}

}
