// dictool.h : main header file for the DICTOOL application
//

#if !defined(AFX_DICTOOL_H__54ED40C1_4EC5_11D5_BF07_0060083E8376__INCLUDED_)
#define AFX_DICTOOL_H__54ED40C1_4EC5_11D5_BF07_0060083E8376__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CDictoolApp:
// See dictool.cpp for the implementation of this class
//

class CDictoolApp : public CWinApp
{
public:
	CDictoolApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDictoolApp)
	public:
	virtual BOOL InitInstance();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CDictoolApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DICTOOL_H__54ED40C1_4EC5_11D5_BF07_0060083E8376__INCLUDED_)
