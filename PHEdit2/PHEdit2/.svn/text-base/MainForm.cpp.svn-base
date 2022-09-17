/* 
 * 001 MGS fixed horizontal scroll bar problem. 
 * 002 MGS fixed horizontal scroll bar problem again...
 */

// MainForm.cpp : implementation file
//

#include "stdafx.h"
#include "PHEdit2.h"

#include "PHEdit2Doc.h"
#include "MainForm.h"
#include "plugins.h"
#include "namephone.h"
#include "renamephone.h"
#include "place.h"
#include "features.h"
#include "plgmgr.h"

extern CPHEdit2App theApp;

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// MainForm

IMPLEMENT_DYNCREATE(MainForm, CFormView)

MainForm::MainForm()
	: CFormView(MainForm::IDD)
{
	int i, j;

	//{{AFX_DATA_INIT(MainForm)
	m_burdur = 0;
	m_f0segtars = 0;
	m_inhdr = 0;
	m_locus = 0;
	m_mindur = 0;
	m_a2 = 0;
	m_a3 = 0;
	m_a4 = 0;
	m_a5 = 0;
	m_a6 = 0;
	m_ab = 0;
	m_percent = 0;
	m_transdur = 0;
	m_postphone = 0;
	m_prephone = 0;
	m_prestress = FALSE;
	m_poststress = FALSE;
	m_stress = FALSE;
	m_av = 0;
	m_voice = -1;
	//}}AFX_DATA_INIT
	
	amp_type = 1;
	loc_type = 1;
	for (i = 0; i < 4; i++) {
		for (j = 0; j < 5; j++) {
			m_tarf[i][j] = 0;
			m_tarb[i][j] = 0;
			m_timef[i][j] = 0;
			m_timeb[i][j] = 0;
		}
	}
	filechanged=0;
	bIsModified = TRUE;
}

MainForm::~MainForm()
{
}

void MainForm::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(MainForm)
	DDX_Control(pDX, IDC_INSERTPHONEAFTER, m_insertphoneafterCtl);
	DDX_Control(pDX, IDC_RENAME_PHONE, m_renamephoneCtl);
	DDX_Control(pDX, IDC_ACQUIREALL, m_acquireallCtl);
	DDX_Control(pDX, IDC_ACQUIRE, m_acquireCtl);
	DDX_Control(pDX, IDC_VOICE, m_voiceCtl);
	DDX_Control(pDX, IDC_PLACE, m_placeCtl);
	DDX_Control(pDX, IDC_FEATB, m_featbCtl);
	DDX_Control(pDX, IDC_AV, m_avCtl);
	DDX_Control(pDX, IDC_STRESS, m_stressCtl);
	DDX_Control(pDX, IDC_PRESTRESS, m_prestressCtl);
	DDX_Control(pDX, IDC_POSTSTRESS, m_poststressCtl);
	DDX_Control(pDX, IDC_MODIFIED, m_modifiedCtl);
	DDX_Control(pDX, IDC_AMPSELECT, m_ampselectCtl);
	DDX_Control(pDX, IDC_NEWPHONE, m_newphoneCtl);
	DDX_Control(pDX, IDC_TARF1_1, m_tarf1_1Ctl);
	DDX_Control(pDX, IDC_TARF1_2, m_tarf1_2Ctl);
	DDX_Control(pDX, IDC_TARF1_3, m_tarf1_3Ctl);
	DDX_Control(pDX, IDC_TARF1_4, m_tarf1_4Ctl);
	DDX_Control(pDX, IDC_TARF1_5, m_tarf1_5Ctl);
	DDX_Control(pDX, IDC_TARF2_1, m_tarf2_1Ctl);
	DDX_Control(pDX, IDC_TARF2_2, m_tarf2_2Ctl);
	DDX_Control(pDX, IDC_TARF2_3, m_tarf2_3Ctl);
	DDX_Control(pDX, IDC_TARF2_4, m_tarf2_4Ctl);
	DDX_Control(pDX, IDC_TARF2_5, m_tarf2_5Ctl);
	DDX_Control(pDX, IDC_TARF3_1, m_tarf3_1Ctl);
	DDX_Control(pDX, IDC_TARF3_2, m_tarf3_2Ctl);
	DDX_Control(pDX, IDC_TARF3_3, m_tarf3_3Ctl);
	DDX_Control(pDX, IDC_TARF3_4, m_tarf3_4Ctl);
	DDX_Control(pDX, IDC_TARF3_5, m_tarf3_5Ctl);
	DDX_Control(pDX, IDC_TARF4_1, m_tarf4_1Ctl);
	DDX_Control(pDX, IDC_TARF4_2, m_tarf4_2Ctl);
	DDX_Control(pDX, IDC_TARF4_3, m_tarf4_3Ctl);
	DDX_Control(pDX, IDC_TARF4_4, m_tarf4_4Ctl);
	DDX_Control(pDX, IDC_TARF4_5, m_tarf4_5Ctl);
	DDX_Control(pDX, IDC_TARB1_1, m_tarb1_1Ctl);
	DDX_Control(pDX, IDC_TARB1_2, m_tarb1_2Ctl);
	DDX_Control(pDX, IDC_TARB1_3, m_tarb1_3Ctl);
	DDX_Control(pDX, IDC_TARB1_4, m_tarb1_4Ctl);
	DDX_Control(pDX, IDC_TARB1_5, m_tarb1_5Ctl);
	DDX_Control(pDX, IDC_TARB2_1, m_tarb2_1Ctl);
	DDX_Control(pDX, IDC_TARB2_2, m_tarb2_2Ctl);
	DDX_Control(pDX, IDC_TARB2_3, m_tarb2_3Ctl);
	DDX_Control(pDX, IDC_TARB2_4, m_tarb2_4Ctl);
	DDX_Control(pDX, IDC_TARB2_5, m_tarb2_5Ctl);
	DDX_Control(pDX, IDC_TARB3_1, m_tarb3_1Ctl);
	DDX_Control(pDX, IDC_TARB3_2, m_tarb3_2Ctl);
	DDX_Control(pDX, IDC_TARB3_3, m_tarb3_3Ctl);
	DDX_Control(pDX, IDC_TARB3_4, m_tarb3_4Ctl);
	DDX_Control(pDX, IDC_TARB3_5, m_tarb3_5Ctl);
	DDX_Control(pDX, IDC_TARB4_1, m_tarb4_1Ctl);
	DDX_Control(pDX, IDC_TARB4_2, m_tarb4_2Ctl);
	DDX_Control(pDX, IDC_TARB4_3, m_tarb4_3Ctl);
	DDX_Control(pDX, IDC_TARB4_4, m_tarb4_4Ctl);
	DDX_Control(pDX, IDC_TARB4_5, m_tarb4_5Ctl);
	DDX_Control(pDX, IDC_TIMEF1_1, m_timef1_1Ctl);
	DDX_Control(pDX, IDC_TIMEF1_2, m_timef1_2Ctl);
	DDX_Control(pDX, IDC_TIMEF1_3, m_timef1_3Ctl);
	DDX_Control(pDX, IDC_TIMEF1_4, m_timef1_4Ctl);
	DDX_Control(pDX, IDC_TIMEF1_5, m_timef1_5Ctl);
	DDX_Control(pDX, IDC_TIMEF2_1, m_timef2_1Ctl);
	DDX_Control(pDX, IDC_TIMEF2_2, m_timef2_2Ctl);
	DDX_Control(pDX, IDC_TIMEF2_3, m_timef2_3Ctl);
	DDX_Control(pDX, IDC_TIMEF2_4, m_timef2_4Ctl);
	DDX_Control(pDX, IDC_TIMEF2_5, m_timef2_5Ctl);
	DDX_Control(pDX, IDC_TIMEF3_1, m_timef3_1Ctl);
	DDX_Control(pDX, IDC_TIMEF3_2, m_timef3_2Ctl);
	DDX_Control(pDX, IDC_TIMEF3_3, m_timef3_3Ctl);
	DDX_Control(pDX, IDC_TIMEF3_4, m_timef3_4Ctl);
	DDX_Control(pDX, IDC_TIMEF3_5, m_timef3_5Ctl);
	DDX_Control(pDX, IDC_TIMEF4_1, m_timef4_1Ctl);
	DDX_Control(pDX, IDC_TIMEF4_2, m_timef4_2Ctl);
	DDX_Control(pDX, IDC_TIMEF4_3, m_timef4_3Ctl);
	DDX_Control(pDX, IDC_TIMEF4_4, m_timef4_4Ctl);
	DDX_Control(pDX, IDC_TIMEF4_5, m_timef4_5Ctl);
	DDX_Control(pDX, IDC_TIMEB1_1, m_timeb1_1Ctl);
	DDX_Control(pDX, IDC_TIMEB1_2, m_timeb1_2Ctl);
	DDX_Control(pDX, IDC_TIMEB1_3, m_timeb1_3Ctl);
	DDX_Control(pDX, IDC_TIMEB1_4, m_timeb1_4Ctl);
	DDX_Control(pDX, IDC_TIMEB1_5, m_timeb1_5Ctl);
	DDX_Control(pDX, IDC_TIMEB2_1, m_timeb2_1Ctl);
	DDX_Control(pDX, IDC_TIMEB2_2, m_timeb2_2Ctl);
	DDX_Control(pDX, IDC_TIMEB2_3, m_timeb2_3Ctl);
	DDX_Control(pDX, IDC_TIMEB2_4, m_timeb2_4Ctl);
	DDX_Control(pDX, IDC_TIMEB2_5, m_timeb2_5Ctl);
	DDX_Control(pDX, IDC_TIMEB3_1, m_timeb3_1Ctl);
	DDX_Control(pDX, IDC_TIMEB3_2, m_timeb3_2Ctl);
	DDX_Control(pDX, IDC_TIMEB3_3, m_timeb3_3Ctl);
	DDX_Control(pDX, IDC_TIMEB3_4, m_timeb3_4Ctl);
	DDX_Control(pDX, IDC_TIMEB3_5, m_timeb3_5Ctl);
	DDX_Control(pDX, IDC_TIMEB4_1, m_timeb4_1Ctl);
	DDX_Control(pDX, IDC_TIMEB4_2, m_timeb4_2Ctl);
	DDX_Control(pDX, IDC_TIMEB4_3, m_timeb4_3Ctl);
	DDX_Control(pDX, IDC_TIMEB4_4, m_timeb4_4Ctl);
	DDX_Control(pDX, IDC_TIMEB4_5, m_timeb4_5Ctl);
	DDX_Control(pDX, IDC_TRANSDUR, m_transdurCtl);
	DDX_Control(pDX, IDC_PERCENT, m_percentCtl);
	DDX_Control(pDX, IDC_MINDUR, m_mindurCtl);
	DDX_Control(pDX, IDC_LOCUS, m_locusCtl);
	DDX_Control(pDX, IDC_LOCUSTYPE, m_locustypeCtl);
	DDX_Control(pDX, IDC_LOCFORMANT, m_locformantCtl);
	DDX_Control(pDX, IDC_INHDR, m_inhdrCtl);
	DDX_Control(pDX, IDC_F0SEGTARS, m_f0segtarsCtl);
	DDX_Control(pDX, IDC_BURDUR, m_burdurCtl);
	DDX_Control(pDX, IDC_AB, m_abCtl);
	DDX_Control(pDX, IDC_A6, m_a6Ctl);
	DDX_Control(pDX, IDC_A5, m_a5Ctl);
	DDX_Control(pDX, IDC_A3, m_a3Ctl);
	DDX_Control(pDX, IDC_A4, m_a4Ctl);
	DDX_Control(pDX, IDC_A2, m_a2Ctl);
	DDX_Control(pDX, IDC_F0STRESS, m_f0stressCtl);
	DDX_Control(pDX, IDC_F0PHRASE, m_f0phraseCtl);
	DDX_Control(pDX, IDC_F0GLSTP, m_f0glstpCtl);
	DDX_Control(pDX, IDC_REVERT, m_revertCtl);
	DDX_Control(pDX, IDC_COMMIT, m_commitCtl);
	DDX_Control(pDX, IDC_PHONE, m_phoneCtl);
	DDX_Control(pDX, IDC_DELETEPHONE, m_deletephoneCtl);
	DDX_Control(pDX, IDC_COPYPHONE, m_copyphoneCtl);
	DDX_Control(pDX, IDC_ENDTYPE, m_endtypeCtl);
	DDX_Control(pDX, IDC_BEGTYPE, m_begtypeCtl);
	DDX_Control(pDX, IDC_PREPHONE, m_prephoneCtl);
	DDX_Control(pDX, IDC_POSTPHONE, m_postphoneCtl);
	DDX_Control(pDX, IDC_PLAY, m_playCtl);
	DDX_Text(pDX, IDC_BURDUR, m_burdur);
	DDX_Text(pDX, IDC_F0SEGTARS, m_f0segtars);
	DDX_Text(pDX, IDC_INHDR, m_inhdr);
	DDX_Text(pDX, IDC_LOCUS, m_locus);
	DDX_Text(pDX, IDC_MINDUR, m_mindur);
	DDX_Text(pDX, IDC_A2, m_a2);
	DDX_Text(pDX, IDC_A3, m_a3);
	DDX_Text(pDX, IDC_A4, m_a4);
	DDX_Text(pDX, IDC_A5, m_a5);
	DDX_Text(pDX, IDC_A6, m_a6);
	DDX_Text(pDX, IDC_AB, m_ab);
	DDX_Text(pDX, IDC_PERCENT, m_percent);
	DDX_Text(pDX, IDC_TRANSDUR, m_transdur);
	DDX_CBIndex(pDX, IDC_POSTPHONE, m_postphone);
	DDX_CBIndex(pDX, IDC_PREPHONE, m_prephone);
	DDX_Check(pDX, IDC_PRESTRESS, m_prestress);
	DDX_Check(pDX, IDC_POSTSTRESS, m_poststress);
	DDX_Check(pDX, IDC_STRESS, m_stress);
	DDX_Text(pDX, IDC_AV, m_av);
	DDX_CBIndex(pDX, IDC_VOICE, m_voice);
	//}}AFX_DATA_MAP
	DDX_Text(pDX, IDC_TARF1_1, m_tarf[0][0]);
	DDV_MinMaxLong(pDX, m_tarf[0][0], -1, 9999);
	DDX_Text(pDX, IDC_TARF1_2, m_tarf[0][1]);
	DDV_MinMaxLong(pDX, m_tarf[0][1], -1, 9999);
	DDX_Text(pDX, IDC_TARF1_3, m_tarf[0][2]);
	DDV_MinMaxLong(pDX, m_tarf[0][2], -1, 9999);
	DDX_Text(pDX, IDC_TARF1_4, m_tarf[0][3]);
	DDV_MinMaxLong(pDX, m_tarf[0][3], -1, 9999);
	DDX_Text(pDX, IDC_TARF1_5, m_tarf[0][4]);
	DDV_MinMaxLong(pDX, m_tarf[0][4], -1, 9999);
	DDX_Text(pDX, IDC_TARF2_1, m_tarf[1][0]);
	DDV_MinMaxLong(pDX, m_tarf[1][0], -1, 9999);
	DDX_Text(pDX, IDC_TARF2_2, m_tarf[1][1]);
	DDV_MinMaxLong(pDX, m_tarf[1][1], -1, 9999);
	DDX_Text(pDX, IDC_TARF2_3, m_tarf[1][2]);
	DDV_MinMaxLong(pDX, m_tarf[1][2], -1, 9999);
	DDX_Text(pDX, IDC_TARF2_4, m_tarf[1][3]);
	DDV_MinMaxLong(pDX, m_tarf[1][3], -1, 9999);
	DDX_Text(pDX, IDC_TARF2_5, m_tarf[1][4]);
	DDV_MinMaxLong(pDX, m_tarf[1][4], -1, 9999);
	DDX_Text(pDX, IDC_TARF3_1, m_tarf[2][0]);
	DDV_MinMaxLong(pDX, m_tarf[2][0], -1, 9999);
	DDX_Text(pDX, IDC_TARF3_2, m_tarf[2][1]);
	DDV_MinMaxLong(pDX, m_tarf[2][1], -1, 9999);
	DDX_Text(pDX, IDC_TARF3_3, m_tarf[2][2]);
	DDV_MinMaxLong(pDX, m_tarf[2][2], -1, 9999);
	DDX_Text(pDX, IDC_TARF3_4, m_tarf[2][3]);
	DDV_MinMaxLong(pDX, m_tarf[2][3], -1, 9999);
	DDX_Text(pDX, IDC_TARF3_5, m_tarf[2][4]);
	DDV_MinMaxLong(pDX, m_tarf[2][4], -1, 9999);
	DDX_Text(pDX, IDC_TARF4_1, m_tarf[3][0]);
	DDV_MinMaxLong(pDX, m_tarf[3][0], -1, 9999);
	DDX_Text(pDX, IDC_TARF4_2, m_tarf[3][1]);
	DDV_MinMaxLong(pDX, m_tarf[3][1], -1, 9999);
	DDX_Text(pDX, IDC_TARF4_3, m_tarf[3][2]);
	DDV_MinMaxLong(pDX, m_tarf[3][2], -1, 9999);
	DDX_Text(pDX, IDC_TARF4_4, m_tarf[3][3]);
	DDV_MinMaxLong(pDX, m_tarf[3][3], -1, 9999);
	DDX_Text(pDX, IDC_TARF4_5, m_tarf[3][4]);
	DDV_MinMaxLong(pDX, m_tarf[3][4], -1, 9999);
	DDX_Text(pDX, IDC_TARB1_1, m_tarb[0][0]);
	DDV_MinMaxLong(pDX, m_tarb[0][0], -1, 9999);
	DDX_Text(pDX, IDC_TARB1_2, m_tarb[0][1]);
	DDV_MinMaxLong(pDX, m_tarb[0][1], -1, 9999);
	DDX_Text(pDX, IDC_TARB1_3, m_tarb[0][2]);
	DDV_MinMaxLong(pDX, m_tarb[0][2], -1, 9999);
	DDX_Text(pDX, IDC_TARB1_4, m_tarb[0][3]);
	DDV_MinMaxLong(pDX, m_tarb[0][3], -1, 9999);
	DDX_Text(pDX, IDC_TARB1_5, m_tarb[0][4]);
	DDV_MinMaxLong(pDX, m_tarb[0][4], -1, 9999);
	DDX_Text(pDX, IDC_TARB2_1, m_tarb[1][0]);
	DDV_MinMaxLong(pDX, m_tarb[1][0], -1, 9999);
	DDX_Text(pDX, IDC_TARB2_2, m_tarb[1][1]);
	DDV_MinMaxLong(pDX, m_tarb[1][1], -1, 9999);
	DDX_Text(pDX, IDC_TARB2_3, m_tarb[1][2]);
	DDV_MinMaxLong(pDX, m_tarb[1][2], -1, 9999);
	DDX_Text(pDX, IDC_TARB2_4, m_tarb[1][3]);
	DDV_MinMaxLong(pDX, m_tarb[1][3], -1, 9999);
	DDX_Text(pDX, IDC_TARB2_5, m_tarb[1][4]);
	DDV_MinMaxLong(pDX, m_tarb[1][4], -1, 9999);
	DDX_Text(pDX, IDC_TARB3_1, m_tarb[2][0]);
	DDV_MinMaxLong(pDX, m_tarb[2][0], -1, 9999);
	DDX_Text(pDX, IDC_TARB3_2, m_tarb[2][1]);
	DDV_MinMaxLong(pDX, m_tarb[2][1], -1, 9999);
	DDX_Text(pDX, IDC_TARB3_3, m_tarb[2][2]);
	DDV_MinMaxLong(pDX, m_tarb[2][2], -1, 9999);
	DDX_Text(pDX, IDC_TARB3_4, m_tarb[2][3]);
	DDV_MinMaxLong(pDX, m_tarb[2][3], -1, 9999);
	DDX_Text(pDX, IDC_TARB3_5, m_tarb[2][4]);
	DDV_MinMaxLong(pDX, m_tarb[2][4], -1, 9999);
	DDX_Text(pDX, IDC_TARB4_1, m_tarb[3][0]);
	DDV_MinMaxLong(pDX, m_tarb[3][0], -1, 9999);
	DDX_Text(pDX, IDC_TARB4_2, m_tarb[3][1]);
	DDV_MinMaxLong(pDX, m_tarb[3][1], -1, 9999);
	DDX_Text(pDX, IDC_TARB4_3, m_tarb[3][2]);
	DDV_MinMaxLong(pDX, m_tarb[3][2], -1, 9999);
	DDX_Text(pDX, IDC_TARB4_4, m_tarb[3][3]);
	DDV_MinMaxLong(pDX, m_tarb[3][3], -1, 9999);
	DDX_Text(pDX, IDC_TARB4_5, m_tarb[3][4]);
	DDV_MinMaxLong(pDX, m_tarb[3][4], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF1_1, m_timef[0][0]);
	DDV_MinMaxLong(pDX, m_timef[0][0], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF1_2, m_timef[0][1]);
	DDV_MinMaxLong(pDX, m_timef[0][1], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF1_3, m_timef[0][2]);
	DDV_MinMaxLong(pDX, m_timef[0][2], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF1_4, m_timef[0][3]);
	DDV_MinMaxLong(pDX, m_timef[0][3], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF1_5, m_timef[0][4]);
	DDV_MinMaxLong(pDX, m_timef[0][4], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF2_1, m_timef[1][0]);
	DDV_MinMaxLong(pDX, m_timef[1][0], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF2_2, m_timef[1][1]);
	DDV_MinMaxLong(pDX, m_timef[1][1], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF2_3, m_timef[1][2]);
	DDV_MinMaxLong(pDX, m_timef[1][2], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF2_4, m_timef[1][3]);
	DDV_MinMaxLong(pDX, m_timef[1][3], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF2_5, m_timef[1][4]);
	DDV_MinMaxLong(pDX, m_timef[1][4], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF3_1, m_timef[2][0]);
	DDV_MinMaxLong(pDX, m_timef[2][0], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF3_2, m_timef[2][1]);
	DDV_MinMaxLong(pDX, m_timef[2][1], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF3_3, m_timef[2][2]);
	DDV_MinMaxLong(pDX, m_timef[2][2], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF3_4, m_timef[2][3]);
	DDV_MinMaxLong(pDX, m_timef[2][3], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF3_5, m_timef[2][4]);
	DDV_MinMaxLong(pDX, m_timef[2][4], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF4_1, m_timef[3][0]);
	DDV_MinMaxLong(pDX, m_timef[3][0], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF4_2, m_timef[3][1]);
	DDV_MinMaxLong(pDX, m_timef[3][1], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF4_3, m_timef[3][2]);
	DDV_MinMaxLong(pDX, m_timef[3][2], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF4_4, m_timef[3][3]);
	DDV_MinMaxLong(pDX, m_timef[3][3], -1, 9999);
	DDX_Text(pDX, IDC_TIMEF4_5, m_timef[3][4]);
	DDV_MinMaxLong(pDX, m_timef[3][4], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB1_1, m_timeb[0][0]);
	DDV_MinMaxLong(pDX, m_timeb[0][0], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB1_2, m_timeb[0][1]);
	DDV_MinMaxLong(pDX, m_timeb[0][1], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB1_3, m_timeb[0][2]);
	DDV_MinMaxLong(pDX, m_timeb[0][2], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB1_4, m_timeb[0][3]);
	DDV_MinMaxLong(pDX, m_timeb[0][3], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB1_5, m_timeb[0][4]);
	DDV_MinMaxLong(pDX, m_timeb[0][4], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB2_1, m_timeb[1][0]);
	DDV_MinMaxLong(pDX, m_timeb[1][0], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB2_2, m_timeb[1][1]);
	DDV_MinMaxLong(pDX, m_timeb[1][1], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB2_3, m_timeb[1][2]);
	DDV_MinMaxLong(pDX, m_timeb[1][2], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB2_4, m_timeb[1][3]);
	DDV_MinMaxLong(pDX, m_timeb[1][3], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB2_5, m_timeb[1][4]);
	DDV_MinMaxLong(pDX, m_timeb[1][4], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB3_1, m_timeb[2][0]);
	DDV_MinMaxLong(pDX, m_timeb[2][0], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB3_2, m_timeb[2][1]);
	DDV_MinMaxLong(pDX, m_timeb[2][1], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB3_3, m_timeb[2][2]);
	DDV_MinMaxLong(pDX, m_timeb[2][2], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB3_4, m_timeb[2][3]);
	DDV_MinMaxLong(pDX, m_timeb[2][3], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB3_5, m_timeb[2][4]);
	DDV_MinMaxLong(pDX, m_timeb[2][4], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB4_1, m_timeb[3][0]);
	DDV_MinMaxLong(pDX, m_timeb[3][0], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB4_2, m_timeb[3][1]);
	DDV_MinMaxLong(pDX, m_timeb[3][1], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB4_3, m_timeb[3][2]);
	DDV_MinMaxLong(pDX, m_timeb[3][2], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB4_4, m_timeb[3][3]);
	DDV_MinMaxLong(pDX, m_timeb[3][3], -1, 9999);
	DDX_Text(pDX, IDC_TIMEB4_5, m_timeb[3][4]);
	DDV_MinMaxLong(pDX, m_timeb[3][4], -1, 9999);
}


BEGIN_MESSAGE_MAP(MainForm, CFormView)
	//{{AFX_MSG_MAP(MainForm)
	ON_BN_CLICKED(IDC_COMMIT, OnCommit)
	ON_BN_CLICKED(IDC_REVERT, OnRevert)
	ON_BN_CLICKED(IDC_PLAY, OnPlay)
	ON_BN_CLICKED(IDC_NEWPHONE, OnNewphone)
	ON_BN_CLICKED(IDC_DELETEPHONE, OnDeletephone)
	ON_WM_HSCROLL()
	ON_BN_CLICKED(IDC_MODIFIED, OnModified)
	ON_EN_KILLFOCUS(IDC_INHDR, OnKillfocusControl)
	ON_BN_CLICKED(IDC_PLACE, OnPlace)
	ON_BN_CLICKED(IDC_FEATB, OnFeatures)
	ON_BN_CLICKED(IDC_PLUGINS, OnPlugins)
	ON_BN_CLICKED(IDC_COPYPHONE, OnCopyphone)
	ON_BN_CLICKED(IDC_ACQUIRE, OnAcquire)
	ON_BN_CLICKED(IDC_ACQUIREALL, OnAcquireall)
	ON_BN_CLICKED(IDC_RENAME_PHONE, OnRenamePhone)
	ON_BN_CLICKED(IDC_INSERTPHONEAFTER, OnInsertphoneafter)
	ON_EN_KILLFOCUS(IDC_MINDUR, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_BURDUR, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF1_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF1_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF1_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF1_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF1_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF2_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF2_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF2_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF2_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF2_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF3_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF3_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF3_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF3_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF3_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF4_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF4_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF4_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF4_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARF4_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB1_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB1_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB1_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB1_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB1_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB2_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB2_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB2_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB2_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB2_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB3_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB3_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB3_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB3_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB3_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB4_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB4_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB4_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB4_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TARB4_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF1_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF1_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF1_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF1_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF1_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF2_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF2_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF2_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF2_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF2_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF3_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF3_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF3_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF3_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF3_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF4_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF4_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF4_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF4_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEF4_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB1_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB1_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB1_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB1_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB1_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB2_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB2_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB2_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB2_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB2_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB3_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB3_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB3_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB3_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB3_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB4_1, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB4_2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB4_3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB4_4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TIMEB4_5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_AV, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_A2, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_A3, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_A4, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_A5, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_A6, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_AB, OnKillfocusControl)
	ON_CBN_KILLFOCUS(IDC_BEGTYPE, OnKillfocusControl)
	ON_CBN_KILLFOCUS(IDC_ENDTYPE, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_F0SEGTARS, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_LOCUS, OnKillfocusControl)
	ON_CBN_KILLFOCUS(IDC_LOCUSTYPE, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_PERCENT, OnKillfocusControl)
	ON_CBN_KILLFOCUS(IDC_PHONE, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_PLACE, OnKillfocusControl)
	ON_EN_KILLFOCUS(IDC_TRANSDUR, OnKillfocusControl)
	ON_CBN_KILLFOCUS(IDC_PLACE, OnKillfocusControl)
	ON_CBN_SELENDOK(IDC_PHONE, selectPhone)
	//}}AFX_MSG_MAP
	ON_CBN_KILLFOCUS(IDC_PHONE, selectPhone)
	ON_CBN_CLOSEUP(IDC_PHONE, selectPhone)
	ON_CBN_SELENDOK(IDC_LOCUSTYPE, UpdateDisplay)
	ON_CBN_SETFOCUS(IDC_PHONE, StorePhone)
	ON_CBN_SETFOCUS(IDC_LOCUSTYPE, StorePhone)
	ON_CBN_SETFOCUS(IDC_BEGTYPE, StorePhone)
	ON_CBN_SETFOCUS(IDC_ENDTYPE, StorePhone)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// MainForm diagnostics

#ifdef _DEBUG
void MainForm::AssertValid() const
{
	CFormView::AssertValid();
}

void MainForm::Dump(CDumpContext& dc) const
{
	CFormView::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// MainForm message handlers

void MainForm::OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint) 
{
	// TODO: Add your specialized code here and/or call the base class
}

void MainForm::OnCommit() 
{
	StorePhone();
	memcpy(&(base->phonemes[cur_phone]), &storedphone, sizeof(phonemic_struct));
	UpdateDisplay();
}

void MainForm::OnRevert() 
{
	if (bIsModified == TRUE && base->phoneme_count > 0) {
		if (MessageBox("Undoing all changes to the current phoneme will perminently lose current changes. Are you sure you wish to continue?", "PHEdit� Warning", MB_ICONEXCLAMATION | MB_DEFBUTTON2 | MB_OKCANCEL) != IDOK) {
			return;
		}
	}
	memcpy(&storedphone, &(base->phonemes[cur_phone]), sizeof(phonemic_struct));
	UpdateDisplay();
}

void MainForm::OnInitialUpdate() 
{
	char temp[20];
	HICON hPlayIcon;
	CPHEdit2Doc* pDoc = (class CPHEdit2Doc*) GetDocument();
	CWnd *tempWnd;

	ASSERT_VALID(pDoc);
	CFormView::OnInitialUpdate();

	base = &pDoc->base;

	filechanged=&pDoc->filechanged;

	tempWnd = GetWindow(GW_CHILD);
	cwnd = tempWnd->GetParent();
	theApp.plugins.Init(cwnd);

	hPlayIcon = AfxGetApp()->LoadIcon(IDI_PLAY);
	m_playCtl.SetIcon(hPlayIcon);

	SetDlgItemText(IDC_AMPDISP, "Front");
	m_ampselectCtl.SetRange(0,6);
	m_ampselectCtl.SetPos(1);

	SetDlgItemText(IDC_LOCFORMDISP, "F1");
	m_locformantCtl.SetRange(0,4);
	m_locformantCtl.SetPos(1);

	sprintf(temp, "%d", base->phoneme_count);
	SetDlgItemText(IDC_PHONES, temp);
	if (base->phoneme_count <= 0)	SetDlgItemText(IDC_CURPHONE, "None");
	else							SetDlgItemText(IDC_CURPHONE, (char*) base->phonemes[0].name);

	m_locustypeCtl.SetCurSel(0);

	SetPhoneList();

	m_begtypeCtl.SetCurSel(0);
	m_endtypeCtl.SetCurSel(0);

	if (base->phoneme_count == 0) {
		SetWindows(FALSE);
	} else {
		SetWindows(TRUE);
		if (base->phoneme_count < 99) {
			m_newphoneCtl.EnableWindow(TRUE);
		} else {
			m_newphoneCtl.EnableWindow(FALSE);
		}
	}
	SetCurPhoneme(0);
	IsModified();
}

void MainForm::OnPlay() 
{
	CPHEdit2Doc* pDoc = (class CPHEdit2Doc*) GetDocument();
	ASSERT_VALID(pDoc);

	DECtalk_plugin_available = theApp.plugins.IsAvailable(PLUGIN_KLSYN);
	if (DECtalk_plugin_available == FALSE) {			// We're not able to call a KLSYN plugin
		m_playCtl.EnableWindow(FALSE);
		m_prephoneCtl.EnableWindow(FALSE);
		m_postphoneCtl.EnableWindow(FALSE);
		m_stressCtl.EnableWindow(FALSE);
		m_prestressCtl.EnableWindow(FALSE);
		m_poststressCtl.EnableWindow(FALSE);
		m_voiceCtl.EnableWindow(FALSE);
		return;
	}
	StorePhone();
	UpdateData(TRUE);
	theApp.plugins.Render(&pDoc->base, &storedphone, pDoc->cur_phone, m_prephone, m_postphone, m_stress, m_prestress, m_poststress, m_voiceCtl.GetCurSel());
}

void MainForm::SetWindows(BOOL stat) {
	CPHEdit2Doc* pDoc = (class CPHEdit2Doc*) GetDocument();

	ASSERT_VALID(pDoc);

	DECtalk_plugin_available = theApp.plugins.IsAvailable(PLUGIN_KLSYN);
	if (DECtalk_plugin_available == FALSE) {
		m_playCtl.EnableWindow(FALSE);
		m_prephoneCtl.EnableWindow(FALSE);
		m_postphoneCtl.EnableWindow(FALSE);
		m_stressCtl.EnableWindow(FALSE);
		m_prestressCtl.EnableWindow(FALSE);
		m_poststressCtl.EnableWindow(FALSE);
		m_voiceCtl.EnableWindow(FALSE);
	} else {
		m_playCtl.EnableWindow(stat);
		m_prephoneCtl.EnableWindow(stat);
		m_postphoneCtl.EnableWindow(stat);
		m_stressCtl.EnableWindow(stat);
		m_prestressCtl.EnableWindow(stat);
		m_poststressCtl.EnableWindow(stat);
		m_voiceCtl.EnableWindow(stat);
	}		
	m_phoneCtl.EnableWindow(stat);
	m_copyphoneCtl.EnableWindow(stat);
	m_deletephoneCtl.EnableWindow(stat);
	m_renamephoneCtl.EnableWindow(stat);
	m_insertphoneafterCtl.EnableWindow(stat);
	m_commitCtl.EnableWindow(stat);
	m_revertCtl.EnableWindow(stat);
	m_burdurCtl.EnableWindow(stat);
	m_a2Ctl.EnableWindow(stat);
	m_a3Ctl.EnableWindow(stat);
	m_a4Ctl.EnableWindow(stat);
	m_a5Ctl.EnableWindow(stat);
	m_a6Ctl.EnableWindow(stat);
	m_abCtl.EnableWindow(stat);
	m_f0segtarsCtl.EnableWindow(stat);
	m_inhdrCtl.EnableWindow(stat);
	m_locformantCtl.EnableWindow(stat);
	m_locusCtl.EnableWindow(stat);
	m_locustypeCtl.EnableWindow(stat);
	m_mindurCtl.EnableWindow(stat);
	m_transdurCtl.EnableWindow(stat);
	m_percentCtl.EnableWindow(stat);
	m_begtypeCtl.EnableWindow(stat);
	m_endtypeCtl.EnableWindow(stat);
	m_ampselectCtl.EnableWindow(stat);

	if (theApp.gai.IsAvailable() == TRUE)	m_acquireCtl.EnableWindow(stat);
	else									m_acquireCtl.EnableWindow(FALSE);
	if (theApp.gai.IsAvailable() == TRUE)	m_acquireallCtl.EnableWindow(stat);
	else									m_acquireallCtl.EnableWindow(FALSE);

	m_f0glstpCtl.EnableWindow(FALSE);
	m_f0phraseCtl.EnableWindow(FALSE);
	m_f0stressCtl.EnableWindow(FALSE);

	/* targets */
	m_tarf1_1Ctl.EnableWindow(stat);		m_tarf1_2Ctl.EnableWindow(stat);		m_tarf1_3Ctl.EnableWindow(stat);
	m_tarf1_4Ctl.EnableWindow(stat);		m_tarf1_5Ctl.EnableWindow(stat);

	m_tarf2_1Ctl.EnableWindow(stat);		m_tarf2_2Ctl.EnableWindow(stat);		m_tarf2_3Ctl.EnableWindow(stat);
	m_tarf2_4Ctl.EnableWindow(stat);		m_tarf2_5Ctl.EnableWindow(stat);

	m_tarf3_1Ctl.EnableWindow(stat);		m_tarf3_2Ctl.EnableWindow(stat);		m_tarf3_3Ctl.EnableWindow(stat);
	m_tarf3_4Ctl.EnableWindow(stat);		m_tarf3_5Ctl.EnableWindow(stat);

	m_tarf4_1Ctl.EnableWindow(FALSE);		m_tarf4_2Ctl.EnableWindow(FALSE);		m_tarf4_3Ctl.EnableWindow(FALSE);
	m_tarf4_4Ctl.EnableWindow(FALSE);		m_tarf4_5Ctl.EnableWindow(FALSE);

	m_tarb1_1Ctl.EnableWindow(stat);		m_tarb1_2Ctl.EnableWindow(stat);		m_tarb1_3Ctl.EnableWindow(stat);
	m_tarb1_4Ctl.EnableWindow(stat);		m_tarb1_5Ctl.EnableWindow(stat);

	m_tarb2_1Ctl.EnableWindow(stat);		m_tarb2_2Ctl.EnableWindow(stat);		m_tarb2_3Ctl.EnableWindow(stat);
	m_tarb2_4Ctl.EnableWindow(stat);		m_tarb2_5Ctl.EnableWindow(stat);

	m_tarb3_1Ctl.EnableWindow(stat);		m_tarb3_2Ctl.EnableWindow(stat);		m_tarb3_3Ctl.EnableWindow(stat);
	m_tarb3_4Ctl.EnableWindow(stat);		m_tarb3_5Ctl.EnableWindow(stat);

	m_tarb4_1Ctl.EnableWindow(FALSE);		m_tarb4_2Ctl.EnableWindow(FALSE);		m_tarb4_3Ctl.EnableWindow(FALSE);
	m_tarb4_4Ctl.EnableWindow(FALSE);		m_tarb4_5Ctl.EnableWindow(FALSE);

	m_timef1_1Ctl.EnableWindow(stat);		m_timef1_2Ctl.EnableWindow(stat);		m_timef1_3Ctl.EnableWindow(stat);
	m_timef1_4Ctl.EnableWindow(stat);		m_timef1_5Ctl.EnableWindow(stat);

	m_timef2_1Ctl.EnableWindow(stat);		m_timef2_2Ctl.EnableWindow(stat);		m_timef2_3Ctl.EnableWindow(stat);
	m_timef2_4Ctl.EnableWindow(stat);		m_timef2_5Ctl.EnableWindow(stat);

	m_timef3_1Ctl.EnableWindow(stat);		m_timef3_2Ctl.EnableWindow(stat);		m_timef3_3Ctl.EnableWindow(stat);
	m_timef3_4Ctl.EnableWindow(stat);		m_timef3_5Ctl.EnableWindow(stat);

	m_timef4_1Ctl.EnableWindow(FALSE);		m_timef4_2Ctl.EnableWindow(FALSE);		m_timef4_3Ctl.EnableWindow(FALSE);
	m_timef4_4Ctl.EnableWindow(FALSE);		m_timef4_5Ctl.EnableWindow(FALSE);

	m_timeb1_1Ctl.EnableWindow(stat);		m_timeb1_2Ctl.EnableWindow(stat);		m_timeb1_3Ctl.EnableWindow(stat);
	m_timeb1_4Ctl.EnableWindow(stat);		m_timeb1_5Ctl.EnableWindow(stat);

	m_timeb2_1Ctl.EnableWindow(stat);		m_timeb2_2Ctl.EnableWindow(stat);		m_timeb2_3Ctl.EnableWindow(stat);
	m_timeb2_4Ctl.EnableWindow(stat);		m_timeb2_5Ctl.EnableWindow(stat);

	m_timeb3_1Ctl.EnableWindow(stat);		m_timeb3_2Ctl.EnableWindow(stat);		m_timeb3_3Ctl.EnableWindow(stat);
	m_timeb3_4Ctl.EnableWindow(stat);		m_timeb3_5Ctl.EnableWindow(stat);

	m_timeb4_1Ctl.EnableWindow(FALSE);		m_timeb4_2Ctl.EnableWindow(FALSE);		m_timeb4_3Ctl.EnableWindow(FALSE);
	m_timeb4_4Ctl.EnableWindow(FALSE);		m_timeb4_5Ctl.EnableWindow(FALSE);

	m_modifiedCtl.EnableWindow(stat);
	m_avCtl.EnableWindow(stat);
	m_featbCtl.EnableWindow(stat);
	m_placeCtl.EnableWindow(stat);

	return;
}

void MainForm::OnNewphone() 
{
	NamePhone name;

	IsModified();
	if (bIsModified == TRUE && base->phoneme_count > 0) {
		if (MessageBox("Changing phonemes without committing changes will lose current changes. Are you sure you wish to continue?", "PHEdit� Warning", MB_ICONEXCLAMATION | MB_DEFBUTTON2 | MB_OKCANCEL) != IDOK) {
			return;
		}
	}
	
	if (name.DoModal() != IDOK)	return;

	base->phonemes = (phonemic_struct*) realloc(base->phonemes, (base->phoneme_count+1) * sizeof(phonemic_struct));
	if (base->phonemes == NULL) {
		base->phoneme_count = 0;
		SetWindows(FALSE);
		MessageBox("Memory heap exhausted. Unable to continue", "PHEdit� Error", MB_ICONSTOP | MB_OK);
		return;
	}
	base->phoneme_count++;
	if (base->phoneme_count < 99) {
		m_newphoneCtl.EnableWindow(TRUE);
	} else {
		m_newphoneCtl.EnableWindow(FALSE);
	}
	SetWindows(TRUE);
	CreatePhoneme(base->phoneme_count - 1, (char*) LPCSTR(name.m_name));
	SetCurPhoneme(base->phoneme_count - 1);
	return;
}

void MainForm::SetCurPhoneme(U16 phone) {
	int form, tar;
	char temp[20];

	CPHEdit2Doc* pDoc = (class CPHEdit2Doc*) GetDocument();
	ASSERT_VALID(pDoc);

	pDoc->cur_phone = phone;		// Keep document informed
	base = &pDoc->base;
	cur_phone = phone;

	sprintf(temp, "%d", base->phoneme_count);
	SetDlgItemText(IDC_PHONES, temp);

	if (phone >= base->phoneme_count) {
		for (form = 0; form < 3; form++) {
			for (tar = 0; tar < 5; tar++) {
				m_tarf[form][tar] = 0;
				m_tarb[form][tar] = 0;
				m_timef[form][tar] = 0;
				m_timeb[form][tar] = 0;
			}
		}
		m_inhdr = 0;
		m_burdur = 0;
		m_mindur = 0;
		m_f0segtars = 0;
		SetDlgItemText(IDC_CURPHONE, "None");
		return;
	}

	memcpy(&storedphone, &(base->phonemes[phone]), sizeof(phonemic_struct));
	UpdateDisplay();
	SetDlgItemText(IDC_CURPHONE, (char*) storedphone.name);
	if (m_prephone == -1)	m_prephone = 0;
	if (m_postphone == -1)	m_postphone = 0;
	if (m_voice == -1)		m_voice = 0;
	m_prephoneCtl.SetCurSel(m_prephone);
	m_postphoneCtl.SetCurSel(m_postphone);
	m_voiceCtl.SetCurSel(m_voice);
	SetPhoneList();
	return;
}


void MainForm::OnDeletephone() 
{
	phonemic_struct *temp = NULL;
	phonemic_struct *temp2 = NULL;
	int cnt;

	if (MessageBox("Are you sure you wish to delete the current phoneme?", "PHEdit� Warning", MB_ICONEXCLAMATION | MB_DEFBUTTON2 | MB_OKCANCEL) != IDOK) {
		return;
	}
	if (base->phoneme_count == 1) {
		base->phoneme_count = 0;
		free(base->phonemes);
		base->phonemes = NULL;
		SetWindows(FALSE);
		SetCurPhoneme(0);
		return;
	}

	cnt = (base->phoneme_count - cur_phone) - 1;
	if (cur_phone != 0)		temp = (phonemic_struct*) malloc(sizeof(phonemic_struct) * cur_phone);
	if (cnt > 0)			temp2 = (phonemic_struct*) malloc(sizeof(phonemic_struct) * cnt);
	if (cur_phone > 0) {
		if (temp == NULL) {
			MessageBox("Memory heap exhausted. Unable to delete phoneme", "PHEdit� Error", MB_ICONSTOP | MB_OK);
			if (temp2 != NULL)	free(temp2);
			return;
		}
		memcpy(temp, base->phonemes, (sizeof(phonemic_struct) * cur_phone));
	}
	if (cnt) {
		if (temp2 == NULL) {
			MessageBox("Memory heap exhausted. Unable to delete phoneme", "PHEdit� Error", MB_ICONSTOP | MB_OK);
			if (temp != NULL)	free(temp);
			return;
		}
		memcpy(temp2, &base->phonemes[cur_phone+1], cnt * sizeof(phonemic_struct));
	}
	free(base->phonemes);
	base->phoneme_count--;
	base->phonemes = (phonemic_struct*) malloc(sizeof(phonemic_struct) * base->phoneme_count);
	if (base->phonemes == NULL) {
		base->phoneme_count = 0;
		SetWindows(FALSE);
		SetCurPhoneme(0);
		MessageBox("Memory heap exhausted. Unable to continue", "PHEdit� Error", MB_ICONSTOP | MB_OK);
		return;
	}
	if (temp != NULL) {
		memcpy(base->phonemes, temp, sizeof(phonemic_struct) * cur_phone);
		free(temp);
	}
	if (temp2 != NULL) {
		memcpy(&base->phonemes[cur_phone], temp2, sizeof(phonemic_struct) * cnt);
		free(temp2);
	}
	SetWindows(TRUE);
	if (cnt == 0)	cur_phone--;
	SetCurPhoneme(cur_phone);
	IsModified();
	return;
}

void MainForm::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
	// TODO: Add your message handler code here and/or call default

// 002 MGS fixed horizontal scroll bar problem again...
	if ((pScrollBar !=NULL) && (pScrollBar->IsKindOf(RUNTIME_CLASS(CSpinButtonCtrl)))) {
		if (pScrollBar->m_hWnd == m_ampselectCtl.m_hWnd) {
			StorePhone();
			amp_type = nPos;
			if (amp_type == 0) {
				m_ampselectCtl.SetPos(5);
				amp_type = 5;
			}
			if (amp_type > 5) {
				amp_type = 1;
				m_ampselectCtl.SetPos(1);
			}
			switch (amp_type) {
				case 1:		SetDlgItemText(IDC_AMPDISP, "Front");		break;
				case 2:		SetDlgItemText(IDC_AMPDISP, "Back");		break;
				case 3:		SetDlgItemText(IDC_AMPDISP, "Round");		break;
				case 4:		SetDlgItemText(IDC_AMPDISP, "Non-Sonar");	break;
				case 5:		SetDlgItemText(IDC_AMPDISP, "Low");			break;
			}
			UpdateDisplay();
			return;
		} else if (pScrollBar->m_hWnd == m_locformantCtl.m_hWnd) {
			StorePhone();
			loc_type = nPos;
			if (loc_type == 0) {
				m_locformantCtl.SetPos(3);
				loc_type = 3;
			}
			if (loc_type > 3) {
				loc_type = 1;
				m_locformantCtl.SetPos(1);
			}
			switch (loc_type) {
				case 1:		SetDlgItemText(IDC_LOCFORMDISP, "F1");		break;
				case 2:		SetDlgItemText(IDC_LOCFORMDISP, "F2");		break;
				case 3:		SetDlgItemText(IDC_LOCFORMDISP, "F3");		break;
				case 4:		SetDlgItemText(IDC_LOCFORMDISP, "F4");		break;
			}
			UpdateDisplay();
			return;
		}
	} else {	// Call base function
		CFormView::OnHScroll(nSBCode, nPos, pScrollBar);
	}
}

void MainForm::CreatePhoneme(U16 phone, LPSTR name) {
	phonemic_struct *ph;
	int form, tar;

	ph = &(base->phonemes[phone]);
	strcpy((char*) ph->name, name);
	ph->inhdr = 4;
	ph->mindur = 3;
	ph->burdur = 2;
	ph->f0segtars = 1;
	ph->begtype = 0;
	ph->endtype = 0;
	ph->featb = 0;
	ph->place = 0;

	for (form = 0; form < MAX_FORMANT_PARAMS; form++) {
		for (tar = 0; tar < MAX_DIPHTHONGS; tar++) {
			ph->diphthongs[form].diph[tar] = -1;
			ph->diphthongs[form].diph_tm[tar] = -1;
		}
	}
	ph->diphthongs[8].diph[0] = 0;
	for (form = 0; form < AMPTYPES; form++) {
		ph->amp[form].a_A2 = -1;
		ph->amp[form].a_A3 = -1;
		ph->amp[form].a_A4 = -1;
		ph->amp[form].a_A5 = -1;
		ph->amp[form].a_A6 = -1;
		ph->amp[form].a_AB = -1;
	}
	for (form = 0; form < FORMANT_TYPES; form++) {
		for (tar = 0; tar < MAX_FORMANTS; tar++) {
			ph->loc[form].locus[tar] = -1;
			ph->loc[form].percent[tar] = -1;
			ph->loc[form].transdur[tar] = -1;
		}
	}
	SetPhoneList();
	return;
}

void MainForm::SetPhoneList(void) {
	int phone;

	UpdateData(TRUE);
	m_phoneCtl.ResetContent();
	m_prephoneCtl.ResetContent();
	m_postphoneCtl.ResetContent();
	for (phone = 0; phone < base->phoneme_count; phone++) {
		m_phoneCtl.AddString((char*) base->phonemes[phone].name);
		m_prephoneCtl.AddString((char*) base->phonemes[phone].name);
		m_postphoneCtl.AddString((char*) base->phonemes[phone].name);
	}
	m_phoneCtl.SetCurSel(cur_phone);
	m_prephoneCtl.SetCurSel(m_prephone);
	m_postphoneCtl.SetCurSel(m_postphone);
	m_voiceCtl.SetCurSel(m_voice);
	return;
}

afx_msg void MainForm::selectPhone(void) {
	if (m_phoneCtl.GetCurSel() == cur_phone)	return;
	if (bIsModified == TRUE && base->phoneme_count > 0) {
		if (MessageBox("Changing phonemes without committing changes will lose current changes. Are you sure you wish to continue?", "PHEdit� Warning", MB_ICONEXCLAMATION | MB_DEFBUTTON2 | MB_OKCANCEL) != IDOK) {
			m_phoneCtl.SetCurSel(cur_phone);
			return;
		}
	}

	SetCurPhoneme(m_phoneCtl.GetCurSel());
	return;
}

void MainForm::StorePhone(void) {
	int form, tar;

	*filechanged=1;
	UpdateData(TRUE);
	for (form = 0; form < 3; form++) {
		for (tar = 0; tar < 5; tar++) {
			storedphone.diphthongs[form].diph[tar] = (S16) m_tarf[form][tar];
			storedphone.diphthongs[form+4].diph[tar] = (S16) m_tarb[form][tar];
			storedphone.diphthongs[form].diph_tm[tar] = (S16) m_timef[form][tar];
			storedphone.diphthongs[form+4].diph_tm[tar] = (S16) m_timeb[form][tar];
		}
	}

	storedphone.loc[loc_type-1].locus[m_locustypeCtl.GetCurSel()] = (S16) m_locus;
	storedphone.loc[loc_type-1].percent[m_locustypeCtl.GetCurSel()] = (S16) m_percent;
	storedphone.loc[loc_type-1].transdur[m_locustypeCtl.GetCurSel()] = (S16) m_transdur;

	storedphone.amp[amp_type-1].a_A2 = (S16) m_a2;
	storedphone.amp[amp_type-1].a_A3 = (S16) m_a3;
	storedphone.amp[amp_type-1].a_A4 = (S16) m_a4;
	storedphone.amp[amp_type-1].a_A5 = (S16) m_a5;
	storedphone.amp[amp_type-1].a_A6 = (S16) m_a6;
	storedphone.amp[amp_type-1].a_AB = (S16) m_ab;

	storedphone.inhdr = (S16) m_inhdr;
	storedphone.burdur = (S16) m_burdur;
	storedphone.mindur = (S16) m_mindur;
	storedphone.f0segtars = (S16) m_f0segtars;

	storedphone.begtype = m_begtypeCtl.GetCurSel();
	storedphone.endtype = m_endtypeCtl.GetCurSel();

	storedphone.diphthongs[8].diph[0] = (S16) m_av;
	storedphone.diphthongs[8].diph_tm[0] = -1;
	return;
}

void MainForm::UpdateDisplay(void) {
	int form, tar;

	for (form = 0; form < 3; form++) {
		for (tar = 0; tar < 5; tar++) {
			m_tarf[form][tar] = storedphone.diphthongs[form].diph[tar];
			m_tarb[form][tar] = storedphone.diphthongs[form+4].diph[tar];
			m_timef[form][tar] = storedphone.diphthongs[form].diph_tm[tar];
			m_timeb[form][tar] = storedphone.diphthongs[form+4].diph_tm[tar];
		}
	}

	m_locus = storedphone.loc[loc_type-1].locus[m_locustypeCtl.GetCurSel()];
	m_percent = storedphone.loc[loc_type-1].percent[m_locustypeCtl.GetCurSel()];
	m_transdur = storedphone.loc[loc_type-1].transdur[m_locustypeCtl.GetCurSel()];

	m_a2 = storedphone.amp[amp_type-1].a_A2;
	m_a3 = storedphone.amp[amp_type-1].a_A3;
	m_a4 = storedphone.amp[amp_type-1].a_A4;
	m_a5 = storedphone.amp[amp_type-1].a_A5;
	m_a6 = storedphone.amp[amp_type-1].a_A6;
	m_ab = storedphone.amp[amp_type-1].a_AB;

	m_inhdr = storedphone.inhdr;
	m_burdur = storedphone.burdur;
	m_mindur = storedphone.mindur;
	m_f0segtars = storedphone.f0segtars;

	m_begtypeCtl.SetCurSel(storedphone.begtype);
	m_endtypeCtl.SetCurSel(storedphone.endtype);

	m_av = storedphone.diphthongs[8].diph[0];

	UpdateData(FALSE);
	IsModified();
	return;
}

void MainForm::OnModified()
{
	// TODO: Add your control notification handler code here
	IsModified();
}

void MainForm::TouchPiece(void) {
	bIsModified = TRUE;
	m_modifiedCtl.SetCheck(bIsModified);
	return;
}

void MainForm::IsModified(void) {
	phonemic_struct temp;

	if (base->phoneme_count <= cur_phone) {
		bIsModified = FALSE;
		m_modifiedCtl.EnableWindow(FALSE);
		return;
	}
	memcpy(&temp, &storedphone, sizeof(phonemic_struct));
	StorePhone();
	if (memcmp(&storedphone, &(base->phonemes[cur_phone]), sizeof(phonemic_struct)) != 0)	bIsModified = TRUE;
	else																					bIsModified = FALSE;
	m_modifiedCtl.SetCheck(bIsModified);
	memcpy(&storedphone, &temp, sizeof(phonemic_struct));
	return;
}

void MainForm::Serialize(CArchive& ar) 
{
	IsModified();
	if (bIsModified == TRUE && base->phoneme_count > 0) {
		if (MessageBox("Saveing phonemes without committing changes will lose current changes. Do you wish to commit your changes now?", "PHEdit� Warning", MB_ICONEXCLAMATION | MB_DEFBUTTON2 | MB_YESNO) == IDYES) {
			OnCommit();
		}
	}
}

void MainForm::OnKillfocusControl() 
{
	CPHEdit2Doc* pDoc = (class CPHEdit2Doc*) GetDocument();
	ASSERT_VALID(pDoc);
	phonemic_struct temp;

	if (base->phoneme_count == 0)	return;
	memcpy(&temp, &storedphone, sizeof(phonemic_struct));
	StorePhone();
	if (memcmp(&temp, &storedphone, sizeof(phonemic_struct)) == 0)	return;
	theApp.DataPlugins.Report(base, &storedphone, &temp, cur_phone);
	UpdateDisplay();
	IsModified();
}

#define		FLABIAL			0x0001
#define		FDENTAL			0x0002
#define		FPALATL			0x0004
#define		FALVEL			0x0008
#define		FVELAR			0x0010
#define		FGLOTAL			0x0020
#define		F2BACKI			0x0040
#define		F2BACKF			0x0080
#define		FLABIALDENTAL	0x0100
#define		FPOSTALVEOLAR	0x0200
#define		FUVULAR			0x0400
#define		FPHARYNGEAL		0x0800
#define		FVELARF			0x1000
#define		FVELARB			0x2000
#define		FVELARR			0x4000



void MainForm::OnPlace() 
{
	Place place;

	if (storedphone.place & FLABIAL)	place.m_flabial = TRUE;
	else								place.m_flabial = FALSE;
	if (storedphone.place & FDENTAL)	place.m_fdental = TRUE;
	else								place.m_fdental = FALSE;
	if (storedphone.place & FPALATL)	place.m_fpalatl = TRUE;
	else								place.m_fpalatl = FALSE;
	if (storedphone.place & FALVEL)		place.m_falvel = TRUE;
	else								place.m_falvel = FALSE;
	if (storedphone.place & FVELAR)		place.m_fvelar = TRUE;
	else								place.m_fvelar = FALSE;
	if (storedphone.place & FVELARF)	place.m_fvelarf = TRUE;
	else								place.m_fvelarf = FALSE;
	if (storedphone.place & FVELARB)	place.m_fvelarb = TRUE;
	else								place.m_fvelarb = FALSE;
	if (storedphone.place & FVELARR)	place.m_fvelarr = TRUE;
	else								place.m_fvelarr = FALSE;
	if (storedphone.place & FGLOTAL)	place.m_fglotal = TRUE;
	else								place.m_fglotal = FALSE;
	if (storedphone.place & F2BACKI)	place.m_f2backi = TRUE;
	else								place.m_f2backi = FALSE;
	if (storedphone.place & F2BACKF)	place.m_f2backf = TRUE;
	else								place.m_f2backf = FALSE;
	if (storedphone.place & FLABIALDENTAL)	place.m_flabialdental = TRUE;
	else								place.m_flabialdental = FALSE;
	if (storedphone.place & FPOSTALVEOLAR)	place.m_fpostalveolar = TRUE;
	else								place.m_fpostalveolar = FALSE;
	if (storedphone.place & FUVULAR)	place.m_fuvular = TRUE;
	else								place.m_fuvular = FALSE;
	if (storedphone.place & FPHARYNGEAL)	place.m_fpharyngeal = TRUE;
	else								place.m_fpharyngeal = FALSE;
	if (place.DoModal() == IDCANCEL)	return;
	storedphone.place = 0;
	if (place.m_flabial)		storedphone.place |= FLABIAL;
	if (place.m_fdental)		storedphone.place |= FDENTAL;
	if (place.m_fpalatl)		storedphone.place |= FPALATL;
	if (place.m_falvel)			storedphone.place |= FALVEL;
	if (place.m_fvelar)			storedphone.place |= FVELAR;
	if (place.m_fvelarf)			storedphone.place |= FVELARF;
	if (place.m_fvelarb)			storedphone.place |= FVELARB;
	if (place.m_fvelarr)			storedphone.place |= FVELARR;
	if (place.m_fglotal)		storedphone.place |= FGLOTAL;
	if (place.m_f2backi)		storedphone.place |= F2BACKI;
	if (place.m_f2backf)		storedphone.place |= F2BACKF;
	if (place.m_flabialdental)		storedphone.place |= FLABIALDENTAL;
	if (place.m_fpostalveolar)		storedphone.place |= FPOSTALVEOLAR;
	if (place.m_fuvular)		storedphone.place |= FUVULAR;
	if (place.m_fpharyngeal)		storedphone.place |= FPHARYNGEAL;
	IsModified();
	return;
}

#define FSYLL		0x00000001
#define FVOICD		0x00000002
#define FVOWEL		0x00000004
#define FSON1		0x00000008
#define FSONOR		0x00000010
#define FOBST		0x00000020
#define	FPLOSV		0x00000040
#define FNASAL		0x00000080
#define FCONSON		0x00000100
#define FSONCON		0x00000200
#define FSON2		0x00000400
#define FBURST		0x00000800
#define FSTMARK		0x00001000
#define FSTOP		0x00002000
#define FFLAP		0x00004000
#define FLATERAL	0x00008000
#define FRETROFLEX	0x00010000
#define	FNFI1		0x00020000
#define	FNFI2		0x00040000
#define	FNFI3		0x00080000


void MainForm::OnFeatures() 
{
	Features featb;

	featb.m_fsyll = (storedphone.featb & FSYLL) ? TRUE : FALSE;
	featb.m_fvoicd = (storedphone.featb & FVOICD) ? TRUE : FALSE;
	featb.m_fvowel = (storedphone.featb & FVOWEL) ? TRUE : FALSE;
	featb.m_fson1 = (storedphone.featb & FSON1) ? TRUE : FALSE;
	featb.m_fsonor = (storedphone.featb & FSONOR) ? TRUE : FALSE;
	featb.m_fobst = (storedphone.featb & FOBST) ? TRUE : FALSE;
	featb.m_fplosv = (storedphone.featb & FPLOSV) ? TRUE : FALSE;
	featb.m_fnasal = (storedphone.featb & FNASAL) ? TRUE : FALSE;
	featb.m_fconson = (storedphone.featb & FCONSON) ? TRUE : FALSE;
	featb.m_fsoncon = (storedphone.featb & FSONCON) ? TRUE : FALSE;
	featb.m_fson2 = (storedphone.featb & FSON2) ? TRUE : FALSE;
	featb.m_fburst = (storedphone.featb & FBURST) ? TRUE : FALSE;
	featb.m_fstmark = (storedphone.featb & FSTMARK) ? TRUE : FALSE;
	featb.m_fstop = (storedphone.featb & FSTOP) ? TRUE : FALSE;
	featb.m_fflap = (storedphone.featb & FFLAP) ? TRUE : FALSE;
	featb.m_flateral = (storedphone.featb & FLATERAL) ? TRUE : FALSE;
	featb.m_fretroflex = (storedphone.featb & FRETROFLEX) ? TRUE : FALSE;
	featb.m_fnfi1 = (storedphone.featb & FNFI1) ? TRUE : FALSE;
	featb.m_fnfi2 = (storedphone.featb & FNFI2) ? TRUE : FALSE;
	featb.m_fnfi3 = (storedphone.featb & FNFI3) ? TRUE : FALSE;

	if (featb.DoModal() == IDCANCEL)	return;
	storedphone.featb = 0;

	storedphone.featb |= ((featb.m_fsyll) ? FSYLL : 0);
	storedphone.featb |= ((featb.m_fvoicd) ? FVOICD : 0);
	storedphone.featb |= ((featb.m_fvowel) ? FVOWEL : 0);
	storedphone.featb |= ((featb.m_fson1) ? FSON1 : 0);
	storedphone.featb |= ((featb.m_fsonor) ? FSONOR : 0);
	storedphone.featb |= ((featb.m_fobst) ? FOBST : 0);
	storedphone.featb |= ((featb.m_fplosv) ? FPLOSV : 0);
	storedphone.featb |= ((featb.m_fnasal) ? FNASAL : 0);
	storedphone.featb |= ((featb.m_fconson) ? FCONSON : 0);
	storedphone.featb |= ((featb.m_fsoncon) ? FSONCON : 0);
	storedphone.featb |= ((featb.m_fson2) ? FSON2 : 0);
	storedphone.featb |= ((featb.m_fburst) ? FBURST : 0);
	storedphone.featb |= ((featb.m_fstmark) ? FSTMARK : 0);
	storedphone.featb |= ((featb.m_fstop) ? FSTOP : 0);
	storedphone.featb |= ((featb.m_fflap) ? FFLAP : 0);
	storedphone.featb |= ((featb.m_flateral) ? FLATERAL : 0);
	storedphone.featb |= ((featb.m_fretroflex) ? FRETROFLEX : 0);
	storedphone.featb |= ((featb.m_fnfi1) ? FNFI1 : 0);
	storedphone.featb |= ((featb.m_fnfi2) ? FNFI2 : 0);
	storedphone.featb |= ((featb.m_fnfi3) ? FNFI3 : 0);

	IsModified();
	return;
}

void MainForm::OnPlugins() 
{
	CPHEdit2Doc* pDoc = (class CPHEdit2Doc*) GetDocument();
	PlgMgr plgmgr;

	ASSERT_VALID(pDoc);
	plgmgr.plugins = &theApp.plugins;
	plgmgr.DataPlugins = &theApp.DataPlugins;
	plgmgr.cWnd = cwnd;
	if (plgmgr.DoModal() == -1)	return;		// Were being closed down, HARD

	DECtalk_plugin_available = theApp.plugins.IsAvailable(PLUGIN_KLSYN);
	if (base->phoneme_count == 0) {
		SetWindows(FALSE);
	} else {
		SetWindows(TRUE);
		if (base->phoneme_count < 99) {
			m_newphoneCtl.EnableWindow(TRUE);
		} else {
			m_newphoneCtl.EnableWindow(FALSE);
		}
	}
	return;
}

void MainForm::OnCopyphone() 
{
	NamePhone name;

	IsModified();
	if (bIsModified == TRUE && base->phoneme_count > 0) {
		if (MessageBox("Changing phonemes without committing changes will lose current changes. Are you sure you wish to continue?", "PHEdit� Warning", MB_ICONEXCLAMATION | MB_DEFBUTTON2 | MB_OKCANCEL) != IDOK) {
			return;
		}
	}
	
	if (name.DoModal() != IDOK)	return;

	base->phonemes = (phonemic_struct*) realloc(base->phonemes, (base->phoneme_count+1) * sizeof(phonemic_struct));
	if (base->phonemes == NULL) {
		base->phoneme_count = 0;
		SetWindows(FALSE);
		MessageBox("Memory heap exhausted. Unable to continue", "PHEdit� Error", MB_ICONSTOP | MB_OK);
		return;
	}
	base->phoneme_count++;
	if (base->phoneme_count < 99) {
		m_newphoneCtl.EnableWindow(TRUE);
	} else {
		m_newphoneCtl.EnableWindow(FALSE);
	}
	SetWindows(TRUE);
	CreatePhoneme(base->phoneme_count - 1, (char*) LPCSTR(name.m_name));
	memcpy((void*) &base->phonemes[base->phoneme_count-1], (void*) &base->phonemes[cur_phone], sizeof(phonemic_struct));
	strcpy((char*) base->phonemes[base->phoneme_count-1].name, (char*) LPCSTR(name.m_name));
	SetCurPhoneme(base->phoneme_count - 1);
	return;
}

void MainForm::OnAcquire() 
{
	CPHEdit2Doc* pDoc = (class CPHEdit2Doc*) GetDocument();
	CWnd *tempWnd, *cwnd;
	tempWnd = GetWindow(GW_CHILD);

	cwnd = tempWnd->GetParent();

	IsModified();
	if (bIsModified == TRUE && base->phoneme_count > 0) {
		if (MessageBox("Changing phonemes without committing changes will lose current changes. Are you sure you wish to continue?", "PHEdit� Warning", MB_ICONEXCLAMATION | MB_DEFBUTTON2 | MB_OKCANCEL) != IDOK) {
			return;
		}
	}
	StorePhone();
	if (theApp.gai.Acquire(cwnd, &pDoc->base, &storedphone, pDoc->cur_phone) != 0) {
		UpdateDisplay();
		IsModified();
	}
	
	return;
}

void MainForm::OnAcquireall() 
{
	CPHEdit2Doc* pDoc = (class CPHEdit2Doc*) GetDocument();
	CWnd *tempWnd, *cwnd;
	tempWnd = GetWindow(GW_CHILD);

	cwnd = tempWnd->GetParent();

	IsModified();
	if (bIsModified == TRUE && base->phoneme_count > 0) {
		if (MessageBox("Changing phonemes without committing changes will lose current changes. Are you sure you wish to continue?", "PHEdit� Warning", MB_ICONEXCLAMATION | MB_DEFBUTTON2 | MB_OKCANCEL) != IDOK) {
			return;
		}
	}
	StorePhone();
	if (theApp.gai.AcquireAll(cwnd, &pDoc->base, &storedphone, pDoc->cur_phone) != 0) {
		UpdateDisplay();
		IsModified();
	}
	return;
}

void MainForm::OnRenamePhone() 
{
	// TODO: Add your control notification handler code here
	RenamePhone rename;

	IsModified();
	if (bIsModified == TRUE && base->phoneme_count > 0) {
		if (MessageBox("Changing phonemes without committing changes will lose current changes. Are you sure you wish to continue?", "PHEdit� Warning", MB_ICONEXCLAMATION | MB_DEFBUTTON2 | MB_OKCANCEL) != IDOK) {
			return;
		}
	}
	
	if (rename.DoModal() != IDOK)	return;

	strcpy((char *)base->phonemes[cur_phone].name,(char*) LPCSTR(rename.m_newname));
	strcpy((char *)storedphone.name,(char*) LPCSTR(rename.m_newname));

	SetPhoneList();

	IsModified();
	//base->phonemes = (phonemic_struct*) realloc(base->phonemes, (base->phoneme_count+1) * sizeof(phonemic_struct));
	//if (base->phonemes == NULL) {
	//	base->phoneme_count = 0;
	//	SetWindows(FALSE);
	//	MessageBox("Memory heap exhausted. Unable to continue", "PHEdit� Error", MB_ICONSTOP | MB_OK);
	//	return;
	//}
	//base->phoneme_count++;
	//if (base->phoneme_count < 99) {
	//	m_newphoneCtl.EnableWindow(TRUE);
	//} else {
	//	m_newphoneCtl.EnableWindow(FALSE);
	//}
	SetWindows(TRUE);
	UpdateData(FALSE);
	//CreatePhoneme(base->phoneme_count - 1, (char*) LPCSTR(name.m_newname));
	//SetCurPhoneme(base->phoneme_count - 1);
	return;
	
}

void MainForm::OnInsertphoneafter() 
{
	// TODO: Add your control notification handler code here
	NamePhone name;

	IsModified();
	if (bIsModified == TRUE && base->phoneme_count > 0) {
		if (MessageBox("Changing phonemes without committing changes will lose current changes. Are you sure you wish to continue?", "PHEdit� Warning", MB_ICONEXCLAMATION | MB_DEFBUTTON2 | MB_OKCANCEL) != IDOK) {
			return;
		}
	}
	
	if (name.DoModal() != IDOK)	return;

	base->phonemes = (phonemic_struct*) realloc(base->phonemes, (base->phoneme_count+1) * sizeof(phonemic_struct));
	if (base->phonemes == NULL) {
		base->phoneme_count = 0;
		SetWindows(FALSE);
		MessageBox("Memory heap exhausted. Unable to continue", "PHEdit� Error", MB_ICONSTOP | MB_OK);
		return;
	}
	base->phoneme_count++;
	if (base->phoneme_count < 99) {
		m_newphoneCtl.EnableWindow(TRUE);
	} else {
		m_newphoneCtl.EnableWindow(FALSE);
	}
	// move the data down 1
	memmove(&(base->phonemes[cur_phone+2]),&(base->phonemes[cur_phone+1]),(base->phoneme_count-cur_phone-2)*sizeof(phonemic_struct));
	SetWindows(TRUE);
	CreatePhoneme(cur_phone+1, (char*) LPCSTR(name.m_name));
	SetCurPhoneme(cur_phone+1);
	return;
	
}

#if 0
	int ret;
	// TODO: Add your command handler code here
	ret=MessageBox("Are you sure you want to close the file without saving","Data loss warning",MB_YESNOCANCEL);
//	if (ret==IDNO)
//		OnFileSave();
//	else if (ret==IDCANCEL)
//	{
//		return;
//	}

	OnClose();
	//OnFileClose();
	
#endif
	


