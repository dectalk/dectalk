/****************************************************************************
*
*
*    PROGRAM: DtSample.c
*
*    PURPOSE: Sample demonstrating the use DECtalk API's in Windows
*
*    FUNCTIONS:
*
*       About() - processes messages for "About" dialog box
*       destroyDectalk() - removes the list and shutsdown the dectalk threads 
*       HandleMenuPopup() - Logic for Menu enabling & disabling
*       HandleScrollBar() - Logic for processing Rate Slider
*       InitDectalk() - initiales the thread in a list and calls TTS_Startup()
*       InitWindows() - creates child window controls
*       MainWndProc() - processes messages
*       OpenNewFile() - opens a new file
*       ProcessCDError() - uses CommonDialogExtendedError() to output useful error messages
*       switchLangs() - switches dectalk lang threads
*       WinMain() - calls initialization function, processes message loop
*
*    COMMENTS:
*
*
*       The DECtalk APIs demonstrated in the sample include:
*
*       TextToSpeechStartupEx()         Initialize Text-To-Speech system
*       TextToSpeechSpeak()             Convert ASCII English to speech
*       TextToSpeechGetStatus()         Checking to see if speech is being produced
*       TextToSpeechSetRate()               Change Speaking Rate
*       TextToSpeechSetSpeaker()            Change Predefined speaking voice
*       TextToSpeechPause()             Pause speech output
*       TextToSpeechResume()                Resume speech output
*       TextToSpeechShutdown()          Shutdown Text-To-Speech system
*       TextToSpeechReset()             Remove all data in Text-To-Speech system and return
*                                           to initial state
*       TextToSpeechStartLang()         It checks for installed languages and loads into the ML engine
*       TextToSpeechSelectLang()        It selects a looaded language for a program thread
*       TextToSpeechEnumLangs()         This gives a structure of all availible languages and names of each one.
*
***************************************************************************************/
/* 001	MFG		10/01/1998	first revision for Windows CE  							*/
/* 002  MFG     11/12/1998  removed stdio.h CE does not support it                	*/
/* 003  JHU     11/30/1998  Added ACCESS32 features(TYPING and HIGHLIGHTING MODE) 	*/ 
/* 004	MFG		02/10/1999	Added Multi language capiblty	  						*/
/* 005  CAB     05/11/2000  Added check option to menu of voices, languages, speak	*/
/*							and rate												*/
/* 006	CAB		05/15/2000	Added save function to store data before closing		*/
/*							program													*/
/* 007  CAB		07/05/2000	Changed MMSYSERR_ERROR to MMSYSERR_INVALPARAM for     	*/
/*							error when it can't find dectalk dictionary.			*/
/* 008	CAB		08/23/2000	Removed OpenFileName.lCustData and OFN_HIDEREADONLY   	*/
/*							not supported by windows CE.                          	*/
/* 009	CAB		08/24/2000	Changed OpenFileName.lpstrDefExt to only three			*/
/*							characters												*/
/* 007	MFG		01/31/2001	added sizing for palm-size and Pocket PC				*/	
/*																					*/
/* 008	MFG		02/19/2001	added French support									*/
/*																					*/
/* 009	MFG		02/19/2001	cleaned up the app										*/
/*																					*/
/* 010	MFG		03/29/2001  Changed WinMain entry point								*/
/*																					*/
/* 011	MFG		09/19/2001	Fixed the opening a closing of large files				*/
/*																					*/
/* 012  MFG		11/05/2001	Added code checkRunning so it would only start one		*/
/*							instance of the Appliication							*/
/************************************************************************************/

#include <windows.h>    // includes basic windows functionality
#include <commdlg.h>    // includes common dialog functionality
#include "resource.h"
#include "dlgs.h"       // includes common dialog template defines
#include <tchar.h>
#include <commctrl.h>

#include <string.h>     // includes string functions
#include <mmsystem.h>   // includes multimedia extensions
#include "dtsample.h"   // includes Dtsample header file
#include "ttsapi.h"     // includes TextToSpeech API definitions

#if	(UNDER_CE != 200)
#include <wce.h>
#endif

//Global Varibales
#define GWL_HINSTANCE	(-6)
typedef HANDLE HDROP;
HINSTANCE hInstance = NULL;


HWND hWndCB =NULL;       // Handle to a commandbar
HMENU hMenu =NULL;       // Handle to a commandbar menu

DWORD dVoice;			 // Checked voice in menu 
DWORD dRate;			 // Checked rate in menu
DWORD dSpeak;			 // Checked start,stop,pause in menu speak
	
HINSTANCE hInst = NULL;		//local copy of hInstance
HWND hWnd =NULL;				//Main Window handle

#define COMBOID	100

OPENFILENAME OpenFileName;
TCHAR        szFile[MAX_PATH] = TEXT("\0");



TCHAR        szFilter[] = TEXT("Text Files (*.TXT)\0*.TXT\0All Files (*.*)\0*.*\0");
TCHAR        szDirName[256]  = TEXT("");

TCHAR        szFileTitle[256];

TCHAR        szAppName[]  = TEXT("DtSample");
TCHAR        FileBuf[FILE_LEN+1];       // Buffer used to read in file.
char         SelBuf[FILE_LEN+1] = "\0"; //Buffer used to extract Edit control selected region, used to speak selected text

HWND         hDlgFR;
HWND         hwndEdit, hwndButton1, hwndButton2, hwndButton3;
HWND         hwndSliderRate, hwndStaticRate;
RECT         rect;

static       LPTTS_HANDLE_T phTTS[20] ;  /*  Text to Speech Handle used in every TextToSpeech Function Call*/
TTS_LANG_MAP* ptts_select = NULL;
TTS_LANG_MAP_START ttsstart;
LPLANG_ENUM languageINFO;
unsigned int current_rate = 200;        // ncs - Used for keeping track of the speaking rate
BOOL checkRunning();

#ifdef ACCESS32
void update_mark(ULONG);
void TTSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);
BOOL APIENTRY PrimaryTypingDlgProc(HWND hWnd, UINT uiMsg, WPARAM wParam, LPARAM lParam);
BOOL SpeakText( HANDLE );
FARPROC OldPrimaryTypingDlgProc;
int highlight = 1;      // ncs - Highlighting enabled by default
int menutalk  = 1;      // ncs - Menutalk enabled by default
int typing_mode = 1;    // ncs - Typing Mode enabled by default

typedef struct mark_pos_struct {
    ULONG start;
    ULONG end;
    struct mark_pos_struct *next_mark;
} MARK_POS;
MARK_POS *mark_pos = NULL;

#define     MIN_WPM     50
#else
#define     MIN_WPM     75
#endif


static TBBUTTON tbVIEWButton[] = {
	{ID_BUTTON1, ID_BUTTON1, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0, 0},
	{ID_BUTTON2, ID_BUTTON2, TBSTATE_ENABLED, TBSTYLE_CHECK, 0, 1},
	{ID_BUTTON3, ID_BUTTON3, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0, 2}
};

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

int WINAPI WinMain (
                     HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPWSTR lpCmdLine,
                     int nCmdShow )
{
    
    MSG msg;
    DWORD error;                        /* message                      */
    WNDCLASS  wc;

    char szText[80] ="\0";
   
 /*check and see if an instance is already running*/  	
 if(checkRunning() == TRUE) return 0;

    /* Fill in window class structure with parameters that describe the       */
    /* main window.                                                           */
    
    wc.lpfnWndProc = (WNDPROC)MainWndProc;/* retrieve messages forwindows of this class.*/
    wc.cbClsExtra = 0;                    /* No per-class extra data.           */
    wc.cbWndExtra = 0;                    /* No per-window extra data.          */
    wc.hInstance = hInstance;                  /* Application that owns the class.   */
    wc.style = CS_HREDRAW | CS_VREDRAW;  /* Class style(s).                    */
    wc.hIcon = NULL;
    wc.hCursor = NULL;
    wc.lpszMenuName =  NULL;         /* Not supported in windows CE */
    wc.lpszClassName = szAppName;         /* Name used in call to CreateWindow. */
    wc.hbrBackground = (HBRUSH)GetStockObject(WHITE_BRUSH);
    
    /* Register the window class and return success/failure code. */
    
    if (!RegisterClass(&wc))
        error = GetLastError();
    
    hInst = hInstance;;

    /* Save the instance handle in static variable, which will be used in  */
    /* many subsequence calls from this application to Windows.            */
    
    /* Create a main window for this application instance.  */
    hWnd = CreateWindow(
        szAppName,							/* See RegisterClass() call.          */
        TEXT("DECtalk Sample Application"), /* Text for window title bar.         */
		WS_VISIBLE,
		CW_USEDEFAULT,						/* Default horizontal position.       */
        CW_USEDEFAULT,						/* Default vertical position.         */
        CW_USEDEFAULT,						/* Default width.                     */
        CW_USEDEFAULT,						/* Default height.                    */
        NULL,								/* Overlapped windows have no parent. */
        NULL,								/* Use the window class menu.         */
        hInstance,							/* This instance owns this window.    */
        NULL								/* Pointer not needed.                */
        );


    /* If window could not be created, return "failure" */
    
    if (!hWnd)
    {
        error = GetLastError();
        return (FALSE);
    }

 /* Make the window visible; update its client area; and return "success" */

    ShowWindow(hWnd,SW_SHOW);         /* Show the window                        */
	UpdateWindow(hWnd);               /* Sends WM_PAINT message                 */
	
    while (GetMessage(&msg,           /* message structure                      */
        NULL,                         /* handle of window receiving the message */
        0,                            /* lowest message to examine              */
        0)
        == TRUE)                      /* highest message to examine             */
    {
        TranslateMessage(&msg);       /* Translates virtual key codes           */
        DispatchMessage(&msg);        /* Dispatches message to window           */
    }
    
    return (msg.wParam);			  /* Returns the value from PostQuitMessage */
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

LONG APIENTRY MainWndProc( HWND hWnd,					/* window handle                   */
                           UINT message,				/* type of message                 */
                           UINT wParam,					/* additional information          */
                           LONG lParam    )				/* additional information          */
{
    HDC hdc;
    PAINTSTRUCT ps;
    
    static  BOOL bPause = TRUE;         // TRUE = Pause displayed, False = Resume displayed
    static  BOOL bStatus = FALSE;       // TRUE = Audio dev in use, False = Audio dev not in use
	static	HDROP hDrop;
    static  int  cyborder ;
    static  short wSpos = 180;
    static  unsigned int uiID_Error_Msg;
    char szText[12] ="\0";
    TCHAR szError[132];
    int j=0;
    MMRESULT mmStatus;
    LPCTSTR lpszHelpFile = TEXT(DTALK_HELP_FILE_NAME);   // Name of DECtalk help file
    LPCTSTR lpszHelpTopic = TEXT("Sample applet, description");


    int idArray[3];
    int statArray[3];
    
#ifdef ACCESS32
    MARK_POS *next;
    MENUITEMINFO menuinfo;
#endif
    
    idArray[0]=STATUS_SPEAKING;
    
    switch (message)
    {
        
		case WM_CREATE:

			// Start by initializing the command bar

			GetClientRect(hWnd, &rect);
			hWndCB = CommandBar_Create(hInst, hWnd, 1); //mfgce
			CommandBar_AddBitmap(hWndCB, hInst, IDB_BUTTONS, 3, 0, 0);

#ifdef ACCESS32 
	CommandBar_InsertMenubar(hWndCB, hInst,IDM_MAIN_MENU_CEA32, 0);
#elif  defined(_WIN32_WCE_PSPC)
	CommandBar_InsertMenubar(hWndCB, hInst,IDM_MAIN_MENU_PALM, 0);
#else
	CommandBar_InsertMenubar(hWndCB, hInst,IDM_MAIN_MENU_CE1, 0);
#endif	// ACCESS32
	
	CommandBar_AddButtons(hWndCB, sizeof(tbVIEWButton)/sizeof(TBBUTTON), tbVIEWButton);
#if  !defined(_WIN32_WCE_PSPC)
	CommandBar_AddAdornments(hWndCB,CMDBAR_HELP,0);
#endif			
			hMenu	= CommandBar_GetMenu(hWndCB,0);
			
			InitWindows(hWnd);
			
			// Set initial check for menus
			dVoice = IDM_PAUL;
			dRate = IDM_SPEAK200;
			dSpeak = IDM_SPEAKSTOP;
			
			hMenu = CommandBar_GetMenu(hWndCB, 0);
			CheckMenuItem(hMenu, dVoice, MF_CHECKED); 
			CheckMenuItem(hMenu, dRate, MF_CHECKED);
			CheckMenuItem(hMenu, dSpeak, MF_CHECKED);
			/*******************************************************************************************
			Register a private message to report DECtalk asychronous events.
			***************************************************************************************8****/
			uiID_Error_Msg = RegisterWindowMessage(TEXT("DECtalkErrorMessage"));
			
			return InitDectalk(hWnd, &ttsstart);

    
		case WM_PAINT:      // Set up a display context to begin painting
        
			hdc  = BeginPaint (hWnd, &ps);
			EndPaint( hWnd, &ps );
			
			break;

#ifndef UNDER_CE //mfgdebug maybe removed in future
        

		case WM_SETFOCUS :
			SetFocus (hwndEdit) ;
			return FALSE ;
        
		case WM_SIZE :  //Reposition all child windows when moved or resized
        
			MoveWindow (hwndEdit, 0, 21, LOWORD (lParam), HIWORD (lParam)-21L, TRUE) ;
			MoveWindow (hwndButton1,  0, 0 , 75,20, TRUE) ;
			MoveWindow (hwndButton2, 75, 0 , 75,20, TRUE) ;
			MoveWindow (hwndButton3, 150, 0 , 75,20, TRUE) ;
			MoveWindow (hwndSliderRate, 230, 0 , 200,20, TRUE) ;
			MoveWindow (hwndStaticRate, 431, 0 , 120,20, TRUE) ;
			
			return FALSE ;
        
        
        
		case WM_INITMENUPOPUP: //Enable or gray menu items depending on current states
        
			HandleMenuPopup(wParam);
        
        return FALSE;
        
		case WM_HSCROLL:       // Rate slider control routine
			if (((HWND)lParam) == hwndSliderRate)
			{
				wSpos = HandleScrollBar(wParam,wSpos);  // Call Scroll Bar handling routine
				TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],(UINT)wSpos); // New rate returned in wSpos
				current_rate = wSpos;
				return FALSE;
			}
			break;
#endif	// UNDER_CE
       
		case WM_COMMAND:               /* message: command from application menu */
			if (wParam == 1 && HIWORD (lParam) == EN_ERRSPACE)
				MessageBox (hWnd, TEXT("EDIT control out of space."),
			                TEXT("DECtalk Sample Application for Windows C E"),MB_OK | MB_ICONSTOP);
			
			if(LOWORD(wParam) >= IDM_LANG_BEGIN && LOWORD(wParam) < IDM_LANG_END)
			{
				switchLangs(hWnd, &ttsstart, wParam);   
			}
			else
			{
				switch( LOWORD( wParam ))
				{
					case IDM_NEW:      //menu file - open file
						DrawMenuBar( hWnd);
						OpenFileName.lpstrFile = NULL;
						_tcscpy( szFile, TEXT("untitled.txt"));
						FileBuf[0] =TEXT('\0');
						SendMessage(hwndEdit,WM_SETTEXT ,0,(LPARAM)((LPCTSTR)FileBuf));
						InvalidateRect( hWnd, NULL, TRUE );
						break;

					case IDM_OPENFILE:      //menu file - open file
						if ( OpenNewFile( hWnd ) == TRUE )
						{
							DrawMenuBar( hWnd);
							// reset the title in the title bar to reflect the
							// new open file
							SendMessage(hwndEdit,WM_SETTEXT ,0,(LPARAM)((LPCTSTR)FileBuf));
							InvalidateRect( hWnd, NULL, TRUE );
						}
						break;
						
					case IDM_SAVEASFILE:      //menu file -  save as file
						GetWindowText(hwndEdit,FileBuf,sizeof(FileBuf)/sizeof(TCHAR));
						if ( SaveNewFile( hWnd ,IDM_SAVEASFILE ) == TRUE )
						{
							DrawMenuBar( hWnd);
							SendMessage(hwndEdit,WM_SETTEXT ,0,(LPARAM)((LPCTSTR)FileBuf));
							InvalidateRect( hWnd, NULL, TRUE );
						}
						break;

					case IDM_SAVEFILE:      //menu file - save file
						GetWindowText(hwndEdit,FileBuf,sizeof(FileBuf)/sizeof(TCHAR));
						if ( SaveNewFile( hWnd, IDM_SAVEFILE ) == TRUE )
						{
							DrawMenuBar( hWnd);
							SendMessage(hwndEdit,WM_SETTEXT ,0,(LPARAM)((LPCTSTR)FileBuf));
							InvalidateRect( hWnd, NULL, TRUE );
						}
						break;
						
						
						/*  Edit menu selections - provides cut and paste to/from clipboard                       */
                
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

#ifdef ACCESS32
					// Place the following in the #ifdef section so that these can
					// be stripped out for non ACCESS32 kits
					case IDM_HIGHLIGHT_ON:           
						highlight = 1;
						menuinfo.cbSize = sizeof(MENUITEMINFO);
						menuinfo.fMask = MIIM_STATE;				
						menuinfo.fState = MFS_CHECKED;					
						SetMenuItemInfo(hwndEdit, IDM_HIGHLIGHT_ON, FALSE, &menuinfo);			
						break;
					case IDM_HIGHLIGHT_OFF:
						highlight = 0;
						menuinfo.cbSize = sizeof(MENUITEMINFO);
						menuinfo.fMask = MIIM_STATE;				
						menuinfo.fState = 0;
						SetMenuItemInfo(hwndEdit, IDM_HIGHLIGHT_OFF, FALSE, &menuinfo);				
						break;
					case IDM_TYPING_ON:
						typing_mode = 1;
						menuinfo.cbSize = sizeof(MENUITEMINFO);
						menuinfo.fMask = MIIM_STATE;
						menuinfo.fState = MFS_CHECKED;
						SetMenuItemInfo(hwndEdit, IDM_TYPING_ON, FALSE, &menuinfo);
						break;
					case IDM_TYPING_OFF:
						typing_mode = 0;
						menuinfo.cbSize = sizeof(MENUITEMINFO);
						menuinfo.fMask = MIIM_STATE;
						menuinfo.fState = 0;
						SetMenuItemInfo(hwndEdit, IDM_TYPING_OFF, FALSE, &menuinfo);
						break;               
#endif	// ACCESS32
                
						/* Button window controls
						Button 1 is start
						Button 2 is pause / resume
						Button 3 is stop                */
					case IDC_NONE:
					case ID_BUTTON1:       //Start Button activated
					case IDM_SPEAKSTART:
						if (!bPause)
						{
							// ADDED to check menu item
							hMenu = CommandBar_GetMenu(hWndCB, 0);
							CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED); 
							dSpeak = IDM_SPEAKSTART; 
							CheckMenuItem(hMenu, dSpeak, MF_CHECKED);
							
							if ( TextToSpeechResume(phTTS[ptts_select->tts_lang_index]) == MMSYSERR_NOERROR )
							{
								bPause= TRUE;     // Toggle state from Resume back to Pause
								SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");
							}
							
							// Uncheck play after it speaks
							CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED);
							dSpeak = IDM_SPEAKSTOP; 
							CheckMenuItem(hMenu, dSpeak, MF_CHECKED);
							
							break;
						}
						else
						{
							// Just checking to make sure start is pressed only once.
							// ADDED to check menu item
							hMenu = CommandBar_GetMenu(hWndCB, 0);
							CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED); 
							dSpeak = IDM_SPEAKSTART; 
							CheckMenuItem(hMenu, dSpeak, MF_CHECKED);
							// Don't want to load the queue up
							TextToSpeechGetStatus(phTTS[ptts_select->tts_lang_index], idArray, statArray, 1);
							bStatus = statArray[0];
							if ( !bStatus )
							{
#ifdef ACCESS32
								if (highlight)
									SpeakText(hWnd);    // Go and handle this with high-lighting 
								else 
								{
#endif
									GetWindowText(hwndEdit,FileBuf,sizeof(FileBuf)/sizeof(TCHAR));
									TextToSpeechSpeak( phTTS[ptts_select->tts_lang_index],FileBuf, TTS_FORCE );
#ifdef ACCESS32
								}
#endif                
							}
							break;
						}	// else
					case ID_BUTTON2:       //Pause Resume  Button activated
					case IDM_SPEAKPAUSE:
						if(bPause)
						{
							// ADDED to check menu item
							hMenu = CommandBar_GetMenu(hWndCB, 0);
							CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED); 
							dSpeak = IDM_SPEAKPAUSE; 
							CheckMenuItem(hMenu, dSpeak, MF_CHECKED);
							
							TextToSpeechGetStatus(phTTS[ptts_select->tts_lang_index], idArray, statArray, 1);
							bStatus = statArray[0];     // Checking to see if there is speech running
							if ( bStatus )
							{
								if ( TextToSpeechPause(phTTS[ptts_select->tts_lang_index]) == MMSYSERR_NOERROR )
								{
									bPause= FALSE;     // Toggle state from Pause to Resume
									SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Resume");
								}
								break;
							}
						}   
						else
						{
							// ADDED to check menu item
							hMenu = CommandBar_GetMenu(hWndCB, 0);
							CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED); 
							dSpeak = IDM_SPEAKPAUSE; 
							CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED);
							
							if ( TextToSpeechResume(phTTS[ptts_select->tts_lang_index]) == MMSYSERR_NOERROR )
							{
								bPause= TRUE;     // Toggle state from Resume back to Pause
								SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");
							}
							break;
						}
                
					case ID_BUTTON3:       //Stop Button activated
					case IDM_SPEAKSTOP:
						// ADDED to check menu item
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED); 
						dSpeak = IDM_SPEAKSTOP; 
						CheckMenuItem(hMenu, dSpeak, MF_CHECKED);
						
						if ( !bPause )
						{   
							// It seems that we have to first Resume before we can continue
							// or else risk locking up the engine by executing reset without resume.
							if ( TextToSpeechResume(phTTS[ptts_select->tts_lang_index]) == MMSYSERR_NOERROR )
							{
								bPause= TRUE;     // Toggle state from Resume back to Pause
								SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");
							}
						}
						
						mmStatus = TextToSpeechReset(phTTS[ptts_select->tts_lang_index], FALSE);
						
						if ( mmStatus )
							MessageBox( hWnd,szError,TEXT("TextToSpeechReset"),MB_OK | MB_ICONSTOP );
						
						break;
						
						//  Handle requests to change speaking voice1
					case  IDM_PAUL:
						// Added to check voice
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
						dVoice = IDM_PAUL; 
						CheckMenuItem(hMenu, dVoice, MF_CHECKED);
						
						TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],PAUL);
						break;
						
					case  IDM_HARRY:
						// Added to check voice
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
						dVoice = IDM_HARRY; 
						CheckMenuItem(hMenu, dVoice, MF_CHECKED);
						
						TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],HARRY);
						break;
						
					case  IDM_DENNIS:
						// Added to check voice
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
						dVoice = IDM_DENNIS; 
						CheckMenuItem(hMenu, dVoice, MF_CHECKED);
						
						TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],DENNIS);
						break;
						
					case  IDM_FRANK:
						// Added to check voice
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
						dVoice = IDM_FRANK; 
						CheckMenuItem(hMenu, dVoice, MF_CHECKED);
						
						TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],FRANK);
						break;
						
					case  IDM_RITA:
						// Added to check voice
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
						dVoice = IDM_RITA; 
						CheckMenuItem(hMenu, dVoice, MF_CHECKED);
						
						TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],RITA);
						break;
						
					case  IDM_BETTY:
						// Added to check voice
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
						dVoice = IDM_BETTY; 
						CheckMenuItem(hMenu, dVoice, MF_CHECKED);
						
						TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],BETTY);
						break;
						
					case  IDM_URSULA:
						// Added to check voice
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
						dVoice = IDM_URSULA; 
						CheckMenuItem(hMenu, dVoice, MF_CHECKED);
						
						TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],URSULA);
						break;
						
					case  IDM_WENDY:
						// Added to check voice
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
						dVoice = IDM_WENDY; 
						CheckMenuItem(hMenu, dVoice, MF_CHECKED);
						
						TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],WENDY);
						break;
						
					case  IDM_KIT:
						// Added to check voice
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
						dVoice = IDM_KIT; 
						CheckMenuItem(hMenu, dVoice, MF_CHECKED);
						
						TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],KIT);
						break;
						
						// Handle Speaking Rate
					case  IDM_SPEAK100:
						// Added to check rate
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dRate, MF_UNCHECKED); 
						dRate = IDM_SPEAK100; 
						CheckMenuItem(hMenu, dRate, MF_CHECKED);
						
						TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],100);
						HandleScrollBar(SB_UPDATE, 100);        // SB_UPDATE is NOT windows defined
						current_rate = 100;
						break;
						
					case  IDM_SPEAK200:
						// Added to check rate
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dRate, MF_UNCHECKED); 
						dRate = IDM_SPEAK200; 
						CheckMenuItem(hMenu, dRate, MF_CHECKED);
						
						TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],200);
						HandleScrollBar(SB_UPDATE, 200);        // SB_UPDATE is NOT windows defined
						current_rate = 200;
						break;
						
					case  IDM_SPEAK300:
						// Added to check rate
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dRate, MF_UNCHECKED); 
						dRate = IDM_SPEAK300; 
						CheckMenuItem(hMenu, dRate, MF_CHECKED);
						
						TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],300);
						HandleScrollBar(SB_UPDATE, 300);        // SB_UPDATE is NOT windows defined
						current_rate = 300;
						break;
						
					case  IDM_SPEAK400:
						// Added to check rate
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dRate, MF_UNCHECKED); 
						dRate = IDM_SPEAK400; 
						CheckMenuItem(hMenu, dRate, MF_CHECKED);
						
						TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],400);
						HandleScrollBar(SB_UPDATE, 400);        // SB_UPDATE is NOT windows defined
						current_rate = 400;
						break;
						
					case  IDM_SPEAK500:
						// Added to check rate
						hMenu = CommandBar_GetMenu(hWndCB, 0);
						CheckMenuItem(hMenu, dRate, MF_UNCHECKED); 
						dRate = IDM_SPEAK500; 
						CheckMenuItem(hMenu, dRate, MF_CHECKED);
						
						TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],500);
						HandleScrollBar(SB_UPDATE, 500);        // SB_UPDATE is NOT windows defined
						current_rate = 500;
						break;
						
						// Handle File - exit request
					case IDM_EXIT:
						
						DestroyWindow(hWnd);
						break;
						
						// Display about box
					case IDM_ABOUT:
						
						DialogBox(hInst,           /* current instance         */      
							MAKEINTRESOURCE(IDD_ABOUT1), /* resource to use   */
							hWnd,                  /* parent handle            */
							(DLGPROC)About);       /* About Process()          */
						break;
						
						// Invoke win help with DECtalk help file
					case IDM_HELP:
                
#ifndef UNDER_CE		// comment out for now mfgce        
						WinHelp( hWnd,lpszHelpFile,
							     HELP_PARTIALKEY, (DWORD)lpszHelpTopic );
#endif                
						break;
                
					default:
						break;
                
				}
			} //else
			break;  // WM_COMMAND
		case WM_CLOSE:
			if( SendMessage( hwndEdit, EM_GETMODIFY, 0L, 0L ))
			{
				AskToSave(); 	
				DestroyWindow( hWnd );
				return FALSE;
			}
			DestroyWindow( hWnd );
			return  FALSE;
			
		case WM_DESTROY:

#ifdef  ACCESS32
			mmStatus = TextToSpeechShutdown(phTTS[ptts_select->tts_lang_index]);
#endif
 
			mmStatus = destroyDectalk(ttsstart.start, ttsstart.size);
        
#ifdef ACCESS32
			/* Free mark_pos buffer */
			next = mark_pos;
			while (next != NULL)
			{
				mark_pos = next->next_mark;
				free(next);
				next = mark_pos;
			}
#endif // ACCESS32   
		
			PostQuitMessage(0);
			break;
        
		default:
			if (message ==  uiID_Error_Msg )
			{
				switch (wParam)
				{
					case ERROR_IN_AUDIO_WRITE:
						MessageBox(hWnd, TEXT("Error in Writing Audio"), TEXT("Async Error"),MB_OK | MB_ICONSTOP);
						break;
					
					case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
						MessageBox(hWnd, TEXT("Error Opening Wave Out Device"), TEXT("Async Error"),MB_OK | MB_ICONSTOP);
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
			}
		}  // Switch(message)
    
		return (DefWindowProc(hWnd, message, wParam, lParam));
}

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
void AskToSave()
{
    int response;

	// Ask user if they want to save file
	response = MessageBox(hWnd, L"The Text in this file has changed.\n\n Do you wish to save the changes?",
	                       L"Windic",  MB_YESNOCANCEL | MB_ICONEXCLAMATION );
	
    switch( response )
    {
		case IDYES:
			GetWindowText(hwndEdit,FileBuf,sizeof(FileBuf)/sizeof(TCHAR));
			if( wcscmp( FileBuf, L"untitled.txt" ) == 0)
			{
				 SaveNewFile( hWnd ,IDM_SAVEASFILE );
				 return;
			}
			else
			{
				SaveNewFile( hWnd ,IDM_SAVEFILE );
				return;
			}
		case IDCANCEL:
			 return;
		default:	// IDNO
			 return;
	}
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
        TEXT(""),         /* default text in edit window         */
        WS_VISIBLE| WS_VSCROLL| ES_AUTOVSCROLL |ES_MULTILINE,
		10L,                        /* Default horizontal position.       */
		21L,                       /* Default vertical position.         */
		rect.right-10L,                /* Default width.                     */
		rect.bottom-21L,           /* Default height.                    */
        hWnd,                      /* Parent window                      */
        (HMENU)ID_EDITCTL,         /* Use the window class menu.         */
        (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   /* hInstance */
        NULL);

#ifdef ACCESS32
    // We need to get the edit box properties
    // Then look at PrimaryTypingDlgProc() to see how typing mode is done.
    OldPrimaryTypingDlgProc = (void *)GetWindowLong(hwndEdit, GWL_WNDPROC);
    SetWindowLong(hwndEdit, GWL_WNDPROC, (LONG) PrimaryTypingDlgProc);
#endif

		wcscpy(szFile,TEXT("untitled.txt"));

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
    
	TCHAR szText[12];

    switch(LOWORD(wParam))
    {
        
    case SB_PAGEDOWN:          // Increment Rate Slider by 20 to Max of 600
        if (wSpos > 580)
            wSpos = 600;
        else
            wSpos += 20;
        break;
        
    case SB_LINEDOWN:          // Increment Rate Slider by 5 to Max of 600
        if (wSpos > 595)
            wSpos = 600;
        else
            wSpos   += 5;
        break;
        
    case SB_PAGEUP:        // Decrement Rate Slider by 20 to Min of MIN_WPM
        if (wSpos < (MIN_WPM+20) )
            wSpos = MIN_WPM;
        else
            wSpos   -= 20;
        break;
        
    case SB_LINEUP:        // Increment Rate Slider by 5 to Max of MIN_WPM
        if (wSpos < (MIN_WPM+5) )
            wSpos = MIN_WPM;
        else
            wSpos   -= 5;
        break;
        
    case SB_TOP:               // Rate Slider to Max
        wSpos   =600;
        break;
        
    case SB_BOTTOM:        // Rate Slider to Min
        wSpos   = MIN_WPM;
        break;
        
    case SB_THUMBPOSITION:
    case SB_THUMBTRACK:
        wSpos = ((HIWORD(wParam))/5)*5;       // Round speaking rate to nearest 5
        
    default:
        break;
    }
    
    SetScrollPos(hwndSliderRate, SB_CTL, wSpos , TRUE)  ; // Set Slider Control position

    wsprintf(szText,TEXT("Rate %d WPM") ,wSpos );
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
    switch (message)
    {
    case WM_INITDIALOG:                     /* message: initialize dialog box */
        return (TRUE);
        
    case WM_COMMAND:                        /* message: received a command */
        if (LOWORD(wParam) == IDOK          /* "OK" box selected?        */
            || LOWORD(wParam) == IDCANCEL)
        {                                   /* System menu close command? */
            EndDialog(hDlg, TRUE);          /* Exits the dialog box        */
           TextToSpeechSpeak( phTTS[ptts_select->tts_lang_index], TEXT("DECtalk Sample Application"), TTS_FORCE );
            return (TRUE);
        }
        break;
    }
    return (FALSE);                             /* Didn't process a message    */
    
}
/****************************************************************************
*
*    FUNCTION: SaveNewFile(HWND)
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
BOOL SaveNewFile( HWND hWnd,unsigned int type)
{
    
	if (type == IDM_SAVEFILE)
	{
		if (wcscmp(szFile,TEXT("untitled.txt"))==0) //check if file has a name
		type = IDM_SAVEASFILE;
	}
	

    _tcscpy( szFileTitle, TEXT(""));

    OpenFileName.lStructSize      = sizeof(OPENFILENAME);
    OpenFileName.hwndOwner        = hWnd;
    OpenFileName.hInstance        = (HANDLE) hInst;
    OpenFileName.lpstrFilter      = szFilter;
    OpenFileName.lpstrCustomFilter = NULL;
    OpenFileName.nMaxCustFilter   = 0L;
    OpenFileName.nFilterIndex     = 1L;
    OpenFileName.lpstrFile        = szFile;
    OpenFileName.nMaxFile         = MAX_PATH;
    OpenFileName.lpstrFileTitle   = szFileTitle;
    OpenFileName.nMaxFileTitle    = MAX_PATH;
    OpenFileName.lpstrInitialDir   = NULL;
    OpenFileName.lpstrTitle       = TEXT("Save As");
    OpenFileName.lpstrDefExt      = TEXT("txt");	// Can only be three charatcers long
    OpenFileName.nFileOffset      = 0;
    OpenFileName.nFileExtension   = 0;
    OpenFileName.Flags =  OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST;
    


	if (type == IDM_SAVEFILE)
	{
						
		if (RdBufToFile( OpenFileName.lpstrFile, hWnd ))
				return TRUE;
		else
				return FALSE;

	}
	else
	{
		if (GetSaveFileName(&OpenFileName))
		{
			if (RdBufToFile( OpenFileName.lpstrFile, hWnd ))
				return TRUE;
			else
				return FALSE;
		}
		else
        return FALSE;
    }


}
/****************************************************************************************
* FUNCTION: RdBufToFile()
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
BOOL RdBufToFile( LPTSTR lpszFile, HWND hWnd )

{
    
	HANDLE hFile;
	int cBufLen;
	DWORD dwRW;

	DWORD length = lstrlen(FileBuf);

	DWORD charlength = length * sizeof(char);

	char *pMBString = (char *)LocalAlloc(LPTR,(charlength + sizeof(char)));	//allocate fom heap


	wcstombs(pMBString,FileBuf,charlength);


	hFile = CreateFile(lpszFile, GENERIC_WRITE, FILE_SHARE_WRITE,NULL, CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);
	
	if (hFile == INVALID_HANDLE_VALUE)
    {
        MessageBox( hWnd, TEXT("File Save failed."), NULL, MB_OK );
		return FALSE;
    }
    else
	{
       cBufLen = WriteFile( hFile,pMBString,charlength, &dwRW, NULL);

	}
			
  
    if (cBufLen == -1)
    {
         MessageBox( hWnd, TEXT("Zero bytes read."), NULL, MB_OK );
        CloseHandle( hFile );
        return FALSE;
    }
    else
    {
        // close the file
        FileBuf[(int)length]='\0';
        CloseHandle( hFile );
     }
    

    return TRUE;
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


    
    _tcscpy( szFile, TEXT(""));
    _tcscpy( szFileTitle, TEXT(""));

    OpenFileName.lStructSize      = sizeof(OPENFILENAME);
    OpenFileName.hwndOwner        = hWnd;
    OpenFileName.hInstance        = (HANDLE) hInst;
    OpenFileName.lpstrFilter      = szFilter;
    OpenFileName.lpstrCustomFilter = NULL;
    OpenFileName.nMaxCustFilter   = 0L;
    OpenFileName.nFilterIndex     = 1L;
    OpenFileName.lpstrFile        = szFile;
	OpenFileName.nMaxFile		  = MAX_PATH;
    OpenFileName.lpstrFileTitle   = szFileTitle;
	OpenFileName.nMaxFileTitle    = MAX_PATH;
    OpenFileName.lpstrInitialDir  = NULL;
    OpenFileName.lpstrTitle       = TEXT("Open a File");
    OpenFileName.lpstrDefExt      = TEXT("txt"); // Can only be three charatcers long
    OpenFileName.nFileOffset      = 0;
    OpenFileName.nFileExtension   = 0;
    OpenFileName.lCustData        = 0;
    OpenFileName.Flags =  OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST;
 

    if (GetOpenFileName(&OpenFileName))
    {
        if (RdFileToBuf( OpenFileName.lpstrFile, hWnd ))
            return TRUE;
		else
            return FALSE;
	}
    else
    {
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
    
	HANDLE hFile;
	int cBufLen;
	DWORD dwRW,length;

	char *pMBString;


	hFile = CreateFile(lpszFile, GENERIC_READ, FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
	length = GetFileSize(hFile,NULL);
	pMBString = (char *)LocalAlloc(LPTR,(length * (sizeof(char) + sizeof(char))));


	if(length > FILE_LEN)
	{
     MessageBox( hWnd, TEXT("File size too big!"), NULL, MB_OK );
	 return FALSE;
	}

	
	if (hFile == INVALID_HANDLE_VALUE)
    {
        MessageBox( hWnd, TEXT("File open failed."), NULL, MB_OK );
		return FALSE;
    }
    else
        cBufLen = ReadFile( hFile,pMBString,(length*(sizeof(char) + sizeof(char)) ), &dwRW, NULL);

		mbstowcs(FileBuf,pMBString,length);
				
  
    if (cBufLen == -1)
    {
         MessageBox( hWnd, TEXT("Zero bytes read."), NULL, MB_OK );
        // close the file (tek 24jul96)
       CloseHandle( hFile );
        return FALSE;
    }
    else
    {
        // close the file
        FileBuf[(int)length]='\0';
        CloseHandle( hFile );
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
/* comment out for now
id ProcessCDError(DWORD dwErrorCode, HWND hWnd)
{
    TCHAR  buf[256];

    WORD  wStringID;

    
    switch(dwErrorCode)
    {
    case CDERR_DIALOGFAILURE:    wStringID=IDS_DIALOGFAILURE;   break;
    case CDERR_STRUCTSIZE:   wStringID=IDS_STRUCTSIZE;			break;
    case CDERR_INITIALIZATION:  wStringID=IDS_INITIALIZATION;   break;
    case CDERR_NOTEMPLATE:   wStringID=IDS_NOTEMPLATE;			break;
    case CDERR_NOHINSTANCE:  wStringID=IDS_NOHINSTANCE;			break;
    case CDERR_LOADSTRFAILURE:  wStringID=IDS_LOADSTRFAILURE;   break;
    case CDERR_FINDRESFAILURE:  wStringID=IDS_FINDRESFAILURE;   break;
    case CDERR_LOADRESFAILURE:  wStringID=IDS_LOADRESFAILURE;   break;
    case CDERR_LOCKRESFAILURE:  wStringID=IDS_LOCKRESFAILURE;   break;
    case CDERR_MEMALLOCFAILURE: wStringID=IDS_MEMALLOCFAILURE;	break;
    case CDERR_MEMLOCKFAILURE:  wStringID=IDS_MEMLOCKFAILURE;   break;
    case CDERR_NOHOOK:       wStringID=IDS_NOHOOK;				break;
    case PDERR_SETUPFAILURE:     wStringID=IDS_SETUPFAILURE;    break;
    case PDERR_PARSEFAILURE:     wStringID=IDS_PARSEFAILURE;    break;
    case PDERR_RETDEFFAILURE:    wStringID=IDS_RETDEFFAILURE;   break;
    case PDERR_LOADDRVFAILURE:  wStringID=IDS_LOADDRVFAILURE;   break;
    case PDERR_GETDEVMODEFAIL:  wStringID=IDS_GETDEVMODEFAIL;   break;
    case PDERR_INITFAILURE:  wStringID=IDS_INITFAILURE;			break;
    case PDERR_NODEVICES:        wStringID=IDS_NODEVICES;       break;
    case PDERR_NODEFAULTPRN:     wStringID=IDS_NODEFAULTPRN;    break;
    case PDERR_DNDMMISMATCH:     wStringID=IDS_DNDMMISMATCH;    break;
    case PDERR_CREATEICFAILURE: wStringID=IDS_CREATEICFAILURE;	break;
    case PDERR_PRINTERNOTFOUND: wStringID=IDS_PRINTERNOTFOUND;	break;
    case CFERR_NOFONTS:      wStringID=IDS_NOFONTS;				break;
    case FNERR_SUBCLASSFAILURE: wStringID=IDS_SUBCLASSFAILURE;	break;
    case FNERR_INVALIDFILENAME: wStringID=IDS_INVALIDFILENAME;	break;
    case FNERR_BUFFERTOOSMALL:  wStringID=IDS_BUFFERTOOSMALL;   break;
        
    case 0:   //User may have hit CANCEL or we got a *very* random error
        return;
        
    default:
        wStringID=IDS_UNKNOWNERROR;
    }
   
    LoadString(NULL, wStringID, buf, sizeof(buf));
    MessageBox(hWnd, buf, NULL, MB_OK);

    return;
}

*/

#ifdef ACCESS32

/***********************************************************************************
*
* The following is for the TYPING DEMO feature
*
************************************************************************************/
BOOL APIENTRY PrimaryTypingDlgProc( HWND hWnd,
                                   UINT uiMsg,
                                   WPARAM wParam,
                                   LPARAM lParam )
{
    switch( uiMsg )
    {
    case WM_CHAR:
        if (typing_mode) {
            // Yes this is inefficient, but it shows how to use TextToSpeechGetRate()
            TextToSpeechGetRate(phTTS[ptts_select->tts_lang_index], &current_rate);
            TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],350);
            TextToSpeechTyping(phTTS[ptts_select->tts_lang_index], wParam);
            TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index], current_rate);
        }
        break;
    }
    return CallWindowProc(OldPrimaryTypingDlgProc, hWnd, uiMsg, wParam, lParam);
}


/**********************************************************************
*
* The following is for the HIGHLIGHTING feature
*
***********************************************************************/

BOOL SpeakText( HANDLE hWnd )
{
    DWORD      dwTextLen=0 ;
	LPTSTR      lpEditText=NULL ;
    MMRESULT   mmStatus=0 ;
    TCHAR       szError[32]=_T("") ;
    TCHAR       lpEditIM[256]=_T("");
    ULONG           ptr = 0;
    ULONG           pos = 0;
    ULONG           mark = 2;
    TCHAR           temp[50]=_T("");
    MARK_POS        *next = mark_pos;
    BOOL            inbracket = FALSE;
    // tek 19jun97
   TCHAR           cPrevchar=_T('\0');
    
    while (next != NULL) {
        mark_pos = next->next_mark;
        free(next);
        next = mark_pos;
    }
    
    dwTextLen = SendMessage(hwndEdit, WM_GETTEXTLENGTH, 0, 0);
    lpEditText  = (TCHAR *)malloc((1 + dwTextLen) * sizeof(TCHAR)) ;
    SendMessage(hwndEdit, WM_GETTEXT,(WPARAM) dwTextLen +1, (LPARAM) lpEditText);
    
    if (highlight) {
        wcscpy(lpEditIM,_T("[:i m 1]"));
        ptr = wcslen(lpEditIM);
        
        next = malloc(sizeof(MARK_POS));
        next->next_mark = NULL;
        mark_pos = next;
        while (pos < wcslen(lpEditText)) {
            while ((lpEditText[pos] == _T(' ') || lpEditText[pos] == _T('\t') || lpEditText[pos] == _T('\n'))
                && ptr < 125 && pos < wcslen(lpEditText)) {
                lpEditIM[ptr++] = lpEditText[pos++];
            }
            next->start = pos;
            while (lpEditText[pos] != _T(' ') && lpEditText[pos] != _T('\n') && lpEditText[pos] != _T('\t')
                && ptr < 240 && pos < wcslen(lpEditText)) {
                if (lpEditText[pos] == _T('['))     inbracket = TRUE;
                if (lpEditText[pos] == _T(']'))     inbracket = FALSE;
                lpEditIM[ptr++] = lpEditText[pos++];
            }
            if (lpEditText[pos] == _T(' ') || lpEditText[pos] == _T('\n') || lpEditText[pos] == _T('\t')) {
                if (inbracket != TRUE) {
                    next->end = pos;
                    /* GL 05/14/1997 BATS#373 fix the table reading problem*/
                    lpEditIM[ptr++] = lpEditText[pos];
                    lpEditIM[ptr++] = _T('\0');         
                    wsprintf(temp,_T("[:i m %lu]"), mark++);
   
                    ptr += wcslen(temp) - 1;
                    wcscat(lpEditIM, temp);
                    pos++;
                    next->next_mark = malloc(sizeof(MARK_POS));
                    next = next->next_mark;
                    next->next_mark = NULL;
                    next->start = pos;
                } else {
                    lpEditIM[ptr++] = lpEditText[pos++];
                }
            }
            // tek 19jun97 try to break and speak at clause bdry..
            if (pos > 3)
                cPrevchar = lpEditText[pos-2];
            else
                cPrevchar = _T('\0');
            
            if ( (ptr > 224)
                ||( cPrevchar==_T('.') || cPrevchar==_T(',') || cPrevchar==_T('?') || cPrevchar==_T('!')) )
            {
                lpEditIM[ptr++] = _T('\0');
                mmStatus = TextToSpeechSpeak(phTTS[ptts_select->tts_lang_index], lpEditIM, TTS_NORMAL);
                if ( mmStatus ) {
					wsprintf( szError, _T("Error = %d"), mmStatus );                 
                    MessageBox( hWnd, szError, _T("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP );
                    return TRUE;
                }
                ptr = 0;
            }
        }   // while loop
        
        if (ptr) {	
            lpEditIM[ptr++] = _T('\0');
            mmStatus = TextToSpeechSpeak(phTTS[ptts_select->tts_lang_index], lpEditIM, TTS_NORMAL);
            if ( mmStatus ) {
                wsprintf( szError, _T("Error = %d"), mmStatus );
                MessageBox( hWnd, szError, _T("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP );
                return TRUE;
            }
            ptr = 0;
        }
        
        mmStatus = TextToSpeechSpeak(phTTS[ptts_select->tts_lang_index], _T(""), TTS_FORCE);
        if ( mmStatus ) {
            wsprintf( szError, _T("Error = %d"), mmStatus );
            MessageBox( hWnd, szError, _T("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP );
            return TRUE;
        }
        
        free(lpEditText);
        
        if ( mmStatus ) {
            wsprintf( szError, _T("Error = %d"), mmStatus );
            MessageBox( hWnd, szError, _T("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP );
            return TRUE;
        }
    } else {
        
        mmStatus = TextToSpeechSpeak(phTTS[ptts_select->tts_lang_index], lpEditText, TTS_FORCE);
        if ( mmStatus )
            MessageBox( hWnd,
            _T("Error in TTS Speak") ,
            _T("ERROR"),
            MB_OK | MB_ICONSTOP );
        free(lpEditText);
        
        if ( mmStatus )
        {
            wsprintf( szError, _T("Error = %d"), mmStatus );
            MessageBox( hWnd, szError, _T("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP );
            return TRUE;
        }
    }
    return FALSE;
}


VOID TTSCallbackRoutine(LONG lParam1, LONG lParam2,
                        DWORD dwInstanceParam, UINT uiMsg) {
    
    switch( lParam1 )
    {
    case TTS_INDEX_MARK:
        update_mark(lParam2);
        break;
        
    case TTS_AUDIO_PLAY_STOP:
        update_mark(0xFFFFFFFF);
        break;
        
    case TTS_AUDIO_PLAY_START:
    case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
    case ERROR_IN_AUDIO_WRITE:
    case ERROR_GETTING_DEVICE_CAPABILITIES:
    default:
        break;
    }
}


void update_mark(ULONG mark) {
    MARK_POS *next = mark_pos;
    ULONG pos;
    
    if (mark == 0xFFFFFFFFL) {
        PostMessage(hwndEdit, EM_SETSEL, (WPARAM)-1, (LPARAM) 0);
        PostMessage(hwndEdit, EM_SCROLLCARET, (WPARAM) 0, (LPARAM) 0);
        return;
    }
    if (next == NULL)       return;
    for (pos = 1; pos < mark; pos++) {
        if (next->next_mark == NULL)    return;
        next = next->next_mark;
    }
    if (highlight) {
        PostMessage(hwndEdit, EM_SETSEL, (WPARAM)next->start, (LPARAM) next->end);
        PostMessage(hwndEdit, EM_SCROLLCARET, (WPARAM) 0, (LPARAM) 0);
    }
    return;
}


#endif // ACCESS32

//*****************************************************************************
//  Initialize the Text to Speech system: Use Wave Mapper to allocate an
//  appropriate audio port, Since the "OWN_AUDIO_DEVICE" flag is not
//  set the audio device will be shared, (given up when not currently speaking)
//  Report open error will cause an asynchronous error message
//  ("DECtalkErrorMessage") to be sent to this window in case the
//  audio device is not available.
//
//      FUNCTION:InitDectalk(HWND, TTS_LANG_MAP_START*);
//      
//      FUCTIONALITY: it gets the number of languages from TTS_ENUM_LANGS() and 
//                        for each of those languages it adds it to the TTS_LANG_MAP.
//          The TTS_LANG_MAP is a list that MAPs the lang thread index to its menu ID.
//          InitDectalk() calls TextToSpeechStartLang() to get the index for the 
//          language thread.  That thread is startedup with TextToSpeechStartupEx()
//
//      PURPOSE:  sets up everything to call tts_startup correctly for multilanguage
//
//      COMMENTS:
//          This function calls TexttoSpeechEnumLangs to get the number of 
//              languages.  With the number of languages it then calls: 
//                  TextToSpeechStartLang
//                  TextToSpeechSelectLang
//                  TextToSpeechStartupEx
#ifdef ACCESS32
//                  Startup is not called in Access32 till the end because of
//                  TYPING demo which needs to own the Audio Device.
#endif
//                  For each language a menu is created:
//              The menu ID, the number given back by ttsSelectLang, and the 2
//                  letter string corispoding to the name are all shoved on a
//                  list of TTS_LANG_MAP.  This list is used to MAP the index
//                  of the thread of the language with the Menu ID
//              Then for each language, a menu is created.  
//
//Note: TextToSpeechEnumLangs' first LANGUAGE is supposed to be the DEFAULT language 
//    set in the registry. 
//    At the moment that is not the case so that the starting language is random
//
//      RETURN VALUES:
//       -1 - Error!
//       FALSE - OK
//*****************************************************************************

int InitDectalk(HWND hWnd, TTS_LANG_MAP_START* pTTSstart)
{
    unsigned int i, nTemp, nCurrentMenuID;
	TCHAR *szError = NULL;
	HMENU main_menu;
    TTS_LANG_MAP* pTTScurrent = NULL;
    TTS_LANG_MAP* pTTSprev = NULL;
    MMRESULT mmStatus;

   EnableMenuItem(hMenu, IDM_LANG_US, MF_GRAYED );
   EnableMenuItem(hMenu, IDM_LANG_UK, MF_GRAYED );
   EnableMenuItem(hMenu, IDM_LANG_SP, MF_GRAYED );
   EnableMenuItem(hMenu, IDM_LANG_LA, MF_GRAYED );
   EnableMenuItem(hMenu, IDM_LANG_GR, MF_GRAYED );
   EnableMenuItem(hMenu, IDM_LANG_FR, MF_GRAYED );

    
    if(TextToSpeechEnumLangs(&languageINFO) == 0) 
    {
        MessageBox(NULL,TEXT("Unable to allocate Memory"),TEXT("Error"),MB_OK);
        return(-1);
    }

    if(languageINFO->MultiLang == FALSE) 
    {
        // we are in single language mode
#ifdef ACCESS32 
        mmStatus = TextToSpeechStartupEx(&phTTS[0], WAVE_MAPPER, REPORT_OPEN_ERROR | OWN_AUDIO_DEVICE, TTSCallbackRoutine, 0);
#else
        mmStatus = TextToSpeechStartupEx(&phTTS[0], WAVE_MAPPER, REPORT_OPEN_ERROR, NULL, 0);
#endif
		pTTScurrent = malloc(sizeof(TTS_LANG_MAP));
        if(pTTScurrent == NULL)
        {   
            MessageBox(NULL,TEXT("Unable to allocate Memory"),TEXT("Error"),MB_OK);
            return(-1);
        }
        pTTScurrent->tts_lang_index = 0;
		pTTScurrent->tts_lang_menu =  0;
        wcscpy(pTTScurrent->tts_lang_name, languageINFO->Entries[0].lang_code);

		if(wcscmp(pTTScurrent->tts_lang_name,TEXT("US"))==0)
		{
			EnableMenuItem(hMenu, IDM_LANG_US, MF_ENABLED );
			pTTScurrent->tts_lang_menu = IDM_LANG_US;
		}
		else if(wcscmp(pTTScurrent->tts_lang_name,TEXT("SP"))==0)
		{
			EnableMenuItem(hMenu, IDM_LANG_SP, MF_ENABLED );
			pTTScurrent->tts_lang_menu = IDM_LANG_SP;
		}	
		else if(wcscmp(pTTScurrent->tts_lang_name,TEXT("GR"))==0)
		{
			EnableMenuItem(hMenu, IDM_LANG_GR, MF_ENABLED );
			pTTScurrent->tts_lang_menu = IDM_LANG_GR;
		}	
		else if(wcscmp(pTTScurrent->tts_lang_name,TEXT("UK"))==0)
		{
			EnableMenuItem(hMenu, IDM_LANG_UK, MF_ENABLED );
			pTTScurrent->tts_lang_menu = IDM_LANG_UK;
		}
		else if(wcscmp(pTTScurrent->tts_lang_name,TEXT("LA"))==0)
		{
			EnableMenuItem(hMenu, IDM_LANG_LA, MF_ENABLED );
			pTTScurrent->tts_lang_menu = IDM_LANG_LA;
		}
		else if(wcscmp(pTTScurrent->tts_lang_name,TEXT("FR"))==0)
		{
			EnableMenuItem(hMenu, IDM_LANG_FR, MF_ENABLED );
			pTTScurrent->tts_lang_menu = IDM_LANG_FR;
		}
		

		pTTScurrent->next = NULL;
        pTTSstart->start = pTTScurrent;
        pTTSstart->size = 1;				
		CheckMenuItem(hMenu,pTTScurrent->tts_lang_menu,MF_CHECKED);
        ptts_select = pTTScurrent;

        
    }
    else
    {
			
		main_menu=CommandBar_GetMenu(hWnd,0);
        nCurrentMenuID = IDM_LANG_BEGIN;
        pTTSstart->start = NULL;
        pTTSstart->size = 0; 
       

		for(i = 0; i < languageINFO->Languages; i++)	
        {

           nTemp = TextToSpeechStartLang(languageINFO->Entries[i].lang_code);

            if((nTemp & TTS_LANG_ERROR) == 0)
            {

#ifndef ACCESS32
                TextToSpeechSelectLang(NULL, nTemp);
                mmStatus = TextToSpeechStartupEx(&phTTS[nTemp], WAVE_MAPPER, REPORT_OPEN_ERROR, NULL, 0);
#endif               

		       pTTScurrent = malloc(sizeof(TTS_LANG_MAP));
               if(pTTScurrent == NULL)
               {   
				   MessageBox(hWnd, TEXT("Out of memory!"), TEXT("Error"), MB_OK);
				   return(-1);
               }
			   
               pTTScurrent->tts_lang_index = nTemp;
			   // pTTScurrent->tts_lang_menu = nCurrentMenuID++;
			   wcscpy(pTTScurrent->tts_lang_name, languageINFO->Entries[i].lang_code);
			   
			   if(wcscmp(pTTScurrent->tts_lang_name,TEXT("US"))==0)
			   {
				   EnableMenuItem(hMenu, IDM_LANG_US, MF_ENABLED );
				   pTTScurrent->tts_lang_menu = IDM_LANG_US;
			   }
			   else if(wcscmp(pTTScurrent->tts_lang_name,TEXT("SP"))==0)
			   {
				   EnableMenuItem(hMenu, IDM_LANG_SP, MF_ENABLED );
				   pTTScurrent->tts_lang_menu = IDM_LANG_SP;
			   }	
			   else if(wcscmp(pTTScurrent->tts_lang_name,TEXT("GR"))==0)
			   {
				   EnableMenuItem(hMenu, IDM_LANG_GR, MF_ENABLED );
				   pTTScurrent->tts_lang_menu = IDM_LANG_GR;
			   }	
			   else if(wcscmp(pTTScurrent->tts_lang_name,TEXT("UK"))==0)
			   {
				   EnableMenuItem(hMenu, IDM_LANG_UK, MF_ENABLED );
				   pTTScurrent->tts_lang_menu = IDM_LANG_UK;
			   }
			   else if(wcscmp(pTTScurrent->tts_lang_name,TEXT("LA"))==0)
			   {
				   EnableMenuItem(hMenu, IDM_LANG_LA, MF_ENABLED );
				   pTTScurrent->tts_lang_menu = IDM_LANG_LA;
			   }
			   else if(wcscmp(pTTScurrent->tts_lang_name,TEXT("FR"))==0)
			   {
				   EnableMenuItem(hMenu, IDM_LANG_FR, MF_ENABLED );
				   pTTScurrent->tts_lang_menu = IDM_LANG_FR;
			   }

                pTTScurrent->next = NULL;
                if(pTTSstart->start == NULL)
                    pTTSstart->start = pTTScurrent;
                else 
                    pTTSprev->next = pTTScurrent;
                pTTSprev = pTTScurrent;
                pTTSstart->size++;
                
				if(i == 0)
                {
				CheckMenuItem(hMenu,pTTScurrent->tts_lang_menu,MF_CHECKED);
                    ptts_select = pTTScurrent;
                }
                if(pTTScurrent->tts_lang_menu == IDM_LANG_END)
                {
                    MessageBox(hWnd, TEXT("To many language dlls."), TEXT("Error"), MB_OK);
                    return(-1);
                }
            }
            
        }
#ifdef ACCESS32

        TextToSpeechSelectLang(NULL, ptts_select->tts_lang_index);
        mmStatus = TextToSpeechStartupEx(&phTTS[ptts_select->tts_lang_index], WAVE_MAPPER, REPORT_OPEN_ERROR | OWN_AUDIO_DEVICE, TTSCallbackRoutine, 0);
#endif  
    }
    if(pTTSstart->start == NULL)
    {
        MessageBox( hWnd, TEXT("No Languages Available"),TEXT("Error"), MB_OK | MB_ICONSTOP );
        return(-1); 
    }

    if ( mmStatus != MMSYSERR_NOERROR )
    {
		if (mmStatus == MMSYSERR_INVALPARAM)	// CAB 7/5/00
		{
			MessageBox( hWnd,TEXT("Dictionary not found, Shutting Down!"), TEXT("TTS statrup failed"), MB_OK | MB_ICONHAND );
			return( -1 );
		}
		else if (mmStatus == MMSYSERR_NODRIVER)
		{
			MessageBox( hWnd, TEXT("No wave device present,\n Shutting Down!"), NULL, MB_OK | MB_ICONSTOP );
			return( -1 );
		}
		else 
		{
			swprintf( szError, TEXT("TTS startup failed\n\nError = %d\n\nExiting out of application"), mmStatus );
			MessageBox(hWnd, szError, TEXT("DtSample"), MB_OK | MB_ICONSTOP );
		}
		return( -1 );
    }
    return FALSE;
}
//*****************************************************************************
//
//      FUNCTION:destroyDectalk(TTS_LANG_MAP*, unsigned int size);
//
//      PURPOSE:  to get rid of the TTS_LANG_MAP and to shutdown each thread.
//
//      COMMENTS:
//                  This function is basically a recursive tree traversal.
//                      It goes down the list and when comes up it calles 
//                      TextToSpeechShutdown and then frees the pointer.
#ifdef ACCESS32
//  Note:   TextToSpeechShutdown is not really called for ACCESS32 here.
//          Sinse, OWN_AUDIO_DEVICE is on there is only one THREAD. 
#endif
//
//      RETURN VALUES:
//       mmSySERR_INVALHANDLE  - THis is bad!  Error!
//          1 - OK!
//*****************************************************************************

MMRESULT destroyDectalk(TTS_LANG_MAP* curr, unsigned int size)
{
    MMRESULT mmStatus;
    
    if(size == 0 || curr == NULL)
        return 1;
    mmStatus = destroyDectalk(curr->next, size - 1);
    if(mmStatus == 1)
    {
#ifndef ACCESS32
        mmStatus = TextToSpeechShutdown(phTTS[curr->tts_lang_index]);
#endif
        if(mmStatus == MMSYSERR_INVALHANDLE)
            return MMSYSERR_INVALHANDLE;
        free(curr);
        return 1;
    }
    else if(mmStatus == MMSYSERR_INVALHANDLE)
        return MMSYSERR_INVALHANDLE;

return 1;
}


//*****************************************************************************
//
//      FUNCTION:switchLANGs(HWND, TTS_LANG_MAP_START*, unsigned int size);
//
//      PURPOSE:  to switch to the correct thread.
//
//      COMMENTS:
//          this fuction:
//              looks for the pointer of the language to switch to
//              if its the same as ptts_select then return
//              unchecks the old menu and checks the new one
//              points ptts_select to the new language
//              sets the RATE to the current rate
//#ifdef ACCESS32
//      note:   for ACCESS32 it has to shutdown the previous thread and 
//              start a new one for that language.
//#endif
//
//              
//      note: Any message sent back from the program has to be in range of
//          IDM_LANG_BEGIN and IDM_LANG_END if they are to be processed by langSwitch
//      
//
//      RETURN VALUES:
//       mmSySERR_INVALHANDLE  - THis is bad!  Error!
//          1 - OK!
//*****************************************************************************

void switchLangs(HWND hWnd, TTS_LANG_MAP_START* pttsstart, unsigned int unNewMenuID)
{

    unsigned int i;
    TTS_LANG_MAP* pCurrent = pttsstart->start;
    MMRESULT mmStatus;


	for(i = 0; i < pttsstart->size; i++)
    {
        if(pCurrent->tts_lang_menu == unNewMenuID)
            break;
        pCurrent = pCurrent->next;
    }

 
    if(pCurrent->tts_lang_menu != unNewMenuID)
    {               
	   MessageBox(hWnd, TEXT("The menu ID is not in the Language Map."),TEXT("Error"), MB_OK);
	   return;
    }
    else if(pCurrent == ptts_select){  //if the address are the same
	   return;
	}
	 else  //then you want to switch to the new language 
    {
    	CheckMenuItem(hMenu,ptts_select->tts_lang_menu,MF_BYCOMMAND | MF_UNCHECKED);     

#ifdef ACCESS32
        mmStatus = TextToSpeechShutdown(phTTS[ptts_select->tts_lang_index]);
        if(mmStatus == MMSYSERR_INVALHANDLE)
        {
            MessageBox(hWnd, _T("Text to Speech Handle was invalid"), _T("Error"), MB_OK);
            return;
        }
        ptts_select = pCurrent;
        TextToSpeechSelectLang(NULL, ptts_select->tts_lang_index);
        mmStatus = TextToSpeechStartupEx(&phTTS[ptts_select->tts_lang_index],
            WAVE_MAPPER, REPORT_OPEN_ERROR | OWN_AUDIO_DEVICE, TTSCallbackRoutine, 0);
        if(mmStatus == MMSYSERR_NOMEM)
        {           
            MessageBox(hWnd, _T("Memory allocation error."), _T("Error"), MB_OK);
            return;
        }
#else
        ptts_select = pCurrent;
#endif
       
		mmStatus = TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index], current_rate);

        CheckMenuItem(hMenu, ptts_select->tts_lang_menu, MF_BYCOMMAND | MF_CHECKED);

		GetWindowText(hwndEdit,FileBuf,sizeof(FileBuf)/sizeof(TCHAR));

	 }
}






// *** checkRunning
//
// Determining if this is the first instance. This function is 
// called when the application first starts up.

BOOL checkRunning()
{
	HWND hWnd;

	hWnd = FindWindow(_T("DTSAMPLE"), NULL);
	if(hWnd == NULL)
		return FALSE;		// this is the first instance
	ShowWindow(hWnd, SW_SHOWNORMAL);
	SetForegroundWindow(hWnd);
	PostQuitMessage(0);		// terminate this instance
	return TRUE;
}
















