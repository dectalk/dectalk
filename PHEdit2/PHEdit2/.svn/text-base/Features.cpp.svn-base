// Features.cpp : implementation file
//

#include "stdafx.h"
#include "PHEdit2.h"
#include "Features.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// Features dialog


Features::Features(CWnd* pParent /*=NULL*/)
	: CDialog(Features::IDD, pParent)
{
	//{{AFX_DATA_INIT(Features)
	m_fburst = FALSE;
	m_fconson = FALSE;
	m_fnasal = FALSE;
	m_fobst = FALSE;
	m_fplosv = FALSE;
	m_fson1 = FALSE;
	m_fson2 = FALSE;
	m_fsoncon = FALSE;
	m_fsonor = FALSE;
	m_fstmark = FALSE;
	m_fstop = FALSE;
	m_fsyll = FALSE;
	m_fvoicd = FALSE;
	m_fvowel = FALSE;
	m_fflap = FALSE;
	m_flateral = FALSE;
	m_fnfi1 = FALSE;
	m_fnfi2 = FALSE;
	m_fnfi3 = FALSE;
	m_fretroflex = FALSE;
	//}}AFX_DATA_INIT
}


void Features::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(Features)
	DDX_Check(pDX, IDC_FBURST, m_fburst);
	DDX_Check(pDX, IDC_FCONSON, m_fconson);
	DDX_Check(pDX, IDC_FNASAL, m_fnasal);
	DDX_Check(pDX, IDC_FOBST, m_fobst);
	DDX_Check(pDX, IDC_FPLOSV, m_fplosv);
	DDX_Check(pDX, IDC_FSON1, m_fson1);
	DDX_Check(pDX, IDC_FSON2, m_fson2);
	DDX_Check(pDX, IDC_FSONCON, m_fsoncon);
	DDX_Check(pDX, IDC_FSONOR, m_fsonor);
	DDX_Check(pDX, IDC_FSTMARK, m_fstmark);
	DDX_Check(pDX, IDC_FSTOP, m_fstop);
	DDX_Check(pDX, IDC_FSYLL, m_fsyll);
	DDX_Check(pDX, IDC_FVOICD, m_fvoicd);
	DDX_Check(pDX, IDC_FVOWEL, m_fvowel);
	DDX_Check(pDX, IDC_FFLAP, m_fflap);
	DDX_Check(pDX, IDC_FLATERAL, m_flateral);
	DDX_Check(pDX, IDC_FNFI1, m_fnfi1);
	DDX_Check(pDX, IDC_FNFI2, m_fnfi2);
	DDX_Check(pDX, IDC_FNFI3, m_fnfi3);
	DDX_Check(pDX, IDC_FRETROFLEX, m_fretroflex);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(Features, CDialog)
	//{{AFX_MSG_MAP(Features)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// Features message handlers
