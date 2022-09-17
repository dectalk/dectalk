// ctitestDlg.h : header file
//

#include <mmsystem.h>
#include "\work\rnd\dapi\src\api\ttsapi.h"
#include "waveplay.h"

#if !defined(AFX_CTITESTDLG_H__D88AD7E6_3FE3_11D1_97AB_0000F820934A__INCLUDED_)
#define AFX_CTITESTDLG_H__D88AD7E6_3FE3_11D1_97AB_0000F820934A__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#define MAX_TTS_BUF 0x3FFF

/* Here is the thread's individual data area */
typedef struct {
	LPTTS_HANDLE_T phTTS;
	char string[2048];
	TTS_BUFFER_T membuffs[2];
	char buffers[2][MAX_TTS_BUF];
	int status;
	int new_status;
	unsigned long int BufferMessage;
	BOOL play;
	BOOL play_ready;
	LPSTR base_play;
	DWORD play_buf_size;
	} THREAD_DATA, *LPTHREAD_DATA;

/////////////////////////////////////////////////////////////////////////////
// CCtitestDlg dialog

class CCtitestDlg : public CDialog
{
// Construction
public:
	CCtitestDlg(CWnd* pParent = NULL);	// standard constructor

	CImageList m_imagelist;
	int m_RedID;
	int m_YellowID;
	int m_GreenID;
	int m_newthread;
	WavePlay player;

	THREAD_DATA m_threads[20];

// Dialog Data
	//{{AFX_DATA(CCtitestDlg)
	enum { IDD = IDD_CTITEST_DIALOG };
	CListCtrl	m_status;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCtitestDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
	HICON m_RedIcon;
	HICON m_YellowIcon;
	HICON m_GreenIcon;

	void InitThread(int thread);
	void StartKill(void);
	void NewPlay(void);
	char play_buffer[MAX_TTS_BUF];
	char cur_play[MAX_TTS_BUF];
	DWORD cur_play_size;
	int cur_play_num;
	BOOL m_shutdown;
	
	// Generated message map functions
	//{{AFX_MSG(CCtitestDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnDblclkStatus();
	afx_msg void OnTimer(UINT nIDEvent);
	virtual void OnCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CTITESTDLG_H__D88AD7E6_3FE3_11D1_97AB_0000F820934A__INCLUDED_)
