/*
 * Formant Debug Window Source File
 *  Kevin Bruckert  September 19, 1996
 *
 * These function creates a formant tracker on WIN95/NT for debugging
 *
 * Used by PHdraw
 */

#include <stdio.h>
#include <windows.h>
#include <process.h>
#include <stdarg.h>
#include <commdlg.h>
#include "formtrak.h"

/* Comment out for BLACK AND WHITE mode */
#define PEN_COLOR

#define	MAIN_VER	1
#define	MIN_VER		0

#define	WIN_STYLE		(WS_CAPTION | WS_OVERLAPPEDWINDOW | WS_VISIBLE)
#define	WIN_X_START		550
#define	WIN_Y_START		0
#define	WIN_X_SIZE		300
#define	WIN_Y_SIZE		200
#define	WIN_MENU		NULL

/* WinProc */
LONG APIENTRY formant_window(HWND hWnd, UINT uiMessage, WPARAM wParam, LPARAM lParam);

HWND	FormWindow;

int		FORMThread_Alive = 0;

/* Prototypes */
void	FORMinitialize_window(void);
void	FORMunitialize_window(void);
int		FORMdo_window(void);
void	FORMPaintClient(void);
int		FORMmain(void);

void FTRACKstart_thread(void) {
	if (FORMThread_Alive)	return;
	_beginthread(FORMmain,0,0);
	return;
}

int FORMmain(void)
{
	int ret;

	FORMinitialize_window();

	FORMThread_Alive = 1;
	ret = FORMdo_window();
	FORMunitialize_window();
	FORMThread_Alive = 0;
	return ret;
}

void FORMinitialize_window(void) {
	HWND		handle;
	WNDCLASS	Wndclass;
	DWORD		err;
	char		WndClass[] = "FormantWindow";

	Wndclass.style = CS_BYTEALIGNCLIENT | CS_GLOBALCLASS;
	Wndclass.lpfnWndProc = formant_window;
	Wndclass.cbClsExtra = 0;
	Wndclass.cbWndExtra = 0;
	Wndclass.hInstance = NULL;
	Wndclass.hIcon         = LoadIcon(NULL, IDI_APPLICATION);
	Wndclass.hCursor       = LoadCursor (NULL, IDC_ARROW) ;
	Wndclass.hbrBackground = GetStockObject (WHITE_BRUSH) ;
	Wndclass.lpszMenuName = NULL;
	Wndclass.lpszClassName = WndClass;

	if (!RegisterClass(&Wndclass))	return;
	handle = CreateWindow(WndClass, WndClass, WIN_STYLE, WIN_X_START, WIN_Y_START,
							WIN_X_SIZE, WIN_Y_SIZE, WIN_MENU, NULL, NULL, NULL);
	
	FormWindow = handle;
	
	if (handle == NULL) {
		err = GetLastError();
		return;
	}

	/* Window created successfully */
	return;
}

void FORMunitialize_window(void) {
	return;
}

int FORMdo_window(void) {
	MSG msg;

	while (GetMessage(&msg, NULL, 0, 0)) {
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}
	return msg.wParam;
}

//
//  WindowProc
//
LONG APIENTRY formant_window(HWND hWnd, UINT uiMessage, WPARAM wParam, LPARAM lParam) {
	switch (uiMessage) {
		case WM_DESTROY:	PostQuitMessage(0);
							break ;

		case WM_CLOSE:		/* Close window */
							DestroyWindow(hWnd);
							break;

		case WM_PAINT:		/* Paint the client */
							FORMPaintClient();
							break;

		default:			return DefWindowProc(hWnd,uiMessage, wParam, lParam);
	}

	return 0L;
}

void FTRACKplot(int f1, int f2, int f3, int f4) {
	int sf1, sf2, sf3, sf4;
	HDC DC;
	RECT rect;
	RECT invrect;
	int szy;
#ifdef PEN_COLOR
	HPEN hPen;
#endif

	if (!FORMThread_Alive)	return;

	GetClientRect(FormWindow,&rect);
	GetClientRect(FormWindow,&invrect);
	rect.bottom = (rect.bottom >> 1) - 1;

	szy = rect.bottom - rect.top;
	sf1 = rect.bottom - ((f1 * szy) / 4500);
	sf2 = rect.bottom - ((f2 * szy) / 4500);
	sf3 = rect.bottom - ((f3 * szy) / 4500);
	sf4 = rect.bottom - ((f4 * szy) / 4500);

	invrect.left = invrect.right - 2;
	ScrollWindowEx(FormWindow, -1, 0, &rect, NULL, NULL, &invrect, SW_ERASE | SW_INVALIDATE);
	UpdateWindow(FormWindow);

	if ((DC = GetDC(FormWindow)) == NULL)	return;

#ifdef PEN_COLOR
	hPen = CreatePen(PS_SOLID, 1, RGB(255,255,255));
	SelectObject(DC, hPen);
	MoveToEx(DC,rect.right-1,rect.top,NULL);
	LineTo(DC,rect.right-1,rect.bottom);
	DeleteObject(hPen);

	hPen = CreatePen(PS_SOLID, 1, RGB(0,255,0));
	SelectObject(DC, hPen);
#endif
	MoveToEx(DC,rect.right-1,sf1,NULL);
	LineTo(DC,rect.right,sf1);
#ifdef PEN_COLOR
	DeleteObject(hPen);
	hPen = CreatePen(PS_SOLID, 1, RGB(0,0,255));
	SelectObject(DC, hPen);
#endif
	MoveToEx(DC,rect.right-1,sf2,NULL);
	LineTo(DC,rect.right,sf2);
#ifdef PEN_COLOR
	DeleteObject(hPen);
	hPen = CreatePen(PS_SOLID, 1, RGB(255,0,0));
	SelectObject(DC, hPen);
#endif
	MoveToEx(DC,rect.right-1,sf3,NULL);
	LineTo(DC,rect.right,sf3);
#ifdef PEN_COLOR
	DeleteObject(hPen);
	hPen = CreatePen(PS_SOLID, 1, RGB(0,0,0));
	SelectObject(DC, hPen);
#endif
	MoveToEx(DC,rect.right-1,sf4,NULL);
	LineTo(DC,rect.right,sf4);
#ifdef PEN_COLOR
	DeleteObject(hPen);
#endif

	ReleaseDC(FormWindow,DC);
	return;
}

void FTRACKav(int av) {
	int sav;
	HDC DC;
	RECT rect;
	RECT invrect;
	int szy;
#ifdef PEN_COLOR
	HPEN hPen;
#endif
#ifdef LASTY
	static int lasty = 0;
#endif

	if (!FORMThread_Alive)	return;

	GetClientRect(FormWindow,&rect);
	GetClientRect(FormWindow,&invrect);
	rect.top = (rect.bottom >> 1) + 1;

	szy = rect.bottom - rect.top;
	sav = rect.bottom - ((av * szy) / 90);

	invrect.left = invrect.right - 2;
	ScrollWindowEx(FormWindow, -1, 0, &rect, NULL, NULL, &invrect, SW_ERASE | SW_INVALIDATE);
	UpdateWindow(FormWindow);

	if ((DC = GetDC(FormWindow)) == NULL)	return;

#ifdef PEN_COLOR
	hPen = CreatePen(PS_SOLID, 1, RGB(255,255,255));
	SelectObject(DC, hPen);
	MoveToEx(DC,rect.right-1,rect.top,NULL);
	LineTo(DC,rect.right-1,rect.bottom);
	DeleteObject(hPen);
	hPen = CreatePen(PS_SOLID, 1, RGB(0,0,255));
	SelectObject(DC, hPen);
#endif

#ifdef LASTY
	MoveToEx(DC,rect.right-2,lasty,NULL);
	LineTo(DC,rect.right-1,sav);
	lasty = sav;
#else
	MoveToEx(DC,rect.right-2,sav,NULL);
	LineTo(DC,rect.right-1,sav);
#endif

#ifdef PEN_COLOR
	DeleteObject(hPen);
#endif

	ReleaseDC(FormWindow,DC);
	return;
}

void FORMPaintClient(void) {
	HDC DbgDC;
	PAINTSTRUCT ps;
	RECT rect;

	DbgDC = BeginPaint(FormWindow, &ps);

	GetClientRect(FormWindow,&rect);
	MoveToEx(DbgDC, rect.left, (rect.bottom - rect.top) >> 1, NULL);
	LineTo(DbgDC, rect.right, (rect.bottom - rect.top) >> 1);
	EndPaint(FormWindow, &ps);
	return;
}

