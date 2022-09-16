/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	dll_wnd.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  Create a message window that we can do text blits to ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */
 
#include "dll.h"
#include        "dll_prot.h"

char    ClassName[] = "DECtalkPC_DLL";
WNDCLASS                wndclass;
HWND            dtpcMessWnd;
/*HANDLE        dtpcInst; */
int     WndXmax;
int     WndYmax; 
	HWND thewnd;
	HDC      thehandle;

void _dtpcMessageWindow(HANDLE hinst)
/*HANDLE hinst; */
{                       

	TEXTMETRIC      wtm;
	int     new_x,new_y,pos_x,pos_y;

	if(dtpcMessWnd)
		return;
	if(hinst != (HANDLE)NULL)
		{
		dtpcInst = hinst;
		wndclass.style =        0;
		wndclass.lpfnWndProc = DefWindowProc;
		wndclass.cbClsExtra = 0;
		wndclass.cbWndExtra = 0;
		wndclass.hInstance = hinst;
		wndclass.hIcon = (HWND)NULL;
		wndclass.hCursor = (HWND)LoadCursor((HWND)NULL, IDC_ARROW);
		wndclass.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
		wndclass.lpszMenuName = 0;
		wndclass.lpszClassName = ClassName;
		if(RegisterClass(&wndclass))
			{                     
			thewnd=GetDesktopWindow();
			thehandle=GetDC(thewnd);
			GetTextMetrics(thehandle,&wtm);
			WndXmax = wtm.tmAveCharWidth;
			new_x = WndXmax*50;
			WndYmax = wtm.tmHeight;
			new_y =WndYmax*6;
			pos_x = (GetSystemMetrics(SM_CXFULLSCREEN)-new_x)/2;
			pos_y = (GetSystemMetrics(SM_CYFULLSCREEN)-new_y)/2;
			dtpcMessWnd = CreateWindow(     ClassName,
													"DECtalk(TM) PC",
													WS_BORDER|WS_OVERLAPPED|WS_CAPTION|WS_VISIBLE,
													pos_x,
													pos_y,
													new_x,
													new_y,
													HWND_DESKTOP,
													(HWND)NULL,
													hinst,
													(void __far *)NULL);
			if(dtpcMessWnd == (HWND)NULL)
				UnregisterClass(ClassName, hinst);
			}                                             
			ReleaseDC(thewnd,thehandle);
		}
}

void _dtpcKillMessageWindow()
{
	if(dtpcMessWnd)
		{
		DestroyWindow(dtpcMessWnd);
		UnregisterClass(ClassName, dtpcInst);
		dtpcMessWnd=(HWND)NULL;
		}
}

void    _dtpcOutMessWindow(int x,int y,char *text)
/*int   x,y; */
/*char  *text; */
{
	char    temp[50];
	int     i;

	if(dtpcMessWnd)
		{
		thehandle=GetDC(dtpcMessWnd);
		for(i=0;i<50;temp[i++]=' ');
		for(i=0;text[i] && i+x<50;i++) 
			{
			temp[i+x] = text[i];
			}
		TextOut(thehandle,0,y*WndYmax,temp,50);
		} 
		ReleaseDC(dtpcMessWnd,thehandle);
}

void _dtpcClearMessWindow()
{
	char    temp[100];
	int     i;

	if(dtpcMessWnd)
		{
		thehandle=GetDC(dtpcMessWnd);
		for(i=0;i<100;temp[i++]=' ');
		temp[99] = '\0';
		for(i=0;i<5;i++)
			{
			TextOut(thehandle,0,i*WndYmax,temp,100);
			}
		}         
		ReleaseDC(dtpcMessWnd,thehandle);
}
