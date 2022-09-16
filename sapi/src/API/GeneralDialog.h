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
 * 002	tek		27jul1998	added save/restore of speakerdefs
 * 003	tek		11sep98	add support for DialogSpeak.
 */

#if !defined(AFX_GENERALDIALOG_H__1B93E0F5_F639_11D1_A42E_004005362D44__INCLUDED_)
#define AFX_GENERALDIALOG_H__1B93E0F5_F639_11D1_A42E_004005362D44__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// GeneralDialog.h : header file
//


/////////////////////////////////////////////////////////////////////////////
// CGeneralDialog dialog

class CGeneralDialog : public CPropertyPage
{
	DECLARE_DYNCREATE(CGeneralDialog)

// Construction
public:
	CGeneralDialog();
	~CGeneralDialog();
	void SetCMode(CMode *pcMode); // set the pointer to the synth object
	void SetSpeak(CDialogSpeak *pDlgSpeak);

	static UINT  SpeakTestText(LPVOID pvData); // speak the test text

// Dialog Data
protected:
	CMode *m_pCMode;

	CDialogSpeak *m_pCDialogSpeak;
	SPDEFS *m_pspCur, *m_pspLo, *m_pspHi, *m_pspDefault, *m_pspCancel;
	char m_szText[2049];	// must be big enough to hold the edit box contents

	//{{AFX_DATA(CGeneralDialog)
	enum { IDD = IDD_GENERALDIALOG };
	CSliderCtrl	m_csHeadSize;
	CSliderCtrl m_csBreathiness;
	CSliderCtrl m_csLaxBreathiness;
	CSliderCtrl m_csSmoothness;
	CSliderCtrl m_csRichness;
	CSliderCtrl m_csNopenFixed;
	CSliderCtrl m_csLaryngealization;
	CString	m_csEditBox;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CGeneralDialog)
	public:
	virtual void OnCancel();
	virtual BOOL OnApply();
	virtual void OnOK();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	void UpdateSliders();
	// Generated message map functions
	//{{AFX_MSG(CGeneralDialog)
	virtual BOOL OnInitDialog();
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg void OnTestbutton();
	afx_msg void OnRestoredefaultsbutton();
	afx_msg void OnClose();
	afx_msg void OnSavebutton();
	afx_msg void OnLoadbutton();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_GENERALDIALOG_H__1B93E0F5_F639_11D1_A42E_004005362D44__INCLUDED_)
