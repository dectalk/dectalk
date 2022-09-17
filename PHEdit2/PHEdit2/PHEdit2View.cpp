// PHEdit2View.cpp : implementation of the CPHEdit2View class
//

#include "stdafx.h"
#include "PHEdit2.h"

#include "PHEdit2Doc.h"
#include "PHEdit2View.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2View

IMPLEMENT_DYNCREATE(CPHEdit2View, CView)

BEGIN_MESSAGE_MAP(CPHEdit2View, CView)
	//{{AFX_MSG_MAP(CPHEdit2View)
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2View construction/destruction

CPHEdit2View::CPHEdit2View()
{
}

CPHEdit2View::~CPHEdit2View()
{
}

BOOL CPHEdit2View::PreCreateWindow(CREATESTRUCT& cs)
{
	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2View drawing

void CPHEdit2View::OnDraw(CDC* pDC)
{
	CPHEdit2Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
}

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2View printing

BOOL CPHEdit2View::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CPHEdit2View::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
}

void CPHEdit2View::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
}

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2View diagnostics

#ifdef _DEBUG
void CPHEdit2View::AssertValid() const
{
	CView::AssertValid();
}

void CPHEdit2View::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CPHEdit2Doc* CPHEdit2View::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CPHEdit2Doc)));
	return (CPHEdit2Doc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2View message handlers
