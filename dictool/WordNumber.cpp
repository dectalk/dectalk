// WordNumber.cpp : implementation file
//

#include "stdafx.h"
#include "dictool.h"
#include "WordNumber.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// WordNumber dialog


WordNumber::WordNumber(CWnd* pParent /*=NULL*/)
	: CDialog(WordNumber::IDD, pParent)
{
	//{{AFX_DATA_INIT(WordNumber)
	m_EnterWordNumber = _T("");
	m_Warning = _T("");
	//}}AFX_DATA_INIT
}


void WordNumber::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(WordNumber)
	DDX_Text(pDX, IDC_ENTER_WORD_NUMBER, m_EnterWordNumber);
	DDX_Text(pDX, IDC_STATIC_WARNING, m_Warning);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(WordNumber, CDialog)
	//{{AFX_MSG_MAP(WordNumber)
	ON_EN_UPDATE(IDC_ENTER_WORD_NUMBER, OnUpdateEnterWordNumber)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// WordNumber message handlers

void WordNumber::OnOK() 
{
	char *a;
	int length;
	// TODO: Add extra validation here
	UpdateData(TRUE);
	length=m_EnterWordNumber.GetLength();
	a=m_EnterWordNumber.GetBuffer(length);
	returnednumber=atoi(a);
	m_EnterWordNumber.ReleaseBuffer();

	CDialog::OnOK();
}

void WordNumber::OnUpdateEnterWordNumber() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function to send the EM_SETEVENTMASK message to the control
	// with the ENM_UPDATE flag ORed into the lParam mask.
	
	// TODO: Add your control notification handler code here
	char *a;
	int length;
	int i;
	CWnd *pCur;
	// TODO: Add extra validation here
	UpdateData(TRUE);
	length=m_EnterWordNumber.GetLength();
	a=m_EnterWordNumber.GetBuffer(length);
	for (i=0;i<length;i++)
	{
		if (a[i]<'0' || a[i]>'9')
		{
			pCur=GetDlgItem(IDOK);
			pCur->EnableWindow(0);
			m_Warning="Enter numbers only.";
			UpdateData(FALSE);
			return;
		}
	}

	pCur=GetDlgItem(IDOK);
	pCur->EnableWindow(1);
	m_Warning="";
	UpdateData(FALSE);
	m_EnterWordNumber.ReleaseBuffer();

	
}

BOOL WordNumber::OnInitDialog() 
{
	CWnd *pCur;
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	pEditFont.CreateFont(18,0,0,0,FW_BOLD,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY ,TMPF_TRUETYPE |FF_MODERN ,"CourierNew");

	pLabelFont.CreateFont(14,0,0,0,FW_BOLD,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY ,TMPF_TRUETYPE |FF_SWISS,"MS Sans Serif");

	pCur=GetDlgItem(IDC_ENTER_WORD_NUMBER);
	pCur->SetFont(&pEditFont,FALSE);
	pCur->SetFocus();

	pCur=GetDlgItem(IDOK);
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem(IDCANCEL);
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem(IDC_STATIC_WARNING);
	pCur->SetFont(&pLabelFont,FALSE);

	
	return FALSE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
