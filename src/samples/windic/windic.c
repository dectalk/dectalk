/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1993 - 1998          */
/*  � SMART Modular Technologies 1999. All rights reserved.		  	  */
/*  Copyright � 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved. */
/*																	  */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of Force Computers           */
/*  Incorporated. Possession, use, duplication or dissemination of    */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from Force Computers Incorporated.                */
/*                                                                    */
/*  The name of Force Computers Incorporated may not be used to       */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      */
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        */
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        */
/*  FOR A PARTICULAR PURPOSE.                                         */
/*  Force assumes no responsibility AT ALL for the use or             */
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
 * 013	NAL		05/26/2000	Changed message "Nothing to translate" to "Nothing is highlighted"
 * 014  CAB		11/09/2000	Added for loop to remove return carriage to display right.
 *							Formatted and added copyright info
 * 015	MGS		01/24/2001	Added French support
 * 016	CAB		01/24/2001	Changed define ENGLISH_UK to FRENCH
 */
/**********************************************************************/

#include <windows.h>
#include <commdlg.h>
#include <dlgs.h>       // includes common dialog template defines
#include <cderr.h>      // includes the common dialog error codes
#include <mmsystem.h>
#include <io.h>
#include <stdio.h>
#include <tchar.h>	   // For TCHAR types
#include <string.h>
#include <stdlib.h>
#include <process.h>
#include "ttsapi.h"
#include "windic.h"

//#ifndef WINDIC_C_STATIC
#define WINDIC_C
#include "coop.h"
#undef WINDIC_C
//#endif

#define rateMax 600
#define rateMin 75

#define pWidth   130    // pronounce or play button
#define pHeight  20

#define border 2

#define etWidth  400 - border * 2   //edit text for words to speak
#define etHeight 450 - border * 2

#define awWidth etWidth + border * 2 + 2    //application window
#define awHeight 60 + pHeight + border * 2  + etHeight

#define FILESIZE 256
#define GWL_HINSTANCE	(-6)

/**********************************************************************/
/*  Global variables.                                                 */
/**********************************************************************/

LPCTSTR *szAppName = TEXT("DECtalk Dictionary Editor");
HANDLE hInst;
LPTTS_HANDLE_T phTTS[10];
int tts_cur,tts_us,tts_uk,tts_gr,tts_sp,tts_la,tts_fr;
int us_on=0,uk_on=0,sp_on=0,gr_on=0,la_on=0,fr_on=0;
char current_lang_str[10];
int current_language;
HWND hPrev, hNext, hEdit, hPlay, hFind;
char szFile[FILESIZE] = "\0";
char szFindText[FILESIZE];
char szFileSave[FILESIZE] = "\0";
char szFileTitleSave[FILESIZE] = "\0";
static  char szReplaceText[FILESIZE];
BOOL    bDictionarySaved = FALSE;
HANDLE hFile=0;

BOOL bWin95 = FALSE;		  //tek: Flag to specify OS 
	                          //TRUE :	Windows'95
	                          //FALSE :else

HANDLE hFileMap ;
PBYTE pFileData;

char szAppAndFile[FILESIZE*2]="";	//tek 23jul96

LPLANG_ENUM languageINFO;

/****************************************************************************
*
*    FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
*
*    PURPOSE:
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/
VOID TTSCallbackRoutine(LONG lParam1, LONG lParam2,DWORD dwInstanceParam, UINT uiMsg) 
{
	return;
}

int APIENTRY WinMain(HINSTANCE hInstance,
		     HINSTANCE hPrevInstance,
		     LPSTR lpCmdLine,
		     int nCmdShow)
{
    int iX;
    int iY;
    int iWidth;
    int iHeight;
    int iShow;
    HWND        hWnd;
    HANDLE      hAccel;
    WNDCLASS    wndclass;
    MSG         msg;
    char        *arg[2];
    int         i = 0;


  OSVERSIONINFO  OSVersionInfo;

  OSVersionInfo.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
  GetVersionEx(&OSVersionInfo);
	
  if(OSVersionInfo.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS) 
     bWin95 = TRUE;	 //i.e It is Windows'95 OS.

    hInst = hInstance;

    wndclass.style         = CS_HREDRAW | CS_VREDRAW | CS_DBLCLKS | CS_OWNDC;
    wndclass.lpfnWndProc   = (WNDPROC) WndProc;
    wndclass.cbClsExtra    = 0;
    wndclass.cbWndExtra    = 0;
    wndclass.hInstance     = NULL;
    wndclass.hIcon         = LoadIcon(hInstance, MAKEINTRESOURCE( ICON_APP ));
    wndclass.hCursor       = LoadCursor( NULL, IDC_ARROW );
    wndclass.hbrBackground = GetStockObject( BLACK_BRUSH );
    wndclass.lpszMenuName  = "windic_MENU";
    wndclass.lpszClassName = szAppName;

    if( !RegisterClass( &wndclass ))
	return( FALSE );

    GetApplicationParameters( &iX, &iY, &iWidth, &iHeight, &iShow, szFile );

    hWnd = CreateWindow( szAppName,
			 szAppName,
			 WS_CAPTION | WS_SYSMENU
			   | WS_OVERLAPPEDWINDOW | WS_VISIBLE
			   | WS_MINIMIZEBOX,
			 iX,
			 iY,
			 iWidth,
			 iHeight,
			 NULL, NULL, NULL, NULL );

    /* If window could not be created, return "failure" */

    if( !hWnd )
      {
	//error = GetLastError();
	return( FALSE );
      }

    ShowWindow( hWnd, iShow );
    UpdateWindow( hWnd );                /* Sends WM_PAINT message */
    DragAcceptFiles( hWnd, TRUE );       /* Accept files dragged from File Manager */

    // Check for command line invocation with filename and dictionary name
    if( strlen( lpCmdLine ) )          /* Check for command line parameter */
      {
	arg[i] =  strtok(lpCmdLine, " ");
	i++;
	if(( arg[i] =  strtok( NULL, " ")) == NULL)
	    i--;

	switch (i)
	  {
	    case 1:
		strcpy( szFile,  arg[0] );
		if( MyReadFile( hWnd, szFile ))
		  {
		    DrawMenuBar( hWnd );

		    // reset the title in the title bar to reflect the
		    // new open file
		    SendMessage( hWnd, WM_SETTEXT, 0, (LPARAM)szFile );
		    InvalidateRect( hEdit, NULL, TRUE );
		    DrawMenuBar( hWnd );
		    SpeakText( hWnd );
		   }
		 break;

	    default:
		 break;
	  }
       }

     hAccel = LoadAccelerators( hInst, "windic_MENU" );


     /* Enter message loop */
     while( GetMessage( &msg, NULL, 0, 0 ))
       {
	 if( !IsDialogMessage( hFind, &msg ) )
	     if( ! TranslateAccelerator( hWnd, hAccel, &msg ))
	       {
		 TranslateMessage( &msg );
		 DispatchMessage( &msg );
	       }
       }
     return( msg.wParam );
}

/****************************************************************************
*
*    FUNCTION: WndProc( HWND, UINT, WPARAM, LPARAM )
*
*    PURPOSE:
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/

LONG APIENTRY WndProc(HWND hWnd,
		      UINT uiMessage,
		      WPARAM wParam,
		      LPARAM lParam)
{
	MMRESULT mmStatus;              /* Text To Speach return status code */
static  char *  szCurrentSpeaker = " [:nh]";  /* Set the speaker to be Harry */
	RECT    lprc;
static  HBRUSH  hOldBrush, hBrush;      /* Background colors                    */
static  short   wSpos = 180;            /* Scroll bar position - speaking rate  */
	LPMINMAXINFO  lpmmiSize;        /* Used to keep track of window size    */
	DWORD   dwStart, dwEnd;         /* Used when text is highlighted by the mouse */
	LONG    lSelect, dwOffset;
	DWORD   dwTextLen;
	LPSTR   lpEditText, lpSelBuf;
static  UINT    uiID_Error_Msg;         /* Used in registering DECtalk Error Messages */
static  UINT    uiMessage_Find_Replace; /* Used in registering find messages */
static  char    szError[FILESIZE];
static  char    szFileTitle[FILESIZE];
static  OPENFILENAME OpenFileName;
static  LPFINDREPLACE lpfrText;
	
	HMENU hmenu;
	MENUITEMINFO menu_info;

	char lang[3];
	DWORD dwType,cbData;
	HKEY hKeyLicense = NULL;
        char szLicenseKey[] = "Software\\DECtalk Software\\DECtalk\\4.60";


    switch( uiMessage )
      {
	case WM_DESTROY:

		SetApplicationParameters( hWnd, szFile );

		if( TextToSpeechShutdown( phTTS[tts_cur] ) )
		    MessageBox( hWnd, TEXT("Error Shutting down TTS"), TEXT("ERROR"), MB_OK | MB_ICONSTOP );

#ifndef WINDIC_C_STATIC
		if (us_on)	mmStatus = TextToSpeechCloseLang("US");
		if (uk_on)	mmStatus = TextToSpeechCloseLang("UK");
		if (gr_on)	mmStatus = TextToSpeechCloseLang("SP");
		if (sp_on)	mmStatus = TextToSpeechCloseLang("GR");
		if (la_on)	mmStatus = TextToSpeechCloseLang("LA");
		if (fr_on)	mmStatus = TextToSpeechCloseLang("FR");
#endif

		PostQuitMessage( 0 );
		break;

	case WM_CLOSE:
		if( SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ))
		  {
		    if( AskToSave( hWnd, &OpenFileName, szFileTitle )) // returns FALSE is yes or no TRUE if CANCEL
		      break;                      // Cancel pressed

		    DestroyWindow( hWnd );
		    break;
		  }

		DestroyWindow( hWnd );
		break ;

	case WM_CREATE:
		uiID_Error_Msg = RegisterWindowMessage( TEXT("DECtalkErrorMessage") );
		uiMessage_Find_Replace = RegisterWindowMessage( TEXT("commdlg_FindReplace") );
		GetClientRect( hWnd, &lprc );
		hEdit = CreateWindow(
				TEXT("EDIT"),         /* See RegisterClass() call.    */
				TEXT(""),             /* Text for window title bar.   */
				WS_CHILD |WS_VISIBLE | WS_VSCROLL | ES_NOHIDESEL | WS_HSCROLL |
				WS_BORDER | ES_LEFT | ES_MULTILINE | ES_AUTOVSCROLL,
						/* Window Style.                */
				border * 2,     /* Horizontal Position          */
				border * 2,     /* Vertical Position    */
				etWidth,        /* Width                        */
				etHeight,       /* Heigth                       */
				hWnd,           /* Parent window                */
				(HMENU)ID_EDITCTL,      /* Use the window class menu */
				(HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ), /* hInstance */
				NULL) ;
		SendMessage( hEdit, EM_LIMITTEXT, (WPARAM)0, (LPARAM)0 );

		hPlay = CreateWindow(TEXT("BUTTON"), TEXT("Pronounce Word"),
			       WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
			       border,                  // Vertical Position
			       0L,                      // Horizontal Position
			       pWidth,                  // Width
			       pHeight,                 // Height
			       hWnd,                    // Parent window
			       (HMENU)ID_PLAY,          // Use the window class menu
			       (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ), // hInstance
			       NULL);

		hPrev = CreateWindow (
				TEXT("BUTTON"),              /* See RegisterClass() call.          */
				TEXT("Previous"),            /* Text for window title bar.         */
				WS_CHILD |WS_VISIBLE | BS_PUSHBUTTON,   /* Window style.                      */
				border * 2 + pWidth,   /* Default horizontal position.       */
				0L,                    /* Default vertical position.         */
				pWidth,                /* Default width.                     */
				pHeight,               /* Default height.                    */
				hWnd,                  /* Parent window                      */
				(HMENU)ID_PREV,        /* Child ID                           */
				(HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   /* hInstance */
				NULL);

		hNext = CreateWindow(TEXT("BUTTON"), TEXT("Next"),
			       WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
			       2 * pWidth + border * 2,   /* Vertical Position   */
			       0L,                        /* Horizontal Position */
			       pWidth,                    /* Width                      */
			       pHeight,                   /* Height                     */
			       hWnd,                      /* Parent Window              */
			       (HMENU)ID_NEXT,            /* Child ID                   */
			       (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   /* hInstance */
			       NULL);

#if 0
		if (RegOpenKeyEx( HKEY_LOCAL_MACHINE, szLicenseKey, 0, KEY_QUERY_VALUE, &hKeyLicense ) != ERROR_SUCCESS) {
			sprintf(lang,"US");
		} else {
			cbData = 3;
			if (RegQueryValueEx( hKeyLicense, "DefaultLang", NULL, &dwType, (LPBYTE)lang, &cbData ) != ERROR_SUCCESS) {
				sprintf(lang,"US");
			}
			RegCloseKey( hKeyLicense );
		}
#endif

		hmenu=GetMenu(hWnd);

#ifdef WINDIC_C_STATIC
#ifdef ENGLISH_US
		us_on=1;
		EnableMenuItem(hmenu,ID_LANGUAGE_ENGLISH,MF_BYCOMMAND | MF_ENABLED);
		current_language=ID_LANGUAGE_ENGLISH;
#endif
#ifdef ENGLISH_UK
		uk_on=1;
		EnableMenuItem(hmenu,ID_LANGUAGE_BRITISH,MF_BYCOMMAND | MF_ENABLED);
		current_language=ID_LANGUAGE_BRITISH;
#endif
#ifdef SPANISH
#ifdef LATIN_AMERICAN
		la_on=1;
		EnableMenuItem(hmenu,ID_LANGUAGE_LATIN_AMERICAN,MF_BYCOMMAND | MF_ENABLED);
		current_language=ID_LANGUAGE_LATIN_AMERICAN;
#else
		sp_on=1;
		EnableMenuItem(hmenu,ID_LANGUAGE_SPANISH,MF_BYCOMMAND | MF_ENABLED);
		current_language=ID_LANGUAGE_SPANISH;
#endif
#endif
#ifdef GERMAN
		gr_on=1;
		EnableMenuItem(hmenu,ID_LANGUAGE_GERMAN,MF_BYCOMMAND | MF_ENABLED);
		current_language=ID_LANGUAGE_GERMAN;
#endif
#ifdef FRENCH
		fr_on=1;
		EnableMenuItem(hmenu,ID_LANGUAGE_FRENCH,MF_BYCOMMAND | MF_ENABLED);
		current_language=ID_LANGUAGE_FRENCH;
#endif
		tts_cur=0;

#else


		if(TextToSpeechEnumLangs(&languageINFO) == 0) 
		{
			MessageBox(NULL,TEXT("Unable to allocate Memory"),TEXT("Error"),MB_OK);
			return(-1);
		}
	
		if(languageINFO->MultiLang == FALSE) 
		{
			if (strcmp("US",languageINFO->Entries[0].lang_code)==0)
			{
				current_language=ID_LANGUAGE_ENGLISH;
			}
			else if (strcmp("UK",languageINFO->Entries[0].lang_code)==0)
			{
				current_language=ID_LANGUAGE_BRITISH;
			}
			else if (strcmp("SP",languageINFO->Entries[0].lang_code)==0)
			{
				current_language=ID_LANGUAGE_SPANISH;
			}
			else if (strcmp("LA",languageINFO->Entries[0].lang_code)==0)
			{
				current_language=ID_LANGUAGE_LATIN_AMERICAN;
			}
			else if (strcmp("GR",languageINFO->Entries[0].lang_code)==0)
			{
				current_language=ID_LANGUAGE_GERMAN;
			}
			else if (strcmp("FR",languageINFO->Entries[0].lang_code)==0)
			{
				current_language=ID_LANGUAGE_FRENCH;
			}
			EnableMenuItem(hmenu,current_language,MF_BYCOMMAND | MF_ENABLED);
			tts_cur=0;
		}
		else
		{
			tts_us=TextToSpeechStartLang("US");
			if ((tts_us & TTS_LANG_ERROR)==0)
			{
				us_on=1;
				EnableMenuItem(hmenu,ID_LANGUAGE_ENGLISH,MF_BYCOMMAND | MF_ENABLED);
			}
			tts_uk=TextToSpeechStartLang("UK");
			if ((tts_uk & TTS_LANG_ERROR)==0)
			{
				uk_on=1;
				EnableMenuItem(hmenu,ID_LANGUAGE_BRITISH,MF_BYCOMMAND | MF_ENABLED);
			}
			tts_sp=TextToSpeechStartLang("SP");
			if ((tts_sp & TTS_LANG_ERROR)==0)
			{
				sp_on=1;
				EnableMenuItem(hmenu,ID_LANGUAGE_SPANISH,MF_BYCOMMAND | MF_ENABLED);
			}
			tts_gr=TextToSpeechStartLang("GR");
			if ((tts_gr & TTS_LANG_ERROR)==0)
			{
				gr_on=1;
				EnableMenuItem(hmenu,ID_LANGUAGE_GERMAN,MF_BYCOMMAND | MF_ENABLED);
			}
			tts_la=TextToSpeechStartLang("LA");
			if ((tts_la & TTS_LANG_ERROR)==0)
			{
				la_on=1;
				EnableMenuItem(hmenu,ID_LANGUAGE_LATIN_AMERICAN,MF_BYCOMMAND | MF_ENABLED);
			}
			tts_fr=TextToSpeechStartLang("FR");
			if ((tts_fr & TTS_LANG_ERROR)==0)
			{
				fr_on=1;
				EnableMenuItem(hmenu,ID_LANGUAGE_FRENCH,MF_BYCOMMAND | MF_ENABLED);
			}			
			current_lang_str[0]=languageINFO->Entries[0].lang_code[0];
			current_lang_str[1]=languageINFO->Entries[0].lang_code[0];
			current_lang_str[2]='\0';
			if (strcmp("US",languageINFO->Entries[0].lang_code)==0)
			{
				tts_cur=tts_us;
				current_language=ID_LANGUAGE_ENGLISH;
			}
			else if (strcmp("UK",languageINFO->Entries[0].lang_code)==0)
			{
				tts_cur=tts_uk;
				current_language=ID_LANGUAGE_BRITISH;
			}
			else if (strcmp("SP",languageINFO->Entries[0].lang_code)==0)
			{
				tts_cur=tts_sp;
				current_language=ID_LANGUAGE_SPANISH;
			}
			else if (strcmp("LA",languageINFO->Entries[0].lang_code)==0)
			{
				tts_cur=tts_la;
				current_language=ID_LANGUAGE_LATIN_AMERICAN;
			}
			else if (strcmp("GR",languageINFO->Entries[0].lang_code)==0)
			{
				tts_cur=tts_gr;
				current_language=ID_LANGUAGE_GERMAN;
			}
			else if (strcmp("FR",languageINFO->Entries[0].lang_code)==0)
			{
				tts_cur=tts_fr;
				current_language=ID_LANGUAGE_FRENCH;
			}
			
			TextToSpeechSelectLang(NULL,tts_cur);
		}
#endif

		mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 1);

		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_CHECKED;
		SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);

		if (mmStatus == MMSYSERR_NODRIVER)
		 {
		   MessageBox( hWnd, TEXT("No wave device present \n You can continue but windic won't speak"),
		   TEXT("Warning"), MB_OK );

		mmStatus=TextToSpeechStartupEx(&phTTS[tts_cur], 0, DO_NOT_USE_AUDIO_DEVICE, TTSCallbackRoutine, 1);

		   if ( mmStatus == MMSYSERR_ERROR)

		     {
		       MessageBox( hWnd, TEXT("Can't find DECtalk Dictionary \n dectalk.dic, Shutting down!"),
		      TEXT("windic ERROR"), MB_OK );
		       DestroyWindow( hWnd );
		       return FALSE;
		     }
		    if (mmStatus)
		     {
		       sprintf(szError, TEXT("Error Starting up TTS\n Error = %ld"), mmStatus );
		       MessageBox( hWnd, szError, "ERROR", MB_OK | MB_ICONSTOP );
		       DestroyWindow( hWnd );
		     }

			// ncs 06oct97 - error out of application if TextToSpeechStartUp Fails
			if (mmStatus)
			 {
			   MessageBox( hWnd,
						   TEXT("There is an ERROR in Initializing the Text To Speech System.\n\nExiting Application."),
						   TEXT("Windic cannot be started."), MB_OK | MB_ICONSTOP  );
			   return( -1 );
			 }
		  }
		 TextToSpeechUnloadUserDictionary( phTTS[tts_cur] );
		 TextToSpeechSpeak( phTTS[tts_cur], "[:phoneme arpa on]", TTS_FORCE );
		 break;

	case WM_SETFOCUS :
		SetFocus( hEdit );
		return FALSE ;

	//Reposition all child windows when moved or resized
	case WM_SIZE :

		MoveWindow( hEdit, 0, 21, LOWORD (lParam), HIWORD (lParam)-21L, TRUE);
		MoveWindow( hPlay, border, 0, pWidth, pHeight, TRUE);
		MoveWindow( hPrev, 2 * border + pWidth, 0, pWidth, pHeight, TRUE);
		MoveWindow( hNext, 3 * border + pWidth + pWidth, 0, pWidth, pHeight, TRUE);

		return( FALSE );

	case WM_DROPFILES:
		// If edit control has been modified ask to save file .
		if( SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ) )
		    if( AskToSave( hWnd, &OpenFileName, szFileTitle ) ) // returns FALSE is yes or no TRUE if CANCEL
			break;              // Cancel pressed
					    // Yes or No pressed
		DragQueryFile( (HANDLE) wParam, 0, szFile, sizeof( szFile ) );
		if( TextToSpeechReset( phTTS[tts_cur], TRUE ))
		    MessageBox( hWnd, TEXT("Error in TTS Reset"), TEXT("ERROR"), MB_OK | MB_ICONSTOP );

		if( MyReadFile( hWnd, szFile ))
		  {
		    DrawMenuBar( hWnd);

		    // reset the title in the title bar to reflect the
		    // new open file
		    SendMessage( hWnd, WM_SETTEXT, 0, (LPARAM)szFile );
		    InvalidateRect( hEdit, NULL, TRUE );
		    DrawMenuBar( hWnd );
		    DragFinish( (HANDLE)wParam );
		    SpeakText( hWnd );
		    return( FALSE );
		  }
		break;

	case WM_COMMAND:
		menuCommand(hWnd, wParam, lParam, szFileTitle, &OpenFileName );
		break;

	case WM_INITMENUPOPUP: /*Enable Paste menu item if clipboard data available*/
		HandleMenuPopup(wParam);
		return FALSE;

	case WM_GETMINMAXINFO:   //Limit minimum size of window
		lpmmiSize = (LPMINMAXINFO) lParam;
		lpmmiSize->ptMinTrackSize.x = (LONG)etWidth + border * 4 + 4 ;
		lpmmiSize->ptMinTrackSize.y = 300L;
		return FALSE;

	case WM_ERASEBKGND:
		hBrush = GetStockObject( LTGRAY_BRUSH );
		hOldBrush = SelectObject( (HDC)wParam, hBrush );
		GetClientRect( hWnd, &lprc );
		FillRect( (HDC)wParam, &lprc, hBrush );
		break;

       case WM_CTLCOLORSTATIC:
		hBrush = GetStockObject( LTGRAY_BRUSH );
		SetBkColor( (HDC) wParam, RGB ((BYTE)192, (BYTE)192, (BYTE)192));
		return( (LRESULT) hBrush );

/*      This section implements Right Mouse Button click functionality.
*       This action will cause reading selected text in the Edit
*       Control
*       Parent notify message is used to check for the right mouse button being activated.
*       The selected text is then spoken.
*/

	case WM_PARENTNOTIFY:
		if(LOWORD( wParam ) == WM_RBUTTONDOWN)
		  {
		    lSelect = SendMessage( hEdit, EM_GETSEL, (WPARAM)&dwStart, (LPARAM)&dwEnd );
		    if( HIWORD( lSelect ) == LOWORD( lSelect ))
		      {
			if( TextToSpeechSpeak( phTTS[tts_cur], TEXT("Nothing was selected."), TTS_FORCE ))
			   MessageBox( hWnd, TEXT("Error in TTS Speak"), "ERROR", MB_OK | MB_ICONSTOP );
			break;
		      }
		    else
		      {
			 //
			 // Figure out how much text we should speak
			 //
			 dwTextLen = SendMessage(hEdit, WM_GETTEXTLENGTH, 0, 0);
			 lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof(char));
			 SendMessage(hEdit, WM_GETTEXT, (WPARAM) dwTextLen+1, (LPARAM) lpEditText);
			 // testtesttest
			 lpSelBuf = (char *)malloc((1 + dwEnd - dwStart)  * sizeof(char));

			 //
			 // Copy the text from the screen into a buffer and then speak it.
			 //
			 strncpy((char*)lpSelBuf,(char*)&lpEditText[dwStart],(1 + dwEnd - dwStart));
			 lpSelBuf[dwEnd - dwStart] = '\0';

			 if( TextToSpeechSpeak( phTTS[tts_cur], lpSelBuf, TTS_FORCE ))
			    MessageBox( hWnd, TEXT("Error in TTS Speak"), TEXT("ERROR"), MB_OK | MB_ICONSTOP );

			 free( lpSelBuf );
			 free( lpEditText );
		      }
		  }
		break;

	default:
		if( uiMessage ==  uiID_Error_Msg )
		    switch (wParam)
		      {
		      case ERROR_IN_AUDIO_WRITE:
		      MessageBox(hWnd, TEXT("Error in Writing Audio"), TEXT("Async Error"),MB_OK | MB_ICONSTOP);
		      break;

		      case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
		      MessageBox(hWnd,
		       TEXT("The wave device is in use by another application \n DECtalk will wait until the device is free."),
		       TEXT("Warning"),MB_OK | MB_ICONSTOP);
		      break;

		      case ERROR_GETTING_DEVICE_CAPABILITIES:
		      MessageBox(hWnd, TEXT("Error Getting Audio Device Caps"), TEXT("Async Error"),MB_OK | MB_ICONSTOP);
		      break;

		      case ERROR_READING_DICTIONARY:
		      MessageBox(hWnd, TEXT("Error Reading Dictionary File \n dectalk.dic"), TEXT("Async Error"),MB_OK | MB_ICONSTOP);
		      break;

		      case ERROR_WRITING_FILE:
		      MessageBox(hWnd, TEXT("Error Writing File"), TEXT("Async Error"),MB_OK | MB_ICONSTOP);
		      break;

		      case ERROR_ALLOCATING_INDEX_MARK_MEMORY:
		      MessageBox(hWnd, TEXT("Error allocating Index Mark Memory"), TEXT("Async Error"),MB_OK | MB_ICONSTOP);
		      break;
		      }
		else

		  //
		  // Process "Find-Replace" Messages
		  //
		  if( uiMessage == uiMessage_Find_Replace )
		    {
		      lpfrText = ( LPFINDREPLACE ) lParam;

			  if( lpfrText->Flags & FR_DIALOGTERM )
			  hFind = NULL;

		      dwOffset = HIWORD( SendMessage( hEdit, EM_GETSEL, 0, 0L ));
		      if( lpfrText->Flags & FR_FINDNEXT )
			  if( !FindSearchString( hEdit, &dwOffset, lpfrText ))
			    {
			      sprintf( szError, TEXT("Search string \"%s\" was not found."), lpfrText->lpstrFindWhat );
			      MessageBox( hWnd, szError, TEXT("Find"), MB_OK | MB_ICONEXCLAMATION );
			      lpfrText->Flags = lpfrText->Flags & !FR_FINDNEXT;
			    }

		      return( 0 );
		    }
		return( DefWindowProc( hWnd, uiMessage, wParam, lParam ));
      }
    return( 0L );
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

LPVOID findHdib(INT id) {

    HRSRC       hDibRes, hDibResInfo;

    //
    // find our DIB in the resource
    //
    hDibResInfo = FindResource(NULL, MAKEINTRESOURCE(id), "DIB");
    if( hDibResInfo == NULL )
	return (LPVOID)ErrMsg("Line %d Error = %d\nFindResource",__LINE__-2,GetLastError());

    //
    // get a handle to the DIB
    //
    hDibRes = LoadResource(NULL, hDibResInfo);
    if( hDibRes == NULL )
	return (LPVOID)ErrMsg("Line %d Error = %d\nLoadResource",__LINE__,GetLastError());

    return( LockResource( hDibRes ));

}

/****************************************************************************
*
*    FUNCTION:  menuCommand( HWND, WPARAM, LPARAM, char *, LPOPENFILENAME )
*
*    PURPOSE:   handle all the pulldown menu commands.
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/

BOOL menuCommand( HWND hWnd, WPARAM wParam, LPARAM lParam,
		  char szFileTitle[], LPOPENFILENAME OpenFileName )
{
static  char szTextWindow[8192];
static  char * szCurrentSpeaker = " [:nh]";     /* Default speaker is Harry */
	CHAR szError[132];
	LPCTSTR lpszHelpFile = TEXT(DTALK_HELP_FILE_NAME);
	LPCTSTR lpszHelpTopic = TEXT("Dictionary calls, Windows");
	LPCTSTR lpszLog = TEXT("log.txt") ;
	DWORD dwTextLen;
	LPSTR lpEditText, lpSelBuf, lpXBuf, lpReplBuf;
	DWORD dwStart, dwEnd, dwFileLen ;
	DWORD  dwNumRead ;
	LONG lSelect  ;
	RECT lprc;
	//FILE    * lpLogFile ;
	MMRESULT mmStatus ;
	//LPOFSTRUCT lpOFSlog ;
	HANDLE   hLog ;
	HMENU hmenu;
	MENUITEMINFO menu_info;

    switch( LOWORD( wParam ))
      {
	case IDM_HELP:
		WinHelp( hWnd,
			 lpszHelpFile,
			 HELP_PARTIALKEY,
			 (DWORD)lpszHelpTopic );
		break;

	case IDM_ABOUT:

	    DialogBox( hInst,
		       MAKEINTRESOURCE(DLG_ABOUT),
		       hWnd,
		       (DLGPROC)AboutDlgProc );
	    break;

	case IDM_FILE_OPEN:
		// If edit control has been modified ask to save file .
		if( SendMessage(hEdit, EM_GETMODIFY, 0L, 0L ))
		    if( AskToSave( hWnd, OpenFileName, szFileTitle )) // returns FALSE is yes or no TRUE if CANCEL
		      break;                   // Cancel pressed
					       // Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );

		if( MyOpenFile( OpenFileName, hWnd, szFileSave, szFileTitleSave )  )
		{
		    strcpy( szFile, szFileSave );
		    strcpy( szFileTitle, szFileTitleSave );
		    DrawMenuBar( hWnd );
		    // reset the title in the title bar to reflect the
		    // new open file
			strcpy(szAppAndFile,szAppName);
			strcat(szAppAndFile," - ");
			strcat(szAppAndFile,szFile);
		    SendMessage( hWnd, WM_SETTEXT, 0, (LPARAM)szAppAndFile );
		    InvalidateRect( hWnd, NULL, TRUE );
		    bDictionarySaved = FALSE;
		}
		break;
	
 case IDM_FILE_CLOSE:	// tek 23 jul 96
				// If edit control has been modified ask to save file .
			if (SendMessage(hEdit, EM_GETMODIFY,0L,0L))

			  {
				if (AskToSave(hWnd, OpenFileName, szFileTitle ))        // returns FALSE is yes or no TRUE if CANCEL

				  break ;                   // Cancel pressed
											// Yes or No pressed
			  }
				SetWindowText( hWnd, szAppName) ;
				SendMessage(hEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
				SendMessage(hEdit,WM_CUT,0,0L);
				SendMessage(hEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
				return FALSE;


	case IDM_SAVE:
		GetWindowText( hWnd, szError, 30) ;
		if( strcmp( szError,  "windic\0") == 0)
		    if( SaveFileAs( OpenFileName, hWnd, szFileTitle ))
		      {
			SetWindowText( hWnd, OpenFileName->lpstrFile );
			DrawMenuBar( hWnd );
		      }
		    else
			return( FALSE );
		else
		    MySaveFile( hWnd, szFileTitle );

		return( FALSE );

	case IDM_SAVEAS:
		if( SaveFileAs ( OpenFileName, hWnd, szFileTitle ))
		  {
		    SetWindowText( hWnd, OpenFileName->lpstrFile );
		    DrawMenuBar( hWnd );
		  }
		 return( FALSE );

	case  IDM_COMPILE_DICTIONARY:
		// Set the compiledictionary boolean to true so that
		// the save function doesn't try to compile the dictionary.
		bDictionarySaved = TRUE;

	     /*   SendMessage( hWnd, WM_COMMAND, IDM_SAVE, 0L ); */

		GetWindowText( hWnd, szError, 30) ;
		if( strcmp( szError,  "windic\0") == 0)
		    if( SaveFileAs( OpenFileName, hWnd, szFileTitle ))
		      {
			SetWindowText( hWnd, OpenFileName->lpstrFile );
			DrawMenuBar( hWnd );
		      }
		    else
			return( FALSE );
		else
		    MySaveFile( hWnd, szFileTitle );

		// Reset the compiledictionary boolean to false, so
		// that we can save the user dictionary file.
		bDictionarySaved = FALSE;

		// Now compile the dictionary.
		CompileUserDic( hWnd, hEdit );
		break;

	case  IDM_EXIT:
		// If edit control has been modified ask to save file .
		if( SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ))
		  {
		    if( AskToSave( hWnd, OpenFileName, szFileTitle )) // returns FALSE is yes or no TRUE if CANCEL
		      break;                   // Cancel pressed
		      DestroyWindow( hWnd );
		    break;
		  }
		if( !bDictionarySaved && GetWindowTextLength( hEdit ) != 0 )
		  {
		    if( AskToCompile( hWnd, hEdit )) // returns FALSE is yes or no TRUE
		      break;                  // cancel pressed
		    DestroyWindow( hWnd );
		    break;
		  }
		DestroyWindow( hWnd );
		break;

	case ID_EDIT_CUT:
		SendMessage( hEdit, WM_CUT, 0, 0L );
		break;

	case ID_EDIT_COPY:
		SendMessage( hEdit, WM_COPY, 0, 0L );
		break;

	case ID_EDIT_PASTE:
		SendMessage( hEdit, WM_PASTE, 0, 0L );
		break;

	case ID_EDIT_CLEAR:
		SendMessage( hEdit, WM_CLEAR, 0, 0L );
		break;

	case ID_EDIT_SELECT_ALL:
		SendMessage( hEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
		SetFocus( hEdit );
		break;

	case ID_EDIT_UNDO:
		SendMessage( hEdit, EM_UNDO, 0L, 0L );
		break;

	case ID_FIND:
		lSelect = SendMessage( hEdit, EM_GETSEL, (WPARAM)&dwStart, (LPARAM)&dwEnd );
		if( HIWORD( lSelect ) != LOWORD( lSelect ))
		  {
		    dwTextLen = SendMessage( hEdit, WM_GETTEXTLENGTH, 0, 0);
		    lpEditText = (char *)malloc((1+dwTextLen) * sizeof( char ));
		    SendMessage(hEdit, WM_GETTEXT, (WPARAM) dwTextLen+1, (LPARAM)lpEditText);
		    strncpy(szFindText, (char *)&lpEditText[dwStart], dwEnd - dwStart );
		    szFindText[dwEnd - dwStart] = '\0';
		    free( lpEditText );
		  }
		hFind = FindDialog( hWnd );
		GetClientRect( hFind, &lprc );
		MoveWindow( hFind, 200, 0, lprc.right + 10, lprc.bottom + 20, TRUE );
		break;

	case ID_PREV:
		SpeakLine( hWnd, -1 );
		break;

	case ID_NEXT:
		SpeakLine( hWnd, +1 );
		break;

	case ID_PLAY :
//              SendMessage(hEdit, WM_GETTEXT, sizeof(szTextWindow), (LPARAM)szTextWindow);
		lSelect = SendMessage( hEdit, EM_GETSEL, (WPARAM)&dwStart, (LPARAM)&dwEnd );
		if( HIWORD (lSelect) == LOWORD (lSelect))
		    SpeakLine( hWnd, 0 );
		else
		  {
		    dwTextLen = SendMessage(hEdit, WM_GETTEXTLENGTH, 0, 0);
		    lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof(char));
		    SendMessage(hEdit, WM_GETTEXT, (WPARAM) dwTextLen+1, (LPARAM) lpEditText);
		    lpSelBuf = (char *)malloc((1 + dwEnd - dwStart)  * sizeof(char));

		    //
		    // Copy in the text to speak from the window, and then speak it.
		    //
		    strncpy((char*)lpSelBuf,(char*)&lpEditText[dwStart],(1 + dwEnd - dwStart));
		    lpSelBuf[dwEnd - dwStart] = '\0';
		    SpeakPronouncation( hWnd, lpSelBuf );

		    //
		    // Clean up memory
		    //
		    free( lpSelBuf );
		    free( lpEditText );
		  }
		  SetFocus( hEdit );
		break;

	case ID_XLATE :
		lSelect = SendMessage( hEdit, EM_GETSEL, (WPARAM)&dwStart, (LPARAM)&dwEnd );
		if( HIWORD (lSelect) == LOWORD (lSelect))
		    TextToSpeechSpeak(phTTS[tts_cur],"Nothing is highlighted!", TTS_FORCE);
		else
		  {
			/* GL 03/24/1997 for BATS#305 and 311 make sure the string is terminated
			   properly */
			int i;

			dwTextLen = SendMessage(hEdit, WM_GETTEXTLENGTH, 0, 0);
		    lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof(char));
		    SendMessage(hEdit, WM_GETTEXT, (WPARAM) dwTextLen+1, (LPARAM) lpEditText);
		    lpSelBuf = (char *)malloc((1 + dwEnd - dwStart)  * sizeof(char));

		    //lpXBuf = (char *)malloc((1 + dwEnd - dwStart + 40)   * sizeof(char));
		    lpXBuf = (char *)malloc((1024) * sizeof(char)) ;
		    lpReplBuf = ( char *)malloc((1024) * sizeof(char)) ;
		    lpSelBuf[0]='\0';
		    lpXBuf[0]='\0';
		    lpReplBuf[0]='\0';
		    
		    // Copy in the text to translate from the window.
		    strncpy((char*)lpSelBuf,(char*)&lpEditText[dwStart],(1 + dwEnd - dwStart));
		    lpSelBuf[dwEnd - dwStart] = '\0';
		    sprintf(lpXBuf,"[:log phoneme on]%s[:log phoneme off]", lpSelBuf);

		    mmStatus = TextToSpeechSpeak( phTTS[tts_cur], lpXBuf , TTS_FORCE );
		    if( mmStatus )
		    {
				sprintf( szError, "Error in TTS Speak = %d", mmStatus );
				MessageBox( hWnd, szError, "TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
		    }
			
			mmStatus =TextToSpeechSync(phTTS[tts_cur]);
		    if( mmStatus )
		    {
				sprintf( szError, "Error in TTS Speak = %d", mmStatus );
				MessageBox( hWnd, szError, "TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
		    }

		    hLog = CreateFile(lpszLog, GENERIC_READ, FILE_SHARE_READ,
		    NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL );
		    dwFileLen = GetFileSize(hLog, NULL);

		    ReadFile(hLog, (LPVOID)lpXBuf, dwFileLen, &dwNumRead, NULL);

			// We need to place the null character four places from the end of
			// the lpXBuf array.  Four characters are forced in when the text
			// typed in from the window is converted to phonemic codes.
			// It seems that the pipe flush forces are getting appended during
			// the text conversion.
			// 2/18/97 ncs
			/* GL 03/24/1997 for BATS#305 and 311,  make sure the string is terminated
			   properly */
			/*lpXBuf[dwNumRead-4]='\0';*/
			for (i=dwNumRead-5; i>0; --i)
			{
				if (lpXBuf[i] != ' ')
				{ 
					lpXBuf[i+1] = '\0';
					break;
				}
			}
		    strcpy (lpReplBuf,"[");
			// CAB 11/09/2000 Added temporary fix to display right
		    for (i=0; i < strlen(lpXBuf); i++)
			{
				if (lpXBuf[i] == '.')
					lpXBuf[++i]='\0';
			}
			strcat(lpReplBuf+1, lpXBuf );
		    strcat(lpReplBuf, "]");
		    SendMessage ( hEdit, EM_REPLACESEL, (WPARAM)0, (LPARAM)lpReplBuf);
		    CloseHandle(hLog);
		    DeleteFile(lpszLog);
		    //
		    // Clean up memory
		    //
		    free( lpXBuf );
		    free( lpReplBuf );
		    free( lpSelBuf );
		    free( lpEditText );
		  }
		  SetFocus( hEdit );
		break;

#ifndef WINDIC_C_STATIC
	case ID_LANGUAGE_ENGLISH:
		if (current_language==ID_LANGUAGE_ENGLISH)
			break;
		hmenu=GetMenu(hWnd);
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_UNCHECKED;
		SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);

		// If edit control has been modified ask to save file .
		if( SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ))
		{
			AskToSave( hWnd, OpenFileName, szFileTitle); // returns FALSE is yes or no TRUE if CANCEL
		}
		else
		{
			if( !bDictionarySaved && GetWindowTextLength( hEdit ) != 0 )
			{
				AskToCompile( hWnd, hEdit ); // returns FALSE is yes or no TRUE
			}
		}
		SetWindowText( hWnd, szAppName) ;
		SendMessage(hEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
		SendMessage(hEdit,WM_CUT,0,0L);
		SendMessage(hEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
		TextToSpeechShutdown(phTTS[tts_cur]);
		phTTS[tts_cur]=NULL;
		tts_cur=tts_us;
		current_lang_str[0]='U';
		current_lang_str[1]='S';
		current_lang_str[2]='\0';
		current_language=ID_LANGUAGE_ENGLISH;
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
		TextToSpeechSpeak( phTTS[tts_cur], "[:phoneme arpa on]", TTS_FORCE );
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_CHECKED;
		SetMenuItemInfo(hmenu,ID_LANGUAGE_ENGLISH,FALSE,&menu_info);
		break;
		
	case ID_LANGUAGE_SPANISH:
		if (current_language==ID_LANGUAGE_SPANISH)
			break;
		hmenu=GetMenu(hWnd);
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_UNCHECKED;
		SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
		// If edit control has been modified ask to save file .
		if( SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ))
		{
			AskToSave( hWnd, OpenFileName, szFileTitle ); // returns FALSE is yes or no TRUE if CANCEL
		}
		else
		{
			if( !bDictionarySaved && GetWindowTextLength( hEdit ) != 0 )
			{
				AskToCompile( hWnd, hEdit ); // returns FALSE is yes or no TRUE
			}
		}
		SetWindowText( hWnd, szAppName) ;
		SendMessage(hEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
		SendMessage(hEdit,WM_CUT,0,0L);
		SendMessage(hEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
		TextToSpeechShutdown(phTTS[tts_cur]);
		phTTS[tts_cur]=NULL;
		tts_cur=tts_sp;
		current_lang_str[0]='S';
		current_lang_str[1]='P';
		current_lang_str[2]='\0';
		current_language=ID_LANGUAGE_SPANISH;
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
		TextToSpeechSpeak( phTTS[tts_cur], "[:phoneme arpa on]", TTS_FORCE );
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_CHECKED;
		SetMenuItemInfo(hmenu,ID_LANGUAGE_SPANISH,FALSE,&menu_info);
		break;
		
	case ID_LANGUAGE_GERMAN:
		if (current_language==ID_LANGUAGE_GERMAN)
			break;
		hmenu=GetMenu(hWnd);
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_UNCHECKED;
		SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
		// If edit control has been modified ask to save file .
		if( SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ))
		{
			AskToSave( hWnd, OpenFileName, szFileTitle ); // returns FALSE is yes or no TRUE if CANCEL
		}
		else
		{
			if( !bDictionarySaved && GetWindowTextLength( hEdit ) != 0 )
			{
				AskToCompile( hWnd, hEdit );// returns FALSE is yes or no TRUE
			}
		}
		SetWindowText( hWnd, szAppName) ;
		SendMessage(hEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
		SendMessage(hEdit,WM_CUT,0,0L);
		SendMessage(hEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
		TextToSpeechShutdown(phTTS[tts_cur]);
		phTTS[tts_cur]=NULL;
		tts_cur=tts_gr;
		current_lang_str[0]='G';
		current_lang_str[1]='R';
		current_lang_str[2]='\0';
		current_language=ID_LANGUAGE_GERMAN;
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
		TextToSpeechSpeak( phTTS[tts_cur], "[:phoneme arpa on]", TTS_FORCE );
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_CHECKED;
		SetMenuItemInfo(hmenu,ID_LANGUAGE_GERMAN,FALSE,&menu_info);
		break;
		
	case ID_LANGUAGE_LATIN_AMERICAN:
		if (current_language==ID_LANGUAGE_LATIN_AMERICAN)
			break;
		hmenu=GetMenu(hWnd);
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_UNCHECKED;
		SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
		// If edit control has been modified ask to save file .
		if( SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ))
		{
			AskToSave( hWnd, OpenFileName, szFileTitle ); // returns FALSE is yes or no TRUE if CANCEL
		}
		else
		{
			if( !bDictionarySaved && GetWindowTextLength( hEdit ) != 0 )
			{
				AskToCompile( hWnd, hEdit ); // returns FALSE is yes or no TRUE
			}
		}
		SetWindowText( hWnd, szAppName) ;
		SendMessage(hEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
		SendMessage(hEdit,WM_CUT,0,0L);
		SendMessage(hEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
		TextToSpeechShutdown(phTTS[tts_cur]);
		phTTS[tts_cur]=NULL;
		tts_cur=tts_la;
		current_lang_str[0]='L';
		current_lang_str[1]='A';
		current_lang_str[2]='\0';
		current_language=ID_LANGUAGE_LATIN_AMERICAN;
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
		TextToSpeechSpeak( phTTS[tts_cur], "[:phoneme arpa on]", TTS_FORCE );
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_CHECKED;
		SetMenuItemInfo(hmenu,ID_LANGUAGE_LATIN_AMERICAN,FALSE,&menu_info);
		break;
		
	case ID_LANGUAGE_BRITISH:
		if (current_language==ID_LANGUAGE_BRITISH)
			break;
		hmenu=GetMenu(hWnd);
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_UNCHECKED;
		SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
		// If edit control has been modified ask to save file .
		if( SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ))
		{
			AskToSave( hWnd, OpenFileName, szFileTitle );// returns FALSE is yes or no TRUE if CANCEL
		}
		else
		{
			if( !bDictionarySaved && GetWindowTextLength( hEdit ) != 0 )
			{
				AskToCompile( hWnd, hEdit );// returns FALSE is yes or no TRUE
			}
		}
		SetWindowText( hWnd, szAppName) ;
		SendMessage(hEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
		SendMessage(hEdit,WM_CUT,0,0L);
		SendMessage(hEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
		TextToSpeechShutdown(phTTS[tts_cur]);
		phTTS[tts_cur]=NULL;
		tts_cur=tts_uk;
		current_lang_str[0]='U';
		current_lang_str[1]='K';
		current_lang_str[2]='\0';
		current_language=ID_LANGUAGE_BRITISH;
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
		TextToSpeechSpeak( phTTS[tts_cur], "[:phoneme arpa on]", TTS_FORCE );
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_CHECKED;
		SetMenuItemInfo(hmenu,ID_LANGUAGE_BRITISH,FALSE,&menu_info);
		break;
	case ID_LANGUAGE_FRENCH:
		if (current_language==ID_LANGUAGE_FRENCH)
			break;
		hmenu=GetMenu(hWnd);
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_UNCHECKED;
		SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
		// If edit control has been modified ask to save file .
		if( SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ))
		{
			AskToSave( hWnd, OpenFileName, szFileTitle ); // returns FALSE is yes or no TRUE if CANCEL
		}
		else
		{
			if( !bDictionarySaved && GetWindowTextLength( hEdit ) != 0 )
			{
				AskToCompile( hWnd, hEdit );// returns FALSE is yes or no TRUE
			}
		}
		SetWindowText( hWnd, szAppName) ;
		SendMessage(hEdit, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
		SendMessage(hEdit,WM_CUT,0,0L);
		SendMessage(hEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
		TextToSpeechShutdown(phTTS[tts_cur]);
		phTTS[tts_cur]=NULL;
		tts_cur=tts_fr;
		current_lang_str[0]='F';
		current_lang_str[1]='R';
		current_lang_str[2]='\0';
		current_language=ID_LANGUAGE_FRENCH;
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
		TextToSpeechSpeak( phTTS[tts_cur], "[:phoneme arpa on]", TTS_FORCE );
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_CHECKED;
		SetMenuItemInfo(hmenu,ID_LANGUAGE_FRENCH,FALSE,&menu_info);
		break;
		
#endif /* #ifndef WINDIC_C_STATIC */		
	default:
		break;
      }
    return( FALSE );
}


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

HWND FindDialog( HWND hWnd )
{
static FINDREPLACE frText;

    frText.lStructSize          = sizeof( FINDREPLACE );
    frText.hwndOwner            = hWnd;
    frText.hInstance            = NULL;
    frText.Flags                = FR_DOWN | ! FR_WHOLEWORD | ! FR_MATCHCASE;
    frText.lpstrFindWhat        = szFindText;
    frText.lpstrReplaceWith     = NULL;
    frText.wFindWhatLen         = sizeof( szFindText );
    frText.wReplaceWithLen      = 0;
    frText.lCustData            = 0;
    frText.lpfnHook             = NULL;
    frText.lpTemplateName       = NULL;

    return( FindText( &frText ));
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

BOOL FindNextText( HWND hSearch, DWORD *lpdwSearchOffset )
{
    FINDREPLACE frText;

    frText.lpstrFindWhat = szFindText;

    return( FindSearchString( hSearch, lpdwSearchOffset, &frText ));
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
	lpstrDoc = malloc(iWinTextLen+1);	// allocate space.
	if (lpstrDoc == NULL)
		{
		MessageBox(hSearch,"Insufficient memory for search buffer!",
					"Error", MB_OK|MB_ICONSTOP);
		return FALSE;
		}
	// get the actual text..
	iWinTextLen = GetWindowText(hSearch,lpstrDoc,iWinTextLen);
	// might be zero on an empty window..
	if (iWinTextLen == 0)
		{
		dwPos = GetLastError();
		return FALSE;
		}


    //
    // Set the string for up/down searching, make a copy of the strings we search
    // so that the original string on the screen doesn't get munged.
    //
    lpstrFind = ( lpfr->Flags & FR_DOWN ) ? _strdup( lpfr->lpstrFindWhat )
					  : _strrev( _strdup( lpfr->lpstrFindWhat ) );

    lpstrDoc1 = (lpfr->Flags & FR_DOWN ) ? ( lpstrDoc ) : _strrev( lpstrDoc );

    *lpdwSearchOffset = (lpfr->Flags & FR_DOWN ) ? *lpdwSearchOffset
				: strlen( lpstrDoc1 ) - *lpdwSearchOffset + 1;

    //
    // Search the document for the find string
    //
    while( bFind )
      {
	if( lpfr->Flags & FR_MATCHCASE )
	    lpstrPos = strstr( lpstrDoc1 + *lpdwSearchOffset, lpstrFind );
	else
	    lpstrPos = strstr( CharLower( lpstrDoc1 ) + *lpdwSearchOffset, CharLower( lpstrFind ) );

	if( lpfr->Flags & FR_WHOLEWORD )
	  {
	    //
	    // If there are no words matched, then quit looking for one
	    //
	    if( lpstrPos == NULL )
		bFind = FALSE;
	    else
	    //
	    // if the string was matched, let's see if the next character will make
	    // an exact match.  Note, any letter in the alphabet immediately after the last
	    // character matched will cause this exact match to fail.
	    //
	    if( !strspn(( lpstrPos + strlen( lpstrFind )), szAlphabet ))
		bFind = FALSE;
	    else
	      {
		//
		// Find the current position in the document and the new start offset
		//
		dwPos = lpstrPos - lpstrDoc1;
		*lpdwSearchOffset = dwPos + strlen( lpstrFind );
	      }
	  }
	else
	    bFind = FALSE;
      }


	//
    // highlight the text, or
    // Return an error code if the string cannot be found
    //
    if( lpstrPos != NULL )
		{

		//
		// Find the current position in the document and the new start offset
		// Don't forget, we might have done this in the UP direction.
		//
		dwPos = ( lpfr->Flags & FR_DOWN ) ? lpstrPos - lpstrDoc1
			: strlen(lpstrDoc1) - (lpstrPos - lpstrDoc1) - strlen( lpstrFind );
		*lpdwSearchOffset = dwPos + strlen( lpfr->lpstrFindWhat );

		//
		// Select the found text
		//
		SendMessage( hSearch, EM_SETSEL, dwPos, *lpdwSearchOffset );
		SendMessage( hSearch, EM_SCROLLCARET, 0L, 0L );

		SetFocus( hFind );
		free(lpstrDoc);
		return( TRUE );
		}
	else
		{
		free(lpstrDoc);
		return( FALSE );
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

void SpeakLine( HANDLE hWnd, int iOffset )
{
    DWORD dwLineIndex;
    DWORD dwTextLen;
    int   dwLine;
    int   dwCount;
    LPSTR lpEditText;
    MMRESULT mmStatus;
    static char szError[128];

    dwLine = SendMessage( hEdit, EM_LINEFROMCHAR, (WPARAM) -1, 0 ) + iOffset;
    dwCount = SendMessage( hEdit, EM_GETLINECOUNT, 0, 0 );

    if(( dwLine >= dwCount ) || ( dwLine < 0 ))
      {
	mmStatus = TextToSpeechSpeak( phTTS[tts_cur], "No more words to speak.", TTS_FORCE );
	if( mmStatus )
	  {
	    sprintf( szError, "Error in TTS Speak = %d", mmStatus );
	    MessageBox( hWnd, szError, "TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
	  }
	SetFocus( hEdit );
// MessageBox( hWnd, "Attempting to go beyond list of words.", "Warning", MB_OK | MB_ICONEXCLAMATION );
	return;
      }
    dwLineIndex = SendMessage( hEdit, EM_LINEINDEX, (WPARAM) dwLine, 0 );
    dwTextLen = SendMessage( hEdit, EM_LINELENGTH, (WPARAM) dwLineIndex, 0 );

    //
    // If there is a blank line, don't speak it.
    //
    if( dwTextLen != 0 )
      {
	lpEditText = (char *)malloc((1 + dwTextLen) * sizeof(char));

	_itoa( dwTextLen+1, &lpEditText[0], 10 );
	SendMessage( hEdit, EM_GETLINE, (WPARAM)dwLine, (LPARAM)(LPCSTR)lpEditText );
	lpEditText[dwTextLen]='\0';

	SpeakPronouncation( hWnd, lpEditText );

	free( lpEditText );
      }

    //
    // Now move the caret to reflect our currect position
    //
    SetFocus( hEdit );
    if( iOffset == 1 )
	{
	  SendMessage( hEdit, WM_KEYDOWN, (INT) VK_DOWN,  1L);
	  SendMessage( hEdit, WM_KEYUP,   (INT) VK_DOWN,  0xC000);
	}
    else if( iOffset == -1 )
	{
	  SendMessage( hEdit, WM_KEYDOWN, (INT) VK_UP, 1L);
	  SendMessage( hEdit, WM_KEYUP,   (INT) VK_UP, 0xC000);
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

BOOL SpeakText( HANDLE hWnd )
{
    DWORD      dwTextLen;
    LPSTR      lpEditText;
    MMRESULT   mmStatus;
    char       szError[32];

    //
    // Figure how much text we should actually speak, and allocate enough memory.
    //
    dwTextLen = SendMessage( hEdit, WM_GETTEXTLENGTH, 0, 0 );
    lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof( char ));

    //
    // Get the text from the screen and store it into the lpEditText buffer.
    //
    SendMessage( hEdit, WM_GETTEXT,(WPARAM) dwTextLen +1, (LPARAM) lpEditText);

    //
    // Now just say the text.
    //
    mmStatus = TextToSpeechSpeak( phTTS[tts_cur], lpEditText, TTS_FORCE );
    if( mmStatus )
      {
	sprintf( szError, "Error in TTS Speak = %d", mmStatus );
	MessageBox( hWnd, szError, TEXT("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP );
	return( TRUE );
      }

    //
    // Clean up and leave.
    //
    free( lpEditText );
    return( FALSE );
}

/****************************************************************************
*
*    FUNCTION:  SpeakPronouncation( HANDLE hWnd, char * szSelBuf )
*
*    PURPOSE:   This will filter out from the dictionary the words and only
*               pronounce the phonetic spellings of the words.
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/

BOOL SpeakPronouncation( HANDLE hWnd, char *szSelBuf )
{

    DWORD       dwTextLen;
    LPSTR       lpEditText;
    LPSTR       lpPhonemeText;
    MMRESULT    mmStatus;
    char        szError[32];
    char        *token;

    if( szSelBuf == NULL )
      {
	//
	// Find out how much sext is to be spoken and allocate enough memory.
	//
	dwTextLen = SendMessage( hEdit, WM_GETTEXTLENGTH, 0, 0 );
	lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof( char ));
	lpPhonemeText = (char *)malloc((1 + dwTextLen) * sizeof( char ));

	SendMessage( hEdit, WM_GETTEXT,(WPARAM) dwTextLen +1, (LPARAM) lpEditText);
      }
    else
      {
	lpEditText = szSelBuf;
	/* GL 03/25/1997 BATS#315 reserve one more byte */
	lpPhonemeText = (char *)malloc(sizeof( char ) * (strlen( szSelBuf )+1));
      }

    sprintf( lpPhonemeText, " " );

    //
    // Note, we only want to speak the phonemes and not the spelled out words,
    // so we will need to parse each dictionary entry and store the desired words
    // in lpPhonemeText.
    //
    token = strtok( lpEditText, "[" );
    while( token != NULL )
      {
	token = strtok( (char *) NULL, "]\n");
	if( token != NULL )
	  {
	    strcat( lpPhonemeText, "[" );
	    strcat( lpPhonemeText, token );
	    strcat( lpPhonemeText, "] " );
	    token = strtok( (char *) NULL, "[");
	  }
      }

    //
    // Now let's hear these phonemes.
    //
    if(( strlen( lpPhonemeText ) == 1 ) && ( szSelBuf != NULL ))
	strcpy( lpPhonemeText, szSelBuf );

    mmStatus = TextToSpeechSpeak( phTTS[tts_cur], lpPhonemeText, TTS_FORCE );
    if( mmStatus )
      {
	sprintf( szError, "Error in TTS Speak = %d", mmStatus );
	MessageBox( hWnd, szError, TEXT("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP );
      }

    //
    //  Be a good doo-bee and clean up any unwanted memory.
    //
	/* GL 03/25/1997 BATS#315 remove the extra free statement */
    //free( lpEditText );
    free( lpPhonemeText );

    return( FALSE );
}


/****************************************************************************
*
*    FUNCTION: MyOpenFile( LPOPENFILENAME OpenFileName, HANDLE hWnd,
*                          char szFile[], char szFileTitle[] )
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

INT MyOpenFile( LPOPENFILENAME OpenFileName,
		HANDLE hWnd,
		char szFile[],
		char szFileTitle[] )
{

    DefineOpenFileName( hWnd, OpenFileName, szFile, szFileTitle, "Open a File" );
    OpenFileName->Flags =  OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY;

    if( GetOpenFileName( OpenFileName ))
      {
	if( !MyReadFile( hWnd, OpenFileName->lpstrFile ))
	    return( TRUE );
      }
    else
      {
	ProcessCDError( CommDlgExtendedError(), hWnd );
	return( TRUE );
      }
  return( FALSE );
}


// from speak.c 23 jun 96  (...tek)
int MyReadFile( HWND hWnd, char * szReadFile )
{

	//MVP:06/20/96
	// On windows'95 File size >64k bug related code is added.
	// File size of 0 bytes causes FileMapping APIs Fail.
	// A Message box saying Invalid file is added.
	DWORD dwFileSizeHigh =0;
    DWORD dwFileSizeLow = 0;
	DWORD dwError;
	CHAR szErrMsg[80];

	char* pFileDataPlusOne;				// Create a null terminated copy

	// open the file

	hFile = CreateFile( szReadFile, GENERIC_READ, FILE_SHARE_READ, (LPSECURITY_ATTRIBUTES)NULL,
						OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, (HANDLE)NULL ) ;

	if ( hFile == INVALID_HANDLE_VALUE ) {
		MessageBox( hWnd, TEXT("File open failed."), NULL, MB_OK );
		return( TRUE );
	}

	//MVP:06/20/96 :Check for file size for 64K on Windows'95
	dwFileSizeLow = GetFileSize(hFile, &dwFileSizeHigh);
	if(dwFileSizeLow ==	0xFFFFFFFF &&
		(dwError = GetLastError()) != NO_ERROR)
	{
		MessageBox(hWnd, TEXT("GetFileSize has Failed"), TEXT("Error"), MB_OK|MB_ICONSTOP);
		return FALSE;
	}

	if(bWin95)
	{
		if( dwFileSizeLow > 0xFFFF || dwFileSizeHigh)
		{
			MessageBox(hWnd, TEXT("This app cannot load files more than 64K size into Dictionary Editor under Windows 95") , TEXT("Information"), MB_OK | MB_ICONSTOP);
			return FALSE;
		}
	}

	hFileMap = CreateFileMapping(hFile, NULL, PAGE_READONLY, 0, 0, NULL);
	if(!hFileMap)
	{
		//MVP :06/20/96 :File size of 0 bytes creates an ERROR.
		// Reports that Information below.
		//dwError = GetLastError();
		//sprintf(szErrMsg,"The Error code returned by CreateFileMapping is %d\n",dwError);
		//MessageBox( hWnd, szErrMsg, "ERROR", MB_OK | MB_ICONSTOP );
		sprintf(szErrMsg,"Invalid File :%s",szReadFile);
		MessageBox( hWnd, szErrMsg, TEXT("ERROR"), MB_OK | MB_ICONSTOP );
		return FALSE ;
	}
	pFileData = MapViewOfFile(hFileMap, FILE_MAP_READ, 0, 0, 0);
	if(!pFileData)
	{
		MessageBox( hWnd, TEXT("MapViewOfFile in MyReadFile Failed"), TEXT("ERROR"), MB_OK | MB_ICONSTOP );
		return FALSE ;
	}

	if ((pFileDataPlusOne = malloc(dwFileSizeLow+1)) == NULL)
	{
		MessageBox(hWnd, TEXT("Insufficient memory to load file"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return FALSE;
	}

	memcpy(pFileDataPlusOne, pFileData, dwFileSizeLow);
	pFileDataPlusOne[dwFileSizeLow] = '\0';

	SendMessage(hEdit, WM_SETTEXT, 0, (LPARAM)pFileDataPlusOne);
	free(pFileDataPlusOne);

	if (! UnmapViewOfFile ( pFileData ))
	{
	  MessageBox( hWnd, TEXT("File Unmap in MyReadFile Failed"), TEXT("ERROR"), MB_OK | MB_ICONSTOP );
	  return FALSE ;
	}
	CloseHandle(hFileMap);
	CloseHandle(hFile);

	return FALSE;


	//dwFileSize = GetFileSize( hFile, NULL);
	//sprintf(szBuf,"file size is %d", dwFileSize);
	// MessageBox( hWnd, TEXT(szBuf), TEXT("INFO"), MB_OK );

	// read it's contents into a buffer

}

/****************************************************************************
*
*    FUNCTION: AskToSave(HWND hWnd, LPOPENFILENAME OpenFileName, char szFileTitle[] )
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
BOOL AskToSave( HWND hWnd, LPOPENFILENAME OpenFileName, char szFileTitle[] )
{
    int iResponse;
    char szBuf[128];

    iResponse = MessageBox(hWnd,
	     TEXT("The Text in this file has changed.\n\n Do you wish to save the changes?"),
	     TEXT("windic"),  MB_YESNOCANCEL | MB_ICONEXCLAMATION );

    switch( iResponse )
      {
	case IDYES:
		GetWindowText( hWnd, szBuf, 30);
		if( strcmp( szBuf, "windic\0" ) == 0)
		  {
		    if( !SaveFileAs( OpenFileName, hWnd, szFileTitle ))
			return( TRUE );
		    return( FALSE );
		  }
		else
		  {
		    MySaveFile( hWnd, szFileTitle );
		    return( FALSE );
		  }

	case IDCANCEL:
		 return TRUE;

	case IDNO:
		 return FALSE;
      }
}

BOOL AskToCompile( HWND hWnd, HWND hEdit )
{
    int iResponse;

    iResponse = MessageBox(hWnd,
	     TEXT("A dictionary file has not been created.\n\n Do you wish to create one now?"),
	     TEXT("windic"),  MB_YESNOCANCEL | MB_ICONEXCLAMATION );

    switch( iResponse )
      {
	case IDYES:
		 CompileUserDic( hWnd, hEdit );
		 return FALSE;
	case IDCANCEL:
		 return TRUE;

	case IDNO:
		 return FALSE;
      }
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: AboutDlgProc                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: October 5, 1994                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*      This dialog procedure is for the about box.                   */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd      Handle to window.                                     */
/*                                                                    */
/*    uiMsg     Message being sent to the window.                     */
/*                                                                    */
/*    wParam    Specific argument to message.                         */
/*                                                                    */
/*    lParam    Specific argument to message.                         */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    The return value is specific to the message that was            */
/*    received. It is FALSE if this dialog procedure does not handle  */
/*    a message (an exception is the WM_INITDIALOG message where      */
/*    TRUE is always returned).                                       */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define MAX_STRING 512

BOOL APIENTRY AboutDlgProc( HWND hWnd,
			    UINT uiMsg,
			    WPARAM wParam,
			    LPARAM lParam )
{
  HWND hDlgItem;
  LPSTR pString;
  char szInstaller[MAX_STRING];
  char szCompany[MAX_STRING];

  switch( uiMsg )
  {
  case WM_INITDIALOG:

    /******************************************************************/
    /*  Display some OS version information.                          */
    /******************************************************************/

    pString = (LPSTR)malloc( MAX_STRING * sizeof(CHAR));

    if ( pString == NULL )
    {
      MessageBox( hWnd, TEXT("Out of Memory"), TEXT("Error"), MB_OK );
      return( TRUE );
    }

    AppGetWindowsVersion( pString, NULL );
    hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_VERSION_OS );
    SetWindowText( hDlgItem, pString );

    AppGetWindowsVersion( NULL, pString );
    hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_VERSION_PLATFORM );
    SetWindowText( hDlgItem, pString );

    /******************************************************************/
    /*  Get the installer name and company.                           */
    /******************************************************************/

    GetInstallationInfo( szInstaller, szCompany );

    AppGetWindowsVersion( NULL, pString );
    hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_REG_INSTALLER );
    SetWindowText( hDlgItem, szInstaller );

    AppGetWindowsVersion( NULL, pString );
    hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_REG_COMPANY );
    SetWindowText( hDlgItem, szCompany );

    free( pString );

    return( TRUE );

  case WM_COMMAND:

    if ( LOWORD( wParam ) == IDOK || LOWORD( wParam ) == IDCANCEL )
    {
      EndDialog( hWnd, ( IDOK == LOWORD( wParam )));
    }
    break;

  default:

    break;
  }
  return( FALSE );
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
    CHAR ach[128];

    MessageBox (NULL, ach, NULL, MB_OK|MB_ICONEXCLAMATION|MB_APPLMODAL);
    return( FALSE );
}

/****************************************************************************
*
*    FUNCTION: MySaveFile(HWND)
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
BOOL MySaveFile( HWND hWnd, char szFileTitle[] )
{
	LRESULT lResult;
static  HANDLE hFileMap;
static  PBYTE pFileData;
static  HANDLE hFile = 0;
	DWORD i;

    //
    // If the file extension is a .dic, then the file can
    // not save successfully.  This is because the compileUserDictionary
    // function will overwrite the text (.tab) file into a .dic file and
    // erase all the text.
    //
    i = strcspn( szFile, "." );
    if( strncmp( CharLower(&szFile[i+1]),"dic", 3 ) == 0)
      {
	MessageBox( hWnd, TEXT("Filename can not have a .dic extension.\n\nFile not saved."),
			TEXT("Filename Error"), MB_ICONEXCLAMATION | MB_OK );
	return( FALSE );
      }

    hFile = CreateFile( szFile,
		      GENERIC_READ | GENERIC_WRITE,
		      FILE_SHARE_READ,
		      (LPSECURITY_ATTRIBUTES)NULL,
		      CREATE_ALWAYS,
		      FILE_ATTRIBUTE_NORMAL,
		      (HANDLE)NULL );

    if( hFile == INVALID_HANDLE_VALUE )
      {
	MessageBox( hWnd, TEXT("File open failed."), NULL, MB_OK );
	return( FALSE );
      }

    hFileMap = CreateFileMapping(hFile,
				(LPSECURITY_ATTRIBUTES)NULL,
				 PAGE_READWRITE,
				 0,
				(SendMessage(hEdit, WM_GETTEXTLENGTH, 0, 0)),NULL);

    pFileData = MapViewOfFile(hFileMap, FILE_MAP_WRITE, 0, 0, 0);
    lResult  = SendMessage(hEdit, WM_GETTEXTLENGTH, 0 ,0 );
    SendMessage(hEdit, WM_GETTEXT, lResult + 1, (LPARAM)pFileData );

    if( !UnmapViewOfFile( pFileData ))
      {
	MessageBox( hWnd, TEXT("File Unmap Failed"), TEXT("ERROR"), MB_OK | MB_ICONSTOP );
	return FALSE ;
      }

    //
    // Close the open file handles.
    //
    CloseHandle(hFileMap);
    CloseHandle(hFile);

    //
    // Make note that the text has been saved, so mark it as no longer modified.
    //
    SendMessage(hEdit, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);


    //
    // Now create the dictionary file
    //
    if( !bDictionarySaved )
	CompileUserDic( hWnd, hEdit );

    return( TRUE );
}


/****************************************************************************
*
*    FUNCTION: SaveFileAs(HWND)
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
BOOL SaveFileAs( LPOPENFILENAME OpenFileName, HWND hWnd, char szFileTitle[] )
{
   strcpy( szFile, "");
   strcpy( szFileTitle, "");

   DefineOpenFileName( hWnd, OpenFileName, szFile, szFileTitle, "Save File As" );
   OpenFileName->Flags = OFN_OVERWRITEPROMPT | OFN_PATHMUSTEXIST | OFN_CREATEPROMPT |
			 OFN_HIDEREADONLY;
   OpenFileName->lpfnHook          = (LPOFNHOOKPROC) (FARPROC) NULL;
   OpenFileName->lpTemplateName    = (LPSTR) NULL;

   if( GetSaveFileName( OpenFileName ) )
       return( MySaveFile ( hWnd, szFileTitle ));
   else
     {
       ProcessCDError( CommDlgExtendedError(), hWnd );
       return( FALSE );
     }
}

/****************************************************************************
*
*    FUNCTION: DefineOpenFileName( HWND hWnd, LPOPENFILENAME OpenFileName,
*                                  char *szFile, char* szFileTitle, char *szTitle )
*
*    PURPOSE:  This is called from the open and saveas functions.
*               This will initialize the OpenFileName for Dictionary entries.
*
*    COMMENTS:
*
*    RETURN VALUES: void
*
****************************************************************************/

void DefineOpenFileName( HWND hWnd, LPOPENFILENAME OpenFileName, char *szFile,
			 char *szFileTitle, char *szTitle )
{
   OpenFileName->lStructSize       = sizeof(OPENFILENAME);
   OpenFileName->hwndOwner         = hWnd;
   OpenFileName->hInstance         = (HANDLE) hInst;
   OpenFileName->lpstrFilter       = "Dictionary Files (*.TAB)\0*.TAB\0All Files (*.*)\0*.*\0";
   OpenFileName->lpstrCustomFilter = (LPSTR) NULL;
   OpenFileName->nMaxCustFilter    = 0L;
   OpenFileName->nFilterIndex      = 1L;
   OpenFileName->lpstrFile         = szFile;
   OpenFileName->nMaxFile          = FILESIZE;
   OpenFileName->lpstrFileTitle    = szFileTitle;
   OpenFileName->nMaxFileTitle     = FILESIZE;
   OpenFileName->lpstrInitialDir   = NULL;
   OpenFileName->lpstrTitle        = szTitle;
   OpenFileName->nFileOffset       = 0;
   OpenFileName->nFileExtension    = 0;
   OpenFileName->lpstrDefExt       = "tab";
   OpenFileName->lCustData         = 0;
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

void CompileUserDic( HWND hWnd, HWND hEdit )
{
    char        szDictionary[100];
    DWORD       i;
    UINT        uiDictEntries;
    UINT        uiTextLength;

    //
    // Copy the dictionary source filename *.tab, and create
    // a new filename with the same inital part but with a .dic extension.
    //
    strcpy( szDictionary, szFile );
    i = strcspn( szDictionary, "." );
    strcpy( &szDictionary[i], ".dic" );

    //
    //  Get the number of entries in the dictionary.
    //

    uiDictEntries = (UINT)SendMessage( hEdit, EM_GETLINECOUNT, 0L, 0L );
    uiTextLength = GetWindowTextLength( hEdit );

    //
    // Make a call to the dictionary compiler
    //
    if( UserDic( hWnd, uiDictEntries, uiTextLength, szFile, szDictionary ))
	bDictionarySaved = TRUE;
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
   CHAR  buf[256];

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
	 case CFERR_NOFONTS:         wStringID=IDS_NOFONTS;         break;
	 case FNERR_SUBCLASSFAILURE: wStringID=IDS_SUBCLASSFAILURE; break;
	 case FNERR_INVALIDFILENAME: wStringID=IDS_INVALIDFILENAME; break;
	 case FNERR_BUFFERTOOSMALL:  wStringID=IDS_BUFFERTOOSMALL;  break;

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


/****************************************************************************
*
*  FUNCTION: HandleMenuPopup( WPARAM wParam )
*
*  PURPOSE:  Handle Edit and File menu popup logic
*
*  RETURN VALUE: void
*
****************************************************************************/

void HandleMenuPopup( WPARAM wParam )
{
    LONG lSelect;
    WORD wEnable;

    //
    // If there is data in the clipboard then turn on the paste option.
    //
    if( IsClipboardFormatAvailable( CF_TEXT ))
	EnableMenuItem((HANDLE)wParam, ID_EDIT_PASTE, MF_ENABLED);
    else
	EnableMenuItem((HANDLE)wParam, ID_EDIT_PASTE, MF_GRAYED);

    //
    // Enable menu cut, copy and delete items if data is selected
    //
    lSelect = SendMessage (hEdit, EM_GETSEL, 0L, 0L);
    if (HIWORD (lSelect) != LOWORD (lSelect))
	wEnable= MF_ENABLED;
    else
	wEnable= MF_GRAYED;

    EnableMenuItem ((HANDLE)wParam, ID_EDIT_CUT, wEnable);
    EnableMenuItem ((HANDLE)wParam, ID_EDIT_COPY, wEnable);
    EnableMenuItem ((HANDLE)wParam, ID_EDIT_CLEAR, wEnable);

    if( SendMessage(hEdit, EM_CANUNDO, 0L, 0L ))
       EnableMenuItem((HANDLE)wParam, ID_EDIT_UNDO, MF_ENABLED);
    else
       EnableMenuItem((HANDLE)wParam, ID_EDIT_UNDO, MF_GRAYED);

    // Gray out the save and "save as" option if there is no text
    // in the window, or if the dictionary has already been saved
    // and has not been modified.

    if (( bDictionarySaved
	&& ( ! SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ))
	|| GetWindowTextLength( hEdit ) == 0 ))
      {
	EnableMenuItem((HANDLE)wParam, IDM_SAVE, MF_GRAYED);
	EnableMenuItem((HANDLE)wParam, IDM_SAVEAS, MF_GRAYED);
      }
    else
      {
	EnableMenuItem((HANDLE)wParam, IDM_SAVE, MF_ENABLED);
	EnableMenuItem((HANDLE)wParam, IDM_SAVEAS, MF_ENABLED);
      }

    // Gray out the compile option if there is no text in the window, or
    // if the dictionary has already been saved and has not been modified.

    if (( bDictionarySaved
	&& ( ! SendMessage( hEdit, EM_GETMODIFY, 0L, 0L ))
	|| GetWindowTextLength( hEdit ) == 0 ))
	EnableMenuItem((HANDLE)wParam, IDM_COMPILE_DICTIONARY, MF_GRAYED);
    else
	EnableMenuItem((HANDLE)wParam, IDM_COMPILE_DICTIONARY, MF_ENABLED);
}



//--------------------------------------------------------------------------;
//
//  DWORD AppGetWindowsVersion
//
//  Description:
//      This function returns the version of Windows that the application
//      is running on plus some platform information.
//
//  Arguments:
//      PTSTR pach: Options pointer to buffer to receive text string of
//      the Windows version and platform.
//
//  Return (LRESULT):
//      The return value will be the version and platform information of
//      the current operating system in the following format:
//
//      0xPPPPMMRR where:
//
//      MM      :   major version of Windows
//      RR      :   minor version (revision) of Windows
//      PPPP    :   the platform the application is running on which
//                  will be one of the following:
//
//                  #ifdef WIN32
//                      the HIWORD() is RESERVED except for the high bit:
//                          high bit is 0 = Windows NT
//                          high bit is 1 = Win32s/Windows 3.1
//                  #else
//                      0xMMRR = Major and Minor version of [MS-]DOS
//                      GetWinFlags() & 0x8000 = Windows on OS/2 (WLO)
//                      GetWinFlags() & 0x4000 = Windows on Windows NT (WOW)
//                  #endif
//
//
//--------------------------------------------------------------------------;

LRESULT _stdcall AppGetWindowsVersion( PTSTR pszEnvironment,
									   PTSTR pszPlatform )
{

	LRESULT lr;
	OSVERSIONINFO  OSVersionInfo;

	OSVersionInfo.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
	GetVersionEx(&OSVersionInfo);

	// Dummy return value 
	lr = OSVersionInfo.dwPlatformId;
	//
	//  if caller wants the environment string version...
	//
	if (NULL != pszEnvironment)
	{
	//
	//
	//
#ifdef WIN32
{
	static TCHAR    szFormatVersion[]   = TEXT("%s Version %u.%.2u");
	static TCHAR    szEnvWinNT[]        = TEXT("Windows NT");
	static TCHAR    szEnvWin95[]        = TEXT("Windows 95");
	static TCHAR    szEnvWin32s[]       = TEXT("Win32s");
	TCHAR			szPlatform[15];

	switch(OSVersionInfo.dwPlatformId) 
	{
		case VER_PLATFORM_WIN32s:
			_tcscpy(szPlatform,szEnvWin32s);
			break;
		case VER_PLATFORM_WIN32_WINDOWS:
			_tcscpy(szPlatform,szEnvWin95);
			break;
		case VER_PLATFORM_WIN32_NT:
			_tcscpy(szPlatform,szEnvWinNT);
			break;
	}

	wsprintf(pszEnvironment, szFormatVersion,
			 (LPSTR)(szPlatform),
			 OSVersionInfo.dwMajorVersion, 
			 OSVersionInfo.dwMinorVersion);
}
#else
{
#ifndef WF_WINNT
	#define WF_WINNT        0x4000
	#define WF_WLO          0x8000
#endif
#ifndef WF_CPUMASK
	#define WF_CPUMASK      0xFC000000
	#define WF_CPU_X86      0
	#define WF_CPU_R4000    1
	#define WF_CPU_ALPHA    2
	#define WF_CPU_CLIPPER  3
#endif

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
#endif
	}

	//
	//  if caller wants the platform string version...
	//
	if (NULL != pszPlatform)
	{
#ifdef WIN32
{
	static TCHAR    szFormatPlatform[]  = TEXT("%s%u, %u Processor(s)");
	static TCHAR    szProcessorIntel[]  = TEXT("Intel ");
	static TCHAR    szProcessorMIPS[]   = TEXT("MIPS R");
	static TCHAR    szProcessorAlpha[]  = TEXT("DEC Alpha ");
	static TCHAR    szProcessorDunno[]  = TEXT("Unknown Processor");

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

	//
	//
	//
	wsprintf(pszPlatform, szFormatPlatform, (LPSTR)pszProcessor,
			 sysinfo.dwProcessorType, sysinfo.dwNumberOfProcessors);
}
#else
{
	static TCHAR    szPlat286[]         = TEXT("80286");
	static TCHAR    szPlat386[]         = TEXT("80386");
	static TCHAR    szPlat486[]         = TEXT("i486");
	static TCHAR    szPlatR4000[]       = TEXT("MIPS R4000, Emulation: ");
	static TCHAR    szPlatAlpha21064[]  = TEXT("Alpha 21064, Emulation: ");
	static TCHAR    szPlatClipper[]     = TEXT("Clipper, Emulation: ");
	static TCHAR    szPlat80x87[]       = TEXT(", 80x87");

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
#endif
	}

	//
	//  return the result
	//
	return (lr);
} // AppGetWindowsVersion()

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetInstallationInfo                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: October 5, 1994                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function gets the installer name and company from the */
/*    registry.                                                       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    szInstaller    A pointer to a string that will contain the      */
/*                   name provided during installation.               */
/*                   The returned value will be NULL terminated.      */
/*                                                                    */
/*    szCompany      A pointer to a string that will contain the      */
/*                   company name provided during installation.       */
/*                   The returned value will be NULL terminated.      */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

/* Moved to coop.h -- ncs 07jul97

LPSTR szLocalMachineDECtalk =
  "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.40";

*/

static void GetInstallationInfo( LPSTR szInstaller, LPSTR szCompany )
{
  HKEY hKey;
  DWORD dwType;
  DWORD cbData;

  char temp[512];
#ifdef WINDIC_C_STATIC
  temp[0]='\0';
#else
  strcpy(temp, szLocalMachineDECtalk);
  temp[strlen(szLocalMachineDECtalk) - 3] = '\0'; // chop off /GR, /LA, /SP, /UK, /US, etc.
#endif
  if ( RegOpenKeyEx( HKEY_LOCAL_MACHINE,
			 temp,
#ifdef OLD_CODE
			 szLocalMachineDECtalk,
#endif
		     0,
		     KEY_QUERY_VALUE ,
		     &hKey ) != ERROR_SUCCESS )
  {
    szInstaller[0] = '\0';
    szCompany[0] = '\0';
  }
  else
  {
    cbData = 511;

    if ( RegQueryValueEx( hKey,
			  "Installer",
			  NULL,
			  &dwType,
			  (LPBYTE)szInstaller,
			  &cbData ) != ERROR_SUCCESS )
    {
      szInstaller[0] = '\0';
    }

    cbData = 511;

    if ( RegQueryValueEx( hKey,
			  "Company",
			  NULL,
			  &dwType,
			  (LPBYTE)szCompany,
			  &cbData ) != ERROR_SUCCESS )
    {
      szCompany[0] = '\0';
    }

    RegCloseKey( hKey );
  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetApplicationParameters                                */
/*  Author: Bill Hallahan                                             */
/*  Date: October 6, 1994                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function gets the last window position and show state */
/*    in the registry.                                                */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    piX        A pointer to an integer that will contain the        */
/*               X (horizontal) position of the application           */
/*               window.                                              */
/*                                                                    */
/*    piY        A pointer to an integer that will contain the        */
/*               Y (vertical) position of the application             */
/*               window.                                              */
/*                                                                    */
/*    piWidth    A pointer to an integer that will contain the        */
/*               width of the application window.                     */
/*                                                                    */
/*    piHeight   A pointer to an integer that will contain the        */
/*               height of the application window.                    */
/*                                                                    */
/*    piShow     A pointer to an integer that will contain the        */
/*               show state of the window.                            */
/*                                                                    */
/*    pszFile    A pointer to memory that will contain a NULL         */
/*               terminated string of characters. It must be at       */
/*               least FILESIZE bytes.                                */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

/* Moved to coop.h -- ncs 07jul97

LPSTR szCurrentUsersWindic =
  "Software\\DigitalEquipmentCorporation\\DECtalk\\Applications\\Windic";

*/

static void GetApplicationParameters( int * piX,
				      int * piY,
				      int * piWidth,
				      int * piHeight,
				      int * piShow,
				      char * pszFile )
{
  HKEY hKey;
  DWORD dwType;
  DWORD cbData;
  DWORD dwXY;
  DWORD dwWH;

  /********************************************************************/
  /*  Open the registry for the application.                          */
  /********************************************************************/

  if ( RegOpenKeyEx( HKEY_CURRENT_USER,
		     szCurrentUsersWindic,
		     0,
		     KEY_QUERY_VALUE,
		     &hKey ) != ERROR_SUCCESS )
  {
    /******************************************************************/
    /*  If the key is not accessible then use default values.         */
    /******************************************************************/

    *piShow = SW_SHOWNORMAL;
    *piX = 0;
    *piY = 0;
    *piWidth = awWidth;
    *piHeight = awHeight;
    *pszFile = '\0';
  }
  else
  {
    /******************************************************************/
    /*  Read the former window SHOW state.                            */
    /******************************************************************/

    cbData = 4;

    if ( RegQueryValueEx( hKey,
			  "Show",
			  NULL,
			  &dwType,
			  (LPBYTE)piShow,
			  &cbData ) != ERROR_SUCCESS )
    {
      *piShow = SW_SHOWNORMAL;
    }

    /******************************************************************/
    /*  Read the former window X and Y positions.                     */
    /******************************************************************/

    cbData = 4;

    if ( RegQueryValueEx( hKey,
			  "Position",
			  NULL,
			  &dwType,
			  (LPBYTE)&dwXY,
			  &cbData ) != ERROR_SUCCESS )
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

    /******************************************************************/
    /*  Read the former window width and height.                      */
    /******************************************************************/

    cbData = 4;

    if ( RegQueryValueEx( hKey,
			  "Size",
			  NULL,
			  &dwType,
			  (LPBYTE)&dwWH,
			  &cbData ) != ERROR_SUCCESS )
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

    /******************************************************************/
    /*  Read the former file title.                                   */
    /******************************************************************/

    cbData = FILESIZE;

    if ( RegQueryValueEx( hKey,
			  "File",
			  NULL,
			  &dwType,
			  (LPBYTE)pszFile,
			  &cbData ) != ERROR_SUCCESS )
    {
      *pszFile = '\0';
    }

    /******************************************************************/
    /*  Close the registry.                                           */
    /******************************************************************/

    RegCloseKey( hKey );
  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: SetApplicationParameters                                */
/*  Author: Bill Hallahan                                             */
/*  Date: October 6, 1994                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function sets the last window position and show state */
/*    in the registry.                                                */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd        A handle to the application window.                 */
/*                                                                    */
/*    pszFile    A pointer to memory that contains a NULL             */
/*               terminated string of characters.                     */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void SetApplicationParameters( HWND hWnd, char * pszFile )
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
  WINDOWPLACEMENT WindowPlacement;

  /********************************************************************/
  /*  Open the registry for the application.                          */
  /********************************************************************/

  if ( RegOpenKeyEx( HKEY_CURRENT_USER,
		     szCurrentUsersWindic,
		     0,
		     KEY_ALL_ACCESS,
		     &hKey ) != ERROR_SUCCESS )
  {
    /******************************************************************/
    /*  The specified key was NOT found in the registry. Create       */
    /*  the registry entries.                                         */
    /******************************************************************/

    if ( RegCreateKeyEx( HKEY_CURRENT_USER,
			 szCurrentUsersWindic,
			 0,
			 "",
			 REG_OPTION_NON_VOLATILE,
			 KEY_ALL_ACCESS,
			 NULL,
			 &hKey,
			 &dwDisposition ) != ERROR_SUCCESS )
    {
      /****************************************************************/
      /*  Unable to update registry entries. Exit with no error.      */
      /****************************************************************/

      return;
    }
  }

  /********************************************************************/
  /*  Set the registry entries for the window placement data.         */
  /********************************************************************/

  WindowPlacement.length = sizeof(WINDOWPLACEMENT);

  if ( GetWindowPlacement( hWnd, &WindowPlacement ))
  {
    cbData = 4;
    iShow = WindowPlacement.showCmd;

    RegSetValueEx( hKey,
		   "Show",
		   0,
		   REG_DWORD,
		   (LPBYTE)&iShow,
		   sizeof( DWORD ));

    /******************************************************************/
    /*  Set the registry entries for the window X and Y coordinates.  */
    /******************************************************************/

    iX = WindowPlacement.rcNormalPosition.left;
    iY = WindowPlacement.rcNormalPosition.top;
    dwXY = ( iY << 16 ) + iX;
    cbData = 4;

    RegSetValueEx( hKey,
		   "Position",
		   0,
		   REG_DWORD,
		   (LPBYTE)&dwXY,
		   sizeof( DWORD ));

    /******************************************************************/
    /*  Set the registry entries for the window width and height.     */
    /******************************************************************/

    iWidth = WindowPlacement.rcNormalPosition.right
	     - WindowPlacement.rcNormalPosition.left;

    iHeight = WindowPlacement.rcNormalPosition.bottom
	      - WindowPlacement.rcNormalPosition.top;

    dwWH = ( iHeight << 16 ) + iWidth;

    cbData = 4;

    RegSetValueEx( hKey,
		   "Size",
		   0,
		   REG_DWORD,
		   (LPBYTE)&dwWH,
		   sizeof( DWORD ));
  }

  /********************************************************************/
  /*  Set the registry entry for the current file title.              */
  /********************************************************************/

  RegSetValueEx( hKey,
		 "File",
		 0,
		 REG_SZ,
		 (LPBYTE)pszFile,
		 1 + strlen( pszFile ));

  /********************************************************************/
  /*  Close the registry.                                             */
  /********************************************************************/

  RegCloseKey( hKey );

  return;
}
