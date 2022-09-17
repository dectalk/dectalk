// RenamePhone.cpp : implementation file
//

#include "stdafx.h"
#include "PHEdit2.h"
#include "RenamePhone.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// RenamePhone dialog


RenamePhone::RenamePhone(CWnd* pParent /*=NULL*/)
	: CDialog(RenamePhone::IDD, pParent)
{
	//{{AFX_DATA_INIT(RenamePhone)
	m_newname = _T("");
	//}}AFX_DATA_INIT
}


void RenamePhone::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(RenamePhone)
	DDX_Text(pDX, IDC_NEW_NAME, m_newname);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(RenamePhone, CDialog)
	//{{AFX_MSG_MAP(RenamePhone)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// RenamePhone message handlers
