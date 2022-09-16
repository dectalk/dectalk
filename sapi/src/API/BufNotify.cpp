/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1998                 */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of Digital Equipment         */
/*  Corporation. Possession, use, duplication or dissemination of     */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from Digital Equipment Corporation.               */
/*                                                                    */
/*  The name of Digital Equipment Corporation may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      */
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        */
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        */
/*  FOR A PARTICULAR PURPOSE.                                         */
/*  Digital assumes no responsibility AT ALL for the use or           */
/*  reliability of this software.                                     */
/*                                                                    */
/*                                                                    */
/* +----------------------------------------------------------------+ */
/* | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS       | */
/* | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)       | */
/* | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.| */
/* |                                                                | */
/* +----------------------------------------------------------------+ */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/*    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001	JAW		07/17/1998	Added copyright notice.
 * 002	tek		11sep98		additional debugging, change destruction behavior
 * 003	tek		11sep98		complete changes from 002
 * 004	tek		30sep98		correct reference behavior in CTestBufNotify
 */

/*************************************************************************
CTestBufNotify - Notification object.
This is a shell, modified to do exactly what we need to do and nothing more.

Now should be created with new, and will destroy itself when all refs are released.

*/

#include "stdafx.h"
#include <assert.h>
#include "BufNotify.h"


// tek 09sep98 some debugging stuff..
#ifdef _DEBUG
extern "C" {
extern FILE *fpODS_File;
} // extern "C"
#undef OutputDebugString
#define OutputDebugString(x) {\
	if (!(fpODS_File)) \
		fpODS_File = fopen("bnlog.log","w"); \
	fprintf(fpODS_File,"%s",x); \
  } \

#define ODSFlush()
#else //_DEBUG
#undef OutputDebugString
#define OutputDebugString(x)
#define ODSFlush()
#endif //DEBUG

CTestBufNotify::CTestBufNotify (void)
{
// this space intentionally left blank

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CTestBufNotify (%08lx) constructor at %lu\n",
			this,timeGetTime());
	OutputDebugString(szTemp);
	ODSFlush();
	}
#endif //_DEBUG	
	m_dwRefCount=0; // tek 16mar98
	m_dwLastWordpos = 999999; // tek 03jun98
	m_dwLastBookmark = 999999; // tek 03jun98
	m_bDone=FALSE; // not even started, never mind done!
}

CTestBufNotify::~CTestBufNotify (void)
{
// this space intentionally left blank

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CTestBufNotify (%08lx) destructor at %lu\n",
			this,timeGetTime());
	OutputDebugString(szTemp);
	ODSFlush();
	}
#endif //_DEBUG	

	assert(m_dwRefCount==0); // should always be zero if we're destryoing..
	
}

STDMETHODIMP CTestBufNotify::QueryInterface (REFIID riid, LPVOID *ppv)
{
	*ppv = NULL;

	/* always return our IUnknown for IID_IUnknown */
	if (
		   IsEqualIID (riid, IID_IUnknown) 
		|| IsEqualIID(riid,IID_ITTSBufNotifySink)
		)
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
	m_dwRefCount++;
#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"BufNotify (%08lx) AddRef; now %d\n",
			this, m_dwRefCount);
		OutputDebugString(szTemp);
	}
#endif //_DEBUG


	return 1;
}

STDMETHODIMP_(ULONG) CTestBufNotify::Release (void)
{
	// teh 17sep98 correct the return value
	ULONG ulRefCount;
	// normally this releases a reference count, but this object
	// is going to be freed when the application is freed so it doesnt
	// matter
	m_dwRefCount--;

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"BufNotify (%08lx) Release; now %d\n",
			this, m_dwRefCount);
		OutputDebugString(szTemp);
	}
#endif //_DEBUG

	// if this is the last ref, commit suicide.
	ulRefCount = m_dwRefCount;
	if (m_dwRefCount == 0)
		delete this;


	return ulRefCount;
}


STDMETHODIMP CTestBufNotify::BookMark (QWORD qTimeStamp, DWORD dwMarkNum)
{

	m_dwLastBookmark = dwMarkNum;

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"BufNotify (%08lx) BookMark %ld at %lu\n",
			this, m_dwLastBookmark,timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //_DEBUG
   return NOERROR;
}

STDMETHODIMP CTestBufNotify::TextDataDone (QWORD qTimeStamp, DWORD dwFlags)
{

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"BufNotify (%08lx) TextDataDone (flags=%08lx) at %lu\n",
			this, dwFlags, timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //_DEBUG
	if (m_bDone)
	{
		char szTemp[256];
		sprintf(szTemp,"BufNotify (%08lx) ?? TextDataDone when already done ?? at %lu\n",
			this, timeGetTime());
		OutputDebugString(szTemp);
	}

	m_bDone = TRUE; // done with the buffer.

   return NOERROR;
}

STDMETHODIMP CTestBufNotify::TextDataStarted (QWORD qTimeStamp)
{


#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"BufNotify (%08lx) TextDataStarted at %lu\n",
			this, timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //_DEBUG

	if (m_bDone)
	{
		char szTemp[256];
		sprintf(szTemp,"BufNotify (%08lx) ?? TextDataStarted when already done ?? at %lu\n",
			this, timeGetTime());
		OutputDebugString(szTemp);
	}

   return NOERROR;
}

STDMETHODIMP CTestBufNotify::WordPosition (QWORD qTimeStamp, DWORD dwByteOffset)
{

	m_dwLastWordpos = dwByteOffset;

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"BufNotify (%08lx) WordPosition %ld at %lu\n",
			this, dwByteOffset,timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //_DEBUG

	if (m_bDone)
	{
		char szTemp[256];
		sprintf(szTemp,"BufNotify (%08lx) ?? WordPosition when already done ?? at %lu\n",
			this, timeGetTime());
		OutputDebugString(szTemp);
	}
	return NOERROR;

}

// tek 03jun98 the special routines we need..

HRESULT CTestBufNotify::GetLastBookmark(DWORD *dwBookMark)
{
	// returns E_ABORT if the buffer is complete 

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CTestBufNotify (%08lx) GetLastBookmark [%lu] at %lu\n",
			this, m_dwLastBookmark,timeGetTime());
	OutputDebugString(szTemp);
	}
#endif //_DEBUG	
	
	*dwBookMark = m_dwLastBookmark;

	if (m_bDone)
		return E_ABORT;

	return NOERROR;
}

void CTestBufNotify::SetLastBookmark(DWORD dwVal) // for initialization
{
	m_dwLastBookmark = dwVal;
}


DWORD CTestBufNotify::GetLastWordpos(DWORD *dwPos)
{
	*dwPos = m_dwLastWordpos;

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CTestBufNotify (%08lx) GetLastWordpos [%lu] at %lu\n",
			this, m_dwLastBookmark,timeGetTime());
	OutputDebugString(szTemp);
	}
#endif //_DEBUG	
	if (m_bDone)
		return E_ABORT;
	return NOERROR;


}

void CTestBufNotify::SetLastWordpos(DWORD dwVal) // for initialization
{
	m_dwLastWordpos = dwVal;
}

DWORD CTestBufNotify::GetRefCount()
{
	return m_dwRefCount;
}
