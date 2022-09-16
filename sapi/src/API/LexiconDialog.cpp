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
 * 002	JAW		08/07/1998  Added all initial code to have a functional
 *							Lexicon Dialog Box.
 * 003	tek		11sep98	merge 002, add DialogSpeak support
 * 004	tek		17sep98	complete 003				
 */

// LexiconDialog.cpp : implementation file
//

#include <fstream.h>
#include <math.h> // for ceil
#include <ctype.h> // for toupper
#include <assert.h>

#include "stdafx.h"
#include "dtlktts.h"
#include "LexiconDialog.h"
#include "DialogSpeak.h"

#define MAX_ARPABET (512)	// this is hardcoded to ~255 in various parts of the
							// lts/ph code.

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern "C"
{
	U32 TextToSpeechReserved3(LPTTS_HANDLE_T phTTS, int type,char *data,int max_size);
	void GetDictionaryNames( char *, char *, char * ); // to get the udic directory
}

/////////////////////////////////////////////////////////////////////////////
// CLexiconDialog property page

IMPLEMENT_DYNCREATE(CLexiconDialog, CPropertyPage)

CLexiconDialog::CLexiconDialog() : CPropertyPage(CLexiconDialog::IDD)
{
	//{{AFX_DATA_INIT(CLexiconDialog)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

CLexiconDialog::~CLexiconDialog()
{
}

void CLexiconDialog::SetCMode(CMode *pCMode)
{
	m_pCMode = pCMode;
}

// set the test speak object
void CLexiconDialog::SetSpeak (CDialogSpeak *pDS)
{
	m_pCDialogSpeak = pDS;
}




void CLexiconDialog::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLexiconDialog)
	DDX_Control(pDX, IDC_ENTRYSCROLLBAR, m_csEntry);
	DDX_Control(pDX, IDC_GRAPHEMEEDIT, m_csGrapheme);
	DDX_Control(pDX, IDC_PHONEMEEDIT, m_csPhoneme);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CLexiconDialog, CPropertyPage)
	//{{AFX_MSG_MAP(CLexiconDialog)
	ON_WM_VSCROLL()
	ON_BN_CLICKED(IDC_TRANSLATEBUTTON, OnTranslatebutton)
	ON_BN_CLICKED(IDC_CLEARBUTTON, OnClearbutton)
	ON_BN_CLICKED(IDC_PRONOUNCEBUTTON, OnPronouncebutton)
	ON_BN_CLICKED(IDC_ADDBUTTON, OnAddbutton)
	ON_BN_CLICKED(IDC_DELETEBUTTON, OnDeletebutton)
	ON_BN_CLICKED(IDC_SAVEBUTTON, OnSavebutton)
	ON_BN_CLICKED(IDC_LOADBUTTON, OnLoadbutton)
	ON_BN_CLICKED(IDC_DUMPBUTTON, OnDumpbutton)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLexiconDialog message handlers

// This function updates the grapheme and phoneme fields to reflect the current entry.
void CLexiconDialog::UpdateEntry()
{
	CString csText;
	char hold[253];

	if (num_entries != 0)
	{
		int phoneme_index = TextToSpeechReserved3(m_pCMode->m_pDECtalk, 6, hold, current_entry); // retrieve dictionary entry at current_entry
		csText.Format("%s", hold);
		m_csGrapheme.SetWindowText(csText);
		csText.Format("%s", hold + phoneme_index);
		m_csPhoneme.SetWindowText(csText);
	}
	else // num_entries == 0
	{
		csText = "";
		m_csGrapheme.SetWindowText(csText);
		m_csPhoneme.SetWindowText(csText);
	}
}

BOOL CLexiconDialog::OnInitDialog() 
{
	CPropertyPage::OnInitDialog();
	
	// load the arpabet table
	arpa_size = TextToSpeechReserved3(m_pCMode->m_pDECtalk, 1, NULL, 0);
	assert(arpa_size < (MAX_ARPABET/sizeof(char))); // make sure we're OK here.

	if (TextToSpeechReserved3(m_pCMode->m_pDECtalk, 2, (char *) m_cArpabet, arpa_size) < 0)
	{
	    MessageBox("Unable to retrieve phoneme table.", "Error", MB_ICONERROR);
		EndDialog(-1);
	}

	CString csText;
	num_entries = TextToSpeechReserved3(m_pCMode->m_pDECtalk, 5, NULL, 0); // retrieve the number of user dictionary entries
	page_size = (long) ceil((float) num_entries / 10);
	csText.Format("%d", num_entries);
	SetDlgItemText(IDC_NUMENTRIES, csText);

	current_entry = 0;
	UpdateEntry();

	m_csEntry.SetScrollRange(0, num_entries - 1);
	m_csEntry.SetScrollPos(0);

	m_csGrapheme.SetLimitText(126);
	m_csPhoneme.SetLimitText(252);

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CLexiconDialog::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
	switch (nSBCode)
	{
	case SB_TOP:
		current_entry = 0;
		break;
	case SB_BOTTOM:
		current_entry = num_entries - 1;
		break;
	case SB_LINEUP:
		current_entry--;
		if (current_entry < 0)
		{
			current_entry = 0;
			return;
		}
		break;
	case SB_LINEDOWN:
		current_entry++;
		if (current_entry > num_entries - 1)
		{
			current_entry = num_entries - 1;
			return;
		}
		break;
	case SB_PAGEUP:
		current_entry -= page_size;
		if (current_entry < 0)
			current_entry = 0;
		break;
	case SB_PAGEDOWN:
		current_entry += page_size;
		if (current_entry > num_entries - 1)
			current_entry = num_entries - 1;
		break;
	case SB_THUMBTRACK:
		current_entry = nPos;
		break;
	}
	m_csEntry.SetScrollPos(current_entry); // update the scroll box's position

	UpdateEntry();
}

void CLexiconDialog::OnTranslatebutton()
{
	CString csText;
	char last_char; // last character of string user entered
	char hold[290]="";

	m_csPhoneme.GetWindowText(csText);
	// tek 17aug98 have to bounds check this
	if (csText.GetLength() < 1)
	{
		MessageBox("Nothing to translate", "Error", MB_ICONEXCLAMATION);
		return;
	}

	last_char = csText[csText.GetLength() - 1];
	csText = "[:log phonemes on]" + csText + "[:log phonemes off]";
	strcpy(hold, csText);
	// tek 29aug98 use the new ConvertToPhonemes call
#ifdef USE_LOG_PHONEMES 
	TextToSpeechSpeak(m_pCMode->m_pDECtalk, hold, TTS_FORCE);
	TextToSpeechSync(m_pCMode->m_pDECtalk);
	ifstream infile("log.txt");
	if (!infile)
	{
		MessageBox("Failed to open log.txt.", "Error", MB_ICONERROR);
		return;
	}
	infile.getline(hold, 253);
	infile.close();

	// terminate the phoneme properly; if the user entered a string not ending in punctuation
	// (. , ! ?), the logging throws in "  . "
	if (last_char != '.' && last_char != ',' && last_char != '!' && last_char != '?')
		hold[strlen(hold) - 4] = '\0';
#else //USE_LOG_PHONEME
	// don't use a log file, use the ConvertToPhonemes call
	{
		unsigned char szPhonemeBuffer[250];
		DWORD dwLength=250;
		MMRESULT mmResult=0;
		mmResult = TextToSpeechConvertToPhonemes(  
			m_pCMode->m_pDECtalk,
			szPhonemeBuffer,
			&dwLength,
			NULL,
			(unsigned char *)(hold) ,
			NULL,
			TTS_SILENT);
		
		if (  (mmResult == MMSYSERR_NOERROR)
			&&(dwLength != 0) )
		{
			strncpy(hold,(char *)szPhonemeBuffer,dwLength);
		}
		else
		{
			// something went very wrong; just don't do anything
		}
		
	}
#endif //USE_LOG_PHONEME
	m_csPhoneme.SetWindowText(hold);
}

void CLexiconDialog::OnClearbutton()
{
	CString csText = "";
	m_csGrapheme.SetWindowText(csText);
	m_csPhoneme.SetWindowText(csText);
}

void CLexiconDialog::OnPronouncebutton()
{
	CString csText;
	char hold[296];

	// kill off any previous speech..
	(m_pCMode->m_pModeITTSCentralA)->AudioReset();

	m_csPhoneme.GetWindowText(csText);
	csText = "[:phoneme arpabet speak on][" + csText + "][:phoneme off]";
	strcpy(hold, csText);
	// we have to kill off notifications, because the user app might not
	// be expecting them (tek 20aug98)
	// 16sep98 we've constructed a DialogSpeak object, which kills off
	// user notifications for us. So, we can just speak. 
	// (I'm not thrilled about directly accessing TextTospeechSpeak here,
	// but we can't do square-bracket commands otherwise..)
	TextToSpeechSpeak(m_pCMode->m_pDECtalk, hold, TTS_FORCE);


}

void CLexiconDialog::OnAddbutton()
{
	CString csText, csHold;
	dic_entry entry; // the entry we're adding
	unsigned char *phoneme_ptr;
	char ph1, ph2; // the two characters of the phoneme sound
	int lcv, lcv2; // loop-control variables
	
	// fill in the entry's grapheme
	m_csGrapheme.GetWindowText(csText);
	if (csText == "")
	{
		MessageBox("You must enter a grapheme.", "Error", MB_ICONEXCLAMATION);
		return;
	}
	strcpy((char *) entry.text, csText);

	// convert the arpabet phoneme to the correct format to store in the dictionary

	phoneme_ptr = entry.text + (strlen((char *) entry.text) + 1);
	m_csPhoneme.GetWindowText(csText);
	
	// check to make sure there are an even number of characters in the phoneme
	if (csText.GetLength() % 2 != 0)
	{
		MessageBox("The phoneme is invalid.  Each phoneme sound should consist of two characters.\nFor single character sounds, you should follow the character with a space.", "Invalid Phoneme", MB_ICONEXCLAMATION);
		return;
	}

	if ((strlen((char *) entry.text) + (csText.GetLength() / 2)) > 126)
	{
		MessageBox("Entry is too big.  Shorten the grapheme or phoneme.", "Error", MB_ICONEXCLAMATION);
		return;
	}

	// tek 17aug98 use GetLength rather than null testing on CStrings..
	for (lcv = 0; (lcv*2)<csText.GetLength(); lcv++)
	{
#ifdef _DEBUG
		{
			char szTemp[256];
			sprintf(szTemp,"lcv=%d, len=%d, 1st=%02x 2nd=%02x\n",
				lcv, 
				csText.GetLength(), 
				(int)csText[lcv * 2], 
				(int)csText[lcv * 2 + 1]);
			OutputDebugString(szTemp);
		}
#endif //_DEBUG
		ph1 = csText[lcv * 2];
		ph2 = csText[lcv * 2 + 1];
		
		// Now that we have the two characters of the phoneme sound, we have to find its match
		// in the arpabet table we loaded in OnInitDialog.
		for (lcv2 = 0; lcv2 < arpa_size; lcv2 += 2)
			if (m_cArpabet[lcv2] == ph1 && m_cArpabet[lcv2 + 1] == ph2)
			{
				*phoneme_ptr++ = lcv2 / 2;
				break;
			}
		
		if (lcv2 == arpa_size) // a match wasn't found
		{
			csHold.Format("\"%c%c\" is not a valid phoneme.  If you would like to use a single character phoneme sound, follow it by a space.", ph1, ph2);
			MessageBox(csHold, "Invalid Phoneme", MB_ICONEXCLAMATION);
			return;
		}
	}
	*phoneme_ptr = '\0';

	MMRESULT mmRes = TextToSpeechAddUserEntry(m_pCMode->m_pDECtalk, &entry);

	if (mmRes == MMSYSERR_NOMEM)
	{
		MessageBox("Out of memory.", "Error", MB_ICONERROR);
		return;
	}
	if (mmRes == MMSYSERR_ERROR)
	{
		MessageBox("Unable to add entry.  Entry by same name already exists!", "Error", MB_ICONERROR);
		return;
	}

	num_entries++;
	page_size = (long) ceil((float) num_entries / 10); // recalculate the page size
	csText.Format("%d", num_entries);
	SetDlgItemText(IDC_NUMENTRIES, csText);

	m_csEntry.SetScrollRange(0, num_entries - 1);

	current_entry = TextToSpeechReserved3(m_pCMode->m_pDECtalk, 7, (char *) entry.text, 0); // retrieve index of new entry
	m_csEntry.SetScrollPos(current_entry);
	UpdateEntry();
}

void CLexiconDialog::OnDeletebutton()
{
	if (num_entries == 0)
		return;

	if (MessageBox("Are you sure you want to delete this entry?", "Confirm Deletion", 
				   MB_YESNO | MB_ICONEXCLAMATION) == IDNO)
		return;

	CString csText;
	dic_entry entry;

	m_csGrapheme.GetWindowText(csText);
	strcpy((char *) entry.text, csText);
	TextToSpeechDeleteUserEntry(m_pCMode->m_pDECtalk, &entry); // delete the entry

	if ((current_entry == num_entries - 1) && (current_entry != 0))
		current_entry--;
	num_entries--;
	page_size = (long) ceil((float) num_entries / 10); // recalculate the page size
	csText.Format("%d", num_entries);
	SetDlgItemText(IDC_NUMENTRIES, csText);

	if (num_entries != 0)
		m_csEntry.SetScrollRange(0, num_entries - 1);
	else
		m_csEntry.SetScrollRange(0, 0);
	m_csEntry.SetScrollPos(current_entry);

	UpdateEntry();
}

void CLexiconDialog::OnSavebutton()
{
	CFileDialog dlgSave(FALSE); // pass FALSE to construct a Save As dialog
	char filter[52];
	char file_name[500]; // 500 characters should be enough to store the path and file name
	CString csText;

	if (num_entries == 0)
	{
		MessageBox("Can't save a dictionary without any entries.", "Error", MB_ICONEXCLAMATION);
		return;
	}

	strcpy(filter, "Dictionary Files (*.dic)");
	strcpy(&filter[25], "*.dic");
	strcpy(&filter[31], "All Files (*.*)");
	strcpy(&filter[47], "*.*");
	filter[51] = '\0';
	dlgSave.m_ofn.lpstrFilter = filter;

	if (dlgSave.DoModal() == IDOK)
	{
		strcpy(file_name, dlgSave.GetPathName());
		if (dlgSave.GetFileExt().IsEmpty() && file_name[strlen(file_name) - 1] != '.')
			strcpy(file_name + strlen(file_name), ".dic"); // append a default extension
		MMRESULT mmRes = TextToSpeechSaveUserDictionary(m_pCMode->m_pDECtalk, file_name);
		if (mmRes)
		{
			csText.Format("Unable to save %s.", file_name);
			MessageBox(csText, "Error", MB_ICONERROR);
			return;
		}
	}
}

void CLexiconDialog::OnLoadbutton()
{
	CFileDialog dlgLoad(TRUE); // pass TRUE to construct a File Open dialog
	char filter[52];
	char file_name[_MAX_PATH+10]=""; 
	CString csText;
	char szUserDict[_MAX_PATH+10]="";
	

	strcpy(filter, "Dictionary Files (*.dic)");
	strcpy(&filter[25], "*.dic");
	strcpy(&filter[31], "All Files (*.*)");
	strcpy(&filter[47], "*.*");
	filter[51] = '\0';
	dlgLoad.m_ofn.lpstrFilter = filter;

	if (dlgLoad.DoModal() == IDOK)
	{
		strcpy(file_name, dlgLoad.GetPathName());
		TextToSpeechUnloadUserDictionary(m_pCMode->m_pDECtalk);
		MMRESULT mmRes = TextToSpeechLoadUserDictionary(m_pCMode->m_pDECtalk, file_name);
		if (mmRes)
		{
			csText.Format("Unable to load %s.", file_name);
			MessageBox(csText, "Error", MB_ICONERROR);
			return;
		}
		
		num_entries = TextToSpeechReserved3(m_pCMode->m_pDECtalk, 5, NULL, 0); // retrieve the number of user dictionary entries
		page_size = (long) ceil((float) num_entries / 10); // recalculate the page size
		csText.Format("%d", num_entries);
		SetDlgItemText(IDC_NUMENTRIES, csText);

		current_entry = 0;
		UpdateEntry();

		m_csEntry.SetScrollRange(0, num_entries - 1);
		m_csEntry.SetScrollPos(0);
	}
}

void CLexiconDialog::OnDumpbutton()
{
	CFileDialog dlgDump(FALSE); // pass FALSE to construct a Save As dialog
	char filter[46];
	char file_name[500]; // 500 characters should be enough to store the path and file name
	CString csText;

	strcpy(filter, "Text Files (*.txt)");
	strcpy(&filter[19], "*.txt");
	strcpy(&filter[25], "All Files (*.*)");
	strcpy(&filter[41], "*.*");
	filter[45] = '\0';
	dlgDump.m_ofn.lpstrFilter = filter;

	if (dlgDump.DoModal() == IDOK)
	{
		strcpy(file_name, dlgDump.GetPathName());
		if (dlgDump.GetFileExt().IsEmpty() && file_name[strlen(file_name) - 1] != '.')
			strcpy(file_name + strlen(file_name), ".txt"); // append a default extension
		MMRESULT mmRes = TextToSpeechDumpUserDictionary(m_pCMode->m_pDECtalk, file_name);
		if (mmRes)
		{
			csText.Format("Unable to dump dictionary to %s.", file_name);
			MessageBox(csText, "Error", MB_ICONERROR);
			return;
		}
	}
}
