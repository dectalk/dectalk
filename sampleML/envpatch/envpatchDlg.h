// envpatchDlg.h : header file
//

#if !defined(AFX_ENVPATCHDLG_H__F2CF7DCD_04FE_11D1_8F4C_0000F803E8A4__INCLUDED_)
#define AFX_ENVPATCHDLG_H__F2CF7DCD_04FE_11D1_8F4C_0000F803E8A4__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

/////////////////////////////////////////////////////////////////////////////
// CEnvpatchDlg dialog

class CEnvpatchDlg : public CDialog
{
// Construction
public:
	CEnvpatchDlg(CWnd* pParent = NULL);			// standard constructor
	BOOL GetDefaultLang();
	BOOL GetLangEntry(unsigned long int, LPSTR, unsigned long int, LPSTR, unsigned long int);
	BOOL GetLangs(void);
	BOOL SetDefaultLang();
	void UpdateLangBox(void);
	unsigned int GetMaxKeys(void);
	unsigned int max_key;
	unsigned int key_index;

// Dialog Data
	//{{AFX_DATA(CEnvpatchDlg)
	enum { IDD = IDD_ENVPATCH_DIALOG };
	CListBox	m_langchoice_initals;
	CListBox	m_langchoice;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CEnvpatchDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON		m_hIcon;
	char		lang_choice[256];				// User's choice
	char		default_lang[256];				// System setting

	// Generated message map functions
	//{{AFX_MSG(CEnvpatchDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnDblclkLanglist();
	afx_msg void OnUpdate();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ENVPATCHDLG_H__F2CF7DCD_04FE_11D1_8F4C_0000F803E8A4__INCLUDED_)
