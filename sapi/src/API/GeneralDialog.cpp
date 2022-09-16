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
 * 003	tek		11sep98		use DialogSpeak to speak text
 * 004	tek		14sep98		always StopSpeaking() before setting parameters
 */

// GeneralDialog.cpp : implementation file
//

#include "stdafx.h"
#include "dtlktts.h"
#include "GeneralDialog.h"
#include "VoiceDef.h"
#include "DialogSpeak.h"
#include "BufNotify.h" // so we can get progress from the synth..

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CGeneralDialog property page

IMPLEMENT_DYNCREATE(CGeneralDialog, CPropertyPage)

CGeneralDialog::CGeneralDialog() : CPropertyPage(CGeneralDialog::IDD)
{
	//{{AFX_DATA_INIT(CGeneralDialog)
	m_csEditBox = _T("");
	//}}AFX_DATA_INIT
}

CGeneralDialog::~CGeneralDialog()
{
}

// set the Mode pointer so we can touch the synthesizer
void CGeneralDialog::SetCMode (CMode *pCMode)
{
	m_pCMode = pCMode;
}

// set the test speak object
void CGeneralDialog::SetSpeak (CDialogSpeak *pDS)
{
	m_pCDialogSpeak = pDS;
}




void CGeneralDialog::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CGeneralDialog)
	DDX_Control(pDX, IDC_HEADSIZESLIDER, m_csHeadSize);
	DDX_Control(pDX, IDC_BREATHINESSSLIDER, m_csBreathiness);
	DDX_Control(pDX, IDC_LAXBREATHINESSSLIDER, m_csLaxBreathiness);
	DDX_Control(pDX, IDC_SMOOTHNESSSLIDER, m_csSmoothness);
	DDX_Control(pDX, IDC_RICHNESSSLIDER, m_csRichness);
	DDX_Control(pDX, IDC_NOPENFIXEDSLIDER, m_csNopenFixed);
	DDX_Control(pDX, IDC_LARYNGEALIZATIONSLIDER, m_csLaryngealization);
	DDX_Text(pDX, IDC_TESTTEXT, m_csEditBox);
	DDV_MaxChars(pDX, m_csEditBox, 1024);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CGeneralDialog, CPropertyPage)
	//{{AFX_MSG_MAP(CGeneralDialog)
	ON_WM_HSCROLL()
	ON_BN_CLICKED(IDC_TESTBUTTON, OnTestbutton)
	ON_BN_CLICKED(IDC_RESTOREDEFAULTSBUTTON, OnRestoredefaultsbutton)
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_SAVEBUTTON, OnSavebutton)
	ON_BN_CLICKED(IDC_LOADBUTTON, OnLoadbutton)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CGeneralDialog message handlers

BOOL CGeneralDialog::OnInitDialog() 
{
	CPropertyPage::OnInitDialog();
	
	// TODO: Add extra initialization here

	// tek 01jun98 load up the info from the synthesizer
	TextToSpeechSync(m_pCMode->m_pDECtalk); // required so proper speaker params will be
											// retrieved, JAW 6/26/98
	MMRESULT mmRes = TextToSpeechGetSpeakerParams(m_pCMode->m_pDECtalk,
		0,	// what is the index?
		&m_pspCur,
		&m_pspLo,
		&m_pspHi,
		&m_pspDefault);
	if (mmRes)
	{
		// oops, error..
		m_pspCur=m_pspLo=m_pspHi=m_pspDefault=NULL;
		return TRUE;
	}
	// copy the original params into a temp so that we can cancel later
	m_pspCancel = (SPDEFS *)malloc(sizeof(SPDEFS));
	if (!m_pspCancel)
	{
		// failed. Free the other memeory and punt
		CoTaskMemFree(m_pspCur);
		CoTaskMemFree(m_pspLo);
		CoTaskMemFree(m_pspHi);
		CoTaskMemFree(m_pspDefault);
		m_pspCur=m_pspLo=m_pspHi=m_pspDefault=NULL;
		return TRUE;
	}

	memcpy(m_pspCancel, m_pspCur, sizeof(SPDEFS));

	m_csHeadSize.SetRange(m_pspLo->head_size, m_pspHi->head_size); // set the range
	m_csBreathiness.SetRange(m_pspLo->breathiness, m_pspHi->breathiness); // set the range
	m_csLaxBreathiness.SetRange(m_pspLo->lax_breathiness, m_pspHi->lax_breathiness); // set the range
	m_csSmoothness.SetRange(m_pspLo->smoothness, m_pspHi->smoothness); // set the range
	m_csRichness.SetRange(m_pspLo->richness, m_pspHi->richness); // set the range
	m_csNopenFixed.SetRange(m_pspLo->num_fixed_samp_og, m_pspHi->num_fixed_samp_og); // set the range
	m_csLaryngealization.SetRange(m_pspLo->laryngealization, m_pspHi->laryngealization); // set the range

	UpdateSliders();

	// set the default edit text
	CString csText = "This is a test of the current synthesis parameters.";
	SetDlgItemText(IDC_TESTTEXT,csText);
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CGeneralDialog::UpdateSliders()
{
	m_csHeadSize.SetPos(m_pspCur->head_size);
	CString csText;
	csText.Format("%d",(int)m_csHeadSize.GetPos());
	SetDlgItemText(IDC_HEADSIZEVALUE,csText);

	m_csBreathiness.SetPos(m_pspCur->breathiness);
	csText.Format("%d",(int)m_csBreathiness.GetPos());
	SetDlgItemText(IDC_BREATHINESSVALUE,csText);

	m_csLaxBreathiness.SetPos(m_pspCur->lax_breathiness);
	csText.Format("%d",(int)m_csLaxBreathiness.GetPos());
	SetDlgItemText(IDC_LAXBREATHINESSVALUE,csText);

	m_csSmoothness.SetPos(m_pspCur->smoothness);
	csText.Format("%d",(int)m_csSmoothness.GetPos());
	SetDlgItemText(IDC_SMOOTHNESSVALUE,csText);

	m_csRichness.SetPos(m_pspCur->richness);
	csText.Format("%d",(int)m_csRichness.GetPos());
	SetDlgItemText(IDC_RICHNESSVALUE,csText);

	m_csNopenFixed.SetPos(m_pspCur->num_fixed_samp_og);
	csText.Format("%d",(int)m_csNopenFixed.GetPos());
	SetDlgItemText(IDC_NOPENFIXEDVALUE,csText);

	m_csLaryngealization.SetPos(m_pspCur->laryngealization);
	csText.Format("%d",(int)m_csLaryngealization.GetPos());
	SetDlgItemText(IDC_LARYNGEALIZATIONVALUE,csText);
}

void CGeneralDialog::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
	// TODO: Add your message handler code here and/or call default
	// tek update the label on the slider..
	CString csText;
	csText.Format("%d",(int)m_csHeadSize.GetPos());
	SetDlgItemText(IDC_HEADSIZEVALUE,csText);
	// keep track..
	m_pspCur->head_size = m_csHeadSize.GetPos();

	csText.Format("%d",(int)m_csBreathiness.GetPos());
	SetDlgItemText(IDC_BREATHINESSVALUE,csText);
	// keep track..
	m_pspCur->breathiness = m_csBreathiness.GetPos();

	csText.Format("%d",(int)m_csLaxBreathiness.GetPos());
	SetDlgItemText(IDC_LAXBREATHINESSVALUE,csText);
	// keep track..
	m_pspCur->lax_breathiness = m_csLaxBreathiness.GetPos();

	csText.Format("%d",(int)m_csSmoothness.GetPos());
	SetDlgItemText(IDC_SMOOTHNESSVALUE,csText);
	// keep track..
	m_pspCur->smoothness = m_csSmoothness.GetPos();

	csText.Format("%d",(int)m_csRichness.GetPos());
	SetDlgItemText(IDC_RICHNESSVALUE,csText);
	// keep track..
	m_pspCur->richness = m_csRichness.GetPos();

	csText.Format("%d",(int)m_csNopenFixed.GetPos());
	SetDlgItemText(IDC_NOPENFIXEDVALUE,csText);
	// keep track..
	m_pspCur->num_fixed_samp_og = m_csNopenFixed.GetPos();

	csText.Format("%d",(int)m_csLaryngealization.GetPos());
	SetDlgItemText(IDC_LARYNGEALIZATIONVALUE,csText);
	// keep track..
	m_pspCur->laryngealization = m_csLaryngealization.GetPos();

	CPropertyPage::OnHScroll(nSBCode, nPos, pScrollBar);
}

void CGeneralDialog::OnTestbutton() 
{
	// TODO: Add your control notification handler code here

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CGeneralDialog::OnTestbutton at %lu\n",timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //_DEBUG
	// TODO: Add your specialized code here and/or call the base class

	// kill any prior text

	m_pCDialogSpeak->StopSpeaking();
	// tek load the new params into the synthesizer..
	TextToSpeechSetSpeakerParams(m_pCMode->m_pDECtalk,
							m_pspCur);
	// say the test text

	UpdateData(); // get the edit box contents..
	
	HRESULT hRes=0;

	CString csText=m_csEditBox;	// the text buffer is in the member
								// struct so it stays around..


	m_pCDialogSpeak->Speak (csText);

}

void CGeneralDialog::OnRestoredefaultsbutton()
{
	memcpy(m_pspCur, m_pspDefault, sizeof(SPDEFS));
	UpdateSliders();
}

void CGeneralDialog::OnCancel() 
{
	// TODO: Add your specialized code here and/or call the base class
	// kill any prior text
	m_pCDialogSpeak->StopSpeaking();	
	// tek load the defaults we saved, and then free up memory.
	TextToSpeechSetSpeakerParams(m_pCMode->m_pDECtalk,
		m_pspCancel);		
	free(m_pspCancel);
	CoTaskMemFree(m_pspCur);
	CoTaskMemFree(m_pspLo);
	CoTaskMemFree(m_pspHi);
	CoTaskMemFree(m_pspDefault);
	CPropertyPage::OnCancel();
}

BOOL CGeneralDialog::OnApply() 
{

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CGeneralDialog::OnApply at %lu\n",timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //_DEBUG
	// TODO: Add your specialized code here and/or call the base class
	// this is just like "test", without sending text.
	// Once we do this, though, we need to update the "cancel"
	// params and use them for "close", and convert the "cancel"
	// button to a "close" button.
	// kill any prior text
	m_pCDialogSpeak->StopSpeaking();	
	// tek load the new params into the synthesizer..
	TextToSpeechSetSpeakerParams(m_pCMode->m_pDECtalk,
							m_pspCur);	
	// copy the params as they stand..
	memcpy(m_pspCancel, m_pspCur, sizeof(SPDEFS));
	//remove "cancel"
	CancelToClose();

	return CPropertyPage::OnApply();
}

void CGeneralDialog::OnOK() 
{

#ifdef _DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CGeneralDialog::OnOK at %lu\n",timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //_DEBUG
	// TODO: Add your specialized code here and/or call the base class
	// set the params as they now stand
	// stop any speech going out..
	m_pCDialogSpeak->StopSpeaking();
	// set the new params..
	TextToSpeechSetSpeakerParams(m_pCMode->m_pDECtalk,
		m_pspCur);	
	// free up memory..
	free(m_pspCancel);
	CoTaskMemFree(m_pspCur);
	CoTaskMemFree(m_pspLo);
	CoTaskMemFree(m_pspHi);
	CoTaskMemFree(m_pspDefault);	
	CPropertyPage::OnOK();
}

void CGeneralDialog::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	// tek load the defaults we saved, and then free up memory.
	TextToSpeechSetSpeakerParams(m_pCMode->m_pDECtalk,
		m_pspCancel);
	free(m_pspCancel);		
	CoTaskMemFree(m_pspCur);
	CoTaskMemFree(m_pspLo);
	CoTaskMemFree(m_pspHi);
	CoTaskMemFree(m_pspDefault);
	
	CPropertyPage::OnClose();
}

void CGeneralDialog::OnSavebutton() 
{
	// TODO: Add your control notification handler code here
	CVoiceDef cvdActive("",m_pspCur,m_pspLo,m_pspHi);		// the name isn't used yet, so 
															// just leave it blank.
	// we're within a dialog, so it's OK to pop message boxes
	cvdActive.MessageBoxOK();

	// get a file..
	CFileDialog cfdFileDialog(	FALSE,		// save as
								"vdf",		// default extension
								NULL,		// no default name
								OFN_CREATEPROMPT  |
								OFN_OVERWRITEPROMPT |
								OFN_HIDEREADONLY,
								"Voice Definitions (*.vdf)|*.vdf|All Files (*.*)|*.*||",
								this);
	if (IDOK == cfdFileDialog.DoModal())
	{
		
		
		
		if (!cvdActive.Store(cfdFileDialog.GetPathName()))
		{
			if (CFileException::none == cvdActive.m_cfeException.m_cause)
			{
				// must have been a serialization error
				MessageBox("Save error:\nCould not write data");
			}
			else
			{
				TCHAR szErrMsg[256]="";
				CString csError = "Could not save file!\n";
				cvdActive.m_cfeException.GetErrorMessage(szErrMsg, 255);
				csError += szErrMsg;
				MessageBox(csError);
			}
		}
	}
	
}

void CGeneralDialog::OnLoadbutton() 
{
	// TODO: Add your control notification handler code here
	// fill it with the current def, in case of failure
	CVoiceDef cvdActive("",m_pspCur,m_pspLo,m_pspHi);
	// message box on error is OK here
	cvdActive.MessageBoxOK();

	// get a file..
	CFileDialog cfdFileDialog(	TRUE,		// open
								"vdf",		// default extension
								NULL,		// no default name
								OFN_FILEMUSTEXIST,
								"Voice Definitions (*.vdf)|*.vdf|All Files (*.*)|*.*||",
								this);
	if (IDOK == cfdFileDialog.DoModal())
	{
		
		
		
		if (!cvdActive.Load(cfdFileDialog.GetPathName()))
		{
			if (CFileException::none == cvdActive.m_cfeException.m_cause)
			{
				// must have been a serialization error
				MessageBox("Load error:\nFile format may be invalid");
			}
			else
			{
				TCHAR szErrMsg[256]="";
				CString csError = "Could not open file!\n";
				cvdActive.m_cfeException.GetErrorMessage(szErrMsg, 255);
				csError += szErrMsg;
				MessageBox(csError);
			}
		}
	}
	
	// now, put that set of params back into the "current" params
	cvdActive.GetVoice(m_pspCur);
	// and set the sliders to match
	UpdateSliders();
	
	
}
