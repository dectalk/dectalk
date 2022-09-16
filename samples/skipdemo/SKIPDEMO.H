// skipdemo.h : main header file for the SKIPDEMO application
//

#if !defined(AFX_SKIPDEMO_H__E5924A9B_59E6_11D1_8091_0060083E4DF1__INCLUDED_)
#define AFX_SKIPDEMO_H__E5924A9B_59E6_11D1_8091_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CSkipdemoApp:
// See skipdemo.cpp for the implementation of this class
//

class CSkipdemoApp : public CWinApp
{
public:
	CSkipdemoApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSkipdemoApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CSkipdemoApp)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SKIPDEMO_H__E5924A9B_59E6_11D1_8091_0060083E4DF1__INCLUDED_)
