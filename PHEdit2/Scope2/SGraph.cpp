// Graph.cpp : implementation file
//

#include "stdafx.h"
#include "Scope.h"
#include "SGraph.h"

#include <process.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// Graph dialog

Graph::Graph(CWnd* pParent /*=NULL*/)
	: CDialog(Graph::IDD, pParent)
{
	int x, y;

	//{{AFX_DATA_INIT(Graph)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	bHaveData = FALSE;

	for (x = 0; x < 2500; x++) {
		for (y = 0; y < 256; y++) {
			lpData[x] = 0;
		}
	}
	dwDataSizeX = 2500;
	bUseDots = FALSE;
	return;
}

void Graph::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(Graph)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(Graph, CDialog)
	//{{AFX_MSG_MAP(Graph)
	ON_WM_SIZE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// Graph message handlers

BOOL Graph::Resize(void) {
	CWnd *parent = CWnd::FromHandle(m_hWnd);
	CWnd *wnd = parent->GetWindow(GW_CHILD);
	static int oldX = 0, oldY = 0;
	int newX, newY;
	CRect parentRect;

	parent->GetWindowRect(parentRect);
	newX = abs(parentRect.left - parentRect.right);
	newY = abs(parentRect.top - parentRect.bottom);

	if (newX == oldX && newY == oldY)		return FALSE;

	oldX = newX;
	oldY = newY;

	if (abs(parentRect.left - parentRect.right) < 40)		return FALSE;
	if (abs(parentRect.top - parentRect.bottom) < 60)		return FALSE;
	wnd->MoveWindow(10, 10, abs(parentRect.left - parentRect.right) - 30, abs(parentRect.top - parentRect.bottom) - 50, TRUE);
	parent->UpdateWindow();

	return TRUE;
}

typedef struct {
	DWORD dwDataSizeX;
	S16 *lpData;
	BOOL bHaveData;
	BOOL bUseDots;
	HWND hWnd;
} DrawDataStruct;

UINT DrawData(LPVOID input) {
	DrawDataStruct *data = (DrawDataStruct*) input;
	HDC hDc = GetDC(data->hWnd);
	CDC *pDc = CDC::FromHandle(hDc);
	int x, dataX;
	long int dataY;
	double X, incX;
	CPen pen;
	CPoint cpoint;
	CSize csize;
	CRect crect;
	CBrush cbrush;
	unsigned char color;

	cpoint = pDc->GetViewportOrg();
	GetWindowRect(data->hWnd, crect);

	csize.cx = abs(crect.left - crect.right) - 1;
	csize.cy = abs(crect.top - crect.bottom) - 1;
	pDc->SetViewportExt(csize);

	crect.top = cpoint.y;
	crect.bottom = cpoint.y + csize.cy;
	crect.left = cpoint.x;
	crect.right = cpoint.x + csize.cx;

	if (cbrush.CreateSolidBrush(RGB(255,255,255)) == 0)		return 0;
	pDc->FillRect(crect,&cbrush);

	if (data->bHaveData == FALSE)		return 0;

	color = 0;
	pen.CreatePen(PS_INSIDEFRAME, 0, RGB(color,color,color));
	pDc->SelectObject(&pen);

	pDc->MoveTo(cpoint.x,cpoint.y + (csize.cy >> 1));
	X = 0;
	incX = (double) csize.cx / (double) data->dwDataSizeX;

	for (x = 0; x < (int) data->dwDataSizeX; x++) {
		dataX = (int) X;
		dataY = data->lpData[x];
		dataY += 32767;	// Absolute value
		dataY *= csize.cy;
		dataY = dataY >> 16;
		if (data->bUseDots)		pDc->MoveTo(cpoint.x + dataX, cpoint.y + dataY + 1);
		pDc->LineTo(cpoint.x + dataX, cpoint.y + dataY);
		X += incX;
	}

	pen.DeleteObject();
	ReleaseDC(data->hWnd, hDc);
	return 0;
}

void Graph::OnGraph(HWND hWnd) 
{
	static DrawDataStruct struc;

	struc.dwDataSizeX = dwDataSizeX;
	struc.lpData = &lpData[0];
	struc.bHaveData = bHaveData;
	struc.bUseDots = bUseDots;
	struc.hWnd = hWnd;
	AfxBeginThread(DrawData,&struc);
//	DrawData(&struc);
	return;
}

void Graph::OnZoom(HWND hWnd, U16 xPos, U16 yPos) 
{
	static DrawDataStruct struc;
	CRect crect;
	CSize csize;
	int startX;
	U32 dataStart;

	::GetWindowRect(hWnd, &crect);
	csize.cx = abs(crect.left - crect.right) - 1;
	csize.cy = abs(crect.top - crect.bottom) - 1;

	startX = xPos - (csize.cx >> 3);
	if (startX < 0) {
		startX = 0;
	}
	if (startX > (csize.cx - (csize.cx >> 2))) {
		startX = csize.cx - (csize.cx >> 2);
	}

	dataStart = startX * dwDataSizeX;
	dataStart /= csize.cx;

	struc.dwDataSizeX = dwDataSizeX >> 2;
	struc.lpData = &lpData[dataStart];
	struc.bHaveData = bHaveData;
	struc.bUseDots = bUseDots;
	struc.hWnd = hWnd;
	AfxBeginThread(DrawData,&struc);
//	DrawData(&struc);
	return;
}

BOOL Graph::OnInitDialog() 
{
	CDialog::OnInitDialog();

	MakeWindow();
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

LRESULT CALLBACK WinProc(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);

void Graph::MakeWindow(void) {
	ATOM winclass;
	WNDCLASS wndclass;
	HWND hwnd;
	DWORD id;
	CWnd *parent = CWnd::FromHandle(m_hWnd);
	int X, Y;
	char temp[512];
	CRect parentRect;

	GetWindowThreadProcessId(m_hWnd, &id);

	wndclass.style = CS_VREDRAW | CS_HREDRAW;
	wndclass.lpfnWndProc = WinProc;
	wndclass.cbClsExtra = 0;
	wndclass.cbWndExtra = 0;
	wndclass.hInstance = NULL;
	wndclass.hIcon = NULL;
	wndclass.hCursor = LoadCursor(NULL,IDC_CROSS);
	wndclass.hbrBackground = NULL;
	wndclass.lpszMenuName = NULL;
	sprintf(temp,"ScopeClass%X", id);
	wndclass.lpszClassName = temp;

	scopeWnd = NULL;
	winclass = RegisterClass(&wndclass);
	if (winclass == 0) {
#ifdef _DEBUG
		DWORD err = GetLastError();
		sprintf(temp,"Error %X (%d)",err,err);
		MessageBox(temp,"Error",MB_OK);
#endif
		return;
	}

	parent->GetWindowRect(parentRect);
	X = abs(parentRect.left - parentRect.right) - 30;
	Y = abs(parentRect.top - parentRect.bottom) - 50;

	hwnd = CreateWindowEx(0, temp, NULL, WS_CHILD | WS_VISIBLE, 10, 10, X, Y, parent->m_hWnd, NULL, NULL, NULL);
	scopeWnd = hwnd;
	return;
}

void Graph::DoPaint(HWND hWnd) {
	HDC hdc;
	PAINTSTRUCT ps;
	RECT rect;
	CBrush cbrush;

	hdc = ::BeginPaint(hWnd, &ps);
	::GetClientRect(hWnd, &rect);

	cbrush.CreateSolidBrush(RGB(255,255,255));
	::FillRect(hdc, &rect, HBRUSH(cbrush));

	::EndPaint(hWnd, &ps);
	return;
}

void Graph::Resize(HWND hWnd) {
	CWnd *parent = CWnd::FromHandle(m_hWnd);
	int X, Y;
	CRect parentRect;

	parent->GetWindowRect(parentRect);
	X = abs(parentRect.left - parentRect.right) - 30;
	Y = abs(parentRect.top - parentRect.bottom) - 50;

	::MoveWindow(hWnd, 10, 10, X, Y, TRUE);
	return;
}

LRESULT CALLBACK WinProc(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam) {
	switch (Msg) {
		case WM_RBUTTONDOWN:
 			theApp.dlg.OnZoom(hWnd, LOWORD(lParam), HIWORD(lParam));
			break;
		case WM_LBUTTONUP:
			theApp.dlg.OnGraph(hWnd);
			return 0;
		case WM_SIZE:
			theApp.dlg.Resize(hWnd);
			return 0;
		case WM_PAINT:
			theApp.dlg.DoPaint(hWnd);
			return 0;
		case WM_DESTROY:
			return 0;
	}
	return DefWindowProc(hWnd, Msg, wParam, lParam);
} 

void Graph::OnSize(UINT nType, int cx, int cy) 
{
	CDialog::OnSize(nType, cx, cy);
	::PostMessage(scopeWnd, WM_SIZE, nType, (cx + (cy << 16)));
	return;
}

BOOL Graph::DestroyWindow() 
{
	DWORD id;
	char temp[512];
	BOOL ret;

	GetWindowThreadProcessId(m_hWnd, &id);
	sprintf(temp,"ScopeClass%X", id);

	ret = CDialog::DestroyWindow();

	UnregisterClass(temp,NULL);
	return ret;
}
