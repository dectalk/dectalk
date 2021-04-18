/************************************************************************
 * dtlkTTSC.Cpp - DECtalk TTS class factory.
 *
 *  This includes the interface:
 *	  IClassFactory
 *	  IUnknown
 *

don't know why this line is here?
Copyright 1994 by Microsoft corporation.All rights reserved.

************************************************************************
Revision History:
	26mar97		ncs			Fixed up file for Willow Pond Codes
	01may97		tek			licensing changes
    19nov97     cjl         change speech.h to local
	08jun98		tek			sapi dialogs

************************************************************************
 */


#ifndef _AFXDLL  //tek 08jun98 MFC for dialogs
#include <windows.h>
#else //_AFxDLL
#include "stdafx.h"
#include "dectalk_mfc.h"
#endif //_AFXDLL

#include <mmsystem.h>

#include <objbase.h>				  
#include <objerror.h>
#define INITGUID
// #include <compobj.h>
// cjl 19nov97 change speech.h to local
#include "speech.h"
#include "dtlkTTS.h"
#include "dtlkTTSE.h"

/************************************************************************
globals */

DWORD       gEngLockCount   = 0;       // number of times that this is locked
HINSTANCE   ghInstance;                // DLL library instance

volatile LONG		g_ulInstanceCounter = 0;
CEngineClassFactory g_ClassFactory;

/************************************************************************
*/
#ifdef _AFXDLL	// tek 08jun98 sapi dialogs and MFC
// tek 29may98 we need to have a CWinApp class in order to get at the
// initialization functions (now that we're MFC..)
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
// CDECtalkApp

BEGIN_MESSAGE_MAP(CDECtalkApp, CWinApp)
	//{{AFX_MSG_MAP(CDECtalkApp)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDECtalkApp construction

CDECtalkApp::CDECtalkApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}
CDECtalkApp::InitInstance()
{
	ghInstance = m_hInstance;
	return TRUE;
}
/////////////////////////////////////////////////////////////////////////////
// The one and only CDECtalkApp object

CDECtalkApp theApp;

// tek 29may98 end of MFC stuff..

#else //_AFXDLL
BOOL WINAPI DllMain (HINSTANCE hInst, DWORD fdwReason, LPVOID lpvXX)
{
   switch(fdwReason)
	  {
	  case DLL_PROCESS_ATTACH:

		 ghInstance = hInst;
		 break;

	  case DLL_PROCESS_DETACH:

		 break;
	  }

   return(TRUE);
}
#endif //_AFXDLL


/************************************************************************
DllGetClassObject - This is the external entry point for the OLE DLL,
   It follows standard OLE interface.
*/

HRESULT FAR PASCAL DllGetClassObject(REFCLSID rclsid, REFIID riid, LPVOID FAR * ppv)
{
	if (!IsEqualCLSID (rclsid, CLSID_DECtalkTTSEngineEnum))
		return CLASS_E_CLASSNOTAVAILABLE;

	// Hand the request off to the engine enumerator
	return g_ClassFactory.QueryInterface(riid, ppv);
}


/************************************************************************
DllCanUnloadNow - This is standard OLE entry.
*/

STDAPI DllCanUnloadNow (void)
{
	return g_ClassFactory.CanUnloadNow();
}


/************************************************************************
EngObjectDestroyed - This is called when an object gets destroyed.

Inputs
   none
Outputs
   none
*/

void PASCAL EngObjectDestroyed (void)
{
	if (g_ulInstanceCounter)
		InterlockedDecrement(&g_ulInstanceCounter);
}


/************************************************************************
CEngineClassFactory - Class factory object for the engine.
*/

CEngineClassFactory::CEngineClassFactory(void)
{
   m_cRef = 0L;
   return;
}


CEngineClassFactory::~CEngineClassFactory(void)
{
   return;
}

HRESULT CEngineClassFactory::CanUnloadNow(void)
{
	if (gEngLockCount)		return S_FALSE;
	return (g_ulInstanceCounter == 0 ? S_OK : S_FALSE);
}

STDMETHODIMP CEngineClassFactory::QueryInterface(REFIID riid, LPVOID FAR * ppv)
{
	*ppv = NULL;
	if (IsEqualIID(riid, IID_IUnknown) || IsEqualIID(riid, IID_IClassFactory))
	{
		*ppv = (LPVOID) this;
		this->AddRef();
		return S_OK;
	}

	// Let the enumerator respond
	PCEngineEnum pEnumerator;
	HRESULT hr;

	pEnumerator = new CEngineEnum(NULL, EngObjectDestroyed);
	if (!pEnumerator)
		return E_OUTOFMEMORY;
	if (!pEnumerator->FInit())
		return E_OUTOFMEMORY;

	// AddRef for the query...
	pEnumerator->AddRef();
	hr = pEnumerator->QueryInterface(riid, ppv);
	// Release from the AddRef
	pEnumerator->Release();

	if (SUCCEEDED(hr))
		InterlockedIncrement(&g_ulInstanceCounter);

	return hr;
}


STDMETHODIMP_ (ULONG) CEngineClassFactory::AddRef(void)
{
	InterlockedIncrement(&g_ulInstanceCounter);
	return ++m_cRef;
}


STDMETHODIMP_ (ULONG) CEngineClassFactory::Release(void)
{
	InterlockedDecrement(&g_ulInstanceCounter);
	return (--m_cRef);
}


STDMETHODIMP CEngineClassFactory::CreateInstance(LPUNKNOWN punkOuter, REFIID riid, LPVOID * ppvObj)
{
	if (punkOuter)
		return CLASS_E_NOAGGREGATION;

	return QueryInterface(riid, ppvObj);
}


STDMETHODIMP CEngineClassFactory::LockServer(BOOL fLock)
{
	if (fLock)
		gEngLockCount++;
	else if (gEngLockCount)
		gEngLockCount--;
	else
		return E_FAIL;

	return S_OK;
}


#ifdef WILLOWPOND
// 01mar97 tek	moved this ifdef
/* 26mar97 ncs
	Here are some function definitions -- but needs to be defined.
	Compiler breaks so dummy func are def.

	These functions are not defined anywhere else.
	Maybe willow pond has em?

**** GETTING RID OF THESE FUNCTIONS ****

MAYBE */


STDMETHODIMP CEngineClassFactory::GetLicInfo(LPLICINFO)
{
	return 0;
}

STDMETHODIMP CEngineClassFactory::RequestLicKey(DWORD, BSTR *)
{
	return 0;
}

STDMETHODIMP CEngineClassFactory::CreateInstanceLic(LPUNKNOWN, LPUNKNOWN, REFIID,
							   BSTR, LPVOID *)
{
	return 0;
}

/* Not Yet -- ncs -- */
#endif // WILLOWPOND
