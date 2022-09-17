// ctitest.h : main header file for the CTITEST application
//

#if !defined(AFX_CTITEST_H__D88AD7E4_3FE3_11D1_97AB_0000F820934A__INCLUDED_)
#define AFX_CTITEST_H__D88AD7E4_3FE3_11D1_97AB_0000F820934A__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CCtitestApp:
// See ctitest.cpp for the implementation of this class
//

class CCtitestApp : public CWinApp
{
public:
	CCtitestApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCtitestApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CCtitestApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CTITEST_H__D88AD7E4_3FE3_11D1_97AB_0000F820934A__INCLUDED_)
