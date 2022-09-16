/****************************************************************************
*
*
*    PROGRAM: DtSample.h
*
*    PURPOSE: Sample demonstrating the use DECtalk API's in Windows
*
*    FUNCTIONS:
*
*    COMMENTS:
*
****************************************************************************
*  001  ncs   09.26.97         Remove _TYPING symbols.                     *
*  002  DR    11.27.97         Added a section for Language Menu IDs.      *
*                              Also added prototypes and max_str define    *
*                              The LANG ID's NUMBERs try to corispond to   *
*                                 our own ids in KERNAL.h                  *
* 003	mfg	  02.19.01			Added French support					   *
****************************************************************************/

// menu commands
#define IDM_MAIN_MENU_CE1	105
#define IDM_MAIN_MENU_CEA32	102
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

// Edit menu
#define IDM_CUT             400
#define IDM_COPY            401
#define IDM_PASTE           402
#define IDM_DELETE          403
#define IDM_MENUTALK        404
#define IDM_HIGHLIGHT_ON    405
#define IDM_HIGHLIGHT_OFF   406
#define IDM_TYPING_ON       407
#define IDM_TYPING_OFF      408

// Dialog box  & Child window constants buttons

#define IDEDIT              500
//#define ID_BUTTON1          501
//#define ID_BUTTON2          502
//#define ID_BUTTON3          503
#define ID_BUTTON1          0
#define ID_BUTTON2          1
#define ID_BUTTON3          2
#define ID_SBRATE           504
#define ID_SSRATE           505
#define ID_EDITCTL          506
//#define IDD_TYPING            507
//#define IDC_TYPING            508

// Speak menu
#define IDM_SPEAKSTART      601
#define IDM_SPEAKPAUSE      602
#define IDM_SPEAKSTOP       603

// Rate menu
#define IDM_SPEAK100        700
#define IDM_SPEAK200        701
#define IDM_SPEAK300        702
#define IDM_SPEAK400        703
#define IDM_SPEAK500        704

//Langs menu
#define IDM_LANG_BEGIN      800
#define IDM_LANG_US         801
#define IDM_LANG_UK         804 
#define IDM_LANG_SP         803 
#define IDM_LANG_LA			802
#define IDM_LANG_GR         805
#define IDM_LANG_FR         806
#define IDM_LANG_END        900


// Scroll Bar
#define SB_UPDATE           100

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

// for CE command bar
#define IDC_NONE             1001

// Help context value
#define IDH_Sample_Program_Applet_Index 53

// constants

#define FILE_LEN            (16364)
#define MAX_STR             134

//Structures
typedef struct tts_lang_map
{
    unsigned int                    tts_lang_index;
    unsigned int                    tts_lang_menu;
    wchar_t                         tts_lang_name[3];  //2 Letter name of lang
    struct tts_lang_map*            next;
}TTS_LANG_MAP; 

typedef struct
{
    unsigned int size;
    TTS_LANG_MAP* start;
}TTS_LANG_MAP_START;

// Function prototypes
// To save changes before exit
void AskToSave();

// procs
long APIENTRY MainWndProc(HWND, UINT, UINT, LONG);
BOOL APIENTRY About(HWND, UINT, UINT, LONG);

//functions
BOOL SaveNewFile( HWND, unsigned int );
BOOL OpenNewFile( HWND );
BOOL InitWindows(HWND);
SHORT HandleScrollBar(WPARAM,SHORT);
void HandleMenuPopup(WPARAM);
void ProcessCDError(DWORD, HWND);
BOOL RdFileToBuf(LPTSTR, HWND);
BOOL RdBufToFile(LPTSTR, HWND);
int InitDectalk(HWND, TTS_LANG_MAP_START*);
MMRESULT destroyDectalk(TTS_LANG_MAP*, unsigned int);
void switchLangs(HWND, TTS_LANG_MAP_START* , unsigned int);

// variables
// This should probably be used in some sort
// of version check like in speak.c
#ifdef ACCESS32
BOOL Menuspeak = TRUE;  // Menu Talk Demo
BOOL Hilite = TRUE;     // Highlighting Demo
BOOL Typing = TRUE;     // Typing Demo
#else
BOOL Menuspeak = FALSE; // Menu Talk Demo
BOOL Hilite = FALSE;    // Highlighting Demo
BOOL Typing = FALSE;    // Typing Demo
#endif
