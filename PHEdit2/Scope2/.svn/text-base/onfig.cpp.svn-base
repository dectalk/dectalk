// onfig.cpp : implementation file
//

#include "stdafx.h"
#include "Scope.h"
#include "onfig.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CConfig dialog


CConfig::CConfig(CWnd* pParent /*=NULL*/)
	: CDialog(CConfig::IDD, pParent)
{
	//{{AFX_DATA_INIT(CConfig)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CConfig::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CConfig)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CConfig, CDialog)
	//{{AFX_MSG_MAP(CConfig)
	ON_BN_CLICKED(IDC_DOTS, OnDots)
	ON_BN_CLICKED(IDC_LINES, OnLines)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CConfig message handlers

void CConfig::OnDots() 
{
	CheckRadioButton(IDC_LINES, IDC_DOTS, IDC_DOTS);
	return;
}

void CConfig::OnLines() 
{
	CheckRadioButton(IDC_LINES, IDC_DOTS, IDC_LINES);
}

BOOL CConfig::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	if (bIsDots)	OnDots();
	else			OnLines();

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CConfig::OnOK() 
{
	// TODO: Add extra validation here
	if (GetCheckedRadioButton(IDC_LINES, IDC_DOTS) == IDC_LINES)	bIsDots = FALSE;
	else															bIsDots = TRUE;
	CDialog::OnOK();
}
