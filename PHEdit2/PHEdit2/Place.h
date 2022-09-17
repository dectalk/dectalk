#if !defined(AFX_PLACE_H__7AAFF581_6694_11D1_AA99_0060083E4DF1__INCLUDED_)
#define AFX_PLACE_H__7AAFF581_6694_11D1_AA99_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// Place.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// Place dialog

class Place : public CDialog
{
// Construction
public:
	Place(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(Place)
	enum { IDD = IDD_PLACE };
	BOOL	m_f2backf;
	BOOL	m_f2backi;
	BOOL	m_falvel;
	BOOL	m_fdental;
	BOOL	m_flabial;
	BOOL	m_fpalatl;
	BOOL	m_fvelar;
	BOOL	m_fglotal;
	BOOL	m_flabialdental;
	BOOL	m_fpharyngeal;
	BOOL	m_fpostalveolar;
	BOOL	m_fuvular;
	BOOL	m_fvelarb;
	BOOL	m_fvelarf;
	BOOL	m_fvelarr;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Place)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(Place)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PLACE_H__7AAFF581_6694_11D1_AA99_0060083E4DF1__INCLUDED_)
