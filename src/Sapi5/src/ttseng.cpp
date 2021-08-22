// TtsEng.cpp : Implementation of DLL Exports.
//Copyright (c) Microsoft Corporation. All rights reserved.


// Note: Proxy/Stub Information
//      To build a separate proxy/stub DLL, 
//      run nmake -f msttsdrvps.mk in the project directory.

#include "stdafx.h"
#include "resource.h"
#include <initguid.h>
#include "TtsEng.h"
#include "TtsEng_i.c"
#include "TtsEngObj.h"



CComModule _Module;
#ifdef ENGLISH_US
BEGIN_OBJECT_MAP(ObjectMap)
    OBJECT_ENTRY( CLSID_DECtalkPaulUS   , CTTSEngObj    )
END_OBJECT_MAP()
#endif

#ifdef SPANISH_SP
BEGIN_OBJECT_MAP(ObjectMap)
    OBJECT_ENTRY( CLSID_DECtalkPaulSP   , CTTSEngObj    )
END_OBJECT_MAP()
#endif

#ifdef SPANISH_LA
BEGIN_OBJECT_MAP(ObjectMap)
    OBJECT_ENTRY( CLSID_DECtalkPaulLA   , CTTSEngObj    )
END_OBJECT_MAP()
#endif

#ifdef GERMAN
BEGIN_OBJECT_MAP(ObjectMap)
    OBJECT_ENTRY( CLSID_DECtalkPaulGR   , CTTSEngObj    )
END_OBJECT_MAP()
#endif

#ifdef ENGLISH_UK
BEGIN_OBJECT_MAP(ObjectMap)
    OBJECT_ENTRY( CLSID_DECtalkPaulUK   , CTTSEngObj    )
END_OBJECT_MAP()
#endif

#ifdef FRENCH
BEGIN_OBJECT_MAP(ObjectMap)
    OBJECT_ENTRY( CLSID_DECtalkPaulFR   , CTTSEngObj    )
END_OBJECT_MAP()
#endif

/////////////////////////////////////////////////////////////////////////////
// DLL Entry Point

#ifdef _WIN32_WCE
extern "C" BOOL WINAPI DllMain(HANDLE hInstance, ULONG dwReason, LPVOID)
#else
extern "C" BOOL WINAPI DllMain(HINSTANCE hInstance, DWORD dwReason, LPVOID /*lpReserved*/)
#endif
{
    if (dwReason == DLL_PROCESS_ATTACH)
    {
#ifdef ENGLISH_US
        _Module.Init(ObjectMap, (HINSTANCE)hInstance, &LIBID_DECTALKPAULUSLib);
#endif
#ifdef SPANISH_SP
        _Module.Init(ObjectMap, (HINSTANCE)hInstance, &LIBID_DECTALKPAULSPLib);
#endif
#ifdef SPANISH_LA
        _Module.Init(ObjectMap, (HINSTANCE)hInstance, &LIBID_DECTALKPAULLALib);
#endif
#ifdef GERMAN
        _Module.Init(ObjectMap, (HINSTANCE)hInstance, &LIBID_DECTALKPAULGRLib);
#endif
#ifdef ENGLISH_UK
        _Module.Init(ObjectMap, (HINSTANCE)hInstance, &LIBID_DECTALKPAULUKLib);
#endif
#ifdef FRENCH
        _Module.Init(ObjectMap, (HINSTANCE)hInstance, &LIBID_DECTALKPAULFRLib);
#endif
        DisableThreadLibraryCalls((HINSTANCE)hInstance);
    }
    else if (dwReason == DLL_PROCESS_DETACH)
        _Module.Term();
    return TRUE;    // ok
}

/////////////////////////////////////////////////////////////////////////////
// Used to determine whether the DLL can be unloaded by OLE

STDAPI DllCanUnloadNow(void)
{
    return (_Module.GetLockCount()==0) ? S_OK : S_FALSE;
}

/////////////////////////////////////////////////////////////////////////////
// Returns a class factory to create an object of the requested type

STDAPI DllGetClassObject(REFCLSID rclsid, REFIID riid, LPVOID* ppv)
{
    return _Module.GetClassObject(rclsid, riid, ppv);
}

/////////////////////////////////////////////////////////////////////////////
// DllRegisterServer - Adds entries to the system registry

STDAPI DllRegisterServer(void)
{
    // registers object, typelib and all interfaces in typelib
    return _Module.RegisterServer(TRUE);
}

/////////////////////////////////////////////////////////////////////////////
// DllUnregisterServer - Removes entries from the system registry

STDAPI DllUnregisterServer(void)
{
    return _Module.UnregisterServer(TRUE);
}




