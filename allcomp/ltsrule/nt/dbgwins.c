/*********************************************************************					*/
/*********************************************************************					*/
/*                                                                    					*/
/*  COPYRIGHT NOTICE                                                  					*/
/*                                                                    					*/
/*  Copyright © 2000, 2001 Force Computer, Inc., a Solectron company. All rights reserved. 	*/
/*  Copyright (c) Digital Equipment Corporation, 1998                 				  	*/
/*																						*/
/*  All Rights reserved. Unpublished rights reserved under the        					*/
/*  copyright laws of the United States. Copyright is claimed in      					*/
/*  the computer program and user interface thereof.                  					*/
/*                                                                    					*/
/*  The software contained on this media is proprietary to and        					*/
/*  embodies the confidential technology of Force Computers Incorporated.         		*/
/*  Possession, use, duplication or dissemination of     								*/
/*  the software and media is authorized only pursuant to a valid     					*/
/*  written license from Force Computers Incorporated.               					*/
/*                                                                    					*/
/*  The name of Force Computers Incorporated may not be used to      					*/
/*  endorse or promote products derived from this software without    					*/
/*  specific prior written permission. All other rights reserved.     					*/
/*                                                                    					*/
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      					*/
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        					*/
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        					*/
/*  FOR A PARTICULAR PURPOSE.                                         					*/
/*  Force assumes no responsibility AT ALL for the use or           					*/
/*  reliability of this software.                                     					*/
/*                                                                    					*/
/*                                                                    					*/
/* +----------------------------------------------------------------+ */
/* | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS       | */
/* | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)       | */
/* | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.| */
/* |                                                                | */
/* +----------------------------------------------------------------+ */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/*    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001  JAW     02/27/1998  Merged CE code.
 * 0012 CJL     03/18/1998  Removed specific path for dectalkf.h.
 * 0013 EAB		09/24/1998  Fixed WINPRINTF function, so that it can be truely called with or without 
 *							a carriage return BATS 760
 * 004	MGS		09/09/1998	made it print the data the first time through
 * 005	mfg		07/29/1999	undefined process.h for WinCE
 * 006	MGS		10/29/1999	removed debug window for release builds
 * 007	NAL		05/23/2000	Warning removal
 * 008 	CAB		10/16/00	Changed copyright info
 * 009	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 010	CAB		05/14/2001 	Updated copyright info
 * 011	MGS		06/07/2001	Made it restart when closed
 */

 
/*
 * Debug Window Source File
 *  Kevin Bruckert  July 11, 1996
 *
 * These function create a virtual "printf" function for WIN95/NT for debugging
 *
 * Used by PH
 */
#ifdef _DEBUG

#include "dectalkf.h"
#include "port.h"

#if !defined OS_PALM && !defined CASIO_SH3
#include <stdio.h>
#endif
#include <windows.h>

#ifndef UNDER_CE
#include <process.h>
#endif
#include <stdarg.h>
#include <commdlg.h>
#include "dbgwins.h"

#ifndef UNDER_CE

// #define	USE_MAIN

#define	MAIN_VER	1
#define	MIN_VER		1

#define	TIMER_MS	250

#define	OWIN_STYLE		(WS_POPUPWINDOW)
#define	WIN_STYLE		(WS_CAPTION | WS_OVERLAPPEDWINDOW | WS_VISIBLE | WS_MINIMIZEBOX | WS_VSCROLL)
#define	WIN_X_START		0
#define	WIN_Y_START		0
#define	WIN_X_SIZE		750
#define	WIN_Y_SIZE		400
#define	WIN_MENU		NULL

/* WinProc */
LONG APIENTRY debug_window(HWND hWnd, UINT uiMessage, WPARAM wParam, LPARAM lParam);

HWND	DbgWindow;

/* String buffer from WINprintf calls */
char	WpfStrBuffer[MAX_LINES][MAX_PER_LINE];
int		CurrentLine;
int		DispLine;
int		WinLines = 0;
int		updated = 0;
/* 004	MGS		09/09/1998	made it print the data the first time through */
volatile int		in_winmain=0;
volatile int		Thread_Alive = 0;

/* Prototypes */
void initialize_window(void);
void unitialize_window(void);
int do_window(void);
void WINprint(char *str);
void PaintClient(void);
void VScroll(int ScrollVal, short int ScrollPos);
void SetVScroll(void);
void KPress(int key);
void Timer(void);

#define	printf WINprintf

#ifndef USE_MAIN

int WINmain(void);

void WINstart_thread(void) {
#ifndef LDS_BUILD
	if (Thread_Alive==0 && in_winmain==0)
	_beginthread((void *)WINmain,0,0); // NAL warning removal
#endif
	return;
}
#endif

#ifdef USE_MAIN
int APIENTRY WinMain( HINSTANCE hInstance,
					  HINSTANCE hPrevInstance,
					  LPSTR lpCmdLine,
					  int nCmdShow)
#else
int WINmain(void)
#endif
{
	int ret = 0; // NAL warning removal

	if (Thread_Alive == 1)			return ret;		/* Don't rerun WINmain */
	if (in_winmain==1) return ret;
	in_winmain=1;
	initialize_window();
	if (SetTimer(DbgWindow, 1, TIMER_MS, NULL) == 0) {
		unitialize_window();
		MessageBox(DbgWindow, "Unable to allocate timer", "Debug Window Error", MB_ICONERROR | MB_OK);
		return ret;
	}

	Thread_Alive = 1;

	printf("Debug window v%d.%02d ready...\n",MAIN_VER,MIN_VER);
	ret = do_window();
	unitialize_window();
	KillTimer(DbgWindow, 1);
	DbgWindow=NULL;
	Thread_Alive = 0;
	in_winmain=0;
	return ret;
}

void initialize_window(void) {
	HWND		handle;
	WNDCLASS	Wndclass;
	DWORD		err;
	char		WndClass[] = "DebugWindow";

	Wndclass.style = CS_BYTEALIGNCLIENT | CS_GLOBALCLASS | CS_HREDRAW | CS_VREDRAW;
	Wndclass.lpfnWndProc = debug_window;
	Wndclass.cbClsExtra = 0;
	Wndclass.cbWndExtra = 0;
	Wndclass.hInstance = NULL;
	Wndclass.hIcon         = LoadIcon(NULL, IDI_APPLICATION);
	Wndclass.hCursor       = LoadCursor (NULL, IDC_ARROW) ;
	Wndclass.hbrBackground = GetStockObject (WHITE_BRUSH) ;
	Wndclass.lpszMenuName = NULL;
	Wndclass.lpszClassName = WndClass;

	if (!RegisterClass(&Wndclass))	{ /*return; */ }
	handle = CreateWindow(WndClass, WndClass, WIN_STYLE, WIN_X_START, WIN_Y_START,
							WIN_X_SIZE, WIN_Y_SIZE, WIN_MENU, NULL, NULL, NULL);
	
	DbgWindow = handle;
	
	if (handle == NULL) {
		err = GetLastError();
		return;
	}

	/* Window created successfully */
	CurrentLine = 0;
	DispLine = 0;
	return;
}

void unitialize_window(void) {
	UnregisterClass("WndClass",NULL);
	return;
}

int do_window(void) {
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
LONG APIENTRY debug_window(HWND hWnd, UINT uiMessage, WPARAM wParam, LPARAM lParam) {
	switch (uiMessage) {
		case WM_DESTROY:	PostQuitMessage(0);
							break ;

		case WM_CLOSE:		/* Close window */
							DestroyWindow(hWnd);
							break;

		case WM_PAINT:		/* Paint the client */
							PaintClient();
							break;

		case WM_VSCROLL:	/* Verticle Scroll Bar */
							VScroll((int) LOWORD(wParam), (short int) HIWORD(wParam));
							break;

		case WM_KEYDOWN:	/* Character recieved */
							KPress((int) wParam);
							break;

		case WM_TIMER:		/* Timer Click */
							if (updated)	Timer();
							break;

		default:			return DefWindowProc(hWnd,uiMessage, wParam, lParam);
	}

	return 0L;
}

void WINprint(char *str) {
	static int Pos_X = 0, Pos_Y = 0;
	int counter=0;
#if 0
	if (Thread_Alive == 0)				return;		/* Try to not slow down the system if dead */
#endif
		if (Thread_Alive == 0)			
	{
		if (in_winmain==0)
		{
			WINstart_thread();
			while (Thread_Alive==0 && counter++ <500)
			{
				Sleep(50);
			}
		}
	}
	if (CurrentLine < MAX_LINES) {
		strncpy(WpfStrBuffer[CurrentLine],str,MAX_PER_LINE-1);
		WpfStrBuffer[CurrentLine][MAX_PER_LINE-1]='\0';
		CurrentLine++;
		DispLine = CurrentLine;
		SetScrollRange(DbgWindow, SB_VERT, 1, CurrentLine, TRUE);
		SetVScroll();
	} else {
		memmove(WpfStrBuffer[0],WpfStrBuffer[1],(MAX_LINES-1) * MAX_PER_LINE);
		strncpy(WpfStrBuffer[MAX_LINES-1],str,MAX_PER_LINE-1);
		WpfStrBuffer[MAX_LINES-1][MAX_PER_LINE-1]='\0';
	}
	updated = 1;
	return;
}

void PaintClient(void) {
	HDC DbgDC;
	int Pos_X = 0, Pos_Y = 0;
	SIZE sz;
	RECT winsz;
	int line, lines, chklines;
	PAINTSTRUCT ps;

	DbgDC = BeginPaint(DbgWindow, &ps);

	SetVScroll();
	updated = 0;

	if (CurrentLine != 0) {
		if (!GetClientRect(DbgWindow, &winsz))					return;
		if (!GetTextExtentPoint32(DbgDC, WpfStrBuffer[CurrentLine-1],
			strlen(WpfStrBuffer[CurrentLine-1]), &sz))	return;

		lines = (winsz.bottom - winsz.top) / (sz.cy + 1);
		if (lines > CurrentLine)	lines = CurrentLine;
		WinLines = lines;

		chklines = DispLine;
		if (DispLine < lines)	chklines = lines;
		line = DispLine - lines;
		if (line < 0)	line = 0;
		lines += line;

		for (;line < chklines; line++) {
			TextOut(DbgDC, Pos_X, Pos_Y, WpfStrBuffer[line], strlen(WpfStrBuffer[line]));
			Pos_Y += sz.cy + 1;
		}
	}

	SetScrollRange(DbgWindow, SB_VERT, 0, CurrentLine - WinLines + 1, TRUE);
	SetVScroll();
	EndPaint(DbgWindow, &ps);
	return;
}

void Timer(void) {
	RECT winsz;

	if (!GetClientRect(DbgWindow, &winsz))					return;
	InvalidateRect(DbgWindow, &winsz, TRUE);
	return;
}

void VScroll(int ScrollVal, short int ScrollPos) {
	HDC		DbgDC;
	SIZE	sz;
	RECT	winsz;
	int		page = 0;

	if (!GetClientRect(DbgWindow, &winsz))					return;
	if (CurrentLine != 0) {
		DbgDC = GetDC(DbgWindow);
		if (!GetTextExtentPoint32(DbgDC, WpfStrBuffer[CurrentLine-1],
			strlen(WpfStrBuffer[CurrentLine-1]), &sz))		return;
		page = (winsz.bottom - winsz.top) / (sz.cy + 1);
		WinLines = page;
		ReleaseDC(DbgWindow,DbgDC);
	}

	switch (ScrollVal) {
		case SB_BOTTOM:			DispLine = CurrentLine;	break;
		case SB_LINEDOWN:		DispLine++;				break;
		case SB_LINEUP:			DispLine--;				break;
		case SB_PAGEDOWN:		DispLine += page;		break;
		case SB_PAGEUP:			DispLine -= page;		break;
		case SB_THUMBPOSITION:	DispLine = ScrollPos + WinLines - 1;	break;
		case SB_THUMBTRACK:		DispLine = ScrollPos + WinLines - 1;	break;
		case SB_TOP:			DispLine = 0;			break;
	}
	if (DispLine > CurrentLine)		DispLine = CurrentLine;
	if (DispLine < 0)				DispLine = 0;

	SetVScroll();
	InvalidateRect(DbgWindow, &winsz, TRUE);
	return;
}

void SetVScroll(void) {
	SCROLLINFO SInfo;

	SInfo.cbSize = sizeof(SInfo);
	SInfo.fMask = SIF_POS;
	SInfo.nPos = DispLine - WinLines + 1;
	if (DispLine - WinLines < 0)	SInfo.nPos = 0;
	SetScrollInfo(DbgWindow, SB_VERT, &SInfo, TRUE);
	return;
}

void PrintFile(void) {
	/* Initialize the PRINTDLG members. */ 
	PRINTDLG pd;
	DWORD err;

 
	pd.lStructSize = sizeof(PRINTDLG); 
	pd.hDevMode = (DT_HANDLE) NULL; 
	pd.hDevNames = (DT_HANDLE) NULL; 
	pd.Flags = PD_RETURNDC;
	pd.hwndOwner = DbgWindow;
	pd.hDC = (HDC) NULL; 
	pd.nFromPage = 1; 
	pd.nToPage = 1; 
	pd.nMinPage = 0; 
	pd.nMaxPage = 0; 
	pd.nCopies = 1; 
	pd.hInstance = (DT_HANDLE) 1; 
	pd.lCustData = 0L; 
	pd.lpfnPrintHook = (LPPRINTHOOKPROC) NULL; 
	pd.lpfnSetupHook = (LPSETUPHOOKPROC) NULL; 
	pd.lpPrintTemplateName = (LPSTR) NULL; 
	pd.lpSetupTemplateName = (LPSTR)  NULL; 
	pd.hPrintTemplate = (DT_HANDLE) NULL; 
	pd.hSetupTemplate = (DT_HANDLE) NULL; 
 
	/* Display the PRINT dialog box. */ 
 
	PrintDlg(&pd); 
	err = CommDlgExtendedError();
 	return;
}

LPSTR GetFileName(void) {
	OPENFILENAME file;
	BOOL ret;
	static UCHAR filenm[300];
	UCHAR filter[256];

	strcpy(filter,"*.*");
	filter[strlen(filter)+1] = '\0';
	strcpy(filenm,"debug.out");

	file.lStructSize = sizeof(OPENFILENAME);
	file.hwndOwner = NULL;
	file.hInstance = NULL;
	file.lpstrFilter = filter;
	file.lpstrCustomFilter = NULL;
	file.nMaxCustFilter = (ULONG) NULL;
	file.nFilterIndex = (ULONG) 1;
	file.lpstrFile = filenm;
	file.nMaxFile = 300;
	file.lpstrFileTitle = NULL;
	file.nMaxFileTitle = 0;
	file.lpstrInitialDir = NULL;
	file.lpstrTitle = "Save as...";
	file.Flags = OFN_EXPLORER | OFN_OVERWRITEPROMPT;
	file.nFileOffset = 0;
	file.nFileExtension = (USHORT) NULL;
	file.lpstrDefExt = NULL;
	file.lCustData = (long) NULL;
	file.lpfnHook = NULL;
	file.lpTemplateName = NULL;

	ret = GetSaveFileName(&file);
	if (ret == FALSE)	return NULL;
	return filenm;
}

void SaveFile(void) {
	LPSTR fname = GetFileName();
	FILE *out;
	int line;

	if (fname == NULL) {
		MessageBox(DbgWindow, "Save cancelled", "Debug Window Error", MB_ICONERROR | MB_OK);
		return;
	}
	out = fopen(fname,"w");
	if (out == NULL) {
		MessageBox(DbgWindow, "Unable to save file", "Debug Window Error", MB_ICONERROR | MB_OK);
		return;
	}

	for (line = 0; line < CurrentLine; line++) {
		fprintf(out, "%s\r\n", WpfStrBuffer[line]);
	}
	fclose(out);
	return;
}

void ClearDisp(void) {
	CurrentLine = 0;
	DispLine = 0;
	return;
}

void KPress(int key) {
	HDC		DbgDC;
	SIZE	sz;
	RECT	winsz;
	int		page = 0;

	if (!GetClientRect(DbgWindow, &winsz))					return;
	if (CurrentLine != 0) {
		DbgDC = GetDC(DbgWindow);
		if (!GetTextExtentPoint32(DbgDC, WpfStrBuffer[CurrentLine-1],
			strlen(WpfStrBuffer[CurrentLine-1]), &sz))		return;
		page = (winsz.bottom - winsz.top) / (sz.cy + 1);
		ReleaseDC(DbgWindow,DbgDC);
	}

#define	KEY_END		35
#define	KEY_DOWN	40
#define	KEY_UP		38
#define	KEY_PGDN	34
#define	KEY_PGUP	33
#define	KEY_HOME	36
#define KEY_S		83
#define KEY_P		80
#define KEY_C		67

	switch (key) {
		case KEY_END:			DispLine = CurrentLine;	break;
		case KEY_DOWN:			DispLine++;				break;
		case KEY_UP:			DispLine--;				break;
		case KEY_PGDN:			DispLine += page;		break;
		case KEY_PGUP:			DispLine -= page;		break;
		case KEY_HOME:			DispLine = 0;			break;
		case KEY_S:				SaveFile();				break;
		case KEY_P:				PrintFile();			break;
		case KEY_C:				ClearDisp();			break;	
	}
	if (DispLine > CurrentLine)		DispLine = CurrentLine;
	if (DispLine < 0)				DispLine = 0;

	SetVScroll();
	InvalidateRect(DbgWindow, &winsz, TRUE);
	return;
}


void WINprintf(char *fmt, ...) {
	static char line[1024];
	char		tmp[1024];
	static int inbufptr=0;
//	static char lmode = 0;
	unsigned int	ch; // NAL warning removal
	int counter=0;
	va_list vargs;

/* 004	MGS		09/09/1998	made it print the data the first time through */
#if 0
	if (Thread_Alive == 0)			
		return;		/* Try to not slow down the system if dead */
#else
	if (Thread_Alive == 0)			
	{
		if (in_winmain==0)
		{
			WINstart_thread();
			while (Thread_Alive==0 && counter++ <500)
			{
				Sleep(50);
			}
		}
	}
#endif
/* 004	MGS		09/09/1998	made it print the data the first time through */
//	if (lmode == 0)		strcpy(line,"");

	va_start(vargs,fmt);
	vsprintf(tmp,fmt,vargs);
	va_end(vargs);
	
	ch=0;	
	/* Scan for new line chars... */
	/*strcat(line,tmp); EAB This doesn't remember what was already there
	so if the routine is called without a carriage return it forgets
	BUT it appeared to work becase as long as there was a cariage return in the input
	area something would dump BATS 760*/
	
	while (ch < strlen(tmp))
	{
		line[inbufptr++]=tmp[ch];
		ch++;
	}
	line[inbufptr]='\0';

	ch = 0;
	
	while (ch < strlen(line)) {
		if (line[ch] == 10 || line[ch] == 13) {
			/* New line detected */
			strcpy(tmp,line);
			tmp[ch] = '\0';
			WINprint(tmp);
			inbufptr = 0;
			//break;
			/* Carriage-return/line feed */
			if (tmp[ch+1] == 10 || tmp[ch+1] == 13)	
			{
				ch++;
			}
			strcpy(tmp,line + ch + 1);
			strcpy(line,tmp);
			ch=0;
			inbufptr=strlen(line);
			
		} else {
			ch++;
		}
	}
/* 004	MGS		09/09/1998	made it print the data the first time through */
//	if (strlen(line) > 2 && line[0] > 31)	lmode = 1;
	return;
}

#endif


#else //#ifdef _DEBUG
void WINprintf(char *fmt, ...) {}

void WINstart_thread(void){}

void WINprint(char *str){}

#endif

