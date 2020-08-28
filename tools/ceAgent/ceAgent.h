// ceAgent.h : main header file for the CEAGENT application
//

#if !defined(AFX_CEAGENT_H__8B88F0AD_3260_11D4_9A18_0060081EA1C6__INCLUDED_)
#define AFX_CEAGENT_H__8B88F0AD_3260_11D4_9A18_0060081EA1C6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CCeAgentApp:
// See ceAgent.cpp for the implementation of this class
//

class CCeAgentApp : public CWinApp
{
public:
	CCeAgentApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCeAgentApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CCeAgentApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CEAGENT_H__8B88F0AD_3260_11D4_9A18_0060081EA1C6__INCLUDED_)
