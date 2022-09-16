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
 * 002	tek		11sep98		add CDialogSpeak
 */

#if !defined(AFX_DECTALKDIALOGS_H__1B93E0F8_F639_11D1_A42E_004005362D44__INCLUDED_)
#define AFX_DECTALKDIALOGS_H__1B93E0F8_F639_11D1_A42E_004005362D44__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DECtalkDialogs.h : header file
//

// the pages of the sheet..
#include "AboutDialog.h"
#include "GeneralDialog.h"
#include "LexiconDialog.h"
#include "TranslateDialog.h"

// the class that lets us speak without hanging the message pump..
#include "DialogSpeak.h"
/////////////////////////////////////////////////////////////////////////////
// CDECtalkDialogs

class CDECtalkDialogs : public CPropertySheet
{
	DECLARE_DYNAMIC(CDECtalkDialogs)

// Construction
public:
	CDECtalkDialogs(CMode *pCMode, UINT nIDCaption, CWnd* pParentWnd = NULL, UINT iSelectPage = 0);
	CDECtalkDialogs(CMode *pCMode, LPCTSTR pszCaption, CWnd* pParentWnd = NULL, UINT iSelectPage = 0);

// Attributes
public:
	CDialogSpeak		m_DialogSpeak;
	// these dialogs are created inside the constructor so that we can
	// pass along some info..
	CAboutDialog		m_AboutDialog;
	CGeneralDialog		m_GeneralDialog;
	CLexiconDialog		m_LexiconDialog;
	CTranslateDialog	m_TranslateDialog;


// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDECtalkDialogs)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CDECtalkDialogs();

	// Generated message map functions
protected:
	//{{AFX_MSG(CDECtalkDialogs)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DECTALKDIALOGS_H__1B93E0F8_F639_11D1_A42E_004005362D44__INCLUDED_)
