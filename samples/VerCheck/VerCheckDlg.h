// VerCheckDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CVerCheckDlg dialog

class CVerCheckDlg : public CDialog
{
// Construction
public:
	CVerCheckDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CVerCheckDlg)
	enum { IDD = IDD_VERCHECK_DIALOG };
	CButton	m_prevbutton;
	CButton	m_nextbutton;
	CString	m_DECtalkLine;
	CString	m_DECtalkVersion;
	CString	m_dtalklang;
	//}}AFX_DATA

	BOOL LoadVersion(LPSTR);
	BOOL GetLangEntry(unsigned long int, LPSTR, unsigned long int, LPSTR, unsigned long int);
	unsigned int GetMaxKeys(void);

	unsigned int key_index;
	unsigned int max_key;
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CVerCheckDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CVerCheckDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnNext();
	afx_msg void OnPrev();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
