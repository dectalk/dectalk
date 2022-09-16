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
 * 002	JAW		08/07/1998	Added all initial code to have a functional
 *							Lexicon Dialog Box.
 * 003	tek		11sep98	merge above and add DialogSpeak things
 */

#if !defined(AFX_LEXICONDIALOG_H__1B93E0F6_F639_11D1_A42E_004005362D44__INCLUDED_)
#define AFX_LEXICONDIALOG_H__1B93E0F6_F639_11D1_A42E_004005362D44__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// LexiconDialog.h : header file
//

#define MAX_ARPABET (512)	// this is hardcoded to ~255 in various parts of the
							// lts/ph code.


/////////////////////////////////////////////////////////////////////////////
// CLexiconDialog dialog

class CLexiconDialog : public CPropertyPage
{
	DECLARE_DYNCREATE(CLexiconDialog)

// Construction
public:
	CLexiconDialog();
	~CLexiconDialog();
	void SetCMode(CMode *pCMode);
	void SetSpeak(CDialogSpeak *pDlgSpeak);

// Dialog Data
protected:
	CMode *m_pCMode;
	CDialogSpeak *m_pCDialogSpeak;
	// tek create the arpabet table as a member variable of the 
	// class; this makes freeing it much easier than the original 
	// method of malloc in OnInitDialog.
	unsigned char m_cArpabet[MAX_ARPABET];

	int arpa_size;			// size of the arpabet table
	long num_entries, current_entry;
	long page_size; // number of entries to scroll when paging up/down on the entry scrollbar;
					// This is set to ceil(num_entries / 10) in OnInitDialog.

	//{{AFX_DATA(CLexiconDialog)
	enum { IDD = IDD_LEXICONDIALOG };
	CScrollBar m_csEntry; // entry scrollbar
	CEdit m_csGrapheme;   // grapheme edit box
	CEdit m_csPhoneme;    // phoneme edit box
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CLexiconDialog)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	void UpdateEntry();
	// Generated message map functions
	//{{AFX_MSG(CLexiconDialog)
	virtual BOOL OnInitDialog();
	afx_msg void OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg void OnTranslatebutton();
	afx_msg void OnClearbutton();
	afx_msg void OnPronouncebutton();
	afx_msg void OnAddbutton();
	afx_msg void OnDeletebutton();
	afx_msg void OnSavebutton();
	afx_msg void OnLoadbutton();
	afx_msg void OnDumpbutton();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LEXICONDIALOG_H__1B93E0F6_F639_11D1_A42E_004005362D44__INCLUDED_)
