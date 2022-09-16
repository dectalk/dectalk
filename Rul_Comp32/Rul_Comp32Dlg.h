// Rul_Comp32Dlg.h : header file
//

#if !defined(AFX_RUL_COMP32DLG_H__58D0E509_E25F_11D0_9349_08002B3EE578__INCLUDED_)
#define AFX_RUL_COMP32DLG_H__58D0E509_E25F_11D0_9349_08002B3EE578__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

/////////////////////////////////////////////////////////////////////////////
// CRul_Comp32Dlg dialog

class CRul_Comp32Dlg : public CDialog
{
// Construction
public:
	CRul_Comp32Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CRul_Comp32Dlg)
	enum { IDD = IDD_RUL_COMP32_DIALOG };
	CString	m_input_file;
	CString	m_output_file;
	int		m_conversion_mode;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRul_Comp32Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CRul_Comp32Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RUL_COMP32DLG_H__58D0E509_E25F_11D0_9349_08002B3EE578__INCLUDED_)
