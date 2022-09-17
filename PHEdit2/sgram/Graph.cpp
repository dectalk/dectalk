// Graph.cpp : implementation file
//

#include "stdafx.h"
#include "SGram.h"
#include "Graph.h"

#include <math.h>
#include <process.h>

#include "FFT4.h"

#define PI	3.141592653589793238

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/* FFT Information */
#define FREQ		11025.0
#define FFTsize		128
#define STEP		16

#define MAXPEAK		26.0		// Between 20 and 25
#define COLORTABLE	512

#define TILTFACTOR	0.01		// Tilt Adjust

void CalculateFFT(S16 *lpData, DWORD lenX, U8 **array, U16 winX, U16 winY);

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

typedef struct {
	DWORD dwDataSizeX;
	S16 *lpData;
	BOOL bHaveData;
	HWND hWnd;
} DrawDataStruct;

UINT DrawData(LPVOID input) {
	DrawDataStruct *data = (DrawDataStruct*) input;
	HDC hDc = GetDC(data->hWnd);
	CDC *pDc = CDC::FromHandle(hDc);
	int x, y, flipy;
	CPen pen;
	CPen defpen;
	CPoint cpoint;
	CSize csize;
	CRect crect;
	CBrush cbrush;
	unsigned char color;
	U8 *disp;

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

	CalculateFFT(data->lpData, data->dwDataSizeX, &disp, (U16) csize.cx, (U16) csize.cy);

	color = 0;
	defpen.CreatePen(PS_INSIDEFRAME, 0, RGB(255,255,255));
	for (x = 0; x < csize.cx; x++) {
		flipy = csize.cy - 1;
		for (y = 0; y < csize.cy; y++) {
			color = disp[x + (y * csize.cx)];
			if (color != 255)	pDc->SetPixel(x+cpoint.x, flipy+cpoint.y, RGB(color,color,color));
			flipy--;
		}
	}

	ReleaseDC(data->hWnd, hDc);
	free(disp);

	return 0;
}

void Graph::OnGraph(HWND hWnd) 
{
	static DrawDataStruct struc;

	struc.dwDataSizeX = dwDataSizeX;
	struc.lpData = &lpData[0];
	struc.bHaveData = bHaveData;
	struc.hWnd = hWnd;
//	AfxBeginThread(DrawData, &struc);
	DrawData(&struc);
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
	struc.hWnd = hWnd;
//	AfxBeginThread(DrawData, &struc);
	DrawData(&struc);
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
	sprintf(temp,"SGramClass%X", id);
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
	Y = abs(parentRect.top - parentRect.bottom) - 75;

	::MoveWindow(hWnd, 10, 35, X, Y, TRUE);
	return;
}

void Graph::DoMouseMove(HWND hWnd, U16 x, U16 y) {
	CRect crect;
	CSize csize;
	U32 freq;
	char str[128];
	int yPos;

	::GetWindowRect(hWnd, &crect);
	csize.cx = abs(crect.left - crect.right) - 1;
	csize.cy = abs(crect.top - crect.bottom) - 1;

	yPos = csize.cy - y;
	yPos = (yPos * (FFTsize / 2)) / csize.cy;
	freq = (U32) (yPos * FREQ / FFTsize);

	sprintf(str, "%d Hz",freq);
	SetDlgItemText(IDC_FREQUENCY, str);
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
		case WM_MOUSEMOVE:
			theApp.dlg.DoMouseMove(hWnd, LOWORD(lParam), HIWORD(lParam));
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
	sprintf(temp,"SGramClass%X", id);

	ret = CDialog::DestroyWindow();

	UnregisterClass(temp,NULL);
	return ret;
}

/* Calculate the FFT Window */
void CalculateFFT(S16 *lpData, DWORD lenX, U8 **array, U16 winX, U16 winY) {
	FFT4_C fft(FFTsize);
	float Real;
	float Imag;
	float FFTbuffer[FFTsize];
	double Power;
	double tiltFactor;
	U8 *newArray;
	U16 newArrayLen;
	U16 i, j, Xpos;
	U16 x, y;
	double incX, incY;
	unsigned char ColorTable[COLORTABLE];

	newArrayLen = (U16) (lenX / STEP) + 1;

	theApp.dlg.BuildColorTable(ColorTable, COLORTABLE);

	/* Allocate buffers */
	newArray = (U8*) malloc(newArrayLen * sizeof(U8) * (FFTsize >> 1));
	if (newArray == NULL)	return;
	*array = (U8*) malloc(winX * winY);
	if (*array == NULL)		return;

	/* Create newArray */
	Xpos = 0;
	for (x = 0; x < lenX; x += STEP) {
		/* Apply HANNING window while converting to FLOAT */
		if ((x + FFTsize) > (S16) lenX) {
			for (y = 0; (y + x) < (U16) lenX; y++)	FFTbuffer[y] = (float) ((0.5 - (0.5 * cos((2 * PI / FFTsize) * y))) * (float) lpData[x+y]);
			for (; y < FFTsize; y++)				FFTbuffer[y] = (float) ((0.5 - (0.5 * cos((2 * PI / FFTsize) * y))));
		} else {
			for (y = 0; y < FFTsize; y++)			FFTbuffer[y] = (float) ((0.5 - (0.5 * cos((2 * PI / FFTsize) * y))) * (float) lpData[x+y]);
		}

		fft.FFT_Real(FFTbuffer, FFTsize);

		for (i = 0; i < (FFTsize >> 1); i++) {
			j = i << 1;
			Real = FFTbuffer[j];
			Imag = FFTbuffer[j+1];
//			Power = (float) sqrt(sqrt((Real * Real) + (Imag * Imag)));
			tiltFactor = (double) ((i+1) * TILTFACTOR) + 1;
			Power = (double) log((Real * Real) + (Imag * Imag)) * tiltFactor;
			if (Power < 0.0)		Power = 0.0;
			if (Power > MAXPEAK)	Power = MAXPEAK - 1;
			newArray[Xpos + (i * newArrayLen)] = ColorTable[(U16) ((Power * (float) COLORTABLE) / MAXPEAK)];
		}
		Xpos++;
	}

	/* Prepare data */
	memset(*array, 255, winX * winY);

	incX = (double) winX / (double) newArrayLen;
	incY = (double) winY / (double) (FFTsize >> 1);

	if (incX > 1 && incY > 1)		theApp.dlg.BigXBigY(winX, winY, newArrayLen, FFTsize >> 1, *array, newArray);
	else if (incX > 1 && incY <= 1)	theApp.dlg.BigXSmallY(winX, winY, newArrayLen, FFTsize >> 1, *array, newArray);
	else if (incX <= 1 && incY > 1)	theApp.dlg.SmallXBigY(winX, winY, newArrayLen, FFTsize >> 1, *array, newArray);
	else							theApp.dlg.SmallXSmallY(winX, winY, newArrayLen, FFTsize >> 1, *array, newArray);

	free(newArray);
	return;
}

#define ENDCLIP		0

void Graph::BigXBigY(U16 newX, U16 newY, U16 orgX, U16 orgY, U8 *out, U8 *in) {
	U8 *count;
	U16 *dither;
	U16 srcX, srcY, destX, destY;
	double incX, incY, curX, curY;
	U16 x, y;

	count = (U8*) malloc(newX * newY);
	if (count == NULL)		return;
	dither = (U16*) malloc(newX * newY * sizeof(U16));
	if (dither == NULL)		return;

	memset(dither, 0, newX * newY * sizeof(U16));
	memset(count, 0, newX * newY);

	incX = (double) orgX / (double) newX;
	incY = (double) orgY / (double) newY;

	curX = 0.0;

	for (x = 0; x < (int) newX; x++) {
		curY = 0.0;
		srcX = (U16) curX;
		destX = x;
		for (y = 0; y < newY; y++) {
			srcY = (U16) curY;
			destY = y;

			dither[destX + (destY * newX)] += (U16) in[srcX + (srcY * orgX)];
			count[destX + (destY * newX)]++;
			curY += incY;
		}
		curX += incX;
	}

	for (x = 0; x < (int) newX; x++) {
		for (y = 0; y < (int) newY; y++) {
			if (count[x + (y * newX)] != 0)		out[x + (y * newX)] = 255 - (dither[x + (y * newX)] / count[x + (y * newX)]);
			else								out[x + (y * newX)] = 255;
		}
	}
	free(dither);
	free(count);
	return;
}

void Graph::BigXSmallY(U16 newX, U16 newY, U16 orgX, U16 orgY, U8 *out, U8 *in) {
	U8 *count;
	U16 *dither;
	U16 srcX, srcY, destX, destY;
	double incX, incY, curX, curY;
	U16 x, y;

	count = (U8*) malloc(newX * newY);
	if (count == NULL)		return;
	dither = (U16*) malloc(newX * newY * sizeof(U16));
	if (dither == NULL)		return;

	memset(dither, 0, newX * newY * sizeof(U16));
	memset(count, 0, newX * newY);

	incX = (double) (orgX - ENDCLIP) / (double) newX;
	incY = (double) newY / (double) orgY;

	curX = 0.0;

	for (x = 0; x < (int) newX; x++) {
		curY = 0.0;
		srcX = (U16) curX;
		destX = x;
		for (y = 0; y < orgY; y++) {
			srcY = y;
			destY = (U16) curY;

			dither[destX + (destY * newX)] += (U16) in[srcX + (srcY * orgX)];
			count[destX + (destY * newX)]++;
			curY += incY;
		}
		curX += incX;
	}

	for (x = 0; x < (int) newX; x++) {
		for (y = 0; y < (int) newY; y++) {
			if (count[x + (y * newX)] != 0)		out[x + (y * newX)] = 255 - (dither[x + (y * newX)] / count[x + (y * newX)]);
			else								out[x + (y * newX)] = 255;
		}
	}
	free(dither);
	free(count);
	return;
}

void Graph::SmallXBigY(U16 newX, U16 newY, U16 orgX, U16 orgY, U8 *out, U8 *in) {
	U8 *count;
	U16 *dither;
	U16 srcX, srcY, destX, destY;
	double incX, incY, curX, curY;
	U16 x, y;

	count = (U8*) malloc(newX * newY);
	if (count == NULL)		return;
	dither = (U16*) malloc(newX * newY * sizeof(U16));
	if (dither == NULL)		return;

	memset(dither, 0, newX * newY * sizeof(U16));
	memset(count, 0, newX * newY);

	incX = (double) newX / (double) orgX;
	incY = (double) orgY / (double) newY;

	curX = 0.0;

	for (x = 0; x < (int) orgX - ENDCLIP; x++) {
		curY = 0.0;
		srcX = x;
		destX = (U16) curX;
		for (y = 0; y < newY; y++) {
			srcY = (U16) curY;
			destY = y;

			dither[destX + (destY * newX)] += (U16) in[srcX + (srcY * orgX)];
			count[destX + (destY * newX)]++;
			curY += incY;
		}
		curX += incX;
	}

	for (x = 0; x < (int) newX; x++) {
		for (y = 0; y < (int) newY; y++) {
			if (count[x + (y * newX)] != 0)		out[x + (y * newX)] = 255 - (dither[x + (y * newX)] / count[x + (y * newX)]);
			else								out[x + (y * newX)] = 255 - dither[x + (y * newX)];
		}
	}
	free(dither);
	free(count);
	return;
}

void Graph::SmallXSmallY(U16 newX, U16 newY, U16 orgX, U16 orgY, U8 *out, U8 *in) {
	U8 *count;
	U16 *dither;
	U16 srcX, srcY, destX, destY;
	double incX, incY, curX, curY;
	U16 x, y;

	count = (U8*) malloc(newX * newY);
	if (count == NULL)		return;
	dither = (U16*) malloc(newX * newY * sizeof(U16));
	if (dither == NULL)		return;

	memset(dither, 0, newX * newY * sizeof(U16));
	memset(count, 0, newX * newY);

	incX = (double) newX / (double) orgX;
	incY = (double) newY / (double) orgY;

	curX = 0.0;

	for (x = 0; x < (int) orgX; x++) {
		curY = 0.0;
		srcX = x;
		destX = (U16) curX;
		for (y = 0; y < orgY; y++) {
			srcY = y;
			destY = (U16) curY;

			dither[destX + (destY * newX)] += (U16) in[srcX + (srcY * orgX)];
			count[destX + (destY * newX)]++;
			curY += incY;
		}
		curX += incX;
	}

	for (x = 0; x < (int) newX; x++) {
		for (y = 0; y < (int) newY; y++) {
			if (count[x + (y * newX)] != 0)		out[x + (y * newX)] = 255 - (dither[x + (y * newX)] / count[x + (y * newX)]);
			else								out[x + (y * newX)] = 255;
		}
	}
	free(dither);
	free(count);
	return;
}

#define ENDCOLOR	255
#define STARTCOLOR	32

void Graph::BuildColorTable(U8* ColorTable, U16 tablesize) {
	int x;
	int startRegion = tablesize >> 2;
	int endRegion = tablesize >> 4;
	int middleRegion = tablesize - (startRegion + endRegion);

	for (x = 0; x < startRegion; x++)				ColorTable[x] = 0;
	for (; x < middleRegion + startRegion; x++)		ColorTable[x] = (U8) (((x - startRegion) * (ENDCOLOR - STARTCOLOR)) / middleRegion);
	for (; x < tablesize; x++)						ColorTable[x] = 255;
	return;
}
