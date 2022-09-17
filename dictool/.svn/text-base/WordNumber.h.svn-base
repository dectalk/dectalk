#if !defined(AFX_WORDNUMBER_H__A85A8C08_6046_11D5_BF08_0060083E8376__INCLUDED_)
#define AFX_WORDNUMBER_H__A85A8C08_6046_11D5_BF08_0060083E8376__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// WordNumber.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// WordNumber dialog

class WordNumber : public CDialog
{
// Construction
public:
	WordNumber(CWnd* pParent = NULL);   // standard constructor
	int returnednumber;
	CFont pEditFont;
	CFont pLabelFont;	


// Dialog Data
	//{{AFX_DATA(WordNumber)
	enum { IDD = IDD_WORDNUMBER };
	CString	m_EnterWordNumber;
	CString	m_Warning;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(WordNumber)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(WordNumber)
	virtual void OnOK();
	afx_msg void OnUpdateEnterWordNumber();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WORDNUMBER_H__A85A8C08_6046_11D5_BF08_0060083E8376__INCLUDED_)
