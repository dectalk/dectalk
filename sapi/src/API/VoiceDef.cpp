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
// This file contains the CVoiceDef class, which is used (at least) to
// save and load Speaker Definitions.
// Interesting functions are:
//
//	CVoiceDef(CString csName, 
//		SPDEFS *pspDef, 
//		SPDEFS *pspLoLimit,
//		SPDEFS *pspHiLimit);
// the only constructor; builds a VoiceDef loaded with csName and 
// defaults from pspDef; sets the range-checking limits to pspLowLimit
// and pspHighLimit. (the "default" is provided so that the caller
// doesn't have to worry about deciding whether the load succeeded; 
// in the event of a failure, the result of GetVoice will just be what
// was passed in as default)
//
//	void GetVoice(SPDEFS *spVoice);
//	void SetVoice(SPDEFS *spVoice);
// These are used to Set the voice (for Save, or for updating the
// default), and to Get the voice (with the result of a Load)
//
//	void SetName(CString& csName);
//	void GetName(CString& csName);
// These Set and Get the "name" of the voice. The name is stored and
// retrieved, but isn't used for anything yet.
//
//	void SetLimits(SPDEFS *spVoiceLo, SPDEFS *spVoiceHi);
// Sets the low and high range limits. This is generally only used
// internally by the constructor, but if in the future it makes sense
// to have more than one set of limits depending on whatever, this is how
// you'd set them.
//
//	void MessageBoxOK(void);
// This tells the load/save code that it is OK to pop up a message box on failure. 
// This should be called immediately after construction if you are in the
// context of a dialog or some other situation where a user will be interacting
// directly with the application; you should NOT set this in cases such as
// handling an embedded "set voice" command (because you don't know that you
// have a user to click "OK").
//
//	BOOL Load(LPCSTR lpszFilename);
//	BOOL Store(LPCSTR lpszFilename);
// Loads the voice from the specified file, or stores it to the specified
// file. For predictable results, the filename should be fully qualified.
// returns TRUE if the load succeeded, or FALSE if not.
//
//
//
/**********************************************************************/

/**********************************************************************/
/*    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001	tek		07/22/1998	Initial
 */
// VoiceDef.cpp: implementation of the CVoiceDef class.
//
//////////////////////////////////////////////////////////////////////


#include "dtlktts.h"
#include "VoiceDef.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

// stuff for the CVoiceDef class..

IMPLEMENT_SERIAL (CVoiceDef, CObject, VOICEDEF_VERSION)

void CVoiceDef::Serialize (CArchive& ar)
{

	// if something goes wrong on a load, this will fail silently unless
	// m_bMessageBoxOK is set.
	UINT uiVersion=0;
	SPDEFS spTemp;	// we use this to verify that nothing is out of bounds

	// do the base class
	CObject::Serialize(ar);

	// and do our own thing
	// we serialize as raw untyped binary data, because SPDEFS doesn't
	// know how to write itself. This is probably not great, but it isn't
	// TERRIBLE either..

	if (ar.IsStoring())
	{

		// save the cookie and version
		int	iCookie = VOICEDEF_COOKIE;
		uiVersion = VOICEDEF_VERSION;
		ar << iCookie;
		ar << uiVersion;
		ar << m_csVoiceName;
		ar.Write(&m_spVoice,sizeof(m_spVoice));
	}
	else
	{
		// load it
		// check the cookie.
		int iCookie=0;
		ar >> iCookie;
		if (VOICEDEF_COOKIE != iCookie)
		{
			if (m_bMessageBoxOK)
				MessageBox(NULL, "File is not a voice definition!", NULL, MB_OK);
			return;
		}
		// check the version
		ar >> uiVersion;
		if (VOICEDEF_VERSION != uiVersion)
		{
			TCHAR szErr[256]="";
			CString csErrMsg = "Voice definition version mismatch\n";
			sprintf(szErr,"File is version %d, engine needs version %d",
				ar.GetObjectSchema(), VOICEDEF_VERSION);
			csErrMsg += szErr;
			if (m_bMessageBoxOK)
				MessageBox(NULL, csErrMsg, NULL, MB_OK);
			return;  // bail out, don't touch the params.
		}



		ar >> m_csVoiceName;
		ar.Read(&spTemp,sizeof(m_spVoice));
		// check against limits, and copy into dest
		BOOL bIsOk=TRUE;
		short *psTemp = (short *)&spTemp;
		short *psLo = (short *)&m_spVoiceLowLimit;
		short *psHi = (short *)&m_spVoiceHighLimit;
		for (int iI=0;iI<(sizeof(SPDEFS)/sizeof(short));iI++)
		{
			if (  (psTemp[iI] < psLo[iI])
				||(psTemp[iI] > psHi[iI]) )
			{
				// bogus value
				bIsOk=FALSE;
				if (m_bMessageBoxOK)
					MessageBox(NULL, "File contains invalid parameter!", NULL, MB_OK);
				break;
			}
		}
		// if all OK, copy it.
		if (bIsOk)
		{
			memcpy(&m_spVoice,&spTemp,sizeof(m_spVoice));
		}


	}
}

void CVoiceDef::GetVoice(SPDEFS *spVoice)
{
	memcpy(spVoice, &m_spVoice, sizeof(m_spVoice));
}
void CVoiceDef::SetVoice(SPDEFS *spVoice)
{
	memcpy(&m_spVoice, spVoice, sizeof(m_spVoice));
}
void CVoiceDef::SetLimits(SPDEFS *spVoiceLow, SPDEFS *spVoiceHigh)
{
	memcpy(&m_spVoiceLowLimit, spVoiceLow, sizeof(m_spVoice));
	memcpy(&m_spVoiceHighLimit, spVoiceHigh, sizeof(m_spVoice));
}

void CVoiceDef::SetName(CString& csName)
{
	m_csVoiceName = csName;
}
void CVoiceDef::GetName(CString& csName)
{
	csName = m_csVoiceName;
}

void CVoiceDef::MessageBoxOK(void)
{
	m_bMessageBoxOK=TRUE;
}

CVoiceDef::CVoiceDef(CString csName, 
					 SPDEFS *pspDef,
					 SPDEFS *pspLo,
					 SPDEFS *pspHi)
{
	// messsage box isn't OK, by default
	m_bMessageBoxOK=FALSE;

	SetVoice(pspDef);
	SetName(csName);

	// set limits
	SetLimits(pspLo, pspHi);


}

BOOL CVoiceDef::Load(LPCSTR lpszFilename)
{

	// go open up the requested file, load it into the 
	// member voice def, and return TRUE if that all went well.
	BOOL bStatus=TRUE;
	CFile fTheFile;
	m_cfeException.m_cause=CFileException::none;
	// get a file

	if (!fTheFile.Open(lpszFilename,CFile::modeRead,&m_cfeException))
	{
#ifdef DEBUG
		afxDump << "File Open Error " << m_cfeException->m_cause <<"\n";
#endif //_DEBUG
		bStatus = FALSE;
	}


	if (!bStatus)
	{
		// open failed.
		return FALSE;
	}

	// make it an archive..
	CArchive ar(&fTheFile,CArchive::load);
	Serialize(ar);

	// close 'em up
	ar.Close();
	fTheFile.Close();
	return TRUE;
}

BOOL CVoiceDef::Store(LPCSTR lpszFilename)
{

	// go open up the requested file, load it into the 
	// member voice def, and return TRUE if that all went well.
	BOOL bStatus=TRUE;
	CFile fTheFile;
	m_cfeException.m_cause=CFileException::none;
	// get a file

	if (!fTheFile.Open(lpszFilename,CFile::modeWrite|CFile::modeCreate,&m_cfeException))
	{
#ifdef _DEBUG
		afxDump << "File Open Error " << m_cfeException.m_cause <<"\n";
#endif //_DEBUG
		bStatus = FALSE;
	}


	if (!bStatus)
	{
		// open failed.
		return FALSE;
	}

	// make it an archive..
	CArchive ar(&fTheFile,CArchive::store);
	Serialize(ar);

	// close 'em up
	ar.Close();
	fTheFile.Close();
	return TRUE;
}
