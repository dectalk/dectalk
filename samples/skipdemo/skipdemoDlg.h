// skipdemoDlg.h : header file
//

#include "ttsapi.h"

#if !defined(AFX_SKIPDEMODLG_H__E5924A9D_59E6_11D1_8091_0060083E4DF1__INCLUDED_)
#define AFX_SKIPDEMODLG_H__E5924A9D_59E6_11D1_8091_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

/////////////////////////////////////////////////////////////////////////////
// CSkipdemoDlg dialog

class CSkipdemoDlg : public CDialog
{
// Construction
public:
	CSkipdemoDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CSkipdemoDlg)
	enum { IDD = IDD_SKIPDEMO_DIALOG };
	CEdit	m_text;
	CSliderCtrl	m_timeslide;
	CButton	m_stop;
	CButton	m_play;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSkipdemoDlg)
	public:
	virtual BOOL DestroyWindow();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
	HICON m_hPlayIcon;
	HICON m_hStopIcon;
	LPTTS_HANDLE_T phTTS;

	// Generated message map functions
	//{{AFX_MSG(CSkipdemoDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg void OnPlay();
	afx_msg void OnStop();
	afx_msg void OnSkipahead();
	afx_msg void OnSkipback();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SKIPDEMODLG_H__E5924A9D_59E6_11D1_8091_0060083E4DF1__INCLUDED_)
