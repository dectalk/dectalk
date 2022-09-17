// SGram.cpp : Defines the initialization routines for the DLL.
//

#include "stdafx.h"
#include "SGram.h"
#include "graph.h"

#include "..\phedit2\plugin.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

//
//	Note!
//
//		If this DLL is dynamically linked against the MFC
//		DLLs, any functions exported from this DLL which
//		call into MFC must have the AFX_MANAGE_STATE macro
//		added at the very beginning of the function.
//
//		For example:
//
//		extern "C" BOOL PASCAL EXPORT ExportedFunction()
//		{
//			AFX_MANAGE_STATE(AfxGetStaticModuleState());
//			// normal function body here
//		}
//
//		It is very important that this macro appear in each
//		function, prior to any calls into MFC.  This means that
//		it must appear as the first statement within the 
//		function, even before any object variable declarations
//		as their constructors may generate calls into the MFC
//		DLL.
//
//		Please see MFC Technical Notes 33 and 58 for additional
//		details.
//

/////////////////////////////////////////////////////////////////////////////
// CSGramApp

BEGIN_MESSAGE_MAP(CSGramApp, CWinApp)
	//{{AFX_MSG_MAP(CSGramApp)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSGramApp construction

CSGramApp::CSGramApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CSGramApp object

CSGramApp theApp;


extern "C" {
	BOOL Config(struct PHEdit2PlugInStruct *plugin);
	BOOL Init(struct PHEdit2PlugInStruct *plugin);
	BOOL Render(struct PHEdit2PlugInStruct *plugin);
	BOOL Quit(struct PHEdit2PlugInStruct *plugin);
}

extern "C" {
	
	BOOL Config(struct PHEdit2PlugInStruct *plugin) {
		AFX_MANAGE_STATE(AfxGetStaticModuleState());
		return theApp.Config(plugin);
	}

	BOOL Init(struct PHEdit2PlugInStruct *plugin) {
		AFX_MANAGE_STATE(AfxGetStaticModuleState());
		return theApp.Init(plugin);
	}

	BOOL Render(struct PHEdit2PlugInStruct *plugin) {
		AFX_MANAGE_STATE(AfxGetStaticModuleState());
		return theApp.Render(plugin);
	}

	BOOL Quit(struct PHEdit2PlugInStruct *plugin) {
		AFX_MANAGE_STATE(AfxGetStaticModuleState());
		return theApp.Quit(plugin);
	}
}

BOOL CSGramApp::Init(struct PHEdit2PlugInStruct *plugin) {
	CWnd *wnd = CWnd::FromHandle(plugin->hwndParent);

	strcpy((char*) plugin->Name, "Spectrogram Plug-in Module");
	strcpy((char*) plugin->Manufacturer, "Digital Equipment Corp");
	plugin->PlugInPosition = PLUGIN_POSTPROCESS;
	plugin->userData = NULL;
	if (bActive == TRUE)	return TRUE;
	if (dlg.Create(IDD_MAINVIEW, wnd) == 0)	return FALSE;
	dlg.ShowWindow(SW_SHOW);
	bActive = TRUE;
	return TRUE;
}

BOOL CSGramApp::Config(struct PHEdit2PlugInStruct *plugin) {
	if (bActive == FALSE)	return FALSE;
	dlg.ShowWindow(SW_SHOW);
	return TRUE;
}

BOOL CSGramApp::Render(struct PHEdit2PlugInStruct *plugin) {
	DWORD max_x;
	DWORD startX, endX;

	if (bActive == FALSE)	return FALSE;
	dlg.ShowWindow(SW_SHOW);

	dlg.bHaveData = FALSE;
	max_x = plugin->waveformSize / 2;
	startX = 0;
	endX = max_x - 1;
	while ((plugin->waveformData[startX] > -250 && plugin->waveformData[startX] < 250) && startX < max_x)				startX++;
	while ((plugin->waveformData[endX] > -250 && plugin->waveformData[endX] < 250) && endX != startX && endX > 0)		endX--;

	if (endX < max_x - 100)	endX += 100;
	if (startX > 100)		startX -= 100;

	if (endX <= startX)		return FALSE;
	if (endX == 0)			return FALSE;

	max_x = endX - startX;

	if (max_x > MAX_X)	max_x = MAX_X;
	memcpy(dlg.lpData, plugin->waveformData + startX, max_x * sizeof(S16));
	dlg.dwDataSizeX = max_x;
	dlg.bHaveData = TRUE;
	return TRUE;
}

BOOL CSGramApp::Quit(struct PHEdit2PlugInStruct *plugin) {
	if (bActive)	dlg.DestroyWindow();
	return FALSE;
}

BOOL CSGramApp::InitInstance() 
{
	bActive = FALSE;
	
	return CWinApp::InitInstance();
}
