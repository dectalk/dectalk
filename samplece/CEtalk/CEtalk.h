// CEtalk.h : main header file for the CETALK application
//

#if !defined(AFX_CETALK_H__21426A6C_8B95_11D1_AAB0_0060083E4DF1__INCLUDED_)
#define AFX_CETALK_H__21426A6C_8B95_11D1_AAB0_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CCEtalkApp:
// See CEtalk.cpp for the implementation of this class
//

class CCEtalkApp : public CWinApp
{
public:
	CCEtalkApp(LPCTSTR lpszAppName);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCEtalkApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CCEtalkApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CETALK_H__21426A6C_8B95_11D1_AAB0_0060083E4DF1__INCLUDED_)
