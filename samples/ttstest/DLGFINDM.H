/******************************************************************************\
*       dlgfindm.h
*
*       Header file for CDlgFindMode
*
*       This code and information is provided "as is" without warranty
*       of any kind, either expressed or implied, including but not
*       limited to the implied warranties of merchantability and/or
*       fitness for a particular purpose.
*
*       Copyright (C) 1995 Microsoft Corporation.  All Rights Reserved.
*
\******************************************************************************/


/////////////////////////////////////////////////////////////////////////////
// CDlgFindMode dialog

class CDlgFindMode : public CDialog
{
// Construction
public:
	CDlgFindMode(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgFindMode)
	enum { IDD = IDD_DLGFINDMODE };
	CString	m_Mfg;
	CString	m_Modename;
	CString	m_Lang;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgFindMode)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgFindMode)
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
