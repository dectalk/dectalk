// dictoolDlg.h : header file
//

#if !defined(AFX_DICTOOLDLG_H__54ED40C3_4EC5_11D5_BF07_0060083E8376__INCLUDED_)
#define AFX_DICTOOLDLG_H__54ED40C3_4EC5_11D5_BF07_0060083E8376__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "wordnumber.h"
#include "AdvSearchDlg.h"

#include <windows.h>
#include <mmsystem.h>

#include "wordlist.h"

extern list_t *wordlist;
extern list_t *wordlistend;
	

/////////////////////////////////////////////////////////////////////////////
// CDictoolDlg dialog

class CDictoolDlg : public CDialog
{
// Construction
public:
	CDictoolDlg(CWnd* pParent = NULL);	// standard constructor

	char filename[500];
	char advfile[500];
	FILE *curfile;
	FILE *invalidfile;
	list_t *cur_word;	// pointer to the curent word
	int word_count;
	int need_save;
	int isModified;
	int isfilemodified;
	CFont pEditFont;
	CFont pLabelFont;	
	CFont pArpaFont;	
	CMenu pMenu;
	int searchwordmodified;
	LPTTS_HANDLE_T phTTS;
	int us_on,uk_on,gr_on,sp_on,la_on,fr_on;
	int tts_us,tts_uk,tts_gr,tts_sp,tts_la,tts_fr;
	int tts_cur;
	int current_language;
	LPLANG_ENUM languageINFO;
	HACCEL hAccel;
	HACCEL hPriAccel;
	int justspoke;
	int num_in_adv_list;
	int m_pri_mode;

	plist_t add_to_list_end(plist_t p,plist_t end);
	void UpdateWordCount(void);
	void EmptyWordList(void);
	void UpdateDisplay(void);
	void LoadFirstWord(void);
	void LoadWord(list_t *p);
	void SetisModified(void);
	int compare_words(unsigned char *search,unsigned char *test,int type);
	void UpdateWordNumbers(void);
	int compare_character(unsigned char  a,unsigned char b,int type);
	void write_out_invalid(char *line);
	void OnFileSaveEx(int which);
	void SortWordsInDictionary(void);
 

// Dialog Data
	//{{AFX_DATA(CDictoolDlg)
	enum { IDD = IDD_DICTOOL_DIALOG };
	CButton	m_Pri9;
	CButton	m_Pri8;
	CButton	m_Pri7;
	CButton	m_Pri6;
	CButton	m_Pri5;
	CButton	m_Pri4;
	CButton	m_Pri3;
	CButton	m_Pri2;
	CButton	m_Pri1;
	CButton	m_AdvList;
	CButton	m_AutoPron;
	CButton	m_FC_NAME;
	CComboBox	m_SearchDirection;
	CButton	m_Pronounce;
	CButton	m_AddWord;
	CButton	m_SearchButton;
	CButton	m_RestoreWord;
	CButton	m_Commit;
	CComboBox	m_SearchType;
	CButton	m_FC_PRON;
	CButton	m_FC_WHO;
	CButton	m_FC_VERB;
	CButton	m_FC_TO;
	CButton	m_FC_THAT;
	CButton	m_FC_SUBCONJ;
	CButton	m_FC_REFR;
	CButton	m_FC_REF;
	CButton	m_FC_PREP;
	CButton	m_FC_POS;
	CButton	m_FC_PART;
	CButton	m_FC_NOUN;
	CButton	m_FC_NEG;
	CButton	m_FC_INTER;
	CButton	m_FC_ING;
	CButton	m_FC_HAVE;
	CButton	m_FC_FUNC;
	CButton	m_FC_ED;
	CButton	m_FC_DET;
	CButton	m_FC_CONT;
	CButton	m_FC_CONJ;
	CButton	m_FC_CHARACTER;
	CButton	m_FC_BEV;
	CButton	m_FC_BE;
	CButton	m_FC_AUX;
	CButton	m_FC_ART;
	CButton	m_FC_ADV;
	CButton	m_FC_ADJ;
	CComboBox	m_Priority;
	CComboBox	m_Homograph;
	CButton	m_Changed;
	CString	m_CurrentWord;
	CString	m_Phonemes;
	CString	m_WordCount;
	CString	m_SearchWord;
	CString	m_ArpaPhones;
	CString	m_DictWord;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDictoolDlg)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDictoolDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnSearchButton();
	afx_msg void OnNextWord();
	afx_msg void OnPreviousWord();
	afx_msg void OnAddword();
	afx_msg void OnCommit();
	afx_msg void OnDeleteword();
	afx_msg void OnHelpAbout();
	afx_msg void OnFileExit();
	afx_msg void OnFileOpen();
	afx_msg void OnFileOpenAsText();
	afx_msg void OnFileSave();
	afx_msg void OnFileClose();
	virtual void OnOK();
	virtual void OnCancel();
	afx_msg void OnFileSaveAs();
	afx_msg void OnUpdatePhonemes();
	afx_msg void OnFcAdj();
	afx_msg void OnFcAdv();
	afx_msg void OnFcArt();
	afx_msg void OnFcAux();
	afx_msg void OnFcBe();
	afx_msg void OnFcBev();
	afx_msg void OnFcCharacter();
	afx_msg void OnFcConj();
	afx_msg void OnFcCont();
	afx_msg void OnFcDet();
	afx_msg void OnFcEd();
	afx_msg void OnFcFunc();
	afx_msg void OnFcHave();
	afx_msg void OnFcIng();
	afx_msg void OnFcInter();
	afx_msg void OnFcNeg();
	afx_msg void OnFcNoun();
	afx_msg void OnFcPart();
	afx_msg void OnFcPos();
	afx_msg void OnFcPrep();
	afx_msg void OnFcPron();
	afx_msg void OnFcRef();
	afx_msg void OnFcRefr();
	afx_msg void OnFcSubconj();
	afx_msg void OnFcThat();
	afx_msg void OnFcTo();
	afx_msg void OnFcVerb();
	afx_msg void OnFcWho();
	afx_msg void OnSelchangeHomograph();
	afx_msg void OnSelchangePriority();
	afx_msg void OnRestoreWord();
	afx_msg void OnUpdateSearchword();
	afx_msg void OnUpdateCurrentword();
	afx_msg void OnPronounce();
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnEditGotoword();
	afx_msg void OnFcName();
	afx_msg void OnEditAutoadvance();
	afx_msg void OnLanguageUsenglish();
	afx_msg void OnLanguageUkenglish();
	afx_msg void OnLanguageSpanish();
	afx_msg void OnLanguageLatinamerican();
	afx_msg void OnLanguageGerman();
	afx_msg void OnLanguageFrench();
	afx_msg void OnEditAdvancedsearch();
	afx_msg void OnEditSaveadvancedlist();
	afx_msg void OnEditPrioritysetmode();
	afx_msg void OnPri1();
	afx_msg void OnPri2();
	afx_msg void OnPri3();
	afx_msg void OnPri4();
	afx_msg void OnPri5();
	afx_msg void OnPri6();
	afx_msg void OnPri7();
	afx_msg void OnPri8();
	afx_msg void OnPri9();
	afx_msg void OnEditSortdictionary();
	afx_msg void OnEditRemovedulpicates();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DICTOOLDLG_H__54ED40C3_4EC5_11D5_BF07_0060083E8376__INCLUDED_)
