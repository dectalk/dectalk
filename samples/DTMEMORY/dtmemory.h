
// menu commands

// Find menu
#define IDM_OPENFILE        100
#define IDM_EXIT            104

// Speaking Voice menu
#define IDM_PAUL            200
#define IDM_HARRY           201
#define IDM_DENNIS          202
#define IDM_FRANK           203
#define IDM_RITA            204
#define IDM_BETTY           205
#define IDM_URSULA          206
#define IDM_KIT             207
#define IDM_WENDY           208

// Help menu
#define IDM_ABOUT           300
#define IDM_HELP            301
#define IDC_DECTALK_VERSION 302
// Edit menu
#define IDM_CUT		    400
#define IDM_COPY	    401
#define IDM_PASTE           402
#define IDM_DELETE	    403


// Dialog box  & Child window constants
#define IDEDIT              500
#define ID_BUTTON1          501
#define ID_BUTTON2          502
#define ID_BUTTON3          503
#define ID_SBRATE	    504
#define ID_SSRATE	    505
#define ID_EDITCTL          506
// string constants

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

// constants

#define FILE_LEN            32768

// Function prototypes

// procs
long APIENTRY MainWndProc(HWND, UINT, UINT, LONG);
BOOL APIENTRY About(HWND, UINT, UINT, LONG);

//functions
BOOL InitApplication(HANDLE);
BOOL InitInstance(HANDLE, int);
BOOL OpenNewFile( HWND );
BOOL InitWindows(HWND);
SHORT HandleScrollBar(WPARAM,SHORT);
void HandleMenuPopup(WPARAM);
void ProcessCDError(DWORD, HWND);
BOOL RdFileToBuf(LPTSTR, HWND);
