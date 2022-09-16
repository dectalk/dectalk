/******************************************************************************\
*       ttsfnc.cpp
*
*       Implements functionality of application notification sinks and
*       OLE initialization.
*
*       This code and information is provided "as is" without warranty
*       of any kind, either expressed or implied, including but not
*       limited to the implied warranties of merchantability and/or
*       fitness for a particular purpose.
*
*       Copyright (C) 1995 Microsoft Corporation.  All Rights Reserved.
*
\******************************************************************************/

// 22sep98		tek			fixed audio reference releases (bats765)(same as SDK4)

#include "stdafx.h"

#include <mmsystem.h>

#include <speech.h>
#include "bufcvt.h"
#include <tchar.h>

#include "resource.h"
#include "tabisrce.h"
#include "ttstst.h"
#include "ttsdlg.h"
#include "ttsfnc.h"

#ifdef WILLOWPOND
// tek 29sep96 for DEC engine unlocking..
// note: define RTLICENSEKEY="\"text\"" to get the quoted
//       string through the preprocessor..
#include "idec.h"
#endif // WILLOWPOND

void DisplayModeInfo(PTTSMODEINFO pTTSInfo);

// Globals...
/*
HINSTANCE         ghInstance;                // instance handle
HWND              ghWndMain;                 // main window
HWND              ghWndEdit;                 // main edit control
*/
// TTS specific member variables...
PITTSCENTRAL			gpITTSCentral = NULL;     // engine interface
LPUNKNOWN   			gpIUnkAudio = NULL;     // audio source
PITTSATTRIBUTES		gpITTSAttributes = NULL;  // attributes
PITTSDIALOGS			gpITTSDialogs = NULL;     // dialogs
PITTSENUM				gpITTSEnum = NULL;
PILEXPRONOUNCE			gpILexPronounce = NULL;		// lex pronounce interface

PCTestNotify			gpTestNotify = NULL;     // notification object
PCTestBufNotify		gpTestBufNotify = NULL;  // buf notification object

CList<DWORD, DWORD>	gdwKeyList;              // list of notification keys


/*************************************************************************
BeginOLE - This begins the OLE. It opens up an instance of the TTS manager
           and saves its interface away in gpITTSEnum.

returns TRUE if it succedes
*/

BOOL CTTStstDlg::InitTTS(void)
{
	HRESULT hRes;

	m_PropEng  = NULL;

	hRes = CoCreateInstance (CLSID_TTSEnumerator, NULL, CLSCTX_ALL, IID_ITTSEnum, (void**)&gpITTSEnum);

	if (FAILED(hRes))
	{
		MessageBox( TEXT("Error creating TTSEnumerator (CoCreateInstance), app will terminate."), NULL, MB_OK );
	   	return FALSE;
	}

	if( (gpTestNotify = new CTestNotify()) == NULL )
		MessageBox( TEXT("Error creating notify pointer."), TEXT("Warning"), MB_OK );

	if( (gpTestBufNotify = new CTestBufNotify()) == NULL )
		MessageBox( TEXT("Error creating buf notify pointer."), TEXT("Warning"), MB_OK );

	return TRUE;
}


BOOL CTTStstDlg::TerminateTTS (void)
{
	while(!gdwKeyList.IsEmpty())	// unregister the ITTSNotifySinks
	{
		DWORD dwKey = gdwKeyList.RemoveHead();
		HRESULT hRes = gpITTSCentral->UnRegister(dwKey);
		if(FAILED(hRes))
		{
			TCHAR buf[256];
			_stprintf(buf, TEXT("UnRegister(%ld) failed during TerminateTTS()."), (DWORD) dwKey);
			MainOutput(buf);
		}
	}
	if( gpILexPronounce  ) gpILexPronounce->Release();
	if( gpITTSAttributes  ) gpITTSAttributes->Release();
	if( gpITTSDialogs     ) gpITTSDialogs->Release();
	if( gpITTSEnum        ) gpITTSEnum->Release();
	if( gpITTSCentral     ) gpITTSCentral->Release();
	if( gpTestNotify      ) delete gpTestNotify;
	if( gpTestBufNotify   ) delete gpTestBufNotify;

   // free up the audio object because the engine doesn't always do so
   while (gpIUnkAudio && gpIUnkAudio->Release());

	return TRUE;
}

/*************************************************************************
CTestNotify - Notification object.
*/
CTestNotify::CTestNotify (void)
{
// this space intentionally left blank
}

CTestNotify::~CTestNotify (void)
{
// this space intentionally left blank
}

STDMETHODIMP CTestNotify::QueryInterface (REFIID riid, LPVOID *ppv)
{
	*ppv = NULL;

	/* always return our IUnknown for IID_IUnknown */
	if (IsEqualIID (riid, IID_IUnknown) || IsEqualIID(riid,IID_ITTSNotifySink))
	{
		*ppv = (LPVOID) this;
		return S_OK;
	}

	// otherwise, cant find
	return ResultFromScode (E_NOINTERFACE);
}

STDMETHODIMP_ (ULONG) CTestNotify::AddRef (void)
{
	// normally this increases a reference count, but this object
	// is going to be freed as soon as the app is freed, so it doesn't
	// matter
	return 1;
}

STDMETHODIMP_(ULONG) CTestNotify::Release (void)
{
	// normally this releases a reference count, but this object
	// is going to be freed when the application is freed so it doesnt
	// matter
	return 1;
}

void CTestNotify::NotifyOutput(LPCTSTR str)
{
	CTTStstDlg *dlgtmp = (CTTStstDlg *)AfxGetApp()->m_pMainWnd;
	CTabITTSNotify *tabtmp = &(dlgtmp->m_Notify);

	tabtmp->Output( str );
}

STDMETHODIMP CTestNotify::AttribChanged (DWORD dwAttribID)
{
	ASSERT(gpEng);
	if( gpEng->Not.bAttribChanged )
	{
		TCHAR  buf[256];
		CString idStr;
		switch (dwAttribID)
		{
		case TTSNSAC_PITCH:
		 	idStr = TEXT("TTSNSAC_PITCH");
			break;
		case TTSNSAC_REALTIME:
		 	idStr = TEXT("TTSNSAC_REALTIME");
			break;
		case TTSNSAC_SPEED:
		 	idStr = TEXT("TTSNSAC_SPEED");
			break;
		case TTSNSAC_VOLUME:
		 	idStr = TEXT("TTSNSAC_VOLUME");
			break;
		default:
		 	idStr = TEXT("ERROR");
			break;
		}
		_stprintf( buf, TEXT("\r\nAttribChanged notification: %s\r\n"), idStr);
		NotifyOutput( buf );
	}

   return NOERROR;
}

STDMETHODIMP CTestNotify::AudioStart (QWORD qTimeStamp)
{
	ASSERT(gpEng);
	if( gpEng->Not.bAudioStart )
	{
		TCHAR  buf[256];
		_stprintf( buf, TEXT("\r\nAudioStart qTimeStamp: %0I64x\r\n"), qTimeStamp );
		NotifyOutput( buf );
	}

   return NOERROR;
}

STDMETHODIMP CTestNotify::AudioStop (QWORD qTimeStamp)
{
	ASSERT(gpEng);
	if( gpEng->Not.bAudioStop )
	{
		TCHAR  buf[256];
		_stprintf( buf, TEXT("\r\nAudioStop qTimeStamp: %0I64x\r\n"), qTimeStamp );
		NotifyOutput( buf );
	}

   return NOERROR;
}

STDMETHODIMP CTestNotify::Visual (QWORD qTimeStamp, SCHAR cIPAPhoneme,
				SCHAR cEnginePhoneme, DWORD dwHints, PTTSMOUTH pTTSMouth)
{
	ASSERT(gpEng);
	if( gpEng->Not.bVisual )
	{
		TCHAR  buf[256];
		_stprintf( buf, TEXT("\r\nVisual qTimeStamp: %0I64x\r\n"), qTimeStamp );
		NotifyOutput( buf );
	}

   return NOERROR;
}

void CloneAndTest(PITTSENUM pTTSEnum)
{
	TTSMODEINFO aTTSInfo[MAX_ENUMMODES];
	HRESULT     hRes = S_OK;
	DWORD       dwNumTimes,i;
	TCHAR       szStr[256],szMfg[40],szName[80];
	int j=0;
	int nskip = 3;
	while (hRes == S_OK)
	{
		// enumerate 2 items
		hRes = pTTSEnum->Next (2, aTTSInfo, &dwNumTimes);
		_stprintf (szStr, TEXT("  %d mode(s) found:\r\n"), (int) dwNumTimes);
		MainOutput (szStr);
		for (i = 0; i < dwNumTimes; i++, j++)
		{
			S2ACVTEX(szName, aTTSInfo[j].szModeName, APPMAXSTRLEN(szName) + 1)
			S2ACVTEX(szMfg, aTTSInfo[j].szMfgName, APPMAXSTRLEN(szMfg) + 1)
			_stprintf( szStr, TEXT("    Mode %2d = %s, %s\r\n"), j+1, szMfg, szName );
			MainOutput (szStr);
		}

		if(SUCCEEDED(hRes))
		{
		// skip nskip
		j += nskip;
		hRes = pTTSEnum->Skip( nskip );
		if( FAILED(hRes) )
			MainOutput (TEXT("  Enum->Skip() FAILED().\r\n"));
		else
			MainOutput (TEXT("  Enum->Skip() SUCCEEDED().\r\n"));
		}
	}
}

/*************************************************************************
BUGBUG: fix comments...
EnumModes - Enumerates the engine modes and fills the TTSMODEINFO array
            pointed to by aTTSInfo. It:
      - Create enuemerator object
      - enumerates 10 modes (at once), displaying results
      - Reset
      - Enum 2 modes
      - Skip 1 mode
      - Repeat above two steps until no more modes
      - Free enumerator

inputs  - Holder for TTSMODEINFO structure array
*/
DWORD CTTStstDlg::EnumModes( PTTSMODEINFO aTTSInfo, int maxnmodes )
{
	PITTSENUM   pClone1, pClone2;
	HRESULT     hRes;
	DWORD       dwTotalModes,dwNumTimes,i;
	TCHAR       szStr[256];

	// create an enumerator object
	hRes = gpITTSEnum->Clone (&pClone1);
	if( FAILED(hRes) )
	{
		MessageBox (TEXT("Couldn't clone ITTSEnum state, aborting enumeration test"), TEXT("Error"), MB_OK );
		return 0;
	}

	// enumerate up to maxnmodes modes and stuff into global aTTSInfo array...
	hRes = pClone1->Next (maxnmodes, aTTSInfo, &dwNumTimes);
	_stprintf (szStr, TEXT("  %d mode(s) found:\r\n"), (int) dwNumTimes);
	MainOutput (szStr);
	if( dwNumTimes == 0 ) return 0;

	for (i = 0; i < dwNumTimes; i++)
	{
		DisplayModeInfo( &aTTSInfo[i] );
	}

	dwTotalModes = dwNumTimes;	 // remember the total number of modes

	// reset
	if( FAILED((hRes = pClone1->Reset())) )
	{
		MainOutput (TEXT("Enum->Reset() failed.\r\n"));
		pClone1->Release();
		return dwTotalModes;
	}

	// clone it and test the clone...
	if( FAILED((hRes=pClone1->Clone (&pClone2))) )
	{
		MainOutput (TEXT("Enum->Clone() failed.\r\n"));
		pClone2 = NULL;
	}
	else
	{
	 	CloneAndTest(pClone2);
	}



	if( pClone2 ) if( pClone2->Release() ) MainOutput (TEXT("pClone2->Release() failed.\r\n"));

	// free the enumerator
	if( pClone1->Release() ) MainOutput (TEXT("Enum->Release() failed.\r\n"));

	return dwTotalModes;
}

/* Find the given mode.  return 0 for success, -1 for failure.
*/
int CAddEngMode::FindMode( PTTSMODEINFO pTTSInfo, PTTSMODEINFO ttsResult )
{
	PITTSFIND	pITTSFind;
	HRESULT		hRes;

	hRes = gpITTSEnum->QueryInterface(IID_ITTSFind, (void**)&pITTSFind);
	if (hRes) return -1;

	// Display the mode we'll be trying to match...
//	MainOutput(TEXT("\r\nMatching this mode...\r\n"));
//	DisplayModeInfo( pTTSInfo );

	hRes = pITTSFind->Find(pTTSInfo, NULL, ttsResult);
	if (hRes)
	{
		pITTSFind->Release();
		MainOutput(TEXT("No matching modes found.\r\n"));
		return -1;
	}

	// Display the mode that was found...
//	MainOutput(TEXT("\r\nFound matching mode:\r\n"));
//	DisplayModeInfo( ttsResult );

	pITTSFind->Release();

	return 0;
}

/* Select mode */
DWORD CAddEngMode::SelectMode( PTTSMODEINFO pttsResult )
{
	HRESULT		hRes;
	PIAUDIOMULTIMEDIADEVICE	pIMMD;

	if (gpITTSCentral)
	{
		MainOutput (TEXT("\r\nSpeech recognition engine is already open.\r\n"));
		return 0;
	}

	hRes = CoCreateInstance (CLSID_MMAudioDest, NULL, CLSCTX_ALL, IID_IAudioMultiMediaDevice, (void**)&pIMMD);
	if (hRes) return 0;

	pIMMD->DeviceNumSet(m_DeviceID.GetCurSel() - 1);

   // addref here, because we need to free later. Without this
   // some TTS engines leak audio objects
   gpIUnkAudio = pIMMD;
   gpIUnkAudio->AddRef();

	// Select now...
	hRes = gpITTSEnum->Select(pttsResult->gModeID, &gpITTSCentral, (LPUNKNOWN) pIMMD);

	if (SUCCEEDED(hRes))
	{
		hRes = gpITTSCentral->QueryInterface (IID_ITTSAttributes, (void**)&gpITTSAttributes);
		if( FAILED(hRes) )
			MainOutput (TEXT("\r\nError getting IID_ITTSAttributes interface.\r\n"));
			// BUGBUG: Should clean up and fail SelectMode here

		hRes = gpITTSCentral->QueryInterface (IID_ITTSDialogs, (void**)&gpITTSDialogs);
		if( FAILED(hRes) )
			MainOutput (TEXT("\r\nError getting IID_ITTSDialogs interface.\r\n"));
			// BUGBUG: Should clean up and fail SelectMode here

		hRes = gpITTSCentral->QueryInterface (IID_ILexPronounce, (void**)&gpILexPronounce);
		if( FAILED(hRes) )
			MainOutput (TEXT("\r\nError getting IID_ILexPronounce interface.\r\n"));
			// BUGBUG: Should clean up and fail SelectMode here
	}
	else
	{
		TCHAR buf[256];
		_stprintf(buf, TEXT("\r\nITTSEnum::Select() failed with HRESULT=%lX!\r\n"), (DWORD) hRes); 
	 	MainOutput(buf);

		if (gpITTSCentral != NULL)
		{
			MainOutput (TEXT("\r\nITTSEnum::Select() failed but didn't set gpITTSCentral == NULL.\r\n"));
		}
	}

#ifdef WILLOWPOND
	// tek 26sep96 attempt unlock, if supported..
	if (gpITTSCentral != NULL)
	{
		PCEngUnlock peuFoo=NULL;
		hRes = gpITTSCentral->QueryInterface(IID_IDECUnlockEng, (void **)&peuFoo);
		if (FAILED(hRes))
		{ // not a DEC locked engine
			MainOutput(TEXT("\r\n this is not a locked engine\n"));
		}
		else
		{ // DEC locked engine; unlock.
			hRes = peuFoo->Unlock(RTLICENSEKEY);
			if (FAILED(hRes))
			{
				MainOutput(TEXT("\r\n failed to unlock engine.\n"));
			}
			else
			{
				MainOutput(TEXT("\r\n engine unlocked!\n"));
			}
			// free the interface
			peuFoo->Release();
		}
	}// end of dec unlocking..

#endif // WILLOWPOND

	return (DWORD)gpITTSCentral;
}


void MainOutput(LPCTSTR str)
{
	((CTTStstDlg *)((CTTStstApp *)AfxGetApp())->m_pMainWnd)->MainOutput(str);
}

void DisplayModeInfo( PTTSMODEINFO pTTSInfo )
{
	TCHAR szTemp[80];
	TCHAR str[128];

	MainOutput(TEXT("\r\nMode info follows:\r\n"));
	S2ACVTEX(szTemp, pTTSInfo->szMfgName, APPMAXSTRLEN(szTemp) + 1)
	_stprintf( str, TEXT("  Mfg = %s\r\n"), szTemp );
	MainOutput(str);
	S2ACVTEX(szTemp, pTTSInfo->szModeName, APPMAXSTRLEN(szTemp) + 1)
	_stprintf( str, TEXT("  ModeName = %s\r\n"), szTemp );
	MainOutput(str);
	S2ACVTEX(szTemp, pTTSInfo->szProductName, APPMAXSTRLEN(szTemp) + 1)
	_stprintf( str, TEXT("  ProductName = %s\r\n"), szTemp );
	MainOutput(str);
	_stprintf( str, TEXT("  LangID = %4x\r\n"), pTTSInfo->language.LanguageID );
	MainOutput(str);
	_stprintf( str, TEXT("  gModeID (GUID) = %x %x %x %x%x%x%x%x%x%x%x\r\n"),
		pTTSInfo->gModeID.Data1,pTTSInfo->gModeID.Data2,pTTSInfo->gModeID.Data3,
		pTTSInfo->gModeID.Data4[0],pTTSInfo->gModeID.Data4[1],
		pTTSInfo->gModeID.Data4[2],pTTSInfo->gModeID.Data4[3],
		pTTSInfo->gModeID.Data4[4],pTTSInfo->gModeID.Data4[5],
		pTTSInfo->gModeID.Data4[6],pTTSInfo->gModeID.Data4[7]);
	MainOutput(str);
}

/*************************************************************************
CTestBufNotify - Notification object.
*/
CTestBufNotify::CTestBufNotify (void)
{
// this space intentionally left blank
}

CTestBufNotify::~CTestBufNotify (void)
{
// this space intentionally left blank
}

STDMETHODIMP CTestBufNotify::QueryInterface (REFIID riid, LPVOID *ppv)
{
	*ppv = NULL;

	/* always return our IUnknown for IID_IUnknown */
	if (IsEqualIID (riid, IID_IUnknown) || IsEqualIID(riid,IID_ITTSBufNotifySink))
	{
		*ppv = (LPVOID) this;
		return S_OK;
	}

	// otherwise, cant find
	return ResultFromScode (E_NOINTERFACE);
}

STDMETHODIMP_ (ULONG) CTestBufNotify::AddRef (void)
{
	// normally this increases a reference count, but this object
	// is going to be freed as soon as the app is freed, so it doesn't
	// matter
	return 1;
}

STDMETHODIMP_(ULONG) CTestBufNotify::Release (void)
{
	// normally this releases a reference count, but this object
	// is going to be freed when the application is freed so it doesnt
	// matter
	return 1;
}

void CTestBufNotify::NotifyOutput( const TCHAR *str )
{
	CTTStstDlg *dlgtmp = (CTTStstDlg *)AfxGetApp()->m_pMainWnd;
	CTabITTSNotify *tabtmp = &(dlgtmp->m_Notify);

	tabtmp->Output(str);
}

STDMETHODIMP CTestBufNotify::BookMark (QWORD qTimeStamp, DWORD dwMarkNum)
{
	ASSERT(gpEng);
	if( gpEng->Not.bBookMark )
	{
		TCHAR  buf[256];
		_stprintf( buf, TEXT("\r\nBookMark: qTimeStamp=%0I64x, dwMarkNum=%0lx\r\n"), (QWORD) qTimeStamp, (DWORD) dwMarkNum);
		NotifyOutput( buf );
	}

   return NOERROR;
}

STDMETHODIMP CTestBufNotify::TextDataDone (QWORD qTimeStamp, DWORD dwFlags)
{
	ASSERT(gpEng);
	if( gpEng->Not.bTextDataDone )
	{
		TCHAR  buf[256];
		_stprintf( buf, TEXT("\r\nTextDataDone: qTimeStamp=%0I64x, dwFlags=%0lx\r\n"), (QWORD) qTimeStamp, (DWORD) dwFlags);
		NotifyOutput( buf );
	}

   return NOERROR;
}

STDMETHODIMP CTestBufNotify::TextDataStarted (QWORD qTimeStamp)
{
	ASSERT(gpEng);
	if( gpEng->Not.bTextDataStarted )
	{
		TCHAR  buf[256];
		_stprintf( buf, TEXT("\r\nTextDataStarted: qTimeStamp=%0I64x\r\n"), (QWORD) qTimeStamp);
		NotifyOutput( buf );
	}

   return NOERROR;
}

STDMETHODIMP CTestBufNotify::WordPosition (QWORD qTimeStamp, DWORD dwByteOffset)
{
	ASSERT(gpEng);
	if( gpEng->Not.bWordPosition )
	{
		TCHAR  buf[256];
		_stprintf( buf, TEXT("\r\nWordPosition: qTimeStamp=%0I64x, dwByteOffset=%0lx\r\n"), (QWORD) qTimeStamp, (DWORD) dwByteOffset);
		NotifyOutput( buf );
	}

   return NOERROR;
}
