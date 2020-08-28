/************************************************************************
dtlkTTSE.Cpp - DECtalk TTS engine enumeration & find object.
This includes the interfaces
ITTSEnum
IUnknown

  Copyright 1994 by Microsoft corporation.All rights reserved.
  
	************************************************************************
	REVISION HISTORY
	
	  02apr97	ncs			There are more comments than this but I am
						starting the header comments here now.
						02apr97   ncs			removed code includes...way at the bottom.
						01may97   tql			fixed BATS#364
						19sep97	tek			force queryinterface to fail if in access32 and
						no licenses available. This is a temporary fix to
						keep SMIT systems from failing ungracefully if
						not unlocked.
						19nov97   cjl         change speech.h to local
						17sep98	tek			change destrucion behaviors.
						30sep98	tek			repair reference counting, shutdown behavior
*/



#ifndef _AFXDLL  //tek 08jun98 MFC for dialogs
#include <windows.h>
#else //_AFxDLL
#include "stdafx.h"
#endif //_AFXDLL

#include <mmsystem.h>

#include <objbase.h>
#include <objerror.h>
#include <assert.h>

// cjl 19nov97 change speech.h to local
#include "speech.h"
#include "dtlkTTS.h"

#include <initguid.h>

#include "dtlkTTSE.h"
#define ENGINEENUM_INTERNAL_REFERENCES (2)

// This allows query for class factories
extern CEngineClassFactory g_ClassFactory;
extern volatile LONG g_ulInstanceCounter;

void CopyTTSModeInfoW(PTTSMODEINFOW pTTSModeInfo, unsigned int uiIndex);
// tek 19sep97 need this to do a license check in access32/smit..
extern "C" {
	BOOL AddLicenseRef(int *);
	void ReleaseLicenseRef(int *);
}


// BUGBUG: Must eventually have ANSI versions of all functions
//      in this object

/************************************************************************
Defines
*/
// tek 26feb97 moved NUMTTSMODES and the modes into dtlktts.h

/************************************************************************
CEngineEnum - Manager class.
*/

CEngineEnum::CEngineEnum (LPUNKNOWN punkOuter, LPFNDESTROYED pfnDestroy)
{
	m_cRef          = 0;
	m_punkOuter     = punkOuter;
	m_pfnDestroy    = pfnDestroy;
	m_pEngITTSEnumW = NULL;
	m_pEngITTSEnumA = NULL;

	// Start the DECtalk TTS enumeration at the beginning
	dwCurrentEnumPosn = 0;
	m_a32_lic=0;
}


CEngineEnum::~CEngineEnum (void)
{
#ifdef M_DEBUG
	char szTemp[256];
	sprintf(szTemp,"CEngineEnum (%08lx) destructor at %lu, A=%08lx, W=%08lx\n",
		this, timeGetTime(),m_pEngITTSEnumA,m_pEngITTSEnumW);
	OutputDebugString(szTemp);
#endif //M_DEBUG
	// tek 17sep98 verify that the ref count is indeed zero.
	_ASSERTE (m_cRef == ENGINEENUM_INTERNAL_REFERENCES);
	if (m_pEngITTSEnumA)
	{
		m_pEngITTSEnumA->Release();
		// MGS try this way
		if (NULL != m_pEngITTSEnumA) delete m_pEngITTSEnumA;
		m_pEngITTSEnumA = NULL;
	}
	if (m_pEngITTSEnumW)
	{
		m_pEngITTSEnumW->Release();
		// MGS try this way
		if (NULL != m_pEngITTSEnumW) delete m_pEngITTSEnumW;
		m_pEngITTSEnumW = NULL;
	}
	_ASSERTE (m_cRef == 0);
}


BOOL CEngineEnum::FInit (void)
{
	LPUNKNOWN pIUnknown = (LPUNKNOWN) this;

	// This is a dummy statement - We don't support aggregation
	if (m_punkOuter != NULL)	pIUnknown = m_punkOuter;

	// Allocate all of the contained interfaces
	// Due to internal design, we *MUST* allocate EnumW before EnumA
	m_pEngITTSEnumW = new CEngITTSEnumW(this, pIUnknown);
	m_pEngITTSEnumA = new CEngITTSEnumA(this, pIUnknown);
	m_pEngITTSEnumW->AddRef();
	m_pEngITTSEnumA->AddRef();

	assert(ENGINEENUM_INTERNAL_REFERENCES == 2); // consistency check

#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngineEnum::FInit (%08lx) at %lu, A=%08lx, W=%08lx\n",
			this, timeGetTime(),m_pEngITTSEnumA,m_pEngITTSEnumW);
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

	return (m_pEngITTSEnumW && m_pEngITTSEnumA) ? TRUE : FALSE;
}


STDMETHODIMP CEngineEnum::QueryInterface (REFIID riid, LPVOID *ppv)
{
	*ppv = NULL;
#ifdef ACCESS32		//tek 19sep97
#ifndef M_DEBUG
	// we need to fail if we can't get a license count..
	if (!AddLicenseRef(&m_a32_lic))
	{
		// this is pretty heavyhanded..
		return ResultFromScode (E_NOINTERFACE);
	}
	else
	{
		ReleaseLicenseRef(&m_a32_lic); // we were just testing..
	}
#endif
#endif //ACCESS32
	// Interesting problem... Nobody's supposed to know about
	// this interface. It's a shim between the class factory and
	// the enumerator. So we should never return reference to ourselves.
	/* always return our IUnknown for IID_IUnknown */
	if (IsEqualIID(riid, IID_IUnknown))
	{
#ifdef M_DEBUG
		MessageBox(NULL, "IUnknown interface requested against hidden interface", 
			"DECtalk SAPI", MB_OK);
#endif
		return g_ClassFactory.QueryInterface(riid, ppv);
	}
	if (IsEqualIID(riid, IID_IClassFactory))
	{
		return g_ClassFactory.QueryInterface(riid, ppv);
	}
	
	// other interfaces
	if (IsEqualIID(riid, IID_ITTSEnumW)) *ppv = m_pEngITTSEnumW;
	if (IsEqualIID(riid, IID_ITTSEnumA)) *ppv = m_pEngITTSEnumA;

	// update the reference count
	if (NULL != *ppv)
	{
		((LPUNKNOWN) *ppv)->AddRef();
		return S_OK;
	}

	return E_NOINTERFACE;
}


STDMETHODIMP_ (ULONG) CEngineEnum::AddRef (void)
{
	return ++m_cRef;
}


STDMETHODIMP_(ULONG) CEngineEnum::Release (void)
{
	ULONG    cRefT;
	
	cRefT = --m_cRef;
	
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngineEnum::Release (%08lx) now %d at %ld\n",
			this, cRefT, timeGetTime());
		OutputDebugString(szTemp);
//		ODSFlush();
	}
#endif //M_DEBUG

	if (cRefT == ENGINEENUM_INTERNAL_REFERENCES)
	{
		// inform destroy that object is going away
		if (NULL != m_pfnDestroy)
			(*m_pfnDestroy)();
		delete this;
	}

	return cRefT;
}


/************************************************************************
CEngITTSEnumW - ITTS Enumeration inteerface
*/


CEngITTSEnumA::CEngITTSEnumA (LPVOID pObj, LPUNKNOWN punkOuter)
{
	m_pObjA = (PCMode)pObj;
	m_cRef = 0; // tek 18sep98 track A/W refs separately
	(((PCEngineEnum) m_pObjA)->m_pEngITTSEnumW)->FInit(pObj, punkOuter);
}


CEngITTSEnumW::CEngITTSEnumW (LPVOID pObj, LPUNKNOWN punkOuter)
{
	
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngITTSEnumW (%08lx) constructor at %lu\n",
			this,timeGetTime());
		OutputDebugString(szTemp);
//		ODSFlush();
	}
#endif //M_DEBUG	
	m_cRef =     0;
	m_pObj      = pObj;
	m_punkOuter = punkOuter;
}


// This function is called from the ANSI interface constructor -

CEngITTSEnumW::FInit(LPVOID pObj, LPUNKNOWN punkOuter)
{
	m_cRef      = 0;
	m_pObj      = pObj;
	m_punkOuter = punkOuter;
	return S_OK;
}


CEngITTSEnumA::~CEngITTSEnumA (void)
{
	
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngITTSEnumA (%08lx) destructor at %lu\n",
			this,timeGetTime());
		OutputDebugString(szTemp);
//		ODSFlush();
	}
#endif //M_DEBUG	
	// MVP:06/05/96 :Do nothing in the Destructor as it doesn't
	// have any members which are allocated.
	// The below line causes freeing up memory twice.It caused
	// the Memory error when debgging the debug version of
	// DTLKTTSE.DLL
	//   (((PCEngineEnum) m_pObjA)->m_pEngITTSEnumW)->~CEngITTSEnumW();
	
}


CEngITTSEnumW::~CEngITTSEnumW (void)
{
	
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngITTSEnumW (%08lx) destructor at %lu\n",
			this,timeGetTime());
		OutputDebugString(szTemp);
//		ODSFlush();
	}
#endif //M_DEBUG	
	
	// tek 17sep98 verify that the ref count is indeed zero.
	_ASSERTE (m_cRef==0);
}


STDMETHODIMP CEngITTSEnumA::QueryInterface(REFIID riid, LPVOID FAR *ppv)
{
#ifdef M_DEBUG
	{
		char szTemp[256];
		char szTemp2[256];
		WCHAR osTemp3[256];
		if (!StringFromGUID2(riid,osTemp3,255))
		{
			szTemp2[0]='\0';  // fromGUID failed..
		}
		else
		{
			if (!WideCharToMultiByte(CP_ACP, 0, osTemp3, -1, szTemp2, 256,0,0))
			{
				szTemp2[0]='\0';
			}
		}
		sprintf(szTemp,"CEngineEnumA::QueryInterface %s at %lu\n",
			szTemp2,timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	return (((PCEngineEnum) m_pObjA)->m_pEngITTSEnumW)->QueryInterface(riid, ppv);
}


STDMETHODIMP CEngITTSEnumW::QueryInterface(REFIID riid, LPVOID FAR *ppv)
{
#ifdef M_DEBUG
	{
		char szTemp[256];
		char szTemp2[256];
		WCHAR osTemp3[256];
		if (!StringFromGUID2(riid,osTemp3,255))
		{
			szTemp2[0]='\0';  // fromGUID failed..
		}
		else
		{
			if (!WideCharToMultiByte(CP_ACP, 0, osTemp3, -1, szTemp2, 256,0,0))
			{
				szTemp2[0]='\0';
			}
		}
		sprintf(szTemp,"CEngineEnumW::QueryInterface %s at %lu\n",
			szTemp2,timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	return m_punkOuter->QueryInterface(riid,ppv);
}


STDMETHODIMP_ (ULONG) CEngITTSEnumA::AddRef(void)
{
	m_cRef++; // tek 18sep98 track refs
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngITTSEnumA::AddRef (%08lx) now %lu at %lu\n",
			this,m_cRef,timeGetTime());
		OutputDebugString(szTemp);
//		ODSFlush();
	}
#endif //M_DEBUG	
	return (((PCEngineEnum) m_pObjA)->m_pEngITTSEnumW)->AddRef();
}


STDMETHODIMP_ (ULONG) CEngITTSEnumW::AddRef(void)
{
	++m_cRef;
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngITTSEnumW::AddRef (%08lx) now %lu at %lu\n",
			this,m_cRef,timeGetTime());
		OutputDebugString(szTemp);
//		ODSFlush();
	}
#endif //M_DEBUG
	return m_punkOuter->AddRef();
}


STDMETHODIMP_ (ULONG) CEngITTSEnumA::Release(void)
{
	ULONG	ulRef;        // tek 18sep98 interface reference count
	
	m_cRef--;
	ulRef = m_cRef;
	
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngITTSEnumA::Release (%08lx) now %lu at %lu\n",
			this,ulRef,timeGetTime());
		OutputDebugString(szTemp);
//		ODSFlush();
	}
#endif //M_DEBUG	
	
	// get rid of the base class
	(((PCEngineEnum) m_pObjA)->m_pEngITTSEnumW)->Release();

	// MGS try this way.
//	if (ulRef == 0)
//		delete this;
	
	return ulRef;
	
}


STDMETHODIMP_(ULONG) CEngITTSEnumW::Release(void)
{
	// tek 17sep98 made self-deleting
	ULONG ulResult;
	ULONG ulRetval;
    --m_cRef;
	ulRetval = m_cRef;
	
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngITTSEnumW::Release (%08lx) now %lu at %lu\n",
			this,ulRetval,timeGetTime());
		OutputDebugString(szTemp);
//		ODSFlush();
	}
#endif //M_DEBUG	
	ulResult = m_punkOuter->Release();

	// MGS try this way
//	if (0 == m_cRef)
//		delete this;
	return ulRetval;
}


/**************************************************************************************

  This bogus enumerator pretends to provide you with as many modes as you request - up
  to a purely arbitrary limit hardcoded elsewhere (#define NUMTTSMODES 9) & stuffs 'em
  with nothing real - just 0's & one bit of the Feature flag.
  
	All members of the array will currently be the same engine - OK?
	We can make more distinct (DECtalk) engines if needed.
	
*/

STDMETHODIMP CEngITTSEnumA::Next (ULONG cel, PTTSMODEINFOA pttsInfo, ULONG* pdwFetched)
{
	HRESULT        hRes;
	PTTSMODEINFOA  pTTSModeInfoA = pttsInfo;
	PTTSMODEINFOW  pTTSMODEINFOW;
	PTTSMODEINFOW  pTTSModeInfoW;
	ULONG          i;
	
	pTTSMODEINFOW = 
		pTTSModeInfoW = (PTTSMODEINFOW) malloc(cel * sizeof(TTSMODEINFOW));
	
	if (!pTTSMODEINFOW) return ResultFromScode(E_OUTOFMEMORY);
	
	hRes = (((PCEngineEnum) m_pObjA)->m_pEngITTSEnumW)->Next(cel, pTTSMODEINFOW, pdwFetched);
	
	if (hRes == NOERROR)
		
		for (i = 1; i <= *pdwFetched; i++, pTTSModeInfoA++, pTTSModeInfoW++)
		{
			pTTSModeInfoA->gEngineID = pTTSModeInfoW->gEngineID;
			
			WideCharToMultiByte(CP_ACP, 0, pTTSModeInfoW->szMfgName, -1,
				pTTSModeInfoA->szMfgName, TTSI_NAMELEN, NULL, NULL);
			
			WideCharToMultiByte(CP_ACP, 0, pTTSModeInfoW->szProductName, -1,
				pTTSModeInfoA->szProductName, TTSI_NAMELEN, NULL, NULL);
			
			pTTSModeInfoA->gModeID = pTTSModeInfoW->gModeID;
			
			WideCharToMultiByte(CP_ACP, 0, pTTSModeInfoW->szModeName, -1,
				pTTSModeInfoA->szModeName, TTSI_NAMELEN, NULL, NULL);
			
			pTTSModeInfoA->language.LanguageID = pTTSModeInfoW->language.LanguageID;
			
			WideCharToMultiByte(CP_ACP, 0, pTTSModeInfoW->language.szDialect, -1,
				pTTSModeInfoA->language.szDialect, LANG_LEN, NULL, NULL);
			
			WideCharToMultiByte(CP_ACP, 0, pTTSModeInfoW->szSpeaker, -1,
				pTTSModeInfoA->szSpeaker, TTSI_NAMELEN, NULL, NULL);
			
			WideCharToMultiByte(CP_ACP, 0, pTTSModeInfoW->szStyle, -1,
				pTTSModeInfoA->szStyle, TTSI_STYLELEN, NULL, NULL);
			
			pTTSModeInfoA->wGender          = pTTSModeInfoW->wGender;
			pTTSModeInfoA->wAge             = pTTSModeInfoW->wAge;
			pTTSModeInfoA->dwFeatures       = pTTSModeInfoW->dwFeatures;
			pTTSModeInfoA->dwInterfaces     = pTTSModeInfoW->dwInterfaces;
			pTTSModeInfoA->dwEngineFeatures = pTTSModeInfoW->dwEngineFeatures;
		}
		
		free(pTTSMODEINFOW);
		
		return hRes;         // hRes came from the call to CITTSEnumW::Next
}


STDMETHODIMP CEngITTSEnumW::Next (ULONG cel, PTTSMODEINFOW pttsInfo, ULONG* pdwFetched)
{
	DWORD dwEnum, i;
	DWORD dwCurEnum;
	int   iRet;
	
	// some error checking
	
	if (!pttsInfo) return ResultFromScode (E_INVALIDARG);
	if ((cel != 1) && !pdwFetched) return ResultFromScode (E_INVALIDARG);
	
	// if our current position is already at the end then return an error
	
	if (((PCEngineEnum) m_pObj)->dwCurrentEnumPosn >= NUMTTSMODES)
	{
		if (pdwFetched) *pdwFetched = 0;
		memset (pttsInfo, 0, cel * sizeof(TTSMODEINFOW));
		return ResultFromScode (S_FALSE);
	}
	
	// how many can we really enumerate?
	
	dwEnum = NUMTTSMODES - ((PCEngineEnum) m_pObj)->dwCurrentEnumPosn;
	
	if (dwEnum > cel) dwEnum = cel;
	
	if (pdwFetched) *pdwFetched = dwEnum;
	
	// do the copying
	
	for (i = 0; i < dwEnum; i++, pttsInfo++)
	{
		memset (pttsInfo, 0, sizeof(*pttsInfo));
		// tek 04sep96 add in the other things we can do..
		pttsInfo->dwFeatures = 
			TTSFEATURE_ANYWORD 
			| TTSFEATURE_PITCH 
			| TTSFEATURE_SPEED
			| TTSFEATURE_VOLUME;
		
		dwCurEnum = ((PCEngineEnum) m_pObj)->dwCurrentEnumPosn + i;
		
		// BUGBUG: Re-evaluate when have final list of features & interfaces
		
		pttsInfo->gEngineID = CLSID_DECtalkTTSEngineEnum;   // SB ..Female
		iRet = MultiByteToWideChar (CP_ACP, MB_PRECOMPOSED, "Digital Equipment Corporation", -1L,
			pttsInfo->szMfgName, sizeof(pttsInfo->szMfgName) / sizeof(WCHAR));
		iRet = MultiByteToWideChar (CP_ACP, MB_PRECOMPOSED, "DECtalk software", -1L,
			pttsInfo->szProductName, sizeof(pttsInfo->szProductName) / sizeof(WCHAR));
		pttsInfo->dwInterfaces =  0;
		pttsInfo->dwEngineFeatures = 0 ;
		/* TQL: 05/01/97 Pass in dwCurEnum instead of i.  This fixes BATS#364 */
		CopyTTSModeInfoW(pttsInfo,dwCurEnum); 	
	}
	
	((PCEngineEnum) m_pObj)->dwCurrentEnumPosn += dwEnum;
	
	return (cel == dwEnum) ? NOERROR : ResultFromScode (S_FALSE);
}


STDMETHODIMP CEngITTSEnumA::Skip (ULONG cel)
{
	return (((PCEngineEnum) m_pObjA)->m_pEngITTSEnumW)->Skip(cel);
}


STDMETHODIMP CEngITTSEnumW::Skip (ULONG cel)
{
	// If we skip beyond the edge of the modes then return an error
	// and set the position to the end
	
	if ((cel + ((PCEngineEnum) m_pObj)->dwCurrentEnumPosn) > NUMTTSMODES) 
	{
		((PCEngineEnum) m_pObj)->dwCurrentEnumPosn = NUMTTSMODES;
		return ResultFromScode (S_FALSE);
	}
	
	// else, we're not skipping too much
	
	((PCEngineEnum) m_pObj)->dwCurrentEnumPosn += cel;
	return NOERROR;
}


STDMETHODIMP CEngITTSEnumA::Reset (void)
{
	return (((PCEngineEnum) m_pObjA)->m_pEngITTSEnumW)->Reset();
}


STDMETHODIMP CEngITTSEnumW::Reset (void)
{
	// Set the current position back to the beginning
	
	((PCEngineEnum) m_pObj)->dwCurrentEnumPosn = 0;
	
	return NOERROR;
}


STDMETHODIMP CEngITTSEnumA::Clone (ITTSEnumA * FAR * ppITTSEnum)
{
	HRESULT        hr;
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngITTSEnumA::Clone at %lu\n",
			timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	
	if (!ppITTSEnum) return ResultFromScode(E_INVALIDARG);
	
	// Create a new enumeration object
	*ppITTSEnum = NULL;

	hr = g_ClassFactory.QueryInterface(IID_ITTSEnumA, (void**) ppITTSEnum);
	if (FAILED(hr))
		return hr;

	PCEngITTSEnumA pEnumA = (PCEngITTSEnumA) *ppITTSEnum;
	PCEngineEnum pEngineEnum = (PCEngineEnum) pEnumA->m_pObjA;
	// set its current position to the current enumerator's position
	pEngineEnum->dwCurrentEnumPosn = 
		((PCEngineEnum)m_pObjA)->dwCurrentEnumPosn;

	// done
	return hr;
}


STDMETHODIMP CEngITTSEnumW::Clone (ITTSEnumW * FAR * ppITTSEnum)
{
	HRESULT        hr;
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CEngITTSEnumW::Clone at %lu\n",
			timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	
	if (!ppITTSEnum) return ResultFromScode(E_INVALIDARG);
	
	// Create a new enumeration object
	*ppITTSEnum = NULL;

	hr = g_ClassFactory.QueryInterface(IID_ITTSEnumW, (void**) ppITTSEnum);
	if (FAILED(hr))
		return hr;

	PCEngITTSEnumW pEnumW = (PCEngITTSEnumW) *ppITTSEnum;

	// set its current position to the current enumerator's position
	((PCEngineEnum)(pEnumW->m_pObj))->dwCurrentEnumPosn = 
		((PCEngineEnum)m_pObj)->dwCurrentEnumPosn;
	
	// done
	return hr;
}


STDMETHODIMP CEngITTSEnumA::Select(GUID gModeID, PITTSCENTRALA *ppITTSCentral,
								   LPUNKNOWN pAudio)
{
	PITTSCENTRALW  pITTSCentralW;
	HRESULT        hRes;
	
	hRes = (((PCEngineEnum) m_pObjA)->m_pEngITTSEnumW)->Select(gModeID,
		&pITTSCentralW, pAudio);
	if (hRes == NOERROR)
	{
		hRes = pITTSCentralW->QueryInterface(IID_ITTSCentralA, (void**) ppITTSCentral);
		pITTSCentralW->Release();
	}
	
	return hRes;
}


STDMETHODIMP CEngITTSEnumW::Select(GUID gModeID, PITTSCENTRALW *ppITTSCentral,
								   LPUNKNOWN pAudio)
{
	PCMode         pMode;
	HRESULT        hr;
	PTTSMODEINFOW  pTTSInfo;

#ifdef M_DEBUG
	//MessageBox(NULL, "Select Call", NULL, MB_OK);
#endif

	if (!ppITTSCentral  || !pAudio)
		return ResultFromScode (E_INVALIDARG);

	if (!IsEqualGUID(gModeID, MODEID_PAUL) &&
		!IsEqualGUID(gModeID, MODEID_BETTY)&&
		!IsEqualGUID(gModeID, MODEID_HARRY)&&
		!IsEqualGUID(gModeID, MODEID_FRANK)&&
		!IsEqualGUID(gModeID, MODEID_DENNIS)&&
		!IsEqualGUID(gModeID, MODEID_KIT)&&
		!IsEqualGUID(gModeID, MODEID_URSULA)&&
		!IsEqualGUID(gModeID, MODEID_RITA)&&
		!IsEqualGUID(gModeID, MODEID_WENDY))
	{
		return ResultFromScode (TTSERR_INVALIDMODE);
	}
	
	*ppITTSCentral = NULL;
	
	// Try to create a new enumeration object
	pMode = new CMode ((LPUNKNOWN)NULL, ((PCEngineEnum)m_pObj)->m_pfnDestroy, pAudio);

	// The below line is commented as this macro is obsolete.
	// tek 7/3/96: can't leave it commented, because then we'll
	// return an unitialized var.. so I uncommented it.
	hr = ResultFromScode (E_OUTOFMEMORY);
	if (!pMode)		return hr;
	
	if (pMode->FInit())
		hr = pMode->QueryInterface(IID_ITTSCentralW, (VOID**)ppITTSCentral);
	
	if (FAILED(hr))
	{ // tek 20sep97 
		pMode->Release();    // kill the object if the finit failed
		pMode=NULL;
	}
	else
	{
		pTTSInfo = &pMode->m_TTSModeInfo;
		
		memset (pTTSInfo, 0, sizeof(*pTTSInfo));
		
		if (IsEqualGUID(gModeID, MODEID_PAUL))
			InitializeSpeaker(pMode,TTSMODE_PAUL,"Paul");
		else if (IsEqualGUID(gModeID, MODEID_BETTY))
			InitializeSpeaker(pMode,TTSMODE_BETTY,"Betty");
		else if (IsEqualGUID(gModeID, MODEID_HARRY))
			InitializeSpeaker(pMode,TTSMODE_HARRY,"Harry");
		else if (IsEqualGUID(gModeID, MODEID_FRANK))
			InitializeSpeaker(pMode,TTSMODE_FRANK,"Frank");
		else if (IsEqualGUID(gModeID, MODEID_DENNIS))
			InitializeSpeaker(pMode,TTSMODE_DENNIS,"Dennis");
		else if (IsEqualGUID(gModeID, MODEID_KIT))
			InitializeSpeaker(pMode,TTSMODE_KIT,"Kit");
		else if (IsEqualGUID(gModeID, MODEID_URSULA))
			InitializeSpeaker(pMode,TTSMODE_URSULA,"Ursula");
		else if (IsEqualGUID(gModeID, MODEID_RITA))
			InitializeSpeaker(pMode,TTSMODE_RITA,"Rita");
		else if (IsEqualGUID(gModeID, MODEID_WENDY))
			InitializeSpeaker(pMode,TTSMODE_WENDY,"Wendy");

		InterlockedIncrement(&g_ulInstanceCounter);
	}
	
	return hr;
}

/* 02apr97 ncs
removing this -- this is bad coding

  extern "C" {
  #include "ttsapi.c"		//Changed from specific path to general
  #include "crypt2.c"		//cjl 11/8/96
  
	} // Close bracket for extern "C" at top of "C" API code.
*/
