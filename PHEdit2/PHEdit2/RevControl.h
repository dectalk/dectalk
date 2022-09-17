#if !defined(AFX_REVCONTROL_H__8DE56660_7593_11D1_AAA5_0060083E4DF1__INCLUDED_)
#define AFX_REVCONTROL_H__8DE56660_7593_11D1_AAA5_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// RevControl.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// RevControl dialog

class RevControl : public CDialog
{
// Construction
public:
	RevControl(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(RevControl)
	enum { IDD = IDD_REVCONTROL };
	CString	m_reason;
	UINT	m_bats;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(RevControl)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(RevControl)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_REVCONTROL_H__8DE56660_7593_11D1_AAA5_0060083E4DF1__INCLUDED_)
