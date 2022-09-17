#if !defined(AFX_FEATURES_H__7AAFF582_6694_11D1_AA99_0060083E4DF1__INCLUDED_)
#define AFX_FEATURES_H__7AAFF582_6694_11D1_AA99_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// Features.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// Features dialog

class Features : public CDialog
{
// Construction
public:
	Features(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(Features)
	enum { IDD = IDD_FEATURES };
	BOOL	m_fburst;
	BOOL	m_fconson;
	BOOL	m_fnasal;
	BOOL	m_fobst;
	BOOL	m_fplosv;
	BOOL	m_fson1;
	BOOL	m_fson2;
	BOOL	m_fsoncon;
	BOOL	m_fsonor;
	BOOL	m_fstmark;
	BOOL	m_fstop;
	BOOL	m_fsyll;
	BOOL	m_fvoicd;
	BOOL	m_fvowel;
	BOOL	m_fflap;
	BOOL	m_flateral;
	BOOL	m_fnfi1;
	BOOL	m_fnfi2;
	BOOL	m_fnfi3;
	BOOL	m_fretroflex;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Features)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(Features)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FEATURES_H__7AAFF582_6694_11D1_AA99_0060083E4DF1__INCLUDED_)
