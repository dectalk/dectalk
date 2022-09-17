// regceupdateDlg.h : header file
//

#if !defined(AFX_REGCEUPDATEDLG_H__1BC83B03_C22F_11D5_B988_0060083D5417__INCLUDED_)
#define AFX_REGCEUPDATEDLG_H__1BC83B03_C22F_11D5_B988_0060083D5417__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

/////////////////////////////////////////////////////////////////////////////
// CRegceupdateDlg dialog

class CRegceupdateDlg : public CDialog
{
// Construction
public:
	CRegceupdateDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CRegceupdateDlg)
	enum { IDD = IDD_REGCEUPDATE_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRegceupdateDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CRegceupdateDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnUpdate();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft eMbedded Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_REGCEUPDATEDLG_H__1BC83B03_C22F_11D5_B988_0060083D5417__INCLUDED_)
