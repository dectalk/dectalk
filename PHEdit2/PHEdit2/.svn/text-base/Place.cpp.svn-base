// Place.cpp : implementation file
//

#include "stdafx.h"
#include "PHEdit2.h"
#include "Place.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// Place dialog


Place::Place(CWnd* pParent /*=NULL*/)
	: CDialog(Place::IDD, pParent)
{
	//{{AFX_DATA_INIT(Place)
	m_f2backf = FALSE;
	m_f2backi = FALSE;
	m_falvel = FALSE;
	m_fdental = FALSE;
	m_flabial = FALSE;
	m_fpalatl = FALSE;
	m_fvelar = FALSE;
	m_fglotal = FALSE;
	m_flabialdental = FALSE;
	m_fpharyngeal = FALSE;
	m_fpostalveolar = FALSE;
	m_fuvular = FALSE;
	m_fvelarb = FALSE;
	m_fvelarf = FALSE;
	m_fvelarr = FALSE;
	//}}AFX_DATA_INIT
}


void Place::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(Place)
	DDX_Check(pDX, IDC_F2BACKF, m_f2backf);
	DDX_Check(pDX, IDC_F2BACKI, m_f2backi);
	DDX_Check(pDX, IDC_FALVEL, m_falvel);
	DDX_Check(pDX, IDC_FDENTAL, m_fdental);
	DDX_Check(pDX, IDC_FLABIAL, m_flabial);
	DDX_Check(pDX, IDC_FPALATL, m_fpalatl);
	DDX_Check(pDX, IDC_FVELAR, m_fvelar);
	DDX_Check(pDX, IDC_FGLOTTAL, m_fglotal);
	DDX_Check(pDX, IDC_FLABIALDENTAL, m_flabialdental);
	DDX_Check(pDX, IDC_FPHARYNGEAL, m_fpharyngeal);
	DDX_Check(pDX, IDC_FPOSTALVEOLAR, m_fpostalveolar);
	DDX_Check(pDX, IDC_FUVULAR, m_fuvular);
	DDX_Check(pDX, IDC_FVELARB, m_fvelarb);
	DDX_Check(pDX, IDC_FVELARF, m_fvelarf);
	DDX_Check(pDX, IDC_FVELARR, m_fvelarr);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(Place, CDialog)
	//{{AFX_MSG_MAP(Place)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// Place message handlers
