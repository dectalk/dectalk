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
 *    File Name:	wsr_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  Windows Screen Reader ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include "wsr.h"

char szString[128];   /* variable to load resource strings         */
char szAppName[20];   /* class name for the window               */
HANDLE 	wsrInst;          
HWND 		wsrWnd;
HANDLE	wsrDlg;
DWORD	Waitsome;  

/* commented out as unused var - 8/9/95  JDB
volatile int dummy;                         
*/

int PASCAL WinMain(HANDLE hInstance, HANDLE hPrevInstance, LPSTR lpszCmdLine, int nCmdShow)
{             

 /***********************************************************************/
 /* HANDLE hInstance;       handle for this instance                    */
 /* HANDLE hPrevInstance;   handle for possible previous instances      */
 /* LPSTR  lpszCmdLine;     long pointer to exec command line           */
 /* int    nCmdShow;        Show code for main window display           */
 /***********************************************************************/

	MSG msg;
	int nRc;

	strcpy(szAppName, "DECtalk_WSR");
	wsrInst = hInstance;
	if(!hPrevInstance)
		{
		if ((nRc = nCwRegisterClasses()) == -1)
      	{
			LoadString(wsrInst, IDS_ERR_REGISTER_CLASS, szString, sizeof(szString));
			MessageBox(NULL, szString, NULL, MB_ICONEXCLAMATION);
       	return nRc;    
      	}
   	}
	wsrWnd = CreateWindow(
                szAppName,
                "DECtalk(TM) Windows File Reader",
                WS_CAPTION      |
                WS_SYSMENU      |
                WS_MINIMIZEBOX  |
                WS_MAXIMIZEBOX  |
                WS_THICKFRAME   |
                WS_VISIBLE		|
                WS_CLIPCHILDREN |
                WS_OVERLAPPED,
                CW_USEDEFAULT, 0,
                CW_USEDEFAULT, 0,
                NULL,
                NULL,
                wsrInst,
                NULL);

	if(wsrWnd == NULL)
		{
 		CwUnRegisterClasses();
		LoadString(wsrInst, IDS_ERR_CREATE_WINDOW, szString, sizeof(szString));
		MessageBox(NULL, szString, NULL, MB_ICONEXCLAMATION);
		return IDS_ERR_CREATE_WINDOW;
		}

	if(dtpcInitDll() == DLL_FAILURE)
		{
		CwUnRegisterClasses();
		LoadString(wsrInst, IDS_ERR_DLL_OPEN, szString, sizeof(szString));
		MessageBox(NULL, szString, NULL, MB_ICONEXCLAMATION);
		return IDS_ERR_DLL_OPEN;
		}

		dtpcLoadModule(0);   /* ADN 7/12/95 Automatically loads files */

/*
 *  global inits ...
 */

	wsrDlg = NULL;
	wsrFileInit();
	wsrInitTTY();

/*
 *  main message control loop ...
 */

	ShowWindow(wsrWnd, nCmdShow);            /* display main window      */
	while(true)
		{   
		
		
		if(PeekMessage(&msg,NULL,0,0,PM_REMOVE))
			{
			if(wsrDlg != NULL && IsDialogMessage(wsrDlg,&msg))
				continue;
			if(msg.message == WM_QUIT)
				break;
			TranslateMessage(&msg);
         DispatchMessage(&msg);
			}
		else
			{
			LastScroll = 0;
			if(ReadFlag)
				wsrDoRead();
			if(IndexFlag)
				wsrWatchIndex();
			}
		}
	CwUnRegisterClasses();
	return msg.wParam;
}

LONG FAR PASCAL WndProc(HWND hWnd, WORD Message, WORD wParam, LONG lParam)
{
	HMENU      hMenu=0;            /* handle for the menu                 */
	HBITMAP    hBitmap=0;          /* handle for bitmaps                  */                              
	int        nRc=0;              /* return code                         */

	switch (Message)
		{
		case WM_COMMAND:

			switch (wParam)
				{
				case IDM_M_LOAD:
					
					dtpcLoadModule(0);

					break;

				case IDM_M_SETUP:

					dtpcSetup(0,wsrWnd);
					break;

				case IDM_M_EXIT:

					DestroyWindow(wsrWnd);
     				if (hWnd == wsrWnd)
				        PostQuitMessage(0);  /* Quit the application                 */
               break;

				case	IDM_F_READ:

					if(wsrOpenFile() == SUCCESS)
						wsrReadFile(0);
					break;

				case  IDM_M_CONTENTS:
					break;

				case  IDM_M_ABOUT:
					break;
				}
			break;

		case WM_CLOSE:  /* close the window                                 */

			DestroyWindow(hWnd);
         if (hWnd == wsrWnd)
           PostQuitMessage(0);  /* Quit the application                 */
        break;

    case WM_CREATE:

		wsrInitTTY();
      break;

    case WM_PAINT:

		wsrPaintTTY();
		break;

	
		default:
         return DefWindowProc(hWnd, Message, wParam, lParam);
		} 
 return 0L;
}


int nCwRegisterClasses(void)
{
 WNDCLASS   wndclass;    /* struct to define a window class             */
 memset(&wndclass, 0x00, sizeof(WNDCLASS));


 wndclass.style = CS_HREDRAW | CS_VREDRAW | CS_BYTEALIGNWINDOW;
 wndclass.lpfnWndProc = (void _far *)WndProc;
 wndclass.cbClsExtra = 0;
 wndclass.cbWndExtra = 0;
 wndclass.hInstance = wsrInst;
 wndclass.hIcon = LoadIcon(wsrInst, "WSR");
 wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);
 wndclass.hbrBackground = GetStockObject(WHITE_BRUSH);
 wndclass.lpszMenuName = "WSR";
 wndclass.lpszClassName = szAppName;
 if(!RegisterClass(&wndclass))
   return -1;
 return(0);
}

void CwUnRegisterClasses(void)
{
 WNDCLASS   wndclass;
 memset(&wndclass, 0x00, sizeof(WNDCLASS));

 GetClassInfo(wsrInst, szAppName, &wndclass);
 DeleteObject(wndclass.hbrBackground);
 UnregisterClass(szAppName, wsrInst);
}

wsrErrorMessage(str)
char _far *str;
{
	MessageBox(wsrWnd,str,"DECtalk(TM) Windows File Reader",MB_ICONHAND|MB_TASKMODAL|MB_OK);
	return(FAILURE);
}


void FAR PASCAL wsrCenter(hWnd)
HWND hWnd;
{
	POINT pt;
	RECT swp;
	RECT rParent;
	int iwidth;
	int iheight;
	HWND	hWndc;

	hWndc = GetDesktopWindow();
	GetWindowRect(hWnd, &swp);
	GetClientRect(hWndc, &rParent);

	iwidth = swp.right - swp.left;
	iheight = swp.bottom - swp.top;

	pt.x = (rParent.right - rParent.left) / 2;
	pt.y = (rParent.bottom - rParent.top) / 2;
	ClientToScreen(hWndc, &pt);

	pt.x = pt.x - (iwidth / 2);
	pt.y = pt.y - (iheight / 2);
	MoveWindow(hWnd, pt.x, pt.y, iwidth, iheight, FALSE);
}



