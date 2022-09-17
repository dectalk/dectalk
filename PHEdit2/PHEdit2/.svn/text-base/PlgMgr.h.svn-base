#if !defined(AFX_PLGMGR_H__7AAFF584_6694_11D1_AA99_0060083E4DF1__INCLUDED_)
#define AFX_PLGMGR_H__7AAFF584_6694_11D1_AA99_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// PlgMgr.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// PlgMgr dialog

#include "plugins.h"
#include "dataplug.h"

class PlgMgr : public CDialog
{
// Construction
public:
	PlgMgr(CWnd* pParent = NULL);   // standard constructor

	PlugIn *plugins;
	DataPlugIn *DataPlugins;
	CWnd *cWnd;

// Dialog Data
	//{{AFX_DATA(PlgMgr)
	enum { IDD = IDD_PLUGINS };
	CButton	m_closeallCtl;
	CButton	m_rescanCtl;
	CListBox	m_pluginsCtl;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(PlgMgr)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(PlgMgr)
	afx_msg void OnCloseall();
	afx_msg void OnRescan();
	virtual BOOL OnInitDialog();
	afx_msg void OnDblclkPlugins();
	afx_msg void OnConfig();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
	void DisplayList(void);
	int AudioPlugs;
	void TestPlugins(void);			// Test for duplicate level 1 or level 5

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PLGMGR_H__7AAFF584_6694_11D1_AA99_0060083E4DF1__INCLUDED_)
