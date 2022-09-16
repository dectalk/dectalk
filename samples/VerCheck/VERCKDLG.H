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
	CString	m_DECtalkLine;
	CString	m_DECtalkVersion;
	//}}AFX_DATA

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
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
