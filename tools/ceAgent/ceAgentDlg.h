// ceAgentDlg.h : header file
// Comments
/* 001 CAB	12\07\00	Remove multi lang button
*/

#if !defined(AFX_CEAGENTDLG_H__8B88F0AF_3260_11D4_9A18_0060081EA1C6__INCLUDED_)
#define AFX_CEAGENTDLG_H__8B88F0AF_3260_11D4_9A18_0060081EA1C6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CCeAgentDlg dialog

class CCeAgentDlg : public CDialog
{
// Construction
public:
	CCeAgentDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CCeAgentDlg)
	enum { IDD = IDD_CEAGENT_DIALOG };
	CProgressCtrl	m_progress_bar;
	CButton	m_edit_registry_button;
	CButton	m_delete_lang_button;
	CButton	m_sp_lang_button;
	//CButton	m_ml_lang_button;
	CButton	m_la_lang_button;
	CButton	m_gr_lang_button;
	CButton	m_uk_lang_button;
	CButton	m_registry_button;
	CButton	m_us_lang_button;
	CButton	m_fr_lang_button;
	//CButton	m_us_default_button;
	//CButton	m_uk_default_button;
	//CButton	m_gr_default_button;
	//CButton	m_sp_default_button;
	//CButton	m_la_default_button;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCeAgentDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CCeAgentDlg)
	virtual BOOL OnInitDialog();
	bool Copy_License(HKEY hkey, DWORD dwType, int count);	// Copy License to registry
		              
	bool Create_Lang_Key(HKEY hkeyLocalMachine, HKEY hkeyCurrentUser, DWORD dwType, 	// Create lang subkeys
		                 wchar_t *language, wchar_t *mainDict,
						 wchar_t *lang, int count, bool &us, bool &uk, bool &gr, bool &sp, bool &la, bool &fr, bool &ml);
	bool Delete_Key(HKEY hkeyLocalMachine, HKEY hkeyCurrentUser, wchar_t *lang, // Delete lang key
		            DWORD dwType, int count, bool &us,
					bool &uk, bool &gr, bool &sp, bool &la, bool &fr, bool &ml, wchar_t * defaultLang );										
	bool Check_Registry(HKEY hkeyLocalMachine, bool &us, bool &uk, bool &gr, bool &sp, bool &la, bool &fr, bool &ml, wchar_t *defaultLang);		// Determine what languages the registry has
	void GetStatus(int count);	// Display progress bar
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnDestroy();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnEnglishDll_BN_Clicked();
	afx_msg void OnRegistry_BN_CLICKED();
	afx_msg void OnEditRegistry_BN_CLICKED();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CEAGENTDLG_H__8B88F0AF_3260_11D4_9A18_0060081EA1C6__INCLUDED_)
