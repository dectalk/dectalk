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

/**********************************************************************/

/**********************************************************************/
/*    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001	tek		07/22/1998	Initial
 */// VoiceDef.h: interface for the CVoiceDef class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_VOICEDEF_H__FA344CC2_14EA_11D2_A42F_004005A17674__INCLUDED_)
#define AFX_VOICEDEF_H__FA344CC2_14EA_11D2_A42F_004005A17674__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "ttsapi.h" // where speaker defs live
#define VOICEDEF_VERSION	(2)			// for versioning support
#define VOICEDEF_COOKIE		(0xfeaa)	// try to avoid junk files


// class which contains the voice definition, and allows save/restore
class CVoiceDef : public CObject
{

public:
	// things we need to be a serializable class..
	DECLARE_SERIAL(CVoiceDef)
	CVoiceDef() {};
	void Serialize(CArchive& archive);
//	CRuntimeClass* GetRuntimeClass();


	// things we (sort of) need to get at the members..
	void GetVoice(SPDEFS *spVoice);
	void SetVoice(SPDEFS *spVoice);
	void SetName(CString& csName);
	void GetName(CString& csName);
	void SetLimits(SPDEFS *spVoiceLo, SPDEFS *spVoiceHi);
	void MessageBoxOK(void);

	// a handy constructor
	CVoiceDef(CString csName, 
		SPDEFS *pspDef, 
		SPDEFS *pspLoLimit,
		SPDEFS *pspHiLimit);


public:
	BOOL Load(LPCSTR lpszFilename);
	BOOL Store(LPCSTR lpszFilename);
	SPDEFS m_spVoice;				// the actual voice params
	SPDEFS m_spVoiceLowLimit, m_spVoiceHighLimit; // limiting values
	CString m_csVoiceName;			// The "name" of the voice
	CFileException m_cfeException;	// the exception from load/store, if any
	BOOL m_bMessageBoxOK;			// OK to pop up message boxes



};

#endif // !defined(AFX_VOICEDEF_H__FA344CC2_14EA_11D2_A42F_004005A17674__INCLUDED_)
