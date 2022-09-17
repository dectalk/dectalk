// AdvSearchDlg.cpp : implementation file
//

#include "stdafx.h"
#include "dictool.h"
#include "AdvSearchDlg.h"
#include "fc_def.tab"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


extern unsigned char lslower[];
/////////////////////////////////////////////////////////////////////////////
// CAdvSearchDlg dialog


CAdvSearchDlg::CAdvSearchDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CAdvSearchDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CAdvSearchDlg)
	m_SearchWord = _T("");
	m_WordsFound = _T("");
	//}}AFX_DATA_INIT
}


void CAdvSearchDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAdvSearchDlg)
	DDX_Control(pDX, IDC_HOMO_SEARCH, m_HomoSearch);
	DDX_Control(pDX, IDC_PRIORITY_TYPE_SEARCH, m_PriorityType);
	DDX_Control(pDX, IDC_PRIORITY_SEARCH, m_PrioritySearch);
	DDX_Control(pDX, IDC_SAVELIST, m_SaveList);
	DDX_Control(pDX, IDC_FC_CHARACTER, m_FC_CHARACTER);
	DDX_Control(pDX, IDC_FC_FUNC, m_FC_FUNC);
	DDX_Control(pDX, IDC_FC_SUBCONJ, m_FC_SUBCONJ);
	DDX_Control(pDX, IDC_FC_ING, m_FC_ING);
	DDX_Control(pDX, IDC_FC_WHO, m_FC_WHO);
	DDX_Control(pDX, IDC_FC_VERB, m_FC_VERB);
	DDX_Control(pDX, IDC_FC_TO, m_FC_TO);
	DDX_Control(pDX, IDC_FC_THAT, m_FC_THAT);
	DDX_Control(pDX, IDC_FC_REFR, m_FC_REFR);
	DDX_Control(pDX, IDC_FC_REF, m_FC_REF);
	DDX_Control(pDX, IDC_FC_PRON, m_FC_PRON);
	DDX_Control(pDX, IDC_FC_PREP, m_FC_PREP);
	DDX_Control(pDX, IDC_FC_POS, m_FC_POS);
	DDX_Control(pDX, IDC_FC_PART, m_FC_PART);
	DDX_Control(pDX, IDC_FC_NOUN, m_FC_NOUN);
	DDX_Control(pDX, IDC_FC_NEG, m_FC_NEG);
	DDX_Control(pDX, IDC_FC_NAME, m_FC_NAME);
	DDX_Control(pDX, IDC_FC_INTER, m_FC_INTER);
	DDX_Control(pDX, IDC_FC_HAVE, m_FC_HAVE);
	DDX_Control(pDX, IDC_FC_ED, m_FC_ED);
	DDX_Control(pDX, IDC_FC_DET, m_FC_DET);
	DDX_Control(pDX, IDC_FC_CONT, m_FC_CONT);
	DDX_Control(pDX, IDC_FC_CONJ, m_FC_CONJ);
	DDX_Control(pDX, IDC_FC_BEV, m_FC_BEV);
	DDX_Control(pDX, IDC_FC_BE, m_FC_BE);
	DDX_Control(pDX, IDC_FC_AUX, m_FC_AUX);
	DDX_Control(pDX, IDC_FC_ART, m_FC_ART);
	DDX_Control(pDX, IDC_FC_ADV, m_FC_ADV);
	DDX_Control(pDX, IDC_FC_ADJ, m_FC_ADJ);
	DDX_Control(pDX, IDC_SEARCHCLASS2, m_SearchClassType);
	DDX_Control(pDX, IDC_SEARCHTYPE, m_SearchType);
	DDX_Text(pDX, IDC_SEARCHWORD, m_SearchWord);
	DDX_Text(pDX, IDC_WORDSFOUND, m_WordsFound);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CAdvSearchDlg, CDialog)
	//{{AFX_MSG_MAP(CAdvSearchDlg)
	ON_BN_CLICKED(IDC_BUILDLIST, OnBuildlist)
	ON_BN_CLICKED(IDC_SAVELIST, OnSavelist)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAdvSearchDlg message handlers

BOOL CAdvSearchDlg::OnInitDialog() 
{
	CWnd *pCur;
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	m_SearchType.AddString("Case Insensitive");
	m_SearchType.AddString("DECtalk Case");
	m_SearchType.AddString("Case Sensitive");
	m_SearchType.SetCurSel(0);

	m_SearchClassType.AddString("Any");
	m_SearchClassType.AddString("All");
	m_SearchClassType.AddString("Only");
	m_SearchClassType.AddString("Except");
	m_SearchClassType.SetCurSel(0);

	m_WordsFound="0 Words In List";

	m_SaveList.EnableWindow(0);

	m_PrioritySearch.AddString("100");
	m_PrioritySearch.AddString("150");
	m_PrioritySearch.AddString("250");
	m_PrioritySearch.AddString("325");
	m_PrioritySearch.AddString("450");
	m_PrioritySearch.AddString("500");
	m_PrioritySearch.AddString("650");
	m_PrioritySearch.AddString("850");
	m_PrioritySearch.AddString("1200");
	m_PrioritySearch.SetCurSel(0);


	m_PriorityType.AddString("Any");
	m_PriorityType.AddString("Equal");
	m_PriorityType.AddString("Higher/Equal");
	m_PriorityType.AddString("Lower/Equal");
	m_PriorityType.SetCurSel(0);


	m_HomoSearch.AddString("Any");
	m_HomoSearch.AddString("None");
	m_HomoSearch.AddString("P or S");
	m_HomoSearch.AddString("Primary");
	m_HomoSearch.AddString("Secondary");
	m_HomoSearch.SetCurSel(0);


	number_in_list=0;

	//pFont=pCur->GetFont();
	pEditFont.CreateFont(18,0,0,0,FW_BOLD,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY ,TMPF_TRUETYPE |FF_MODERN ,"CourierNew");

	pCur=GetDlgItem(IDC_SEARCHWORD);
	pCur->SetFont(&pEditFont,FALSE);

	pLabelFont.CreateFont(14,0,0,0,FW_BOLD,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY ,TMPF_TRUETYPE |FF_SWISS,"MS Sans Serif");

	pCur=GetDlgItem(IDC_SEARCHTYPE);
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_ADJ         );//             1005
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_ADV         );//             1006
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
	pCur=GetDlgItem( IDC_FC_DET         );//             1043
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_FC_NAME         );//             1043
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_WORDTOMATCH         );//             
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_CLASSTOMATCH         );//             
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_HOMOTOMATCH         );//             
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_HOMO_SEARCH         );//             
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_BUILDLIST         );//             
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDCANCEL         );//             
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDOK       );//             
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_SEARCHCLASS2);           
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_WORDSFOUND);           
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_SAVELIST);           
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_STATIC_PRIORITYMATCH);           
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_PRIORITY_SEARCH);           
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_STATIC_PRIORITYTYPE);           
	pCur->SetFont(&pLabelFont,FALSE);
	pCur=GetDlgItem( IDC_PRIORITY_TYPE_SEARCH);           
	pCur->SetFont(&pLabelFont,FALSE);
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CAdvSearchDlg::OnBuildlist() 
{
	// TODO: Add your control notification handler code here
	unsigned int length;
	plist_t p;
	char *a;
	int word_type;
	int fc_type;
	unsigned int fc=0;	
//	int number_in_list=0;
	char *words;
	int priority;
	int priority_type;
	int homo;

	// Get the word data.
	UpdateData(TRUE);
	length=m_SearchWord.GetLength();
	a=m_SearchWord.GetBuffer(length+2);

	// get the word search type
	word_type=m_SearchType.GetCurSel();

	priority=m_PrioritySearch.GetCurSel();
	priority_type=m_PriorityType.GetCurSel();

	homo=m_HomoSearch.GetCurSel();

	// Get and build the FC data
	fc=0;
	if (m_FC_ADJ.GetCheck())
		fc|=FC_ADJ;
	
	if (m_FC_ADV.GetCheck())
		fc|=FC_ADV;
	
	if (m_FC_ART.GetCheck())
		fc|=FC_ART;
	
	if (m_FC_AUX.GetCheck())
		fc|=FC_AUX;
	
	if (m_FC_BE.GetCheck())
		fc|=FC_BE;
	
	if (m_FC_BEV.GetCheck())
		fc|=FC_BEV;
	
	if (m_FC_CONJ.GetCheck())
		fc|=FC_CONJ;
	
	if (m_FC_ED.GetCheck())
		fc|=FC_ED;
	
	if (m_FC_HAVE.GetCheck())
		fc|=FC_HAVE;
	
	if (m_FC_ING.GetCheck())
		fc|=FC_ING;
	
	if (m_FC_NOUN.GetCheck())
		fc|=FC_NOUN;
	
	if (m_FC_POS.GetCheck())
		fc|=FC_POS;
	
	if (m_FC_PREP.GetCheck())
		fc|=FC_PREP;
	
	if (m_FC_PRON.GetCheck())
		fc|=FC_PRON;
	
	if (m_FC_SUBCONJ.GetCheck())
		//fc|=0;//FC_SUBCONJ;
		fc|=FC_SMS;
	
	if (m_FC_THAT.GetCheck())
		fc|=FC_THAT;
	
	if (m_FC_TO.GetCheck())
		fc|=FC_TO;
	
	if (m_FC_VERB.GetCheck())
		fc|=FC_VERB;
	
	if (m_FC_WHO.GetCheck())
//		fc|=FC_WHO;
		fc|=FC_WHOW;
	
	if (m_FC_NEG.GetCheck())
		fc|=FC_NEG;
	
	if (m_FC_INTER.GetCheck())
		fc|=FC_INTER;
	
	if (m_FC_REF.GetCheck())
		fc|=0;//FC_REF;
	
	if (m_FC_PART.GetCheck())
		fc|=FC_PART;
	
	if (m_FC_FUNC.GetCheck())
		fc|=FC_FUNC;
	
	if (m_FC_CONT.GetCheck())
//		fc|=FC_CONT;
		fc|=FC_CONTR;
	
	if (m_FC_CHARACTER.GetCheck())
		fc|=FC_CHARACTER;
	
	if (m_FC_REFR.GetCheck())
		fc|=0;//FC_REFR;
	
	if (m_FC_DET.GetCheck())
		fc|=0;//FC_DET;

	if (m_FC_NAME.GetCheck())
		fc|=FC_NAME;

	// get the FC search type
	fc_type=m_SearchClassType.GetCurSel();

	p=wordlist;
	// search for the words that fit the criteria.
	// any word that does, mark it as 1.  words that dont, mark as 0

	switch(priority)
	{
	case 0:
		priority=100;
		break;
	case 1:
		priority=150;
		break;
	case 2:
		priority=250;
		break;
	case 3:
		priority=325;
		break;
	case 4:
		priority=450;
		break;
	case 5:
		priority=500;
		break;
	case 6:
		priority=650;
		break;
	case 7:
		priority=850;
		break;
	case 8:
		priority=1200;
		break;
	}

	number_in_list=0;
	while (p!=NULL)
	{
		if (p->is_comment)
		{
			p=p->next;
			continue;
		}
		if (compare_words((unsigned char *)a,p->line.word.graph,word_type)!=0)
		{
			p->line.word.in_sub_list=0;
			p=p->next;
			continue;
		}
		if (priority_type!=0)
		{
			if (priority_type==1) // equal
			{
				if (!(p->line.word.priority==priority))
				{
					p->line.word.in_sub_list=0;
					p=p->next;
					continue;
				}
			}
			if (priority_type==2) //higher/equal
			{
				if (!(p->line.word.priority<=priority))
				{
					p->line.word.in_sub_list=0;
					p=p->next;
					continue;
				}
			}
			if (priority_type==3) // lower/equal
			{
				if (!(p->line.word.priority>=priority))
				{
					p->line.word.in_sub_list=0;
					p=p->next;
					continue;
				}
			}
		}

		if (fc!=0)
		{
			if (fc_type==0) // Any
			{
				if (!(p->line.word.fc & fc))
				{
					p->line.word.in_sub_list=0;
					p=p->next;
					continue;
				}
			}
			if (fc_type==1) // All
			{
				if ((p->line.word.fc & fc)!=fc)
				{
					p->line.word.in_sub_list=0;
					p=p->next;
					continue;
				}			
			}
			if (fc_type==2) // Only
			{
				if (p->line.word.fc != fc)
				{
					p->line.word.in_sub_list=0;
					p=p->next;
					continue;
				}
			}
			if (fc_type==3) // Except
			{
				if ((p->line.word.fc & fc)!=0)
				{
					p->line.word.in_sub_list=0;
					p=p->next;
					continue;
				}
			}
		}
		switch (homo)
		{
		case 0:
			break;
		case 1:
			if (p->line.word.homo!='N')
			{
				p->line.word.in_sub_list=0;
				p=p->next;
				continue;
			}			
			break;
		case 2:
			if (!(p->line.word.homo=='P' || p->line.word.homo=='S'))
			{
				p->line.word.in_sub_list=0;
				p=p->next;
				continue;
			}			
			break;
		case 3:
			if (p->line.word.homo!='P')
			{
				p->line.word.in_sub_list=0;
				p=p->next;
				continue;
			}			
			break;
		case 4:
			if (p->line.word.homo!='S')
			{
				p->line.word.in_sub_list=0;
				p=p->next;
				continue;
			}			
			break;
		}
			


		p->line.word.in_sub_list=1;
		number_in_list++;
		p=p->next;

	}

	m_SearchWord.ReleaseBuffer();
	words=(char *)malloc(100);
	if (words==NULL)
	{
		return;
	}
	if (number_in_list==1)
	{
		//SetDlgItemText(IDC_WORDCOUNT,"1 Word");
		m_WordsFound="1 Word In List";
	}
	else
	{
		//sprintf(words,"%d Words",word_count);
		//SetDlgItemText(IDC_WORDCOUNT,words);
		m_WordsFound.Format((LPCTSTR)"%d Words In List",number_in_list);
	}
	//Invalidate();
	if (number_in_list==0)
	{
		m_SaveList.EnableWindow(0);
	}
	else
	{
		m_SaveList.EnableWindow(1);
	}

	UpdateData(FALSE);
	free(words);
	//UpdateDialogControls(GetTopLevelFrame(),FALSE);

}

int CAdvSearchDlg::compare_words(unsigned char *search,unsigned char *test,int type)
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

int CAdvSearchDlg::compare_character(unsigned char  a,unsigned char b,int type)
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


void CAdvSearchDlg::OnSavelist() 
{
	// TODO: Add your control notification handler code here
	// TODO: Add your command handler code here
	char filter[]={"Dictionary Files (*.txt)|*.txt|All Files|*.*"};
	CFileDialog Filedlg(FALSE,".txt",((CDictoolDlg *)p)->advfile,OFN_OVERWRITEPROMPT, filter,NULL);
	if(Filedlg.DoModal()==IDOK)
	{
		strcpy(((CDictoolDlg *)p)->advfile,Filedlg.m_ofn.lpstrFile);
		//pMenu.EnableMenuItem(ID_FILE_SAVE,MF_ENABLED|MF_BYCOMMAND);
		((CDictoolDlg *)p)->OnFileSaveEx(1);
	}
	
	
}
