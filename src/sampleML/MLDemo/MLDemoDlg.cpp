// demoDlg.cpp : implementation file
// Comments
// 001 cab	04/30/01	Added uk and fr to demo
// 002 CAB	03/27/2002	Added auto update for copyright

#include "stdafx.h"
#include "MLdemo.h"
#include "MLdemoDlg.h"
#include "mmsystem.h"
#include "ttsapi.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

LPTTS_HANDLE_T usTTS, spTTS, grTTS, laTTS, ukTTS, frTTS;
BOOL	us, sp, gr, la, uk, fr;
unsigned int usID, spID, grID, laID, ukID, frID;
int ring_start;
BOOL ring_hit;
BOOL ring_on;

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	CString m_copyrightstat;
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	m_copyrightstat = COPYRIGHT_DATE " " COPYRIGHT_COMPANY;
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	DDX_Text(pDX, IDD_COPYRIGHT, m_copyrightstat);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDemoDlg dialog

CDemoDlg::CDemoDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDemoDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDemoDlg)
	m_grstat = _T("Not loaded");
	m_spstat = _T("Not loaded");
	m_usstat = _T("Not loaded");
	m_lastat = _T("Not loaded");
	m_ukstat = _T("Not loaded");
	m_frstat = _T("Not loaded");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	usTTS = NULL;
	spTTS = NULL;
	grTTS = NULL;
	laTTS = NULL;
	ukTTS = NULL;
	frTTS = NULL;
	us = FALSE;
	sp = FALSE;
	gr = FALSE;
	la = FALSE;
	uk = FALSE;
	fr = FALSE;
	ring_start = 0;		// English_US
	ring_on = FALSE;	// No ring running
}

void CDemoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDemoDlg)
	DDX_Text(pDX, IDC_GRSTAT, m_grstat);
	DDX_Text(pDX, IDC_SPSTAT, m_spstat);
	DDX_Text(pDX, IDC_USSTAT, m_usstat);
	DDX_Text(pDX, IDC_LASTAT, m_lastat);
	DDX_Text(pDX, IDC_UKSTAT, m_ukstat);
	DDX_Text(pDX, IDC_FRSTAT, m_frstat);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDemoDlg, CDialog)
	//{{AFX_MSG_MAP(CDemoDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_ENGLISH, OnEnglish)
	ON_BN_CLICKED(IDC_GERMAN, OnGerman)
	ON_BN_CLICKED(IDC_LATIN, OnLatin)
	ON_BN_CLICKED(IDC_SPANISH, OnSpanish)
	ON_BN_CLICKED(IDC_ENGLISH_UK, OnEnglish_UK)
	ON_BN_CLICKED(IDC_FRENCH, OnFrench)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDemoDlg message handlers

BOOL CDemoDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CDemoDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CDemoDlg::OnPaint() 
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

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CDemoDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

extern "C" {
	void TTSUSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);
	void TTSGRCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);
	void TTSSPCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);
	void TTSLACallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);
	void TTSUKCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);
	void TTSFRCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);
	void start_ring(int lang);
	void run_ring(int next_lang);
}


void CDemoDlg::OnEnglish() 
{
	m_usstat = "Loading";
	UpdateData(FALSE);
	if (usTTS) {
		us = FALSE;
		TextToSpeechReset(usTTS,TRUE);
		TextToSpeechShutdown(usTTS);
		usTTS = NULL;
		TextToSpeechCloseLang("US");
		m_usstat = "Unloaded";
		UpdateData(FALSE);
		return;
	}
	usID = TextToSpeechStartLang("US");
	if (usID & TTS_LANG_ERROR) {
		m_usstat = "Not available";
		UpdateData(FALSE);
		return;
	}
	TextToSpeechSelectLang(NULL, usID);
	TextToSpeechStartupEx(&usTTS, WAVE_MAPPER, REPORT_OPEN_ERROR, TTSUSCallbackRoutine, NULL);
//	TextToSpeechStartup(NULL, &usTTS, WAVE_MAPPER, REPORT_OPEN_ERROR);
	us = TRUE;
	start_ring(0);
	m_usstat = "Running";
	UpdateData(FALSE);
	return;
}

void CDemoDlg::OnGerman() 
{
	m_grstat = "Loading";
	UpdateData(FALSE);
	if (grTTS) {
		gr = FALSE;
		TextToSpeechReset(grTTS,TRUE);
		TextToSpeechShutdown(grTTS);
		grTTS = NULL;
		TextToSpeechCloseLang("GR");
		m_grstat = "Unloaded";
		UpdateData(FALSE);
		return;
	}
	grID = TextToSpeechStartLang("GR");
	if (grID & TTS_LANG_ERROR) {
		m_grstat = "Not available";
		UpdateData(FALSE);
		return;
	}
	TextToSpeechSelectLang(NULL, grID);
	TextToSpeechStartupEx(&grTTS, WAVE_MAPPER, REPORT_OPEN_ERROR, TTSGRCallbackRoutine, NULL);
//	TextToSpeechStartup(NULL, &grTTS, WAVE_MAPPER, REPORT_OPEN_ERROR);
	gr = TRUE;
	start_ring(1);
	m_grstat = "Running";
	UpdateData(FALSE);
	return;
}

void CDemoDlg::OnSpanish() 
{
	m_spstat = "Loading";
	UpdateData(FALSE);
	if (spTTS) {
		sp = FALSE;
		TextToSpeechReset(spTTS,TRUE);
		TextToSpeechShutdown(spTTS);
		spTTS = NULL;
		TextToSpeechCloseLang("SP");
		m_spstat = "Unloaded";
		UpdateData(FALSE);
		return;
	}
	spID = TextToSpeechStartLang("SP");
	if (spID & TTS_LANG_ERROR) {
		m_spstat = "Not available";
		UpdateData(FALSE);
		return;
	}
	TextToSpeechSelectLang(NULL, spID);
	TextToSpeechStartupEx(&spTTS, WAVE_MAPPER, REPORT_OPEN_ERROR, TTSSPCallbackRoutine, NULL);
//	TextToSpeechStartup(NULL, &spTTS, WAVE_MAPPER, REPORT_OPEN_ERROR);
	sp = TRUE;
	start_ring(2);
	m_spstat = "Running";
	UpdateData(FALSE);
	return;
}

void CDemoDlg::OnLatin() 
{
	m_lastat = "Loading";
	UpdateData(FALSE);
	if (laTTS) {
		la = FALSE;
		TextToSpeechReset(laTTS,TRUE);
		TextToSpeechShutdown(laTTS);
		laTTS = NULL;
		TextToSpeechCloseLang("LA");
		m_lastat = "Unloaded";
		UpdateData(FALSE);
		return;
	}
	laID = TextToSpeechStartLang("LA");
	if (laID & TTS_LANG_ERROR) {
		m_lastat = "Not available";
		UpdateData(FALSE);
		return;
	}
	TextToSpeechSelectLang(NULL, laID);
	TextToSpeechStartupEx(&laTTS, WAVE_MAPPER, REPORT_OPEN_ERROR, TTSLACallbackRoutine, NULL);
//	TextToSpeechStartup(NULL, &laTTS, WAVE_MAPPER, REPORT_OPEN_ERROR);
	la = TRUE;
	start_ring(3);
	m_lastat = "Running";
	UpdateData(FALSE);
	return;
}

void CDemoDlg::OnEnglish_UK() 
{
	m_ukstat = "Loading";
	UpdateData(FALSE);
	if (ukTTS) {
		uk = FALSE;
		TextToSpeechReset(ukTTS,TRUE);
		TextToSpeechShutdown(ukTTS);
		ukTTS = NULL;
		TextToSpeechCloseLang("UK");
		m_ukstat = "Unloaded";
		UpdateData(FALSE);
		return;
	}
	ukID = TextToSpeechStartLang("UK");
	if (ukID & TTS_LANG_ERROR) {
		m_ukstat = "Not available";
		UpdateData(FALSE);
		return;
	}
	TextToSpeechSelectLang(NULL, ukID);
	TextToSpeechStartupEx(&ukTTS, WAVE_MAPPER, REPORT_OPEN_ERROR, TTSUKCallbackRoutine, NULL);
//	TextToSpeechStartup(NULL, &ukTTS, WAVE_MAPPER, REPORT_OPEN_ERROR);
	uk = TRUE;
	start_ring(4);
	m_ukstat = "Running";
	UpdateData(FALSE);
	return;
}

void CDemoDlg::OnFrench() 
{
	m_frstat = "Loading";
	UpdateData(FALSE);
	if (frTTS) {
		fr = FALSE;
		TextToSpeechReset(frTTS,TRUE);
		TextToSpeechShutdown(frTTS);
		frTTS = NULL;
		TextToSpeechCloseLang("FR");
		m_frstat = "Unloaded";
		UpdateData(FALSE);
		return;
	}
	frID = TextToSpeechStartLang("FR");
	if (frID & TTS_LANG_ERROR) {
		m_frstat = "Not available";
		UpdateData(FALSE);
		return;
	}
	TextToSpeechSelectLang(NULL, frID);
	TextToSpeechStartupEx(&frTTS, WAVE_MAPPER, REPORT_OPEN_ERROR, TTSFRCallbackRoutine, NULL);
//	TextToSpeechStartup(NULL, &frTTS, WAVE_MAPPER, REPORT_OPEN_ERROR);
	fr = TRUE;
	start_ring(5);
	m_frstat = "Running";
	UpdateData(FALSE);
	return;
}

BOOL CDemoDlg::Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext) 
{
	usTTS = NULL;
	spTTS = NULL;
	grTTS = NULL;
	laTTS = NULL;
	ukTTS = NULL;
	frTTS = NULL;
	us = FALSE;
	gr = FALSE;
	sp = FALSE;
	la = FALSE;
	uk = FALSE;
	fr = FALSE;
	return CDialog::Create(IDD, pParentWnd);
}

BOOL CDemoDlg::DestroyWindow() 
{
	us = FALSE;
	gr = FALSE;
	sp = FALSE;
	la = FALSE;
	uk = FALSE;
	fr = FALSE;
	if (usTTS)	TextToSpeechShutdown(usTTS);
	if (grTTS)	TextToSpeechShutdown(grTTS);
	if (spTTS)	TextToSpeechShutdown(spTTS);
	if (laTTS)	TextToSpeechShutdown(laTTS);
	if (ukTTS)	TextToSpeechShutdown(ukTTS);
	if (frTTS)	TextToSpeechShutdown(frTTS);
	return CDialog::DestroyWindow();
}

extern "C" {

VOID TTSUSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg) {

	switch( lParam1 )
	{
		case TTS_AUDIO_PLAY_STOP:
			run_ring(1);
			break;
		case TTS_INDEX_MARK:
		case TTS_AUDIO_PLAY_START:
		case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
		case ERROR_IN_AUDIO_WRITE:
		case ERROR_GETTING_DEVICE_CAPABILITIES:
		default:
			break;
	}
}

VOID TTSGRCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg) {

	switch( lParam1 )
	{
		case TTS_AUDIO_PLAY_STOP:
			run_ring(2);
			break;
		case TTS_INDEX_MARK:
		case TTS_AUDIO_PLAY_START:
		case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
		case ERROR_IN_AUDIO_WRITE:
		case ERROR_GETTING_DEVICE_CAPABILITIES:
		default:
			break;
	}
}

VOID TTSSPCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg) {

	switch( lParam1 )
	{
		case TTS_AUDIO_PLAY_STOP:
			run_ring(3);
			break;
		case TTS_INDEX_MARK:
		case TTS_AUDIO_PLAY_START:
		case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
		case ERROR_IN_AUDIO_WRITE:
		case ERROR_GETTING_DEVICE_CAPABILITIES:
		default:
			break;
	}
}

VOID TTSLACallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg) {

	switch( lParam1 )
	{
		case TTS_AUDIO_PLAY_STOP:
			run_ring(4);
			break;
		case TTS_INDEX_MARK:
		case TTS_AUDIO_PLAY_START:
		case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
		case ERROR_IN_AUDIO_WRITE:
		case ERROR_GETTING_DEVICE_CAPABILITIES:
		default:
			break;
	}
}

VOID TTSUKCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg) {

	switch( lParam1 )
	{
		case TTS_AUDIO_PLAY_STOP:
			run_ring(5);
			break;
		case TTS_INDEX_MARK:
		case TTS_AUDIO_PLAY_START:
		case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
		case ERROR_IN_AUDIO_WRITE:
		case ERROR_GETTING_DEVICE_CAPABILITIES:
		default:
			break;
	}
}

VOID TTSFRCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg) {

	switch( lParam1 )
	{
		case TTS_AUDIO_PLAY_STOP:
			run_ring(0);
			break;
		case TTS_INDEX_MARK:
		case TTS_AUDIO_PLAY_START:
		case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
		case ERROR_IN_AUDIO_WRITE:
		case ERROR_GETTING_DEVICE_CAPABILITIES:
		default:
			break;
	}
}
void start_ring(int lang) {
	if (ring_on == TRUE)	return;
	ring_on = TRUE;
	if (lang == 0)	ring_start = 3;
	else			ring_start = lang - 1;
	ring_hit = FALSE;
	run_ring(lang);
	return;
}

void run_ring(int next_lang) {
	if (next_lang == ring_start && ring_hit == FALSE) {
		ring_on = FALSE;
		return;		// End ring
	}
	if (ring_start == next_lang)	ring_hit = FALSE;
	switch (next_lang) {
		case 0:	if (us && usTTS != NULL) {
					ring_hit = TRUE;
					TextToSpeechSpeak(usTTS, "1, 2, 3, 4, 5. ", TTS_FORCE);
				} else				run_ring(1);
				break;
		case 1:	if (gr && grTTS != NULL) {
					ring_hit = TRUE;
					TextToSpeechSpeak(grTTS, "1, 2, 3, 4, 5. ", TTS_FORCE);
				} else				run_ring(2);
				break;
		case 2: if (sp && spTTS != NULL) {
					ring_hit = TRUE;
					TextToSpeechSpeak(spTTS, "1, 2, 3, 4, 5. ", TTS_FORCE);
				} else				run_ring(3);
				break;
		case 3: if (la && laTTS != NULL) {
					ring_hit = TRUE;
					TextToSpeechSpeak(laTTS, "1, 2, 3, 4, 5. ", TTS_FORCE);
				} else				run_ring(4);
				break;
		case 4: if (uk && ukTTS != NULL) {
					ring_hit = TRUE;
					TextToSpeechSpeak(ukTTS, "1, 2, 3, 4, 5. ", TTS_FORCE);
				} else				run_ring(5);
				break;
		case 5: if (fr && frTTS != NULL) {
					ring_hit = TRUE;
					TextToSpeechSpeak(frTTS, "1, 2, 3, 4, 5. ", TTS_FORCE);
				} else				run_ring(0);
				break;
	}
	return;
}

}	// End EXTERN "C"