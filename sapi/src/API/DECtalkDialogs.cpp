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
 * 002	tek		11sep98	add instance ofCDialogSpeak, and init it.
 */

// DECtalkDialogs.cpp : implementation file
//

#include "stdafx.h"
#include "dtlktts.h"
// the pages of the sheet..
#include "AboutDialog.h"
#include "GeneralDialog.h"
#include "LexiconDialog.h"
#include "TranslateDialog.h"

#include "DECtalkDialogs.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDECtalkDialogs

IMPLEMENT_DYNAMIC(CDECtalkDialogs, CPropertySheet)

CDECtalkDialogs::CDECtalkDialogs(CMode *pCMode, UINT nIDCaption, CWnd* pParentWnd, UINT iSelectPage)
	:CPropertySheet(nIDCaption, pParentWnd, iSelectPage)
{
	// initialize the CMode pointer within the dialog so that they can 
	// access their member variables..
	m_AboutDialog.SetCMode(pCMode);
	m_GeneralDialog.SetCMode(pCMode);
	m_TranslateDialog.SetCMode(pCMode);
	m_LexiconDialog.SetCMode(pCMode);
	// DialogSpeak needs to get at the synthesizer..
	m_DialogSpeak.SetCMode(pCMode);
	// tell the dialogs where to speak to..
	m_AboutDialog.SetSpeak(&m_DialogSpeak);
	m_GeneralDialog.SetSpeak(&m_DialogSpeak);
	m_TranslateDialog.SetSpeak(&m_DialogSpeak);
	m_LexiconDialog.SetSpeak(&m_DialogSpeak);
	AddPage(&m_AboutDialog);		
	AddPage(&m_GeneralDialog);		
	AddPage(&m_TranslateDialog);
	AddPage(&m_LexiconDialog);
}

CDECtalkDialogs::CDECtalkDialogs(CMode *pCMode, LPCTSTR pszCaption, CWnd* pParentWnd, UINT iSelectPage)
	:CPropertySheet(pszCaption, pParentWnd, iSelectPage)
{
	// initialize the CMode pointer within the dialog so that they can 
	// access their member variables..
	m_AboutDialog.SetCMode(pCMode);
	m_GeneralDialog.SetCMode(pCMode);
	m_TranslateDialog.SetCMode(pCMode);
	m_LexiconDialog.SetCMode(pCMode);	
	// DialogSpeak needs to get at the synthesizer..
	m_DialogSpeak.SetCMode(pCMode);
	// tell the dialogs where to speak to..
	m_AboutDialog.SetSpeak(&m_DialogSpeak);
	m_GeneralDialog.SetSpeak(&m_DialogSpeak);
	m_TranslateDialog.SetSpeak(&m_DialogSpeak);
	m_LexiconDialog.SetSpeak(&m_DialogSpeak);

	AddPage(&m_AboutDialog);		
	AddPage(&m_GeneralDialog);		
	AddPage(&m_TranslateDialog);
	AddPage(&m_LexiconDialog);
}

CDECtalkDialogs::~CDECtalkDialogs()
{
}


BEGIN_MESSAGE_MAP(CDECtalkDialogs, CPropertySheet)
	//{{AFX_MSG_MAP(CDECtalkDialogs)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDECtalkDialogs message handlers
