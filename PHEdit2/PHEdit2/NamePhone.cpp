// NamePhone.cpp : implementation file
//

#include "stdafx.h"
#include "PHEdit2.h"
#include "NamePhone.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// NamePhone dialog


NamePhone::NamePhone(CWnd* pParent /*=NULL*/)
	: CDialog(NamePhone::IDD, pParent)
{
	//{{AFX_DATA_INIT(NamePhone)
	m_name = _T("");
	//}}AFX_DATA_INIT
}


void NamePhone::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(NamePhone)
	DDX_Text(pDX, IDC_PHONE, m_name);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(NamePhone, CDialog)
	//{{AFX_MSG_MAP(NamePhone)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// NamePhone message handlers
