// LicenseUDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CLicenseUDlg dialog

class CLicenseUDlg : public CDialog
{
// Construction
public:
	CLicenseUDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CLicenseUDlg)
	enum { IDD = IDD_LICENSEU_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLicenseUDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CLicenseUDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	virtual void OnCancel();
	virtual void OnOK();
	afx_msg void OnChpassword();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
