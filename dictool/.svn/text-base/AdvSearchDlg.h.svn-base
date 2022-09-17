#if !defined(AFX_ADVSEARCHDLG_H__6E4EEC53_EF17_11D5_BF10_0060083E8376__INCLUDED_)
#define AFX_ADVSEARCHDLG_H__6E4EEC53_EF17_11D5_BF10_0060083E8376__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// AdvSearchDlg.h : header file
//

#include "dictoolDlg.h"

#include "wordlist.h"
extern list_t *wordlist;
extern list_t *wordlistend;

/////////////////////////////////////////////////////////////////////////////
// CAdvSearchDlg dialog

class CAdvSearchDlg : public CDialog
{
// Construction
public:
	CAdvSearchDlg(CWnd* pParent = NULL);   // standard constructor

	CFont pEditFont;
	CFont pLabelFont;
	void *p;
	int number_in_list;

	int compare_words(unsigned char *search,unsigned char *test,int type);
	int compare_character(unsigned char  a,unsigned char b,int type);

	// Dialog Data
	//{{AFX_DATA(CAdvSearchDlg)
	enum { IDD = IDD_ADVSEARCH };
	CComboBox	m_HomoSearch;
	CComboBox	m_PriorityType;
	CComboBox	m_PrioritySearch;
	CButton	m_SaveList;
	CButton	m_FC_CHARACTER;
	CButton	m_FC_FUNC;
	CButton	m_FC_SUBCONJ;
	CButton	m_FC_ING;
	CButton	m_FC_WHO;
	CButton	m_FC_VERB;
	CButton	m_FC_TO;
	CButton	m_FC_THAT;
	CButton	m_FC_REFR;
	CButton	m_FC_REF;
	CButton	m_FC_PRON;
	CButton	m_FC_PREP;
	CButton	m_FC_POS;
	CButton	m_FC_PART;
	CButton	m_FC_NOUN;
	CButton	m_FC_NEG;
	CButton	m_FC_NAME;
	CButton	m_FC_INTER;
	CButton	m_FC_HAVE;
	CButton	m_FC_ED;
	CButton	m_FC_DET;
	CButton	m_FC_CONT;
	CButton	m_FC_CONJ;
	CButton	m_FC_BEV;
	CButton	m_FC_BE;
	CButton	m_FC_AUX;
	CButton	m_FC_ART;
	CButton	m_FC_ADV;
	CButton	m_FC_ADJ;
	CComboBox	m_SearchClassType;
	CComboBox	m_SearchType;
	CString	m_SearchWord;
	CString	m_WordsFound;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAdvSearchDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CAdvSearchDlg)
	afx_msg void OnBuildlist();
	virtual BOOL OnInitDialog();
	afx_msg void OnSavelist();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ADVSEARCHDLG_H__6E4EEC53_EF17_11D5_BF10_0060083E8376__INCLUDED_)
