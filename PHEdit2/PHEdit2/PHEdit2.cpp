// PHEdit2.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "PHEdit2.h"

#include "MainFrm.h"
#include "ChildFrm.h"
#include "PHEdit2Doc.h"
#include "PHEdit2View.h"
#include "Splash.h"
#include "MainForm.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2App

BEGIN_MESSAGE_MAP(CPHEdit2App, CWinApp)
	//{{AFX_MSG_MAP(CPHEdit2App)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
	//}}AFX_MSG_MAP
	// Standard file based document commands
	ON_COMMAND(ID_FILE_NEW, CWinApp::OnFileNew)
	ON_COMMAND(ID_FILE_OPEN, CWinApp::OnFileOpen)
	// Standard print setup command
	ON_COMMAND(ID_FILE_PRINT_SETUP, CWinApp::OnFilePrintSetup)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2App construction

CPHEdit2App::CPHEdit2App()
{
	plugins.LoadPlugins();
	DataPlugins.LoadPlugins();
}

CPHEdit2App::~CPHEdit2App()
{
	plugins.ClosePlugins();
	DataPlugins.ClosePlugins();
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CPHEdit2App object

CPHEdit2App theApp;

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2App initialization

BOOL CPHEdit2App::InitInstance()
{
	// CG: The following block was added by the Splash Screen component.
	{
		CCommandLineInfo cmdInfo;
		ParseCommandLine(cmdInfo);
		CSplashWnd::EnableSplashScreen(cmdInfo.m_bShowSplash);
	}
	AfxEnableControlContainer();

	// Standard initialization

#ifdef _AFXDLL
	Enable3dControls();			// Call this when using MFC in a shared DLL
#else
	Enable3dControlsStatic();	// Call this when linking to MFC statically
#endif

	// Change the registry key under which our settings are stored.
	SetRegistryKey(_T("Local AppWizard-Generated Applications"));

	LoadStdProfileSettings();  // Load standard INI file options (including MRU)

	// Register document templates

	CMultiDocTemplate* pDocTemplate;
	pDocTemplate = new CMultiDocTemplate(
		IDR_PHEDITTYPE,
		RUNTIME_CLASS(CPHEdit2Doc),
		RUNTIME_CLASS(CChildFrame), // custom MDI child frame
		RUNTIME_CLASS(MainForm));
	AddDocTemplate(pDocTemplate);

	// create main MDI Frame window
	CMainFrame* pMainFrame = new CMainFrame;
	if (!pMainFrame->LoadFrame(IDR_MAINFRAME))
		return FALSE;
	m_pMainWnd = pMainFrame;

	// Parse command line for standard shell commands, DDE, file open
	CCommandLineInfo cmdInfo;
	ParseCommandLine(cmdInfo);

	// Dispatch commands specified on the command line
	if (!ProcessShellCommand(cmdInfo))
		return FALSE;
	pMainFrame->ShowWindow(m_nCmdShow);
	pMainFrame->UpdateWindow();

	// CG: The following block was inserted by the 'Document Registration' component.
	{
		// Enable DDE Execute open
		EnableShellOpen();
		RegisterShellFileTypes(TRUE);

		m_pMainWnd->DragAcceptFiles();
	}
	return TRUE;
}

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
		// No message handlers
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

// App command to run the dialog
void CPHEdit2App::OnAppAbout()
{
	CAboutDlg aboutDlg;
	aboutDlg.DoModal();
}

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2App commands

BOOL CPHEdit2App::PreTranslateMessage(MSG* pMsg)
{
	// CG: The following lines were added by the Splash Screen component.
	if (CSplashWnd::PreTranslateAppMessage(pMsg))
		return TRUE;

	return CWinApp::PreTranslateMessage(pMsg);
}

BOOL CPHEdit2App::OnIdle(LONG lCount)
{
	// CG: The following code inserted by 'Idle Time Processing' component.

	// Note: Do not perform lengthy tasks during OnIdle because your
	// application cannot process user input until OnIdle returns.

	// call the base class
	BOOL bBaseIdle = CWinApp::OnIdle(lCount);

	BOOL bMoreIdle = TRUE;
	if (lCount == 0)
	{
		// TODO: add code to perform important idle time processing
	}
	else if (lCount == 100)
	{
		// TODO: add code to perform less important tasks during idle
	}
	else if (lCount == 1000)
	{
		bMoreIdle = bBaseIdle;
	}

	// return FALSE when there is no more idle processing to do
	return bMoreIdle;
}
