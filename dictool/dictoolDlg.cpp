/* ***********************************************************************
 *                			Copyright
 *    Copyright © 2002 Fonix Coporation. All rights reserved.
 *
 *    This is an unpublished work, and is confidential and proprietary: 
 *    technology and information of Fonix corporation.  No part of this
 *    code may be reproduced, used or disclosed without written consent of 
 *    Fonix corporation in each and every instance.
 * ***********************************************************************
 *
 *	Revision History:
 *	Rev	Who	Date		Description
 *	---	---	----------	--------------------------------------------------------
 *	001	CAB	09/19/2002	Fixed error with open file as text with path with spaces
*/ 
// dictoolDlg.cpp : implementation file
//

#include <process.h>	// system()
#include "stdafx.h"
#include "dictool.h"
#include "dictoolDlg.h"
#include "fc_def.tab"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

list_t *wordlist;
list_t *wordlistend;



unsigned char lslower[]={
#include "ls_lower.tab"
};

unsigned char lsupper[]={
#include "ls_upper.tab"
};

#include "usa_phon.tab"
#include "uk_phon.tab"
#include "spa_phon.tab"
#include "ger_phon.tab"
#include "fr_phon.tab"
#include "la_phon.tab"


const unsigned char *ascky=usa_ascky;
const unsigned int *ascky_rev=usa_ascky_rev;
const unsigned char	*arpa=usa_arpa;

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDictoolDlg dialog

CDictoolDlg::CDictoolDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDictoolDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDictoolDlg)
	m_CurrentWord = _T("");
	m_Phonemes = _T("");
	m_WordCount = _T("");
	m_SearchWord = _T("");
	m_ArpaPhones = _T("");
	m_DictWord = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CDictoolDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDictoolDlg)
	DDX_Control(pDX, IDC_PRI9, m_Pri9);
	DDX_Control(pDX, IDC_PRI8, m_Pri8);
	DDX_Control(pDX, IDC_PRI7, m_Pri7);
	DDX_Control(pDX, IDC_PRI6, m_Pri6);
	DDX_Control(pDX, IDC_PRI5, m_Pri5);
	DDX_Control(pDX, IDC_PRI4, m_Pri4);
	DDX_Control(pDX, IDC_PRI3, m_Pri3);
	DDX_Control(pDX, IDC_PRI2, m_Pri2);
	DDX_Control(pDX, IDC_PRI1, m_Pri1);
	DDX_Control(pDX, IDC_ADVLIST, m_AdvList);
	DDX_Control(pDX, IDC_AUTO_PRON, m_AutoPron);
	DDX_Control(pDX, IDC_FC_NAME, m_FC_NAME);
	DDX_Control(pDX, IDC_SEARCH_DIRECTION, m_SearchDirection);
	DDX_Control(pDX, IDC_PRONOUNCE, m_Pronounce);
	DDX_Control(pDX, IDC_ADDWORD, m_AddWord);
	DDX_Control(pDX, IDC_SEARCH_BUTTON, m_SearchButton);
	DDX_Control(pDX, IDC_RESTORE_WORD, m_RestoreWord);
	DDX_Control(pDX, IDC_COMMIT, m_Commit);
	DDX_Control(pDX, IDC_SEARCHTYPE, m_SearchType);
	DDX_Control(pDX, IDC_FC_PRON, m_FC_PRON);
	DDX_Control(pDX, IDC_FC_WHO, m_FC_WHO);
	DDX_Control(pDX, IDC_FC_VERB, m_FC_VERB);
	DDX_Control(pDX, IDC_FC_TO, m_FC_TO);
	DDX_Control(pDX, IDC_FC_THAT, m_FC_THAT);
	DDX_Control(pDX, IDC_FC_SUBCONJ, m_FC_SUBCONJ);
	DDX_Control(pDX, IDC_FC_REFR, m_FC_REFR);
	DDX_Control(pDX, IDC_FC_REF, m_FC_REF);
	DDX_Control(pDX, IDC_FC_PREP, m_FC_PREP);
	DDX_Control(pDX, IDC_FC_POS, m_FC_POS);
	DDX_Control(pDX, IDC_FC_PART, m_FC_PART);
	DDX_Control(pDX, IDC_FC_NOUN, m_FC_NOUN);
	DDX_Control(pDX, IDC_FC_NEG, m_FC_NEG);
	DDX_Control(pDX, IDC_FC_INTER, m_FC_INTER);
	DDX_Control(pDX, IDC_FC_ING, m_FC_ING);
	DDX_Control(pDX, IDC_FC_HAVE, m_FC_HAVE);
	DDX_Control(pDX, IDC_FC_FUNC, m_FC_FUNC);
	DDX_Control(pDX, IDC_FC_ED, m_FC_ED);
	DDX_Control(pDX, IDC_FC_DET, m_FC_DET);
	DDX_Control(pDX, IDC_FC_CONT, m_FC_CONT);
	DDX_Control(pDX, IDC_FC_CONJ, m_FC_CONJ);
	DDX_Control(pDX, IDC_FC_CHARACTER, m_FC_CHARACTER);
	DDX_Control(pDX, IDC_FC_BEV, m_FC_BEV);
	DDX_Control(pDX, IDC_FC_BE, m_FC_BE);
	DDX_Control(pDX, IDC_FC_AUX, m_FC_AUX);
	DDX_Control(pDX, IDC_FC_ART, m_FC_ART);
	DDX_Control(pDX, IDC_FC_ADV, m_FC_ADV);
	DDX_Control(pDX, IDC_FC_ADJ, m_FC_ADJ);
	DDX_Control(pDX, IDC_PRIORITY, m_Priority);
	DDX_Control(pDX, IDC_HOMOGRAPH, m_Homograph);
	DDX_Text(pDX, IDC_CURRENTWORD, m_CurrentWord);
	DDX_Text(pDX, IDC_PHONEMES, m_Phonemes);
	DDX_Text(pDX, IDC_WORDCOUNT, m_WordCount);
	DDX_Text(pDX, IDC_SEARCHWORD, m_SearchWord);
	DDX_Text(pDX, IDC_STATIC_ARPAPHONES, m_ArpaPhones);
	DDX_Text(pDX, IDC_STATIC_DICTWORD, m_DictWord);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDictoolDlg, CDialog)
	//{{AFX_MSG_MAP(CDictoolDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_SEARCH_BUTTON, OnSearchButton)
	ON_BN_CLICKED(IDC_NEXT_WORD, OnNextWord)
	ON_BN_CLICKED(IDC_PREVIOUS_WORD, OnPreviousWord)
	ON_BN_CLICKED(IDC_ADDWORD, OnAddword)
	ON_BN_CLICKED(IDC_COMMIT, OnCommit)
	ON_BN_CLICKED(IDC_DELETEWORD, OnDeleteword)
	ON_COMMAND(ID_HELP_ABOUT, OnHelpAbout)
	ON_COMMAND(ID_FILE_EXIT, OnFileExit)
	ON_COMMAND(ID_FILE_OPEN, OnFileOpen)
	ON_COMMAND(ID_FILE_OPEN_AS_TEXT, OnFileOpenAsText)
	ON_COMMAND(ID_FILE_SAVE, OnFileSave)
	ON_COMMAND(ID_FILE_CLOSE, OnFileClose)
	ON_COMMAND(ID_FILE_SAVE_AS, OnFileSaveAs)
	ON_EN_UPDATE(IDC_PHONEMES, OnUpdatePhonemes)
	ON_BN_CLICKED(IDC_FC_ADJ, OnFcAdj)
	ON_BN_CLICKED(IDC_FC_ADV, OnFcAdv)
	ON_BN_CLICKED(IDC_FC_ART, OnFcArt)
	ON_BN_CLICKED(IDC_FC_AUX, OnFcAux)
	ON_BN_CLICKED(IDC_FC_BE, OnFcBe)
	ON_BN_CLICKED(IDC_FC_BEV, OnFcBev)
	ON_BN_CLICKED(IDC_FC_CHARACTER, OnFcCharacter)
	ON_BN_CLICKED(IDC_FC_CONJ, OnFcConj)
	ON_BN_CLICKED(IDC_FC_CONT, OnFcCont)
	ON_BN_CLICKED(IDC_FC_DET, OnFcDet)
	ON_BN_CLICKED(IDC_FC_ED, OnFcEd)
	ON_BN_CLICKED(IDC_FC_FUNC, OnFcFunc)
	ON_BN_CLICKED(IDC_FC_HAVE, OnFcHave)
	ON_BN_CLICKED(IDC_FC_ING, OnFcIng)
	ON_BN_CLICKED(IDC_FC_INTER, OnFcInter)
	ON_BN_CLICKED(IDC_FC_NEG, OnFcNeg)
	ON_BN_CLICKED(IDC_FC_NOUN, OnFcNoun)
	ON_BN_CLICKED(IDC_FC_PART, OnFcPart)
	ON_BN_CLICKED(IDC_FC_POS, OnFcPos)
	ON_BN_CLICKED(IDC_FC_PREP, OnFcPrep)
	ON_BN_CLICKED(IDC_FC_PRON, OnFcPron)
	ON_BN_CLICKED(IDC_FC_REF, OnFcRef)
	ON_BN_CLICKED(IDC_FC_REFR, OnFcRefr)
	ON_BN_CLICKED(IDC_FC_SUBCONJ, OnFcSubconj)
	ON_BN_CLICKED(IDC_FC_THAT, OnFcThat)
	ON_BN_CLICKED(IDC_FC_TO, OnFcTo)
	ON_BN_CLICKED(IDC_FC_VERB, OnFcVerb)
	ON_BN_CLICKED(IDC_FC_WHO, OnFcWho)
	ON_CBN_SELCHANGE(IDC_HOMOGRAPH, OnSelchangeHomograph)
	ON_CBN_SELCHANGE(IDC_PRIORITY, OnSelchangePriority)
	ON_BN_CLICKED(IDC_RESTORE_WORD, OnRestoreWord)
	ON_EN_UPDATE(IDC_SEARCHWORD, OnUpdateSearchword)
	ON_EN_UPDATE(IDC_CURRENTWORD, OnUpdateCurrentword)
	ON_BN_CLICKED(IDC_PRONOUNCE, OnPronounce)
	ON_WM_KEYDOWN()
	ON_COMMAND(ID_EDIT_GOTOWORD, OnEditGotoword)
	ON_BN_CLICKED(IDC_FC_NAME, OnFcName)
	ON_COMMAND(ID_EDIT_AUTOADVANCE, OnEditAutoadvance)
	ON_COMMAND(ID_LANGUAGE_USENGLISH, OnLanguageUsenglish)
	ON_COMMAND(ID_LANGUAGE_UKENGLISH, OnLanguageUkenglish)
	ON_COMMAND(ID_LANGUAGE_SPANISH, OnLanguageSpanish)
	ON_COMMAND(ID_LANGUAGE_LATINAMERICAN, OnLanguageLatinamerican)
	ON_COMMAND(ID_LANGUAGE_GERMAN, OnLanguageGerman)
	ON_COMMAND(ID_LANGUAGE_FRENCH, OnLanguageFrench)
	ON_COMMAND(ID_EDIT_ADVANCEDSEARCH, OnEditAdvancedsearch)
	ON_COMMAND(ID_EDIT_SAVEADVANCEDLIST, OnEditSaveadvancedlist)
	ON_COMMAND(ID_EDIT_PRIORITYSETMODE, OnEditPrioritysetmode)
	ON_BN_CLICKED(IDC_PRI1, OnPri1)
	ON_BN_CLICKED(IDC_PRI2, OnPri2)
	ON_BN_CLICKED(IDC_PRI3, OnPri3)
	ON_BN_CLICKED(IDC_PRI4, OnPri4)
	ON_BN_CLICKED(IDC_PRI5, OnPri5)
	ON_BN_CLICKED(IDC_PRI6, OnPri6)
	ON_BN_CLICKED(IDC_PRI7, OnPri7)
	ON_BN_CLICKED(IDC_PRI8, OnPri8)
	ON_BN_CLICKED(IDC_PRI9, OnPri9)
	ON_COMMAND(ID_EDIT_SORTDICTIONARY, OnEditSortdictionary)
	ON_COMMAND(ID_EDIT_REMOVEDULPICATES, OnEditRemovedulpicates)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDictoolDlg message handlers

BOOL CDictoolDlg::OnInitDialog()
{
	CWnd *pCur;
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	//CMenu pMenu;
#if 0
	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}
#endif

	/* insert the menu bar */
	pMenu.LoadMenu(IDR_MENU1);
	SetMenu(&pMenu);

	pMenu.EnableMenuItem(ID_FILE_SAVE,MF_GRAYED|MF_BYCOMMAND);
	pMenu.EnableMenuItem(ID_FILE_SAVE_AS,MF_GRAYED|MF_BYCOMMAND);
	pMenu.EnableMenuItem(ID_FILE_CLOSE,MF_GRAYED|MF_BYCOMMAND);
	pMenu.EnableMenuItem(ID_EDIT_GOTOWORD,MF_GRAYED|MF_BYCOMMAND);

	pMenu.EnableMenuItem(ID_EDIT_ADVANCEDSEARCH,MF_GRAYED|MF_BYCOMMAND);
	pMenu.EnableMenuItem(ID_EDIT_SAVEADVANCEDLIST,MF_GRAYED|MF_BYCOMMAND);

	pMenu.CheckMenuItem(ID_EDIT_AUTOADVANCE,MF_CHECKED|MF_BYCOMMAND);

	pMenu.CheckMenuItem(ID_EDIT_PRIORITYSETMODE,MF_UNCHECKED|MF_BYCOMMAND);

	m_pri_mode=0;

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	word_count=0;
	num_in_adv_list=0;
	UpdateWordCount();

	m_DictWord="Word In Dictionary #";

	m_Homograph.InsertString(0,"None");
	m_Homograph.InsertString(1,"Primary");
	m_Homograph.InsertString(2,"Secondary");
	m_Homograph.SetCurSel(0);

//	m_Priority.AddString("Necessary");
//	m_Priority.AddString("High");
//	m_Priority.AddString("Medium");
//	m_Priority.AddString("Low");
	m_Priority.AddString("100");
	m_Priority.AddString("150");
	m_Priority.AddString("250");
	m_Priority.AddString("325");
	m_Priority.AddString("450");
	m_Priority.AddString("500");
	m_Priority.AddString("650");
	m_Priority.AddString("850");
	m_Priority.AddString("1200");
	m_Priority.SetCurSel(2);

	m_SearchType.AddString("Case Insensitive");
	m_SearchType.AddString("DECtalk Case");
	m_SearchType.AddString("Case Sensitive");
	m_SearchType.SetCurSel(0);

	m_SearchDirection.AddString("Search Down");
	m_SearchDirection.AddString("Search Up");
	m_SearchDirection.SetCurSel(0);

	pCur=GetDlgItem(IDC_CURRENTWORD);
	//pFont=pCur->GetFont();
	pEditFont.CreateFont(18,0,0,0,FW_BOLD,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY ,TMPF_TRUETYPE |FF_MODERN ,"CourierNew");

	pCur->SetFont(&pEditFont,FALSE);
	pCur=GetDlgItem(IDC_PHONEMES);
	pCur->SetFont(&pEditFont,TRUE);
	pCur=GetDlgItem(IDC_SEARCHWORD);
	pCur->SetFont(&pEditFont,TRUE);

	pArpaFont.CreateFont(14,0,0,0,FW_BOLD,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY ,TMPF_TRUETYPE |FF_MODERN ,"CourierNew");

	pCur=GetDlgItem(IDC_STATIC_ARPAPHONES);
	pCur->SetFont(&pArpaFont,TRUE);

	pLabelFont.CreateFont(14,0,0,0,FW_BOLD,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY ,TMPF_TRUETYPE |FF_SWISS,"MS Sans Serif");
	pCur=GetDlgItem(IDC_NEXT_WORD);
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_SEARCH_BUTTON  );//             1001
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_NEXT_WORD      );//             1002
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_PREVIOUS_WORD  );//             1003
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_ADJ         );//             1005
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_ADV         );//             1006
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_ADDWORD        );//             1007
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_ART         );//             1008
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_AUX         );//             1009
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_BE          );//             1010
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_BEV         );//             1011
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_CONJ        );//             1012
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_ED          );//             1013
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_HAVE        );//             1014
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_ING         );//             1015
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_NOUN        );//             1016
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_POS         );//             1017
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_PREP        );//             1018
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_PRON        );//             1019
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_SUBCONJ     );//             1020
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_THAT        );//             1021
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_TO          );//             1022
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_VERB        );//             1023
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_WHO         );//             1024
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_NEG         );//             1025
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_INTER       );//             1026
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_REF         );//             1027
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_PART        );//             1028
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_FUNC        );//             1029
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_CONT        );//             1030
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_CHARACTER   );//             1031
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_REFR        );//             1032
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_HOMOGRAPH      );//             1035
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_DELETEWORD     );//             1036
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_PRIORITY       );//             1037
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_COMMIT         );//             1038
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_WORDCOUNT      );//             1041
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_DET         );//             1043
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_NAME         );//             1043
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_RESTORE_WORD   );//             1045
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_STATIC_PHONEMES    );//         1046
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_STATIC_HOMOGRAPH   );//         1047
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_STATIC_PRIORITY    );//         1048
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_SEARCHTYPE         );//         1049
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_STATIC_DICTWORD    );//         
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem(  IDC_STATIC_SEARCH      );//         1051
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem(  IDC_STATIC_SEARCH_TYPE );//         1052
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem(  IDC_PRONOUNCE )        ;//         
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem(  IDC_SEARCH_DIRECTION )        ;//         
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem(  IDC_AUTO_PRON )        ;//         
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem(  IDC_ADVLIST )        ;//         
	pCur->SetFont(&pLabelFont,FALSE);

	m_AdvList.SetCheck(0);
	m_AdvList.EnableWindow(0);

	m_Pri1.EnableWindow(0);
	m_Pri2.EnableWindow(0);
	m_Pri3.EnableWindow(0);
	m_Pri4.EnableWindow(0);
	m_Pri5.EnableWindow(0);
	m_Pri6.EnableWindow(0);
	m_Pri7.EnableWindow(0);
	m_Pri8.EnableWindow(0);
	m_Pri9.EnableWindow(0);


	wordlist=NULL;
	wordlistend=NULL;
	cur_word=NULL;
	justspoke=0;
	isModified=0;
	m_Commit.EnableWindow(0);
	m_RestoreWord.EnableWindow(0);
	m_SearchButton.EnableWindow(0);
	m_AddWord.EnableWindow(0);
	CWnd *pWnd=GetDlgItem(IDC_SEARCHWORD);
	pWnd->EnableWindow(0);

	invalidfile=NULL;

	m_AutoPron.SetCheck(1);


	isfilemodified=0;
	searchwordmodified=0;
	filename[0]='\0';
	advfile[0]='\0';


	hAccel=LoadAccelerators(NULL,MAKEINTRESOURCE(IDR_MAINFRAME));
	hPriAccel=LoadAccelerators(NULL,MAKEINTRESOURCE(IDR_PRI_ACCEL));

	UpdateData(FALSE);
	phTTS=NULL;
	us_on=0;
	tts_us=0;
	tts_cur=0;
	current_language=0;
	languageINFO=NULL;
	if(TextToSpeechEnumLangs(&languageINFO) == 0) 
	{
		MessageBox("Error starting DECtalk, Pronounce word will not work","Information",MB_OK|MB_ICONINFORMATION);
		m_Pronounce.EnableWindow(0);
	}
	else
	{
		tts_us=TextToSpeechStartLang("US");
		if ((tts_us & TTS_LANG_ERROR)==0)
		{
			us_on=1;
			pMenu.EnableMenuItem(ID_LANGUAGE_USENGLISH,MF_BYCOMMAND | MF_ENABLED);
		}
		tts_uk=TextToSpeechStartLang("UK");
		if ((tts_uk & TTS_LANG_ERROR)==0)
		{
			uk_on=1;
			pMenu.EnableMenuItem(ID_LANGUAGE_UKENGLISH,MF_BYCOMMAND | MF_ENABLED);
		}
		tts_sp=TextToSpeechStartLang("SP");
		if ((tts_sp & TTS_LANG_ERROR)==0)
		{
			sp_on=1;
			pMenu.EnableMenuItem(ID_LANGUAGE_SPANISH,MF_BYCOMMAND | MF_ENABLED);
		}
		tts_gr=TextToSpeechStartLang("GR");
		if ((tts_gr & TTS_LANG_ERROR)==0)
		{
			gr_on=1;
			pMenu.EnableMenuItem(ID_LANGUAGE_GERMAN,MF_BYCOMMAND | MF_ENABLED);
		}
		tts_la=TextToSpeechStartLang("LA");
		if ((tts_la & TTS_LANG_ERROR)==0)
		{
			la_on=1;
			pMenu.EnableMenuItem(ID_LANGUAGE_LATINAMERICAN,MF_BYCOMMAND | MF_ENABLED);
		}
		tts_fr=TextToSpeechStartLang("FR");
		if ((tts_fr & TTS_LANG_ERROR)==0)
		{
			fr_on=1;
			pMenu.EnableMenuItem(ID_LANGUAGE_FRENCH,MF_BYCOMMAND | MF_ENABLED);
		}			
		if (strcmp("US",languageINFO->Entries[0].lang_code)==0)
		{
			tts_cur=tts_us;
			current_language=ID_LANGUAGE_USENGLISH;
			ascky=usa_ascky;
			ascky_rev=usa_ascky_rev;
			arpa=usa_arpa;
		}
		else if (strcmp("UK",languageINFO->Entries[0].lang_code)==0)
		{
			tts_cur=tts_uk;
			current_language=ID_LANGUAGE_UKENGLISH;
			ascky=uk_ascky;
			ascky_rev=uk_ascky_rev;
			arpa=uk_arpa;
		}
		else if (strcmp("SP",languageINFO->Entries[0].lang_code)==0)
		{
			tts_cur=tts_sp;
			current_language=ID_LANGUAGE_SPANISH;
			ascky=spanish_ascky;
			ascky_rev=spanish_ascky_rev;
			arpa=spanish_arpa;
		}
		else if (strcmp("LA",languageINFO->Entries[0].lang_code)==0)
		{
			tts_cur=tts_la;
			current_language=ID_LANGUAGE_LATINAMERICAN;
			ascky=la_ascky;
			ascky_rev=la_ascky_rev;
			arpa=la_arpa;
		}
		else if (strcmp("GR",languageINFO->Entries[0].lang_code)==0)
		{
			tts_cur=tts_gr;
			current_language=ID_LANGUAGE_GERMAN;
			ascky=german_ascky;
			ascky_rev=german_ascky_rev;
			arpa=german_arpa;
		}
		else if (strcmp("FR",languageINFO->Entries[0].lang_code)==0)
		{
			tts_cur=tts_fr;
			current_language=ID_LANGUAGE_FRENCH;
			ascky=french_ascky;
			ascky_rev=french_ascky_rev;
			arpa=french_arpa;
		}
		if ((tts_cur & TTS_LANG_ERROR)==0)
		{
			TextToSpeechSelectLang(NULL,tts_cur);
		}
		pMenu.CheckMenuItem(current_language,MF_CHECKED|MF_BYCOMMAND);
	}	

	if (TextToSpeechStartupEx(&phTTS,WAVE_MAPPER,REPORT_OPEN_ERROR,NULL,NULL))
	{
		MessageBox("Error starting DECtalk, Pronounce word will not work","Information",MB_OK|MB_ICONINFORMATION);
		m_Pronounce.EnableWindow(0);
		pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
		phTTS=NULL;
	}

	if (languageINFO)
	{
		//free(languageINFO->Entries);
		//free(languageINFO);
	}


	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CDictoolDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
#if 0
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
#endif
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CDictoolDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CDictoolDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CDictoolDlg::OnSearchButton() 
{
	// TODO: Add your control notification handler code here
	char *a;
	int type;
	int length;
	int loop=0;
	int dir=0;
	int sub_list=0;
	plist_t p;

	if (justspoke)
		TextToSpeechReset(phTTS,FALSE);
	justspoke=0;
	if (cur_word!=NULL && isModified)
	{
		int result=MessageBox("Searching for a new word without committing changes will result in the loss of data.\nWould you like to commit the changes now?","Warning",MB_YESNOCANCEL|MB_ICONEXCLAMATION );
		if (result==6)// YES
		{
			OnCommit();
		}
		if (result==2)// CANCEL
		{
			return;
		}
	}

	UpdateData(TRUE);

	length=m_SearchWord.GetLength();
	a=m_SearchWord.GetBuffer(length+2);
	type=m_SearchType.GetCurSel();

	switch (m_SearchDirection.GetCurSel())
	{
	case 0:
		dir=1;
		break;
	case 1:
		dir=-1;
		break;
	}

	if (m_AdvList.GetCheck())
	{
		sub_list=1;
	}

	p=NULL;
	if (searchwordmodified)
	{
		if (dir==1)
			p=wordlist;
		else
			p=wordlistend;
		searchwordmodified=0;
	}
	else
	{
		if (cur_word==NULL)
		{
			if (dir==1)
				cur_word=wordlist;
			else
				cur_word=wordlistend;
		}
		if (cur_word!=NULL)
		{
			if (dir==1)
				p=cur_word->next;
			else
				p=cur_word->prev;
		}
	}

	while (p!=NULL)
	{
		if (p->is_comment)
		{
			if (dir==1)
				p=p->next;
			else
				p=p->prev;
			continue;
		}
		if (sub_list==1 && p->line.word.in_sub_list==0)
		{
			if (dir==1)
				p=p->next;
			else
				p=p->prev;
			continue;
		}
		if (compare_words((unsigned char *)a,p->line.word.graph,type)==0)
			break;
		if (dir==1)
			p=p->next;
		else
			p=p->prev;
	}
	if (p==NULL && loop==0 && searchwordmodified==0)
	{
		if (dir==1)
			p=wordlist;
		else
			p=wordlistend;
		while (p!=NULL)
		{
			if (p->is_comment)
			{
				if (dir==1)
					p=p->next;
				else
					p=p->prev;
				continue;
			}
			if (sub_list==1 && p->line.word.in_sub_list==0)
			{
				if (dir==1)
					p=p->next;
				else
					p=p->prev;
				continue;
			}
			if (compare_words((unsigned char *)a,p->line.word.graph,type)==0)
				break;
			if (dir==1)
				p=p->next;
			else
				p=p->prev;
		}
	}
	cur_word=p;
	UpdateDisplay();
	UpdateData(TRUE);
	if (m_AutoPron.GetCheck())
	{
		UpdateData(FALSE);
		OnPronounce();
	}

}

int CDictoolDlg::compare_words(unsigned char *search,unsigned char *test,int type)
{
	int search_length=0;
	int test_length=0;
	int max_length;
	int i;
	int pre_wild=-1;
	int start_char=0;
	int max_start_char=0;

	if (search==NULL)
	{
		return(1);
	}
	else
	{
		if (search[0]=='*')
		{
			pre_wild=1;
			search++;
			search_length=strlen((char *)search);
		}
		else if (search[0]=='+')
		{
			pre_wild=2;
			search++;
			start_char=1;
			search_length=strlen((char *)search);
		
		}
		else if (search[0]=='\\')
		{
			pre_wild=0;
			search++;
			search_length=strlen((char *)search);
		}
		else
		{
			search_length=strlen((char *)search);
		}
	}
	if (test==NULL)
	{
		return(1);
	}
	else
	{
		test_length=strlen((char *)test);
	}

	if (search_length>test_length)
		return(1);

	max_length=search_length;

	max_start_char=test_length-search_length;

	for (i=start_char;i<max_length+start_char;i++)
	{
		if (compare_character(search[i-start_char],test[i],type))
		{
			if (pre_wild==1)
			{
				if (start_char<max_start_char)
				{
					i=start_char;
					start_char++;
					continue;
				}
				else
				{
					return(1);
				}
			}
			if (pre_wild==2)
			{
				if (start_char<max_start_char)
				{
					i=start_char;
					start_char++;
					continue;
				}
				else
				{
					return(1);
				}
			}
			return(1);
		}
	}
	return(0);
}

int CDictoolDlg::compare_character(unsigned char  a,unsigned char b,int type)
{
	switch(type)
	{
	case 0:// case insensitive
		if (lslower[a]!=lslower[b])
		{
			return(1);
		}
		return(0);
	case 1: // DECtalk case
		if (isupper(b))
		{
			if (a!=b)
			{
				return(1);
			}
		}
		else
		{
			if (lslower[a]!=lslower[b])
			{
				return(1);
			}
		}
		return(0);
	case 2: // case sensitive
		if (a!=b)
		{
			return(1);
		}
		return(0);
	}
	return(1);
}


void CDictoolDlg::OnNextWord() 
{
	// TODO: Add your control notification handler code here
	plist_t p;
	int sub_list=0;
	if (justspoke)
		TextToSpeechReset(phTTS,FALSE);
	justspoke=0;
	if (cur_word!=NULL && isModified)
	{
		int result=MessageBox("Changing words without committing changes will result in the loss of changes.\nWould you like to commit the changes now?","Warning",MB_YESNOCANCEL|MB_ICONEXCLAMATION );
		if (result==6)// YES
		{
			OnCommit();
		}
		if (result==2)// CANCEL
		{
			return;
		}
	}
	UpdateData(TRUE);
	if (m_AdvList.GetCheck())
	{
		sub_list=1;
	}
	if (cur_word==NULL && wordlist!=NULL)
	{
		cur_word=wordlist;
		p=cur_word;
		while (p!=NULL)
		{	
			if (p->is_comment)
			{
				p=p->next;
				continue;
			}
			if (sub_list==1 && p->line.word.in_sub_list==1)
			{
				break;
			}
			if (sub_list==0)
			{
				break;
			}
			p=p->next;
		}
		cur_word=p;
		UpdateDisplay();
	}
	else
	{
		if (cur_word!=NULL)
		{
			p=cur_word->next;
			while (p!=NULL)
			{	
				if (p->is_comment)
				{
					p=p->next;
					continue;
				}
				if (sub_list==1 && p->line.word.in_sub_list==1)
				{
					break;
				}
				if (sub_list==0)
				{
					break;
				}
				p=p->next;
			}
			cur_word=p;
			UpdateDisplay();
		}
	}
	UpdateData(TRUE);
	if (m_AutoPron.GetCheck())
	{
		UpdateData(FALSE);
		OnPronounce();
	}
	
}

void CDictoolDlg::OnPreviousWord() 
{
	// TODO: Add your control notification handler code here
	plist_t p;
	int sub_list=0;
	if (justspoke)
		TextToSpeechReset(phTTS,FALSE);
	justspoke=0;
	if (cur_word!=NULL && isModified)
	{
		int result=MessageBox("Changing words without committing changes will result in the loss of changes.\nWould you like to commit the changes now?","Warning",MB_YESNOCANCEL|MB_ICONEXCLAMATION );
		if (result==6)// YES
		{
			OnCommit();
		}
		if (result==2)// CANCEL
		{
			return;
		}
	}
	UpdateData(TRUE);
	if (m_AdvList.GetCheck())
	{
		sub_list=1;
	}
	if (cur_word==NULL && wordlistend!=NULL)
	{
		cur_word=wordlistend;
		p=cur_word;
		while (p!=NULL)
		{	
			if (p->is_comment)
			{
				p=p->prev;
				continue;
			}
			if (sub_list==1 && p->line.word.in_sub_list==1)
			{
				break;
			}
			if (sub_list==0)
			{
				break;
			}
			p=p->prev;
		}
		cur_word=p;
		UpdateDisplay();
	}
	else
	{
		if (cur_word!=NULL)
		{
			p=cur_word->prev;
			while (p!=NULL)
			{	
				if (p->is_comment)
				{
					p=p->prev;
					continue;
				}
				if (sub_list==1 && p->line.word.in_sub_list==1)
				{
					break;
				}
				if (sub_list==0)
				{
					break;
				}
				p=p->prev;
			}
			cur_word=p;
			UpdateDisplay();
		}
	}
	UpdateData(TRUE);
	if (m_AutoPron.GetCheck())
	{
		UpdateData(FALSE);
		OnPronounce();
	}	
}

void CDictoolDlg::OnAddword() 
{
	plist_t p,q,r;
	int length;
	int count=0;
	char *a;
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);

	p=(plist_t)malloc(sizeof(list_t));
	if (p==NULL)
	{
		return;
	}
	length=m_CurrentWord.GetLength();
	if (length==0)
	{
		free(p);
		return;
	}
	p->line.word.graph=(unsigned char *)malloc(length+2);
	if (p->line.word.graph==NULL)
	{
		free(p);
		return;
	}
	a=m_CurrentWord.GetBuffer(length+2);
	strcpy((char *)p->line.word.graph,a);
	m_CurrentWord.ReleaseBuffer();

	length=m_Phonemes.GetLength();
	p->line.word.phone=(char *)calloc(length+2,1);
	if (p->line.word.phone==NULL)
	{
		free(p->line.word.graph);
		free(p);
		return;
	}

	p->is_comment=0;
	p->line.word.in_sub_list=1;
	isModified=1;
	m_SearchButton.EnableWindow(1);
	CWnd *pWnd=GetDlgItem(IDC_SEARCHWORD);
	pWnd->EnableWindow(1);
	q=wordlist;
	r=wordlist;
	if (wordlist==NULL)
	{
		p->next=NULL;
		p->prev=NULL;
		cur_word=p;
		wordlist=p;
		wordlistend=p;
		pMenu.EnableMenuItem(ID_FILE_SAVE_AS,MF_ENABLED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_FILE_CLOSE,MF_ENABLED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_EDIT_GOTOWORD,MF_ENABLED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_EDIT_ADVANCEDSEARCH,MF_ENABLED|MF_BYCOMMAND);
		
		goto finish;
	}
	while (q!=NULL)
	{
		if (q->is_comment)
		{
			q=q->next;
			continue;
		}
		if (strcmp((char *)q->line.word.graph,a)>0)
			break;
		r=q;
		q=q->next;
	}
	if (q==NULL)
	{
		r->next=p;
		p->next=NULL;
		p->prev=r;
		cur_word=p;
		wordlistend=p;
		goto finish;
	}
	if (r==q)
	{
		p->next=r;
		p->prev=NULL;
		r->prev=p;
		cur_word=p;
		wordlist=p;
		goto finish;
	}
	p->next=q;
	p->prev=r;
	r->next=p;
	q->prev=p;
	cur_word=p;
finish:
	p=cur_word;
	word_count++;
	UpdateWordNumbers();
	UpdateWordCount();
	OnCommit();

}

void CDictoolDlg::OnCommit() 
{
	MENUITEMINFO info;
	unsigned int length;
	char *a;
	char *b;
	// TODO: Add your control notification handler code here
	//read the infromation off of the controls and set in the word
	if (cur_word==NULL)
	{
		OnAddword();
		return;
	}
	if (cur_word->is_comment)
	{
		return;
	}
	if (isModified)
	{
		UpdateData(TRUE);

//		strcpy((char *)cur_list_word->line.word.graph,(char *)cur_word->line.word.graph);
//		strcpy(cur_list_word->line.word.phone,cur_word->line.word.phone);
//		cur_list_word->line.word.fc=cur_word->line.word.fc;
//		cur_list_word->line.word.homo=cur_word->line.word.homo;
//		cur_list_word->line.word.priority=cur_word->line.word.priority;

		length=m_Phonemes.GetLength();
		a=m_Phonemes.GetBuffer(length+2);
		if (length>=strlen(cur_word->line.word.phone))
		{
			b=(char *)realloc(cur_word->line.word.phone,length+2);
			if(b==NULL)
			{
				return;
			}
			cur_word->line.word.phone=b;
		}
		strcpy(cur_word->line.word.phone,a);
		m_Phonemes.ReleaseBuffer();

		switch(m_Homograph.GetCurSel())
		{
		case 0:
			cur_word->line.word.homo='N';
			break;
		case 1:
			cur_word->line.word.homo='P';
			break;
		case 2:
			cur_word->line.word.homo='S';
			break;
		}

		switch(m_Priority.GetCurSel())
		{
		case 0:
			cur_word->line.word.priority=100;
			break;
		case 1:
			cur_word->line.word.priority=150;
			break;
		case 2:
			cur_word->line.word.priority=250; 
			break;
		case 3:
			cur_word->line.word.priority=325;
			break;
		case 4:
			cur_word->line.word.priority=450;
			break;
		case 5:
			cur_word->line.word.priority=500;
			break;
		case 6:
			cur_word->line.word.priority=650;
			break;
		case 7:
			cur_word->line.word.priority=850;
			break;
		case 8:
			cur_word->line.word.priority=1200;
			break;
		}

		cur_word->line.word.fc=0;
		if (m_FC_ADJ.GetCheck())
			cur_word->line.word.fc|=FC_ADJ;
		
		if (m_FC_ADV.GetCheck())
			cur_word->line.word.fc|=FC_ADV;
		
		if (m_FC_ART.GetCheck())
			cur_word->line.word.fc|=FC_ART;
		
		if (m_FC_AUX.GetCheck())
			cur_word->line.word.fc|=FC_AUX;
		
		if (m_FC_BE.GetCheck())
			cur_word->line.word.fc|=FC_BE;
		
		if (m_FC_BEV.GetCheck())
			cur_word->line.word.fc|=FC_BEV;
		
		if (m_FC_CONJ.GetCheck())
			cur_word->line.word.fc|=FC_CONJ;
		
		if (m_FC_ED.GetCheck())
			cur_word->line.word.fc|=FC_ED;
		
		if (m_FC_HAVE.GetCheck())
			cur_word->line.word.fc|=FC_HAVE;
		
		if (m_FC_ING.GetCheck())
			cur_word->line.word.fc|=FC_ING;
		
		if (m_FC_NOUN.GetCheck())
			cur_word->line.word.fc|=FC_NOUN;
		
		if (m_FC_POS.GetCheck())
			cur_word->line.word.fc|=FC_POS;
		
		if (m_FC_PREP.GetCheck())
			cur_word->line.word.fc|=FC_PREP;
		
		if (m_FC_PRON.GetCheck())
			cur_word->line.word.fc|=FC_PRON;
		
		if (m_FC_SUBCONJ.GetCheck())
//			cur_word->line.word.fc|=0;//FC_SUBCONJ;
			cur_word->line.word.fc|=FC_SMS;
		
		if (m_FC_THAT.GetCheck())
			cur_word->line.word.fc|=FC_THAT;
		
		if (m_FC_TO.GetCheck())
			cur_word->line.word.fc|=FC_TO;
		
		if (m_FC_VERB.GetCheck())
			cur_word->line.word.fc|=FC_VERB;
		
		if (m_FC_WHO.GetCheck())
//			cur_word->line.word.fc|=FC_WHO;
			cur_word->line.word.fc|=FC_WHOW;
		
		if (m_FC_NEG.GetCheck())
			cur_word->line.word.fc|=FC_NEG;
		
		if (m_FC_INTER.GetCheck())
			cur_word->line.word.fc|=FC_INTER;
		
		if (m_FC_REF.GetCheck())
			cur_word->line.word.fc|=0;//FC_REF;
		
		if (m_FC_PART.GetCheck())
			cur_word->line.word.fc|=FC_PART;
		
		if (m_FC_FUNC.GetCheck())
			cur_word->line.word.fc|=FC_FUNC;
		
		if (m_FC_CONT.GetCheck())
			//cur_word->line.word.fc|=FC_CONT;
			cur_word->line.word.fc|=FC_CONTR;
		
		if (m_FC_CHARACTER.GetCheck())
			cur_word->line.word.fc|=FC_CHARACTER;
		
		if (m_FC_REFR.GetCheck())
			cur_word->line.word.fc|=0;//FC_REFR;
		
		if (m_FC_DET.GetCheck())
			cur_word->line.word.fc|=0;//FC_DET;

		if (m_FC_NAME.GetCheck())
			cur_word->line.word.fc|=FC_NAME;

		isModified=0;
		m_Commit.EnableWindow(0);
		m_RestoreWord.EnableWindow(0);
		m_AddWord.EnableWindow(0);
		isfilemodified=1;

		info.fMask=MIIM_STATE;
		info.fState=0;
		info.cbSize=sizeof(info);
		
		
		pMenu.GetMenuItemInfo(ID_EDIT_AUTOADVANCE,&info,FALSE);
		
		if (info.fState&MFS_CHECKED)
		{
			OnNextWord();
		}
		
		UpdateDisplay();
	}
}

void CDictoolDlg::OnDeleteword() 
{
	// TODO: Add your control notification handler code here
	plist_t p,q;
	int result;
	if (cur_word==NULL)
	{
		return;
	}
	result=MessageBox("This will remove the word!","Warning",MB_YESNO|MB_ICONEXCLAMATION|MB_DEFBUTTON2);
	if (result==7)
	{
		return;
	}
	if (cur_word->prev==NULL)
	{
		if (cur_word->next==NULL)
		{
			wordlist=NULL;
			wordlistend=NULL;
			p=cur_word;
			cur_word=NULL;
		}
		else
		{
			p=cur_word;
			cur_word=cur_word->next;
			wordlist=cur_word;
			cur_word->prev=NULL;

		}
	}
	else
	{
		if (cur_word->next==NULL)
		{
			p=cur_word;
			cur_word=cur_word->prev;
			cur_word->next=NULL;
			wordlistend=cur_word;
		}
		else
		{
			//nothing null
			q=cur_word->prev;
			p=cur_word;
			cur_word=cur_word->next;
			q->next=cur_word;
			cur_word->prev=q;
		}
	}
	free(p->line.word.graph);
	free(p->line.word.phone);
	free(p);	
	isModified=0;
	m_Commit.EnableWindow(0);
	m_RestoreWord.EnableWindow(0);
	m_AddWord.EnableWindow(0);
	isfilemodified=1;
	word_count--;
	UpdateWordNumbers();
	UpdateDisplay();
	UpdateWordCount();
	if (cur_word)
		OnPronounce();
}

void CDictoolDlg::OnHelpAbout() 
{
	// TODO: Add your command handler code here
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
}

void CDictoolDlg::OnFileExit() 
{
	// TODO: Add your command handler code here
	if (isModified)
	{
		int result=MessageBox("Exiting dictool without committing changes will result in the loss of data.\nWould you like to commit the changes now?","Warning",MB_YESNOCANCEL|MB_ICONEXCLAMATION );
		if (result==6)// YES
		{
			OnCommit();
		}
		if (result==2)// CANCEL
		{
			return;
		}
	}
	if (isfilemodified)
	{		
		int result=MessageBox("Exiting without saving will result in the loss of data.\nDo you want to save the file?","Warning",MB_YESNOCANCEL|MB_ICONQUESTION);
		if (result==2)
		{
			return;
		}
		if (result==7)
		{
			//return;
		}
		if (result==6)
		{
			if (filename[0])
				OnFileSave();
			else
				OnFileSaveAs();
		}
	}
	if (phTTS)
	{
		TextToSpeechShutdown(phTTS);
	}
	if (us_on)	 TextToSpeechCloseLang("US");
	if (uk_on)	 TextToSpeechCloseLang("UK");
	if (gr_on)	 TextToSpeechCloseLang("SP");
	if (sp_on)	 TextToSpeechCloseLang("GR");
	if (la_on)	 TextToSpeechCloseLang("LA");
	if (fr_on)	 TextToSpeechCloseLang("FR");

	EmptyWordList();
	DestroyWindow();
	
}

void CDictoolDlg::OnFileOpen() 
{
	// TODO: Add your command handler code here
	plist_t p,q;
	char *line;
	int length;
	int i;
	int start;
	char filter[]={"Dictionary Files (*.txt)|*.txt|All Files|*.*"};
	int exit = FALSE, error = FALSE;
	char temp[500];

	if (isModified)
	{
		int result=MessageBox("Opening a file without committing the current word will result in the loss of changes.\nWould you like to commit the changes now?","Warning",MB_YESNOCANCEL|MB_ICONEXCLAMATION );
		if (result==6)// YES
		{
			OnCommit();
		}
		if (result==2)// CANCEL
		{
			return;
		}
	}
	if (isfilemodified)
	{		
		int result=MessageBox("Opening a file without saving will result in the loss of changes.\nDo you want to save the file?","Warning",MB_YESNOCANCEL|MB_ICONQUESTION);
		if (result==2)
		{
			return;
		}
		if (result==7)
		{
			//return;
		}
		if (result==6)
		{
			if (filename[0])
				OnFileSave();
			else
				OnFileSaveAs();
		}
	}

	CFileDialog Filedlg(TRUE,".txt",NULL,OFN_OVERWRITEPROMPT, filter,NULL);

	if(Filedlg.DoModal()==IDOK)
	{
		char title[500];
		
		sprintf(title,"dictool - %s",Filedlg.m_ofn.lpstrFile);
		strcpy(filename,Filedlg.m_ofn.lpstrFile);
		// set the dialog caption to includ ehte file name
		SetWindowText(title);

		pMenu.EnableMenuItem(ID_FILE_SAVE,MF_ENABLED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_FILE_SAVE_AS,MF_ENABLED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_FILE_CLOSE,MF_ENABLED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_EDIT_GOTOWORD,MF_ENABLED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_EDIT_ADVANCEDSEARCH,MF_ENABLED|MF_BYCOMMAND);

		//SendMessage(WM_SETTEXT,0,(LPARAM)filename);
		// read the file in to the internal structure
		curfile=fopen(filename,"r");
		if (curfile==NULL)
		{
			char message[500];
			sprintf(message,"Could not open file %s",filename);
			MessageBox(message,"Error opening file",MB_OK|MB_ICONSTOP);
			return;
		}
		word_count=0;
		if (wordlist!=NULL)
		{
			EmptyWordList();
		}
		q=wordlist;
		line=( char *)malloc(500);
		while (fgets(line,499,curfile)!=NULL)
		{
			p=(plist_t)malloc(sizeof(list_t));
			if (line[0]==';')
			{
				p->is_comment=1;
				length=strlen(line);
				line[length-1]='\0';
				p->line.comment.comment=(unsigned char *)malloc(strlen(line)+2);
				strcpy((char *)p->line.comment.comment, line);

				/* add to list */
				q=add_to_list_end(p,q);
				continue;
			}
			i=0;
			length=strlen(line);
			line[length-1]='\0';
			length--;
			start=0;
			/* get the grapheme field */
		
			while (line[i] != ',' && i<length)
			{	// For escape character
				if (line [i]=='\\')
				{
					i++;
				}
				i++;
			}
			if (line[i] != ',')
			{
				free(p);
				if ( strlen(line) < 500)
				{	strcpy(temp, "MISSING DATA\t\t");
					strcat(temp, line);
				}
				write_out_invalid(temp);
				exit = TRUE;
				continue;
			}
			if (i<length)
			{
				p->is_comment=0;
				p->line.word.graph=(unsigned char *)malloc(i-start+2);
				strncpy((char *)p->line.word.graph,line+start,i-start);
				p->line.word.graph[i-start]='\0';
			}
			/* skip to the homograph field */
			i++;
			// Check homograph filled for invalid values
			if ( (line[i] != 'N') && (line[i] != 'P') && (line[i] != 'S'))
			{	
				if ( strlen(line) < 500)
				{	strcpy(temp, "INVALID HOMOGRAPH VALUE\t");
					strcat(temp, line);
				}
				write_out_invalid(temp);
				exit = TRUE;
			}
			p->line.word.homo=line[i];

			i++;
			if (line[i]!=',')
			{
				free(p->line.word.graph);
				free(p);
				if ( strlen(line) < 500)
				{	strcpy(temp, "EXTRA HOMOGRAPH VALUE\t");
					strcat(temp, line);
				}
				write_out_invalid(temp);
				continue;
			}
			/* skip the beginning of the phoneme line */
			i++;
			start=i;
			while (line[i]!=',' && i<length)
			{
				if (line[i]=='\\' && line[i+1]!='\\')
				{
					i++;
				}
				i++;
			}
			if (line[i] != ',')
			{
				free(p->line.word.graph);
				free(p);
				if ( strlen(line) < 500)
				{	strcpy(temp, "MISSING DATA\t\t");
					strcat(temp, line);
				}
				write_out_invalid(temp);
				continue;
			}
			if (i<length)
			{
				p->line.word.phone=(char *)malloc(i-start+2);
				strncpy((char *)p->line.word.phone,line+start,i-start);
				p->line.word.phone[i-start]='\0';
				if ((i-start)==0)
				{
					if ( strlen(line) < 500)
					{	strcpy(temp, "MISSING DATA\t\t");
						strcat(temp, line);
					}	
					write_out_invalid(temp);
				}
			}
			/* skip to the FC field */
			i++;
			p->line.word.fc=0;
			// Check for invalid FC value
			if (line[i] != '1' && line[i] != '0' )
			{	
				if ( strlen(line) < 500)
				{	strcpy(temp, "INVALID BIT VALUE\t\t");
					strcat(temp, line);
				}
				write_out_invalid(temp);
				exit = TRUE;
			}

			if (line[i]=='1' || line[i]=='5') // the 5 is for the broken dictioanry
				p->line.word.fc|=FC_ADJ;
			i++;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_ADV;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_ART;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_AUX;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_BE;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_BEV;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_CONJ;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_ED;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_HAVE;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_ING;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_NOUN;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_POS;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_PREP;
			
			if (line[i++] == '1')
				p->line.word.fc|= (FC_PRON);
			
			if (line[i++] == '1')
//				p->line.word.fc|=0;// FC_SUBCONJ;
				p->line.word.fc|=FC_SMS;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_THAT;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_TO;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_VERB;
			
			if (line[i++] == '1')
//				p->line.word.fc|= FC_WHO;
				p->line.word.fc|= FC_WHOW;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_NEG;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_INTER;
			
			if (line[i++] == '1')
				p->line.word.fc|= 0;//FC_REF;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_PART;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_FUNC;
			
			if (line[i++] == '1')
//				p->line.word.fc|=FC_CONT;
				p->line.word.fc|=FC_CONTR;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_CHARACTER;
			
			if (line[i++] == '1')
				p->line.word.fc|= 0;//FC_REFR;
			
			if (line[i++] == '1')
				p->line.word.fc|= 0;//FC_DET;
			
			if (line[i++] == '1')
				p->line.word.fc|= FC_NAME;
			
			if (p->line.word.fc == 0)
			{
				if ( strlen(line) < 500)
				{	strcpy(temp, "NO BIT SET\t\t\t");
					strcat(temp, line);
				}

				write_out_invalid(temp);
			}
			/* skip the extra 0's in the file */
//			i++;

			if ( line[i] != ',' )
			{
				free(p->line.word.graph);
				free(p->line.word.phone);
				free(p);
				
				if ( strlen(line) < 500)
				{	strcpy(temp, "EXTRA BIT SET\t\t");
					strcat(temp, line);
				}
				write_out_invalid(temp);
				exit = TRUE;
				continue;
			}

			/* skip to the priority field */
			i++;
			start=i;
			p->line.word.priority=0;
			while (line[i]!=',' && i<length)
			{
				p->line.word.priority*=10;
				p->line.word.priority+=(line[i]-'0');
				i++;
			}
			if (p->line.word.priority<=100)
			{
				if ( p->line.word.priority != 100)
					error = TRUE;
				p->line.word.priority=100;			
			} 
			else if (p->line.word.priority<= 150)
			{
				if ( p->line.word.priority != 150)
					error = TRUE;
				p->line.word.priority=150;			
			} 
			else if (p->line.word.priority<= 250)
			{
				if ( p->line.word.priority != 250)
					error = TRUE;
				p->line.word.priority=250;			
			} 
			else if (p->line.word.priority<= 325)
			{
				if ( p->line.word.priority != 325)
					error = TRUE;
				p->line.word.priority=325;			
			} 
			else if (p->line.word.priority<= 450)
			{
				if ( p->line.word.priority != 450)
					error = TRUE;
				p->line.word.priority=450;			
			} 
			else if (p->line.word.priority<= 500)
			{
				if ( p->line.word.priority != 500)
					error = TRUE;
				p->line.word.priority=500;			
			} 
			else if (p->line.word.priority<= 650)
			{
				if ( p->line.word.priority != 650)
					error = TRUE;
				p->line.word.priority=650;			
			} 
			else if (p->line.word.priority<= 850)
			{
				if ( p->line.word.priority != 850)
					error = TRUE;
				p->line.word.priority=850;			
			} 
			else  //if (p->line.word.priority<= 1200)
			{
				if ( p->line.word.priority != 1200)
					error = TRUE;
				p->line.word.priority=1200;			
			}
			
			// Output error(s) for priority
			if ( error )
			{
				if ( strlen(line) < 500)
				{	strcpy(temp, "INVALID PRIORITY\t\t");
					strcat(temp, line);
				}
				write_out_invalid(temp);
				error = FALSE;	// reset error
				exit = TRUE;
			}

			word_count++;
			p->line.word.wordnumber=word_count;
			q=add_to_list_end(p,q);				
		}
		
		free(line);
		//if (!exit)
			UpdateWordCount();
		fclose(curfile);
		if (invalidfile)
			fclose(invalidfile);
		
		// Close if errors
		if (exit)
		{	
			MessageBox("Error(s) while opening file.\nOpen invalid.txt for errors", "Error", MB_OK|MB_ICONEXCLAMATION);
			//OnFileClose();
		}

		//SortWordsInDictionary();

		LoadFirstWord();
		isModified=0;
		num_in_adv_list=0;
		m_AdvList.SetCheck(0);
		m_AdvList.EnableWindow(0);
		m_Commit.EnableWindow(0);
		m_RestoreWord.EnableWindow(0);
		m_SearchButton.EnableWindow(1);
		m_AddWord.EnableWindow(0);
		CWnd *pWnd=GetDlgItem(IDC_SEARCHWORD);
		pWnd->EnableWindow(1);
		isfilemodified=0;
		UpdateDisplay();
	}
}

void CDictoolDlg::OnFileOpenAsText() 
{	char command[256];
	char filename[256];
	char filter[]={"Dictionary Files (*.txt)|*.txt|All Files|*.*"};
	
	CFileDialog Filedlg(TRUE,".txt",NULL,OFN_OVERWRITEPROMPT, filter,NULL);
	if(Filedlg.DoModal()==IDOK)
	{
		strcpy(filename,Filedlg.m_ofn.lpstrFile);
		strcpy(command, "write \"");
		strcat(command, filename);
		strcat(command, "\"");
		if ( system(command) == -1)
			MessageBox("Error", "Unable to find file!", MB_OK);
	}

}

void CDictoolDlg::OnFileSave() 
{
	OnFileSaveEx(0);
}


void CDictoolDlg::OnFileSaveEx(int which) 
{
	// TODO: Add your command handler code here
	// save the file to the current name;
	plist_t p;
	int i,j;

	// check for modified data.
	//  if modified, ask to commit changes
	if (isModified)
	{
		int result=MessageBox("Saving without committing changes will result in the loss of changes.\nWould you like to commit the changes now?","Warning",MB_YESNOCANCEL|MB_ICONEXCLAMATION );
		if (result==6)
		{
			OnCommit();
		}
		if (result==2)
		{
			return;
		}
	}

	if (which)
	{
		curfile=fopen(advfile,"w");
	}
	else
	{
		if (filename[0]==0)
			return;
		curfile=fopen(filename,"w");
	}
	if (curfile==NULL)
	{
		char message[500];
		sprintf(message,"Could not open file %s",filename);
		MessageBox(message,"Error opening file",MB_OK|MB_ICONSTOP);
		return;
	}
	p=wordlist;
	while (p!=NULL)
	{
		if (p->is_comment)
		{
			if (which==0)
			{
				fprintf(curfile,"%s\n",p->line.comment.comment);
			}
			p=p->next;
			continue;
		}
		if (which==0 || (which==1 && p->line.word.in_sub_list==1 ))
		{
			fprintf(curfile,"%s,%c,%s,",p->line.word.graph,p->line.word.homo,p->line.word.phone);
			j=p->line.word.fc;
			for (i=0;i<29;i++)
			{
				fprintf(curfile,"%d",(j)&0x00000001);
				j>>=1;
			}
			fprintf(curfile,",%d\n",p->line.word.priority);
		}
		p=p->next;
	}	
	fclose(curfile);
	isfilemodified=0;
}

void CDictoolDlg::OnFileClose() 
{
	// TODO: Add your command handler code here
	// check is they want to save the file if modified; yes no cancel */
	if (wordlist!=NULL)
	{
		if (isModified)
		{
			int result=MessageBox("Closing the file without committing changes will result in the loss of changes.\nWould you like to commit the changes now?","Warning",MB_YESNOCANCEL|MB_ICONEXCLAMATION );
			if (result==6)// YES
			{
				OnCommit();
			}
			if (result==2)// CANCEL
			{
				return;
			}
		}
		
		if (isfilemodified)
		{		
			int result=MessageBox("Closing the file without saving will result in the loss of data.\nDo you want to save the file?","Warning",MB_YESNOCANCEL|MB_ICONQUESTION);
			if (result==2) //CANCEL
			{
				return;
			}
			if (result==6) // YES
			{
				if (filename[0])
					OnFileSave();
				else
					OnFileSaveAs();
			}
		}
		// since the file is closed after it is opened, we only have to empty the word list
		m_SearchButton.EnableWindow(0);
		CWnd *pWnd=GetDlgItem(IDC_SEARCHWORD);
		pWnd->EnableWindow(0);
		EmptyWordList();
		UpdateWordCount();
		isfilemodified=0;
		filename[0]='\0';
		SetWindowText("dictool");
		pMenu.EnableMenuItem(ID_FILE_SAVE,MF_GRAYED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_FILE_SAVE_AS,MF_GRAYED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_FILE_CLOSE,MF_GRAYED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_EDIT_GOTOWORD,MF_GRAYED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_EDIT_ADVANCEDSEARCH,MF_GRAYED|MF_BYCOMMAND);
		pMenu.EnableMenuItem(ID_EDIT_SAVEADVANCEDLIST,MF_GRAYED|MF_BYCOMMAND);
		UpdateDisplay();	
	}
}

void CDictoolDlg::OnOK() 
{
	// TODO: Add extra validation here
	
	//CDialog::OnOK();
	OnFileExit();
}

void CDictoolDlg::OnCancel() 
{
	// TODO: Add extra cleanup here
	
	//CDialog::OnCancel();
	OnFileExit();
}

plist_t CDictoolDlg::add_to_list_end(plist_t p,plist_t end)
{
	if (end==NULL)
	{
		wordlist=p;
		p->next=NULL;
		p->prev=NULL;
		return(p);
	}
	p->next=NULL;
	end->next=p;
	p->prev=end;
	wordlistend=p;
	return(p);
}
	
void CDictoolDlg::UpdateWordCount(void)
{
	char *words;
	words=(char *)malloc(100);
	if (words==NULL)
	{
		return;
	}
	if (word_count==1)
	{
		//SetDlgItemText(IDC_WORDCOUNT,"1 Word");
		m_WordCount="1 Word";
	}
	else
	{
		//sprintf(words,"%d Words",word_count);
		//SetDlgItemText(IDC_WORDCOUNT,words);
		m_WordCount.Format((LPCTSTR)"%d Words",word_count);
	}
	//Invalidate();
	UpdateData(FALSE);
	free(words);
	//UpdateDialogControls(GetTopLevelFrame(),FALSE);
}

void CDictoolDlg::EmptyWordList()
{
	plist_t p,q;
	int count=0;
	if (wordlist!=NULL)
	{
		p=wordlist;
		while (p!=NULL)
		{
			q=p;
			p=p->next;
			if (q->is_comment)
			{
				free(q->line.comment.comment);
				free(q);
				continue;
			}
			free(q->line.word.phone);
			free(q->line.word.graph);
			free(q);
			count++;
		}
		wordlist=NULL;
		wordlistend=NULL;
		cur_word=NULL;
		word_count=0;
		num_in_adv_list=0;
	}
}

void CDictoolDlg::OnFileSaveAs() 
{
	// TODO: Add your command handler code here
	// display the dialog box to save the file
	// then if they press ok, save the file	
	char filter[]={"Dictionary Files (*.txt)|*.txt|All Files|*.*"};
	CFileDialog Filedlg(FALSE,".txt",filename,OFN_OVERWRITEPROMPT, filter,NULL);
	if (isModified)
	{
		int result=MessageBox("Saving without committing changes will result in the loss of changes.\nWould you like to commit the changes now?","Warning",MB_YESNOCANCEL|MB_ICONEXCLAMATION );
		if (result==6)
		{
			OnCommit();
		}
		if (result==2)
		{
			return;
		}
	}
	if(Filedlg.DoModal()==IDOK)
	{
		strcpy(filename,Filedlg.m_ofn.lpstrFile);
		SetWindowText(filename);
		pMenu.EnableMenuItem(ID_FILE_SAVE,MF_ENABLED|MF_BYCOMMAND);
		OnFileSave();
	}
}

void CDictoolDlg::OnUpdatePhonemes() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function to send the EM_SETEVENTMASK message to the control
	// with the ENM_UPDATE flag ORed into the lParam mask.
	
	// TODO: Add your control notification handler code here
	char b[500];
	char *a;
	int length;
	int i,j;
	int phone;
	UpdateData(TRUE);
	length=m_Phonemes.GetLength();
	a=m_Phonemes.GetBuffer(length);
	for (j=0,i=0;i<length;i++,j++)
	{
		if (a[i]=='\\')
		{
			i++;
		}
		phone=ascky_rev[a[i]];
		if (phone==NULL_ASCKY)
		{
			strcpy(b,"Invalid Phoneme");
			i=8;
			break;
		}
		phone&=0x00FF;
		b[j*2]=arpa[phone*2];
		b[j*2+1]=arpa[phone*2+1];
	}
	b[j*2]='\0';

	m_ArpaPhones=b;
	UpdateData(FALSE);

	m_Phonemes.ReleaseBuffer(0);


	SetisModified();
}

void CDictoolDlg::UpdateDisplay()
{
	/* read the current word and set the information in the controls */
	int length=0;
	char *a;
	char b[500];
	int i,j;
	int phone;
	int count=0;

	if (cur_word==NULL || cur_word->is_comment)
	{
		a=m_CurrentWord.GetBuffer(2);
		a[0]='\0';
		m_CurrentWord.ReleaseBuffer(-1);

		m_DictWord="Word In Dictionary #";

		a=m_Phonemes.GetBuffer(2);
		a[0]='\0';
		m_Phonemes.ReleaseBuffer(-1);
		m_ArpaPhones="";
		
		m_Homograph.SetCurSel(0);
		m_Priority.SetCurSel(4);
		
		m_FC_ADJ.SetCheck(0);
		m_FC_ADV.SetCheck(0);
		m_FC_ART.SetCheck(0);
		m_FC_AUX.SetCheck(0);
		m_FC_BE.SetCheck(0);
		m_FC_BEV.SetCheck(0);
		m_FC_CONJ.SetCheck(0);
		m_FC_ED.SetCheck(0);
		m_FC_HAVE.SetCheck(0);
		m_FC_ING.SetCheck(0);
		m_FC_NOUN.SetCheck(0);
		m_FC_POS.SetCheck(0);
		m_FC_PREP.SetCheck(0);
		m_FC_PRON.SetCheck(0);
		m_FC_SUBCONJ.SetCheck(0);
		m_FC_THAT.SetCheck(0);
		m_FC_TO.SetCheck(0);
		m_FC_VERB.SetCheck(0);
		m_FC_WHO.SetCheck(0);
		m_FC_NEG.SetCheck(0);
		m_FC_INTER.SetCheck(0);
		m_FC_REF.SetCheck(0);
		m_FC_PART.SetCheck(0);
		m_FC_FUNC.SetCheck(0);
		m_FC_CONT.SetCheck(0);
		m_FC_CHARACTER.SetCheck(0);
		m_FC_REFR.SetCheck(0);
		m_FC_DET.SetCheck(0);	
		m_FC_NAME.SetCheck(0);	
		
		
		isModified=0;
		m_Commit.EnableWindow(0);
		m_RestoreWord.EnableWindow(0);
		m_AddWord.EnableWindow(0);
		
		UpdateData(FALSE);
		return;
	}

	length=strlen((char *)cur_word->line.word.graph);
	a=m_CurrentWord.GetBuffer(length+2);
	strcpy(a,(char *)cur_word->line.word.graph);
	m_CurrentWord.ReleaseBuffer(-1);

	sprintf(b,"Word In Dictionary #%d",cur_word->line.word.wordnumber);
	m_DictWord=b;

	length=strlen(cur_word->line.word.phone);
	a=m_Phonemes.GetBuffer(length+2);
	strcpy(a,cur_word->line.word.phone);

	for (i=0,j=0;i<length;i++,j++)
	{
		if (cur_word->line.word.phone[i]=='\\')
		{
			i++;
		}
		phone=ascky_rev[cur_word->line.word.phone[i]];
		if (phone==NULL_ASCKY)
		{
			strcpy(b,"Invalid Phoneme");
			i=8;
			break;
		}
		phone&=0x00FF;
		b[j*2]=arpa[phone*2];
		b[j*2+1]=arpa[phone*2+1];
	}
	b[j*2]='\0';

	m_Phonemes.ReleaseBuffer(-1);

	m_ArpaPhones=b;


	switch(cur_word->line.word.homo)
	{
	case 'N':
		m_Homograph.SetCurSel(0);
		break;
	case 'P':
		m_Homograph.SetCurSel(1);
		break;
	case 'S':
		m_Homograph.SetCurSel(2);
		break;
	}

	switch(cur_word->line.word.priority)
	{
	case 100:
		m_Priority.SetCurSel(0);
		break;
	case 150:
		m_Priority.SetCurSel(1);
		break;
	case 250:
		m_Priority.SetCurSel(2);
		break;
	case 325:
		m_Priority.SetCurSel(3);
		break;
	case 450:
		m_Priority.SetCurSel(4);
		break;
	case 500:
		m_Priority.SetCurSel(5);
		break;
	case 650:
		m_Priority.SetCurSel(6);
		break;
	case 850:
		m_Priority.SetCurSel(7);
		break;
	case 1200:
		m_Priority.SetCurSel(8);
		break;
	}

	if (cur_word->line.word.fc & FC_ADJ)
		m_FC_ADJ.SetCheck(1);
	else
		m_FC_ADJ.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_ADV)
		m_FC_ADV.SetCheck(1);
	else
		m_FC_ADV.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_ART)
		m_FC_ART.SetCheck(1);
	else
		m_FC_ART.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_AUX)
		m_FC_AUX.SetCheck(1);
	else
		m_FC_AUX.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_BE)
		m_FC_BE.SetCheck(1);
	else
		m_FC_BE.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_BEV)
		m_FC_BEV.SetCheck(1);
	else
		m_FC_BEV.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_CONJ)
		m_FC_CONJ.SetCheck(1);
	else
		m_FC_CONJ.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_ED)
		m_FC_ED.SetCheck(1);
	else
		m_FC_ED.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_HAVE)
		m_FC_HAVE.SetCheck(1);
	else
		m_FC_HAVE.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_ING)
		m_FC_ING.SetCheck(1);
	else
		m_FC_ING.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_NOUN)
		m_FC_NOUN.SetCheck(1);
	else
		m_FC_NOUN.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_POS)
		m_FC_POS.SetCheck(1);
	else
		m_FC_POS.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_PREP)
		m_FC_PREP.SetCheck(1);
	else
		m_FC_PREP.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_PRON)
		m_FC_PRON.SetCheck(1);
	else
		m_FC_PRON.SetCheck(0);
	
//	if (cur_word->line.word.fc & 0 /*FC_SUBCONJ*/)
	if (cur_word->line.word.fc & FC_SMS)
		m_FC_SUBCONJ.SetCheck(1);
	else
		m_FC_SUBCONJ.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_THAT)
		m_FC_THAT.SetCheck(1);
	else
		m_FC_THAT.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_TO)
		m_FC_TO.SetCheck(1);
	else
		m_FC_TO.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_VERB)
		m_FC_VERB.SetCheck(1);
	else
		m_FC_VERB.SetCheck(0);
	
//	if (cur_word->line.word.fc & FC_WHO)
	if (cur_word->line.word.fc & FC_WHOW)
		m_FC_WHO.SetCheck(1);
	else
		m_FC_WHO.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_NEG)
		m_FC_NEG.SetCheck(1);
	else
		m_FC_NEG.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_INTER)
		m_FC_INTER.SetCheck(1);
	else
		m_FC_INTER.SetCheck(0);
	
	if (cur_word->line.word.fc & 0/*FC_REF*/)
		m_FC_REF.SetCheck(1);
	else
		m_FC_REF.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_PART)
		m_FC_PART.SetCheck(1);
	else
		m_FC_PART.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_FUNC)
		m_FC_FUNC.SetCheck(1);
	else
		m_FC_FUNC.SetCheck(0);
	
//	if (cur_word->line.word.fc & FC_CONT)
	if (cur_word->line.word.fc & FC_CONTR)
		m_FC_CONT.SetCheck(1);
	else
		m_FC_CONT.SetCheck(0);
	
	if (cur_word->line.word.fc & FC_CHARACTER)
		m_FC_CHARACTER.SetCheck(1);
	else
		m_FC_CHARACTER.SetCheck(0);
	
	if (cur_word->line.word.fc & 0/*FC_REFR*/)
		m_FC_REFR.SetCheck(1);
	else
		m_FC_REFR.SetCheck(0);
	
	if (cur_word->line.word.fc & 0/*FC_DET*/)
		m_FC_DET.SetCheck(1);	
	else
		m_FC_DET.SetCheck(0);	

	if (cur_word->line.word.fc & FC_NAME)
		m_FC_NAME.SetCheck(1);	
	else
		m_FC_NAME.SetCheck(0);	


	isModified=0;
	m_Commit.EnableWindow(0);
	m_RestoreWord.EnableWindow(0);
	m_AddWord.EnableWindow(0);

	UpdateData(FALSE);
	
}

void CDictoolDlg::LoadFirstWord(void)
{
	plist_t p;

	p=wordlist;
	while (p!=NULL && p->is_comment)
	{
		p=p->next;
	}
	if (p!=NULL)
	{
		cur_word=p;
	}
}

void CDictoolDlg::SetisModified(void)
{
	UpdateData(TRUE);
	if (cur_word==NULL && m_CurrentWord.GetLength()==0)
	{
		return;
	}
	isModified=1;
	m_Commit.EnableWindow(isModified);
	m_RestoreWord.EnableWindow(isModified);

	switch (m_Homograph.GetCurSel())
	{
	case 1:
		if (cur_word && cur_word->line.word.homo!='P')
			m_AddWord.EnableWindow(1);
		break;
	case 2:
		if (cur_word && cur_word->line.word.homo!='S')
			m_AddWord.EnableWindow(1);
	}

	UpdateData(FALSE);
}


void CDictoolDlg::OnFcAdj() 
{
	// TODO: Add your control notification handler code here
	SetisModified();	
}

void CDictoolDlg::OnFcAdv() 
{
	// TODO: Add your control notification handler code here
	SetisModified();	
}

void CDictoolDlg::OnFcArt() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcAux() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcBe() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcBev() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcCharacter() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcConj() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcCont() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcDet() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcEd() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcFunc() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcHave() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcIng() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcInter() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcNeg() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcNoun() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcPart() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcPos() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcPrep() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcPron() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcRef() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcRefr() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcSubconj() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcThat() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcTo() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcVerb() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnFcWho() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
}

void CDictoolDlg::OnSelchangeHomograph() 
{
	// TODO: Add your control notification handler code here
	int update=0;	
	UpdateData(TRUE);
	if (cur_word!=NULL)
	{
		switch(m_Homograph.GetCurSel())
		{
		case 0:
			if (cur_word->line.word.homo!='N')
				update=1;
			break;
		case 1:
			if (cur_word->line.word.homo!='P')
				update=1;
			break;
		case 2:
			if (cur_word->line.word.homo!='S')
				update=1;
			break;
		}
	}
	else
	{
		if (m_CurrentWord.GetLength())
			update=1;
	}
	if (update)	
		SetisModified();
}

void CDictoolDlg::OnSelchangePriority() 
{
	// TODO: Add your control notification handler code here
	int update=0;
	UpdateData(TRUE);
	if (cur_word!=NULL)
	{
		switch(m_Priority.GetCurSel())
		{
		case 0:
			if (cur_word->line.word.priority!=100)
				update=1;
			break;
		case 1:
			if (cur_word->line.word.priority!=150)
				update=1;
			break;
		case 2:
			if (cur_word->line.word.priority!=250)
				update=1;
			break;
		case 3:
			if (cur_word->line.word.priority!=325)
				update=1;
			break;
		case 4:
			if (cur_word->line.word.priority!=450)
				update=1;
			break;
		case 5:
			if (cur_word->line.word.priority!=500)
				update=1;
			break;
		case 6:
			if (cur_word->line.word.priority!=650)
				update=1;
			break;
		case 7:
			if (cur_word->line.word.priority!=850)
				update=1;
			break;
		case 8:
			if (cur_word->line.word.priority!=1200)
				update=1;
			break;
		}
	}
	else
	{
		if (m_CurrentWord.GetLength())
			update=1;
	}
	if (update)
		SetisModified();
}

void CDictoolDlg::OnRestoreWord() 
{
	// TODO: Add your control notification handler code here
	if (isModified)
	{
		int result=MessageBox("This will result in the loss of your changes.\nProceed with the cancel?","Warning",MB_YESNO|MB_ICONEXCLAMATION|MB_DEFBUTTON2 );
		if (result==6)
		{
			UpdateDisplay();
		}
	}	
}

void CDictoolDlg::OnUpdateSearchword() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function to send the EM_SETEVENTMASK message to the control
	// with the ENM_UPDATE flag ORed into the lParam mask.
	
	// TODO: Add your control notification handler code here
	searchwordmodified=1;	
}

void CDictoolDlg::OnUpdateCurrentword() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function to send the EM_SETEVENTMASK message to the control
	// with the ENM_UPDATE flag ORed into the lParam mask.
	
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (m_CurrentWord.GetLength()==0)
	{
		m_AddWord.EnableWindow(0);
		if (cur_word==NULL)
		{
			m_Commit.EnableWindow(0);
		}
	}
	else
	{
		m_AddWord.EnableWindow(1);
	}
}

void CDictoolDlg::OnPronounce()
{
	// TODO: Add your control notification handler code here
	char *a;
	int length;
	char b[500];
	int i,j;
	if (phTTS==NULL)
		return;
	UpdateData(TRUE);
	length=m_Phonemes.GetLength();
	a=m_Phonemes.GetBuffer(length);

	sprintf(b,"[:phon asky on][");
	for (j=strlen(b),i=0;i<length;i++,j++)
	{
		if (a[i]=='\\')
		{
			i++;
		}
		b[j]=a[i];
	}
	b[j++]=']';
	b[j]='\0';
	
	m_Phonemes.ReleaseBuffer(0);
	if (justspoke)
		TextToSpeechReset(phTTS,FALSE);

	TextToSpeechSpeak(phTTS,b,TTS_FORCE);
	justspoke=1;

	
}

void CDictoolDlg::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
	// TODO: Add your message handler code here and/or call default

	CDialog::OnKeyDown(nChar, nRepCnt, nFlags);
}

BOOL CDictoolDlg::PreTranslateMessage(MSG* pMsg) 
{
	// TODO: Add your specialized code here and/or call the base class
	int res;
	int id;
	CWnd *pcWnd;
	if (m_pri_mode)
	{
	if ((res=TranslateAccelerator(m_hWnd,hPriAccel,pMsg))!=0)
		return(1);
	}
	else
	{
	if ((res=TranslateAccelerator(m_hWnd,hAccel,pMsg))!=0)
		return(1);
	}

	if (pMsg->wParam==13 && pMsg->message==256)
	{
		pcWnd=GetFocus();
		id=pcWnd->GetDlgCtrlID();
		if (id==IDC_SEARCHWORD || id==IDC_SEARCH_BUTTON)
		{
			OnSearchButton();
			return(1);
		}
		else
		{
			return(0);
		}
	}

	return CDialog::PreTranslateMessage(pMsg);

}

void CDictoolDlg::OnEditGotoword() 
{
	// TODO: Add your command handler code here
	plist_t p;


	WordNumber dlg;
	int response=dlg.DoModal();

	if (dlg.returnednumber>word_count || dlg.returnednumber<0)
	{
		cur_word=NULL;
		UpdateDisplay();
		return;
	}
	if (response==IDOK)
	{
		p=cur_word;
		if (p==NULL)
		{
			p=wordlist;
		}
		if (dlg.returnednumber<p->line.word.wordnumber)
		{
			while (p!=NULL )
			{
				if (p->is_comment)
				{
					p=p->prev;
					continue;
				}
				if (dlg.returnednumber>=p->line.word.wordnumber)
				{
					break;
				}
				p=p->prev;

			}
			cur_word=p;
			UpdateDisplay();
			OnPronounce();
		}
		else if (dlg.returnednumber>p->line.word.wordnumber)
		{
			while (p!=NULL)
			{
				if (p->is_comment)
				{
					p=p->next;
					continue;
				}
				if (dlg.returnednumber<=p->line.word.wordnumber)
				{
					break;
				}
				p=p->next;
			}
			cur_word=p;
			UpdateDisplay();
			OnPronounce();
		}
	}
}

void CDictoolDlg::UpdateWordNumbers(void)
{
	int count=1;
	plist_t p;

	p=wordlist;
	while (p!=NULL)
	{
		if (p->is_comment)
		{
			p=p->next;
			continue;
		}
		p->line.word.wordnumber=count;
		count++;
		p=p->next;
	}
	word_count=count-1;
}

void CDictoolDlg::OnFcName() 
{
	// TODO: Add your control notification handler code here
	SetisModified();
	
}

void CDictoolDlg::OnEditAutoadvance() 
{
	// TODO: Add your command handler code here
	MENUITEMINFO info;
	info.fMask=MIIM_STATE;
	info.fState=0;
	info.cbSize=sizeof(info);


	pMenu.GetMenuItemInfo(ID_EDIT_AUTOADVANCE,&info,FALSE);

	if (info.fState&MFS_CHECKED)
	{
		pMenu.CheckMenuItem(ID_EDIT_AUTOADVANCE,MF_UNCHECKED|MF_BYCOMMAND);
	}
	else
	{
		pMenu.CheckMenuItem(ID_EDIT_AUTOADVANCE,MF_CHECKED|MF_BYCOMMAND);
	}

}

void CDictoolDlg::OnLanguageUsenglish() 
{
	// TODO: Add your command handler code here
	if (current_language==ID_LANGUAGE_USENGLISH)
		return;

	pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
	
	TextToSpeechShutdown(phTTS);
	phTTS=NULL;
	tts_cur=tts_us;
	current_language=ID_LANGUAGE_USENGLISH;
	TextToSpeechSelectLang(NULL,tts_cur);
	if (TextToSpeechStartupEx(&phTTS,WAVE_MAPPER,REPORT_OPEN_ERROR,NULL,NULL))
	{
		MessageBox("Error starting DECtalk, Pronounce word will not work","Information",MB_OK|MB_ICONINFORMATION);
		m_Pronounce.EnableWindow(0);
		pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
		phTTS=NULL;
	}
	else
	{
		pMenu.CheckMenuItem(current_language,MF_CHECKED|MF_BYCOMMAND);
		m_Pronounce.EnableWindow(1);
		ascky=usa_ascky;
		ascky_rev=usa_ascky_rev;
		arpa=usa_arpa;
		UpdateDisplay();
	}
}

void CDictoolDlg::OnLanguageUkenglish() 
{
	// TODO: Add your command handler code here
	if (current_language==ID_LANGUAGE_UKENGLISH)
		return;

	pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
	
	TextToSpeechShutdown(phTTS);
	phTTS=NULL;
	tts_cur=tts_uk;
	current_language=ID_LANGUAGE_UKENGLISH;
	TextToSpeechSelectLang(NULL,tts_cur);
	if (TextToSpeechStartupEx(&phTTS,WAVE_MAPPER,REPORT_OPEN_ERROR,NULL,NULL))
	{
		MessageBox("Error starting DECtalk, Pronounce word will not work","Information",MB_OK|MB_ICONINFORMATION);
		m_Pronounce.EnableWindow(0);
		pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
		phTTS=NULL;
	}
	else
	{
		pMenu.CheckMenuItem(current_language,MF_CHECKED|MF_BYCOMMAND);
		m_Pronounce.EnableWindow(1);
		ascky=uk_ascky;
		ascky_rev=uk_ascky_rev;
		arpa=uk_arpa;
		UpdateDisplay();
	}	
}

void CDictoolDlg::OnLanguageSpanish() 
{
	// TODO: Add your command handler code here
	if (current_language==ID_LANGUAGE_SPANISH)
		return;

	pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
	
	TextToSpeechShutdown(phTTS);
	phTTS=NULL;
	tts_cur=tts_sp;
	current_language=ID_LANGUAGE_SPANISH;
	TextToSpeechSelectLang(NULL,tts_cur);
	if (TextToSpeechStartupEx(&phTTS,WAVE_MAPPER,REPORT_OPEN_ERROR,NULL,NULL))
	{
		MessageBox("Error starting DECtalk, Pronounce word will not work","Information",MB_OK|MB_ICONINFORMATION);
		m_Pronounce.EnableWindow(0);
		pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
		phTTS=NULL;
	}
	else
	{
		pMenu.CheckMenuItem(current_language,MF_CHECKED|MF_BYCOMMAND);
		m_Pronounce.EnableWindow(1);
		ascky=spanish_ascky;
		ascky_rev=spanish_ascky_rev;
		arpa=spanish_arpa;
		UpdateDisplay();
	}		
}

void CDictoolDlg::OnLanguageLatinamerican() 
{
	// TODO: Add your command handler code here
	if (current_language==ID_LANGUAGE_LATINAMERICAN)
		return;

	pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
	
	TextToSpeechShutdown(phTTS);
	phTTS=NULL;
	tts_cur=tts_la;
	current_language=ID_LANGUAGE_LATINAMERICAN;
	TextToSpeechSelectLang(NULL,tts_cur);
	if (TextToSpeechStartupEx(&phTTS,WAVE_MAPPER,REPORT_OPEN_ERROR,NULL,NULL))
	{
		MessageBox("Error starting DECtalk, Pronounce word will not work","Information",MB_OK|MB_ICONINFORMATION);
		m_Pronounce.EnableWindow(0);
		pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
		phTTS=NULL;
	}
	else
	{
		pMenu.CheckMenuItem(current_language,MF_CHECKED|MF_BYCOMMAND);
		m_Pronounce.EnableWindow(1);
		ascky=la_ascky;
		ascky_rev=la_ascky_rev;
		arpa=la_arpa;
		UpdateDisplay();
	}
}

void CDictoolDlg::OnLanguageGerman() 
{
	// TODO: Add your command handler code here
	if (current_language==ID_LANGUAGE_GERMAN)
		return;

	pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
	
	TextToSpeechShutdown(phTTS);
	phTTS=NULL;
	tts_cur=tts_gr;
	current_language=ID_LANGUAGE_GERMAN;
	TextToSpeechSelectLang(NULL,tts_cur);
	if (TextToSpeechStartupEx(&phTTS,WAVE_MAPPER,REPORT_OPEN_ERROR,NULL,NULL))
	{
		MessageBox("Error starting DECtalk, Pronounce word will not work","Information",MB_OK|MB_ICONINFORMATION);
		m_Pronounce.EnableWindow(0);
		pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
		phTTS=NULL;
	}
	else
	{
		pMenu.CheckMenuItem(current_language,MF_CHECKED|MF_BYCOMMAND);
		m_Pronounce.EnableWindow(1);
		ascky=german_ascky;
		ascky_rev=german_ascky_rev;
		arpa=german_arpa;
		UpdateDisplay();
	}
}

void CDictoolDlg::OnLanguageFrench() 
{
	// TODO: Add your command handler code here
	if (current_language==ID_LANGUAGE_FRENCH)
		return;

	pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
	
	TextToSpeechShutdown(phTTS);
	phTTS=NULL;
	tts_cur=tts_fr;
	current_language=ID_LANGUAGE_FRENCH;
	TextToSpeechSelectLang(NULL,tts_cur);
	if (TextToSpeechStartupEx(&phTTS,WAVE_MAPPER,REPORT_OPEN_ERROR,NULL,NULL))
	{
		MessageBox("Error starting DECtalk, Pronounce word will not work","Information",MB_OK|MB_ICONINFORMATION);
		m_Pronounce.EnableWindow(0);
		pMenu.CheckMenuItem(current_language,MF_UNCHECKED|MF_BYCOMMAND);
		phTTS=NULL;
	}
	else
	{
		pMenu.CheckMenuItem(current_language,MF_CHECKED|MF_BYCOMMAND);
		m_Pronounce.EnableWindow(1);
		ascky=french_ascky;
		ascky_rev=french_ascky_rev;
		arpa=french_arpa;
		UpdateDisplay();
	}	
}

void CDictoolDlg::write_out_invalid(char *line)
{
	char str[] = ",";
	char *token, temp[500];
	int start = 0, i = 0;

	if (invalidfile==NULL)
	{
		invalidfile=fopen("invalid.txt","w");
		fprintf(invalidfile, "Error\t\t\t%-20s%-5s%-30s%-30s%-5s\n", "Entry", "HG",
			    "Phoneme", "Part of speech", "Priority");
		fprintf(invalidfile, "---------------   ------------------  ---  ----------------------------  ");
		fprintf(invalidfile, "----------------------------- ---\n");
	}
	
	// Separate error message
	for ( i = 0; line[i] != NULL; i++)
	{	if ( line[i] == '\t')
			start = i + 1;
	}
	strncpy(temp, line, start-1);
	temp[start-1]= '\0';
	fprintf(invalidfile, "%s", temp);

	token = strtok( &line[start], str );
	for (i = 1; token != NULL; i++ )
	{
		switch (i)
		{
			case 1:	fprintf(invalidfile,"%-20s", token);
					break;
			case 2:	fprintf(invalidfile,"%-5s", token);
					break;
			case 3:	fprintf(invalidfile,"%-30s", token);
					break;
			case 4:	fprintf(invalidfile,"%-30s", token);
					break;
			case 5:	fprintf(invalidfile,"%-5s", token);
					break;
		}
		/* Get next token: */
		token = strtok( NULL, str );
	}

	fprintf(invalidfile,"\n");
}

void CDictoolDlg::OnEditAdvancedsearch() 
{
	// TODO: Add your command handler code here


	CAdvSearchDlg dlg;
	if (cur_word!=NULL && isModified)
	{
		int result=MessageBox("Doing an advanced search without committing changes will result in the loss of changes.\nWould you like to commit the changes now?","Warning",MB_YESNOCANCEL|MB_ICONEXCLAMATION );
		if (result==6)// YES
		{
			OnCommit();
		}
		if (result==2)// CANCEL
		{
			return;
		}
	}

	dlg.p=(void *)this;

	int response=dlg.DoModal();

	if (response==IDOK)
	{
		num_in_adv_list=dlg.number_in_list;
		if (num_in_adv_list)
		{
			m_AdvList.SetCheck(1);
			m_AdvList.EnableWindow(1);
			pMenu.EnableMenuItem(ID_EDIT_SAVEADVANCEDLIST,MF_ENABLED|MF_BYCOMMAND);
			cur_word=NULL;
			OnNextWord();
		}
		else
		{
			m_AdvList.SetCheck(0);
			m_AdvList.EnableWindow(0);
			pMenu.EnableMenuItem(ID_EDIT_SAVEADVANCEDLIST,MF_GRAYED|MF_BYCOMMAND);
		}
	}	
}

void CDictoolDlg::OnEditSaveadvancedlist() 
{

	// TODO: Add your command handler code here
	char filter[]={"Dictionary Files (*.txt)|*.txt|All Files|*.*"};
	CFileDialog Filedlg(FALSE,".txt",advfile,OFN_OVERWRITEPROMPT, filter,NULL);
	if(Filedlg.DoModal()==IDOK)
	{
		strcpy(advfile,Filedlg.m_ofn.lpstrFile);
		//pMenu.EnableMenuItem(ID_FILE_SAVE,MF_ENABLED|MF_BYCOMMAND);
		OnFileSaveEx(1);
	}
	
}

void CDictoolDlg::OnEditPrioritysetmode() 
{
	// TODO: Add your command handler code here
	if (m_pri_mode)
	{
		pMenu.CheckMenuItem(ID_EDIT_PRIORITYSETMODE,MF_UNCHECKED|MF_BYCOMMAND);
		m_pri_mode=0;
		m_Pri1.EnableWindow(0);
		m_Pri2.EnableWindow(0);
		m_Pri3.EnableWindow(0);
		m_Pri4.EnableWindow(0);
		m_Pri5.EnableWindow(0);
		m_Pri6.EnableWindow(0);
		m_Pri7.EnableWindow(0);
		m_Pri8.EnableWindow(0);
		m_Pri9.EnableWindow(0);
	}
	else
	{
		pMenu.CheckMenuItem(ID_EDIT_PRIORITYSETMODE,MF_CHECKED|MF_BYCOMMAND);
		m_pri_mode=1;
		m_Pri1.EnableWindow(1);
		m_Pri2.EnableWindow(1);
		m_Pri3.EnableWindow(1);
		m_Pri4.EnableWindow(1);
		m_Pri5.EnableWindow(1);
		m_Pri6.EnableWindow(1);
		m_Pri7.EnableWindow(1);
		m_Pri8.EnableWindow(1);
		m_Pri9.EnableWindow(1);
	}
	
}

void CDictoolDlg::OnPri1() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (cur_word==NULL)
	{
		return;
	}
	m_Priority.SetCurSel(0);
	SetisModified();
	OnCommit();
}

void CDictoolDlg::OnPri2() 
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (cur_word==NULL)
	{
		return;
	}
	m_Priority.SetCurSel(1);
	SetisModified();
	OnCommit();
	
}

void CDictoolDlg::OnPri3() 
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (cur_word==NULL)
	{
		return;
	}
	m_Priority.SetCurSel(2);
	SetisModified();
	OnCommit();
	
}

void CDictoolDlg::OnPri4() 
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (cur_word==NULL)
	{
		return;
	}
	m_Priority.SetCurSel(3);
	SetisModified();
	OnCommit();
	
}

void CDictoolDlg::OnPri5() 
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (cur_word==NULL)
	{
		return;
	}
	m_Priority.SetCurSel(4);
	SetisModified();
	OnCommit();
	
}

void CDictoolDlg::OnPri6() 
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (cur_word==NULL)
	{
		return;
	}
	m_Priority.SetCurSel(5);
	SetisModified();
	OnCommit();
	
}

void CDictoolDlg::OnPri7() 
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (cur_word==NULL)
	{
		return;
	}
	m_Priority.SetCurSel(6);
	SetisModified();
	OnCommit();
	
}

void CDictoolDlg::OnPri8() 
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (cur_word==NULL)
	{
		return;
	}
	m_Priority.SetCurSel(7);
	SetisModified();
	OnCommit();
	
}

void CDictoolDlg::OnPri9() 
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (cur_word==NULL)
	{
		return;
	}
	m_Priority.SetCurSel(8);
	SetisModified();
	OnCommit();
	
}

int compare_sort_words(const void *in_a, const void *in_b)
{
	int res;
	list_t *a, *b;

	a=*((list_t **)in_a);
	b=*((list_t **)in_b);

	res=strcmp((char *)a->line.word.graph,(char *)b->line.word.graph);
	if (res<0)
	{
		return(-1);
	}
	if (res==0)
	{
		if (a->line.word.homo=='N')
		{
			if (a->line.word.wordnumber<b->line.word.wordnumber)
				return(-1);
			if (a->line.word.wordnumber>b->line.word.wordnumber)
				return(1);
			return(0);
		}
		else 
		{
			if (a->line.word.homo==b->line.word.homo)
			{
				if (a->line.word.wordnumber<b->line.word.wordnumber)
					return(-1);
				if (a->line.word.wordnumber>b->line.word.wordnumber)
					return(1);
				return(0);
			}
			if (a->line.word.homo=='P' && b->line.word.homo=='S')
			{
				return(-1);
			}
			if (a->line.word.homo=='S' && b->line.word.homo=='P')
			{
				return(1);
			}
		}
	}
	return(1);
}
	

void CDictoolDlg::SortWordsInDictionary()
{
	list_t *p;
	list_t *new_list=NULL;
	list_t *last_new_list=NULL;
	list_t *q;
	int pos=0;
	int i;

	list_t **arr;

	arr=(list_t **)malloc(sizeof(list_t *)*word_count);

	p=wordlist;
	
	new_list=NULL;

	// put all comments at the top
	while (p!=NULL)
	{
		if (p->is_comment)
		{
			q=p->next;
			if (last_new_list==NULL)
			{
				q=p;
				p=p->next;
				new_list=q;
				last_new_list=q;
				q->next=NULL;
				q->prev=NULL;
				if (q==wordlist)
					wordlist=p;
			}
			else
			{
				q=p;
				p=p->next;
				last_new_list->next=q;
				q->prev=last_new_list;
				q->next=NULL;
				last_new_list=q;
				if (q==wordlist)
					wordlist=p;
			}
		}
		else
		{
			p=p->next;
		} 
	}

	// put words in to an array for qsort;
	p=wordlist;
	pos=0;
	while (p!=NULL)
	{
		arr[pos++]=p;
		p=p->next;
	}

	qsort(arr,word_count,sizeof(line_t *),compare_sort_words);

	if (last_new_list)
	{
		last_new_list->next=arr[0];
		arr[0]->prev=last_new_list;
		last_new_list=arr[0];
	}
	else
	{
		new_list=arr[0];
		last_new_list=arr[0];
		new_list->prev=NULL;
		last_new_list->next=NULL;
	}

	wordlistend=last_new_list;
	for (i=1;i<word_count;i++)
	{
		p=arr[i];
		p->prev=wordlistend;
		p->next=NULL;
		wordlistend->next=p;
		wordlistend=p;
	}
	wordlist=new_list;

	UpdateWordNumbers();
	UpdateWordCount();
	free(arr);

}

void CDictoolDlg::OnEditSortdictionary() 
{
	// TODO: Add your command handler code here
	SortWordsInDictionary();	
	LoadFirstWord();
	UpdateDisplay();
}

void CDictoolDlg::OnEditRemovedulpicates() 
{
	// TODO: Add your command handler code here
	list_t *p;
	list_t *q;
	list_t *r;
	int res;
	int del_q=0;

	p=wordlist;

	if (p)
		q=p->next;
	while (p!=NULL && q!=NULL)
	{
		if (p->is_comment)
		{
			p=p->next;
			continue;
		}
		del_q=0;
		res=strcmp((char *)p->line.word.graph,(char *)q->line.word.graph);
		if (res==0)
		{
			if (p->line.word.homo=='N')
			{
				// delete q;
				del_q=1;		
			}
			else 
			{
				if (p->line.word.homo==q->line.word.homo)
				{
					del_q=1;
					
				}
			}
		}
		if (del_q)
		{				
			if (q==wordlistend)
			{
				p->next=NULL;
				wordlistend=p;
			}
			else
			{
				r=q->next;
				p->next=r;
				r->prev=p;
			}
			free(q->line.word.graph);
			free(q->line.word.phone);
			free(q);	
			q=p->next;
		}
		else
		{
			p=p->next;
			if (p)
				q=p->next;
		}
	}
	UpdateWordNumbers();
	UpdateWordCount();
	LoadFirstWord();
	UpdateDisplay();
}
