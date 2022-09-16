/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1998                 */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of Digital Equipment         */
/*  Corporation. Possession, use, duplication or dissemination of     */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from Digital Equipment Corporation.               */
/*                                                                    */
/*  The name of Digital Equipment Corporation may not be used to      */
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
 * 001   JAW   02/13/1998   For BATS #456  Fixed
 *                          GetInstallationInfo(...) so it accesses the
 *							correct key within the registry.
 *
 */
/**********************************************************************/

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  PROGRAM: ttssrv.c                                                 */
/*  Author:  Bernie Rozmovits                                         */
/*  Date:    August 1994                                              */
/*           Modified by Bill Hallahan.                               */
/*                    Improved indentation and changed "about" box.   */
/*                    Added Ownder Draw Buttons.                      */
/*                    Added registry code.                            */
/*                                                                    */
/*  PURPOSE: Text To Speech DDE Server.                               */
/*                                                                    */
/*  FUNCTIONS:                                                        */
/*                                                                    */
/*      WinMain()         - Calls initialization function, processes  */
/*                          message loop.                             */
/*                                                                    */
/*      InitWindows()     - Creates child window controls             */
/*                                                                    */
/*      MainWndProc()     - Processes messages                        */
/*                                                                    */
/*      AboutDlgProc()    - Processes messages for "About" dialog box */
/*                                                                    */
/*                                                                    */
/*  COMMENTS:                                                         */
/*                                                                    */
/*    The server creates the service name "TTSserver" with topic      */
/*    names of;                                                       */
/*                                                                    */
/*        Speak                                                       */
/*        LoadDictionary                                              */
/*        UnloadDictionary                                            */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

/**********************************************************************/
/*  Include files.                                                    */
/**********************************************************************/

#include <windows.h>    // includes basic windows functionality
#include <commdlg.h>    // includes common dialog functionality
#include <dlgs.h>       // includes common dialog template defines
#include <stdio.h>      // includes standard file i/o functionality
#include <string.h>     // includes string functions
#include <stdlib.h>     //
#include <cderr.h>      // includes the common dialog error codes
#include <mmsystem.h>   // includes multimedia extensions
#include <ddeml.h>      // includes ddemlibrary
#include "ttsapi.h"     // includes TextToSpeech API definitions
#include "ttssrv.h"     // includes ttssrv header file
//#include "dll.h"

#define TTSSRV_C
#include "coop.h"
#undef  TTSSRV_C


/**********************************************************************/
/*  Symbol Definitions.                                               */
/**********************************************************************/

#define  BUTTON_WIDTH            39
#define  BUTTON_HEIGHT           24
#define  WINDOW_WIDTH            98

#define WM_USER_INITIATE (WM_USER + 1)

/**********************************************************************/
/*  Global variables.                                                 */
/**********************************************************************/

FARPROC pButtonWndProc = NULL;
int iTop;
HINSTANCE hInst;
HMENU hSystemMenu;
UINT  uiID_Error_Msg;
BOOL  bPause = TRUE;  // TRUE = Pause displayed, False = Resume displayed
CHAR  szAppName[]  = "ttssrv";
CHAR  szTopic[] = "Speak";
CHAR  szSpeak[] = "Speak";
CHAR  szLoadDictionary[] = "LoadDictionary";
CHAR  szUnloadDictionary[] = "UnloadDictionary";
HWND  hPauseButton;
HWND  hStopButton;
DWORD  idInst;
UINT  uiReason;
HSZ  hszService;
HSZ  hszTopic;
LPTTS_HANDLE_T  phTTS;
char * szHelpKey = "Step3 - LaunchingandConfiguringtheTex-to-Speech Server: Step-by-Step";

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)                     */
/*                                                                    */
/*  PURPOSE: calls initialization function, processes message loop    */
/*                                                                    */
/*  COMMENTS:                                                         */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

int APIENTRY WinMain( HINSTANCE hInstance,
                      HINSTANCE hPrevInstance,
                      LPSTR lpCmdLine,
                      int nCmdShow )
{
  int iX;
  int iY;
  int iWidth;
  int iHeight;
  int iShow;
  MSG msg;
  DWORD error;
  WNDCLASS  wc;
  HWND hWnd;

  /********************************************************************/
  /*  Fill in window class structure with parameters that describe    */
  /*  the main window.                                                */
  /********************************************************************/

  hInst = hInstance;

  wc.style = CS_HREDRAW | CS_VREDRAW ;  /* Class style(s).                    */
  wc.lpfnWndProc = (WNDPROC)MainWndProc;/* Function to retrieve messages for  */
                                        /* windows of this class.             */
  wc.cbClsExtra = 0;                    /* No per-class extra data.           */
  wc.cbWndExtra = 0;                    /* No per-window extra data.          */
  wc.hInstance = NULL;                  /* Application that owns the class.   */
  wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE( ICON_APP ));
  wc.hCursor = LoadCursor(NULL, IDC_ARROW);
  wc.hbrBackground = GetStockObject( LTGRAY_BRUSH );
  wc.lpszMenuName = NULL;         /* Name of menu resource in .RC file. */
  wc.lpszClassName = szAppName;         /* Name used in call to CreateWindow. */

  /********************************************************************/
  /*  Register the window class and return success/failure code.      */
  /********************************************************************/

  if ( ! RegisterClass( &wc ))
    error = GetLastError();

  /********************************************************************/
  /*  Save the instance handle in static variable, which will be used */
  /*  in many subsequence calls from this application to Windows.     */
  /*  Create a main window for this application instance.             */
  /********************************************************************/

  GetApplicationParameters( &iX, &iY, &iShow, &iTop );

  iWidth = WINDOW_WIDTH;
  iHeight = BUTTON_HEIGHT + GetSystemMetrics( SM_CYCAPTION )
                          + 4 * GetSystemMetrics( SM_CYBORDER );

  hWnd = CreateWindow( szAppName,      /* See RegisterClass() call.    */
                       "TTSsrv",       /* Text for window title bar.   */
                       WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_BORDER
                        | WS_MINIMIZEBOX | WS_VISIBLE,
                       iX,            /* Horizontal position. */
                       iY,            /* Vertical position.   */
                       iWidth,        /* Default width.               */
                       iHeight,       /* Default height.              */
                       NULL,          /* Overlapped windows have no parent. */
                       NULL,          /* Use the window class menu.         */
                       NULL,          /* This instance owns this window.    */
                       NULL );        /* Pointer not needed.                */

  /********************************************************************/
  /*  If window could not be created, return "failure"                */
  /********************************************************************/

  if ( hWnd == (HWND)NULL )
  {
    return( FALSE );
  }

  /********************************************************************/
  /*  Make the window visible; update its client area; and return     */
  /*  "success"                                                       */
  /********************************************************************/

  ShowWindow( hWnd, iShow );         /* Show the window               */
  UpdateWindow( hWnd );              /* Sends WM_PAINT message        */

  if ( iTop )
  {
    CheckMenuItem( hSystemMenu,
                   IDM_TOP,
                   MF_BYCOMMAND | MF_CHECKED );

    SetWindowPos( hWnd,
                  HWND_TOPMOST,
                  0,
                  0,
                  0,
                  0,
                  SWP_SHOWWINDOW | SWP_NOMOVE | SWP_NOSIZE );
  }

  /********************************************************************/
  /*  Initialize the DDE server.                                      */
  /********************************************************************/

  if ( DdeInitialize( &idInst,
                      (PFNCALLBACK)DdeCallback,
                      CBF_FAIL_EXECUTES | CBF_FAIL_REQUESTS
                        | CBF_SKIP_REGISTRATIONS | CBF_SKIP_UNREGISTRATIONS,
                      0L ))
  {
    MessageBox( hWnd, "Could not init server", "yipes", MB_OK );
    return FALSE;
  }

  SendMessage( hWnd, WM_USER_INITIATE, 0L, 0L );

  /********************************************************************/
  /*  Acquire and dispatch messages until a WM_QUIT message is        */
  /*  received.                                                       */
  /********************************************************************/

  while( GetMessage( &msg,  /* message structure                      */
                     NULL,  /* handle of window receiving the message */
                     0,     /* lowest message to examine              */
                     0 ))
  {
    TranslateMessage(&msg); /* Translates virtual key codes           */
    DispatchMessage(&msg);  /* Dispatches message to window           */
  }

  return( msg.wParam );    /* Returns the value from PostQuitMessage */
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  FUNCTION: DDEcallbackProc(HWND, unsigned, WORD, LONG)             */
/*                                                                    */
/*  PURPOSE:  Processes dde messages                                  */
/*                                                                    */
/*  COMMENTS:                                                         */
/*                                                                    */
/*    This function processes all dde messags sent to the window.     */
/*    When the user choses one of the options from one of the menus,  */
/*    the command is processed here and passed onto the function for  */
/*    that command.                                                   */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

HDDEDATA CALLBACK DdeCallback( UINT uType,
                               UINT uFmt,
                               HCONV hConv,
                               HSZ hsz1,
                               HSZ hsz2,
                               HDDEDATA hData,
                               DWORD dwData1,
                               DWORD dwData2)
{
  char szBuffer[32];
  DWORD dwNumBytes ;
  LPSTR lpEditText;

  switch( uType )
  {
  case XTYP_CONNECT : //hsz1 = topic, hsz2 = service

    DdeQueryString( idInst, hsz2, szBuffer, sizeof(szBuffer), 0 );

    if ( 0 != strcmp( szBuffer, "TTSserver" ))
      return FALSE;

    DdeQueryString( idInst, hsz1, szBuffer, sizeof(szBuffer), 0 );

    if ( 0 != strcmp( szBuffer, szSpeak )
      && strcmp( szBuffer, szLoadDictionary )
      && strcmp( szBuffer, szUnloadDictionary ))
      return FALSE;

    return TRUE;    //Confirm connection

  case XTYP_POKE : // Speak poked data

    DdeQueryString( idInst, hsz2, szBuffer, sizeof(szBuffer), 0 ); // Get Item

    if ( ! strcmp( szBuffer, szSpeak )) // if speak transaction
    {
      dwNumBytes = DdeGetData( hData, NULL,  1024, 0 );

      lpEditText = (char *)malloc((1 + dwNumBytes) * sizeof(char));
      DdeGetData( hData, lpEditText, dwNumBytes, 0 );
      *(lpEditText+dwNumBytes) = '\0';
      TextToSpeechSpeak( phTTS, lpEditText, TTS_FORCE );
      free( lpEditText );

      return  DDE_FACK;    //Confirm Transaction
    }

    if ( ! strcmp( szBuffer, szLoadDictionary )) // if load dictionary
    {
      dwNumBytes = DdeGetData(hData, NULL,  1024, 0 );
      lpEditText = (char *)malloc(( 1 + dwNumBytes ) * sizeof(char));
      DdeGetData( hData, lpEditText, dwNumBytes, 0 );
      *(lpEditText+dwNumBytes) = '\0';
      TextToSpeechLoadUserDictionary( phTTS, lpEditText );
      free( lpEditText );
      return DDE_FACK;
    }

    if ( ! strcmp( szBuffer, szUnloadDictionary )) // if Unload dictionary
    {
      TextToSpeechUnloadUserDictionary( phTTS );
      return DDE_FACK;
    }
  }

  return FALSE;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  FUNCTION: MainWndProc(HWND, unsigned, WORD, LONG)                 */
/*                                                                    */
/*  PURPOSE:  Processes messages                                      */
/*                                                                    */
/*  COMMENTS:                                                         */
/*                                                                    */
/*    This function processes all messags sent to the window.  When   */
/*    the user choses one of the options from one of the menus, the   */
/*    command is processed here and passed onto the function for that */
/*    command.                                                        */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

LONG APIENTRY MainWndProc( HWND hWnd,     /* window handle            */
                           UINT message,  /* type of message          */
                           UINT wParam,   /* additional information   */
                           LONG lParam )  /* additional information   */
{
  HDC hdc;
  HDDEDATA hddeStat;
  DWORD dwPrevious;
  PAINTSTRUCT ps;
  MMRESULT mmStatus;
  LPCTSTR lpszHelpFile = "dtlkuser.hlp";   // Name of DECtalk help file
  LPDRAWITEMSTRUCT pDrawItem;
  LPBUTTON_DATA_T pButtonData;

  switch( message )
  {
  case WM_CREATE:

    /******************************************************************/
    /*  Modify the system menu.                                       */
    /******************************************************************/

    hSystemMenu = GetSystemMenu( hWnd, FALSE );

    if ( hSystemMenu != NULL )
    {
      AppendMenu( hSystemMenu, MF_STRING, IDM_CONFIG, "C&onfigure..." );
      AppendMenu( hSystemMenu, MF_STRING, IDM_ABOUT, "&About" );
      AppendMenu( hSystemMenu, MF_STRING, IDM_HELP, "&Help" );
      AppendMenu( hSystemMenu, MF_STRING, IDM_TOP, "Always on &Top" );
    }

    /******************************************************************/
    /*  InitWindows function - creates all child windows              */
    /******************************************************************/

    InitWindows( hWnd );

    /******************************************************************/
    /*  Start the Text-To-Speech system.                              */
    /******************************************************************/

    mmStatus = TextToSpeechStartup( hWnd,
                                    &phTTS,WAVE_MAPPER,
                                    REPORT_OPEN_ERROR );

    if ( mmStatus == MMSYSERR_ERROR )
    {
      MessageBox( hWnd,
                  "Can't find DECtalk Dictionary dectalk.dic, Shutting Down !",
                  NULL,
                  MB_OK );

      return( -1 );
    }

    if ( mmStatus == MMSYSERR_NODRIVER )
    {
      MessageBox( hWnd, "No wave device present,\n Shutting Down!", NULL, MB_OK );
      return( -1 );
    }

    if ( mmStatus )
      MessageBox( hWnd, "Error Initializing Text To Speech System", NULL, MB_OK );

    //TextToSpeechSpeak(phTTS, "DECtalk DDE ready", TTS_FORCE);
    return FALSE;


  case WM_USER_INITIATE:

    hszService = DdeCreateStringHandle( idInst, "TTSserver", CP_WINANSI );
    hszTopic = DdeCreateStringHandle( idInst, szTopic, CP_WINANSI );
    hddeStat = DdeNameService( idInst, hszService, 0L, DNS_REGISTER );

    return 0;

  /********************************************************************/
  /*  Register a private message to report DECtalk asychronous        */
  /*      events.                                                     */
  /*                                                                  */
  /*  uiID_Error_Msg =                                                */
  /*    RegisterWindowMessage("DECtalkErrorMessage");                 */
  /*                                                                  */
  /*  Initialize the Text to Speech system: Use Wave Mapper to        */
  /*  allocate an appropriate audio port, Since the                   */
  /*  "OWN_AUDIO_DEVICE" flag is not  set the audio device will be    */
  /*  shared, (given up when not currently speaking) Report open      */
  /*  error will cause an asynchronous error message                  */
  /*  ("DECtalkErrorMessage") to be sent to this window in case       */
  /*  the audio device is not available.                              */
  /********************************************************************/

  case WM_SETFOCUS :

    SetFocus( hWnd );
    return FALSE ;

  /*
  case WM_SIZE :
    return FALSE ;

  case WM_MOVE:
    break;
  */

  case WM_DRAWITEM:

    /******************************************************************/
    /*  Get the Button Data for the current button.                   */
    /******************************************************************/

    pDrawItem = (LPDRAWITEMSTRUCT)lParam;

    pButtonData = (LPBUTTON_DATA_T)GetWindowLong( pDrawItem->hwndItem,
                                                  GWL_USERDATA );

    /******************************************************************/
    /*  Display the button based on the current button state.         */
    /******************************************************************/

    if ( pDrawItem->itemState & ODS_SELECTED )
    {
      DisplayBitmapUsingHdc( pDrawItem->hDC, pButtonData->pSelectedDib );
    }
    else
    {
      switch ( pButtonData->iButtonState )
      {
      case BUTTON_DISABLED:

        DisplayBitmapUsingHdc( pDrawItem->hDC, pButtonData->pDisabledDib );

        break;

      case BUTTON_ENABLED:

        DisplayBitmapUsingHdc( pDrawItem->hDC, pButtonData->pEnabledDib );

        break;

      case BUTTON_SELECTED:

        DisplayBitmapUsingHdc( pDrawItem->hDC, pButtonData->pSelectedDib );

        break;

      default:

        break;
      }
    }
    return( TRUE );

  case WM_PAINT:            // Set up a display context to begin painting

    hdc  = BeginPaint( hWnd, &ps );
    EndPaint( hWnd, &ps );

    break;

  case WM_COMMAND:

    break;

  /********************************************************************/
  /*  Process the system menu commands.                               */
  /********************************************************************/

  case WM_SYSCOMMAND:

    switch( wParam )
    {
    case IDM_ABOUT:

      DialogBox( hInst,
                 MAKEINTRESOURCE(DLG_ABOUT),
                 hWnd,
                 (DLGPROC)AboutDlgProc );
      break;

    case IDM_CONFIG:

      DialogBox( hInst,                   /* current instance         */
                 "Configure",            /* resource to use          */
                 hWnd,                   /* parent handle            */
                 (DLGPROC)Configure );   /* Configure Process()      */

      break;

    case IDM_HELP:

      WinHelp( hWnd,
               lpszHelpFile,
               HELP_CONTEXT,
               IDH_Text_to_Speech_Server_Help );

      break;

    case IDM_TOP:

      dwPrevious = CheckMenuItem( hSystemMenu,
                                  IDM_TOP,
                                  MF_BYCOMMAND | MF_CHECKED );

      if ( dwPrevious == MF_UNCHECKED )
      {
        iTop = TRUE;

        SetWindowPos( hWnd,
                      HWND_TOPMOST,
                      0,
                      0,
                      0,
                      0,
                      SWP_SHOWWINDOW | SWP_NOMOVE | SWP_NOSIZE );
      }
      else if ( dwPrevious == MF_CHECKED )
      {
        iTop = FALSE;

        CheckMenuItem( hSystemMenu,
                       IDM_TOP,
                       MF_BYCOMMAND | MF_UNCHECKED );

        SetWindowPos( hWnd,
                      HWND_NOTOPMOST,
                      0,
                      0,
                      0,
                      0,
                      SWP_SHOWWINDOW | SWP_NOMOVE | SWP_NOSIZE);
      }

      break;

    default:

      break;
    }
    break;

  /********************************************************************/
  /*  Make sure to shut down TextToSpeech system before exiting.      */
  /********************************************************************/

  case WM_DESTROY:

    SetApplicationParameters( hWnd, iTop );

    hddeStat = DdeNameService( idInst, hszService, 0L, DNS_UNREGISTER );

    if ( hddeStat != 0 )
      uiReason = DdeGetLastError(idInst);

    DdeFreeStringHandle( idInst, hszService );
    DdeFreeStringHandle( idInst, hszTopic );
    TextToSpeechShutdown( phTTS );
    DdeUninitialize( idInst );

    DestroyOwnerDrawButton( hPauseButton );
    DestroyOwnerDrawButton( hStopButton );

    PostQuitMessage( 0 );
    break;

  default:

    if ( message ==  uiID_Error_Msg )
    {
      switch( wParam )
      {
      case ERROR_IN_AUDIO_WRITE:

        MessageBox( hWnd, "Error in Writing Audio", "Async Error",MB_OK | MB_ICONSTOP);

        break;

      case ERROR_OPENING_WAVE_OUTPUT_DEVICE:

        MessageBox( hWnd,
                    "Error Opening Wave Out Device",
                    "Async Error",
                    MB_OK | MB_ICONSTOP );
        break;

      case ERROR_GETTING_DEVICE_CAPABILITIES:

        MessageBox( hWnd,
                    "Error Getting Audio Device Caps",
                    "Async Error",
                    MB_OK | MB_ICONSTOP);
        break;

      case ERROR_READING_DICTIONARY:

        MessageBox( hWnd,
                    "Error Reading Dictionary File \n dectalk.dic",
                    "Async Error",
                    MB_OK | MB_ICONSTOP);
        break;

      case ERROR_WRITING_FILE:

        MessageBox( hWnd,
                    "Error Writing File",
                    "Async Error",
                    MB_OK | MB_ICONSTOP);
        break;

      case ERROR_ALLOCATING_INDEX_MARK_MEMORY:

        MessageBox( hWnd,
                    "Error allocating Index Mark Memory",
                    "Async Error",
                    MB_OK | MB_ICONSTOP);
        break;

      default:

        break;
      }
    }
  }
  return( DefWindowProc( hWnd, message, wParam, lParam ));
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  FUNCTION: InitWindows()                                           */
/*                                                                    */
/*  PURPOSE:  Initialize all child windows. Draws buttons, sliders,   */
/*            edit control etc.                                       */
/*                                                                    */
/*  COMMENTS:                                                         */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

BOOL InitWindows( HWND hWnd )
{
  int iHorizontal;
  int iVertical;
  RECT Rect;
  LPBITMAPFILEHEADER pSelectedDib;
  LPBITMAPFILEHEADER pEnabledDib;
  LPBITMAPFILEHEADER pDisabledDib;

  /********************************************************************/
  /*  Get the width of the client area.                               */
  /********************************************************************/

  GetClientRect( hWnd, &Rect );

  iHorizontal = ( Rect.right - Rect.left - 2 * BUTTON_WIDTH ) >> 1;
  iVertical = ( Rect.bottom - Rect.top - BUTTON_HEIGHT ) >> 1;

  /********************************************************************/
  /*  Create the PAUSE button.                                        */
  /********************************************************************/

  pSelectedDib = GetDibHandle( PAUSE_SELECTED_RES );
  pEnabledDib = GetDibHandle( PAUSE_ENABLED_RES );
  pDisabledDib = GetDibHandle( PAUSE_DISABLED_RES );

  hPauseButton = CreateOwnerDrawButton( hWnd,
                                        iHorizontal,
                                        iVertical,
                                        BUTTON_WIDTH,
                                        BUTTON_HEIGHT,
                                        ID_PAUSE_BUTTON,
                                        pSelectedDib,
                                        pEnabledDib,
                                        pDisabledDib );

  if ( hPauseButton == NULL )
  {
    MessageBox( hWnd, "Error creating PAUSE button", szAppName, MB_OK );
    return( TRUE );
  }

  /********************************************************************/
  /*  Create the STOP button.                                         */
  /********************************************************************/

  iHorizontal = iHorizontal + BUTTON_WIDTH;

  pSelectedDib = GetDibHandle( STOP_SELECTED_RES );
  pEnabledDib = GetDibHandle( STOP_ENABLED_RES );
  pDisabledDib = GetDibHandle( STOP_DISABLED_RES );

  hStopButton = CreateOwnerDrawButton( hWnd,
                                       iHorizontal,
                                       iVertical,
                                       BUTTON_WIDTH,
                                       BUTTON_HEIGHT,
                                       ID_STOP_BUTTON,
                                       pSelectedDib,
                                       pEnabledDib,
                                       pDisabledDib );

  if ( hStopButton == NULL )
  {
    MessageBox( hWnd, "Error creating STOP button", szAppName, MB_OK );
    return( TRUE );
  }

  return (FALSE);
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
      MessageBox( hWnd, "Out of Memory", "Error", MB_OK );
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

      TextToSpeechSpeak( phTTS,
                         "DECtalk Text To Speech DDE Server",
                         TTS_FORCE );
    }
    break;

  default:

    break;
  }
  return( FALSE );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  FUNCTION: Configure(HWND, UINT, UINT, LONG)                       */
/*                                                                    */
/*  PURPOSE:  Processes messages for "Configure" dialog box           */
/*                                                                    */
/*  COMMENTS:                                                         */
/*                                                                    */
/*     No initialization is needed for this particular dialog box,    */
/*     but TRUE must be returned to Windows.                          */
/*                                                                    */
/*     Wait for user to click on "Ok" button, then close the dialog   */
/*     box.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

BOOL APIENTRY Configure( HWND hDlg,     /* window handle of the dialog box */
                         UINT message,  /* type of message                 */
                         UINT wParam,   /* message-specific information    */
                         LONG lParam)
{
  CHAR szError[32];
  static DWORD lpSpeaker, lpOldSpeaker,  dwOldRate;
  static DWORD dwRate = 180;
  static int iRate = IDD_NORMAL;
  static iOldRate ;
  static MMRESULT mmStatus;

  switch( message )
  {
  case WM_INITDIALOG:                     /* message: initialize dialog box */

    TextToSpeechGetSpeaker( phTTS, &lpSpeaker );
    lpOldSpeaker = lpSpeaker;
    iOldRate = iRate ;
    dwOldRate = dwRate;

    if ( mmStatus )
    {
      sprintf( szError, "Error = %d", mmStatus );

      MessageBox( hDlg,
                  szError,
                  "TextToSpeechGetSpeaker",
                  MB_OK | MB_ICONSTOP );
    }

    CheckRadioButton( hDlg, IDD_PAUL, IDD_WENDY, (int)(200 + lpSpeaker ));

    CheckRadioButton( hDlg, IDD_VSLOW, IDD_VFAST, iRate );

    return (FALSE);


  case WM_COMMAND:                        /* message: received a command */

      /* "OK" box selected or System menu close command? */

    switch( LOWORD( wParam ))
    {
    case IDD_CANCEL:

      TextToSpeechSetSpeaker( phTTS, lpOldSpeaker );
      CheckRadioButton( hDlg, IDD_PAUL, IDD_WENDY, (int)(200 + lpOldSpeaker ));
      TextToSpeechSetRate( phTTS, dwOldRate );
      iRate = iOldRate;
      dwRate = dwOldRate;
      CheckRadioButton( hDlg,IDD_VSLOW, IDD_VFAST, iOldRate );
      TextToSpeechSpeak( phTTS, "Cancel", TTS_FORCE );                                   /* System menu close command? */
      EndDialog( hDlg, TRUE );          /* Exits the dialog box        */
      return( TRUE );

    case IDD_OK:

      EndDialog( hDlg, TRUE );          /* Exits the dialog box        */
      TextToSpeechSpeak( phTTS, "OK", TTS_FORCE );
      return( TRUE );

    case IDD_TEST:

      TextToSpeechSpeak( phTTS, "DECtalk Text To Speech DDE Server", TTS_FORCE );
      return( TRUE );

    case  IDD_PAUL:

      TextToSpeechSetSpeaker( phTTS, PAUL );
      TextToSpeechSpeak( phTTS, "Paul", TTS_FORCE );
      return( TRUE );

    case  IDD_HARRY:

      TextToSpeechSetSpeaker( phTTS, HARRY );
      TextToSpeechSpeak( phTTS, "Harry", TTS_FORCE );
      return( TRUE );

    case  IDD_DENNIS:

      TextToSpeechSetSpeaker( phTTS, DENNIS );
      TextToSpeechSpeak( phTTS, "Dennis", TTS_FORCE );
      return( TRUE );

    case  IDD_FRANK:

      TextToSpeechSetSpeaker( phTTS, FRANK );
      TextToSpeechSpeak( phTTS, "Frank", TTS_FORCE );
      return( TRUE );

    case  IDD_RITA:

      TextToSpeechSetSpeaker( phTTS, RITA );
      TextToSpeechSpeak( phTTS, "Rita", TTS_FORCE );
      return( TRUE );

    case  IDD_BETTY:

      TextToSpeechSetSpeaker( phTTS, BETTY );
      TextToSpeechSpeak( phTTS, "Betty", TTS_FORCE );
      return( TRUE );

    case  IDD_URSULA:

      TextToSpeechSetSpeaker( phTTS, URSULA );
      TextToSpeechSpeak( phTTS, "Ursula", TTS_FORCE );
      return( TRUE );

    case  IDD_WENDY:

      TextToSpeechSetSpeaker( phTTS, WENDY );
      TextToSpeechSpeak( phTTS, "Wendy", TTS_FORCE );
      return( TRUE );

    case  IDD_KIT:

      TextToSpeechSetSpeaker( phTTS, KIT );
      TextToSpeechSpeak( phTTS, "Kit", TTS_FORCE );
      return( TRUE );

    case IDD_VSLOW:

      iRate = IDD_VSLOW;
      dwRate = 80;
      TextToSpeechSetRate( phTTS, dwRate );
      TextToSpeechSpeak( phTTS, "Rate set to very slow", TTS_FORCE );
      return( TRUE );

    case IDD_SLOW:

      iRate = IDD_SLOW;
      dwRate = 120;
      TextToSpeechSetRate( phTTS, dwRate );
      TextToSpeechSpeak( phTTS, "Rate set to slow", TTS_FORCE );
      return( TRUE );

    case IDD_NORMAL:

      iRate = IDD_NORMAL;
      dwRate = 180;
      TextToSpeechSetRate( phTTS, dwRate );
      TextToSpeechSpeak( phTTS, "Rate set to normal", TTS_FORCE );
      return( TRUE );

    case IDD_FAST:

      iRate = IDD_FAST;
      dwRate = 240;
      TextToSpeechSetRate( phTTS, dwRate );
      TextToSpeechSpeak( phTTS, "Rate set to fast", TTS_FORCE );
      return( TRUE );

    case IDD_VFAST:

      iRate = IDD_VFAST;
      dwRate = 350;
      TextToSpeechSetRate( phTTS, dwRate );
      TextToSpeechSpeak( phTTS, "Rate set to very fast!",TTS_FORCE );
      return( TRUE );

    default:

      break;
    }

    break;

  default:

    break;

  }
  return( FALSE );                /* Didn't process a message    */
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: CreateOwnerDrawButton                                   */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function creates an owner draw button. The button is       */
/*    subclassed to a window procedure named pButtonSubclassWndProc.  */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd                A handle to the parent window.              */
/*                                                                    */
/*    iHorizontalCoord    An integer equal to the horizontal button   */
/*                        coordinate.                                 */
/*                                                                    */
/*    iVerticalCoord      An integer equal to the vertical button     */
/*                        coordinate.                                 */
/*                                                                    */
/*    iButtonWidth        An integer equal to the button width.       */
/*                                                                    */
/*    iButtonHeight       An integer equal to the button height.      */
/*                                                                    */
/*    uiButtonMsg         An unsigned integer that equals the message */
/*                        that is sent to the parent window when the  */
/*                        button has been depressed.                  */
/*                                                                    */
/*    pSelectedDib        A pointer to a Bitmap that is drawn when    */
/*                        the button is selected.                     */
/*                                                                    */
/*    pEnabledDib         A pointer to a Bitmap that is drawn when    */
/*                        the button is enabled.                      */
/*                                                                    */
/*    pDisabledDib        A pointer to a Bitmap that is drawn when    */
/*                        the button is disabled.                     */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a handle to the owner draw button.        */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static HWND CreateOwnerDrawButton( HWND hWnd,
                                   int iHorizontalCoord,
                                   int iVerticalCoord,
                                   int iButtonWidth,
                                   int iButtonHeight,
                                   unsigned int uiButtonMsg,
                                   LPBITMAPFILEHEADER pSelectedDib,
                                   LPBITMAPFILEHEADER pEnabledDib,
                                   LPBITMAPFILEHEADER pDisabledDib )
{
  HWND hButtonWnd;
  LPBUTTON_DATA_T pButtonData;

  /********************************************************************/
  /*  Create the owner draw button.                                   */
  /********************************************************************/

  hButtonWnd = CreateWindow( "BUTTON",
                             "",
                             WS_CHILD | WS_VISIBLE | BS_OWNERDRAW,
                             iHorizontalCoord,
                             iVerticalCoord,
                             iButtonWidth,
                             iButtonHeight,
                             hWnd,
                             (HMENU)uiButtonMsg,
                             (HINSTANCE)GetWindowLong( hWnd,
                                                       GWL_HINSTANCE ),
                             (LPVOID)NULL );

  if ( hButtonWnd == NULL )
    return( NULL );

  /********************************************************************/
  /*  Allocate memory for the Button Data.                            */
  /********************************************************************/

  pButtonData = (LPBUTTON_DATA_T)malloc(sizeof(BUTTON_DATA_T));

  if ( pButtonData == NULL )
  {
    DestroyWindow( hButtonWnd );
    return( NULL );
  }

  /********************************************************************/
  /*  Attach Button Data to the button window                         */
  /********************************************************************/

  pButtonData->hWnd = hWnd;
  pButtonData->iButtonState = BUTTON_ENABLED;
  pButtonData->pSelectedDib = pSelectedDib;
  pButtonData->pEnabledDib = pEnabledDib;
  pButtonData->pDisabledDib = pDisabledDib;

  SetWindowLong( hButtonWnd,
                 GWL_USERDATA,
                 (LONG)pButtonData );

  /********************************************************************/
  /*  Subclass the buttons. Get the address of the Button Window      */
  /*  Procedure for Window Class "BUTTON". Save this address and      */
  /*  replace it with a subclass window procedure named               */
  /*  'pButtonSubclassWndProc'. The subclass window procedure         */
  /*  processes the button mouse messages and then calls the Button   */
  /*  Window Procedure that is saved here in 'pButtonWndProc'.        */
  /********************************************************************/

  if ( pButtonWndProc == NULL )
  {
    pButtonWndProc = (FARPROC)SetWindowLong( hButtonWnd,
                                             GWL_WNDPROC,
                                             (LONG)pButtonSubclassWndProc );
  }

  SetWindowLong( hButtonWnd,
                 GWL_WNDPROC,
                 (LONG)pButtonSubclassWndProc );

  return( hButtonWnd );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: DestroyOwnerDrawButton                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: February 1, 1994                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*        This function deallocates all data associated with an       */
/*    owner draw button. The button subclassing is undone and the     */
/*    button data is freed.                                           */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd      A handle to the button window.                        */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void DestroyOwnerDrawButton( HWND hWnd )
{
  LPBUTTON_DATA_T pButtonData;

  if ( hWnd != NULL )
  {
    SetWindowLong( hWnd,
                   GWL_WNDPROC,
                   (LONG)pButtonWndProc );

    pButtonData = (LPBUTTON_DATA_T)GetWindowLong( hWnd, GWL_USERDATA );

    if ( pButtonData != NULL )
      free( pButtonData );

    CloseHandle( hWnd );
  }

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetDibHandle                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function returns a pointer to a Bitmap resource.           */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    iResourceID    The ID of the Bitmap resource. This ID must be   */
/*                   less than or equal to 65535. See documentation   */
/*                   for the FindResource() function for more         */
/*                   information.                                     */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    A pointer to a filled in BITMAPFILEHEADER structure.            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LPBITMAPFILEHEADER GetDibHandle( int iResourceID )
{
  HRSRC hDibResource;
  HRSRC hDibResourceInfo;

  /********************************************************************/
  /*  Get the Device Independent Bitmaps for each of the buttons.     */
  /********************************************************************/

  hDibResourceInfo = FindResource( NULL,
                                   MAKEINTRESOURCE( iResourceID ),
                                   "DIB" );

  if ( hDibResourceInfo == NULL )
    MessageBox( NULL, "Error finding resource", szAppName, MB_OK );

  /********************************************************************/
  /*  Get a handle to the Device Independent Bitmap.                  */
  /********************************************************************/

  hDibResource = LoadResource( NULL, hDibResourceInfo );

  if (hDibResource == NULL)
    MessageBox( NULL, "Error loading resource", szAppName, MB_OK );

  return( LockResource( hDibResource ));
}

/**********************************************************************/
/**********************************************************************/
/*  Window procedure for the subclassed "BUTTON" class.               */
/**********************************************************************/
/**********************************************************************/

static LRESULT CALLBACK pButtonSubclassWndProc( HWND hWnd,
                                                UINT uiMsg,
                                                WPARAM wParam,
                                                LPARAM lParam )
{
  char szError[256];
  MMRESULT mmStatus;
  LPBUTTON_DATA_T pButtonData;

  /********************************************************************/
  /*  Get the system handle and process the message.                  */
  /********************************************************************/

  pButtonData = (LPBUTTON_DATA_T)GetWindowLong( hWnd, GWL_USERDATA );

  switch ( uiMsg )
  {
  /********************************************************************/
  /*  Process "button down" mouse messages.                           */
  /********************************************************************/

  case WM_LBUTTONDOWN:

    if ( pButtonData != NULL )
    {
      /****************************************************************/
      /*  Processing for the PAUSE button.                            */
      /****************************************************************/

      if ( hWnd == hPauseButton )
      {
        if ( pButtonData->iButtonState == BUTTON_ENABLED )
        {
          if ( TextToSpeechPause( phTTS ) == MMSYSERR_NOERROR )
//		  if ( AudioPause() == MMSYSERR_NOERROR )
          {
            pButtonData->iButtonState = BUTTON_SELECTED;
          }
        }
        else if ( pButtonData->iButtonState == BUTTON_SELECTED )
        {
          if ( TextToSpeechResume( phTTS ) == MMSYSERR_NOERROR )
          {
            pButtonData->iButtonState = BUTTON_ENABLED;
          }
        }
      }

      /****************************************************************/
      /*  Processing for the STOP button.                             */
      /****************************************************************/

      else if ( hWnd == hStopButton )
      {
        mmStatus = TextToSpeechReset( phTTS, FALSE );

        if ( mmStatus )
        {
          sprintf( szError, "Error = %d", mmStatus );

          MessageBox( hWnd,
                      szError,
                      "TextToSpeechReset",
                      MB_OK | MB_ICONSTOP );
        }
      }
    }
    break;

  default:

    break;
  }
  return( CallWindowProc( pButtonWndProc,
                          hWnd,
                          uiMsg,
                          wParam,
                          lParam ));
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: DisplayBitmapUsingHdc                                   */
/*  Author: Bill Hallahan                                             */
/*  Date: January 27, 1994                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    Draw a Bitmap using the specified device context.               */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hDC               A handle to the window.                       */
/*                                                                    */
/*    pBITMAPFILEHdr    A pointer to a structure of type              */
/*                      LPBITMAPFILEHEADER.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void DisplayBitmapUsingHdc( HDC hDC,
                                   LPBITMAPFILEHEADER pBitmapFileHdr )
{
  LPBITMAPINFOHEADER pBitmapInfoHdr;
  LPVOID pDibBits;

  /********************************************************************/
  /*  We have the Bitmap                                              */
  /********************************************************************/

  pBitmapInfoHdr =
    (LPVOID)(( CHAR * )pBitmapFileHdr + sizeof( BITMAPFILEHEADER ));
  pDibBits =
    (LPVOID)(( CHAR * )pBitmapFileHdr + pBitmapFileHdr->bfOffBits );

  /********************************************************************/
  /*  Display the Device Independent Bitmap.                          */
  /********************************************************************/

  SetDIBitsToDevice( hDC,
                     0L,
                     0L,
                     (DWORD)pBitmapInfoHdr->biWidth,
                     (DWORD)pBitmapInfoHdr->biHeight,
                     0L,
                     0L,
                     0L,
                     pBitmapInfoHdr->biHeight,
                     (LPVOID)pDibBits,
                     (LPBITMAPINFO)pBitmapInfoHdr,
                     DIB_RGB_COLORS );
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: DisplayBitmapUsingHandle                                */
/*  Author: Bill Hallahan                                             */
/*  Date: January 27, 1994                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    Draw a Bitmap using the specified window handle.                */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd              A handle to the window.                       */
/*                                                                    */
/*    pBitmapFileHdr    A pointer to a structure of type              */
/*                      LPBITMAPFILEHEADER.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void DisplayBitmapUsingHandle( HWND hWnd,
                                      LPBITMAPFILEHEADER pBitmapFileHdr )
{
  HDC hDC;

  hDC = GetDC( hWnd );

  DisplayBitmapUsingHdc( hDC, pBitmapFileHdr );

  ReleaseDC( hWnd, hDC );

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: SelectOwnerDrawButton                                   */
/*  Author: Bill Hallahan                                             */
/*  Date: September 14, 1994                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function disables an owner draw button.                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    A handle to the button window.                          */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void SelectOwnerDrawButton( HWND hWnd )
{
  LPBUTTON_DATA_T pButtonData;

  EnableWindow( hWnd, TRUE );

  pButtonData = (LPBUTTON_DATA_T)GetWindowLong( hWnd, GWL_USERDATA );

  pButtonData->iButtonState = BUTTON_SELECTED;

  DisplayBitmapUsingHandle( hWnd, pButtonData->pSelectedDib );

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: DisableOwnerDrawButton                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: September 14, 1994                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function disables an owner draw button.                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    A handle to the button window.                          */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void DisableOwnerDrawButton( HWND hWnd )
{
  LPBUTTON_DATA_T pButtonData;

  EnableWindow( hWnd, FALSE );

  pButtonData = (LPBUTTON_DATA_T)GetWindowLong( hWnd, GWL_USERDATA );

  pButtonData->iButtonState = BUTTON_DISABLED;

  DisplayBitmapUsingHandle( hWnd, pButtonData->pDisabledDib );

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: EnableOwnerDrawButton                                   */
/*  Author: Bill Hallahan                                             */
/*  Date: September 14, 1994                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function enables an owner draw button.                     */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    A handle to the button window.                          */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void EnableOwnerDrawButton( HWND hWnd )
{
  LPBUTTON_DATA_T pButtonData;

  EnableWindow( hWnd, TRUE );

  pButtonData = (LPBUTTON_DATA_T)GetWindowLong( hWnd, GWL_USERDATA );

  pButtonData->iButtonState = BUTTON_ENABLED;

  DisplayBitmapUsingHandle( hWnd, pButtonData->pEnabledDib );

  return;
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

    BYTE    bVerWinMajor;
    BYTE    bVerWinMinor;
    UINT    uVerEnv;
    DWORD   dw;
    LRESULT lr;

    dw = GetVersion();

    //
    //  massage the version information into something intelligent
    //
    //
    bVerWinMajor = LOBYTE(LOWORD(dw));
    bVerWinMinor = HIBYTE(LOWORD(dw));
    uVerEnv      = HIWORD(dw);
    lr = MAKELPARAM(((UINT)bVerWinMajor << 8) | bVerWinMinor, uVerEnv);

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
    static TCHAR    szEnvWin32s[]       = TEXT("Win32s");

    wsprintf(pszEnvironment, szFormatVersion,
             (LPSTR)((0x8000 & uVerEnv) ? szEnvWin32s : szEnvWinNT),
             bVerWinMajor, bVerWinMinor);
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
    static TCHAR    szProcessorDunno[]  = TEXT("Dunno zYz");

    SYSTEM_INFO sysinfo;
    PTSTR       pszProcessor;

    //
    //  this is absolutely silly. one would think that the dwOemId member
    //  would provide something useful like the processor class... but
    //  no, it doesn't--it is always 0.
    //
    GetSystemInfo(&sysinfo);
    switch (sysinfo.dwProcessorType)
    {
        case PROCESSOR_INTEL_386:
        case PROCESSOR_INTEL_486:
//        case PROCESSOR_INTEL_860:
        case PROCESSOR_INTEL_PENTIUM:
            pszProcessor = szProcessorIntel;
            break;

//        case PROCESSOR_MIPS_R2000:
//        case PROCESSOR_MIPS_R3000:
        case PROCESSOR_MIPS_R4000:
            pszProcessor = szProcessorMIPS;
            break;

        case PROCESSOR_ALPHA_21064:
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

/* moved to coop.h -- ncs 12aug97
LPSTR szLocalMachineDECtalk =
  "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk";
*/
static void GetInstallationInfo( LPSTR szInstaller, LPSTR szCompany )
{
  HKEY hKey;
  DWORD dwType;
  DWORD cbData;

  char temp[512];

  strcpy(temp, szLocalMachineDECtalk);
  temp[strlen(szLocalMachineDECtalk) - 3] = '\0'; // chop off /GR, /LA, /SP, /UK, /US, etc.

  if ( RegOpenKeyEx( HKEY_LOCAL_MACHINE,
					 temp,
#ifdef OLD_CODE
					 szLocalMachineDECtalk,
#endif
                     0,
                     KEY_QUERY_VALUE,
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
/*    piX          A pointer to an integer that will contain the      */
/*                 X (horizontal) position of the application         */
/*                 window.                                            */
/*                                                                    */
/*    piY          A pointer to an integer that will contain the      */
/*                 Y (vertical) position of the application           */
/*                 window.                                            */
/*                                                                    */
/*    piShow       A pointer to an integer that will contain the      */
/*                 show state of the window.                          */
/*                                                                    */
/*    piTopMost    A pointer to an integer that will contain zero     */
/*                 if the window is not the top-most window.          */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

/* moved to coop.h -- ncs 12aug97
LPSTR szCurrentUsersTTSsrv =
  "Software\\DigitalEquipmentCorporation\\DECtalk\\Applications\\TTSsrv";
*/
static void GetApplicationParameters( int * piX,
                                      int * piY,
                                      int * piShow,
                                      int * piTop )
{
  HKEY hKey;
  DWORD dwType;
  DWORD cbData;
  DWORD dwXY;

  /********************************************************************/
  /*  Open the registry for the application.                          */
  /********************************************************************/

  if ( RegOpenKeyEx( HKEY_CURRENT_USER,
                     szCurrentUsersTTSsrv,
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
    *piTop = 0;
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
    /*  Read the former window top data to see if this is a TOPMOST   */
    /*  window.                                                       */
    /******************************************************************/

    cbData = 4;

    if ( RegQueryValueEx( hKey,
                          "Top",
                          NULL,
                          &dwType,
                          (LPBYTE)piTop,
                          &cbData ) != ERROR_SUCCESS )
    {
      *piTop = 0;
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
/*    hWnd    A handle to the application window.                     */
/*                                                                    */
/*    iTop    An integer that is non-zero if the window is a          */
/*            top-most window.                                        */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void SetApplicationParameters( HWND hWnd, int iTop )
{
  int iX;
  int iY;
  int iShow;
  HKEY hKey;
  DWORD cbData;
  DWORD dwXY;
  DWORD dwDisposition;
  WINDOWPLACEMENT WindowPlacement;

  /********************************************************************/
  /*  Open the registry for the application.                          */
  /********************************************************************/

  if ( RegOpenKeyEx( HKEY_CURRENT_USER,
                     szCurrentUsersTTSsrv,
                     0,
                     KEY_ALL_ACCESS,
                     &hKey ) != ERROR_SUCCESS )
  {
    /******************************************************************/
    /*  The specified key was NOT found in the registry. Create       */
    /*  the registry entries.                                         */
    /******************************************************************/

    if ( RegCreateKeyEx( HKEY_CURRENT_USER,
                         szCurrentUsersTTSsrv,
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
  }

  /******************************************************************/
  /*  Set the registry entry for to-most windows.                   */
  /******************************************************************/

  cbData = 4;

  RegSetValueEx( hKey,
                 "Top",
                 0,
                  REG_DWORD,
                 (LPBYTE)&iTop,
                 sizeof( DWORD ));

  /********************************************************************/
  /*  Close the registry.                                             */
  /********************************************************************/

  RegCloseKey( hKey );

  return;
}
