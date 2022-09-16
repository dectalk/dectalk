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

DWORD       gEngObjectCount = 0;       // number of objects existing
   // This includes mode object, enumeration object
DWORD       gEngLockCount   = 0;       // number of times that this is locked
HINSTANCE   ghInstance;                // DLL library instance

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

	  return ResultFromScode(E_FAIL);

// check that we can provide the interface

   if (!IsEqualIID (riid, IID_IUnknown)
	&& !IsEqualIID (riid, IID_IClassFactory))

	  return ResultFromScode(E_NOINTERFACE);

// return our IClassFactory for the Manager object

   *ppv = (LPVOID) new CEngineClassFactory();

   if (NULL==*ppv) return ResultFromScode(E_OUTOFMEMORY);

// dont forget to addred the object through any interfaces we return

   ((LPUNKNOWN) *ppv)->AddRef();

   return NOERROR;
}


/************************************************************************
DllCanUnloadNow - This is standard OLE entry.
*/

STDAPI DllCanUnloadNow (void)
{
   SCODE sc;

// our answer is whether there are any objects or locks.

   sc = (gEngObjectCount == 0 && gEngLockCount == 0) ? S_OK : S_FALSE;

   return ResultFromScode (sc);
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
   gEngObjectCount--;
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


STDMETHODIMP CEngineClassFactory::QueryInterface(REFIID riid, LPVOID FAR * ppv)
{
   *ppv = NULL;

// Any intercae on this object is the obvject pointer

   if (IsEqualIID(riid, IID_IUnknown) || IsEqualIID(riid, IID_IClassFactory))

	  *ppv = (LPVOID) this;

// If we assign an interface then addrred

   if (NULL != *ppv)
	  {
	  ((LPUNKNOWN)*ppv)->AddRef();
	  return NOERROR;
	  }

   return ResultFromScode(E_NOINTERFACE);
}


STDMETHODIMP_ (ULONG) CEngineClassFactory::AddRef(void)
{
   return ++m_cRef;
}


STDMETHODIMP_ (ULONG) CEngineClassFactory::Release(void)
{
   ULONG cRefT;

   cRefT = --m_cRef;

   if (0L == m_cRef) delete this;

   return cRefT;
}


STDMETHODIMP CEngineClassFactory::CreateInstance(LPUNKNOWN punkOuter, REFIID riid, LPVOID * ppvObj)
{
   PCEngineEnum   pObj;
   HRESULT        hr;

   *ppvObj = NULL;
   hr      = ResultFromScode(E_OUTOFMEMORY);

// Verify that if there is a controlling unknown that it's asking for IUnknown

   if (NULL != punkOuter)

	  return ResultFromScode(CLASS_E_NOAGGREGATION);

// Create the object, telling it a function to notify us when it's gone

   pObj = new CEngineEnum(punkOuter, EngObjectDestroyed);

   if (NULL == pObj)  return hr;
   if (pObj->FInit()) hr = pObj->QueryInterface(riid, ppvObj);

// Kill the object if initial creation or FInit failed

   if (FAILED(hr))

	  delete pObj;

   else
		{
	  gEngObjectCount++;
		}

   return hr;
}


STDMETHODIMP CEngineClassFactory::LockServer(BOOL fLock)
{
   if (fLock)
		{
	  gEngLockCount++;
		}
   else
		{
	  if (gEngLockCount > 0)

		 gEngLockCount--;

	  else

		return ResultFromScode(E_FAIL);

		}

   return NOERROR;
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
