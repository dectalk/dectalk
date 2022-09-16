// skipdemo.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "skipdemo.h"
#include "skipdemoDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSkipdemoApp

BEGIN_MESSAGE_MAP(CSkipdemoApp, CWinApp)
	//{{AFX_MSG_MAP(CSkipdemoApp)
	//}}AFX_MSG
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSkipdemoApp construction

CSkipdemoApp::CSkipdemoApp()
{
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CSkipdemoApp object

CSkipdemoApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CSkipdemoApp initialization

BOOL CSkipdemoApp::InitInstance()
{
	// Standard initialization

	CSkipdemoDlg dlg;
	m_pMainWnd = &dlg;
	int nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
	}
	else if (nResponse == IDCANCEL)
	{
	}

	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}
