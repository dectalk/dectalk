/******************************************************************************\
*       dlgfindm.cpp
*
*       Implements functionality of the CDialog derived CDlgFindMode dialog.
*
*       This code and information is provided "as is" without warranty
*       of any kind, either expressed or implied, including but not
*       limited to the implied warranties of merchantability and/or
*       fitness for a particular purpose.
*
*       Copyright (C) 1995 Microsoft Corporation.  All Rights Reserved.
*
\******************************************************************************/

#include "stdafx.h"

#include <speech.h>

#include "resource.h"
#include "dlgfindm.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif


/////////////////////////////////////////////////////////////////////////////
// CDlgFindMode dialog


CDlgFindMode::CDlgFindMode(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgFindMode::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgFindMode)
	m_Mfg = TEXT("");
	m_Modename = TEXT("");
	m_Lang = TEXT("");
	//}}AFX_DATA_INIT
}


void CDlgFindMode::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgFindMode)
	DDX_Text(pDX, IDC_EDITMFG, m_Mfg);
	DDX_Text(pDX, IDC_EDITMODENAME, m_Modename);
	DDX_Text(pDX, IDC_EDITLANG, m_Lang);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgFindMode, CDialog)
	//{{AFX_MSG_MAP(CDlgFindMode)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CDlgFindMode message handlers

void CDlgFindMode::OnOK() 
{
	CDialog::OnOK();
}

