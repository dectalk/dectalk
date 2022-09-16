/**********************************************************************/
/**********************************************************************/
/*  Include file: speak.h                                             */
/**********************************************************************/
/**********************************************************************/
/* 001	MGS		09/19/2000		Fixed warnings
 * 002	MGS		10/13/2000		Added French Demo code
 */

// File commands
#define IDM_FILE_NEW                    0xE100
#define IDM_FILE_OPEN                   0xE101
#define IDM_EXIT                        0xE102
#define IDM_FILE_SAVE                   0xE103
#define IDM_FILE_SAVE_AS                0xE104
#define IDM_LOAD_DIC                    0xE105
#define IDM_UNLOAD_DIC                  0xE106
#define IDM_FILE_CLOSE                  0xE107
#define IDM_WAVE1116                    0xE200
#define IDM_WAVE1108                    0xE201
#define IDM_MULAW                       0xE202
#define ID_PAUSE                        0xE108  // BH
#define ID_STOP                         0xE109  // BH
#define IDM_SAVE                        0xE203
#define IDM_SAVEAS                      0xE204
#define IDM_HELP                        40001
#define IDM_ABOUT                       40002
#define ID_FILE_MRU_FILE1               0xE110          // range - 16 max
#define ID_FILE_MRU_FILE2               0xE111
#define ID_FILE_MRU_FILE3               0xE112
#define ID_FILE_MRU_FILE4               0xE113

#define IDM_DEMO						0xE2E8
#define IDM_ORDER						0xE2E9
#define IDM_COMMAND						0xE2EA
#define IDM_EMAIL						0xE2EB
#define IDM_DEMO_US						0xE2EC
#define IDM_DEMO_GR						0xE2ED
#define IDM_DEMO_SP						0xE2EE
#define IDM_DEMO_LA						0xE2EF
#define IDM_DEMO_UK						0xE2F0
#define IDM_DEMO_FR						0xE2F1

// Edit commands
#define ID_EDIT_CLEAR                   0xE120
#define ID_EDIT_CLEAR_ALL               0xE121
#define ID_EDIT_COPY                    0xE122
#define ID_EDIT_CUT                     0xE123
#define ID_EDIT_FIND                    0xE124
#define ID_EDIT_PASTE                   0xE125
#define ID_EDIT_SELECT_ALL              0xE12A
#define ID_EDIT_UNDO                    0xE12B
#define ID_EDIT_REDO                    0xE12C
#define ID_FIND                         0xE12D
#define ID_CPANEL                       40005

// About box definitions.
#define DLG_ABOUT                       100
#define IDD_ABOUT_VERSION_OS            101
#define IDD_ABOUT_VERSION_PLATFORM      102
#define IDD_ABOUT_REG_INSTALLER         103
#define IDD_ABOUT_REG_COMPANY           104
#define IDD_ABOUT_DECTALK_VERSION       105
#define IDD_ABOUT_DECTALK_VERSION_STR   106

#define ICON_APP                        10

// Help context value
#define IDH_Speak_Program_Applet_Index  51

typedef    POINTS MPOINT;

#ifdef WIN32
#define GET_WM_ACTIVATE_STATE(wp, lp)   LOWORD(wp)
#define GET_WM_VSCROLL_CODE(wp, lp)     LOWORD(wp)
#define GET_WM_VSCROLL_POS(wp, lp)      HIWORD(wp)
#define GET_WM_HSCROLL_CODE(wp, lp)     LOWORD(wp)
#define GET_WM_HSCROLL_POS(wp, lp)      HIWORD(wp)
#define GET_EM_SETSEL_MPS(iStart, iEnd) (UINT)(iStart), (LONG)(iEnd)
#define GET_WM_COMMAND_CMD(wp, lp)      HIWORD(wp)
#define MAKEMPOINT(l)                   (*((MPOINT *)&(l)))
#define HUGE_T
#else
#define GET_WM_ACTIVATE_STATE(wp, lp)               (wp)
#define GET_WM_HSCROLL_CODE(wp, lp)                 (wp)
#define GET_WM_HSCROLL_POS(wp, lp)                  LOWORD(lp)
#define GET_WM_VSCROLL_CODE(wp, lp)                 (wp)
#define GET_WM_VSCROLL_POS(wp, lp)                  LOWORD(lp)
#define GET_EM_SETSEL_MPS(iStart, iEnd) 0, MAKELONG(iStart, iEnd)
#define GET_WM_COMMAND_CMD(wp, lp)      HIWORD(lp)
#define MAKEMPOINT(l)                   (*((MPOINT FAR *)&(l)))
#define HUGE_T         huge
#endif

/* Macro to restrict a given value to an upper or lower boundary value */
#define BOUND(x,min,max) ((x) < (min) ? (min) : ((x) > (max) ? (max) : (x)))

/* Macro to swap two values */
#define SWAP(x,y)   ((x)^=(y)^=(x)^=(y))

/* Macro to find the minimum of two values */
#define MIN(x,y) (((x) <= (y)) : x ? y)

/* Macros to display/remove hourglass cursor for lengthy operations */
#define StartWait() hcurSave = SetCursor(LoadCursor(NULL,IDC_WAIT))
#define EndWait()   SetCursor(hcurSave)

/* WinFlags, __WinFlags is a ABS external, thus the need for the & */
#define WinFlags    ((WORD)(&_WinFlags))

#define MINBAND         50     /* Minimum band size used by the program */
#define BANDINCREMENT   20     /* Decrement for band size while trying  */
			       /* to determine optimum band size.       */

#ifdef NOT_IN_STDIO
/* flags for _lseek */
#define  SEEK_CUR 1
#define  SEEK_END 2
#define  SEEK_SET 0
#endif

extern HWND hWndApp;                   /* The handle to the app. window     */

#define MAXREAD  32768                 /* Number of bytes to be read during */
				       /* each read operation.              */
/* Macro to align given value to the closest DWORD (unsigned long ) */
#define ALIGNULONG(i)   ((i+3)/4*4)

/* Macro to determine to round off the given value to the closest byte */
#define WIDTHBYTES(i)   ((i+31)/32*4)

#define PALVERSION      0x300
#define MAXPALETTE      256       /* max. # supported palette entries */

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

extern CHAR           achFileName[128]; /* File pathname                       */

/***************** FUNCTION DECLARATIONS *******************/
LPVOID           findHdib(INT id);
INT              usePalette(HWND hWnd, CHAR* szPalResName);
DWORD   PASCAL   lread(INT fh, VOID FAR *pv, DWORD ul);
DWORD   PASCAL   lwrite(INT fh, VOID FAR *pv, DWORD ul);
BOOL    CALLBACK DialogProc(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam);
LONG    APIENTRY WndProc  (HWND, UINT, UINT, LONG) ;
BOOL             menuCommand(HWND hWnd, WPARAM wParam, LPARAM lParam);
INT              DrawControl(HWND hWnd, LPDRAWITEMSTRUCT lpInfo);
BOOL             InitFirstInstance(HANDLE);
void             DrawAuthor(HWND hWnd);

BOOL             fDialog (INT id, HWND hwnd, FARPROC fpfn);
BOOL APIENTRY AboutDlgProc( HWND hWnd, UINT uiMessage, UINT wParam, LONG lParam);
void             ErrorHandler( HANDLE, CHAR *, CHAR * );
LRESULT CALLBACK npVoiceControls (HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam);
INT              MyOpenFile( HANDLE, char *, char * );
int              MyReadFile( HWND, char * );
void             ScrollProc(HWND hWnd, WPARAM wParam, LPARAM lParam, INT *nHscrollPos);
INT              ErrMsg (PSTR sz,...);
void             ProcessCDError(DWORD, HWND );
void             HandleMenuPopup(WPARAM wParam);
SHORT            HandleScrollBar(WPARAM,SHORT);
BOOL             SaveWaveName(HWND);
BOOL             SaveFile(HWND);
BOOL             SaveFileAs(HWND);
BOOL             GetDictName(HWND);
BOOL             AskToSave(HWND);
BOOL             SpeakText(HWND);
HWND             FindDialog( HWND );
BOOL             FindSearchString( HWND, DWORD *, LPFINDREPLACE );
BOOL             FindValidFind( void );
BOOL             FindNextText( HWND, DWORD * );
BOOL MySaveFile( HWND hWnd);
LRESULT _stdcall AppGetWindowsVersion( PTSTR, PTSTR );
static void GetInstallationInfo( LPSTR, LPSTR );
static void GetApplicationParameters( int *,
				      int *,
				      int *,
				      int *,
				      int *,
				      char * );

static void SetApplicationParameters( HWND, char * );
