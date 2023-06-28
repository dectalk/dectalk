/****************************************************************************
*
*
*    PROGRAM: dtmemory.c
*
*    PURPOSE: Sample demonstrating the use DECtalk API's in Windows
*
*    FUNCTIONS:
*
*        WinMain() - calls initialization function, processes message loop
*        InitWindows() - creates child window controls
*        InitInstance() - saves instance handle and creates main window
*        MainWndProc() - processes messages
*        About() - processes messages for "About" dialog box
*        HandleScrollBar() - Logic for processing Rate Slider
*        HandleMenuPopup() - Logic for Menu enabling & disabling
*        OpenNewFile() - opens a new file
*        ProcessCDError() - uses CommonDialogExtendedError() to output useful error messages
*
*    COMMENTS:
*
*
*        The DECtalk APIs demonstrated in the sample include:
*
*        TextToSpeechStartup()            Initialize Text-To-Speech system
*        TextToSpeechSpeak()              Convert ASCII English to speech
*        TextToSpeechSetRate()            Change Speaking Rate
*        TextToSpeechSetSpeaker()         Change Predefined speaking voice
*        TextToSpeechPause()              Pause speech output
*        TextToSpeechResume()             Resume speech output
*        TextToSpeechShutdown()           Shutdown Text-To-Speech system
*        TextToSpeechReset()              Remove all data in Text-To-Speech system and return
*                                         to initial state
*
*****************************************************************************
*	001	cjl		04.16.97	Use symbol DTALK_HELP_FILE_NAME
*                           BATS#307
*	002 ncs     10.06.97	Changed start-up to exit out if
*                           TextToSpeechStartUp fails - BATS#474
*   003 MGS     11/02/1998	BATS #732 Fixed double mallocs and memory corruption
*   004 CAB     09/05/2000	Added check marks for menu
*	005	CAB		05/25/2001	Added update of version from coop.h
*/

#include <windows.h>    // includes basic windows functionality
#include <commdlg.h>    // includes common dialog functionality
#include <dlgs.h>       // includes common dialog template defines
#include <stdio.h>      // includes standard file i/o functionality
#include <string.h>     // includes string functions
#include <malloc.h>
#include <cderr.h>      // includes the common dialog error codes
#include <mmsystem.h>   // includes multimedia extensions
#include "dtmemory.h"   // includes dtmemory header file
#include "ttsapi.h"     // includes TextToSpeech API definitions
#if defined (__APPLE__)
#include <stdlib.h>
#endif

//
// Global variables and constants for the server defined here
//
#define  NSAMPLES         4096
#define  MAX_PHONEMES      128
#define  MAX_INDEX_MARKS   128
#define  MAX_STRING_LEN  32768
#define  NAUDIO_BUFFERS      1
#define  GWL_HINSTANCE	  (-6)

DWORD dVoice;			 // Checked voice in menu 

HANDLE       hInst;
OPENFILENAME OpenFileName;
CHAR         szDirName[256]  = "";
CHAR         szFile[256] = "\0";
CHAR         szFileTitle[256];
// Filter specification for the OPENFILENAME struct
CHAR         szFilter[] = "Text Files (*.TXT)\0*.TXT\0All Files (*.*)\0*.*\0";
LPCWSTR      *szAppName = TEXT("dtmemory");
CHAR         FileBuf[FILE_LEN+1];       // Buffer used to read in file.
CHAR         SelBuf[FILE_LEN+1] = "\0"; //Buffer used to extract Edit control selected region, used to speak selected text
HWND         hDlgFR;
HWND         hwndEdit, hwndButton1, hwndButton2, hwndButton3;
HWND         hwndSliderRate, hwndStaticRate;
RECT         rect;
static       LPTTS_HANDLE_T phTTS ;            /*  Text to Speech Handle used in every TextToSpeech Function Call*/
static LPTTS_BUFFER_T OnelpSpeechBuffer;
static LPTTS_BUFFER_T lpSpeechBuffers[NAUDIO_BUFFERS];
FILE * pOutFile;

LPSTR		 DECtalk_version;
//
// Function Prototypes
//

BOOL ProcessClientEvents( HWND, LPTTS_HANDLE_T, LPTTS_BUFFER_T * );

/****************************************************************************
*
*    FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
*
*    PURPOSE: calls initialization function, processes message loop
*
*    COMMENTS:
*
*
****************************************************************************/

int APIENTRY WinMain(
    HINSTANCE hInstance,
    HINSTANCE hPrevInstance,
    LPSTR lpCmdLine,
    int nCmdShow )
{

    MSG msg;
    DWORD error;                        /* message                      */
    WNDCLASS  wc;
    HWND hWnd = { 0 };
    CHAR szText[80] ="\0";
    ULONG version;
    
    version = TextToSpeechVersion(&DECtalk_version);

	/* Fill in window class structure with parameters that describe the       */
    /* main window.                                                           */

    wc.style = CS_HREDRAW | CS_VREDRAW ;  /* Class style(s).                    */
    wc.lpfnWndProc = (WNDPROC)MainWndProc;/* Function to retrieve messages for  */
					  /* windows of this class.             */
    wc.cbClsExtra = 0;                    /* No per-class extra data.           */
    wc.cbWndExtra = 0;                    /* No per-window extra data.          */
    wc.hInstance = NULL;                  /* Application that owns the class.   */
    wc.hIcon = LoadIcon( hInstance, TEXT("dtmemoryIcon") );
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = GetStockObject(WHITE_BRUSH);
    wc.lpszMenuName =  szAppName;         /* Name of menu resource in .RC file. */
    wc.lpszClassName = szAppName;         /* Name used in call to CreateWindow. */

    /* Register the window class and return success/failure code. */

    if (!RegisterClass(&wc))
    error = GetLastError();




    /* Save the instance handle in static variable, which will be used in  */
    /* many subsequence calls from this application to Windows.            */


    /* Create a main window for this application instance.  */

    hWnd = CreateWindowEx(
			NULL,
			szAppName,                     /* See RegisterClass() call.          */
			TEXT("DECtalk In-Memory Sample Application"),  /* Text for window title bar.         */
			WS_OVERLAPPEDWINDOW,           /* Window style.                      */
			0,                             /* Default horizontal position.       */
			0,                             /* Default vertical position.         */
			560,                           /* Default width.                     */
			280,                           /* Default height.                    */
			NULL,                          /* Overlapped windows have no parent. */
			NULL,                          /* Use the window class menu.         */
			NULL,                          /* This instance owns this window.    */
			NULL                           /* Pointer not needed.                */
		);



    /* If window could not be created, return "failure" */

    if (!hWnd)
    {
    error = GetLastError();
	return (FALSE);
    }
    /* Make the window visible; update its client area; and return "success" */

    ShowWindow(hWnd, nCmdShow);        /* Show the window                        */
    UpdateWindow(hWnd);                /* Sends WM_PAINT message                 */
    DragAcceptFiles(hWnd, TRUE);       //Accept files dragged from File Manager

    if  (strlen(lpCmdLine))            /* Check for command line parameter - open and speak %1 - filename if there is one */
    {
    if (RdFileToBuf( lpCmdLine, hWnd ))
	{
	   DrawMenuBar( hWnd);
	   // reset the title in the title bar to reflect the new open file
	   SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)lpCmdLine);
	   SendMessage(hwndEdit,WM_SETTEXT, 0, (LPARAM)FileBuf); //Copy file to Edit Control
	   InvalidateRect( hwndEdit, NULL, TRUE );DrawMenuBar( hWnd );
	}

	TextToSpeechSpeak(phTTS,FileBuf,TTS_FORCE);     //Speak data in FileBuf
    }
    /* Acquire and dispatch messages until a WM_QUIT message is received. */

    while (GetMessage(&msg,            /* message structure                      */
	    NULL,                      /* handle of window receiving the message */
	    0,                         /* lowest message to examine              */
	    0        )
	  )                            /* highest message to examine             */
	{
	TranslateMessage(&msg);        /* Translates virtual key codes           */
	DispatchMessage(&msg);         /* Dispatches message to window           */
	}
    return (msg.wParam);               /* Returns the value from PostQuitMessage */

}


/****************************************************************************
*
*    FUNCTION: MainWndProc(HWND, unsigned, WORD, LONG)
*
*    PURPOSE:  Processes messages
*
*    COMMENTS:
*
*        This function processes all messags sent to the window.  When the
*        user choses one of the options from one of the menus, the command
*        is processed here and passed onto the function for that command.
*
****************************************************************************/

LONG APIENTRY MainWndProc(
	HWND hWnd,                     /* window handle                   */
	UINT message,                  /* type of message                 */
	UINT wParam,                   /* additional information          */
	LONG lParam      )             /* additional information          */
{
	HDC hdc;
	PAINTSTRUCT ps;

static  BOOL bPause = TRUE;            // TRUE = Pause displayed, False = Resume displayed
static  SHORT wSpos = 180;
	CHAR szText[12] ="\0";
static  INT  cyborder ;
	DWORD dwStart, dwEnd ;
	LONG lSelect;
static  HDROP hDrop;
	INT j=0;
	INT i=0;
	CHAR szError[132];
	MMRESULT mmStatus;
        LPCTSTR lpszHelpFile = TEXT(DTALK_HELP_FILE_NAME);   // Name of DECtalk help file
static  UINT uiID_Error_Msg;
static UINT uiID_Buffer_Msg;  // Unique id used to signal when an audio
				// buffer is full of data.
	HANDLE hMenu;	// handle to menu

    switch (message)
	{


	case WM_CREATE:
	     //  InitWIndows function  creates all child windows
	     InitWindows(hWnd);

		hMenu = GetMenu(hWnd);
/*******************************************************************************************
	     Register a private message to report DECtalk asychronous events.
***************************************************************************************8****/
	     uiID_Error_Msg = RegisterWindowMessage("DECtalkErrorMessage");

/****************************************************************** 
	     Register a callback message for DECtalk buffers                
******************************************************************/

	     uiID_Buffer_Msg = RegisterWindowMessage("DECtalkBufferMessage");

/*******************************************************************************************
	     Initialize the Text to Speech system.
********************************************************************************************/

	     mmStatus = TextToSpeechStartup( hWnd,
					     &phTTS,WAVE_MAPPER,
					     DO_NOT_USE_AUDIO_DEVICE );

	     if (mmStatus == MMSYSERR_ERROR)
	       {
		 MessageBox( hWnd, TEXT("Can't find DECtalk Dictionary dectalk.dic, Shutting Down!"), NULL, MB_OK );
		 PostQuitMessage( 0 );

		 return FALSE;
	       }

	     if (mmStatus == MMSYSERR_NODRIVER)
	       {
		 MessageBox( hWnd, TEXT("No wave device present,\n Shutting Down!"), NULL, MB_OK );
		 PostQuitMessage( 0 );
		 return FALSE;
	       }

		 // ncs 06oct97 - error out of application if TextToSpeechStartUp Fails
	     if (mmStatus)
		 {
	       MessageBox( hWnd,
					   TEXT("There is an ERROR in Initializing the Text To Speech System.\n\nExiting Application."),
					   TEXT("DTmemory cannot be started."), MB_OK | MB_ICONSTOP );
		   return( -1 );
		 }

		 if (( pOutFile = fopen("memory.out","wb")) == NULL )
	       {
		  MessageBox( hWnd,
		     TEXT("Error Opening Output File"),
		     TEXT("Error Opening Output File"),
		     MB_ICONSTOP | MB_OK );
	       }

	       //
	       // Allocate room for N TextToSpeech Buffer's.
	       //

	       for( i = 0; i < NAUDIO_BUFFERS; i++ )
	       {
		  lpSpeechBuffers[i] = (LPTTS_BUFFER_T)malloc( sizeof( TTS_BUFFER_T ) );

		  if( lpSpeechBuffers[i] == (LPTTS_BUFFER_T) NULL )
		  {
		     MessageBox( hWnd,
			TEXT("No more memory to allocate for the TTS_BUFFER"),
			TEXT("Error"),
			MB_ICONSTOP | MB_OK );
    		        TextToSpeechShutdown( phTTS ) ;
			return FALSE;
		  }
		  /* MGS commented out, double malloc BATS #732*/
		  /* lpSpeechBuffers[i] =
		     (LPTTS_BUFFER_T)malloc(sizeof(TTS_BUFFER_T)); */

		  lpSpeechBuffers[i]->lpData = (LPSTR)malloc(NSAMPLES * sizeof(char));
		  lpSpeechBuffers[i]->dwMaximumBufferLength = NSAMPLES;
		  lpSpeechBuffers[i]->lpPhonemeArray =
			       (LPTTS_PHONEME_T)malloc( MAX_PHONEMES * sizeof(TTS_PHONEME_T));
		  lpSpeechBuffers[i]->dwMaximumNumberOfPhonemeChanges = MAX_PHONEMES;
		  lpSpeechBuffers[i]->lpIndexArray =
			       (LPTTS_INDEX_T) malloc( MAX_INDEX_MARKS * sizeof(TTS_INDEX_T));
		  lpSpeechBuffers[i]->dwMaximumNumberOfIndexMarks = MAX_INDEX_MARKS;
	     }

	     //
	     // Now that we know the WAVE_FORMAT to open the device, let's
	     // open it up.
	     //

	     mmStatus = TextToSpeechOpenInMemory( phTTS, WAVE_FORMAT_1M16 );

	     if( mmStatus )
	     {
		MessageBox( hWnd,
		     TEXT("Error Opening Memory, program exiting."),
		     TEXT("Error"),
		     MB_ICONSTOP | MB_OK );
                TextToSpeechShutdown( phTTS ) ;
		return FALSE;
	     }

	     //
	     // Add the audio buffers to memory
	     //

	     for( i = 0; i < NAUDIO_BUFFERS; i++ )
	     {
		mmStatus = TextToSpeechAddBuffer( phTTS, lpSpeechBuffers[i] );

		if( mmStatus )
		{
		   MessageBox( hWnd,
		       TEXT("Error Adding Buffer, program exiting."),
		       TEXT("Error"),
			MB_ICONSTOP | MB_OK );
                   TextToSpeechShutdown( phTTS ) ;
		   return FALSE;
		}
	     }

	     return FALSE;


	case WM_SETFOCUS :
	     SetFocus (hwndEdit) ;
	     return FALSE ;

	case WM_SIZE :  //Reposition all child windows when moved or resized

	     MoveWindow (hwndEdit, 0, 21, LOWORD (lParam),
						   HIWORD (lParam)-21L, TRUE) ;
	     MoveWindow (hwndButton1,  0, 0 , 75,20, TRUE) ;
	     MoveWindow (hwndButton2, 75, 0 , 75,20, TRUE) ;
	     MoveWindow (hwndButton3, 150, 0 , 75,20, TRUE) ;
	     MoveWindow (hwndSliderRate, 230, 0 , 200,20, TRUE) ;
	     MoveWindow (hwndStaticRate, 431, 0 , 120,20, TRUE) ;

	     return FALSE ;


	case WM_PAINT:      // Set up a display context to begin painting

	    hdc  = BeginPaint (hWnd, &ps);
	    EndPaint( hWnd, &ps );

	    break;

	case WM_INITMENUPOPUP: //Enable or gray menu items depending on current states

	    HandleMenuPopup(wParam);

	    return FALSE;

	case WM_HSCROLL:       // Rate slider control routine

	     if (((HWND)lParam) == hwndSliderRate)
	     {
	       wSpos = HandleScrollBar(wParam,wSpos);  // Call Scroll Bar handling routine
	       TextToSpeechSetRate(phTTS,(UINT)wSpos); // New rate returned in wSpos
	       return FALSE;
	     }
	     break;

	case WM_DROPFILES:   // Handle dropped files - open file, copy to edit control and speak

	     DragQueryFile ((HANDLE)wParam, 0, szFile, sizeof(szFile));
	     // Reset text to speech system
	     TextToSpeechReset(phTTS, FALSE);

	     //bPause= TRUE;
	     //SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");

	if (RdFileToBuf( szFile, hWnd ))
	{
	   DrawMenuBar( hWnd);
	   // reset the title in the title bar to reflect the
	   // new open file
	   SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)szFile);
	   SendMessage(hwndEdit,WM_SETTEXT, 0, (LPARAM)FileBuf);
	   InvalidateRect( hwndEdit, NULL, TRUE );DrawMenuBar( hWnd );
	}

	DragFinish ((HANDLE)wParam);
	TextToSpeechSpeak(phTTS,FileBuf,TTS_FORCE);
	return FALSE;



	case WM_COMMAND:               /* message: command from application menu */

	    if (wParam == 1 && HIWORD (lParam) == EN_ERRSPACE)
		MessageBox (hWnd, TEXT("EDIT control out of space."),
			   TEXT("DECtalk Sample Application"), MB_OK | MB_ICONSTOP) ;

	    switch( LOWORD( wParam ))
	    {
		case IDM_OPENFILE:      //menu file - open file
		    if ( OpenNewFile( hWnd ) == TRUE )
		    {
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)OpenFileName.lpstrFile);
			SendMessage(hwndEdit,WM_SETTEXT ,0,(LPARAM)FileBuf);
			InvalidateRect( hWnd, NULL, TRUE );
		     }
		    break;
	       /*  Edit menu selections - provides cut and paste to/from clipboard                        */

		case IDM_CUT:

		    SendMessage(hwndEdit,WM_CUT,0,0L);
		    break;

		case IDM_COPY:

		    SendMessage(hwndEdit,WM_COPY,0,0L);
		    break;

		case IDM_PASTE:

		    SendMessage(hwndEdit,WM_PASTE,0,0L);
		    break;

		case IDM_DELETE:

		    SendMessage(hwndEdit,WM_CLEAR,0,0L);
		    break;

	       /* Button window controls
		  Button 1 is start
		  Button 2 is pause / resume
		  Button 3 is stop                                                                   */

		case ID_BUTTON1:       //Start Button activated

		    GetWindowText(hwndEdit,FileBuf,32768);
		    TextToSpeechSpeak( phTTS, FileBuf, TTS_FORCE );
		    break;

		case ID_BUTTON2:       //Pause Resume  Button activated

		    if(bPause)
		    {
				if ( TextToSpeechPause(phTTS) == MMSYSERR_NOERROR )
				{
			   		bPause= FALSE;     // Toggle state of Pause / resume Button
			   		SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Resume");
				}
				break;
		    }
		    else
		    {
				if ( TextToSpeechResume(phTTS) == MMSYSERR_NOERROR )
				{
			   		bPause= TRUE;     // Toggle state of Pause / resume Button
			   		SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");
				}
				break;
		    }

		case ID_BUTTON3:       //Stop Button activated

		    mmStatus = TextToSpeechReset(phTTS, FALSE);

		    if ( mmStatus )
		    {
		      sprintf( szError, "Error = %d", mmStatus );

		      MessageBox( hWnd, szError, "TextToSpeechReset", MB_OK | MB_ICONSTOP );
		    }

	//            bPause = TRUE;
	//            SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");

		    break;

	      //  Handle requests to change speaking voice


		case  IDM_PAUL:
			// Added to check voice
			hMenu = GetMenu(hWnd);
			CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
			dVoice = IDM_PAUL; 
			CheckMenuItem(hMenu, dVoice, MF_CHECKED);

		    TextToSpeechSetSpeaker(phTTS,PAUL);
		    break;

		case  IDM_HARRY:
			// Added to check voice
			hMenu = GetMenu(hWnd);
			CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
			dVoice = IDM_HARRY; 
			CheckMenuItem(hMenu, dVoice, MF_CHECKED);

		    TextToSpeechSetSpeaker(phTTS,HARRY);
		    break;

		case  IDM_DENNIS:
			// Added to check voice
			hMenu = GetMenu(hWnd);
			CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
			dVoice = IDM_DENNIS; 
			CheckMenuItem(hMenu, dVoice, MF_CHECKED);

		    TextToSpeechSetSpeaker(phTTS,DENNIS);
		    break;

		case  IDM_FRANK:
			// Added to check voice
			hMenu = GetMenu(hWnd);
			CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
			dVoice = IDM_FRANK; 
			CheckMenuItem(hMenu, dVoice, MF_CHECKED);

		    TextToSpeechSetSpeaker(phTTS,FRANK);
		    break;

		case  IDM_RITA:
			// Added to check voice
			hMenu = GetMenu(hWnd);
			CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
			dVoice = IDM_RITA; 
			CheckMenuItem(hMenu, dVoice, MF_CHECKED);

		    TextToSpeechSetSpeaker(phTTS,RITA);
		    break;

		case  IDM_BETTY:
			// Added to check voice
			hMenu = GetMenu(hWnd);
			CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
			dVoice = IDM_BETTY; 
			CheckMenuItem(hMenu, dVoice, MF_CHECKED);

		    TextToSpeechSetSpeaker(phTTS,BETTY);
		    break;

		case  IDM_URSULA:
			// Added to check voice
			hMenu = GetMenu(hWnd);
			CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
			dVoice = IDM_URSULA; 
			CheckMenuItem(hMenu, dVoice, MF_CHECKED);

		    TextToSpeechSetSpeaker(phTTS,URSULA);
		    break;

		case  IDM_WENDY:
			// Added to check voice
			hMenu = GetMenu(hWnd);
			CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
			dVoice = IDM_WENDY; 
			CheckMenuItem(hMenu, dVoice, MF_CHECKED);

		    TextToSpeechSetSpeaker(phTTS,WENDY);
		    break;

		case  IDM_KIT:
			// Added to check voice
			hMenu = GetMenu(hWnd);
			CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
			dVoice = IDM_KIT; 
			CheckMenuItem(hMenu, dVoice, MF_CHECKED);

		    TextToSpeechSetSpeaker(phTTS,KIT);
		    break;


	   // Handle File - exit request

		case IDM_EXIT:

		    DestroyWindow(hWnd);
		    break;
	   // Display about box

		case IDM_ABOUT:

		    DialogBox(hInst,           /* current instance         */
			"AboutBox",            /* resource to use          */
			hWnd,                  /* parent handle            */
			(DLGPROC)About);       /* About Process()          */

		    break;

	   // Invoke win help with DECtalk help file
		case IDM_HELP:

		WinHelp(hWnd, lpszHelpFile, HELP_CONTENTS, 0L);

		    break;
		default:
		 break ;

	    }
	    break;

/*      This section implements Right Mouse Button click functionality.
*       This action will cause speaking of selected text in the Edit Control
*       Parent notify message is used to check for the right mouse button being activated.
*       The selected text is then spoken.
*                                                       */

	case WM_PARENTNOTIFY:

	    if (LOWORD(wParam) == WM_RBUTTONDOWN)

	     {  lSelect = SendMessage (hwndEdit, EM_GETSEL,(WPARAM)&dwStart,(LPARAM)&dwEnd) ;
	       if (HIWORD (lSelect) == LOWORD (lSelect))
	       {  MessageBox( hWnd, TEXT("No data selected"), NULL, MB_OK );
		  break;
	       }

	       else
		  {

		   GetWindowText(hwndEdit,FileBuf,32768);
		   strncpy  ((char*)SelBuf,(char*)&FileBuf[dwStart],(dwEnd - dwStart));
		   SelBuf[dwEnd - dwStart ] = '\0';
		   TextToSpeechSpeak( phTTS, SelBuf, TTS_FORCE );
		  }
	     }
	    break;

	// Make sure to shut down TextToSpeech system before exiting

	case WM_DESTROY:

	     fclose( pOutFile );


		/* MGS fix memory corrption on close  BATS #732*/		 
		 mmStatus = TextToSpeechCloseInMemory( phTTS );

	     if( mmStatus )
		MessageBox( hWnd,
		     TEXT("Error in MemoryClose, program exiting."),
		     TEXT("Error"),
		     MB_ICONSTOP | MB_OK );

		 for( i = 0; i < NAUDIO_BUFFERS; i++ )
	     {
		if( lpSpeechBuffers[i] != NULL )
		{
		  free(lpSpeechBuffers[i]->lpData);
		  free(lpSpeechBuffers[i]->lpPhonemeArray);
		  free(lpSpeechBuffers[i]->lpIndexArray);
		   free( lpSpeechBuffers[i] );
		lpSpeechBuffers[i]=NULL;
		}
	     }


	    TextToSpeechShutdown(phTTS);

	    PostQuitMessage(0);
	    break;

	default:
	   if( message == uiID_Buffer_Msg )
	   {

	      /****************************************************************/
	      /*  Send back the speech to the client, but first tell the      */
	      /*  client how much speech to expect.                           */
	      /****************************************************************/

	      OnelpSpeechBuffer = (LPTTS_BUFFER_T) lParam;

	      /********************************************************/
	      /* Got a buffer, write to a file                        */
	      /********************************************************/

	      if ( OnelpSpeechBuffer->dwBufferLength  > 0 )
	      {           
		 fwrite( OnelpSpeechBuffer->lpData, sizeof(CHAR),  
			  OnelpSpeechBuffer->dwBufferLength, pOutFile );
	      }

	      /********************************************************/
	      /* Requeue the buffer                                   */
	      /********************************************************/
	      mmStatus = TextToSpeechAddBuffer( phTTS, OnelpSpeechBuffer );

	      if( mmStatus )
	      {
		 MessageBox( hWnd,
		     TEXT("Error Adding Buffer, program exiting."),
		     TEXT("Error"),
		     MB_ICONSTOP | MB_OK );
		 return FALSE;
	      }
	   }

	   
	   if (message ==  uiID_Error_Msg )
	   {
	   //TextToSpeechReset(phTTS, FALSE);
	     switch (wParam)
	     {

	      case ERROR_IN_AUDIO_WRITE:
	      MessageBox(hWnd, TEXT("Error in Writing Audio"), TEXT("Async Error"), MB_OK | MB_ICONSTOP);
	      break;

	      case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
	      MessageBox(hWnd, TEXT("Error Opening Wave Out Device"), TEXT("Async Error"), MB_OK | MB_ICONSTOP);
	      break;

	      case ERROR_GETTING_DEVICE_CAPABILITIES:
	      MessageBox(hWnd, TEXT("Error Getting Audio Device Caps"), TEXT("Async Error"), MB_OK | MB_ICONSTOP);
	      break;

	      case ERROR_READING_DICTIONARY:
	      MessageBox(hWnd, TEXT("Error Reading Dictionary File \n dectalk.dic"), TEXT("Async Error"), MB_OK | MB_ICONSTOP);
	      break;

	      case ERROR_WRITING_FILE:
	      MessageBox(hWnd, TEXT("Error Writing File"), TEXT("Async Error"), MB_OK | MB_ICONSTOP);
	      break;

	      case ERROR_ALLOCATING_INDEX_MARK_MEMORY:
	      MessageBox(hWnd, TEXT("Error allocating Index Mark Memory"), TEXT("Async Error"), MB_OK | MB_ICONSTOP);
	      break;
	     }
	   }
	   break;
    }
    return (DefWindowProc(hWnd, message, wParam, lParam));
}

/****************************************************************************
*
*    FUNCTION: InitWindows()
*
*    PURPOSE:  Initialize all child windows. Draws buttons, sliders, edit control etc.
*
*    COMMENTS:
*
*
****************************************************************************/

BOOL  InitWindows(HWND hWnd)

{

	GetClientRect(hWnd,&rect);

	hwndEdit = CreateWindow (
	    TEXT("EDIT"),                    /* See RegisterClass() call.          */
	    TEXT(""),                        /* Text for window title bar.         */
	     WS_CHILD |WS_VISIBLE | WS_HSCROLL | WS_VSCROLL | WS_BORDER | ES_LEFT |
	     ES_MULTILINE | ES_AUTOHSCROLL | ES_AUTOVSCROLL, /* Window style.                      */
	    0L,                        /* Default horizontal position.       */
	    21L,                       /* Default vertical position.         */
	    rect.right,                /* Default width.                     */
	    rect.bottom-21L,           /* Default height.                    */
	    hWnd,                      /* Parent window                      */
	    (HMENU)ID_EDITCTL,         /* Use the window class menu.         */
	    (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   /* hInstance */
	    NULL);

	 //DragAcceptFiles(hwndEdit, TRUE);

	 hwndButton1 = CreateWindow (
	    TEXT("BUTTON"),                  /* See RegisterClass() call.          */
	    TEXT("Write File"),                   /* Text for window title bar.         */
	    WS_CHILD |WS_VISIBLE | BS_PUSHBUTTON,   /* Window style.                      */
	    0L,                        /* Default horizontal position.       */
	    0L,                        /* Default vertical position.         */
	    75L,                       /* Default width.                     */
	    20L,                       /* Default height.                    */
	    hWnd,                      /* Parent window                      */
	    (HMENU)ID_BUTTON1,         /* Child ID                           */
	    (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   /* hInstance */
	    NULL);

	hwndButton2 = CreateWindow (
	    TEXT("BUTTON"),                  /* See RegisterClass() call.          */
	    TEXT("Pause"),                   /* Text for window title bar.         */
	    WS_CHILD |WS_VISIBLE | BS_PUSHBUTTON,   /* Window style.                      */
	    75L,                       /* Default horizontal position.       */
	    0L,                        /* Default vertical position.         */
	    75L,                       /* Default width.                     */
	    20L,                       /* Default height.                    */
	    hWnd,                      /* Parent window                      */
	    (HMENU)ID_BUTTON2,         /* Child ID                           */
	    (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   /* hInstance */
	    NULL);

	hwndButton3 = CreateWindow (
	    TEXT("BUTTON"),                  /* See RegisterClass() call.          */
	    TEXT("Stop"),                    /* Text for window title bar.         */
	    WS_CHILD |WS_VISIBLE | BS_PUSHBUTTON,   /* Window style.                      */
	    150L,                      /* Default horizontal position.       */
	    0L,                        /* Default vertical position.         */
	    75L,                       /* Default width.                     */
	    20L,                       /* Default height.                    */
	    hWnd,                      /* Parent window                      */
	    (HMENU)ID_BUTTON3,         /* Child ID                           */
	    (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   /* hInstance */
	    NULL);

	hwndSliderRate = CreateWindow (
	    TEXT("SCROLLBAR"),               /* See RegisterClass() call.          */
	    TEXT(""),                        /* Text for window title bar.         */
	    WS_CHILD |WS_VISIBLE | SBS_HORZ ,       /* Window style.                      */
	    230L,                      /* Default horizontal position.       */
	    0L,                        /* Default vertical position.         */
	    200L,                      /* Default width.                     */
	    20L,                       /* Default height.                    */
	    hWnd,                      /* Parent window                      */
	    (HMENU)ID_SBRATE,          /* Child ID                           */
	    (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   /* hInstance */
	    NULL);

	hwndStaticRate = CreateWindow (
	    TEXT("STATIC"),                  /* See RegisterClass() call.          */
	    TEXT("Rate 180 WPM"),            /* Text for window title bar.         */
	    WS_CHILD |WS_VISIBLE |WS_BORDER
	    | SS_CENTER  ,             /* Window style.                      */
	    431L,                      /* Default horizontal position.       */
	    0L,                        /* Default vertical position.         */
	    120L,                      /* Default width.                     */
	    20L,                       /* Default height.                    */
	    hWnd,                      /* Parent window                      */
	    (HMENU)ID_SSRATE,          /* Child ID                           */
	    (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   /* hInstance */
	    NULL);

	SetScrollRange (hwndSliderRate,SB_CTL,75,600, TRUE); //Set Rate Range 75 - 600 WPM
	SetScrollPos(hwndSliderRate, SB_CTL, 180 , TRUE)  ;  //Set default rate

	return (FALSE);
}
/****************************************************************************
*
*    FUNCTION: HandleScrollBar()
*
*    PURPOSE:  Handle all "Seaking Rate" Scroll Bar Logic
	       Line logic changes speaking rate in increments of 5 Words Per Minute
	       Page Logic Changes in 20 word per minutes
	       Thumbtrack is rounded to 5 WPM boundries
*
*    COMMENTS: The return value is the new selected rate in WPM
*
*
****************************************************************************/

SHORT  HandleScrollBar(WPARAM wParam, SHORT wSpos)


{

static  CHAR szText[12] ="\0";

	switch(LOWORD(wParam))
	    {

	     case SB_PAGEDOWN:         // Increment Rate Slider by 20 to Max of 600
		if (wSpos > 580)
		   wSpos = 600;
		else
		   wSpos += 20;
		break;

	     case SB_LINEDOWN:         // Increment Rate Slider by 5 to Max of 600
		if (wSpos > 595)
		   wSpos = 600;
		else
		   wSpos   += 5;
		break;

	     case SB_PAGEUP:           // Decrement Rate Slider by 20 to Min of 75
		if (wSpos < 95)
		   wSpos = 75;
		else
		   wSpos   -= 20;
		break;

	     case SB_LINEUP:           // Increment Rate Slider by 5 to Max of 75
		if (wSpos < 80)
		   wSpos = 75;
		else
		   wSpos   -= 5;
		break;

	     case SB_TOP:              // Rate Slider to Max
		wSpos   =600;
		break;

	     case SB_BOTTOM:           // Rate Slider to Min
		wSpos   = 75;
		break;

	     case SB_THUMBPOSITION:

	     case SB_THUMBTRACK:
		wSpos = ((HIWORD(wParam))/5)*5;       // Round speaking rate to nearest 5

	     default:
	     break;
	    }
	     SetScrollPos(hwndSliderRate, SB_CTL, wSpos , TRUE)  ; // Set Slider Control position
	     wsprintf(szText, TEXT("Rate %d WPM"), wSpos );
	     SetWindowText(hwndStaticRate,szText );   // Display Rate in Static control
	     return (wSpos);
}

/****************************************************************************
*
*    FUNCTION: HandleMenuPopup()
*
*    PURPOSE:  Handle Edit menu popup logic. This Function grays or enables the
*              appropriate menu entries, depending on the current state of the system.
*
*
*
*    COMMENTS:
*
*
****************************************************************************/


void    HandleMenuPopup(WPARAM wParam) // wParam is handle of menu

{
LONG lSelect;
WORD wEnable ;

	  if (IsClipboardFormatAvailable (CF_TEXT))
		 EnableMenuItem((HANDLE)wParam, IDM_PASTE, MF_ENABLED);

	  else   EnableMenuItem((HANDLE)wParam, IDM_PASTE,MF_GRAYED);

	    /*Enable  menu cut, copy & delete menu items if data is selected */

	    lSelect = SendMessage (hwndEdit, EM_GETSEL,0L, 0L) ;
	    if (HIWORD (lSelect) != LOWORD (lSelect))
		 wEnable= MF_ENABLED;
	    else wEnable= MF_GRAYED ;

	    EnableMenuItem ((HANDLE)wParam, IDM_CUT, wEnable);
	    EnableMenuItem ((HANDLE)wParam, IDM_COPY, wEnable);
	    EnableMenuItem ((HANDLE)wParam, IDM_DELETE, wEnable);

	    return ;
}



/****************************************************************************
*
*    FUNCTION: About(HWND, UINT, UINT, LONG)
*
*    PURPOSE:  Processes messages for "About" dialog box
*
*    COMMENTS:
*
*       No initialization is needed for this particular dialog box, but TRUE
*       must be returned to Windows.
*
*       Wait for user to click on "Ok" button, then close the dialog box.
*
****************************************************************************/

BOOL APIENTRY About(
	HWND hDlg,                              /* window handle of the dialog box */
	UINT message,                           /* type of message                 */
	UINT wParam,                            /* message-specific information    */
	LONG lParam)
{
    HWND hDlgItem;

	switch (message)
    {
	case WM_INITDIALOG:                     /* message: initialize dialog box */
	    /******************************************************************/
		/* Display the version of DECtalk DLL file                        */
		/******************************************************************/
		hDlgItem = GetDlgItem( hDlg, IDC_DECTALK_VERSION );
		SetWindowText( hDlgItem, DECtalk_version);

		return (TRUE);

	case WM_COMMAND:                        /* message: received a command */
	    if (LOWORD(wParam) == IDOK          /* "OK" box selected?        */
		|| LOWORD(wParam) == IDCANCEL)

	    {                                   /* System menu close command? */
		EndDialog(hDlg, TRUE);          /* Exits the dialog box        */
		TextToSpeechSpeak( phTTS, "DECtalk Sample Application", TTS_FORCE );
		return (TRUE);
	    }
	    break;
    }
    return (FALSE);                             /* Didn't process a message    */

}

/****************************************************************************
*
*    FUNCTION: OpenNewFile(HWND)
*
*    PURPOSE:  Invokes common dialog function to open a file and opens it.
*
*    COMMENTS:
*
*        This function initializes the OPENFILENAME structure and calls
*        the GetOpenFileName() common dialog function.
*
*    RETURN VALUES:
*        TRUE - The file name was obtained successfully
*        FALSE - No file name was obtained.
*
****************************************************************************/
BOOL OpenNewFile( HWND hWnd)
{


   strcpy( szFile, "");
   strcpy( szFileTitle, "");

   OpenFileName.lStructSize       = sizeof(OPENFILENAME);
   OpenFileName.hwndOwner         = hWnd;
   OpenFileName.hInstance         = (HANDLE) hInst;
   OpenFileName.lpstrFilter       = szFilter;
   OpenFileName.lpstrCustomFilter = (LPSTR) NULL;
   OpenFileName.nMaxCustFilter    = 0L;
   OpenFileName.nFilterIndex      = 1L;
   OpenFileName.lpstrFile         = szFile;
   OpenFileName.nMaxFile          = sizeof(szFile);
   OpenFileName.lpstrFileTitle    = szFileTitle;
   OpenFileName.nMaxFileTitle     = sizeof(szFileTitle);
   OpenFileName.lpstrInitialDir   = NULL;
   OpenFileName.lpstrTitle        = TEXT("Open a File");
   OpenFileName.nFileOffset       = 0;
   OpenFileName.nFileExtension    = 0;
   OpenFileName.lpstrDefExt       = TEXT("*.txt");
   OpenFileName.lCustData         = 0;
   OpenFileName.Flags =  OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY;

   if (GetOpenFileName(&OpenFileName))
      {
      if (RdFileToBuf( OpenFileName.lpstrFile, hWnd ))
	 return TRUE;
      else
	 return FALSE;
      }
    else
    {
      ProcessCDError(CommDlgExtendedError(), hWnd );
      return FALSE;
    }

}
/****************************************************************************************
* FUNCTION: RdFileToBuf()
*
*    PURPOSE:  Opens and reads a file into FileBuf
*
*    COMMENTS:
*
*        This function
*
*    RETURN VALUES:
*        TRUE - The file was opened successfully and read into the buffer.
*        FALSE - No files were opened.
*
*
************************************************************************************/
BOOL RdFileToBuf( LPTSTR lpszFile, HWND hWnd )

{

   OFSTRUCT OfStruct;
   int hFile;
   int cBufLen;

      // open the file
      hFile = OpenFile(lpszFile, &OfStruct, OF_READ );
      if (hFile == -1)
      {
	 MessageBox( hWnd, TEXT("File open failed."), NULL, MB_OK );
	 return FALSE;
      }
      else
      // read it's contents into a buffer
      cBufLen = _lread( hFile, FileBuf, FILE_LEN );
      if (cBufLen == -1)
      {
	 MessageBox( hWnd, TEXT("Zero bytes read."), NULL, MB_OK );
	 return FALSE;
      }
      else
      {
	    FileBuf[cBufLen]='\0';
	    // close the file
	    _lclose( hFile );


       }


    return TRUE;


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

   switch(dwErrorCode)
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

   LoadString(NULL, wStringID, buf, sizeof(buf));
   MessageBox(hWnd, buf, NULL, MB_OK);
   return;
}


/****************************************************************************
*
*    FUNCTION: ProcessClientEvents( HWND, LPTS_HANDLE_T, LPTTS_BUFFER_T * )
*
*    PURPOSE:  Read all text to speech requests from the client as well
*              as any changes to the speaker's characteristics.  Then
*              compute the WAVE audio translation of the ascii text and
*              return the acoustic data back to the client.
*
*    COMMENTS:
*
*
****************************************************************************/

BOOL ProcessClientEvents( HWND hWnd, LPTTS_HANDLE_T phTTS, LPTTS_BUFFER_T * lpSpeechBuffer )
{
  MMRESULT      status;
  DWORD dwCharCount;
  char textString[256];
  FILE * pFile;

  //
  // Perform the text to speech
  //
  pFile = fopen("xxx.xxx","r");

  if ( pFile == NULL )
  {
    {
      MessageBox( hWnd, TEXT("Error opening file, program exiting."), NULL, MB_ICONSTOP | MB_OK );
      return FALSE;
    }
  }
  else
  {
    TextToSpeechSpeak( phTTS, "[:index mark 01]", TTS_NORMAL );

    do
    {
      dwCharCount = (DWORD)fread( textString, 1, 255, pFile );
      textString[dwCharCount] = '\0';

      status = TextToSpeechSpeak( phTTS, textString, TTS_NORMAL );

      if( status )
      {
	MessageBox( hWnd, TEXT("Error with Speak, program exiting."), NULL, MB_ICONSTOP | MB_OK );
	return FALSE;
      }
    }
    while( ! feof( pFile ));

    TextToSpeechSpeak( phTTS, "[:index mark 99]", TTS_NORMAL );

    TextToSpeechSpeak( phTTS, " ", TTS_FORCE );

    fclose( pFile );

    TextToSpeechSync( phTTS );
  }
  return TRUE;
}
