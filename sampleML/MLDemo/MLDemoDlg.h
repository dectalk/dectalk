// demoDlg.h : header file
// COMMENTS
// 001 cab	04/18/2001	Added English UK and French

#if !defined(AFX_DEMODLG_H__AFC947A8_F313_11D0_97A2_0000F820934A__INCLUDED_)
#define AFX_DEMODLG_H__AFC947A8_F313_11D0_97A2_0000F820934A__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "mmsystem.h"
#include "ttsapi.h"

/////////////////////////////////////////////////////////////////////////////
// CDemoDlg dialog

class CDemoDlg : public CDialog
{
// Construction
public:
	CDemoDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CDemoDlg)
	enum { IDD = IDD_DEMO_DIALOG };
	CString	m_grstat;
	CString	m_spstat;
	CString	m_usstat;
	CString	m_lastat;
	CString	m_ukstat;
	CString	m_frstat;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemoDlg)
	public:
	virtual BOOL Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext = NULL);
	virtual BOOL DestroyWindow();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDemoDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnEnglish();
	afx_msg void OnGerman();
	afx_msg void OnLatin();
	afx_msg void OnSpanish();
	afx_msg void OnEnglish_UK();
	afx_msg void OnFrench();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMODLG_H__AFC947A8_F313_11D0_97A2_0000F820934A__INCLUDED_)
