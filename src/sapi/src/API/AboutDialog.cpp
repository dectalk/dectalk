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
 * 002	tek		11sep98	initialize DialogSpeak pointer
 */

// AboutDialog.cpp : implementation file
//

#include "stdafx.h"
#include "dtlktts.h"
#include "coop.h" // for the version info..
#include "AboutDialog.h"

#ifdef M_DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDialog property page

IMPLEMENT_DYNCREATE(CAboutDialog, CPropertyPage)

CAboutDialog::CAboutDialog() : CPropertyPage(CAboutDialog::IDD)
{
	//{{AFX_DATA_INIT(CAboutDialog)
	m_csAboutInfoText = _T("");
	//}}AFX_DATA_INIT
}

CAboutDialog::~CAboutDialog()
{
}

void CAboutDialog::SetCMode(CMode *pCMode)
{
	m_pCMode = pCMode;

}

// set the test speak object
void CAboutDialog::SetSpeak (CDialogSpeak *pDS)
{
	m_pCDialogSpeak = pDS;
}




void CAboutDialog::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDialog)
	DDX_Text(pDX, IDC_ABOUTINFOTEXT, m_csAboutInfoText);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CAboutDialog, CPropertyPage)
	//{{AFX_MSG_MAP(CAboutDialog)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAboutDialog message handlers

BOOL CAboutDialog::OnInitDialog() 
{
	CPropertyPage::OnInitDialog();
	
	// what we do on initialization. Note that we have no m_pCMode yet!
	// set the text info in the dialog box..
	CString csText = "DECtalk Software Speech Synthesis\n";
	csText += "Copyright (c)1985-1998 Digital Equipment Corporation\n \n";
	csText += "Version Information:\n  ";
	csText += DTALK_STR_VERSION;
	csText += "\n  ";
	csText += __DATE__;

	m_csAboutInfoText = csText;

	// need to DODataExchange again to update the controls..
	UpdateData();


	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

BOOL CAboutDialog::Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext) 
{
	// what we do on initialization. Note that we have no m_pCMode yet!
	// set the text info in the dialog box..
	CString csText = "DECtalk Software Speech Synthesis\n";
	csText += "Copyright (c)1985-1998 Digital Equipment Corporation\n \n";
	csText += "Version Information:\n  ";
	csText += DTALK_STR_VERSION;
	csText += "\n  ";
	csText += __DATE__;

	m_csAboutInfoText = csText;	
	return CWnd::Create(lpszClassName, lpszWindowName, dwStyle, rect, pParentWnd, nID, pContext);
}
