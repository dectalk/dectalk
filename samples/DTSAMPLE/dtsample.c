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
****************************************************************************/
/*  001  cjl    04.16.97        Help file uses symbol DTALK_HELP_FILE_NAME */
/*                              BATS#307                                   */
/*  002  ncs    06.27.97        Changed the apperance of DTSAMPLE:         */
/*                              This included implementing                 */
/*                              - TextToSpeechGetStatus() for making the   */
/*                              Pause/Reset buttons to work logically.     */
/*                              - The Start button will only read the text */
/*                              file once (not load the queue if the Start */
/*                              button is pressed more that once).         */
/*                              - Added the menu RATE which users can chose*/
/*                              the rate out of increments of 100 units.   */
/*                              - Also made the side bar and value reflect */
/*                              the new changes.                           */
#ifdef ACCESS32
/*                              Also changed this project for DTACCESS:    */
/*                              This included adding in the                */
/*                              - expanded menu drop options as well as    */
/*                              the functions for MENU TALK, HIGHLIGHTING, */
/*                              and TYPING MODE.                           */
#endif
/*  003  cjl   08.15.97         Change helptopic                           */
/*  004  ncs   09.26.97     Add mimimum speed.                             */
/*  005  ncs   10.06.97         Changed start-up to exit out if            */
/*                              TextToSpeechStartUp fails - BATS#474       */
/*  006  dr    12.5.97          Made DTSAMPLE ML- added FUNCTIONS:         */
/*             InitDectalk();destroyDectalk();switchLangs();               */
/*             ML language threads-> the indexes of them are stored on a list
/*             called TTS_LANG_MAP which MAPS the thread index to the      */
/*             menu ID.  Regular has Multiple Threads                      */
#ifdef ACCESS32                                                            
/*              Access32 has to SHUTDOWN the current thread.  And starts   */
/*              a new one everytime switchLangs is called.                 */
#endif                                                                     
/*              New Lang menu!                                             */
/* 007	MGS		04/03/1998 BATS #523 fixed accesss32 to access32			*/
/* 008  CAB		08/16/00   Added checks for menu: rate, voice,..                                                                        */
/***************************************************************************/

#include <windows.h>    // includes basic windows functionality
#include <commdlg.h>    // includes common dialog functionality
#include <dlgs.h>       // includes common dialog template defines
#include <stdio.h>      // includes standard file i/o functionality
#include <string.h>     // includes string functions
#include <cderr.h>      // includes the common dialog error codes
#include <mmsystem.h>   // includes multimedia extensions
#include "dtsample.h"   // includes Dtsample header file
#include "ttsapi.h"     // includes TextToSpeech API definitions

//Global Varibales
DWORD dVoice;			 // Checked voice in menu 
DWORD dRate;			 // Checked rate in menu
DWORD dSpeak;			 // Checked start,stop,pause in menu speak

HANDLE       hInst;
OPENFILENAME OpenFileName;
char         szDirName[256]  = "";
char         szFile[256] = "\0";
char         szFileTitle[256];
// Filter specification for the OPENFILENAME struct
char         szFilter[] = "Text Files (*.TXT)\0*.TXT\0All Files (*.*)\0*.*\0";
char         szAppName[]  = "DtSample";
char         FileBuf[FILE_LEN+1];       // Buffer used to read in file.
char         SelBuf[FILE_LEN+1] = "\0"; //Buffer used to extract Edit control selected region, used to speak selected text
HWND         hDlgFR;
HWND         hwndEdit, hwndButton1, hwndButton2, hwndButton3;
HWND         hwndSliderRate, hwndStaticRate;
RECT         rect;
//* -DR 12/5/97  added these for ML
//*             phTTS is an array for each thread
//*             ptts_select is a pointer of TTS_LANG_MAP which is the current LANG thread
//*             ttsstart is the start of the TTS_LANG_MAP list.
//*             languageINFO is NAMES, and NUMBERS of the languages availible
//*
static       LPTTS_HANDLE_T phTTS[20] ;            /*  Text to Speech Handle used in every TextToSpeech Function Call*/
TTS_LANG_MAP* ptts_select = NULL;
TTS_LANG_MAP_START ttsstart;
LPLANG_ENUM languageINFO;
unsigned int current_rate = 200;        // ncs - Used for keeping track of the speaking rate
unsigned int current_voice;		// Used to find the default voice


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
    HWND hWnd;
    char szText[80] ="\0";
#ifdef ACCESS32
    HMENU           main_menu, sub_menu;    // ncs 25jun97 - Add ACCESS32 menu options
    MENUITEMINFO    menu_item;
#endif
    
    /* Fill in window class structure with parameters that describe the       */
    /* main window.                                                           */
    
    wc.style = CS_HREDRAW | CS_VREDRAW ;  /* Class style(s).                    */
    wc.lpfnWndProc = (WNDPROC)MainWndProc;/* Function to retrieve messages for  */
    /* windows of this class.             */
    wc.cbClsExtra = 0;                    /* No per-class extra data.           */
    wc.cbWndExtra = 0;                    /* No per-window extra data.          */
    wc.hInstance = NULL;                  /* Application that owns the class.   */
    wc.hIcon = LoadIcon( hInstance, "DtSampleIcon" );
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
    
    hWnd = CreateWindow(
        szAppName,                     /* See RegisterClass() call.          */
        "DECtalk Sample Application",  /* Text for window title bar.         */
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
    DragAcceptFiles(hWnd, TRUE);       /*Accept files dragged from File Manager  */
    
#ifdef ACCESS32
    // Place the following in the #ifdef section so that these can
    // be stripped out for non ACCESS32 kits
    /* ncs 25jun97 - Add separator if more options to be added */
    main_menu = GetMenu(hWnd);
    sub_menu = GetSubMenu(main_menu, 1);
    if (Menuspeak || Hilite || Typing) {
        menu_item.cbSize = sizeof(MENUITEMINFO);
        menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
        menu_item.fType = MFT_SEPARATOR;
        menu_item.fState = 0;
        menu_item.wID = 0;
        menu_item.hSubMenu = NULL;
        menu_item.hbmpChecked = NULL;
        menu_item.hbmpUnchecked = NULL;
        menu_item.dwItemData = 0;
        InsertMenuItem(sub_menu, 99, 1, &menu_item);
    }
    /* ncs 25jun97 - Add menutalk demo menu option IF menutalk demo is available */
    if (Menuspeak) {
        menu_item.cbSize = sizeof(MENUITEMINFO);
        menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
        menu_item.fType = MFT_STRING;
        menu_item.fState = MFS_CHECKED;
        menu_item.wID = IDM_MENUTALK;
        menu_item.hSubMenu = NULL;
        menu_item.hbmpChecked = NULL;
        menu_item.hbmpUnchecked = NULL;
        menu_item.dwItemData = IDM_MENUTALK;
        menu_item.dwTypeData = "&Menu Talk";
        menu_item.cch = strlen(menu_item.dwTypeData);
        InsertMenuItem(sub_menu, 99, 1, &menu_item);
    }
    /* ncs 25jun97 - Add highlight menu option IF highlighting is available */
    if (Hilite) {
        menu_item.cbSize = sizeof(MENUITEMINFO);
        menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
        menu_item.fType = MFT_STRING;
        menu_item.fState = MFS_CHECKED;
        menu_item.wID = IDM_HIGHLIGHT;
        menu_item.hSubMenu = NULL;
        menu_item.hbmpChecked = NULL;
        menu_item.hbmpUnchecked = NULL;
        menu_item.dwItemData = IDM_HIGHLIGHT;
        menu_item.dwTypeData = "&Highlighting";
        menu_item.cch = strlen(menu_item.dwTypeData);
        InsertMenuItem(sub_menu, 99, 1, &menu_item);
    }
    /* ncs 25jun97 - Add typing demo menu option IF typing demo is available */
    if (Typing) {
        menu_item.cbSize = sizeof(MENUITEMINFO);
        menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
        menu_item.fType = MFT_STRING;
        menu_item.fState = MFS_CHECKED;
        menu_item.wID = IDM_TYPING;
        menu_item.hSubMenu = NULL;
        menu_item.hbmpChecked = NULL;
        menu_item.hbmpUnchecked = NULL;
        menu_item.dwItemData = IDM_TYPING;
        menu_item.dwTypeData = "&Typing Demo";
        menu_item.cch = strlen(menu_item.dwTypeData);
        InsertMenuItem(sub_menu, 99, 1, &menu_item);
    }
    
#endif
    
    /* -------------------------------------------------------------------------------- */
    
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
        
        TextToSpeechSpeak(phTTS[ptts_select->tts_lang_index],FileBuf,TTS_FORCE);    //Speak data in FileBuf
    }
    /* Acquire and dispatch messages until a WM_QUIT message is received. */
    
    while (GetMessage(&msg,            /* message structure                      */
        NULL,                      /* handle of window receiving the message */
        0,                         /* lowest message to examine              */
        0)
        )                          /* highest message to examine             */
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
                          HWND hWnd,                       /* window handle                   */
                          UINT message,                /* type of message                 */
                          UINT wParam,                 /* additional information          */
                          LONG lParam    )             /* additional information          */
{
    HDC hdc;
    PAINTSTRUCT ps;
    
    static  BOOL bPause = TRUE;         // TRUE = Pause displayed, False = Resume displayed
    static  BOOL bStatus = FALSE;       // TRUE = Audio dev in use, False = Audio dev not in use
    static  HDROP hDrop;
    static  int  cyborder ;
    static  short wSpos = 180;
    static  unsigned int uiID_Error_Msg;
    char szText[12] ="\0";
    char szError[132];
    DWORD dwStart, dwEnd ;
    long lSelect;
    int j=0;
    MMRESULT mmStatus;
    LPCTSTR lpszHelpFile = DTALK_HELP_FILE_NAME;   // Name of DECtalk help file
    LPCTSTR lpszHelpTopic = "Sample applet, description";
    int idArray[3];
    int statArray[3];
	HANDLE hMenu;		// Handle for menu window

#ifdef ACCESS32
    char text[256]="";
    UINT uItem;
    UINT fuFlags;
    HMENU hmenu;
    MARK_POS *next;
    MENUITEMINFO menuinfo;
    unsigned int i, k;
#endif
    
    idArray[0]=STATUS_SPEAKING;
    
    switch (message)
    {
        
    case WM_CREATE:
        //  InitWIndows function  creates all child windows
        InitWindows(hWnd);
        
		// Set initial check for menus
		dSpeak = IDM_SPEAKSTOP;
		dVoice = IDM_PAUL;
		dRate = IDM_SPEAK200;
		HandleScrollBar(SB_UPDATE, 200);        
		hMenu = GetMenu(hWnd);
		
		/*******************************************************************************************
        Register a private message to report DECtalk asychronous events.
        ***************************************************************************************8****/
        uiID_Error_Msg = RegisterWindowMessage("DECtalkErrorMessage");
        
        return InitDectalk(hWnd, &ttsstart);
        
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
            TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],(UINT)wSpos); // New rate returned in wSpos
            current_rate = wSpos;
            return FALSE;
        }
        break;
        
    case WM_DROPFILES:   // Handle dropped files - open file, copy to edit control and speak
        
        DragQueryFile ((HANDLE)wParam, 0, szFile, sizeof(szFile));
        // Reset text to speech system
        TextToSpeechReset(phTTS[ptts_select->tts_lang_index], FALSE);
        
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
        TextToSpeechSpeak(phTTS[ptts_select->tts_lang_index],FileBuf,TTS_FORCE);
        return FALSE;
        
        
#ifdef ACCESS32
        // Place the following in the #ifdef section so that these can
        // be stripped out for non ACCESS32 kits
    case WM_MENUSELECT:
        if (menutalk) {
            uItem = (UINT) LOWORD(wParam);   // menu item or submenu index 
            fuFlags = (UINT) HIWORD(wParam); // menu flags 
            hmenu = (HMENU) lParam;          // handle of menu clicked 
            
            if( fuFlags & (MF_SYSMENU | MF_POPUP) )
                GetMenuString( hmenu, uItem, text, 256, MF_BYPOSITION);
            else
                GetMenuString( hmenu, uItem, text, 256, MF_BYCOMMAND);
            
            for( i=0, k=0; i < strlen(text); i++, k++)
            {
                if( text[i] == '&' ) k++;
                text[i]=text[k];
            }
            if(!bPause) {
                if ( TextToSpeechResume(phTTS[ptts_select->tts_lang_index]) == MMSYSERR_NOERROR )   {
                    bPause= TRUE;     // Toggle state of Pause / resume Button
                    SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");
                }
            }
            TextToSpeechReset( phTTS[ptts_select->tts_lang_index], FALSE );
            TextToSpeechSpeak( phTTS[ptts_select->tts_lang_index], text, TTS_FORCE );
        }
        break;
        
#endif
        
    case WM_COMMAND:               /* message: command from application menu */
        
        if (wParam == 1 && HIWORD (lParam) == EN_ERRSPACE)
            MessageBox (hWnd, "EDIT control out of space.",
            "DECtalk Sample Application",MB_OK | MB_ICONSTOP) ;
        if(LOWORD(wParam) >= IDM_LANG_BEGIN && LOWORD(wParam) < IDM_LANG_END)
        {
            switchLangs(hWnd, &ttsstart, wParam);   
        }
        else
        {
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
            case IDM_MENUTALK:
                menutalk = abs(menutalk - 1);
                menuinfo.cbSize = sizeof(MENUITEMINFO);
                menuinfo.fMask = MIIM_STATE;
                if (menutalk)           menuinfo.fState = MFS_CHECKED;
                else                    menuinfo.fState = 0;
                SetMenuItemInfo(GetMenu(hWnd), IDM_MENUTALK, FALSE, &menuinfo);
                break;
                
            case IDM_HIGHLIGHT:
                highlight = abs(highlight - 1);
                menuinfo.cbSize = sizeof(MENUITEMINFO);
                menuinfo.fMask = MIIM_STATE;
                if (highlight)          menuinfo.fState = MFS_CHECKED;
                else                    menuinfo.fState = 0;
                SetMenuItemInfo(GetMenu(hWnd), IDM_HIGHLIGHT, FALSE, &menuinfo);
                break;
                
            case IDM_TYPING:
                typing_mode = abs(typing_mode - 1);
                menuinfo.cbSize = sizeof(MENUITEMINFO);
                menuinfo.fMask = MIIM_STATE;
                if (typing_mode)        menuinfo.fState = MFS_CHECKED;
                else                    menuinfo.fState = 0;
                SetMenuItemInfo(GetMenu(hWnd), IDM_TYPING, FALSE, &menuinfo);
                break;
#endif
                
                /* Button window controls
                Button 1 is start
                Button 2 is pause / resume
                Button 3 is stop                */
                
            case ID_BUTTON1:       //Start Button activated
            case IDM_SPEAKSTART:
                if (!bPause)
				{
					hMenu = GetMenu(hWnd);
					CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED); 
					dSpeak = IDM_SPEAKSTART; 
					CheckMenuItem(hMenu, dSpeak, MF_CHECKED);
					
					if ( TextToSpeechResume(phTTS[ptts_select->tts_lang_index]) == MMSYSERR_NOERROR )
					{
						bPause= TRUE;     // Toggle state from Resume back to Pause
						SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Resume");
					}
					break;
				}
				else
				{
					// ADDED to check menu item
					hMenu = GetMenu(hWnd);
					CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED); 
					dSpeak = IDM_SPEAKSTART; 
					CheckMenuItem(hMenu, dSpeak, MF_CHECKED);
					
					SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Resume");
                	// Just checking to make sure start is pressed only once.
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
                        GetWindowText(hwndEdit,FileBuf,32768);
                        TextToSpeechSpeak( phTTS[ptts_select->tts_lang_index], FileBuf, TTS_FORCE );
#ifdef ACCESS32
                    }
#endif
                	}
                break;
                }
            case ID_BUTTON2:       //Pause Resume  Button activated
            case IDM_SPEAKPAUSE:
                
                if(bPause)
                {
                    // ADDED to check menu item
					hMenu = GetMenu(hWnd);
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
                            SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");
                        }
                        break;
                    }
                }
                
                else
                {
                    // ADDED to check menu item
					hMenu = GetMenu(hWnd);
					CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED); 
					dSpeak = IDM_SPEAKPAUSE; 
					CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED);
                    
					if ( TextToSpeechResume(phTTS[ptts_select->tts_lang_index]) == MMSYSERR_NOERROR )
                    {
                        bPause= TRUE;     // Toggle state from Resume back to Pause
                        SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Resume");
                    }
                    break;
                }
                
            case ID_BUTTON3:       //Stop Button activated
            case IDM_SPEAKSTOP:
                // ADDED to check menu item
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dSpeak, MF_UNCHECKED); 
				dSpeak = IDM_SPEAKSTOP; 
				CheckMenuItem(hMenu, dSpeak, MF_CHECKED);
                
                if ( !bPause )
                {   // It seems that we have to first Resume before we can continue
                    // or else risk locking up the engine by executing reset without resume.
                    if ( TextToSpeechResume(phTTS[ptts_select->tts_lang_index]) == MMSYSERR_NOERROR )
                    {
                        bPause= TRUE;     // Toggle state from Resume back to Pause
                        SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Resume");
                    }
                }
				else
				{
					SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");
				}
                
                mmStatus = TextToSpeechReset(phTTS[ptts_select->tts_lang_index], FALSE);
                
                if ( mmStatus )
                {
                    sprintf( szError, "Error = %d", mmStatus );      
                    MessageBox( hWnd, szError, "TextToSpeechReset", MB_OK | MB_ICONSTOP );
                }
                break;
                
                //  Handle requests to change speaking voice
            case  IDM_PAUL:
                // Added to check voice
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
				dVoice = IDM_PAUL; 
				CheckMenuItem(hMenu, dVoice, MF_CHECKED);

                TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],PAUL);
                break;
                
            case  IDM_HARRY:
                // Added to check voice
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
				dVoice = IDM_HARRY; 
				CheckMenuItem(hMenu, dVoice, MF_CHECKED);

                TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],HARRY);
                break;
                
            case  IDM_DENNIS:
                // Added to check voice
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
				dVoice = IDM_DENNIS; 
				CheckMenuItem(hMenu, dVoice, MF_CHECKED);

                TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],DENNIS);
                break;
                
            case  IDM_FRANK:
                // Added to check voice
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
				dVoice = IDM_FRANK; 
				CheckMenuItem(hMenu, dVoice, MF_CHECKED);

                TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],FRANK);
                break;
                
            case  IDM_RITA:
                // Added to check voice
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
				dVoice = IDM_RITA; 
				CheckMenuItem(hMenu, dVoice, MF_CHECKED);
                
                TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],RITA);
                break;
                
            case  IDM_BETTY:
                // Added to check voice
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
				dVoice = IDM_BETTY; 
				CheckMenuItem(hMenu, dVoice, MF_CHECKED);
                
                TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],BETTY);
                break;
                
            case  IDM_URSULA:
                // Added to check voice
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
				dVoice = IDM_URSULA; 
				CheckMenuItem(hMenu, dVoice, MF_CHECKED);
                
                TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],URSULA);
                break;
                
            case  IDM_WENDY:
                // Added to check voice
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
				dVoice = IDM_WENDY; 
				CheckMenuItem(hMenu, dVoice, MF_CHECKED);

                
                TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],WENDY);
                break;
                
            case  IDM_KIT:
                // Added to check voice
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dVoice, MF_UNCHECKED); 
				dVoice = IDM_KIT; 
				CheckMenuItem(hMenu, dVoice, MF_CHECKED);
                
                TextToSpeechSetSpeaker(phTTS[ptts_select->tts_lang_index],KIT);
                break;
                
                // Handle Speaking Rate
            case  IDM_SPEAK100:
                // Added to check rate
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dRate, MF_UNCHECKED); 
				dRate = IDM_SPEAK100; 
				CheckMenuItem(hMenu, dRate, MF_CHECKED);
                
                TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],100);
                HandleScrollBar(SB_UPDATE, 100);        // SB_UPDATE is NOT windows defined
                current_rate = 100;
                break;
                
            case  IDM_SPEAK200:
                // Added to check rate
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dRate, MF_UNCHECKED); 
				dRate = IDM_SPEAK200; 
				CheckMenuItem(hMenu, dRate, MF_CHECKED);
                
                TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],200);
                HandleScrollBar(SB_UPDATE, 200);        // SB_UPDATE is NOT windows defined
                current_rate = 200;
                break;
                
            case  IDM_SPEAK300:
                // Added to check rate
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dRate, MF_UNCHECKED); 
				dRate = IDM_SPEAK300; 
				CheckMenuItem(hMenu, dRate, MF_CHECKED);
                
                TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],300);
                HandleScrollBar(SB_UPDATE, 300);        // SB_UPDATE is NOT windows defined
                current_rate = 300;
                break;
                
            case  IDM_SPEAK400:
                // Added to check rate
				hMenu = GetMenu(hWnd);
				CheckMenuItem(hMenu, dRate, MF_UNCHECKED); 
				dRate = IDM_SPEAK400; 
				CheckMenuItem(hMenu, dRate, MF_CHECKED);
                
                TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index],400);
                HandleScrollBar(SB_UPDATE, 400);        // SB_UPDATE is NOT windows defined
                current_rate = 400;
                break;
                
            case  IDM_SPEAK500:
                // Added to check rate
				hMenu = GetMenu(hWnd);
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
                    "AboutBox",            /* resource to use          */
                    hWnd,                  /* parent handle            */
                    (DLGPROC)About);       /* About Process()          */
                
                break;
                
                // Invoke win help with DECtalk help file
            case IDM_HELP:
                
                WinHelp( hWnd,
                    lpszHelpFile,
                    HELP_PARTIALKEY,
                    (DWORD)lpszHelpTopic );
                
                break;
                
            default:
                break ;
                
            }
        } //else
        break;  // WM_COMMAND
        
                /*      This section implements Right Mouse Button click functionality.
                *       This action will cause speaking of selected text in the Edit Control
                *       Parent notify message is used to check for the right mouse button being activated.
                *       The selected text is then spoken.
        *                                                       */
        
    case WM_PARENTNOTIFY:
        
        if (LOWORD(wParam) == WM_RBUTTONDOWN)
            
        {   lSelect = SendMessage (hwndEdit, EM_GETSEL,(WPARAM)&dwStart,(LPARAM)&dwEnd) ;
        if (HIWORD (lSelect) == LOWORD (lSelect)) {
            MessageBox( hWnd, "No data selected", NULL, MB_OK );
            break;
        }
        
        else
        {
            GetWindowText(hwndEdit,FileBuf,32768);
            strncpy ((char*)SelBuf,(char*)&FileBuf[dwStart],(dwEnd - dwStart));
            SelBuf[dwEnd - dwStart ] = '\0';
            TextToSpeechSpeak( phTTS[ptts_select->tts_lang_index], SelBuf, TTS_FORCE );
        }
        }
        break;
        
        // Make sure to shut down TextToSpeech system before exiting
        
    case WM_DESTROY:
        
#ifdef  ACCESS32
        mmStatus = TextToSpeechShutdown(phTTS[ptts_select->tts_lang_index]);
#endif
        mmStatus = destroyDectalk(ttsstart.start, ttsstart.size);
        
#ifdef ACCESS32
        /* Free mark_pos buffer */
        next = mark_pos;
        while (next != NULL) {
            mark_pos = next->next_mark;
            free(next);
            next = mark_pos;
        }
#endif
        
        PostQuitMessage(0);
        break;
        
    default:
        if (message ==  uiID_Error_Msg )
            
        {
            //TextToSpeechReset(phTTS, FALSE);
            switch (wParam)
            {
                
            case ERROR_IN_AUDIO_WRITE:
                MessageBox(hWnd, "Error in Writing Audio", "Async Error",MB_OK | MB_ICONSTOP);
                break;
                
            case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
                MessageBox(hWnd, "Error Opening Wave Out Device", "Async Error",MB_OK | MB_ICONSTOP);
                break;
                
            case ERROR_GETTING_DEVICE_CAPABILITIES:
                MessageBox(hWnd, "Error Getting Audio Device Caps", "Async Error",MB_OK | MB_ICONSTOP);
                break;
                
            case ERROR_READING_DICTIONARY:
                MessageBox(hWnd, "Error Reading Dictionary File \n dectalk.dic", "Async Error",MB_OK | MB_ICONSTOP);
                break;
                
            case ERROR_WRITING_FILE:
                MessageBox(hWnd, "Error Writing File", "Async Error",MB_OK | MB_ICONSTOP);
                break;
                
            case ERROR_ALLOCATING_INDEX_MARK_MEMORY:
                MessageBox(hWnd, "Error allocating Index Mark Memory", "Async Error",MB_OK | MB_ICONSTOP);
                break;
            }
        }
    }   // switch(message)
    
    
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
        "EDIT",                    /* See RegisterClass() call.          */
        "",                        /* Text for window title bar.         */
        WS_CHILD |WS_VISIBLE | WS_HSCROLL | WS_VSCROLL | WS_BORDER | ES_LEFT |
        ES_MULTILINE | ES_AUTOHSCROLL | ES_AUTOVSCROLL | ES_NOHIDESEL | DS_LOCALEDIT,
        
        0L,                        /* Default horizontal position.       */
        21L,                       /* Default vertical position.         */
        rect.right,                /* Default width.                     */
        rect.bottom-21L,           /* Default height.                    */
        hWnd,                      /* Parent window                      */
        (HMENU)ID_EDITCTL,         /* Use the window class menu.         */
        (HINSTANCE)GetWindowLong( hWnd, GWL_HINSTANCE ),   /* hInstance */
        NULL);
    
#ifdef ACCESS32
    // We need to get the edit box properties
    // Then look at PrimaryTypingDlgProc() to see how typing mode is done.
    OldPrimaryTypingDlgProc = GetWindowLong(hwndEdit, GWL_WNDPROC);
    SetWindowLong(hwndEdit, GWL_WNDPROC, (LONG) PrimaryTypingDlgProc);
#endif
    
    //DragAcceptFiles(hwndEdit, TRUE);
    
    hwndButton1 = CreateWindow (
        "BUTTON",                  /* See RegisterClass() call.          */
        "Start",                   /* Text for window title bar.         */
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
        "BUTTON",                  /* See RegisterClass() call.          */
        "Pause",                   /* Text for window title bar.         */
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
        "BUTTON",                  /* See RegisterClass() call.          */
        "Stop",                    /* Text for window title bar.         */
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
        "SCROLLBAR",               /* See RegisterClass() call.          */
        "",                        /* Text for window title bar.         */
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
        "STATIC",                  /* See RegisterClass() call.          */
        "Rate 180 WPM",            /* Text for window title bar.         */
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
    
    SetScrollRange (hwndSliderRate,SB_CTL,MIN_WPM,600, TRUE);   //Set Rate Range MIN_WPM - 600 WPM
    SetScrollPos(hwndSliderRate, SB_CTL, 180 , TRUE)  ;         //Set default rate
    
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
    
    static  char szText[12] ="\0";
    
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
    wsprintf(szText,"Rate %d WPM" ,wSpos );
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
            TextToSpeechSpeak( phTTS[ptts_select->tts_lang_index], "DECtalk Sample Application", TTS_FORCE );
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
    
    OpenFileName.lStructSize      = sizeof(OPENFILENAME);
    OpenFileName.hwndOwner        = hWnd;
    OpenFileName.hInstance        = (HANDLE) hInst;
    OpenFileName.lpstrFilter      = szFilter;
    OpenFileName.lpstrCustomFilter = (LPSTR) NULL;
    OpenFileName.nMaxCustFilter   = 0L;
    OpenFileName.nFilterIndex     = 1L;
    OpenFileName.lpstrFile        = szFile;
    OpenFileName.nMaxFile         = sizeof(szFile);
    OpenFileName.lpstrFileTitle   = szFileTitle;
    OpenFileName.nMaxFileTitle    = sizeof(szFileTitle);
    OpenFileName.lpstrInitialDir   = NULL;
    OpenFileName.lpstrTitle       = "Open a File";
    OpenFileName.nFileOffset      = 0;
    OpenFileName.nFileExtension   = 0;
    OpenFileName.lpstrDefExt      = "*.txt";
    OpenFileName.lCustData        = 0;
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
        MessageBox( hWnd, "File open failed.", NULL, MB_OK );
        return FALSE;
    }
    else
        // read it's contents into a buffer
        cBufLen = _lread( hFile, FileBuf, FILE_LEN );
    
    if (cBufLen == -1)
    {
        MessageBox( hWnd, "Zero bytes read.", NULL, MB_OK );
        // close the file (tek 24jul96)
        _lclose( hFile );
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
    char  buf[256];
    
    switch(dwErrorCode)
    {
    case CDERR_DIALOGFAILURE:    wStringID=IDS_DIALOGFAILURE;   break;
    case CDERR_STRUCTSIZE:   wStringID=IDS_STRUCTSIZE;      break;
    case CDERR_INITIALIZATION:  wStringID=IDS_INITIALIZATION;   break;
    case CDERR_NOTEMPLATE:   wStringID=IDS_NOTEMPLATE;      break;
    case CDERR_NOHINSTANCE:  wStringID=IDS_NOHINSTANCE;     break;
    case CDERR_LOADSTRFAILURE:  wStringID=IDS_LOADSTRFAILURE;   break;
    case CDERR_FINDRESFAILURE:  wStringID=IDS_FINDRESFAILURE;   break;
    case CDERR_LOADRESFAILURE:  wStringID=IDS_LOADRESFAILURE;   break;
    case CDERR_LOCKRESFAILURE:  wStringID=IDS_LOCKRESFAILURE;   break;
    case CDERR_MEMALLOCFAILURE: wStringID=IDS_MEMALLOCFAILURE; break;
    case CDERR_MEMLOCKFAILURE:  wStringID=IDS_MEMLOCKFAILURE;   break;
    case CDERR_NOHOOK:       wStringID=IDS_NOHOOK;          break;
    case PDERR_SETUPFAILURE:     wStringID=IDS_SETUPFAILURE;    break;
    case PDERR_PARSEFAILURE:     wStringID=IDS_PARSEFAILURE;    break;
    case PDERR_RETDEFFAILURE:    wStringID=IDS_RETDEFFAILURE;   break;
    case PDERR_LOADDRVFAILURE:  wStringID=IDS_LOADDRVFAILURE;   break;
    case PDERR_GETDEVMODEFAIL:  wStringID=IDS_GETDEVMODEFAIL;   break;
    case PDERR_INITFAILURE:  wStringID=IDS_INITFAILURE;     break;
    case PDERR_NODEVICES:        wStringID=IDS_NODEVICES;       break;
    case PDERR_NODEFAULTPRN:     wStringID=IDS_NODEFAULTPRN;    break;
    case PDERR_DNDMMISMATCH:     wStringID=IDS_DNDMMISMATCH;    break;
    case PDERR_CREATEICFAILURE: wStringID=IDS_CREATEICFAILURE; break;
    case PDERR_PRINTERNOTFOUND: wStringID=IDS_PRINTERNOTFOUND; break;
    case CFERR_NOFONTS:      wStringID=IDS_NOFONTS;         break;
    case FNERR_SUBCLASSFAILURE: wStringID=IDS_SUBCLASSFAILURE; break;
    case FNERR_INVALIDFILENAME: wStringID=IDS_INVALIDFILENAME; break;
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
    LPSTR      lpEditText=NULL ;
    MMRESULT   mmStatus=0 ;
    char       szError[32]="" ;
    char            lpEditIM[256]="";
    ULONG           ptr = 0;
    ULONG           pos = 0;
    ULONG           mark = 2;
    char            temp[50]="";
    MARK_POS        *next = mark_pos;
    BOOL            inbracket = FALSE;
    // tek 19jun97
    char            cPrevchar='\0';
    
    while (next != NULL) {
        mark_pos = next->next_mark;
        free(next);
        next = mark_pos;
    }
    
    dwTextLen = SendMessage(hwndEdit, WM_GETTEXTLENGTH, 0, 0);
    lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof(char)) ;
    SendMessage(hwndEdit, WM_GETTEXT,(WPARAM) dwTextLen +1, (LPARAM) lpEditText);
    
    if (highlight) {
        strcpy(lpEditIM,"[:i m 1]");
        ptr = strlen(lpEditIM);
        
        next = malloc(sizeof(MARK_POS));
        next->next_mark = NULL;
        mark_pos = next;
        while (pos < strlen(lpEditText)) {
            while ((lpEditText[pos] == ' ' || lpEditText[pos] == '\t' || lpEditText[pos] == '\n')
                && ptr < 125 && pos < strlen(lpEditText)) {
                lpEditIM[ptr++] = lpEditText[pos++];
            }
            next->start = pos;
            while (lpEditText[pos] != ' ' && lpEditText[pos] != '\n' && lpEditText[pos] != '\t'
                && ptr < 240 && pos < strlen(lpEditText)) {
                if (lpEditText[pos] == '[')     inbracket = TRUE;
                if (lpEditText[pos] == ']')     inbracket = FALSE;
                lpEditIM[ptr++] = lpEditText[pos++];
            }
            if (lpEditText[pos] == ' ' || lpEditText[pos] == '\n' || lpEditText[pos] == '\t') {
                if (inbracket != TRUE) {
                    next->end = pos;
                    /* GL 05/14/1997 BATS#373 fix the table reading problem*/
                    lpEditIM[ptr++] = lpEditText[pos];
                    lpEditIM[ptr++] = '\0';
                    sprintf(temp,"[:i m %lu]", mark++);
                    
                    ptr += strlen(temp) - 1;
                    strcat(lpEditIM, temp);
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
                cPrevchar = '\0';
            
            if ( (ptr > 224)
                ||( cPrevchar=='.' || cPrevchar==',' || cPrevchar=='?' || cPrevchar=='!') )
            {
                lpEditIM[ptr++] = '\0';
                mmStatus = TextToSpeechSpeak(phTTS[ptts_select->tts_lang_index], lpEditIM, TTS_NORMAL);
                if ( mmStatus ) {
                    sprintf( szError, "Error = %d", mmStatus );
                    MessageBox( hWnd, szError, "TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
                    return TRUE;
                }
                ptr = 0;
            }
        }   // while loop
        
        if (ptr) {
            lpEditIM[ptr++] = '\0';
            mmStatus = TextToSpeechSpeak(phTTS[ptts_select->tts_lang_index], lpEditIM, TTS_NORMAL);
            if ( mmStatus ) {
                sprintf( szError, "Error = %d", mmStatus );
                MessageBox( hWnd, szError, "TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
                return TRUE;
            }
            ptr = 0;
        }
        
        mmStatus = TextToSpeechSpeak(phTTS[ptts_select->tts_lang_index], "", TTS_FORCE);
        if ( mmStatus ) {
            sprintf( szError, "Error = %d", mmStatus );
            MessageBox( hWnd, szError, "TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
            return TRUE;
        }
        
        free(lpEditText);
        
        if ( mmStatus ) {
            sprintf( szError, "Error = %d", mmStatus );
            MessageBox( hWnd, szError, "TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
            return TRUE;
        }
    } else {
        
        mmStatus = TextToSpeechSpeak(phTTS[ptts_select->tts_lang_index], lpEditText, TTS_FORCE);
        if ( mmStatus )
            MessageBox( hWnd,
            "Error in TTS Speak" ,
            "ERROR",
            MB_OK | MB_ICONSTOP );
        free(lpEditText);
        
        if ( mmStatus )
        {
            sprintf( szError, "Error = %d", mmStatus );
            MessageBox( hWnd, szError, "TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
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
    unsigned int i, nTemp, menu_num, nCurrentMenuID;
    HMENU main_menu, sub_menu;
    MENUITEMINFO menu_item;
    TTS_LANG_MAP* pTTScurrent = NULL;
    TTS_LANG_MAP* pTTSprev = NULL;
    MMRESULT mmStatus;
    
    
    if(TextToSpeechEnumLangs(&languageINFO) == 0) 
    {
        MessageBox(NULL,"Unable to allocate Memory","Error",MB_OK);
        return(-1);
    }
    
    if(languageINFO->MultiLang == FALSE) 
    {
        // we are in single language mode
		/* MGS 04/03/1998 BATS #523 fixed accesss32 to access32 */
#ifdef ACCESS32 
        mmStatus = TextToSpeechStartupEx(&phTTS[0], WAVE_MAPPER, REPORT_OPEN_ERROR | OWN_AUDIO_DEVICE, TTSCallbackRoutine, 0);
#else
        mmStatus = TextToSpeechStartupEx(&phTTS[0], WAVE_MAPPER, REPORT_OPEN_ERROR, NULL, 0);
#endif
        pTTScurrent = malloc(sizeof(TTS_LANG_MAP));
        if(pTTScurrent == NULL)
        {   
            MessageBox(NULL,"Unable to allocate Memory","Error",MB_OK);
            return(-1);
        }
        pTTScurrent->tts_lang_index = 0;
        pTTScurrent->tts_lang_menu =  0;
        strcpy(pTTScurrent->tts_lang_name, languageINFO->Entries[0].lang_code);
        pTTScurrent->next = NULL;
        pTTSstart->start = pTTScurrent;
        pTTSstart->size = 1;
        ptts_select = pTTScurrent;
        
    }
    else  // multilanguage
    {
        //then we need a menu
        main_menu = GetMenu(hWnd);
        menu_num = GetMenuItemCount(main_menu); 
        InsertMenu(main_menu, menu_num - 1, 
            MF_BYPOSITION | MF_POPUP | MF_STRING, (UINT)CreatePopupMenu(), "&Languages");
        sub_menu = GetSubMenu(main_menu, menu_num - 1);
        
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
                    MessageBox(hWnd, "Out of memory!", "Error", MB_OK);
                    return(-1);
                }
                pTTScurrent->tts_lang_index = nTemp;
                pTTScurrent->tts_lang_menu = nCurrentMenuID++;
                strcpy(pTTScurrent->tts_lang_name, languageINFO->Entries[i].lang_code);
                pTTScurrent->next = NULL;
                if(pTTSstart->start == NULL)
                    pTTSstart->start = pTTScurrent;
                else 
                    pTTSprev->next = pTTScurrent;
                pTTSprev = pTTScurrent;
                pTTSstart->size++;
                menu_item.cbSize = sizeof(MENUITEMINFO);
                menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
                menu_item.fType = MFT_STRING;
                menu_item.fState = MFS_UNCHECKED;
                menu_item.wID = pTTScurrent->tts_lang_menu;
                menu_item.hSubMenu = NULL;
                menu_item.hbmpChecked = NULL;
                menu_item.hbmpUnchecked = NULL;
                menu_item.dwItemData = pTTScurrent->tts_lang_menu;
                menu_item.dwTypeData = languageINFO->Entries[i].lang_name;
                menu_item.cch = strlen(menu_item.dwTypeData);
                InsertMenuItem(sub_menu, 99, 1, &menu_item);
                if(i == 0)
                {
                    CheckMenuItem(main_menu, pTTScurrent->tts_lang_menu, 
                        MF_BYCOMMAND | MF_CHECKED);
                    ptts_select = pTTScurrent;
                }
                if(pTTScurrent->tts_lang_menu == IDM_LANG_END)
                {
                    MessageBox(hWnd, "To many language dlls.", "Error", MB_OK);
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
        MessageBox(hWnd, "No Languages Available", "Error", MB_OK);
        return(-1);
    }
    
    if (mmStatus == MMSYSERR_ERROR)
    {
        MessageBox( hWnd, "Can't find DECtalk Dictionary dectalk.dic, Shutting Down !", NULL, MB_OK );
        return( -1 );
    }
    
    if (mmStatus == MMSYSERR_NODRIVER)
    {
        MessageBox( hWnd, "No wave device present,\n Shutting Down!", NULL, MB_OK );
        return( -1 );
    }
    
    // ncs 06oct97 - error out of application if TextToSpeechStartUp Fails
    if (mmStatus)
    {
        MessageBox( hWnd,
            "There is an ERROR in Initializing the Text To Speech System.\n\nExiting Application.",
            "DTsample cannot be started.", MB_OK | MB_ICONSTOP );
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
    HMENU main_menu = GetMenu(hWnd);
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
        MessageBox(hWnd, "The menu ID is not in the Language Map.", "Error", MB_OK);
        return;
    }
    else if(pCurrent == ptts_select)  //if the address are the same
        return;
    else  //then you want to switch to the new language 
    {
        CheckMenuItem(main_menu, ptts_select->tts_lang_menu, MF_BYCOMMAND | MF_UNCHECKED);
#ifdef ACCESS32
        mmStatus = TextToSpeechShutdown(phTTS[ptts_select->tts_lang_index]);
        if(mmStatus == MMSYSERR_INVALHANDLE)
        {
            MessageBox(hWnd, "Text to Speech Handle was invalid", "Error", MB_OK);
            return;
        }
        ptts_select = pCurrent;
        TextToSpeechSelectLang(NULL, ptts_select->tts_lang_index);
        mmStatus = TextToSpeechStartupEx(&phTTS[ptts_select->tts_lang_index],
            WAVE_MAPPER, REPORT_OPEN_ERROR | OWN_AUDIO_DEVICE, TTSCallbackRoutine, 0);
        if(mmStatus == MMSYSERR_NOMEM)
        {           
            MessageBox(hWnd, "Memory allocation error.", "Error", MB_OK);
            return;
        }
#else
        ptts_select = pCurrent;
#endif
        mmStatus = TextToSpeechSetRate(phTTS[ptts_select->tts_lang_index], current_rate);
        CheckMenuItem(main_menu, ptts_select->tts_lang_menu, MF_BYCOMMAND | MF_CHECKED);
    }
}