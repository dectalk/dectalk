/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1993 - 1998          */
/*   © SMART Modular Technologies 1999. All rights reserved.		  */
/*  © FORCE Computers Inc. All rights reserved.						  */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of FORCE Computers Inc.      */
/*  Possession, use, duplication or dissemination of                  */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from FORCE Computers.                             */
/*                                                                    */
/*  The name of FORCE Computers Inc. may not be used to               */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      */
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        */
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        */
/*  FOR A PARTICULAR PURPOSE.                                         */
/*  Digital assumes no responsibility AT ALL for the use or           */
/*  reliability of this software.                                     */
/*                                                                    */
/*                                                                    */
/* +----------------------------------------------------------------+ */
/* | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS       | */
/* | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)       | */
/* | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.| */
/* |                                                                | */
/* +----------------------------------------------------------------+ */
/*                                                                    */
/* Rev   Who   Date         Description                    
 * ---   ---   -----------  ---------------------------------------
 * 001   GL    03/24/1997   for BATS#305 and 311  make sure the
 *                          translation buffer terminated properly.
 * 002   GL    03/25/1997   for BATS#315  fix the debug mode crash.
 * 003   CL    04/16/1997   for BATS#307  Use symbol DTALK_HELP_FILE_NAME
 * 004   NS    07/07/1997   Moved registry entries to coop.h
 * 005   NS    08/04/1997   renamed SaveFile to MySaveFile so that
 *                          dbgwins' savefile doesn't conflict.
 * 006   CL    08/15/1997   Change helptopic.
 * 007   NS    10/06/1997   Changed start-up to exit out if 
 *                          TextToSpeechStartUp fails - BATS#474
 * 008	 MGS   01/07/1998   Converted to ML support
 * 009   MGS   02/02/1998	using the default language from enumlangs now BATS #582
 * 010   CJL   02/12/1998       Change dictionary Help call string.
 * 011   JAW   02/13/1998   For BATS #456  Fixed
 *							GetInstallationInfo(...) so it accesses the
 *							correct key within the registry.
 * 012	MGS		08/23/1999	Changed reg to SMART
 * 013  CAB     08/11/2000  Changed nothing translated to nothing highlighted
 *                          Fixed check mark for languages for ml support
 *                          Have it say nothing is highlighted in corresponding 
 *                          language.  
 *
/**********************************************************************/

#include <windows.h>
// CB ADDED file
#include "resource.h"
#include <commdlg.h>
#include <mmsystem.h>
#include <stdio.h>
#include <tchar.h>	      // For TCHAR types
// CB ADDED file
#include <commctrl.h>	  // Command bar menu
#include <string.h>
#include <stdlib.h>
#include <process.h>
// CB ADDED INCLUDES
#include <afxwin.h>			// For GetMenu() fn 
#include <wingdi.h>			// For GetStockObject()
#include "dlgs.h"
#include "cderr.h"
#include "ttsapi.h"
#include "windic.h"

#define WINDIC_C
#include "coop.h"
#undef WINDIC_C

#define rateMax 600
#define rateMin 75

// CB REMOVED

/*
#define pWidth   130    // pronounce or play button
#define pHeight  20

#define border 2

#define etWidth  400 - border * 2   //edit text for words to speak
#define etHeight 450 - border * 2

#define awWidth etWidth + border * 2 + 2    //application window
#define awHeight 60 + pHeight + border * 2  + etHeight
*/

#define FILESIZE 256
// CB ADDED define
#define GWL_HINSTANCE	(-6)

/**********************************************************************/
/*  Global variables.                                                 */
/**********************************************************************/

// CB ADDED LINES
HWND hWndCB = NULL;			// Handle to a commandbar
//HWND hWnd = NULL;
// CB ADDED LINE
TCHAR FileBuf[FILESIZE+1];

// CB
TCHAR  szAppName[] = TEXT("windic");
// CB CHANGED from HANDLE to HINSTANCE & ADDED NULL
HINSTANCE hInst = NULL;
LPTTS_HANDLE_T phTTS[10];
int  tts_cur, tts_us, tts_uk, tts_gr, tts_sp, tts_la;
int  us_on = 0, uk_on=0, sp_on=0, gr_on=0, la_on=0;
char current_lang_str[10];
int  current_language;
HWND hPrev, hNext, hwndEdit, hPlay, hFind;
TCHAR szFile[FILESIZE] = L"\0";
char szFindText[FILESIZE];
TCHAR szFileSave[FILESIZE] = L"\0";
TCHAR szFileTitleSave[FILESIZE] = L"\0";
static  char szReplaceText[FILESIZE];
BOOL    bDictionarySaved = FALSE;
// CB ADDED 
//BOOL Error = 0;

HANDLE  hFile = 0;

// CB NOT NEEDED FOR WIN CE
// BOOL bWin95 = FALSE;		  //tek: Flag to specify OS 
	                          //TRUE :	Windows'95
	                          //FALSE :else

HANDLE hFileMap;
PBYTE  pFileData;
// CB
TCHAR szAppAndFile[FILESIZE*2] = L"";	//tek 23jul96

LPLANG_ENUM languageINFO;

// CB ADDED
// For command bar push buttons 
static TBBUTTON tbVIEWButton[] = {
	{ID_PLAY, ID_PLAY, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0, 0},
	{ID_PREV, ID_PREV, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0, 1},
	{ID_NEXT, ID_NEXT, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0, 2}
};

VOID TTSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg) 
{
	return ;
}


/****************************************************************************
*
*    FUNCTION: WinMain(HINSTANCE, HINSTANCE, LPWSTR, int)
*
*    PURPOSE:  Calls initialization function, processes message loop
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/
// CB int APIENTY WinMain() & REMOVED LPSTR
int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPWSTR lpCmdLine, int nCmdShow)
{
    // CB REMOVED
	/*
	int iX;
    int iY;
    int iWidth;
	int iHeight;
	*/
	// CB REMOVED NOT SUPPORTED
    // HANDLE      hAccel;
	// CB REMOVED 
	// int iShow;
	// char *arg[2];
	MSG         msg;
	HWND        hWnd;
    WNDCLASS    wndclass;
    
	// CB
	DWORD		error = 0;                      // Message Error Info 
		
	// CB NOT NEEDED FOR WIN CE
	// WIN95 detection	
	/*
	OSVERSIONINFO  OSVersionInfo;
 
	OSVersionInfo.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
	GetVersionEx(&OSVersionInfo);
	
	if(OSVersionInfo.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS) 
	{
		bWin95 = TRUE;	 // i.e It is Windows'95 OS.
	}
	*/

	// Fill in window class structure with parameters that describe the main window.   
	// CB CHANGED from WndProc to MainWndProc

	wndclass.style         = CS_HREDRAW | CS_VREDRAW; // CB | CS_DBLCLKS | CS_OWNDC;
	wndclass.lpfnWndProc   = (WNDPROC)MainWndProc;		
	wndclass.cbClsExtra    = 0;
	wndclass.cbWndExtra    = 0;
	wndclass.hInstance     = hInstance;				// CB NULL;
	wndclass.hIcon         = NULL;// CB LoadIcon(hInstance, MAKEINTRESOURCE( ICON_APP ));
	// CB REMOVED LoadCursor( NULL, IDC_ARROW ) & CHANGED to NULL
	wndclass.hCursor       = NULL;
	// CB ADDED typecast HBRUSH
	wndclass.hbrBackground = NULL;//(HBRUSH)GetStockObject(WHITE_BRUSH);
	// CB REMOVED  L"windic_MENU" doesn't work
	wndclass.lpszMenuName  = NULL; 
	wndclass.lpszClassName = szAppName;

	// Register the window class and return success/failure code. 
	if( !RegisterClass( &wndclass ) )
	{
		error = GetLastError();
		return FALSE;
	}
	
	hInst = hInstance;

	// CB not used
	// GetApplicationParameters( &iX, &iY, &iWidth, &iHeight, &iShow, szFile );

	hWnd = CreateWindow( szAppName, szAppName, 
						//  CB
						// WS_CAPTION | WS_SYSMENU | WS_OVERLAPPEDWINDOW | WS_MINIMIZEBOX | WS_SYSMENU, 
						WS_VISIBLE, 
						// CB REMOVED  iX, iY, iWidth, iHeight,
						CW_USEDEFAULT,							// Default horizontal position.
						CW_USEDEFAULT,							// Default vertical position. 
						CW_USEDEFAULT,							// Default width. 
						CW_USEDEFAULT,							// Default height.
						NULL,									// Overlapped windows have no parent.
						NULL,									// Use the window class menu. 
						// CB REMOVED NULL
						hInstance,								// This instance owns this window. 
						NULL );									// Pointer not needed.
		
    // If window could not be created, return "failure" 
    if( !hWnd )
    {
		error = GetLastError();
		return FALSE;
    }
	
	// Make the window visible, update its client area and return "success" 
	//  CB iShow
    ShowWindow( hWnd, SW_SHOW );		 // Show the window 
    UpdateWindow( hWnd );                // Sends WM_PAINT message 
    
	// CB NOT SUPPORTED
	// DragAcceptFiles( hWnd, TRUE );       // Accept files dragged from File Manager 

    // Check for command line invocation with filename and dictionary name
    // CB CHANGED strlen & ADDED typecast LPTSTR
	/*
	if( _tcslen( (LPTSTR)lpCmdLine ) )          // Check for command line parameter 
    {
		// CB ADDED typecast ( char * )
		arg[i] =  strtok((char *)lpCmdLine, " ");
		i++;
		if( ( arg[i] =  strtok( NULL, " ")) == NULL )
		{
			i--;
		}

		switch ( i )
		{
			case 1:
				// CB ADDED typecast (char *)
				strcpy( szFile,  (char*)arg[0] );
				if( MyReadFile( hWnd, szFile ))
				{
					DrawMenuBar( hWnd );
					// reset the title in the title bar to reflect the
					// new open file
					SendMessage( hWnd, WM_SETTEXT, 0, (LPARAM)szFile );
					InvalidateRect( hwndEdit, NULL, TRUE );
					DrawMenuBar( hWnd );
					SpeakText( hWnd );
				}
				break;
			default:
				break;
		}
     }
	 */

	 // CB
     // hAccel = LoadAccelerators( hInst, L"windic_MENU" );
		
	 // CB ADDED LINE
	 //DrawMenuBar( hWnd );

     // Enter message loop

     while( GetMessage( &msg, NULL, 0, 0 ) == TRUE )
     {
		 // CB REMOVED
		 //if( !IsDialogMessage( hFind, &msg ) )
		 //{
			 
			 //if( !TranslateAccelerator( hWnd, hAccel, &msg ))
			 //{
				 TranslateMessage( &msg );			// Translates virtual key codes
				 DispatchMessage( &msg );			// Dispatches message to window  
			 //}
		 //}
	 }
     return( msg.wParam );			// Returns the value from PostQuitMessage
		 
}
/* ************************************END OF: WinMain(,,,)************************************ */


/***************************************************************************************************
*
*    FUNCTION: MainWndProc( HWND, UINT, UINT, LONG )
*
*    PURPOSE:	Processes messages
*
*    COMMENTS:  This function processes all messags sent to the window.  When the
*               user choses one of the options from one of the menus, the command
*               is processed here and passed onto the function for that command.
*
*
*    RETURN VALUES:	LONG
*
***************************************************************************************************/
LONG APIENTRY MainWndProc(HWND hWnd, UINT Message, UINT wParam, LONG lParam)
{
	
	MMRESULT mmStatus;								// Text To Speach return status code 
	
	
	static  char *  szCurrentSpeaker = " [:nh]";	// Set the speaker to be Harry 
	static  short   wSpos = 180;					// Scroll bar position - speaking rate  
	
	// CB REMOVED
	// LONG    lSelect;
	// LPMINMAXINFO  lpmmiSize;						// Used to keep track of window size    

	RECT    lprc;
	static  HBRUSH  hOldBrush, hBrush;				// Background colors                    
	
	// CB ADDED = 0
	DWORD   dwStart = 0, dwEnd = 0;					// Used when text is highlighted by the mouse 
	LONG    dwOffset;
	// CB ADDED = 0
	DWORD   dwTextLen = 0;								// The length of the characters in text editor
	// CB ADDED
	LPSTR   lpEditText = '\0', lpSelBuf='\0';
	static  UINT    uiID_Error_Msg;						/* Used in registering DECtalk Error Messages */
	static  UINT    uiMessage_Find_Replace;				/* Used in registering find messages */
	// CB CHANGED char to TCHAR & REMOVED static
	static TCHAR  szError[FILESIZE];

	// CB REMOVED STATIC & char to TCHAR
	TCHAR szFileTitle[FILESIZE];
	static  OPENFILENAME OpenFileName;
	static LPFINDREPLACE lpfrText;
	HMENU hmenu;
	MENUITEMINFO menu_info;
	
	// CB RMEOVED;
	// TCHAR lang[3];
	// DWORD dwType, cbData;

	HKEY hKeyLicense = NULL;
    char szLicenseKey[] = "Software\\DECtalk Software\\DECtalk\\4.60";
	// CB ADDED LINES
	TCHAR test1[] = L"Prounce words";
	DWORD error;
	HMENU hwndHelp = '\0';
	// CB ADDED int response;		// For switch 

	
	// CB ADDED  initialized struct
	lprc.left = 0;
	lprc.right = 0;
	lprc.top = 0;
	lprc.bottom = 0;
	switch( Message )
    {
			case WM_DESTROY:
			// CB RMOVED not used 
			// SetApplicationParameters( hWnd, szFile );
			
			if( TextToSpeechShutdown( phTTS[tts_cur] ) )
			{
				MessageBox( hWnd, L"Error Shutting down TTS", L"ERROR", MB_OK | MB_ICONSTOP );
			}
			
#ifndef WINDIC_C_STATIC
			// CB
			if (us_on)	mmStatus = TextToSpeechCloseLang(L"US");
			if (uk_on)	mmStatus = TextToSpeechCloseLang(L"UK");
			if (gr_on)	mmStatus = TextToSpeechCloseLang(L"SP");
			if (sp_on)	mmStatus = TextToSpeechCloseLang(L"GR");
			if (la_on)	mmStatus = TextToSpeechCloseLang(L"LA");
#endif

			PostQuitMessage(0);
			break;
		case WM_CLOSE:
			// CB ADDED
			
			if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
			{
				// returns FALSE if yes or no, or TRUE if CANCEL
				if( AskToSave( hWnd, &OpenFileName, szFileTitle ) ) 
					break;   // Cancel pressed

				// CB ADDED LINE
				//LocalFree(szChunk);
				DestroyWindow( hWnd );
				// CB ADDED CE needs to return false 
				return FALSE;
				// CB REMOVED break;
			}
			DestroyWindow( hWnd );
			break ;
			/*
			// Loop to check if both .tab &.dic file saved.
			while (1)
			{
				if ( (!bDictionarySaved && GetWindowTextLength( hwndEdit ) != 0) || Error)
				{
					response = MessageBox(hWnd, L"Do you want to fix error in file, so that dictionary file can be saved?",
						                  L"Error", MB_YESNOCANCEL | MB_ICONEXCLAMATION ); 
					switch( response )
					{
						case IDYES:
							MessageBox(hWnd, L"Click on menu File and then on submenu \n"
									   L"Compile Dictionary to see error.\n"
									   L"MAKE SURE TO SAVE FILE FIRST!",
									   L"ERROR", MB_OK);
						case IDCANCEL:
							return TRUE;
						case IDNO:
							if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
							{
								// returns FALSE if yes or no, or TRUE if CANCEL
								if( AskToSave( hWnd, &OpenFileName, szFileTitle ) ) 
								{
									break;   // Cancel pressed
								}
								
								// If dictionary not created
								if ( Error == 1)
									continue;
								DestroyWindow( hWnd );
								return FALSE;
							}
							DestroyWindow( hWnd );
							return FALSE;
					}
				}
				
				if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
				{
					// returns FALSE if yes or no, or TRUE if CANCEL
					if( AskToSave( hWnd, &OpenFileName, szFileTitle ) ) 
					{
						break;   // Cancel pressed
					}
					
					// If dictionary not created 
					if (Error == 1)
						continue;
					DestroyWindow( hWnd );
					return FALSE;
				}
				DestroyWindow( hWnd );
				return  FALSE;
			}
			*/
		case WM_CREATE:
			uiID_Error_Msg = RegisterWindowMessage( L"DECtalkErrorMessage" );
			uiMessage_Find_Replace = RegisterWindowMessage( L"commdlg_FindReplace" );

			// Start by initializing the command bar
			GetClientRect( hWnd, &lprc );
			hWndCB = CommandBar_Create(hInst, hWnd, 1); //mfgce
			CommandBar_AddBitmap(hWndCB, hInst, IDB_BUTTON, 3, 0, 0);
			CommandBar_InsertMenubar(hWndCB, hInst, IDM_MAIN_MENU, 0);
			// Adds buttons to command bar
			CommandBar_AddButtons(hWndCB, sizeof(tbVIEWButton) / sizeof(TBBUTTON), tbVIEWButton);
			//SendMessage(hWndCB,TB_ADDSTRING, (WPARAM)hInst, TST);
			//{ID_PLAY, {ID_PREV, {ID_NEXT,
			//CommandBar_InsertButton(hWndCB,
			CommandBar_AddAdornments(hWndCB, CMDBAR_HELP, 0);	// Adds close button by default
			hmenu = CommandBar_GetMenu(hWndCB, 0);
			
			hwndEdit = CreateWindow( L"EDIT",         // See RegisterClass() call.   
								     L"",             // Text for window title bar.   
									WS_VISIBLE | WS_VSCROLL | ES_AUTOVSCROLL | ES_MULTILINE,
									// Window Style.               
									10L, 				// border * 2,      Horizontal Position         
									21L,				// border * 2,      Vertical Position    
									lprc.right - 10L,				//  etWidth,           Width                      
									lprc.bottom - 21L,				// etHeight,          Heigth                    
									hWnd,				// Parent window                
									(HMENU)ID_EDITCTL,      // Use the window class menu 
									(HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ), // hInstance 
									NULL);
			SendMessage( hwndEdit, EM_LIMITTEXT, (WPARAM)0, (LPARAM)0 );
				// CB ADDED
				if( !hWnd )
				{
					error = GetLastError();
					return FALSE;
				}

			// CB ADDED
			//MoveWindow( hwndEdit, 0, 21, (LOWORD (lParam)-40L), HIWORD (lParam)-21L, TRUE); ///mfg
	

			// CB REMOVED
			/*
			hPlay = CreateWindow(L"BUTTON", L"Pronounce Word",
								 WS_CHILD |
								 WS_VISIBLE | BS_PUSHBUTTON,
								 border,				  // Horizontal Position
								 0L,					  // Vertical Position  
								 pWidth,	              // Width
								 pHeight,                 // Height
								 hWnd,                    // Parent window
								 (HMENU)ID_PLAY,          // Use the window class menu
								 (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ), // hInstance
								 NULL );
			
			hPrev = CreateWindow( L"BUTTON",              // See RegisterClass() call.
								   L"Previous",            // Text for window title bar. 
								   WS_CHILD |WS_VISIBLE | BS_PUSHBUTTON,   // Window style. 
								   border * 2 + pWidth,   // Default horizontal position. 
								   0L,                    // Default vertical position.  
								   pWidth,                // Default width. 
								   pHeight,               // Default height. 
								   hWnd,                  // Parent window  
								   (HMENU)ID_PREV,        // Child ID 
								   (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   // hInstance 
								   NULL);

			hNext = CreateWindow(L"BUTTON", L"Next", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
								 2 * pWidth + border * 2,   // Horizontal Position 
								 0L,                        // Vertical Position   
								 pWidth,                    // Width 
								 pHeight,                   // Height 
								 hWnd,                      // Parent Window 
			        			 (HMENU)ID_NEXT,            // Child ID 
								 (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   // hInstance 
								  NULL);
			*/
#if 0
			if ( RegOpenKeyEx( HKEY_LOCAL_MACHINE, szLicenseKey,
				 0, // CB NOT SUPPORTED KEY_QUERY_VALUE,
				 0, &hKeyLicense ) != ERROR_SUCCESS)
			{
				wsprintf(lang, L"US");
			}
			else 
			{
				cbData = 3;
				if ( RegQueryValueEx( hKeyLicense, L"DefaultLang", NULL, &dwType
					 , (LPBYTE)lang, &cbData ) != ERROR_SUCCESS) 
				{
					wsprintf(lang, L"US");
				}
				RegCloseKey( hKeyLicense );
			}
#endif // 0
		// CB REMOVED	
		//	hmenu = GetMenu(hWnd); 

#ifdef WINDIC_C_STATIC
#ifdef ENGLISH_US
			us_on = 1;
			EnableMenuItem(hmenu, ID_LANGUAGE_ENGLISH, MF_BYCOMMAND | MF_ENABLED);
			current_language = ID_LANGUAGE_ENGLISH;
#endif	//	ENGLISH_US
				
#ifdef ENGLISH_UK
			uk_on = 1;
			EnableMenuItem(hmenu, ID_LANGUAGE_BRITISH, MF_BYCOMMAND | MF_ENABLED);
			current_language = ID_LANGUAGE_BRITISH;
#endif	// ENGLISK_UK
			
#ifdef SPANISH
#ifdef LATIN_AMERICAN
			la_on = 1;
			EnableMenuItem(hmenu, ID_LANGUAGE_LATIN_AMERICAN, MF_BYCOMMAND | MF_ENABLED);
			current_language = ID_LANGUAGE_LATIN_AMERICAN;
#else	// LATIN_AMERICAN
			sp_on = 1;
			EnableMenuItem(hmenu, ID_LANGUAGE_SPANISH, MF_BYCOMMAND | MF_ENABLED);
			current_language = ID_LANGUAGE_SPANISH;
#endif	// LATIN_AMERICAN
#endif	// SPANISH
			
#ifdef GERMAN
			gr_on = 1;
			EnableMenuItem(hmenu, ID_LANGUAGE_GERMAN, MF_BYCOMMAND | MF_ENABLED);
			current_language = ID_LANGUAGE_GERMAN;
#endif	// GERMAN
			tts_cur = 0;

#else	// else for WINDIC_C_STATIC

			if( TextToSpeechEnumLangs(&languageINFO) == 0 )
			{
				MessageBox(NULL, L"Unable to allocate Memory", L"Error",MB_OK);
				return (-1);
			}

			if(languageINFO->MultiLang == FALSE) 
			{
				if (wcscmp(L"US",languageINFO->Entries[0].lang_code) == 0 )
				{
					current_language=ID_LANGUAGE_ENGLISH;
				}
				else if (wcscmp(L"UK",languageINFO->Entries[0].lang_code) == 0)
				{
					current_language=ID_LANGUAGE_BRITISH;
				}
				else if (wcscmp(L"SP",languageINFO->Entries[0].lang_code) == 0)
				{
					current_language=ID_LANGUAGE_SPANISH;
				}
				else if (wcscmp(L"LA",languageINFO->Entries[0].lang_code)==0)
				{
					current_language=ID_LANGUAGE_LATIN_AMERICAN;
				}
				else if (wcscmp(L"GR",languageINFO->Entries[0].lang_code)==0)
				{
					current_language=ID_LANGUAGE_GERMAN;
				}
				EnableMenuItem(hmenu,current_language,MF_BYCOMMAND | MF_ENABLED);
				tts_cur=0;
			}
			else
			{
				tts_us=TextToSpeechStartLang(L"US");
				if ((tts_us & TTS_LANG_ERROR)==0)
				{
					us_on=1;
					EnableMenuItem(hmenu, ID_LANGUAGE_ENGLISH, MF_BYCOMMAND | MF_ENABLED);
				}
				
				tts_uk=TextToSpeechStartLang(L"UK");
				if ((tts_uk & TTS_LANG_ERROR)==0)
				{
					uk_on=1;
					EnableMenuItem(hmenu, ID_LANGUAGE_BRITISH, MF_BYCOMMAND | MF_ENABLED);
				}
				
				tts_sp=TextToSpeechStartLang(L"SP");
				if ( (tts_sp & TTS_LANG_ERROR) == 0 )
				{
					sp_on=1;
					EnableMenuItem(hmenu, ID_LANGUAGE_SPANISH, MF_BYCOMMAND | MF_ENABLED);
				}
				
				tts_gr=TextToSpeechStartLang(L"GR");
				if ( (tts_gr & TTS_LANG_ERROR) == 0 )
				{
					gr_on = 1;
					EnableMenuItem(hmenu, ID_LANGUAGE_GERMAN, MF_BYCOMMAND | MF_ENABLED);
				}
				
				tts_la=TextToSpeechStartLang(L"LA");
				if ((tts_la & TTS_LANG_ERROR)==0)
				{
					la_on=1;
					EnableMenuItem(hmenu,ID_LANGUAGE_LATIN_AMERICAN,MF_BYCOMMAND | MF_ENABLED);
				}
				
				// CB ADDED typecast char
				current_lang_str[0]=(char)languageINFO->Entries[0].lang_code[0];
				// CB ADDED typecast char
				current_lang_str[1]=(char)languageINFO->Entries[0].lang_code[0];
				current_lang_str[2]='\0';
				
				if (wcscmp(L"US",languageINFO->Entries[0].lang_code)==0)
				{
					tts_cur=tts_us;
					current_language=ID_LANGUAGE_ENGLISH;
				}
				else if (wcscmp(L"UK",languageINFO->Entries[0].lang_code)==0)
				{
					tts_cur=tts_uk;
					current_language=ID_LANGUAGE_BRITISH;
				}
				else if (wcscmp(L"SP",languageINFO->Entries[0].lang_code)==0)
				{
					tts_cur=tts_sp;
					current_language=ID_LANGUAGE_SPANISH;
				}
				else if (wcscmp(L"LA",languageINFO->Entries[0].lang_code)==0)
				{
					tts_cur=tts_la;
					current_language=ID_LANGUAGE_LATIN_AMERICAN;
				}
				else if (wcscmp(L"GR",languageINFO->Entries[0].lang_code)==0)
				{
					tts_cur=tts_gr;
					current_language=ID_LANGUAGE_GERMAN;
				}
				
				TextToSpeechSelectLang(NULL,tts_cur);
			}
#endif	// WINDIC_C_STATIC
				
			mmStatus = TextToSpeechStartupEx(&phTTS[tts_cur], WAVE_MAPPER, REPORT_OPEN_ERROR
				                           , TTSCallbackRoutine, 1);
			// CB ADDED to display check mark.
			//hmenu = CommandBar_GetMenu(hWndCB, 0);
			CheckMenuItem(hmenu, current_language, MF_BYCOMMAND | MF_CHECKED);
			
			menu_info.cbSize = sizeof(menu_info);
			menu_info.fMask = MIIM_STATE;
			menu_info.fState = MFS_CHECKED;
			SetMenuItemInfo(hmenu, current_language, FALSE,&menu_info);
			if (mmStatus == MMSYSERR_NODRIVER)
			{
				MessageBox( hWnd, L"No wave device present \n You can continue but windic won't speak",
				            L"Warning", MB_OK );

				mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], 0, DO_NOT_USE_AUDIO_DEVICE
					                           , TTSCallbackRoutine, 1);

				if ( mmStatus == MMSYSERR_ERROR)
				{
					MessageBox( hWnd, L"Can't find DECtalk Dictionary \n dectalk.dic, Shutting down!"
							    , L"windic ERROR", MB_OK );
					DestroyWindow( hWnd );
					// CB REMOVED
					// return FALSE;
					return (-1);
				}
			
				if (mmStatus)
				{
					wsprintf(szError, L"Error Starting up TTS\n Error = %ld", mmStatus );
					MessageBox( hWnd, szError, L"ERROR", MB_OK | MB_ICONSTOP );
					DestroyWindow( hWnd );
					// CB ADDED
					return (-1);
				}
				
				// ncs 06oct97 - error out of application if TextToSpeechStartUp Fails
				if (mmStatus)
				{
					MessageBox( hWnd,
				      L"There is an ERROR in Initializing the Text To Speech System.\n\nExiting Application."
					  , L"Windic cannot be started.", MB_OK | MB_ICONSTOP  );
					return( -1 );
				}
			}
			
			TextToSpeechUnloadUserDictionary( phTTS[tts_cur] );
			// CB
			TextToSpeechSpeak( phTTS[tts_cur], L"[:phoneme arpa on]", TTS_FORCE );
			// CB REMOVED
			// break;
			return FALSE;

		case WM_SETFOCUS:
			SetFocus( hwndEdit );
			return FALSE;
		
		case WM_SIZE:
			//Reposition all child windows when moved or resized
			MoveWindow( hwndEdit, 10, 21, LOWORD (lParam) - 10L, HIWORD (lParam)-21L, TRUE);
			// CB REMOVED
			/*
			MoveWindow( hPlay, border, 0, pWidth, pHeight, TRUE);
			MoveWindow( hPrev, 2 * border + pWidth, 0, pWidth, pHeight, TRUE);
			MoveWindow( hNext, 3 * border + pWidth + pWidth, 0, pWidth, pHeight, TRUE);
			*/
			return FALSE;
		
		// CB NOT SUPPORTED	
		/*case WM_DROPFILES:
			// If edit control has been modified ask to save file .
			if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ) )
				// returns FALSE is yes or no TRUE if CANCEL
				if( AskToSave( hWnd, &OpenFileName, szFileTitle ) ) 
					break;              // Cancel pressed
				// Yes or No pressed
			DragQueryFile( (HANDLE) wParam, 0, szFile, sizeof( szFile ) );
			if( TextToSpeechReset( phTTS[tts_cur], TRUE ))
				MessageBox( hWnd, L"Error in TTS Reset", L"ERROR", MB_OK | MB_ICONSTOP );

			if( MyReadFile( hWnd, szFile ))
			{
				DrawMenuBar( hWnd);

				// reset the title in the title bar to reflect the
				// new open file
				SendMessage( hWnd, WM_SETTEXT, 0, (LPARAM)szFile );
				InvalidateRect( hwndEdit, NULL, TRUE );
				DrawMenuBar( hWnd );
				DragFinish( (HANDLE)wParam );
				SpeakText( hWnd );
				return ( FALSE );
			}
			break;
		*/
		case WM_COMMAND:
			menuCommand(hWnd, wParam, lParam, szFileTitle, &OpenFileName );
			break;
		
		// CB ADDED
		// Handling the help push button
		case WM_HELP:
			
			/*hwndHelp = CreateWindow( L"HELP",         // See RegisterClass() call.   
								     L"Windic Help",             // Text for window title bar.   
								    WS_POPUP | WS_VISIBLE | WS_CHILD,
									// Window Style.               
									CW_USEDEFAULT, 				// border * 2,      Horizontal Position         
									CW_USEDEFAULT,				// border * 2,      Vertical Position    
									CW_USEDEFAULT,	//  etWidth,           Width                      
									CW_USEDEFAULT,				// etHeight,          Heigth                    
									hWnd,				// Parent window                
									(HMENU)ID_HELPCTL,      // Use the window class menu 
									hInst,//(HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ), // hInstance 
									NULL);
			*/
			break;
		case WM_INITMENUPOPUP: /*Enable Paste menu item if clipboard data available*/
			// CB ADDED typecast hmenu
			HandleMenuPopup((HMENU)wParam);
			return FALSE;
		
		// CB NOT SUPPORTED
		/*
		case WM_GETMINMAXINFO:   //Limit minimum size of window
			lpmmiSize = (LPMINMAXINFO) lParam;
			lpmmiSize->ptMinTrackSize.x = (LONG)etWidth + border * 4 + 4;
			lpmmiSize->ptMinTrackSize.y = 300L;
			return FALSE;
		*/

		case WM_ERASEBKGND:
			// CB ADDED typecast HBRUSH
			hBrush = (HBRUSH)GetStockObject( LTGRAY_BRUSH );
			hOldBrush = (HBRUSH)SelectObject( (HDC)wParam, hBrush );
			GetClientRect( hWnd, &lprc );
			FillRect( (HDC)wParam, &lprc, hBrush );
			break;
       case WM_CTLCOLORSTATIC:			
			// CB ADDED typecast HBRUSH
			hBrush = (HBRUSH)GetStockObject( LTGRAY_BRUSH );
			SetBkColor( (HDC) wParam, RGB ((BYTE)192, (BYTE)192, (BYTE)192));
			return( (LRESULT) hBrush );

		/* This section implements Right Mouse Button click functionality.
		*  This action will cause reading selected text in the Edit
		*  Control
		*  Parent notify message is used to check for the right mouse button being activated.
		*  The selected text is then spoken.
		*/
		// CB NOT SUPPORTED
		/*
		case WM_PARENTNOTIFY:
			if(LOWORD( wParam ) == WM_RBUTTONDOWN)
			{
			    lSelect = SendMessage( hwndEdit, EM_GETSEL, (WPARAM)&dwStart, (LPARAM)&dwEnd );
				if( HIWORD( lSelect ) == LOWORD( lSelect ))
				{
					if( TextToSpeechSpeak( phTTS[tts_cur], L"Nothing was selected.", TTS_FORCE ))
					{
						MessageBox( hWnd, L"Error in TTS Speak", L"ERROR", MB_OK | MB_ICONSTOP );
					}
					break;
				}
				else
				{
					//
					// Figure out how much text we should speak
					//
					dwTextLen = SendMessage(hwndEdit, WM_GETTEXTLENGTH, 0, 0);
					lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof(char));
					SendMessage(hwndEdit, WM_GETTEXT, (WPARAM) dwTextLen+1, (LPARAM) lpEditText);
					lpSelBuf = (char *)malloc((1 + dwEnd - dwStart)  * sizeof(char));

					//
					// Copy the text from the screen into a buffer and then speak it.
					//
					strncpy((char*)lpSelBuf,(char*)&lpEditText[dwStart],(1 + dwEnd - dwStart));
					lpSelBuf[dwEnd - dwStart] = '\0';

					if( TextToSpeechSpeak( phTTS[tts_cur], lpSelBuf, TTS_FORCE ))
					{
						MessageBox( hWnd, L"Error in TTS Speak", L"ERROR", MB_OK | MB_ICONSTOP );
					}
					free( lpSelBuf );
					free( lpEditText );
				}
			}
			break;
		*/
		default:
			if( Message ==  uiID_Error_Msg )
			{
				switch (wParam)
				{
					case ERROR_IN_AUDIO_WRITE:
						MessageBox(hWnd, L"Error in Writing Audio", L"Async Error",MB_OK | MB_ICONSTOP);
						break;

					case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
						MessageBox(hWnd,
L"The wave device is in use by another application \n DECtalk will wait until the device is free.",
							       L"Warning",MB_OK | MB_ICONSTOP);
						break;
					case ERROR_GETTING_DEVICE_CAPABILITIES:
						MessageBox(hWnd, L"Error Getting Audio Device Caps",
							       L"Async Error",MB_OK | MB_ICONSTOP);
						break;
					case ERROR_READING_DICTIONARY:
						MessageBox(hWnd, L"Error Reading Dictionary File \n dectalk.dic",
							       L"Async Error",MB_OK | MB_ICONSTOP);
						break;

					case ERROR_WRITING_FILE:
						MessageBox(hWnd, L"Error Writing File", L"Async Error",MB_OK | MB_ICONSTOP);
						break;
					case ERROR_ALLOCATING_INDEX_MARK_MEMORY:
						MessageBox(hWnd, L"Error allocating Index Mark Memory", 
							       L"Async Error",MB_OK | MB_ICONSTOP);
						break;
				}
			}
			// CB ADDED {} to else
			else
				// Process "Find-Replace" Messages
				if( Message == uiMessage_Find_Replace )
				{
					lpfrText = ( LPFINDREPLACE )lParam;

					if( lpfrText->Flags & FR_DIALOGTERM )
						hFind = NULL;

					dwOffset = HIWORD( SendMessage( hwndEdit, EM_GETSEL, 0, 0L ));

					if( lpfrText->Flags & FR_FINDNEXT )
						// CB ADDED typecast DWORD
						if( !FindSearchString( hwndEdit, (DWORD *)&dwOffset, lpfrText ))
						{
							wsprintf( szError, L"Search string \"%s\" was not found.", lpfrText->lpstrFindWhat );
							MessageBox( hWnd, szError, L"Find", MB_OK | MB_ICONEXCLAMATION );
							lpfrText->Flags = lpfrText->Flags & !FR_FINDNEXT;
						}
					return 0;
				}
			return ( DefWindowProc( hWnd, Message, wParam, lParam ));
		}
		return 0L;
}

/****************************************************************************
*
*    FUNCTION: findHdib ( INT )
*
*    PURPOSE:  find the handle of a dib
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/

LPVOID findHdib(INT id)
{

    HRSRC hDibRes, hDibResInfo;

    // find our DIB in the resource
    hDibResInfo = FindResource(NULL, MAKEINTRESOURCE(id), L"DIB");
    if( hDibResInfo == NULL )
	return (LPVOID)ErrMsg("Line %d Error = %d\nFindResource",__LINE__-2,GetLastError());

    // get a handle to the DIB
    // CB ADDED typecast HRSRC
	hDibRes = (HRSRC)LoadResource(NULL, hDibResInfo);
    if( hDibRes == NULL )
	return (LPVOID)ErrMsg("Line %d Error = %d\nLoadResource",__LINE__,GetLastError());

    return( LockResource( hDibRes ));

}

/****************************************************************************
*
*    FUNCTION:  menuCommand( HWND, WPARAM, LPARAM, TCHAR *, LPOPENFILENAME )
*
*    PURPOSE:   handle all the pulldown menu commands.
*
*    COMMENTS:
*
*    RETURN VALUES:	Bool
*
****************************************************************************/

BOOL menuCommand( HWND hWnd, WPARAM wParam, LPARAM lParam, TCHAR szFileTitle[]
				  , LPOPENFILENAME OpenFileName )
{
	// CB NOT USED
	// static  char szTextWindow[8192];
	static  char * szCurrentSpeaker = " [:nh]";     /* Default speaker is Harry */
	// CB CHAR
	TCHAR szError[132];
    // CB ADDED typecast LPTSTR
	LPCTSTR lpszHelpFile = (LPTSTR)DTALK_HELP_FILE_NAME; 
	LPCTSTR lpszHelpTopic = L"Dictionary calls, Windows";
	LPCTSTR lpszLog = L"log.txt" ;
	// CB ADDED = 0 
	DWORD dwTextLen = 0;		// The length of characters in the text editor		
	// CB CHANGED LPSTR TO char *
	char *lpEditText, *lpXBuf;
	// CB ADDED = 0
	DWORD dwStart = 0, dwEnd = 0, dwFileLen = 0, charlength = 0;
	DWORD  dwNumRead;
	LONG lSelect;
	RECT lprc;
	//FILE    * lpLogFile;
	MMRESULT mmStatus ;
	//LPOFSTRUCT lpOFSlog;
	// CB ADDED '\0'
	HANDLE   hLog;
	HMENU hmenu = '\0';
	MENUITEMINFO menu_info;
	// CB ADDED LINES
	char *pMBString = '\0';
	BOOL ifRead;
	int i;
	int response = 0;
	

	// CB ADDED intialized  struct lprc
	lprc.left = 0;
	lprc.right = 0;
	lprc.top = 0;
	lprc.bottom = 0;

    switch( LOWORD( wParam ))
    {
		case IDM_HELP:
			// CB 
			// WinHelp( hWnd, lpszHelpFile, HELP_PARTIALKEY, (DWORD)lpszHelpTopic );
			break;
		case IDM_ABOUT:
			DialogBox( hInst, MAKEINTRESOURCE(DLG_ABOUT), hWnd, (DLGPROC)AboutDlgProc );
			break;
		case IDM_FILE_OPEN:
			// If edit control has been modified ask to save file .
			// CB ADDED {} both if
			if( SendMessage(hwndEdit, EM_GETMODIFY, 0L, 0L ) )
			{
				if( AskToSave( hWnd, OpenFileName, szFileTitle ) ) // returns FALSE if yes or no TRUE if CANCEL
				{
					break;                   // Cancel pressed
				}
											// Yes or No pressed
			}
			wcscpy( szFileSave, szFile );
			wcscpy( szFileTitleSave, szFileTitle );

			if( MyOpenFile( OpenFileName, hWnd, szFileSave, szFileTitleSave )  )
			{
				DrawMenuBar(hWnd);
				wcscpy( szFile, szFileSave );
				wcscpy( szFileTitle, szFileTitleSave );

				// reset the title in the title bar to reflect the
				// new open file
				wcscpy(szAppAndFile, szAppName);
				wcscat(szAppAndFile, L" - ");
				wcscat(szAppAndFile, szFile);
				SendMessage( hWnd, WM_SETTEXT, 0, (LPARAM)szAppAndFile );
				// CB ADDED LINES
				SendMessage(hwndEdit, WM_SETTEXT, 0, (LPARAM)FileBuf);
				InvalidateRect( hWnd, NULL, TRUE );
				bDictionarySaved = FALSE;
			}
			break;
		case IDM_FILE_CLOSE:	// tek 23 jul 96
				// If edit control has been modified ask to save file .
			if (SendMessage(hwndEdit, EM_GETMODIFY,0L,0L))
			{
				if (AskToSave(hWnd, OpenFileName, szFileTitle ))        // returns FALSE is yes or no TRUE if CANCEL
				{
					break ;                   // Cancel pressed
				}
											// Yes or No pressed
			 }	
			// CB ADDED
			DrawMenuBar( hWnd);
			OpenFileName->lpstrFile = NULL;
			wcscpy( szFile, TEXT("untitled.txt"));
			SendMessage(hwndEdit,WM_SETTEXT ,0,(LPARAM)((LPCTSTR)FileBuf));
			

			SetWindowText( hWnd, szAppName) ;
			SendMessage(hwndEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
			SendMessage(hwndEdit,WM_CUT,0,0L);
			SendMessage(hwndEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
			
			// CB ADDED 
			InvalidateRect( hWnd, NULL, TRUE );

			return FALSE;


		case IDM_SAVE:
			GetWindowText( hWnd, szError, 30);
			if( wcscmp( szError,  L"windic\0") == 0)
			    if( SaveFileAs( OpenFileName, hWnd, szFileTitle ))
				{
					SetWindowText( hWnd, OpenFileName->lpstrFile );	
					// CB REMOVED
					DrawMenuBar( hWnd );
					// CB ADDED
					SendMessage(hwndEdit, EM_SETMODIFY, FALSE, 0);
				}
			    else
				{
					return FALSE;
				}
			else
			{
				MySaveFile( hWnd, szFileTitle );
				SendMessage(hwndEdit, EM_SETMODIFY, FALSE, 0);
			}
			
			return FALSE;
		case IDM_SAVEAS:
			if( SaveFileAs ( OpenFileName, hWnd, szFileTitle ))
			{
				SendMessage(hwndEdit, EM_SETMODIFY, FALSE, 0);
				SetWindowText( hWnd, OpenFileName->lpstrFile );
				// Repaints commandbar
				//DrawMenuBar( hWnd );
			}
			return FALSE;
		case  IDM_COMPILE_DICTIONARY:
			// Set the compiledictionary boolean to true so that
			// the save function doesn't try to compile the dictionary.
			bDictionarySaved = TRUE;

			/*   SendMessage( hWnd, WM_COMMAND, IDM_SAVE, 0L ); */
			GetWindowText( hWnd, szError, 30) ;
			// CB strcmp() & ADDED {} to if and both else
			if( wcscmp( szError,  L"windic\0") == 0)
			{
			    if( SaveFileAs( OpenFileName, hWnd, szFileTitle ))
				{
					SendMessage(hwndEdit, EM_SETMODIFY, FALSE, 0);
					SetWindowText( hWnd, OpenFileName->lpstrFile );
					
					// CB REMOVED
					DrawMenuBar( hWnd );
			    }
				else
				{
					return FALSE;
				}
			}
			else
			{
				SendMessage(hwndEdit, EM_SETMODIFY, FALSE, 0);
				MySaveFile( hWnd, szFileTitle );
			}

			// Reset the compiledictionary boolean to false, so
			// that we can save the user dictionary file.
			bDictionarySaved = FALSE;

			// Now compile the dictionary.
			CompileUserDic( hWnd, hwndEdit );
			break;

		case  IDM_EXIT:
			// If edit control has been modified ask to save file .
			if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
			{
				if( AskToSave( hWnd, OpenFileName, szFileTitle )) // returns FALSE is yes or no TRUE if CANCEL
				{
					break;                   // Cancel pressed
				}
				DestroyWindow( hWnd );
				break;
			}
			if( !bDictionarySaved && GetWindowTextLength( hwndEdit ) != 0 )
			{
				if( AskToCompile( hWnd, hwndEdit )) // returns FALSE is yes or no TRUE
				{
					break;                  // cancel pressed
				}
				DestroyWindow( hWnd );
				break;
			}                                
			DestroyWindow( hWnd );
			/*
			// Loop to check if both .tab &.dic file saved.
			while (1)
			{
				//if ( (!bDictionarySaved && GetWindowTextLength( hwndEdit ) != 0) || Error)
				// Checks if file has been modified
				if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
				{
					SaveFileAs( OpenFileName, hWnd, szFileTitle );
					
					// If dictionary not created 
					if (Error == 1)
					{
						continue;
					}
					else
					{
						DestroyWindow( hWnd );
						break;
					}
				}
				else
				{
					if (Error == 1)
					{
						response = MessageBox(hWnd, L"Do you want to fix error in file,\n"
							                  L"so that dictionary file can be saved?",
						                      L"Error", MB_YESNOCANCEL | MB_ICONEXCLAMATION );
					}
					else
					{
						DestroyWindow( hWnd );
						break;
					}
					
					switch( response )
					{
						case IDYES:
							MessageBox(hWnd, L"Click on menu File and then on submenu \n"
									   L"Compile Dictionary to see error.\n",
									   L"ERROR", MB_OK);
							return FALSE;
						case IDCANCEL:
							return FALSE;
						case IDNO:	
							DestroyWindow( hWnd );
							break;
					}
				}
			}
		*/
			break;
		case ID_EDIT_CUT:
			SendMessage( hwndEdit, WM_CUT, 0, 0L );
			break;
		case ID_EDIT_COPY:
			SendMessage( hwndEdit, WM_COPY, 0, 0L );
			break;
		case ID_EDIT_PASTE:
			SendMessage( hwndEdit, WM_PASTE, 0, 0L );
			break;
		case ID_EDIT_CLEAR:
			SendMessage( hwndEdit, WM_CLEAR, 0, 0L );
			break;
		case ID_EDIT_SELECT_ALL:
			SendMessage( hwndEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
			SetFocus( hwndEdit );
			break;
		case ID_EDIT_UNDO:
			SendMessage( hwndEdit, EM_UNDO, 0L, 0L );
			break;
		
		// CB REMOVED
		/*
		case ID_FIND:
			lSelect = SendMessage( hwndEdit, EM_GETSEL, (WPARAM)&dwStart, (LPARAM)&dwEnd );
			if( HIWORD( lSelect ) != LOWORD( lSelect ))
			{
				dwTextLen = SendMessage( hwndEdit, WM_GETTEXTLENGTH, 0, 0);
				// CB
				lpEditText = (char *)malloc((1+dwTextLen) * sizeof( char ));
				SendMessage(hwndEdit, WM_GETTEXT, (WPARAM) dwTextLen+1, (LPARAM)lpEditText);
				strncpy(szFindText, (char *)&lpEditText[dwStart], dwEnd - dwStart );
				szFindText[dwEnd - dwStart] = '\0';
				free( lpEditText );
			}
			hFind = FindDialog( hWnd );
			GetClientRect( hFind, &lprc );
			MoveWindow( hFind, 200, 0, lprc.right + 10, lprc.bottom + 20, TRUE );
			break;
		*/
		case ID_PREV:
			SpeakLine( hWnd, -1 );
			break;
		case ID_NEXT:
			SpeakLine( hWnd, +1 );
			break;
		case ID_PLAY:
			//   SendMessage(hwndEdit, WM_GETTEXT, sizeof(szTextWindow), (LPARAM)szTextWindow);
			lSelect = SendMessage( hwndEdit, EM_GETSEL, (WPARAM)&dwStart, (LPARAM)&dwEnd );
			// Nothing was highlighted
			if( HIWORD (lSelect) == LOWORD (lSelect))
			{
				SpeakLine( hWnd, 0 );
			}
			else
			{
				// Gets length of characters in edit window without including terminating null 
				dwTextLen = GetWindowTextLength(hwndEdit);
				// Copies edit window text & you must include terminating NULL
				GetWindowText(hwndEdit, FileBuf, dwTextLen + 1);
				
				// Copy only highlighted data
				for(int i = 0; i < (int)(dwEnd - dwStart); i++)
					FileBuf[i] = FileBuf[dwStart + i];
				// Terminating NULL
				FileBuf[dwEnd-dwStart] = L'\0';
				
				// CB ADDED typecast LPTSTR
				SpeakPronouncation( hWnd, FileBuf );
			}
			SetFocus( hwndEdit );
			break;
		case ID_XLATE:
			lSelect = SendMessage( hwndEdit, EM_GETSEL, (WPARAM)&dwStart, (LPARAM)&dwEnd );
			if( HIWORD (lSelect) == LOWORD (lSelect))
			{
				switch(current_language)
				{
					case ID_LANGUAGE_ENGLISH:	
					case ID_LANGUAGE_BRITISH:   
					{	
						TextToSpeechSpeak(phTTS[tts_cur], L"Nothing is highlighted", TTS_FORCE);
						break;
					}
					case ID_LANGUAGE_SPANISH:
					case ID_LANGUAGE_LATIN_AMERICAN:
					{
							TextToSpeechSpeak(phTTS[tts_cur], L"Nada esta marcado", TTS_FORCE);
							break;
					}
					case ID_LANGUAGE_GERMAN:
					{
						TextToSpeechSpeak(phTTS[tts_cur], L"Nichts markiert", TTS_FORCE);
						break;
					}
					default:
						break;
				}

			}
			else
			{
				// GL 03/24/1997 for BATS#305 and 311 make sure the string is terminated properly 
				
				// Gets length of characters in edit window without including terminating null 
				dwTextLen = GetWindowTextLength(hwndEdit);
				// Copies edit window text & you must include terminating NULL
				GetWindowText(hwndEdit, FileBuf, dwTextLen + 1);

				// Allocates memory
				lpEditText  = (char *)LocalAlloc( LMEM_ZEROINIT, (dwEnd - dwStart + 1) * sizeof(char) );
			
				// Checks if memory allocated
				if (lpEditText == NULL)
				{	
					MessageBox( hWnd, L"Unable to allocate enough memory.",
						        L"Error", MB_OK | MB_ICONSTOP );
					break;
				}

				//	Converts string from wide char to char
				wcstombs(lpEditText, &FileBuf[dwStart], (dwEnd - dwStart) * sizeof(char));
				// Terminating NUll
				lpEditText[dwEnd - dwStart] = '\0';

				//lpXBuf = (char *)malloc((1 + dwEnd - dwStart + 40) * sizeof(char));
				
				// Allocates memory
				lpXBuf = (char *)LocalAlloc(LMEM_ZEROINIT, 1024);

				// Checks if memory allocated
				if ( lpXBuf == NULL )
				{	
					MessageBox( hWnd, L"Unable to allocate enough memory.",
						L"Error", MB_OK | MB_ICONSTOP );
					break;
				}
				
				// Terminate start of string with NULL
				lpXBuf[0] = '\0';

				strcat(lpXBuf, "[:log phoneme on]");
				strcat(lpXBuf, lpEditText);
				strcat(lpXBuf, "[:sync][:log phoneme off]");
				i = strlen(lpXBuf);
				
				// Converts multibyte to wchar type to format data as unicode
				// Terminating NULL is added because lpXbuf has it
				mbstowcs(FileBuf, lpXBuf, i);
				
				// CB CHANGED (LPTSTR)lpXBuf to FileBuf
				mmStatus = TextToSpeechSpeak( phTTS[tts_cur], FileBuf, TTS_FORCE );
				if( mmStatus )
				{
					wsprintf( szError, L"Error1 in TTS Speak = %d", mmStatus );
					MessageBox( hWnd, szError, L"TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
				}
				
				mmStatus = TextToSpeechSync(phTTS[tts_cur]);
				if( mmStatus )
				{
					wsprintf( szError, L"Error2 in TTS Speak = %d", mmStatus );
					MessageBox( hWnd, szError, L"TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
				}
				
				hLog = CreateFile(lpszLog, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING,
							  FILE_ATTRIBUTE_NORMAL, NULL );
				
				// Checks if file was created
				if( hLog == INVALID_HANDLE_VALUE )
				{
					MessageBox( hWnd, L"File open failed.", L"ERROR", MB_OK );
					break;
				}
				
				dwFileLen = GetFileSize(hLog, NULL);
				
				// Checks if file is too large
				if(dwFileLen > (DWORD)FILESIZE)
				{
					MessageBox( hWnd, L"File size too big!", NULL, MB_OK );
					break;
				}
				
				// Resets varibales
				memset(lpXBuf, 0, sizeof(lpXBuf));
				memset(lpEditText, 0, sizeof(lpEditText));
				
				charlength = dwFileLen * sizeof(char);
				// Read characters from file log.txt
				ifRead = ReadFile( hLog, lpXBuf, charlength, &dwNumRead, NULL);

				// CB ADDED LINES
				// Checks if data is read from file
				if ( !ifRead )
				{
					MessageBox( hWnd, L"Zero bytes read.", NULL, MB_OK );
					CloseHandle( hFile );
					break ;
				}	
	
				// We need to place the null character four places from the end of
				// the lpXBuf array.  Four characters are forced in when the text
				// typed in from the window is converted to phonemic codes.
				// It seems that the pipe flush forces are getting appended during
				// the text conversion.
				// 2/18/97 ncs
				// GL 03/24/1997 for BATS#305 and 311,  make sure the string is terminated properly 
				// lpXBuf[dwNumRead-4]='\0';
				for (i = dwNumRead - 5; i > 0; --i)
				{
					if (lpXBuf[i] != ' ')
					{ 
						lpXBuf[i + 1] = '\0';
						break;
					}
				}
				// Adds terminating NULL && changed lpReplBuf to lpEditText
				strcpy (lpEditText, "[");
				// Adds terminating NULL
				strcat(lpEditText + 1, lpXBuf );
				strcat(lpEditText, "]"); 
				i = strlen(lpEditText);
				// Terminating NULL
				lpEditText[i] = '\0';
				// Converts multibyte to wchar type to display correctly & Terminating NULL
				mbstowcs(FileBuf, lpEditText, i + 1);
				// CB CHANGED (WPARAM)0 to TRUE  & CHANGED lpReplBuf to FileBuf
				SendMessage( hwndEdit, EM_REPLACESEL, TRUE, LPARAM(FileBuf) );
				
				// Clean up memory
				CloseHandle(hLog);
				DeleteFile(lpszLog);
				
				LocalFree(lpXBuf);				
				LocalFree(lpEditText);
				
				// Resets varibale
				memset(FileBuf, 0, sizeof(FileBuf));
			}	
			SetFocus( hwndEdit );
			break;
			
#ifndef WINDIC_C_STATIC
		case ID_LANGUAGE_ENGLISH:
			if (current_language==ID_LANGUAGE_ENGLISH)
			{
				break;
			}
			// CB 
			// hmenu = GetMenu(hWnd);

			// CB ADDED to display check mark.
			hmenu = CommandBar_GetMenu(hWndCB, 0);
			// Uncheck previous
			CheckMenuItem(hmenu, current_language, MF_UNCHECKED);
			current_language = ID_LANGUAGE_ENGLISH;
			// Check current
			//EnableMenuItem(hmenu, ID_LANGUAGE_ENGLISH, MF_BYCOMMAND | MF_ENABLED);
			CheckMenuItem(hmenu, current_language, MF_CHECKED);

			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_UNCHECKED;
			SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);

			// If edit control has been modified ask to save file .
			if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
			{
				AskToSave( hWnd, OpenFileName, szFileTitle); // returns FALSE is yes or no TRUE if CANCEL
			}
			else
			{
				if( !bDictionarySaved && GetWindowTextLength( hwndEdit ) != 0 )
				{
					AskToCompile( hWnd, hwndEdit ); // returns FALSE is yes or no TRUE
				}
			}
			SetWindowText( hWnd, szAppName) ;
			SendMessage(hwndEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
			SendMessage(hwndEdit,WM_CUT,0,0L);
			SendMessage(hwndEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
			TextToSpeechShutdown(phTTS[tts_cur]);
			phTTS[tts_cur]=NULL;
			tts_cur=tts_us;
			current_lang_str[0]='U';
			current_lang_str[1]='S';
			current_lang_str[2]='\0';
			//current_language=ID_LANGUAGE_ENGLISH;
			TextToSpeechSelectLang(NULL,tts_cur);
			mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 1);
		
			if (mmStatus == MMSYSERR_NODRIVER)
			{
				TextToSpeechSelectLang(NULL,tts_cur);
				mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], 0, DO_NOT_USE_AUDIO_DEVICE, TTSCallbackRoutine, 1);
			
				if ( mmStatus == MMSYSERR_ERROR)
				{
					return FALSE;
				}
				
				if (mmStatus)
				{
					DestroyWindow( hWnd );
				}
			
				// ncs 06oct97 - error out of application if TextToSpeechStartUp Fails
				if (mmStatus)
				{
					return( -1 );
				}
			}
			TextToSpeechUnloadUserDictionary( phTTS[tts_cur] );
			TextToSpeechSpeak( phTTS[tts_cur], L"[:phoneme arpa on]", TTS_FORCE );
			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_CHECKED;
			SetMenuItemInfo(hmenu,ID_LANGUAGE_ENGLISH,FALSE,&menu_info);
			break;
		
		case ID_LANGUAGE_SPANISH:
			if (current_language==ID_LANGUAGE_SPANISH)
			{
				break;
			}
			// CB hmenu=GetMenu(hWnd);
			
			// CB ADDED to display check mark.
			hmenu = CommandBar_GetMenu(hWndCB, 0);
			// Uncheck previous
			CheckMenuItem(hmenu, current_language, MF_UNCHECKED);
			current_language = ID_LANGUAGE_SPANISH;
			// Check current
			CheckMenuItem(hmenu, current_language, MF_CHECKED);

			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_UNCHECKED;
			SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
			// If edit control has been modified ask to save file .
			if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
			{
				AskToSave( hWnd, OpenFileName, szFileTitle ); // returns FALSE is yes or no TRUE if CANCEL
			}
			else
			{
				if( !bDictionarySaved && GetWindowTextLength( hwndEdit ) != 0 )
				{
					AskToCompile( hWnd, hwndEdit ); // returns FALSE is yes or no TRUE
				}
			}
			SetWindowText( hWnd, szAppName) ;
			SendMessage(hwndEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
			SendMessage(hwndEdit,WM_CUT,0,0L);
			SendMessage(hwndEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
			TextToSpeechShutdown(phTTS[tts_cur]);
			phTTS[tts_cur]=NULL;
			tts_cur=tts_sp;
			current_lang_str[0]='S';
			current_lang_str[1]='P';
			current_lang_str[2]='\0';
			//current_language=ID_LANGUAGE_SPANISH;
			TextToSpeechSelectLang(NULL,tts_cur);
			mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 1);
		
			if (mmStatus == MMSYSERR_NODRIVER)
			{
				TextToSpeechSelectLang(NULL,tts_cur);
				mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], 0, DO_NOT_USE_AUDIO_DEVICE, TTSCallbackRoutine, 1);
			
				if ( mmStatus == MMSYSERR_ERROR)				
				{
					return FALSE;
				}
			
				if (mmStatus)
				{
					DestroyWindow( hWnd );
				}
			
				// ncs 06oct97 - error out of application if TextToSpeechStartUp Fails
				if (mmStatus)
				{
					return( -1 );
				}
			}
			TextToSpeechUnloadUserDictionary( phTTS[tts_cur] );
			// CB
			TextToSpeechSpeak( phTTS[tts_cur], L"[:phoneme arpa on]", TTS_FORCE );
			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_CHECKED;
			SetMenuItemInfo(hmenu,ID_LANGUAGE_SPANISH,FALSE,&menu_info);
			break;
		case ID_LANGUAGE_GERMAN:
			if (current_language==ID_LANGUAGE_GERMAN)
			{
				break;
			}
			// CB hmenu=GetMenu(hWnd);

			// CB ADDED to display check mark.
			hmenu = CommandBar_GetMenu(hWndCB, 0);
			// Uncheck previous
			CheckMenuItem(hmenu, current_language, MF_UNCHECKED);
			current_language = ID_LANGUAGE_GERMAN;
			// Check current
			CheckMenuItem(hmenu, current_language, MF_CHECKED);

			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_UNCHECKED;
			SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
			// If edit control has been modified ask to save file .
			if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
			{
				AskToSave( hWnd, OpenFileName, szFileTitle ); // returns FALSE is yes or no TRUE if CANCEL
			}
			else
			{
				if( !bDictionarySaved && GetWindowTextLength( hwndEdit ) != 0 )
				{
					AskToCompile( hWnd, hwndEdit );// returns FALSE is yes or no TRUE
				}
			}
			SetWindowText( hWnd, szAppName) ;
			SendMessage(hwndEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
			SendMessage(hwndEdit,WM_CUT,0,0L);
			SendMessage(hwndEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
			TextToSpeechShutdown(phTTS[tts_cur]);
			phTTS[tts_cur]=NULL;
			tts_cur=tts_gr;
			current_lang_str[0]='G';
			current_lang_str[1]='R';
			current_lang_str[2]='\0';
			//current_language=ID_LANGUAGE_GERMAN;
			TextToSpeechSelectLang(NULL,tts_cur);
			mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 1);
			
			if (mmStatus == MMSYSERR_NODRIVER)
			{
				TextToSpeechSelectLang(NULL,tts_cur);
				mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], 0, DO_NOT_USE_AUDIO_DEVICE, TTSCallbackRoutine, 1);
				
				if ( mmStatus == MMSYSERR_ERROR)
				{
					return FALSE;
				}
			
				if (mmStatus)
				{	
					DestroyWindow( hWnd );
				}
			
				// ncs 06oct97 - error out of application if TextToSpeechStartUp Fails
				if (mmStatus)
				{
					return( -1 );
				}
			}
			TextToSpeechUnloadUserDictionary( phTTS[tts_cur] );
			TextToSpeechSpeak( phTTS[tts_cur], L"[:phoneme arpa on]", TTS_FORCE );
			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_CHECKED;
			SetMenuItemInfo(hmenu,ID_LANGUAGE_GERMAN,FALSE,&menu_info);
			break;
		case ID_LANGUAGE_LATIN_AMERICAN:
			if (current_language==ID_LANGUAGE_LATIN_AMERICAN)
			{
				break;
			}
			// CB hmenu=GetMenu(hWnd);

			// CB ADDED to display check mark.
			hmenu = CommandBar_GetMenu(hWndCB, 0);
			// Uncheck previous
			CheckMenuItem(hmenu, current_language, MF_UNCHECKED);
			current_language = ID_LANGUAGE_LATIN_AMERICAN;
			// Check current
			CheckMenuItem(hmenu, current_language, MF_CHECKED);

			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_UNCHECKED;
			SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
			// If edit control has been modified ask to save file .
			if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
			{
				AskToSave( hWnd, OpenFileName, szFileTitle ); // returns FALSE is yes or no TRUE if CANCEL
			}
			else
			{
				if( !bDictionarySaved && GetWindowTextLength( hwndEdit ) != 0 )
				{
					AskToCompile( hWnd, hwndEdit ); // returns FALSE is yes or no TRUE
				}
			}
			SetWindowText( hWnd, szAppName) ;
			SendMessage(hwndEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
			SendMessage(hwndEdit,WM_CUT,0,0L);
			SendMessage(hwndEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
			TextToSpeechShutdown(phTTS[tts_cur]);
			phTTS[tts_cur]=NULL;
			tts_cur=tts_la;
			current_lang_str[0]='L';
			current_lang_str[1]='A';
			current_lang_str[2]='\0';
			//current_language=ID_LANGUAGE_LATIN_AMERICAN;
			TextToSpeechSelectLang(NULL,tts_cur);
			mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 1);
			
			if (mmStatus == MMSYSERR_NODRIVER)
			{
				TextToSpeechSelectLang(NULL,tts_cur);
				mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], 0, DO_NOT_USE_AUDIO_DEVICE, TTSCallbackRoutine, 1);
				
				if ( mmStatus == MMSYSERR_ERROR)		
				{
					return FALSE;
				}
				
				if (mmStatus)
				{
					DestroyWindow( hWnd );
				}
			
				// ncs 06oct97 - error out of application if TextToSpeechStartUp Fails
				if (mmStatus)
				{
					return( -1 );
				}
			}
			TextToSpeechUnloadUserDictionary( phTTS[tts_cur] );
			TextToSpeechSpeak( phTTS[tts_cur], L"[:phoneme arpa on]", TTS_FORCE );
			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_CHECKED;
			SetMenuItemInfo(hmenu,ID_LANGUAGE_LATIN_AMERICAN,FALSE,&menu_info);
			break;
		case ID_LANGUAGE_BRITISH:
			if (current_language==ID_LANGUAGE_BRITISH)
			{
				break;
			}
			// CB hmenu=GetMenu(hWnd);

			// CB ADDED to display check mark.
			hmenu = CommandBar_GetMenu(hWndCB, 0);
			// Uncheck previous
			CheckMenuItem(hmenu, current_language, MF_UNCHECKED);
			current_language = ID_LANGUAGE_BRITISH;
			// Check current
			CheckMenuItem(hmenu, current_language, MF_CHECKED);

			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_UNCHECKED;
			SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
			// If edit control has been modified ask to save file .
			if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
			{
				AskToSave( hWnd, OpenFileName, szFileTitle );// returns FALSE is yes or no TRUE if CANCEL
			}
			else
			{
				if( !bDictionarySaved && GetWindowTextLength( hwndEdit ) != 0 )
				{
					AskToCompile( hWnd, hwndEdit );// returns FALSE is yes or no TRUE
				}
			}
			SetWindowText( hWnd, szAppName) ;
			SendMessage(hwndEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
			SendMessage(hwndEdit,WM_CUT,0,0L);
			SendMessage(hwndEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
			TextToSpeechShutdown(phTTS[tts_cur]);
			phTTS[tts_cur]=NULL;
			tts_cur=tts_uk;
			current_lang_str[0]='U';
			current_lang_str[1]='K';
			current_lang_str[2]='\0';
			//current_language=ID_LANGUAGE_BRITISH;
			TextToSpeechSelectLang(NULL,tts_cur);
			mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 1);
		
			if (mmStatus == MMSYSERR_NODRIVER)
			{
				TextToSpeechSelectLang(NULL,tts_cur);
				mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], 0, DO_NOT_USE_AUDIO_DEVICE, TTSCallbackRoutine, 1);
			
				if ( mmStatus == MMSYSERR_ERROR)
				{
					return FALSE;
				}
				
				if (mmStatus)
				{
					DestroyWindow( hWnd );
				}
			
				// ncs 06oct97 - error out of application if TextToSpeechStartUp Fails
				if (mmStatus)
				{
					return( -1 );
				}
			}
			TextToSpeechUnloadUserDictionary( phTTS[tts_cur] );
			TextToSpeechSpeak( phTTS[tts_cur], L"[:phoneme arpa on]", TTS_FORCE );
			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_CHECKED;
			SetMenuItemInfo(hmenu,ID_LANGUAGE_BRITISH,FALSE,&menu_info);
			break;
#endif // WINDIC_C_STATIC 
		default:
			break;
	}
    return FALSE;
}
/**************************END OF FN: menuCommand() *******************************************************************/


/****************************************************************************
*
*    FUNCTION: FindDialog( HWND hWnd )
*
*    PURPOSE:
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/
// CB
HWND FindDialog( HWND hWnd )
{
	static FINDREPLACE frText;
	// CB ADDED 
	HWND temp = '\0';

    frText.lStructSize          = sizeof( FINDREPLACE );
    frText.hwndOwner            = hWnd;
    frText.hInstance            = NULL;
    frText.Flags                = FR_DOWN | ! FR_WHOLEWORD | ! FR_MATCHCASE; 
    // CB ADDED typecast LPTSTR
	frText.lpstrFindWhat        = (LPTSTR)szFindText;
    frText.lpstrReplaceWith     = NULL;
    frText.wFindWhatLen         = sizeof( szFindText );
    frText.wReplaceWithLen      = 0;
    frText.lCustData            = 0;
    frText.lpfnHook             = NULL;
    frText.lpTemplateName       = NULL;

    // CB ADDED typecast LPTSTR
	return 0;	
	// CB REMOVED NOT SUPPORTED
	// retur FindText( (LPTSTR)&frText );
}

/****************************************************************************
*
*    FUNCTION: FindNextText( )
*
*    PURPOSE:
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/
// CB
BOOL FindNextText( HWND hSearch, DWORD *lpdwSearchOffset )
{
	// CB ADDED static
	FINDREPLACE frText;
	// CB ADDED typecast LPTSTR
    frText.lpstrFindWhat = (LPTSTR)szFindText;

    return ( FindSearchString( hSearch, lpdwSearchOffset, &frText ));
}

/****************************************************************************
*
*    FUNCTION: FindSearchString( )
*
*    PURPOSE:
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/


BOOL FindSearchString( HWND hSearch, DWORD *lpdwSearchOffset, LPFINDREPLACE lpfr )
{
    DWORD       dwPos;
    LPSTR       lpstrDoc, lpstrPos, lpstrFind, lpstrDoc1;
    BOOL        bFind = TRUE;
    static char szAlphabet[] = {"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"};
	
	// tek 23jul96 
	int	iWinTextLen;


    //
    // Get a pointer to the edit document
    //
	// can't directly use EM_GETHANDLE in Win32, so we allocate
	// a search buffer and load it up.

	iWinTextLen = GetWindowTextLength(hSearch);	// get the text
												// length; might
												// actually be too
												// big..
	// CB ADDED typecast (char *)
	// CB CHANGED malloc to LocalAlloc
	lpstrDoc = (char *)malloc(iWinTextLen+1);	// allocate space.
	if (lpstrDoc == NULL)
	{
		MessageBox( hSearch, L"Insufficient memory for search buffer!",
				    L"Error", MB_OK|MB_ICONSTOP);
		return FALSE;
	}
	// get the actual text..
	// CB ADDED typecast LPTSTR
	iWinTextLen = GetWindowText(hSearch, (LPTSTR)lpstrDoc, iWinTextLen);
	// might be zero on an empty window..
	if (iWinTextLen == 0)
	{
		dwPos = GetLastError();
		return FALSE;
	}

    // Set the string for up/down searching, make a copy of the strings we search
    // so that the original string on the screen doesn't get munged.
    // CB CHANGED _strrev & _strdup
    lpstrFind = ( lpfr->Flags & FR_DOWN ) ? (char *)_wcsdup( lpfr->lpstrFindWhat )
				: (char *)_wcsrev( _wcsdup( lpfr->lpstrFindWhat ) );

    // CB CHANGED _strrev & typecast LPTSTR
	// CB ADDED typecast (char *)
	lpstrDoc1 = (lpfr->Flags & FR_DOWN ) ? (char *)( lpstrDoc ) 
		        : (char *)_wcsrev( (LPTSTR)lpstrDoc );

    *lpdwSearchOffset = (lpfr->Flags & FR_DOWN ) ? *lpdwSearchOffset
				        : strlen( lpstrDoc1 ) - *lpdwSearchOffset + 1;

    //
    // Search the document for the find string
    //
    while( bFind )
    {
		if( lpfr->Flags & FR_MATCHCASE )
		{
			lpstrPos = strstr( lpstrDoc1 + *lpdwSearchOffset, lpstrFind );
		}
		else
		{
			// CB ADDED typecast (char *) & LPTSTR
			lpstrPos = strstr((char *) ( CharLower((LPTSTR)lpstrDoc1 )
				       + *lpdwSearchOffset )
					   , (char *)CharLower( (LPTSTR)lpstrFind ) );
		}
		
		if( lpfr->Flags & FR_WHOLEWORD )
		{
			//
			// If there are no words matched, then quit looking for one
			//
			if( lpstrPos == NULL )
			{
				bFind = FALSE;
			}
			// CB ADDED {} to else
			else 
			{
				// if the string was matched, let's see if the next character will make
				// an exact match.  Note, any letter in the alphabet immediately after the last
				// character matched will cause this exact match to fail.
				// CB CHANGED strspn & ADDED typecast LPTSTR
				if( !wcsspn((LPTSTR)( lpstrPos + strlen( lpstrFind )), (LPTSTR)szAlphabet ) )
				{
					bFind = FALSE;
				}
				else
				{
					//
					// Find the current position in the document and the new start offset
					//
					dwPos = lpstrPos - lpstrDoc1;
					*lpdwSearchOffset = dwPos + strlen( lpstrFind );
				}
			}
		}
		else
		{
			bFind = FALSE;
		}
	}

    // highlight the text, or
    // Return an error code if the string cannot be found
    
    if( lpstrPos != NULL )
	{

		// Find the current position in the document and the new start offset
		// Don't forget, we might have done this in the UP direction.
		// CB ADDED typecast (char *)
		dwPos = ( lpfr->Flags & FR_DOWN ) ? lpstrPos - lpstrDoc1
			    : strlen(lpstrDoc1) - (lpstrPos - lpstrDoc1) - strlen( lpstrFind );
		*lpdwSearchOffset = dwPos + strlen( (char *)lpfr->lpstrFindWhat );

		// Select the found text
		SendMessage( hSearch, EM_SETSEL, dwPos, *lpdwSearchOffset );
		SendMessage( hSearch, EM_SCROLLCARET, 0L, 0L );

		SetFocus( hFind );
		free(lpstrDoc);
		return TRUE;
	}
	else
	{
		free(lpstrDoc);
		return FALSE;
	}
}

/****************************************************************************
*
*    FUNCTION: FindValidFind( void )
*
*    PURPOSE:
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/

BOOL FindValidFind( void )
{
    return( *szFindText != '\0' );
}

/****************************************************************************
*	FUNCTION: SPEAKLINE(HWND,INT)
*
*	PURPOSE:
*
*	COMMENTS:
*
*	RETURN VALUES:
****************************************************************************/

void SpeakLine( HWND hWnd, int iOffset )
{
    DWORD dwLineIndex;
    DWORD dwTextLen;
    // CB CHANGED FROM int to DWORD
	int   dwLine;
    int   dwCount;
    // CB CHANGED LPSTR TO TCHAR*
	LPTSTR lpEditText;
    MMRESULT mmStatus; 
    static TCHAR szError[128];

    dwLine = SendMessage( hwndEdit, EM_LINEFROMCHAR, (WPARAM) -1L, 0 ) + iOffset;
    dwCount = SendMessage( hwndEdit, EM_GETLINECOUNT, 0, 0 );

    if(( dwLine >= dwCount ) || ( dwLine < 0 ))
    {
		mmStatus = TextToSpeechSpeak( phTTS[tts_cur], L"No more words to speak.", TTS_FORCE );
		if( mmStatus )
		{
			wsprintf( szError, L"Error3 in TTS Speak = %d", mmStatus ); 
			MessageBox( hWnd, szError, L"TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
		}
		SetFocus( hwndEdit );
		// MessageBox( hWnd, L"Attempting to go beyond list of words.", L"Warning", MB_OK | MB_ICONEXCLAMATION );
		return ;
    }
    dwLineIndex = SendMessage( hwndEdit, EM_LINEINDEX, (WPARAM) dwLine, 0 );
    dwTextLen = SendMessage( hwndEdit, EM_LINELENGTH, (WPARAM) dwLineIndex, 0 );

    // If there is a blank line, don't speak it.
    if( dwTextLen != 0 )
    {
		// CB CHANGED malloc to LocalAlloc
		lpEditText = (TCHAR *)LocalAlloc(LMEM_ZEROINIT, (1 + dwTextLen) * sizeof(TCHAR));
		if ( lpEditText == NULL)
		{
			MessageBox( hWnd, L"Unable to allocate enough memory",
				        L"Error", MB_OK | MB_ICONSTOP);
			return ; 
		}
		// CB CHANGED _itoa to _itow
		_itow( dwTextLen + 1, &lpEditText[0], 10 );
		SendMessage( hwndEdit, EM_GETLINE, (WPARAM)dwLine, (LPARAM)lpEditText );
		lpEditText[dwTextLen] = L'\0';

		SpeakPronouncation( hWnd, lpEditText );

		LocalFree( lpEditText );
     }

    // Now move the caret to reflect our currect position
    SetFocus( hwndEdit );
    if( iOffset == 1 )
	{
	  SendMessage( hwndEdit, WM_KEYDOWN, (INT) VK_DOWN,  1L);
	  SendMessage( hwndEdit, WM_KEYUP,   (INT) VK_DOWN,  0xC000);
	}
    else if( iOffset == -1 )
	{
	  SendMessage( hwndEdit, WM_KEYDOWN, (INT) VK_UP, 1L);
	  SendMessage( hwndEdit, WM_KEYUP,   (INT) VK_UP, 0xC000);
	}
}

/****************************************************************************
*
*    FUNCTION:  SpeakText( HANDLE )
*
*    PURPOSE:   This will speak all the text that is on the windows.
*
*    COMMENTS:
*
*    RETURN VALUES:
*       TRUE = if error
*       FALSE = success
*
****************************************************************************/
// CB CHANGED TO SAME AS PROTYPE. Why differnet?
BOOL SpeakText( HWND hWnd )
{
    DWORD      dwTextLen;
    LPSTR      lpEditText;
    MMRESULT   mmStatus; 
    TCHAR       szError[32];

    //
    // Figure how much text we should actually speak, and allocate enough memory.
    //
    dwTextLen = SendMessage( hwndEdit, WM_GETTEXTLENGTH, 0, 0 );
    lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof( char ));

    //
    // Get the text from the screen and store it into the lpEditText buffer.
    //
    SendMessage( hwndEdit, WM_GETTEXT,(WPARAM) dwTextLen +1, (LPARAM) lpEditText);

    //
    // Now just say the text.
    // CB ADDED typecast LPTSTR
    mmStatus = TextToSpeechSpeak( phTTS[tts_cur], (LPTSTR)lpEditText, TTS_FORCE );
    if( mmStatus )
    {
		wsprintf( szError, L"Error4 in TTS Speak = %d", mmStatus );
		MessageBox( hWnd, szError, L"TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
		return TRUE;
      }

    //
    // Clean up and leave.
    //
    free( lpEditText );
    return FALSE;
}

/****************************************************************************
*
*    FUNCTION:  SpeakPronouncation( HANDLE hWnd, TCHAR * szSelBuf )
*
*    PURPOSE:   This will filter out from the dictionary the words and only
*               pronounce the phonetic spellings of the words.
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/
BOOL SpeakPronouncation( HWND hWnd, TCHAR *szSelBuf )
{

    DWORD       dwTextLen;
    LPTSTR      lpEditText;
    LPTSTR      lpPhonemeText;
    MMRESULT    mmStatus;
    TCHAR       szError[32];
	TCHAR       *token;

    if( szSelBuf == NULL )
    {
		// Find out how much text is to be spoken and allocate enough memory
		dwTextLen = SendMessage( hwndEdit, WM_GETTEXTLENGTH, 0, 0 );
		// CB 2 LINES
		lpEditText  = (TCHAR *)malloc((1 + dwTextLen) * sizeof( TCHAR ));
		lpPhonemeText = (TCHAR *)malloc((1 + dwTextLen) * sizeof( TCHAR ));
		
		SendMessage( hwndEdit, WM_GETTEXT,(WPARAM) dwTextLen +1, (LPARAM) lpEditText);
	}
    else
	{
		lpEditText = szSelBuf;
		/* GL 03/25/1997 BATS#315 reserve one more byte */
		lpPhonemeText = (TCHAR *)malloc((wcslen(szSelBuf) + 1) * sizeof( TCHAR ) );
	}
    wsprintf( lpPhonemeText, L" " );

    // Note, we only want to speak the phonemes and not the spelled out words,
    // so we will need to parse each dictionary entry and store the desired words
    // in lpPhonemeText.
    token = wcstok( lpEditText, L"[" );
    while( token != NULL )
    {
		// CB strtok() & REMOVED (char *) typecast from NULL
		token = wcstok( NULL, L"]\n");
		if( token != NULL )
		{
			wcscat( lpPhonemeText, L"[" );
			wcscat( lpPhonemeText, token );
			wcscat( lpPhonemeText, L"] " );
			// CB strtok() & REMOVED (char *) typecast from NULL
			token = wcstok(NULL, L"[");
		}
	}
	
    // Now let's hear these phonemes.
    if( ( wcslen( lpPhonemeText ) == 1 ) && ( szSelBuf != NULL ))
	{
		wcscpy( lpPhonemeText, szSelBuf );
	}
	
    mmStatus = TextToSpeechSpeak( phTTS[tts_cur], lpPhonemeText, TTS_FORCE );
    if( mmStatus )
	{
		wsprintf( szError, L"Error5 in TTS Speak = %d", mmStatus );
		MessageBox( hWnd, szError, L"TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
	}
	
    //
    //  Be a good doo-bee and clean up any unwanted memory.
    //
	/* GL 03/25/1997 BATS#315 remove the extra free statement */
    //free( lpEditText );
    free( lpPhonemeText );
	
    return FALSE;
}


/****************************************************************************
*
*    FUNCTION: MyOpenFile( LPOPENFILENAME OpenFileName, HWND hWnd,
*                          TCHAR szFile[], TCHAR szFileTitle[] )
*
*    PURPOSE:  Function to open a file.
*
*    COMMENTS:
*
*    RETURN VALUES:
*       TRUE = file open failed.
*       FALSE = success.
*
****************************************************************************/
INT MyOpenFile( LPOPENFILENAME OpenFileName, HWND hWnd, TCHAR szFile[],
			    TCHAR szFileTitle[] )
{

    DefineOpenFileName( hWnd, OpenFileName, szFile, szFileTitle, L"Open a File" );
    OpenFileName->Flags =  OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST;// NOT SUPPORTED | OFN_HIDEREADONLY;

    if( GetOpenFileName( OpenFileName ))
    {
		if( !MyReadFile( hWnd, OpenFileName->lpstrFile ))
		{
		    return( TRUE );
		}
	}
    else
    {
//#if (UNDER_CE == 211)		
		ProcessCDError( CommDlgExtendedError(), hWnd );
//#endif
		return( TRUE );
    }
	return( FALSE );
}


// from speak.c 23 jun 96  (...tek)
/* ***************************************************************************************************
*	FUNCTION: MyReadFile(HWND, TCHAR)
*	
*	PURPOSE:
*
*	COMMENTS:
*
*	RETURN VALUES:	
******************************************************************************************************* */
int MyReadFile( HWND hWnd, TCHAR *szReadFile )
{

	//MVP:06/20/96
	// On windows'95 File size >64k bug related code is added.
	// File size of 0 bytes causes FileMapping APIs Fail.
	// A Message box saying Invalid file is added.
	DWORD dwFileSizeHigh = 0;
    DWORD dwFileSizeLow  = 0;
	// CB ADDED = 0
	DWORD dwError = 0;
	
	// CB ADDED varaibles
	DWORD dwFileLen;						// File size
	DWORD dwNumRead = 0;					// Number of characters read in file
	DWORD dwRw;
	DWORD charlength = 0;
	BOOL ifRead;							
	char *pMBString;


	//wchar_t charsize[32];

	// CB CHANGED CHAR to TCHAR
	TCHAR szErrMsg[80];
	
	// CB ADDED Initialize szErrMsg
	memset(szErrMsg,0,sizeof(szErrMsg));
	// CB REMOVED
	//char* pFileDataPlusOne;				// Create a null terminated copy


	// open the file 
	hFile = CreateFile( szReadFile, GENERIC_READ, FILE_SHARE_READ
						// CB REMOVED (LPSECURITY_ATTRIBUTES) needs only NULL
		                , NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL,
						// CB REMOVED HANDLE needs only NULL
						NULL );

	if ( hFile == INVALID_HANDLE_VALUE ) 
	{
		MessageBox( hWnd, L"File open failed.", NULL, MB_OK );
		// CB CHANGED return FALSE;
		return TRUE;
	}
	
	// CB ADDED
	dwFileLen = GetFileSize(hFile, NULL);
	
	//_itow(dwFileLen,charsize, 10);
	
	if(dwFileLen > FILESIZE)
	{
		MessageBox( hWnd, L"File size too big!", NULL, MB_OK );
		// CB CHANGED return FALSE;
		return TRUE;
	}
	else
	{
		charlength = dwFileLen * sizeof(char);
		pMBString = (char *)LocalAlloc(LPTR,(dwFileLen +1) * sizeof(char) );
		//(sizeof(char) + sizeof(char))));
		ifRead = ReadFile( hFile, pMBString, dwFileLen * (sizeof(char) + sizeof(char)), &dwRw, NULL);
	}
	mbstowcs(FileBuf, pMBString, dwFileLen);
	//SendMessage(hwndEdit, WM_SETTEXT, 0, (LPARAM)FileBuf);
	
	// CB REMOVED
	/*
	//MVP:06/20/96 :Check for file size for 64K on Windows'95
	dwFileSizeLow = GetFileSize(hFile, &dwFileSizeHigh);
	if( dwFileSizeLow == 0xFFFFFFFF && (dwError = GetLastError()) != NO_ERROR )
	{
		MessageBox(hWnd, L"GetFileSize is Failed", L"Error",MB_OK|MB_ICONSTOP);
		return FALSE;
	}
	*/
	
	// CB REMOVED
	/*
	if(bWin95)
	{
		if( dwFileSizeLow > 0xFFFF || dwFileSizeHigh)
		{
			MessageBox(hWnd, L"Can not load files more than 64K size into Dictionary Editor under Windows'95"
				       , L"Information", MB_OK |MB_ICONSTOP);
			return FALSE;
		}
	}
	*/
	
	// CB REMOVED
	/*
	hFileMap = CreateFileMapping(hFile, NULL, PAGE_READONLY, 0, 0, NULL);
	if(!hFileMap)
	{
		//MVP :06/20/96 :File size of 0 bytes creates an ERROR.
		// Reports that Information below.
		//dwError = GetLastError();
		//sprintf(szErrMsg,"The Error code returned by CreateFileMapping is %d\n",dwError);
		//MessageBox( hWnd, szErrMsg, "ERROR", MB_OK | MB_ICONSTOP );
		// CB CHANGED sprintf to wsprintf
		wsprintf(szErrMsg, L"Invalid File :%s", szReadFile);
		// CB ADDED typecast LPTSTR
		MessageBox( hWnd, (LPTSTR)szErrMsg, L"ERROR3", MB_OK | MB_ICONSTOP );
		return FALSE ;
	}
	
	// CB ADDED typecast (unsigned char *)
	pFileData = (unsigned char *)MapViewOfFile(hFileMap, FILE_MAP_READ, 0, 0, 0);
	if(!pFileData)
	{
		MessageBox( hWnd, L"MapViewOfFile in MyReadFile Failed", L"ERROR", MB_OK | MB_ICONSTOP );
		return FALSE ;
	}
	
	// CB ADDED typecast (char *)
	if ( (pFileDataPlusOne = (char *)malloc(dwFileSizeLow+1)) == NULL )
	{
		MessageBox(hWnd, L"Insufficient memory to load file", L"ERROR", MB_OK | MB_ICONSTOP);
		return FALSE;
	}

	//memcpy(pFileDataPlusOne, pFileData, dwFileSizeLow);
	pFileDataPlusOne[dwFileSizeLow] = '\0';
	
	SendMessage(hwndEdit, WM_SETTEXT, 0, (LPARAM)pFileDataPlusOne);
	free(pFileDataPlusOne);
	*/
	if (ifRead == 0)
    {
        MessageBox( hWnd, L"Zero bytes read.", NULL, MB_OK );
        CloseHandle( hFile );
        //return FALSE;
		return TRUE;
    }
	else
	{
		FileBuf[(int)dwFileLen] = '\0';
		CloseHandle(hFile);
		LocalFree(pMBString);
		// return TRUE;
		return FALSE;
	}
	// CB REMOVED
	/*
	if (! UnmapViewOfFile ( pFileData ))
	{
	  MessageBox( hWnd, L"File Unmap in MyReadFile Failed", L"ERROR", MB_OK | MB_ICONSTOP );
	  return FALSE ;
	}
	CloseHandle(hFileMap);
	CloseHandle(hFile);
	return FALSE;
	*/

	//dwFileSize = GetFileSize( hFile, NULL);
	//sprintf(szBuf,"file size is %d", dwFileSize);
	// MessageBox( hWnd, szBuf, L"INFO", MB_OK );

	// read it's contents into a buffer

}
/***********************************************END OF:MyReadFile()**********************************

/****************************************************************************
*
*    FUNCTION: AskToSave(HWND hWnd, LPOPENFILENAME OpenFileName, TCHAR szFileTitle[] )
*
*    PURPOSE:  Puts up a Message box asking to save - yes, no or cancel
*
*    COMMENTS:
*
*
*    RETURN VALUES:
*        TRUE  -  Cancel button pushed
*        FALSE -  Yes or No pushed
*
****************************************************************************/
BOOL AskToSave( HWND hWnd, LPOPENFILENAME OpenFileName, TCHAR szFileTitle[] )
{
    int response;
	// CB char & added L"\0"
	TCHAR szBuf[128] = L"\0";

	response = MessageBox(hWnd, L"The Text in this file has changed.\n\n Do you wish to save the changes?",
	                       L"Windic",  MB_YESNOCANCEL | MB_ICONEXCLAMATION );

    switch( response )
    {
		case IDYES:
			GetWindowText( hWnd, szBuf, 30);
			if( wcscmp( szBuf, L"windic\0" ) == 0)
			{
				if( !SaveFileAs( OpenFileName, hWnd, szFileTitle ) )
				{
					return TRUE;
				}
				else
				{
					return FALSE;
				}
			}
			else
			{
				MySaveFile( hWnd, szFileTitle );
				return FALSE;
			}
		case IDCANCEL:
			 return TRUE;
		default:	//case IDNO:
			 return FALSE;
	}
}

BOOL AskToCompile( HWND hWnd, HWND hwndEdit )
{
    int iResponse;

    iResponse = MessageBox(hWnd,
	                       L"A dictionary file has not been created.\n\n Do you wish to create one now?",
	                       L"windic",  MB_YESNOCANCEL | MB_ICONEXCLAMATION );

    switch( iResponse )
    {
		case IDYES:
			CompileUserDic( hWnd, hwndEdit );
			return FALSE;
		case IDCANCEL:
			return TRUE;
		default:	//IDNO:
			return FALSE;
    }
}

/**********************************************************************
*                                                                    
*  Function: AboutDlgProc                                            
*  Author: Bill Hallahan                                             
*  Date: October 5, 1994                                             
*                                                                    
*                                                                    
*  Abstract:                                                         
*                                                                    
*      This dialog procedure is for the about box.                   
*                                                                    
*                                                                    
*  Input:                                                            
*                                                                    
*    hWnd      Handle to window.                                     
*                                                                    
*    uiMsg     Message being sent to the window.                     
*                                                                    
*    wParam    Specific argument to message.                         
*                                                                    
*    lParam    Specific argument to message.                         
*                                                                    
*                                                                    
*  Output:                                                           
*                                                                    
*    The return value is specific to the message that was            
*    received. It is FALSE if this dialog procedure does not handle  
*    a message (an exception is the WM_INITDIALOG message where      
*    TRUE is always returned).                                       
*                                                                    
**********************************************************************/


#define MAX_STRING 512

BOOL APIENTRY AboutDlgProc( HWND hWnd, UINT uiMsg, WPARAM wParam, LPARAM lParam )
{
	HWND hDlgItem;
	// CB CHANGED from LPSTR LPTSTR
	LPTSTR pString;
	TCHAR szInstaller[MAX_STRING];
	TCHAR szCompany[MAX_STRING];
	
	switch( uiMsg )
	{
		case WM_INITDIALOG:
			/******************************************************************
			 *  Display some OS version information.                          *
			 ******************************************************************/
			// CB CHANGED typecast LPSTR with LPTSTR & CHAR with TCHAR
			// CB CHANGED malloc to LocalAlloc
			pString = (LPTSTR)malloc(MAX_STRING * sizeof(TCHAR));
			if ( pString == NULL )
			{
				MessageBox( hWnd, L"Out of Memory", L"Error", MB_OK );
				return TRUE;
			}

			AppGetWindowsVersion( pString, NULL );
			hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_VERSION_OS );
			SetWindowText( hDlgItem, pString );
			AppGetWindowsVersion( NULL, pString );
			hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_VERSION_PLATFORM );
			SetWindowText( hDlgItem, pString );

			/******************************************************************
			 *  Get the installer name and company.                           *
			 ******************************************************************/
			
			GetInstallationInfo( szInstaller, szCompany );
			AppGetWindowsVersion( NULL, pString );
			hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_REG_INSTALLER );
			SetWindowText( hDlgItem, szInstaller );
			AppGetWindowsVersion( NULL, pString );
			hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_REG_COMPANY );
			SetWindowText( hDlgItem, szCompany );
			
			free(pString);
			
			return TRUE;
			
		case WM_COMMAND:
			if ( LOWORD( wParam ) == IDOK || LOWORD( wParam ) == IDCANCEL )
			{
				EndDialog( hWnd, ( IDOK == LOWORD( wParam )));
			}
			break;
		default:
			break;
  }
  return FALSE;
}

/****************************************************************************
*
*    FUNCTION: ErrMsg
*
*    PURPOSE:  Print out error messages as we receive them.
*
*    COMMENTS:
*
*    RETURN VALUES: FALSE = an error occured!
*
****************************************************************************/
BOOL ErrMsg (PSTR sz,...)
{
	TCHAR ach[128];

    MessageBox (NULL, ach, NULL, MB_OK|MB_ICONEXCLAMATION|MB_APPLMODAL);
    return( FALSE );
}

/****************************************************************************
*
*    FUNCTION: MySaveFile(HWND, TCHAR)
*
*    PURPOSE:  Saves current contents of edit control to current filename.
*
*    COMMENTS: This will call the userdic function to create a .dic file.
*
*
*    RETURN VALUES:
*        TRUE - The file was saved successfully
*        FALSE - The file was not saved .
*
****************************************************************************/
BOOL MySaveFile( HWND hWnd, TCHAR szFileTitle[] )
{
	// CB ADDED NULL
	LRESULT lResult = NULL;
	static  HANDLE hFileMap;
	static  PBYTE pFileData;
	static  HANDLE hFile = 0;
	DWORD i;
	// CB ADDED
	BOOL ifRead;
	DWORD dwRW;
	DWORD dwFileLen;
	DWORD charlength;
	char *pMBString; 
	//TCHAR fileSize[FILESIZE];
	
	
    // If the file extension is a .dic, then the file can
    // not save successfully.  This is because the compileUserDictionary
    // function will overwrite the text (.tab) file into a .dic file and
    // erase all the text.
    
	i = wcscspn( szFile, L"." );
	if( wcsncmp( CharLower(&szFile[i+1]), L"dic", 3 ) == 0)
    {
		MessageBox( hWnd, L"Filename can not have a .dic extension.\n\nFile not saved.",
					L"Filename Error", MB_ICONEXCLAMATION | MB_OK );
		return  FALSE;
    }
	
    hFile = CreateFile( szFile, GENERIC_READ | GENERIC_WRITE,
						FILE_SHARE_READ,
						// CB REMOVED (LPSECURITY_ATTRIBUTES)
						NULL,
						CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL,
		                // CB REMOVED (HANDLE)
						NULL );
	
    if( hFile == INVALID_HANDLE_VALUE )
    {
		MessageBox( hWnd, L"File open failed.", L"ERROR", MB_OK );
		return FALSE;
    }
	// CB ADDED
	else
	{
		
		GetWindowText(hwndEdit, FileBuf, FILESIZE);
		//dwFileLen = lstrlen(FileBuf); 
		dwFileLen = wcslen(FileBuf);
		//charlength = dwFileLen * sizeof(char);
		pMBString = (char *)LocalAlloc( LMEM_FIXED, (dwFileLen + 1) * sizeof(char) );	//  +allocate fom heap
		
		charlength = dwFileLen * sizeof(char);
		wcstombs(pMBString, FileBuf, charlength);
		ifRead = WriteFile( hFile, pMBString, charlength, &dwRW, NULL);
	}

	// CB REMOVED
	/* 
    hFileMap = CreateFileMapping(hFile,
								 NULL,
								 PAGE_READWRITE,
								 0, 
								 (SendMessage(hwndEdit, WM_GETTEXTLENGTH, 0, 0)),
								NULL);
	
	
	*/
    // CB ADDED
	//SYSTEM_INFO *lpSystemInfo;
	//GetSystemInfo(lpSystemInfo);
	//DWORD REPLACE = lpSystemInfo.dwAllocationGranularity;
	/*
	SetLastError(0); 
	DWORD error = GetLastError();
	// CD ADDED typecast PBYTE
	pFileData = (PBYTE)MapViewOfFile(hFileMap, FILE_MAP_WRITE, 0, 0, 0);
	// CB ADDED
	if( pFileData == INVALID_HANDLE_VALUE )
    {
		MessageBox( hWnd, L"FileMAP open failed.", L"ERROR", MB_OK );
		return( FALSE );
    }
	// CB ADDED TWO LINES
	error = GetLastError();

    lResult  = SendMessage(hwndEdit, WM_GETTEXTLENGTH, 0 ,0 );
    SetLastError(0); 
	SendMessage(hwndEdit, WM_GETTEXT, (WPARAM)lResult + 1, (LPARAM)pFileData );
	error = GetLastError();
    if( !UnmapViewOfFile( pFileData ))
    {
		MessageBox( hWnd, L"File Unmap Failed", L"ERROR", MB_OK | MB_ICONSTOP );
		return FALSE ;
    }
	*/

    // CB ADDED & CHANGED == -1 to == 0
	if (ifRead == 0)
    {
        MessageBox( hWnd, TEXT("Zero bytes read."), NULL, MB_OK );
        CloseHandle( hFile );
        return FALSE;
    }
	else
	{
		FileBuf[(int)dwFileLen]=L'\0';
		CloseHandle(hFile);
		LocalFree(pMBString);
	}
	
	// CB REMOVED
    // Close the open file handles.
	//CloseHandle(hFileMap);
    //CloseHandle(hFile);

    // Make note that the text has been saved, so mark it as no longer modified.
    // CB REMOVED TYPECAST (INT) from FALSE
	SendMessage(hwndEdit, EM_SETMODIFY, (INT)FALSE, 0L);
	
    // Now create the dictionary file
	if( !bDictionarySaved )
	{
		CompileUserDic( hWnd, hwndEdit );
	}
	
    return TRUE;
}


/****************************************************************************
*
*    FUNCTION: SaveFileAs(LPOPENFILENAME, HWND, TCHAR)
*
*    PURPOSE:  Saves current contents of edit control to new filename.
*
*    COMMENTS:
*
*
*    RETURN VALUES:
*        TRUE - The file was saved successfully
*        FALSE - The file was not saved .
*
****************************************************************************/
BOOL SaveFileAs( LPOPENFILENAME OpenFileName, HWND hWnd, TCHAR szFileTitle[] )
{
   wcscpy( szFile, L"");
   wcscpy( szFileTitle, L"");

   DefineOpenFileName( hWnd, OpenFileName, szFile, szFileTitle, L"Save File As" );
   OpenFileName->Flags = OFN_OVERWRITEPROMPT | OFN_PATHMUSTEXIST | OFN_CREATEPROMPT; 
   
   // CB NOT SUPPORTED BY CE
   /*
   OpenFileName->lpfnHook          = (LPOFNHOOKPROC) (FARPROC) NULL;
   // CB REMOVED typecast (LPSTR)
   OpenFileName->lpTemplateName    =  NULL;		
   */

   if( GetSaveFileName( OpenFileName ) )
   {
       return ( MySaveFile ( hWnd, szFileTitle ));
   }
   else
   {
	   // CB COMMENT OUT
//#if (UNDER_CE == 211)	
	   ProcessCDError( CommDlgExtendedError(), hWnd );
//#endif
       return FALSE;
   }
}

/****************************************************************************
*
*    FUNCTION: DefineOpenFileName( HWND hWnd, LPOPENFILENAME OpenFileName,
*                                  TCHAR *szFile, TCHAR *szFileTitle, TCHAR *szTitle )
*
*    PURPOSE:  This is called from the open and SaveAs functions.
*              This will initialize the OpenFileName for Dictionary entries.
*
*    COMMENTS:
*
*    RETURN VALUES: void
*
****************************************************************************/
void DefineOpenFileName( HWND hWnd, LPOPENFILENAME OpenFileName, TCHAR *szFile,
			             TCHAR *szFileTitle, TCHAR *szTitle  )
{
   OpenFileName->lStructSize       = sizeof(OPENFILENAME);
   OpenFileName->hwndOwner         = hWnd;
   // CB NOT SUPPORTED BY CE  OpenFileName->hInstance = (HANDLE)hInst; 
   OpenFileName->lpstrFilter       = L"Dictionary Files (*.TAB)\0*.TAB\0All Files (*.*)\0*.*\0";

   // CB NOT SUPPORTED BY CE
   /*
   OpenFileName->lpstrCustomFilter = (LPSTR)NULL;	 
   OpenFileName->nMaxCustFilter    = 0L;
   */

   OpenFileName->nFilterIndex      = 1L;
   // CB ADDED typecast LPTSTR
   OpenFileName->lpstrFile         = (LPTSTR)szFile;
   OpenFileName->nMaxFile          = FILESIZE;
   // CB ADDED typecast LPTSTR	
   OpenFileName->lpstrFileTitle    = (LPTSTR)szFileTitle;
   OpenFileName->nMaxFileTitle     = FILESIZE;
   OpenFileName->lpstrInitialDir   = NULL;
   // CB ADDED typecast LPTSTR
   OpenFileName->lpstrTitle        = (LPTSTR)szTitle;

   OpenFileName->nFileOffset       = 0;
   OpenFileName->nFileExtension    = 0;
   OpenFileName->lpstrDefExt       = L"tab";
   
   // CB NOT SUPPORTED BY CE OpenFileName->lCustData = 0;
}

/****************************************************************************
*
*    FUNCTION: CompileUserDic( HWND, HWND )
*
*    PURPOSE:  Compile the .tab file into a dictionary (.dic) file.
*
*    COMMENTS:
*
*    RETURN VALUES: void
*
****************************************************************************/

void CompileUserDic( HWND hWnd, HWND hwndEdit )
{
	TCHAR       szDictionary[100];
    DWORD       i;
    UINT        uiDictEntries;
	UINT uiTextLength;

    // Copy the dictionary source filename *.tab, and create
    // a new filename with the same inital part but with a .dic extension.
    wcscpy( szDictionary, szFile );
	i = wcscspn( szDictionary, L"." );
	wcscpy( &szDictionary[i], L".dic" );

    //  Get the number of entries in the dictionary.
    uiDictEntries = SendMessage( hwndEdit, EM_GETLINECOUNT, 0, 0 );	// L
    // CB ADDED + 1 for terminating NULL
	uiTextLength = GetWindowTextLength( hwndEdit );

    // Make a call to the dictionary compiler
    if(UserDic( hWnd, uiDictEntries, uiTextLength, szFile, szDictionary ))
	{
		bDictionarySaved = TRUE;
	}
	// CB ADDED
	else
		bDictionarySaved = FALSE;
}

/****************************************************************************
*
*    FUNCTION: ProcessCDError(DWORD)
*
*    PURPOSE:  Processes errors from the common dialog functions.
*
*    COMMENTS:
*
*        This function is called whenever a common dialog function
*        fails.  The CommonDialogExtendedError() value is passed to
*        the function which maps the error value to a string table.
*        The string is loaded and displayed for the user.
*
*    RETURN VALUES:
*        void.
*
****************************************************************************/
void ProcessCDError(DWORD dwErrorCode, HWND hWnd)
{
   WORD  wStringID;
   // CB CHANGED CHAR TO TCHAR
   TCHAR  buf[256];

   switch( dwErrorCode )
   {
		case CDERR_DIALOGFAILURE:   wStringID=IDS_DIALOGFAILURE;   break;
		case CDERR_STRUCTSIZE:      wStringID=IDS_STRUCTSIZE;      break;
		case CDERR_INITIALIZATION:  wStringID=IDS_INITIALIZATION;  break;
		case CDERR_NOTEMPLATE:      wStringID=IDS_NOTEMPLATE;      break;
		case CDERR_NOHINSTANCE:     wStringID=IDS_NOHINSTANCE;     break;
		case CDERR_LOADSTRFAILURE:  wStringID=IDS_LOADSTRFAILURE;  break;
		case CDERR_FINDRESFAILURE:  wStringID=IDS_FINDRESFAILURE;  break;
		case CDERR_LOADRESFAILURE:  wStringID=IDS_LOADRESFAILURE;  break;
		case CDERR_LOCKRESFAILURE:  wStringID=IDS_LOCKRESFAILURE;  break;
		case CDERR_MEMALLOCFAILURE: wStringID=IDS_MEMALLOCFAILURE; break;
		case CDERR_MEMLOCKFAILURE:  wStringID=IDS_MEMLOCKFAILURE;  break;
		case CDERR_NOHOOK:          wStringID=IDS_NOHOOK;          break;
		case PDERR_SETUPFAILURE:    wStringID=IDS_SETUPFAILURE;    break;
		case PDERR_PARSEFAILURE:    wStringID=IDS_PARSEFAILURE;    break;
		case PDERR_RETDEFFAILURE:   wStringID=IDS_RETDEFFAILURE;   break;
		case PDERR_LOADDRVFAILURE:  wStringID=IDS_LOADDRVFAILURE;  break;
		case PDERR_GETDEVMODEFAIL:  wStringID=IDS_GETDEVMODEFAIL;  break;
		case PDERR_INITFAILURE:     wStringID=IDS_INITFAILURE;     break;
		case PDERR_NODEVICES:       wStringID=IDS_NODEVICES;       break;
		case PDERR_NODEFAULTPRN:    wStringID=IDS_NODEFAULTPRN;    break;
		case PDERR_DNDMMISMATCH:    wStringID=IDS_DNDMMISMATCH;    break;
		case PDERR_CREATEICFAILURE: wStringID=IDS_CREATEICFAILURE; break;
		case PDERR_PRINTERNOTFOUND: wStringID=IDS_PRINTERNOTFOUND; break;
		// CB case CFERR_NOFONTS:         wStringID=IDS_NOFONTS;         break;
		// CB case FNERR_SUBCLASSFAILURE: wStringID=IDS_SUBCLASSFAILURE; break;
		// CB case FNERR_INVALIDFILENAME: wStringID=IDS_INVALIDFILENAME; break;
		// CB case FNERR_BUFFERTOOSMALL:  wStringID=IDS_BUFFERTOOSMALL;  break;
			
		case 0:   //User may have hit CANCEL or we got a *very* random error
			return;
			
		default:
			wStringID=IDS_UNKNOWNERROR;
   }
   // Load string doesn't work well, we only get an error statement and no
   // error message since NULL is the HINSTANCE!!!
   LoadString(NULL, wStringID, buf, sizeof(buf));
   MessageBox(hWnd, buf, NULL, MB_OK);
   return;
}


/**********************************************************************************
*
*  FUNCTION: HandleMenuPopup( HMENU wParam )
*
*  PURPOSE:  Handle Edit and File menu popup logic
*
*  RETURN VALUE: void
*
***********************************************************************************/
// CB CHANGED WPARAM to HMENU
void HandleMenuPopup( HMENU wParam )
{
    LONG lSelect;
    WORD wEnable;
	
	// If there is data in the clipboard then turn on the paste option.
    if( IsClipboardFormatAvailable( CF_TEXT ))
	{
		// CB REMOVED typecast HANDLE from wParam
		EnableMenuItem(wParam, ID_EDIT_PASTE, MF_ENABLED);
    }
	else
	{	
		// CB REMOVED typecast HANDLE from wParam
		EnableMenuItem(wParam, ID_EDIT_PASTE, MF_GRAYED);
	}
    
    // Enable menu cut, copy and delete items if data is selected
    lSelect = SendMessage (hwndEdit, EM_GETSEL, 0L, 0L);
    if ( HIWORD(lSelect) != LOWORD (lSelect))
	{
		wEnable= MF_ENABLED;
	}
    else
	{
		wEnable= MF_GRAYED;
	}
	
	// CB REMOVED typecast HANDLE from wParam
    EnableMenuItem (wParam, ID_EDIT_CUT, wEnable);
	// CB REMOVED typecast HANDLE from wParam
    EnableMenuItem (wParam, ID_EDIT_COPY, wEnable);
	// CB REMOVED typecast HANDLE from wParam
    EnableMenuItem (wParam, ID_EDIT_CLEAR, wEnable);

	// Enable menu undo
	// CB CHANGED 2 0L to 0
    if( SendMessage(hwndEdit, EM_CANUNDO, 0, 0 ))
	{
		EnableMenuItem(wParam, ID_EDIT_UNDO, MF_ENABLED);
	}
    else
	{
		// CB REMOVED typecast HANDLE from wParam
		EnableMenuItem(wParam, ID_EDIT_UNDO, MF_GRAYED);
	}

    // Gray out the save and "save as" option if there is no text
    // in the window, or if the dictionary has already been saved
    // and has not been modified.
    if (( bDictionarySaved && ( ! SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
	   || GetWindowTextLength( hwndEdit ) == 0 ))
    {
		// CB REMOVED typecast HANDLE from wParam
		EnableMenuItem(wParam, IDM_SAVE, MF_GRAYED);
		EnableMenuItem(wParam, IDM_SAVEAS, MF_GRAYED);
    }
    else
    {
		// CB REMOVED typecast HANDLE from wParam
		EnableMenuItem(wParam, IDM_SAVE, MF_ENABLED);
		EnableMenuItem(wParam, IDM_SAVEAS, MF_ENABLED);
    }
	
    // Gray out the compile option if there is no text in the window, or
    // if the dictionary has already been saved and has not been modified.

    if ( ( bDictionarySaved && ( ! SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ) )
	     || GetWindowTextLength( hwndEdit ) == 0 ))
	{
		// CB REMOVED typecast HANDLE from wParam
		EnableMenuItem(wParam, IDM_COMPILE_DICTIONARY, MF_GRAYED);
    }
	else
	{
		// CB REMOVED typecast HANDLE from wParam
		EnableMenuItem(wParam, IDM_COMPILE_DICTIONARY, MF_ENABLED);
	}
}

/**********************************************************************************
*
*  DWORD AppGetWindowsVersion
*
*  Description:
*      This function returns the version of Windows that the application
*      is running on plus some platform information.
*
*  Arguments:
*      PTSTR pach: Options pointer to buffer to receive text string of
*      the Windows version and platform.
*
*  Return (LRESULT):
*      The return value will be the version and platform information of
*      the current operating system in the following format:
*
*      0xPPPPMMRR where:
*
*      MM      :   major version of Windows
*      RR      :   minor version (revision) of Windows
*      PPPP    :   the platform the application is running on which
*                  will be one of the following:
*
*                  #ifdef WIN32
*                      the HIWORD() is RESERVED except for the high bit:
*                          high bit is 0 = Windows NT
*                          high bit is 1 = Win32s/Windows 3.1
*                  #else
*                      0xMMRR = Major and Minor version of [MS-]DOS
*                      GetWinFlags() & 0x8000 = Windows on OS/2 (WLO)
*                      GetWinFlags() & 0x4000 = Windows on Windows NT (WOW)
*                  #endif
*
*
***********************************************************************************/

LRESULT _stdcall AppGetWindowsVersion( LPTSTR pszEnvironment, LPTSTR pszPlatform )
{

	LRESULT lr;
	OSVERSIONINFO  OSVersionInfo;

	OSVersionInfo.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
	GetVersionEx(&OSVersionInfo);

	// Dummy return value 
	lr = OSVersionInfo.dwPlatformId;
	//  if caller wants the environment string version...
	if (NULL != pszEnvironment)
	{
		// CB ADDED 
#ifdef WIN32
{
		// CB REMOVED static for all sz varibales
	
		TCHAR    szFormatVersion[]   = L"%s Version %u.%.2u";
		// CB REMOVED NOT USED
		// TCHAR    szEnvWinNT[]        = L"Windows NT";
		// TCHAR    szEnvWin95[]        = L"Windows 95";
		// TCHAR    szEnvWin32s[]       = L"Win32s";
		// CB ADDED
		TCHAR    szEnvWinCe[]		= L"Windows CE";
		
		TCHAR			szPlatform[15];
		
		switch(OSVersionInfo.dwPlatformId) 
		{
			// CB REMOVED NOT USED
			/*
			case VER_PLATFORM_WIN32s:
				_tcscpy(szPlatform, szEnvWin32s);
				break;
			case VER_PLATFORM_WIN32_WINDOWS:
				_tcscpy(szPlatform, szEnvWin95);
				break;
			case VER_PLATFORM_WIN32_NT:
				_tcscpy(szPlatform, szEnvWinNT);
				break;
				// CB ADDED
			*/
			case VER_PLATFORM_WIN32_CE:
				_tcscpy(szPlatform, szEnvWinCe);
		}
		// CB REMOVED typecast LPSTR from szPlatform
		wsprintf(pszEnvironment, szFormatVersion, szPlatform,
		OSVersionInfo.dwMajorVersion, OSVersionInfo.dwMinorVersion);
}

// CB REMOVED
/*
#else
{
#ifndef WF_WINNT
	#define WF_WINNT        0x4000
	#define WF_WLO          0x8000
#endif	//	WF_WINNT
#ifndef WF_CPUMASK
	#define WF_CPUMASK      0xFC000000
	#define WF_CPU_X86      0
	#define WF_CPU_R4000    1
	#define WF_CPU_ALPHA    2
	#define WF_CPU_CLIPPER  3
#endif	// WF_CPUMASK

	static TCHAR    szFormatSubSys[]= TEXT("Windows Version %u.%.2u (%s%s)\n%s Subsystem, DOS Version %u.%.2u");
	static TCHAR    szFormatDOS[]   = TEXT("Windows Version %u.%.2u (%s%s)\nDOS Version %u.%.2u");
	static TCHAR    szSubSysWLO[]   = TEXT("WLO");
	static TCHAR    szSubSysWOW[]   = TEXT("WOW");
	static TCHAR    szModeEnhanced[]= TEXT("Enhanced");
	static TCHAR    szModeStandard[]= TEXT("Standard");
	static TCHAR    szEnvPaging[]   = TEXT(", Paging");

	DWORD   dwWinFlags;
	PTSTR   pszMode;

	BYTE    bVerEnvMajor    = HIBYTE(LOWORD(uVerEnv));
	BYTE    bVerEnvMinor    = LOBYTE(LOWORD(uVerEnv));

	dwWinFlags = GetWinFlags();

	pszMode = (dwWinFlags & WF_ENHANCED) ? szModeEnhanced : szModeStandard;
	if (dwWinFlags & (WF_WLO | WF_WINNT))
	{
		wsprintf(pszEnvironment, szFormatSubSys, bVerWinMajor, bVerWinMinor,
				 (LPSTR)pszMode,
				 (LPSTR)((dwWinFlags & WF_PAGING) ? szEnvPaging : gszNull),
				 (LPSTR)((dwWinFlags & WF_WINNT) ? szSubSysWOW : szSubSysWLO),
				 bVerEnvMajor, bVerEnvMinor);
	}
	else
	{
		wsprintf(pszEnvironment, szFormatDOS, bVerWinMajor, bVerWinMinor,
				 (LPSTR)pszMode,
				 (LPSTR)((dwWinFlags & WF_PAGING) ? szEnvPaging : gszNull),
				 bVerEnvMajor, bVerEnvMinor);
	}
}
*/
#endif	// WIN_32

	}

	//  if caller wants the platform string version...
	if (NULL != pszPlatform)
	{
#ifdef WIN32
{
	// CB REMOVED static from all sz variables
	TCHAR    szFormatPlatform[]  = TEXT("%s%u, %u Processor(s)");
	TCHAR    szProcessorIntel[]  = TEXT("Intel ");
	TCHAR    szProcessorMIPS[]   = TEXT("MIPS R");
	TCHAR    szProcessorAlpha[]  = TEXT("DEC Alpha ");
	TCHAR    szProcessorDunno[]  = TEXT("Dunno zYz");


	SYSTEM_INFO sysinfo;
	PTSTR       pszProcessor;

	//
	//  this is absolutely silly. one would think that the dwOemId member
	//  would provide something useful like the processor class... but
	//  no, it doesn't--it is always 0.
	//
	GetSystemInfo(&sysinfo);
	switch (sysinfo.wProcessorArchitecture)
	{
		case PROCESSOR_ARCHITECTURE_INTEL:
			pszProcessor = szProcessorIntel;
			break;

		case PROCESSOR_ARCHITECTURE_MIPS:
			pszProcessor = szProcessorMIPS;
			break;

		case PROCESSOR_ARCHITECTURE_ALPHA:
			pszProcessor = szProcessorAlpha;
			break;

		default:
			pszProcessor = szProcessorDunno;
			break;
	}
	// CB REMOVED typecast LPSTR from pszProcessor
	wsprintf(pszPlatform, szFormatPlatform, (LPSTR)pszProcessor,
			 sysinfo.dwProcessorType, sysinfo.dwNumberOfProcessors);
}
#else
{
	// CB REMOVED static from all sz variables
	TCHAR    szPlat286[]         = TEXT("80286");
	TCHAR    szPlat386[]         = TEXT("80386");
	TCHAR    szPlat486[]         = TEXT("i486");
	TCHAR    szPlatR4000[]       = TEXT("MIPS R4000, Emulation: ");
	TCHAR    szPlatAlpha21064[]  = TEXT("Alpha 21064, Emulation: ");
	TCHAR    szPlatClipper[]     = TEXT("Clipper, Emulation: ");
	TCHAR    szPlat80x87[]       = TEXT(", 80x87");

	DWORD   dwWinFlags;

	dwWinFlags = GetWinFlags();
	pszPlatform[0] = '\0';

	if (dwWinFlags & (WF_WLO | WF_WINNT))
	{
		switch ((dwWinFlags & WF_CPUMASK) >> 26)
		{
			case WF_CPU_X86:
				break;

			case WF_CPU_R4000:
				lstrcpy(pszPlatform, szPlatR4000);
				break;

			case WF_CPU_ALPHA:
				lstrcpy(pszPlatform, szPlatAlpha21064);
				break;

			case WF_CPU_CLIPPER:
				lstrcpy(pszPlatform, szPlatClipper);
				break;
		}
	}

	if (dwWinFlags & WF_CPU286)
		lstrcat(pszPlatform, szPlat286);
	else if (dwWinFlags & WF_CPU386)
		lstrcat(pszPlatform, szPlat386);
	else if (dwWinFlags & WF_CPU486)
		lstrcat(pszPlatform, szPlat486);

	if (dwWinFlags & WF_80x87)
		lstrcat(pszPlatform, szPlat80x87);
}
#endif	// WIN_32
	}

	//  return the result
	return (lr);
}
/******************************END OF FN:AppGetWindowsVersion()********/

/**********************************************************************
*                                                                    
*  Function: GetInstallationInfo                                     
*  Author: Bill Hallahan                                             
*  Date: October 5, 1994                                             
*                                                                    
*                                                                   
*  Abstract:                                                         
*                                                                    
*         This function gets the installer name and company from the 
*    registry.                                                       
*                                                                    
*                                                                    
*  Input:                                                            
*                                                                    
*    szInstaller    A pointer to a string that will contain the      
*                   name provided during installation.               
*                   The returned value will be NULL terminated.      
*                                                                    
*    szCompany      A pointer to a string that will contain the      
*                   company name provided during installation.       
*                   The returned value will be NULL terminated.     
*                                                                    
*                                                                    
*  Output:                                                           
*                                                                   
*    None.                                                          
*                                                                    
**********************************************************************/

/* Moved to coop.h -- ncs 07jul97

LPSTR szLocalMachineDECtalk =
  "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.40";

*/

static void GetInstallationInfo( LPTSTR szInstaller, LPTSTR szCompany )
{
	HKEY hKey;
	DWORD dwType;
	DWORD cbData;
	TCHAR temp[512];
	wcscpy(temp, szLocalMachineDECtalk);
	temp[_tcslen(szLocalMachineDECtalk) - 3] = '\0'; // chop off /GR, /LA, /SP, /UK, /US, etc.

	if ( RegOpenKeyEx( HKEY_LOCAL_MACHINE, temp,
		 // CB REMOVED #ifdef OLD_CODE
		 // CB REMOVED szLocalMachineDECtalk,
		 // CB REMOVED #endif
		 0, 
		 0, &hKey ) != ERROR_SUCCESS )
	{
		szInstaller[0] = L'\0';
		szCompany[0] = L'\0';
	}
	else
	{
		cbData = 511;
		if ( RegQueryValueEx( hKey, L"Installer", NULL, &dwType, 
			                  (LPBYTE)szInstaller, &cbData ) != ERROR_SUCCESS )
		{
			szInstaller[0] = L'\0';
		}

		cbData = 511;
		if ( RegQueryValueEx( hKey, L"Company", NULL, &dwType,
			                  (LPBYTE)szCompany, &cbData ) != ERROR_SUCCESS )
		{
			szCompany[0] = L'\0';
		}

		RegCloseKey( hKey );
	}
	return ;
}


/**********************************************************************
*                                                                    
*  Function: GetApplicationParameters                                
*  Author: Bill Hallahan                                             
*  Date: October 6, 1994                                             
*                                                                    
*                                                                    
*  Abstract:                                                         
*                                                                    
*         This function gets the last window position and show state 
*    in the registry.                                                
*                                                                   
*                                                                    
*  Input:                                                            
*                                                                    
*    piX        A pointer to an integer that will contain the        
*               X (horizontal) position of the application           
*               window.                                              
*                                                                    
*    piY        A pointer to an integer that will contain the       
*               Y (vertical) position of the application             
*               window.                                              
*                                                                    
*    piWidth    A pointer to an integer that will contain the        
*               width of the application window.                     
*                                                                    
*    piHeight   A pointer to an integer that will contain the        
*               height of the application window.                    
*                                                                    
*    piShow     A pointer to an integer that will contain the        
*               show state of the window.                            
*                                                                    
*    pszFile    A pointer to memory that will contain a NULL         
*               terminated string of characters. It must be at       
*               least FILESIZE bytes.                                
*                                                                    
*                                                                    
*  Output:                                                           
*                                                                    
*    None.                                                           
*                                                                    
**********************************************************************/

/* Moved to coop.h -- ncs 07jul97

LPSTR szCurrentUsersWindic =
  "Software\\DigitalEquipmentCorporation\\DECtalk\\Applications\\Windic";

*/

// CB not needed for sizing window
/*
static void GetApplicationParameters( int * piX, int * piY, int * piWidth, int * piHeight
									  , int * piShow, char * pszFile )
{
	HKEY hKey;
	DWORD dwType;
	DWORD cbData;
	DWORD dwXY;
	DWORD dwWH;

	// ********************************************************************
	// *  Open the registry for the application.                          *
	// ********************************************************************
	// CB ADDED typecast LPTSTR
	if ( RegOpenKeyEx( HKEY_CURRENT_USER, (LPTSTR)szCurrentUsersWindic, 0,
		     KEY_QUERY_VALUE, &hKey ) != ERROR_SUCCESS )
	{
		// ******************************************************************
		// *  If the key is not accessible then use default values.         *
		// ******************************************************************

		*piShow = SW_SHOWNORMAL;
		*piX = 0;
		*piY = 0;
		*piWidth = awWidth;
		*piHeight = awHeight;
		*pszFile = '\0';
	}
	else
	{
		// ******************************************************************
		// *  Read the former window SHOW state.                            *
		// ******************************************************************

		cbData = 4;
		// CB
		if ( RegQueryValueEx( hKey, L"Show", NULL, &dwType, (LPBYTE)piShow,
			 &cbData ) != ERROR_SUCCESS )
		{
			*piShow = SW_SHOWNORMAL;
		}

		// ******************************************************************
		// *  Read the former window X and Y positions.                     *
		// ******************************************************************

		cbData = 4;
		// CB
		if ( RegQueryValueEx( hKey, L"Position", NULL, &dwType,
			 (LPBYTE)&dwXY, &cbData ) != ERROR_SUCCESS )
		{
			*piX = 0;
			*piY = 0;
		}
		else
		{
			*piX = dwXY & 0xFFFF;
			*piY = ( dwXY >> 16 ) & 0xFFFF;

			if ( *piX > 32767 )
				*piX = 0;

			if ( *piY > 32767 )
				*piY = 0;
		}

		// ******************************************************************
		// *  Read the former window width and height.                      *
		// ******************************************************************

		cbData = 4;
		// CB
		if ( RegQueryValueEx( hKey, L"Size", NULL, &dwType
			 , (LPBYTE)&dwWH,&cbData ) != ERROR_SUCCESS )
		{
			*piWidth = awWidth;
			*piHeight = awHeight;
		}
		else
		{
			*piWidth = dwWH & 0xFFFF;
			*piHeight = ( dwWH >> 16 ) & 0xFFFF;

			if ( *piWidth > 32767 )
				*piWidth = awWidth;

			if ( *piHeight > 32767 )
				*piHeight = awHeight;
		}

			// ******************************************************************
			// *  Read the former file title.                                   *
			// ******************************************************************

			cbData = FILESIZE;
			// CB
			if ( RegQueryValueEx( hKey, L"File", NULL, &dwType,
			     (LPBYTE)pszFile, &cbData ) != ERROR_SUCCESS )
			{
				*pszFile = '\0';
			}

			// ******************************************************************
			// *  Close the registry.                                           *
			// ******************************************************************

			RegCloseKey( hKey );
	}
	return;
}
*/


/*********************************************************************
*                                                                    
*  Function: SetApplicationParameters                                
*  Author: Bill Hallahan                                             
*  Date: October 6, 1994                                             
*                                                                    
*                                                                    
*  Abstract:                                                         
*                                                                    
*         This function sets the last window position and show state 
*    in the registry.                                                
*                                                                    
*                                                                    
*  Input:                                                            
*                                                                    
*    hWnd        A handle to the application window.                 
*                                                                    
*    pszFile    A pointer to memory that contains a NULL             
*               terminated string of characters.                     
*                                                                    
*                                                                    
*  Output:                                                           
*                                                                    
*    None.                                                           
*                                                                    
**********************************************************************/

// CB REMOVED
/*

static void SetApplicationParameters( HWND hWnd, TCHAR * pszFile )
{
	int iX;
	int iY;
	int iWidth;
	int iHeight;
	int iShow;
	HKEY hKey;
	DWORD cbData;
	DWORD dwXY;
	DWORD dwWH;
	DWORD dwDisposition;
	// CB NOT SUPPORTED
	// WINDOWPLACEMENT WindowPlacement;

	
	//  Open the registry for the application.                          
	
	// CB ADDED typecast (LPTSTR) 
	if ( RegOpenKeyEx( HKEY_CURRENT_USER, (LPTSTR)szCurrentUsersWindic, 0,
		 KEY_ALL_ACCESS, &hKey ) != ERROR_SUCCESS )
	{
		
		//  The specified key was NOT found in the registry. Create       
		/  the registry entries.                                         
		
		// CB ADDED typecast (LPTSTR) 
		if ( RegCreateKeyEx( HKEY_CURRENT_USER, (LPTSTR)szCurrentUsersWindic, 0, L""
			 , REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, NULL, &hKey,
			 &dwDisposition ) != ERROR_SUCCESS )
		{
			//  Unable to update registry entries. Exit with no error.      
			

			return;
		}
	}

	//  Set the registry entries for the window placement data.         

	WindowPlacement.length = sizeof(WINDOWPLACEMENT);

	 
	if ( GetWindowPlacement( hWnd, &WindowPlacement ))
	{
	    Data = 4;
	    iShow = WindowPlacement.showCmd;
		// CB
		RegSetValueEx( hKey, L"Show", 0, REG_DWORD,
					  (LPBYTE)&iShow, sizeof( DWORD ) );
		
		//  Set the registry entries for the window X and Y coordinates. 
	
		iX = WindowPlacement.rcNormalPosition.left;
		iY = WindowPlacement.rcNormalPosition.top;
		dwXY = ( iY << 16 ) + iX;
		cbData = 4;
		// CB
		RegSetValueEx( hKey, L"Position", 0, REG_DWORD, (LPBYTE)&dwXY,
					   sizeof( DWORD ) );
	
		
		//  Set the registry entries for the window width and height.    
		
		
		iWidth = WindowPlacement.rcNormalPosition.right
			     - WindowPlacement.rcNormalPosition.left;

		iHeight = WindowPlacement.rcNormalPosition.bottom
	              - WindowPlacement.rcNormalPosition.top;

		dwWH = ( iHeight << 16 ) + iWidth;

		cbData = 4;
		// CB
		RegSetValueEx( hKey, L"Size", 0, REG_DWORD, (LPBYTE)&dwWH, sizeof( DWORD ));
	}
	
	
	//  Set the registry entry for the current file title.          
	
	// CB strlen()
	RegSetValueEx( hKey, L"File", 0, REG_SZ, (LPBYTE)pszFile,
		           1 + wcslen( pszFile ) );

	
	//  Close the registry.                                             
	RegCloseKey( hKey );

	return ;
}
*/
