#if !defined(AFX_NAMEPHONE_H__A3319A91_6119_11D1_AA98_0060083E4DF1__INCLUDED_)
#define AFX_NAMEPHONE_H__A3319A91_6119_11D1_AA98_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// NamePhone.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// NamePhone dialog

class NamePhone : public CDialog
{
// Construction
public:
	NamePhone(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(NamePhone)
	enum { IDD = IDD_NAMEPHONE };
	CString	m_name;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(NamePhone)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(NamePhone)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NAMEPHONE_H__A3319A91_6119_11D1_AA98_0060083E4DF1__INCLUDED_)
