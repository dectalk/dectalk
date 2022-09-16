// LicReqd.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CLicReqd dialog

class CLicReqd : public CDialog
{
// Construction
public:
	CLicReqd(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CLicReqd)
	enum { IDD = IDD_LICENSE_REQD };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLicReqd)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CLicReqd)
	virtual void OnOK();
	virtual void OnCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
