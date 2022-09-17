// PHEdit2View.h : interface of the CPHEdit2View class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_PHEDIT2VIEW_H__3E71A3E5_5D03_11D1_8094_0060083E4DF1__INCLUDED_)
#define AFX_PHEDIT2VIEW_H__3E71A3E5_5D03_11D1_8094_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

class CPHEdit2View : public CView
{
protected: // create from serialization only
	CPHEdit2View();
	DECLARE_DYNCREATE(CPHEdit2View)

// Attributes
public:
	CPHEdit2Doc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPHEdit2View)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CPHEdit2View();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CPHEdit2View)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in PHEdit2View.cpp
inline CPHEdit2Doc* CPHEdit2View::GetDocument()
   { return (CPHEdit2Doc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PHEDIT2VIEW_H__3E71A3E5_5D03_11D1_8094_0060083E4DF1__INCLUDED_)
