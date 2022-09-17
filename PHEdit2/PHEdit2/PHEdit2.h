/* PHEdit(2) - PH Rom Edit Utility
 *
 *  Author: Kevin Bruckert
 *  Copyright (c) 1997 by Digital Equipment Corporation
 *  All Rights Reserved
 *
 *  Plug-in system based on WinAMP Plug-in modules
 *
 *  Note: Copyright does not cover plug-in modules for PHEdit(2),
 *        and each plug-in may carry its own copyright.
 *
 * Current Locker: $Locker: kevinb$
 * Date: $Date: 01/07/98 12:11:54$
 * Project: $Project: PHEdit ²  Development Project$
 * Subproject: $Subproject: PHEdit2$
 * Revision: $Revision: 4$
 *
 * Log:
 *  $Log: 
 *  4   01/07/98    kevinb          PHEdit² Version 1.0 Beta Cycle 1 Final Build
 *  3   01/05/98    kevinb          PHEdit(2) Beta 1
 *  2   12/15/97    kevinb          Added new header information for Starteam
 *  1   11/19/97    kevinb          Initial Version
 * $
 *
 * $NoKeywords$
 */

// PHEdit2.h : main header file for the PHEDIT2 application
//

#if !defined(AFX_PHEDIT2_H__3E71A3DB_5D03_11D1_8094_0060083E4DF1__INCLUDED_)
#define AFX_PHEDIT2_H__3E71A3DB_5D03_11D1_8094_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols
#include "plugins.h"
#include "dataplug.h"
#include "gaiclass.h"

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2App:
// See PHEdit2.cpp for the implementation of this class
//

class CPHEdit2App : public CWinApp
{
public:
	virtual BOOL OnIdle(LONG lCount);
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	CPHEdit2App();
	~CPHEdit2App();

	PlugIn plugins;
	DataPlugIn DataPlugins;
	GAI gai;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPHEdit2App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CPHEdit2App)
	afx_msg void OnAppAbout();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PHEDIT2_H__3E71A3DB_5D03_11D1_8094_0060083E4DF1__INCLUDED_)
