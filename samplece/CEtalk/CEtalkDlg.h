// CEtalkDlg.h : header file
//

#if !defined(AFX_CETALKDLG_H__21426A6E_8B95_11D1_AAB0_0060083E4DF1__INCLUDED_)
#define AFX_CETALKDLG_H__21426A6E_8B95_11D1_AAB0_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

/////////////////////////////////////////////////////////////////////////////
// CCEtalkDlg dialog

class CCEtalkDlg : public CDialog
{
// Construction
public:
	CCEtalkDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CCEtalkDlg)
#ifdef _WIN32_WCE_PSPC
	enum { IDD = IDD_CETALK_DIALOG_PALM };
#else
	enum { IDD = IDD_CETALK_DIALOG };
#endif
	CEdit	m_textBox;
	CString	m_text;
	BOOL	m_clear;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCEtalkDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CCEtalkDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPlay();
	afx_msg void OnEmailButton();
	afx_msg void OnSchedulingButton();
	afx_msg void OnSalesButton();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CETALKDLG_H__21426A6E_8B95_11D1_AAB0_0060083E4DF1__INCLUDED_)
