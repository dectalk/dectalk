/******************************************************************************\
*       tabisrce.h
*
*       Header file for CTabITTSCentral, CTabITTSAttr, CTabITTSDialogs, CTabILexPronounce
*
*       This code and information is provided "as is" without warranty
*       of any kind, either expressed or implied, including but not
*       limited to the implied warranties of merchantability and/or
*       fitness for a particular purpose.
*
*       Copyright (C) 1995 Microsoft Corporation.  All Rights Reserved.
*
\******************************************************************************/
// .h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTabITTSCentral dialog

class CTabITTSCentral : public CPropertyPage
{
	DECLARE_DYNCREATE(CTabITTSCentral)

// Construction
public:
	CTabITTSCentral();
	~CTabITTSCentral();

	void CALLBACK EXPORT OnPositionget();
	void DoTextData() {OnButtonTextdata();}

// Dialog Data
	//{{AFX_DATA(CTabITTSCentral)
	enum { IDD = IDD_TABITTSCENTRAL };
	CButton	m_checkTagged;
	CButton	m_buttonRegister;
	CButton	m_buttonUnRegister;
	CButton	m_btnToFileTime;
	CStatic	m_ToFileTimeOutput;
	CButton	m_btnPosnGet;
	CEdit	m_editTextData;
	CButton	m_EngPaused;
	CStatic	m_PosGetOutput;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CTabITTSCentral)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CTabITTSCentral)
	afx_msg void OnEngctlpause();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnButtonTextdata();
	afx_msg void OnPosnGet();
	afx_msg void OnButtonReset();
	afx_msg void OnButtonRegister();
	afx_msg void OnButtonUnRegister();
	afx_msg void OnButtonPhoneme();
	afx_msg void OnButtonInject();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};


/////////////////////////////////////////////////////////////////////////////
// CTabITTSAttr dialog

class CTabITTSAttr : public CPropertyPage
{
	DECLARE_DYNCREATE(CTabITTSAttr)

// Construction
public:
	CTabITTSAttr();
	~CTabITTSAttr();

// Dialog Data
	//{{AFX_DATA(CTabITTSAttr)
	enum { IDD = IDD_TABITTSATTRIB };
	CEdit	m_volumeLow;
	CEdit	m_volumeHigh;
	CEdit	m_editSpeed;
	CEdit	m_editRealTime;
	CEdit	m_editPitch;
	//}}AFX_DATA


// Overrides
public:
	virtual BOOL OnSetActive();
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CTabITTSAttr)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CTabITTSAttr)
	afx_msg void OnButtonPitchSet();
	afx_msg void OnButtonPitchGet();
	afx_msg void OnButtonRealTimeGet();
	afx_msg void OnButtonRealTimeSet();
	afx_msg void OnButtonSpeedSet();
	afx_msg void OnButtonSpeedGet();
	afx_msg void OnButtonVolumeSet();
	afx_msg void OnButtonVolumeGet();
	afx_msg void OnButtonPitchMin();
	afx_msg void OnButtonPitchMax();
	afx_msg void OnButtonRtMin();
	afx_msg void OnButtonRtMax();
	afx_msg void OnButtonSpeedMin();
	afx_msg void OnButtonSpeedMax();
	afx_msg void OnButtonVolMin();
	afx_msg void OnButtonVolMax();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

/////////////////////////////////////////////////////////////////////////////
// CTabITTSDialogs dialog

class CTabITTSDialogs : public CPropertyPage
{
	DECLARE_DYNCREATE(CTabITTSDialogs)

// Construction
public:
	CTabITTSDialogs();
	~CTabITTSDialogs();

// Dialog Data
	//{{AFX_DATA(CTabITTSDialogs)
	enum { IDD = IDD_TABITTSDIALOGS };
		// NOTE - ClassWizard will add data members here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CTabITTSDialogs)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CTabITTSDialogs)
	afx_msg void OnIttsdlggeneral();
	afx_msg void OnIttsdlglex();
	afx_msg void OnIttsdlgabout();
	afx_msg void OnIttsdlgtranslate();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

/////////////////////////////////////////////////////////////////////////////
// CTabILexPronounce dialog

class CTabILexPronounce : public CPropertyPage
{
	friend class CTTStstDlg;

	DECLARE_DYNCREATE(CTabILexPronounce)

// Construction
public:
	CTabILexPronounce();
	~CTabILexPronounce();

	void Output(LPCTSTR str);

// Dialog Data
	//{{AFX_DATA(CTabILexPronounce)
	enum { IDD = IDD_TABLEXPRONOUNCE };
	CComboBox	m_comboVPTOFSP;
	CEdit	m_editText;
	CComboBox	m_comboVCHSET;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CTabILexPronounce)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CTabILexPronounce)
	afx_msg void OnButtonGet();
	afx_msg void OnButtonRemove();
	afx_msg void OnButtonAdd();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

/////////////////////////////////////////////////////////////////////////////
// CTabITTSNotify dialog

class CTabITTSNotify : public CPropertyPage
{
	DECLARE_DYNCREATE(CTabITTSNotify)

// Construction
public:
	CTabITTSNotify();
	~CTabITTSNotify();

	void Output(LPCTSTR str);

// Dialog Data
	//{{AFX_DATA(CTabITTSNotify)
	enum { IDD = IDD_TABITTSNOTIFY };
	CEdit	m_NotifyOut;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CTabITTSNotify)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CTabITTSNotify)
	afx_msg void OnNotifyAttribChanged();
	afx_msg void OnNotifyAudioStart();
	afx_msg void OnNotifyAudioStop();
	afx_msg void OnNotifyVisual();
	afx_msg void OnNotifyBookMark();
	afx_msg void OnNotifyTextDataDone();
	afx_msg void OnNotifyTextDataStarted();
	afx_msg void OnNotifyWordPosition();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

/////////////////////////////////////////////////////////////////////////////
// CPhonemeDlg dialog

class CPhonemeDlg : public CDialog
{
// Construction
public:
	CPhonemeDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CPhonemeDlg)
	enum { IDD = IDD_DIALOGPHONEME };
	CButton	m_radioEng;
	CString	m_editText;
	CString	m_editPhoneme;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPhonemeDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	
	CFont m_font;

	void FormatPhoneme(PSDATA pdPhoneme, VOICECHARSET vCharSet);
	// Generated message map functions
	//{{AFX_MSG(CPhonemeDlg)
	afx_msg void OnButtonPhoneme();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
/////////////////////////////////////////////////////////////////////////////
// CInjectDlg dialog

class CInjectDlg : public CDialog
{
// Construction
public:
	CInjectDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CInjectDlg)
	enum { IDD = IDD_DIALOG_INJECT };
	CEdit	m_editTag;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CInjectDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CInjectDlg)
	afx_msg void OnButtonTextData();
	afx_msg void OnButtonInject();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
