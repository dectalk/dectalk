// MailreadDlg.h : header file
//

#if !defined(AFX_MAILREADDLG_H__9D945A5A_9874_11D3_B899_0060083D5417__INCLUDED_)
#define AFX_MAILREADDLG_H__9D945A5A_9874_11D3_B899_0060083D5417__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000w

/////////////////////////////////////////////////////////////////////////////
// CMailreadDlg dialog

class CMailreadDlg : public CDialog
{
// Construction
public:
	CMailreadDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CMailreadDlg)
	enum { IDD = IDD_MAILREAD_DIALOG };
	CEdit	m_mail_number_box;
	CString	m_mail_value;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMailreadDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
      
	// Generated message map functions
	//{{AFX_MSG(CMailreadDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnHelpInfo();
	afx_msg void OnPlayUnread();
	afx_msg void OnPlayMail(BOOL);
	afx_msg void OnRepeatMail();
	afx_msg void OnAsync();
	afx_msg void OnPop3();
	afx_msg void OnExit();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MAILREADDLG_H__9D945A5A_9874_11D3_B899_0060083D5417__INCLUDED_)
