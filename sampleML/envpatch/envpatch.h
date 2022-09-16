// envpatch.h : main header file for the ENVPATCH application
//

#if !defined(AFX_ENVPATCH_H__F2CF7DCB_04FE_11D1_8F4C_0000F803E8A4__INCLUDED_)
#define AFX_ENVPATCH_H__F2CF7DCB_04FE_11D1_8F4C_0000F803E8A4__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CEnvpatchApp:
// See envpatch.cpp for the implementation of this class
//

class CEnvpatchApp : public CWinApp
{
public:
	CEnvpatchApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CEnvpatchApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CEnvpatchApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ENVPATCH_H__F2CF7DCB_04FE_11D1_8F4C_0000F803E8A4__INCLUDED_)
