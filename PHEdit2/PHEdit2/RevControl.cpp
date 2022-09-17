// RevControl.cpp : implementation file
//

#include "stdafx.h"
#include "PHEdit2.h"
#include "RevControl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// RevControl dialog


RevControl::RevControl(CWnd* pParent /*=NULL*/)
	: CDialog(RevControl::IDD, pParent)
{
	//{{AFX_DATA_INIT(RevControl)
	m_reason = _T("");
	m_bats = 0;
	//}}AFX_DATA_INIT
}


void RevControl::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(RevControl)
	DDX_Text(pDX, IDC_REASON, m_reason);
	DDX_Text(pDX, IDC_BATS, m_bats);
	DDV_MinMaxUInt(pDX, m_bats, 0, 9999);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(RevControl, CDialog)
	//{{AFX_MSG_MAP(RevControl)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// RevControl message handlers
