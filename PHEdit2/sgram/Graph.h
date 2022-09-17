#if !defined(AFX_GRAPH_H__30F54F82_6A86_11D1_AA9B_0060083E4DF1__INCLUDED_)
#define AFX_GRAPH_H__30F54F82_6A86_11D1_AA9B_0060083E4DF1__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// Graph.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// Graph dialog

#include "ph_types.h"

#define MAX_X	32767L

class Graph : public CDialog
{
// Construction
public:
	Graph(CWnd* pParent = NULL);   // standard constructor
	BOOL Resize(void);

	void MakeWindow(void);
	void DoPaint(HWND hWnd);
	void Resize(HWND hWnd);
	void OnGraph(HWND hWnd);
	void OnZoom(HWND hWnd, U16 xPos, U16 yPos);
	void DoMouseMove(HWND hWnd, U16 x, U16 y);

	void BigXBigY(U16 newX, U16 newY, U16 orgX, U16 orgY, U8 *out, U8 *in);
	void BigXSmallY(U16 newX, U16 newY, U16 orgX, U16 orgY, U8 *out, U8 *in);
	void SmallXBigY(U16 newX, U16 newY, U16 orgX, U16 orgY, U8 *out, U8 *in);
	void SmallXSmallY(U16 newX, U16 newY, U16 orgX, U16 orgY, U8 *out, U8 *in);

	void BuildColorTable(U8* ColorTable, U16 COLORTABLE);

	HWND scopeWnd;
	BOOL bIsZoom;
	BOOL bHaveData;
	BOOL bIsDrawing;
	DWORD dwDataSizeX;
	S16 lpData[MAX_X];

// Dialog Data
	//{{AFX_DATA(Graph)
	enum { IDD = IDD_MAINVIEW };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Graph)
	public:
	virtual BOOL DestroyWindow();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(Graph)
	virtual BOOL OnInitDialog();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_GRAPH_H__30F54F82_6A86_11D1_AA9B_0060083E4DF1__INCLUDED_)
