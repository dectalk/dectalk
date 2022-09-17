// PHEdit2Doc.h : interface of the CPHEdit2Doc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_PHEDIT2DOC_H__3E71A3E3_5D03_11D1_8094_0060083E4DF1__INCLUDED_)
#define AFX_PHEDIT2DOC_H__3E71A3E3_5D03_11D1_8094_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "ph_struc.h"
#include "plugins.h"
#include "dataplug.h"

class CPHEdit2Doc : public CDocument
{
protected: // create from serialization only
	CPHEdit2Doc();
	DECLARE_DYNCREATE(CPHEdit2Doc)
	void OnFileExportPhrom(void);
	BOOL ExportDocument(LPCTSTR lpszPathName);
	void OnFileImportPhrom(void);
	BOOL ImportDocument(LPCTSTR lpszPathName);
	void SerializeViews(CArchive& ar);
	U16 cur_phone;
	phone_type_struct base;
	int filechanged;

private:

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPHEdit2Doc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	virtual void OnCloseDocument();
	virtual BOOL OnSaveDocument(LPCTSTR lpszPathName);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CPHEdit2Doc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CPHEdit2Doc)
	afx_msg void OnExport();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PHEDIT2DOC_H__3E71A3E3_5D03_11D1_8094_0060083E4DF1__INCLUDED_)
