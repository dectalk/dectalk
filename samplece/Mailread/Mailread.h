// Mailread.h : main header file for the MAILREAD application
//

#if !defined(AFX_MAILREAD_H__9D945A58_9874_11D3_B899_0060083D5417__INCLUDED_)
#define AFX_MAILREAD_H__9D945A58_9874_11D3_B899_0060083D5417__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CMailreadApp:
// See Mailread.cpp for the implementation of this class
//

class CMailreadApp : public CWinApp
{
public:
	CMailreadApp(LPCTSTR lpszHelpName);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMailreadApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CMailreadApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MAILREAD_H__9D945A58_9874_11D3_B899_0060083D5417__INCLUDED_)
