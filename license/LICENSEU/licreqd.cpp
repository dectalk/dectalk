// LicReqd.cpp : implementation file
//

#include "stdafx.h"
#include "LicenseU.h"
#include "LicReqd.h"
#include "license.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLicReqd dialog


CLicReqd::CLicReqd(CWnd* pParent /*=NULL*/)
	: CDialog(CLicReqd::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLicReqd)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CLicReqd::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLicReqd)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CLicReqd, CDialog)
	//{{AFX_MSG_MAP(CLicReqd)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLicReqd message handlers

void CLicReqd::OnOK() 
{
	// TODO: Add extra validation here
    UCHAR szLicensesReqd[64];
    int nLen;

    nLen = GetDlgItemText(IDC_LICENSES_REQD,(char *)szLicensesReqd,MAX_DLG_STR);
    szLicensesReqd[nLen]='\0';
    encryptString((const unsigned char *)szLicensesReqd,LICENSE_KEY,(unsigned char *)szOutString);

    UpdateLicenseInfo((const unsigned char *)szOutString);
	
	CDialog::OnOK();
}

void CLicReqd::OnCancel() 
{
	// TODO: Add extra cleanup here
	
	CDialog::OnCancel();
}
