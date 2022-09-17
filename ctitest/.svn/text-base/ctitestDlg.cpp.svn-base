// ctitestDlg.cpp : implementation file
//

#include <mmsystem.h>
#include "\work\rnd\dapi\src\api\ttsapi.h"
#include "waveplay.h"

#include "stdafx.h"
#include "ctitest.h"
#include "ctitestDlg.h"
#include "process.h"

#include <mmsystem.h>
#include <mmreg.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define RED			0x00
#define YELLOW		0x01
#define GREEN		0x02

extern "C" {
	void NewThread(void* VPthread_data);
	void RunThread(LPTHREAD_DATA thread_data);
	void TTSCallback(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);
};

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
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
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCtitestDlg dialog

CCtitestDlg::CCtitestDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CCtitestDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CCtitestDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CCtitestDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CCtitestDlg)
	DDX_Control(pDX, IDC_STATUS, m_status);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CCtitestDlg, CDialog)
	//{{AFX_MSG_MAP(CCtitestDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_NOTIFY(NM_DBLCLK, IDC_STATUS, OnDblclkStatus)
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCtitestDlg message handlers

BOOL CCtitestDlg::OnInitDialog()
{
	int i;
	char name[25];

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
	m_RedIcon = (HICON) LoadImage(AfxGetApp()->m_hInstance, MAKEINTRESOURCE(IDI_RED), IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR | LR_LOADTRANSPARENT);
	m_YellowIcon = (HICON) LoadImage(AfxGetApp()->m_hInstance, MAKEINTRESOURCE(IDI_YELLOW), IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR | LR_LOADTRANSPARENT);
	m_GreenIcon = (HICON) LoadImage(AfxGetApp()->m_hInstance, MAKEINTRESOURCE(IDI_GREEN), IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR | LR_LOADTRANSPARENT);

	m_imagelist.Create(16, 16, ILC_COLOR, 0, 3);
	m_RedID = m_imagelist.Add(m_RedIcon);
	m_YellowID = m_imagelist.Add(m_YellowIcon);
	m_GreenID = m_imagelist.Add(m_GreenIcon);

	m_status.SetImageList(&m_imagelist,LVSIL_SMALL);

	m_status.InsertColumn(0, "Threads", LVCFMT_LEFT, 265, -1);

	for (i = 0; i < 20; i++) {
		sprintf(name,"Thread %d",i + 1);
		m_status.InsertItem(i, name, m_RedID);
		m_threads[i].status = RED;
		m_threads[i].new_status = RED;
		m_threads[i].play = FALSE;
	}
	cur_play_num = 0;
	SetTimer( 1, 500, NULL);
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CCtitestDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CCtitestDlg::OnPaint() 
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
HCURSOR CCtitestDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CCtitestDlg::OnTimer(UINT nIDEvent) 
{
	int i;
	int image;
	LV_ITEM item;

	for (i = 0; i < 20; i++) {
		switch (m_threads[i].status) {
			case YELLOW:	image = m_YellowID;	break;
			case GREEN:		image = m_GreenID;	break;
			default:		image = m_RedID;	break;
		}
		item.mask = LVIF_IMAGE;
		item.iItem = i;
		item.iSubItem = 0;
		m_status.GetItem(&item);
		item.iImage = image;
		m_status.SetItem(&item);
	}
	NewPlay();
	CDialog::OnTimer(nIDEvent);
}

void CCtitestDlg::OnDblclkStatus() 
{
	int i;

	for (i = 0; i < 20; i++) {
		if (m_status.GetItemState(i, LVIS_SELECTED) != 0) {
			if (m_threads[i].status != RED) {
				m_threads[i].new_status = RED;
//				TextToSpeechReset(m_threads[i].phTTS,TRUE);
			} else {
				InitThread(i);
			}
		}
	}
	return;
}

void CCtitestDlg::NewPlay(void) {
	int i, j;

	for (i = 0; i < 20; i++) {
		if (m_threads[i].play == 1) {
			if (m_threads[i].play_ready != 0) {
				if (player.Done(2) != TRUE)		player.Sync(2);
				memcpy(cur_play, play_buffer, m_threads[i].play_buf_size);
				cur_play_size = m_threads[i].play_buf_size;
				m_threads[i].play_ready = 0;
				player.Play(cur_play, cur_play_size);
			}
		}
	}

	for (i = 0; i < 20; i++) {
		if (m_status.GetItemState(i, LVIS_SELECTED) != 0) {
			if (m_threads[i].status != RED) {
				for (j = 0; j < i; j++) {
					m_threads[j].play = 0;
				}
				if (cur_play_num != i) {
					player.Stop();
				}
				cur_play_num = i;
				m_threads[i].play = 1;
			}
		} else {
			if (cur_play_num == i) {
				player.Stop();
			}
			m_threads[i].play = 0;
		}
	}
	return;
}

void CCtitestDlg::InitThread(int thread) {
	char temp[5000];
	LPTHREAD_DATA thread_data = &m_threads[thread];

	thread_data->phTTS = NULL;
	sprintf(thread_data->string,"Hello, I am thread %d and I am still running. ",thread + 1);
	strcpy(temp, thread_data->string);
	strcat(temp, thread_data->string);
	strcat(temp, thread_data->string);
	strcat(thread_data->string, temp);

	thread_data->membuffs[0].lpData = thread_data->buffers[0];
	thread_data->membuffs[0].lpPhonemeArray = NULL;
	thread_data->membuffs[0].lpIndexArray = NULL;
	thread_data->membuffs[0].dwMaximumBufferLength = MAX_TTS_BUF;
	thread_data->membuffs[0].dwMaximumNumberOfPhonemeChanges = 0;
	thread_data->membuffs[0].dwMaximumNumberOfIndexMarks = 0;

	thread_data->membuffs[1].lpData = thread_data->buffers[1];
	thread_data->membuffs[1].lpPhonemeArray = NULL;
	thread_data->membuffs[1].lpIndexArray = NULL;
	thread_data->membuffs[1].dwMaximumBufferLength = MAX_TTS_BUF;
	thread_data->membuffs[1].dwMaximumNumberOfPhonemeChanges = 0;
	thread_data->membuffs[1].dwMaximumNumberOfIndexMarks = 0;

	thread_data->status = YELLOW;
	thread_data->new_status = GREEN;
	thread_data->base_play = play_buffer;
	thread_data->play_ready = FALSE;

	/* Start a new thread here */
	_beginthread(NewThread, 0, (void*) thread_data);
	return;
}

/* C Decl */
extern "C" {

void NewThread(void* VPthread_data) {
	LPTHREAD_DATA thread_data = (LPTHREAD_DATA) VPthread_data;

	/* Start the TTS engine */
	if (TextToSpeechStartupEx(&thread_data->phTTS, 0, DO_NOT_USE_AUDIO_DEVICE, TTSCallback, (DWORD) thread_data) != MMSYSERR_NOERROR) {
		thread_data->status = RED;
		return;
	}
	if (TextToSpeechOpenInMemory(thread_data->phTTS, WAVE_FORMAT_1M16) != MMSYSERR_NOERROR) {
		TextToSpeechShutdown(thread_data->phTTS);
		thread_data->status = RED;
		return;
	}
	thread_data->BufferMessage = RegisterWindowMessage("DECtalkBufferMessage");
	TextToSpeechAddBuffer(thread_data->phTTS, &thread_data->membuffs[0]);
	TextToSpeechAddBuffer(thread_data->phTTS, &thread_data->membuffs[1]);

	/* Let's do the main loop */
	RunThread(thread_data);

	TextToSpeechReset(thread_data->phTTS, TRUE);
	TextToSpeechCloseInMemory(thread_data->phTTS);
	TextToSpeechShutdown(thread_data->phTTS);
	thread_data->status = RED;
	return;
}

void RunThread(LPTHREAD_DATA thread_data) {
	while (thread_data->status != RED) {
		thread_data->status = thread_data->new_status;
		if (thread_data->status == GREEN) {
			TextToSpeechSpeak(thread_data->phTTS, thread_data->string, TTS_FORCE);
			TextToSpeechSync(thread_data->phTTS);
		}
		if (thread_data->status != RED)		thread_data->status = YELLOW;
		Sleep(2000);
	}
	return;
}

void TTSCallback(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg) {
	TTS_BUFFER_T *membuf;
	LPTHREAD_DATA thread = (LPTHREAD_DATA) dwInstanceParam;

	if (uiMsg == thread->BufferMessage) {
		membuf = (struct TTS_BUFFER_TAG*) lParam2;
		if (thread->play == 1) {
			while (thread->play_ready == TRUE && thread->new_status == GREEN)		Sleep(100);
			if (thread->new_status != RED && thread->new_status != YELLOW && thread->play != 0) {
				memcpy(thread->base_play, membuf->lpData, membuf->dwBufferLength);
				thread->play_buf_size = membuf->dwBufferLength;
				thread->play_ready = TRUE;
			}
		} else {
			Sleep(250);
		}
		TextToSpeechAddBuffer(thread->phTTS, membuf);
	}
	return;
}

};	// extern "C"

void CCtitestDlg::OnCancel() 
{
	int i;

	for (i = 0; i < 20; i++) {
		if (m_threads[i].status != RED) {
			StartKill();
			return;
		}
	}
	CDialog::OnCancel();
	return;
}

void CCtitestDlg::StartKill(void) {
	int i;

	for (i = 0; i < 20; i++) {
		m_threads[i].new_status = RED;
	}
	return;
}



