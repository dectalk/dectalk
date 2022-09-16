/******************************************************************************\
*       ttsdlg.cpp
*
*       Implements functionality of the main application dialog (CTTStstDlg)
*       and the about dialog (CAboutDlg).
*
*       This code and information is provided "as is" without warranty
*       of any kind, either expressed or implied, including but not
*       limited to the implied warranties of merchantability and/or
*       fitness for a particular purpose.
*
*       Copyright (C) 1995 Microsoft Corporation.  All Rights Reserved.
*
\******************************************************************************/

// .cpp : implementation file
//

#include "stdafx.h"

#include <mmsystem.h>
#include <speech.h>
#include <tchar.h>
#include "bufcvt.h"

#include "resource.h"
#include "tabisrce.h"
#include "ttstst.h"
#include "ttsdlg.h"
#include "dlgfindm.h"

#include <io.h>

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

// functions in this module...
LPTSTR LangIDtoString( WORD LangID );
WORD StringtoLangID( LPCTSTR str );
int ModeIndex( PTTSMODEINFO pTTSInfo );

// Globals...
TTSMODEINFO ttsSelect;                // the mode selected by the user
HCURSOR waitCur,saveCur;

PENGDATA gpEng=NULL;                 // global pointer to current engine data struct

int gnmodes=0;                        // the total number of enumerated modes
int gnListModes=0;                    // the total number of selected modes
TTSMODEINFO gaTTSInfo[MAX_ENUMMODES];

// language test table, taken from WINNT.h...
LPTSTR Languages[MAX_LANGUAGES]={
TEXT("NEUTRAL"),TEXT("BULGARIAN"),TEXT("CHINESE"),TEXT("CROATIAN"),TEXT("CZECH"),
TEXT("DANISH"),TEXT("DUTCH"),TEXT("ENGLISH"),TEXT("FINNISH"),
TEXT("FRENCH"),TEXT("GERMAN"),TEXT("GREEK"),TEXT("HUNGARIAN"),TEXT("ICELANDIC"),
TEXT("ITALIAN"),TEXT("JAPANESE"),TEXT("KOREAN"),TEXT("NORWEGIAN"),
TEXT("POLISH"),TEXT("PORTUGUESE"),TEXT("ROMANIAN"),TEXT("RUSSIAN"),TEXT("SLOVAK"),
TEXT("SLOVENIAN"),TEXT("SPANISH"),TEXT("SWEDISH"),TEXT("TURKISH")};

WORD LanguageID[MAX_LANGUAGES]={
LANG_NEUTRAL,LANG_BULGARIAN,LANG_CHINESE,LANG_CROATIAN,LANG_CZECH,LANG_DANISH,LANG_DUTCH,
LANG_ENGLISH,LANG_FINNISH,LANG_FRENCH,LANG_GERMAN,LANG_GREEK,LANG_HUNGARIAN,LANG_ICELANDIC,
LANG_ITALIAN,LANG_JAPANESE,LANG_KOREAN,LANG_NORWEGIAN,LANG_POLISH,LANG_PORTUGUESE,
LANG_ROMANIAN,LANG_RUSSIAN,LANG_SLOVAK,LANG_SLOVENIAN,LANG_SPANISH,LANG_SWEDISH,LANG_TURKISH};

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

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//{{AFX_MSG(CAboutDlg)
	virtual BOOL OnInitDialog();
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
// CAboutDlg message handlers

BOOL CAboutDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	CenterWindow();
	
	// TODO: Add extra about dlg initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

/////////////////////////////////////////////////////////////////////////////
// CTTStstDlg dialog

CTTStstDlg::CTTStstDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CTTStstDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTTStstDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CTTStstDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTTStstDlg)
	DDX_Control(pDX, IDC_LISTENUMMODES, m_EnumList);
	DDX_Control(pDX, IDC_EDITMAIN, m_MainOutedit);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CTTStstDlg, CDialog)
	//{{AFX_MSG_MAP(CTTStstDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_CREATE()
	ON_BN_CLICKED(IDC_MODEADD, OnModeadd)
	ON_BN_CLICKED(IDC_BUTTON_TEXTDATA_SHORTCUT, OnButtonTextdataShortcut)
	ON_WM_MOVE()
	ON_WM_CLOSE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTTStstDlg message handlers

BOOL CTTStstDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	CenterWindow();
	RECT r,r1;

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	CString strAboutMenu;
	strAboutMenu.LoadString(IDS_ABOUTBOX);
	if (!strAboutMenu.IsEmpty())
	{
		pSysMenu->AppendMenu(MF_SEPARATOR);
		pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
	}
	
	// TODO: Add extra initialization here

	// create engine data structure...
	gpEng = (PENGDATA)new EngData_t;
	memset( gpEng, 0, sizeof(EngData_t) );

	m_PropEng = (CPropertySheet *) new CPropertySheet(IDS_PROPCAPTION);
	m_PropEng->AddPage( &m_Cent    );
	m_PropEng->AddPage( &m_Attrib  );
	m_PropEng->AddPage( &m_Dialogs );
	m_PropEng->AddPage( &m_Notify  );
	m_PropEng->AddPage( &m_LexPronounce  );

	if( m_PropEng->Create( this, WS_SYSMENU|WS_POPUP|WS_VISIBLE, NULL ) == 0 )
		MainOutput(TEXT("\r\nError creating the Engine property sheet.\r\n"));

	m_PropEng->GetWindowRect( &r );

	r1.left = 20;
	r1.right= r1.left + (r.right - r.left);
	r1.top  = 114;
	r1.bottom = r1.top + (r.bottom-r.top)/* - 20*/;
	ClientToScreen(&r1);
	m_PropEng->MoveWindow( &r1, TRUE );

	// enumerate the modes and test enumeration interface...
	gnmodes = (int)EnumModes( gaTTSInfo, MAX_ENUMMODES );

	waitCur = LoadCursor( NULL, IDC_WAIT );

	// TODO: Add your control notification handler code here

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CTTStstDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CTTStstDlg::OnPaint() 
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
HCURSOR CTTStstDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

int CTTStstDlg::OnCreate(LPCREATESTRUCT lpCreateStruct) 
{
	if (CDialog::OnCreate(lpCreateStruct) == -1)
		return -1;

	// initialize object, return -1 if error...	
	if( !InitTTS() ) return -1;
	
	return 0;
}

void CTTStstDlg::OnModeadd() 
{
	CAddEngMode Dlg;
	
	Dlg.DoModal();
}

void CTTStstDlg::MainOutput(LPCTSTR str) 
{
	m_MainOutedit.ReplaceSel(str);
}

/////////////////////////////////////////////////////////////////////////////
// CAddEngMode dialog


CAddEngMode::CAddEngMode(CWnd* pParent /*=NULL*/)
	: CDialog(CAddEngMode::IDD, pParent)
{
	//{{AFX_DATA_INIT(CAddEngMode)
	//}}AFX_DATA_INIT
}


void CAddEngMode::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAddEngMode)
	DDX_Control(pDX, IDC_DEVICEID, m_DeviceID);
	DDX_Control(pDX, IDC_ENUMOUTPUT7A, m_EnumOut7);
	DDX_Control(pDX, IDC_ENUMOUTPUT13A, m_EnumOut13);
	DDX_Control(pDX, IDC_ENUMOUTPUT12A, m_EnumOut12);
	DDX_Control(pDX, IDC_ENUMOUTPUT11A, m_EnumOut11);
	DDX_Control(pDX, IDC_ENUMOUTPUT10A, m_EnumOut10);
	DDX_Control(pDX, IDC_ENUMOUTPUT9A, m_EnumOut9);
	DDX_Control(pDX, IDC_ENUMOUTPUT8A, m_EnumOut8);
	DDX_Control(pDX, IDC_ENUMOUTPUT6A, m_EnumOut6);
	DDX_Control(pDX, IDC_ENUMOUTPUT3A, m_EnumOut3);
	DDX_Control(pDX, IDC_ENUMOUTPUT1A, m_EnumOut1);
	DDX_Control(pDX, IDC_ENUMOUTPUT5A, m_EnumOut5);
	DDX_Control(pDX, IDC_ENUMOUTPUT4A, m_EnumOut4);
	DDX_Control(pDX, IDC_ENUMOUTPUT2A, m_EnumOut2);
	DDX_Control(pDX, IDC_LISTENUMMODES1, m_EnumList);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CAddEngMode, CDialog)
	//{{AFX_MSG_MAP(CAddEngMode)
	ON_BN_CLICKED(IDC_FINDCRITERIA, OnFindcriteria)
	ON_LBN_DBLCLK(IDC_LISTENUMMODES1, OnDblclkListenummodes1)
	ON_LBN_SELCHANGE(IDC_LISTENUMMODES1, OnSelchangeListenummodes1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CAddEngMode message handlers

BOOL CAddEngMode::OnInitDialog() 
{
	LOCALLOC(str, 80);
	TCHAR buf[255];
	int i;

	CDialog::OnInitDialog();
	
	if (gnmodes > 0)
	{
		// store the enumerated modes in the list box...
		for( i=0; i<gnmodes; i++ )
		{
			LOCS2ACVT(str, gaTTSInfo[i].szModeName);
			m_EnumList.InsertString( i, str );
		}

		// select the first mode and display it...
		m_EnumList.SetCurSel( 0 );
		OnSelchangeListenummodes1();
	}
	else
	{
		m_EnumList.InsertString( 0, TEXT("No Engine Modes Available.") );
	}

	LOCFREE(str);

	// enumerate amd list the available device IDs...
	m_DeviceID.ResetContent();
	m_DeviceID.AddString(TEXT("WAVE_MAPPER"));
	for( i=0; i<(int)waveInGetNumDevs(); i++ )
	{
		wsprintf( buf, TEXT("%d"), i );
		m_DeviceID.AddString( buf );
	}
	m_DeviceID.SetCurSel( 0 );	// default to the wave_mapper

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CAddEngMode::OnFindcriteria() 
{
	CDlgFindMode Dlg;
	LOCALLOC(str, 80);
	int index=-1;	// -1 means no mode matches
	static TTSMODEINFO ttsInfo;
	static int firsttime=1;

	if( firsttime )
	{
		memset( &ttsInfo, 0, sizeof(ttsInfo) );
		ttsInfo.language.LanguageID = LANG_ENGLISH;
		firsttime = 0;
	}

	// init the dialog strings...
	Dlg.m_Lang = LangIDtoString( ttsInfo.language.LanguageID );
	LOCS2ACVT(str, ttsInfo.szMfgName);
	Dlg.m_Mfg = str;
	LOCS2ACVT(str, ttsInfo.szModeName);
	Dlg.m_Modename = str;

	Dlg.DoModal();

	// now convert the dialog strings to speech format...
	ttsInfo.language.LanguageID = StringtoLangID( (LPCTSTR)Dlg.m_Lang );
	A2SCVTEX(ttsInfo.szMfgName, Dlg.m_Mfg, TTSI_NAMELEN)
	A2SCVTEX(ttsInfo.szModeName, Dlg.m_Modename, TTSI_NAMELEN)

	FindMode( &ttsInfo, &ttsSelect );

	// get the index of the mode it found...
	index = ModeIndex( &ttsSelect );

	m_EnumList.SetCurSel( index );

	OnSelchangeListenummodes1();

	LOCFREE(str)
}

void CAddEngMode::OnSelchangeListenummodes1() 
{
	if (gnmodes == 0)
		return;

#define LENENGSTR 128
	TCHAR appStr[LENENGSTR];

	ttsSelect = gaTTSInfo[ m_EnumList.GetCurSel() ];

	S2ACVTEX(appStr, ttsSelect.szModeName, LENENGSTR);
	m_EnumOut1.SetWindowText( appStr );

	S2ACVTEX(appStr, ttsSelect.szMfgName, LENENGSTR);
	m_EnumOut2.SetWindowText( appStr );

	_stprintf( appStr, TEXT("%s"), LangIDtoString( ttsSelect.language.LanguageID ) );
	m_EnumOut3.SetWindowText( appStr );

	S2ACVTEX(appStr, ttsSelect.szProductName, LENENGSTR);
	m_EnumOut4.SetWindowText( appStr );

	OLECHAR oleStr[80];
	// Display Mode GUID
	StringFromGUID2(ttsSelect.gModeID, oleStr, sizeof(oleStr));
#if defined(_S_UNICODE)
	// do it the easy way, OLECHAR same width as API chars...
	S2ACVTEX(appStr, oleStr, LENENGSTR);
	m_EnumOut5.SetWindowText( appStr );
#else
	// we don't have macros for OLECHAR (always WCHAR) to app width
#if (defined(_UNICODE) || defined(UNICODE))
	// Unicode app is easy
	m_EnumOut5.SetWindowText(oleStr);
#else
	// ANSI app needs conversion, TCHAR = CHAR
	WideCharToMultiByte(CP_ACP, 0, (WCHAR*) &oleStr, -1, (CHAR*) &appStr, LENENGSTR, NULL, NULL);
	m_EnumOut5.SetWindowText( appStr );
#endif // (defined(_UNICODE) || defined(UNICODE))
#endif // defined(_S_UNICODE)

	// Display Engine GUID
	StringFromGUID2(ttsSelect.gEngineID, oleStr, sizeof(oleStr));
#if defined(_S_UNICODE)
	S2ACVTEX(appStr, oleStr, LENENGSTR);
	m_EnumOut6.SetWindowText( appStr );
#else
	// we don't have macros for OLECHAR (always WCHAR) to app width
#if (defined(_UNICODE) || defined(UNICODE))
	// Unicode app is easy
	m_EnumOut6.SetWindowText(oleStr);
#else
	// ANSI app needs conversion, TCHAR = CHAR
	WideCharToMultiByte(CP_ACP, 0, (WCHAR*) &oleStr, -1, (CHAR*) &appStr, LENENGSTR, NULL, NULL);
	m_EnumOut6.SetWindowText( appStr );
#endif // (defined(_UNICODE) || defined(UNICODE))
#endif // defined(_S_UNICODE)

	S2ACVTEX(appStr, ttsSelect.szSpeaker, LENENGSTR);
	m_EnumOut7.SetWindowText( appStr );

	S2ACVTEX(appStr, ttsSelect.szStyle, LENENGSTR);
	m_EnumOut8.SetWindowText( appStr );

	switch(ttsSelect.wGender)
	{
		case GENDER_FEMALE:
			_stprintf(appStr, TEXT("%s"), TEXT("GENDER_FEMALE"));
			break;
		case GENDER_MALE:
			_stprintf(appStr, TEXT("%s"), TEXT("GENDER_MALE"));
			break;
		case GENDER_NEUTRAL:
			_stprintf(appStr, TEXT("%s"), TEXT("GENDER_NEUTRAL"));
			break;
		default:
			_stprintf(appStr, TEXT("%s"), TEXT("Error!"));
	}
	m_EnumOut9.SetWindowText( appStr );

	switch(ttsSelect.wAge)
	{
		case TTSAGE_BABY:
			_stprintf(appStr, TEXT("%s"), TEXT("TTSAGE_BABY"));
			break;
		case TTSAGE_TODDLER:
			_stprintf(appStr, TEXT("%s"), TEXT("TTSAGE_TODDLER"));
			break;
		case TTSAGE_CHILD:
			_stprintf(appStr, TEXT("%s"), TEXT("TTSAGE_CHILD"));
			break;
		case TTSAGE_ADOLESCENT:
			_stprintf(appStr, TEXT("%s"), TEXT("TTSAGE_ADOLESCENT"));
			break;
		case TTSAGE_ADULT:
			_stprintf(appStr, TEXT("%s"), TEXT("TTSAGE_ADULT"));
			break;
		case TTSAGE_ELDERLY:
			_stprintf(appStr, TEXT("%s"), TEXT("TTSAGE_ELDERLY"));
			break;
		default:
			_stprintf(appStr, TEXT("%s"), TEXT("Error!"));
	}
	m_EnumOut10.SetWindowText(appStr);

	_stprintf( appStr, TEXT("%0lx (flag)"), (DWORD) ttsSelect.dwFeatures );
	m_EnumOut11.SetWindowText( appStr );

	_stprintf( appStr, TEXT("%0lx (flag)"), (DWORD) ttsSelect.dwInterfaces );
	m_EnumOut12.SetWindowText( appStr );

	_stprintf( appStr, TEXT("%0lx (flag)"), (DWORD) ttsSelect.dwEngineFeatures );
	m_EnumOut13.SetWindowText( appStr );
}

void CAddEngMode::OnDblclkListenummodes1() 
{
	OnOK();
}

void CAddEngMode::OnOK() 
{
	TCHAR str[80];

	CursorWait;

	// select the mode...
	if( SelectMode( &ttsSelect ) )
	{
/* BUGBUG - This object should be created here (for multiple mode support) 
            but for now I'm doing it
            in OnInitdialog of the main dialog just for testing...
		// initialize the engine data properties...
		gpEng = (PENGDATA)new EngData_t;
		memset( gpEng, 0, sizeof(EngData_t) );
		gpEng->Not.AttrChange = TRUE;
		gpEng->Not.Interfere  = TRUE;
		gpEng->Not.Sound      = TRUE;
		gpEng->Not.Utter      = TRUE;
		gpEng->Not.VMeter     = TRUE;
*/		
		// add the mode to the mode selection list box on the main dialog...
		S2ACVTEX(str, ttsSelect.szModeName, APPMAXSTRLEN(str) + 1)
		((CTTStstDlg *)AfxGetMainWnd())->m_EnumList.InsertString( gnListModes++, str );

	}

	CursorGo;

	CDialog::OnOK();
}

/************************************************************************************
 Helper functions
************************************************************************************/

LPTSTR LangIDtoString( WORD LangID )
{
	int i;
	for( i=0; i<MAX_LANGUAGES; i++ )
		if( (LangID & 0xFF) == LanguageID[i] ) return Languages[i];

	return NULL;
}

WORD StringtoLangID( LPCTSTR str )
{
	int i;
	for( i=0; i<MAX_LANGUAGES; i++ )
		if( _tcsicmp(str,Languages[i]) == 0 ) return LanguageID[i];

	return NULL;
}

/* Return the index of the given mode */
int ModeIndex( PTTSMODEINFO pTTSInfo )
{
	int i;
	for( i=0; i<MAX_ENUMMODES; i++ )
		if( memcmp( &pTTSInfo->gModeID, &gaTTSInfo[i].gModeID, sizeof(GUID) ) == 0 ) return i;

	return -1;
}


void CTTStstDlg::OnOK() 
{
	// delete the mode...
	if( gpEng )
	{
		// kill the position tracking timer if it's on...
		if( gpEng->bPosTracking ) KillTimer( ID_TIMERPOSTRACK );

		delete gpEng;
	}

	// delete the property sheets...
	if( m_PropEng  )
	{
		m_PropEng->DestroyWindow();
		delete m_PropEng;
	}

	TerminateTTS();

	CDialog::OnOK();
}

void CTTStstDlg::OnButtonTextdataShortcut() 
{
	m_Cent.DoTextData();	
}

void CTTStstDlg::OnMove(int x, int y) 
{
	CDialog::OnMove(x, y);
	
	if(m_PropEng) // if OnInitDialog has been called
	{
		RECT r, r1;
		m_PropEng->GetWindowRect( &r );

		r1.left = 20;
		r1.right= r1.left + (r.right - r.left);
		r1.top  = 114;
		r1.bottom = r1.top + (r.bottom-r.top);
		ClientToScreen(&r1);
		m_PropEng->MoveWindow( &r1, TRUE );
	}
}

void CTTStstDlg::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	
	// delete the mode...
	if( gpEng )
	{
		// kill the position tracking timer if it's on...
		if( gpEng->bPosTracking ) KillTimer( ID_TIMERPOSTRACK );

		delete gpEng;
	}

	// delete the property sheets...
	if( m_PropEng  )
	{
		m_PropEng->DestroyWindow();
		delete m_PropEng;
	}

	TerminateTTS();

	CDialog::OnClose();
}
