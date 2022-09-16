/******************************************************************************\
*       ttsdlg.h
*
*       Header file for CTTStstDlg, CAddEngMode
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
// CTTStstDlg dialog

class CTTStstDlg : public CDialog
{
	friend class CAddEngMode;
/*
	friend class CTabITTSCentral;
	friend class CTabITTSAttr;
*/

// Construction
public:
	CTTStstDlg(CWnd* pParent = NULL);	// standard constructor

	void MainOutput(LPCTSTR str);

	CPropertySheet    *m_PropEng;
	CTabITTSCentral    m_Cent;
	CTabITTSAttr       m_Attrib;
	CTabITTSDialogs    m_Dialogs;
	CTabITTSNotify     m_Notify;
	CTabILexPronounce  m_LexPronounce;

// Dialog Data
	//{{AFX_DATA(CTTStstDlg)
	enum { IDD = IDD_TTSTST_DIALOG };
	CListBox	m_EnumList;
	CEdit	m_MainOutedit;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTTStstDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// functions in ttsfnc.cpp...
	BOOL  InitTTS(void);
	BOOL  TerminateTTS (void);
	DWORD EnumModes( PTTSMODEINFO aTTSInfo, int maxnmodes );

	// Generated message map functions
	//{{AFX_MSG(CTTStstDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnModeadd();
	virtual void OnOK();
	afx_msg void OnButtonTextdataShortcut();
	afx_msg void OnMove(int x, int y);
	afx_msg void OnClose();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
/////////////////////////////////////////////////////////////////////////////
// CAddEngMode dialog

class CAddEngMode : public CDialog
{
// Construction
public:
	CAddEngMode(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CAddEngMode)
	enum { IDD = IDD_DIALOGENGSELECT };
	CComboBox	m_DeviceID;
	CStatic	m_EnumOut7;
	CStatic	m_EnumOut13;
	CStatic	m_EnumOut12;
	CStatic	m_EnumOut11;
	CStatic	m_EnumOut10;
	CStatic	m_EnumOut9;
	CStatic	m_EnumOut8;
	CStatic	m_EnumOut6;
	CStatic	m_EnumOut3;
	CStatic	m_EnumOut1;
	CStatic	m_EnumOut5;
	CStatic	m_EnumOut4;
	CStatic	m_EnumOut2;
	CListBox	m_EnumList;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAddEngMode)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	int   FindMode( PTTSMODEINFO pTTSInfo, PTTSMODEINFO ttsResult );
	DWORD SelectMode( PTTSMODEINFO pttsResult );

	// Generated message map functions
	//{{AFX_MSG(CAddEngMode)
	afx_msg void OnFindcriteria();
	afx_msg void OnDblclkListenummodes1();
	virtual BOOL OnInitDialog();
	afx_msg void OnSelchangeListenummodes1();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
