// menu commands
#define IDM_MAIN_MENU					105

// File commands
#define IDM_FILE_OPEN                   0xE101
#define IDM_EXIT                        0xE102
#define IDM_SAVE						0xE203
#define IDM_SAVEAS						0xE204
#define IDM_COMPILE_DICTIONARY			0xE205
#define IDM_HELP                        40001
#define IDM_ABOUT                       40002

#define	IDM_FILE_CLOSE					0xE206	//tek 73jul96

// Edit commands
#define ID_EDIT_CLEAR                   0xE120
#define ID_EDIT_COPY                    0xE122
#define ID_EDIT_CUT                     0xE123
#define ID_EDIT_PASTE                   0xE125
#define ID_EDIT_SELECT_ALL              0xE12A
#define ID_EDIT_UNDO                    0xE12B
#define ID_FIND							0xE12C
#define ID_XLATE                        0xE12D

// Dialog box  & Child window constants
#define ID_PLAY							0 // CB 503
#define ID_PREV		    				1 // CB 504
#define ID_NEXT		    				2 // CB 505
#define ID_EDITCTL          			506
// CB ADDED LINE
#define ID_HELPCTL						507

// About box definitions.
#define DLG_ABOUT                       100
#define IDD_ABOUT_VERSION_OS            101
#define IDD_ABOUT_VERSION_PLATFORM      102
#define IDD_ABOUT_REG_INSTALLER         103
#define IDD_ABOUT_REG_COMPANY           104

// Resources
#define ICON_APP                        10
#define ID_OK                           1001

//Language stuff
#define ID_LANGUAGE_ENGLISH			771
#define ID_LANGUAGE_SPANISH			772
#define ID_LANGUAGE_GERMAN			773
#define ID_LANGUAGE_LATIN_AMERICAN	774
#define ID_LANGUAGE_BRITISH			775


/*
#ifdef WIN32
#define GET_WM_ACTIVATE_STATE(wp, lp)   LOWORD(wp)
#define GET_WM_VSCROLL_CODE(wp, lp)     LOWORD(wp)
#define GET_WM_VSCROLL_POS(wp, lp)      HIWORD(wp)
#define GET_WM_HSCROLL_CODE(wp, lp)     LOWORD(wp)
#define GET_WM_HSCROLL_POS(wp, lp)      HIWORD(wp)
#define GET_EM_SETSEL_MPS(iStart, iEnd) (UINT)(iStart), (LONG)(iEnd)
#define GET_WM_COMMAND_CMD(wp, lp)      HIWORD(wp)
#define HUGE_T
#else
#define GET_WM_ACTIVATE_STATE(wp, lp)               (wp)
#define GET_WM_HSCROLL_CODE(wp, lp)                 (wp)
#define GET_WM_HSCROLL_POS(wp, lp)                  LOWORD(lp)
#define GET_WM_VSCROLL_CODE(wp, lp)                 (wp)
#define GET_WM_VSCROLL_POS(wp, lp)                  LOWORD(lp)
#define GET_EM_SETSEL_MPS(iStart, iEnd) 0, MAKELONG(iStart, iEnd)
#define GET_WM_COMMAND_CMD(wp, lp)      HIWORD(lp)
#define HUGE_T         huge
#endif
*/

// Help context value
#define IDH_User_Dictionary_Applet_Index  55

/* Macros to display/remove hourglass cursor for lengthy operations */
#define StartWait() hcurSave = SetCursor(LoadCursor(NULL,IDC_WAIT))
#define EndWait()   SetCursor(hcurSave)

/***************** ERROR CODES *************************/

#define IDS_DIALOGFAILURE     1
#define IDS_STRUCTSIZE        2
#define IDS_INITIALIZATION    3
#define IDS_NOTEMPLATE        4
#define IDS_NOHINSTANCE       5
#define IDS_LOADSTRFAILURE    6
#define IDS_FINDRESFAILURE    7
#define IDS_LOADRESFAILURE    8
#define IDS_LOCKRESFAILURE    9
#define IDS_MEMALLOCFAILURE  10
#define IDS_MEMLOCKFAILURE   11
#define IDS_NOHOOK           12
#define IDS_SETUPFAILURE     13
#define IDS_PARSEFAILURE     14
#define IDS_RETDEFFAILURE    15
#define IDS_LOADDRVFAILURE   16
#define IDS_GETDEVMODEFAIL   17
#define IDS_INITFAILURE      18
#define IDS_NODEVICES        19
#define IDS_NODEFAULTPRN     20
#define IDS_DNDMMISMATCH     21
#define IDS_CREATEICFAILURE  22
#define IDS_PRINTERNOTFOUND  23
#define IDS_NOFONTS          24
#define IDS_SUBCLASSFAILURE  25
#define IDS_INVALIDFILENAME  26
#define IDS_BUFFERTOOSMALL   27
#define IDS_FILTERSTRING     28
#define IDS_UNKNOWNERROR     29

/***************** GLOBAL VARIABLES *************************/
extern HWND hWndApp;                   /* The handle to the app. window     */

/***************** FUNCTION DECLARATIONS *******************/
// Procs
BOOL		 CALLBACK DialogProc( HWND, UINT, WPARAM, LPARAM );
// CB CHANGED WndProc to MainWndProc  
LONG		 APIENTRY MainWndProc( HWND, UINT, UINT, LONG);
BOOL APIENTRY AboutDlgProc( HWND hWnd, UINT uiMessage, UINT wParam, LONG lParam);

// Functions
// CB
BOOL 		 menuCommand( HWND, WPARAM, LPARAM, TCHAR *, LPOPENFILENAME );
LPVOID 		 findHdib( INT );
BOOL             ErrMsg( PSTR sz,...);
void 		 ProcessCDError( DWORD, HWND );

// CB CHANGED WPARAM to HMENU
void 		 HandleMenuPopup( HMENU );

// CB CHANGED form HANDLE to HWND & CHAR TO TCHAR
INT          MyOpenFile( LPOPENFILENAME, HWND, TCHAR *, TCHAR * );
// CB
int 		 MyReadFile( HWND, TCHAR * );
BOOL 		 SaveFile( HWND, char * );
// CB
BOOL 		 SaveFileAs( LPOPENFILENAME, HWND, TCHAR * );
// CB CHNAGED char to TCHAR
BOOL		 MySaveFile( HWND hWnd, TCHAR szFileTitle[] );
// CB CHANGED char * to LPTSTR
BOOL 		 AskToSave( HWND, LPOPENFILENAME, LPTSTR );
// CB 
void 		 DefineOpenFileName( HWND, LPOPENFILENAME, TCHAR *, TCHAR *, TCHAR * );

HWND 		 FindDialog( HWND );
// CB CHANGED LPFINDREPLACE
BOOL 		 FindSearchString( HWND, DWORD *, LPFINDREPLACE );
BOOL 		 FindValidFind( void );
BOOL 	 	 FindNextText( HWND, DWORD * );

BOOL 		 SpeakText( HWND );
// CB CHANGED form HANDLE to HWND
// CB CHANGED HANDLE to HWND & char * to TCHAR
BOOL 		 SpeakPronouncation( HWND, TCHAR * );
// CB CHANGED form HANDLE to HWND
void 		 SpeakLine( HWND, int );
void 		 CompileUserDic( HWND, HWND );
// CB LPSTR to TCHAR *
BOOL		 UserDic( HWND, UINT, UINT, TCHAR *, TCHAR *);
BOOL 		 AskToCompile( HWND, HWND );
// CB CHANGED PTSTR to LPTSTR
LRESULT		 _stdcall AppGetWindowsVersion( LPTSTR, LPTSTR );
// CB CHANGED LPSTR to LPTSTR
static void GetInstallationInfo( LPTSTR, LPTSTR );
static void GetApplicationParameters( int *, int *, int *, int *, int *, char * );
// CB & REMOVED
// static void SetApplicationParameters( HWND, TCHAR * );
