// SGram.h : main header file for the SGRAM DLL
//

#if !defined(AFX_SGRAM_H__F81E3C80_6A5E_11D1_AA9A_0060083E4DF1__INCLUDED_)
#define AFX_SGRAM_H__F81E3C80_6A5E_11D1_AA9A_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

#include "graph.h"

/////////////////////////////////////////////////////////////////////////////
// CSGramApp
// See SGram.cpp for the implementation of this class
//

class CSGramApp : public CWinApp
{
public:
	CSGramApp();

	BOOL Config(struct PHEdit2PlugInStruct *plugin);
	BOOL Init(struct PHEdit2PlugInStruct *plugin);
	BOOL Render(struct PHEdit2PlugInStruct *plugin);
	BOOL Quit(struct PHEdit2PlugInStruct *plugin);

	Graph dlg;
	BOOL bActive;
//	LRESULT CALLBACK WndProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSGramApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

	//{{AFX_MSG(CSGramApp)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

extern CSGramApp theApp;

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SGRAM_H__F81E3C80_6A5E_11D1_AA9A_0060083E4DF1__INCLUDED_)
