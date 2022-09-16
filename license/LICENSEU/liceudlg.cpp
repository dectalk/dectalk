/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995-98. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 */
// LicenseUDlg.cpp : implementation file
// tek 21oct96 fixed decryption error checks
// cjl 11mar98 Add VALIDATION_BYPASS for new release value generation
//

#include "stdafx.h"
#include "LicenseU.h"
#include "LiceUDlg.h"
#include "LicReqd.h"
#include "LicChPwd.h"
#include "license.h"
#include <stdio.h>
#include "dectalkf.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

CHAR szOutString[134];

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
// CLicenseUDlg dialog

CLicenseUDlg::CLicenseUDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CLicenseUDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLicenseUDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CLicenseUDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLicenseUDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CLicenseUDlg, CDialog)
	//{{AFX_MSG_MAP(CLicenseUDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_CHPASSWORD, OnChpassword)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLicenseUDlg message handlers

BOOL CLicenseUDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

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

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	SetDlgItemText(IDC_USERNAME,(LPCTSTR)"DECtalk");
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CLicenseUDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CLicenseUDlg::OnPaint() 
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
HCURSOR CLicenseUDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CLicenseUDlg::OnCancel() 
{
	// TODO: Add extra cleanup here
	
	CDialog::OnCancel();
}

void CLicenseUDlg::OnOK() 
{
	// TODO: Add extra validation here
    UCHAR szPassword[64],
          szStoredPassword[134];
    int nPasswordLen,nResult;

	nResult = GetLicensePassword((unsigned char *)szStoredPassword);
    if(nResult == LICENSE_KEY_REG_OPEN_ERROR)
	{
        AfxMessageBox("Unable to access Registry entry for License Password",MB_OK);
	return;
	}
	else if(nResult == LICENSE_KEY_REG_QUERY_ERROR)
	{
        AfxMessageBox("Unable to retrieve the License Password from Registry",MB_OK);
	return;
	}

    nResult = decryptString((const unsigned char *)szStoredPassword,LICENSE_KEY,(unsigned char *)szOutString);
#ifndef VALIDATION_BYPASS
    if (!nResult)
	{
        AfxMessageBox("Invalid Registry entry for License Password",MB_OK);
	return;
	}
#endif //VALIDATION_BYPASS

    nPasswordLen = GetDlgItemText(IDC_PASSWORD,(char *)szPassword,MAX_DLG_STR);
    szPassword[nPasswordLen] = '\0';
#ifndef VALIDATION_BYPASS
    if(strcmp((const char *)szPassword,szOutString)==0)
#endif //VALIDATION_BYPASS
    {
         CLicReqd  LicReq;
         LicReq.DoModal();
         
         CDialog::OnOK();
    }
#ifndef VALIDATION_BYPASS
	else
    {
        AfxMessageBox("Invalid Password",MB_ICONINFORMATION);
        GotoDlgCtrl(GetDlgItem(IDC_PASSWORD));
    }
#endif //VALIDATION_BYPASS
}

void CLicenseUDlg::OnChpassword() 
{
	// TODO: Add your control notification handler code here
	CLicChPwd LicChPwd;

    LicChPwd.DoModal();
}
