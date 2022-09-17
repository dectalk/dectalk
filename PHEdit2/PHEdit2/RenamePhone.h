#if !defined(AFX_RENAMEPHONE_H__FF6EB13F_6D39_11D8_BF6E_0060083E8376__INCLUDED_)
#define AFX_RENAMEPHONE_H__FF6EB13F_6D39_11D8_BF6E_0060083E8376__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// RenamePhone.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// RenamePhone dialog

class RenamePhone : public CDialog
{
// Construction
public:
	RenamePhone(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(RenamePhone)
	enum { IDD = IDD_RENAME_PHONEME_DIALOG };
	CString	m_newname;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(RenamePhone)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(RenamePhone)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RENAMEPHONE_H__FF6EB13F_6D39_11D8_BF6E_0060083E8376__INCLUDED_)
