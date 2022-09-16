// Rul_Comp32.h : main header file for the RUL_COMP32 application
//

#if !defined(AFX_RUL_COMP32_H__58D0E507_E25F_11D0_9349_08002B3EE578__INCLUDED_)
#define AFX_RUL_COMP32_H__58D0E507_E25F_11D0_9349_08002B3EE578__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CRul_Comp32App:
// See Rul_Comp32.cpp for the implementation of this class
//

class CRul_Comp32App : public CWinApp
{
public:
	CRul_Comp32App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRul_Comp32App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CRul_Comp32App)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RUL_COMP32_H__58D0E507_E25F_11D0_9349_08002B3EE578__INCLUDED_)
