#if !defined(AFX_MAINFORM_H__A3319A90_6119_11D1_AA98_0060083E4DF1__INCLUDED_)
#define AFX_MAINFORM_H__A3319A90_6119_11D1_AA98_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// MainForm.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// MainForm form view

#ifndef __AFXEXT_H__
#include <afxext.h>
#endif

#include "ph_struc.h"

class MainForm : public CFormView
{
protected:
	MainForm();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(MainForm)

	void SetCurPhoneme(U16 phone);
	void CreatePhoneme(U16 phone,LPSTR name);
	void SetPhoneList(void);
	void UpdateDisplay(void);
	void StorePhone(void);
	void TouchPiece(void);
	afx_msg void selectPhone(void);
	void IsModified(void);

	phone_type_struct *base;
	phonemic_struct storedphone;
	U16 cur_phone;
	BOOL bIsModified;
	U16 amp_type;
	U16 loc_type;
	int *filechanged;

	CWnd *cwnd;

// Form Data
public:
	//{{AFX_DATA(MainForm)
	enum { IDD = IDD_FORMVIEW };
	CButton	m_insertphoneafterCtl;
	CButton	m_renamephoneCtl;
	CButton	m_acquireallCtl;
	CButton	m_acquireCtl;
	CComboBox	m_voiceCtl;
	CButton	m_placeCtl;
	CButton	m_featbCtl;
	CEdit	m_avCtl;
	CButton	m_stressCtl;
	CButton	m_prestressCtl;
	CButton	m_poststressCtl;
	CButton	m_modifiedCtl;
	CSpinButtonCtrl	m_ampselectCtl;
	CButton	m_newphoneCtl;
	CEdit	m_tarf1_1Ctl;
	CEdit	m_tarf1_2Ctl;
	CEdit	m_tarf1_3Ctl;
	CEdit	m_tarf1_4Ctl;
	CEdit	m_tarf1_5Ctl;
	CEdit	m_tarf2_1Ctl;
	CEdit	m_tarf2_2Ctl;
	CEdit	m_tarf2_3Ctl;
	CEdit	m_tarf2_4Ctl;
	CEdit	m_tarf2_5Ctl;
	CEdit	m_tarf3_1Ctl;
	CEdit	m_tarf3_2Ctl;
	CEdit	m_tarf3_3Ctl;
	CEdit	m_tarf3_4Ctl;
	CEdit	m_tarf3_5Ctl;
	CEdit	m_tarf4_1Ctl;
	CEdit	m_tarf4_2Ctl;
	CEdit	m_tarf4_3Ctl;
	CEdit	m_tarf4_4Ctl;
	CEdit	m_tarf4_5Ctl;
	CEdit	m_tarb1_1Ctl;
	CEdit	m_tarb1_2Ctl;
	CEdit	m_tarb1_3Ctl;
	CEdit	m_tarb1_4Ctl;
	CEdit	m_tarb1_5Ctl;
	CEdit	m_tarb2_1Ctl;
	CEdit	m_tarb2_2Ctl;
	CEdit	m_tarb2_3Ctl;
	CEdit	m_tarb2_4Ctl;
	CEdit	m_tarb2_5Ctl;
	CEdit	m_tarb3_1Ctl;
	CEdit	m_tarb3_2Ctl;
	CEdit	m_tarb3_3Ctl;
	CEdit	m_tarb3_4Ctl;
	CEdit	m_tarb3_5Ctl;
	CEdit	m_tarb4_1Ctl;
	CEdit	m_tarb4_2Ctl;
	CEdit	m_tarb4_3Ctl;
	CEdit	m_tarb4_4Ctl;
	CEdit	m_tarb4_5Ctl;
	CEdit	m_timef1_1Ctl;
	CEdit	m_timef1_2Ctl;
	CEdit	m_timef1_3Ctl;
	CEdit	m_timef1_4Ctl;
	CEdit	m_timef1_5Ctl;
	CEdit	m_timef2_1Ctl;
	CEdit	m_timef2_2Ctl;
	CEdit	m_timef2_3Ctl;
	CEdit	m_timef2_4Ctl;
	CEdit	m_timef2_5Ctl;
	CEdit	m_timef3_1Ctl;
	CEdit	m_timef3_2Ctl;
	CEdit	m_timef3_3Ctl;
	CEdit	m_timef3_4Ctl;
	CEdit	m_timef3_5Ctl;
	CEdit	m_timef4_1Ctl;
	CEdit	m_timef4_2Ctl;
	CEdit	m_timef4_3Ctl;
	CEdit	m_timef4_4Ctl;
	CEdit	m_timef4_5Ctl;
	CEdit	m_timeb1_1Ctl;
	CEdit	m_timeb1_2Ctl;
	CEdit	m_timeb1_3Ctl;
	CEdit	m_timeb1_4Ctl;
	CEdit	m_timeb1_5Ctl;
	CEdit	m_timeb2_1Ctl;
	CEdit	m_timeb2_2Ctl;
	CEdit	m_timeb2_3Ctl;
	CEdit	m_timeb2_4Ctl;
	CEdit	m_timeb2_5Ctl;
	CEdit	m_timeb3_1Ctl;
	CEdit	m_timeb3_2Ctl;
	CEdit	m_timeb3_3Ctl;
	CEdit	m_timeb3_4Ctl;
	CEdit	m_timeb3_5Ctl;
	CEdit	m_timeb4_1Ctl;
	CEdit	m_timeb4_2Ctl;
	CEdit	m_timeb4_3Ctl;
	CEdit	m_timeb4_4Ctl;
	CEdit	m_timeb4_5Ctl;
	CEdit	m_transdurCtl;
	CEdit	m_percentCtl;
	CEdit	m_mindurCtl;
	CEdit	m_locusCtl;
	CComboBox	m_locustypeCtl;
	CSpinButtonCtrl	m_locformantCtl;
	CEdit	m_inhdrCtl;
	CEdit	m_f0segtarsCtl;
	CEdit	m_burdurCtl;
	CEdit	m_abCtl;
	CEdit	m_a6Ctl;
	CEdit	m_a5Ctl;
	CEdit	m_a3Ctl;
	CEdit	m_a4Ctl;
	CEdit	m_a2Ctl;
	CButton	m_f0stressCtl;
	CButton	m_f0phraseCtl;
	CButton	m_f0glstpCtl;
	CButton	m_revertCtl;
	CButton	m_commitCtl;
	CComboBox	m_phoneCtl;
	CButton	m_deletephoneCtl;
	CButton	m_copyphoneCtl;
	CComboBox	m_endtypeCtl;
	CComboBox	m_begtypeCtl;
	CComboBox	m_prephoneCtl;
	CComboBox	m_postphoneCtl;
	CButton	m_playCtl;
	long	m_burdur;
	long	m_f0segtars;
	long	m_inhdr;
	long	m_locus;
	long	m_mindur;
	long	m_a2;
	long	m_a3;
	long	m_a4;
	long	m_a5;
	long	m_a6;
	long	m_ab;
	long	m_percent;
	long	m_transdur;
	int		m_postphone;
	int		m_prephone;
	BOOL	m_prestress;
	BOOL	m_poststress;
	BOOL	m_stress;
	long	m_av;
	int		m_voice;
	//}}AFX_DATA

	long	m_tarf[4][5];
	long	m_tarb[4][5];
	long	m_timef[4][5];
	long	m_timeb[4][5];
	BOOL DECtalk_plugin_available;

private:
	void SetWindows(BOOL stat);

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(MainForm)
	public:
	virtual void OnInitialUpdate();
	virtual void Serialize(CArchive& ar);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint);
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual ~MainForm();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
	//{{AFX_MSG(MainForm)
	afx_msg void OnCommit();
	afx_msg void OnRevert();
	afx_msg void OnPlay();
	afx_msg void OnNewphone();
	afx_msg void OnDeletephone();
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg void OnModified();
	afx_msg void OnKillfocusControl();
	afx_msg void OnPlace();
	afx_msg void OnFeatures();
	afx_msg void OnPlugins();
	afx_msg void OnCopyphone();
	afx_msg void OnAcquire();
	afx_msg void OnAcquireall();
	afx_msg void OnRenamePhone();
	afx_msg void OnInsertphoneafter();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MAINFORM_H__A3319A90_6119_11D1_AA98_0060083E4DF1__INCLUDED_)
