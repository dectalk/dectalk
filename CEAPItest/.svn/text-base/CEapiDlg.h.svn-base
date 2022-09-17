// CEapiDlg.h : header file
//

#include <stdio.h>

#include "ttsfeat.h"
#include "ttsapi.h"
#if !defined(AFX_CEAPIDLG_H__21426A6E_8B95_11D1_AAB0_0060083E4DF1__INCLUDED_)
#define AFX_CEAPIDLG_H__21426A6E_8B95_11D1_AAB0_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

/////////////////////////////////////////////////////////////////////////////
// CCEapiDlg dialog

class CCEapiDlg : public CDialog
{
// Construction
public:
	CCEapiDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CCEapiDlg)
	enum { IDD = IDD_CEAPI_DIALOG };
	CEdit	m_textBox;
	CString	m_text;
	BOOL	m_clear;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCEapiDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
public:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CCEapiDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPlay();
	afx_msg void US();
	afx_msg void UK();
	afx_msg void SP();
	afx_msg void LA();
	afx_msg void GR();
	afx_msg void TestOneLang(char * lang);
	afx_msg unsigned int UINTStatus(unsigned int handle);
	afx_msg void TestVersion();
	afx_msg void TestVersionEx();
	afx_msg MMRESULT MMStatusBank(MMRESULT status);
	afx_msg void TestDictionary(LPTTS_HANDLE_T phTTS, char * lang);
	afx_msg void TestSetSpeaker(LPTTS_HANDLE_T phTTS);
	afx_msg void TestWavHelp(LPTTS_HANDLE_T phTTS, char * lang);
	afx_msg void TestLogHelp(LPTTS_HANDLE_T phTTS, char * lang);
	afx_msg void TestPause(LPTTS_HANDLE_T phTTS);
	afx_msg void TestRate (LPTTS_HANDLE_T phTTS);
	afx_msg void TestGetStatus (LPTTS_HANDLE_T phTTS);
	afx_msg void TestGetCaps();
	afx_msg void TestMemory(LPTTS_HANDLE_T curr_phTTS_mem);
	afx_msg void TestWav(LPTTS_HANDLE_T phTTS, char * lang, DWORD dwFormat);
	afx_msg void TestLog(LPTTS_HANDLE_T phTTS, char * lang, DWORD dwFlags);
	afx_msg void Start();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CEAPIDLG_H__21426A6E_8B95_11D1_AAB0_0060083E4DF1__INCLUDED_)
