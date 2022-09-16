#include <windows.h>

/**********************************************************************/
/*  System menu command application message values.                   */
/**********************************************************************/

#define IDM_CONFIG          100
#define IDM_ABOUT           101
#define IDM_HELP            102
#define IDM_TOP             103

/**********************************************************************/
/*  Configure dialog box message values.                              */
/**********************************************************************/

#define IDD_PAUL            200
#define IDD_HARRY           202
#define IDD_DENNIS          204
#define IDD_FRANK           203
#define IDD_RITA            207
#define IDD_BETTY           201
#define IDD_URSULA          206
#define IDD_KIT             205
#define IDD_WENDY           208
#define IDD_VSLOW           612
#define IDD_SLOW            613
#define IDD_NORMAL          614
#define IDD_FAST            615
#define IDD_VFAST           616
#define IDD_TEST            601
#define IDD_CANCEL          602
#define IDD_HELP            617
#define IDD_OK              618

/**********************************************************************/
/*  Dialog box  & Child window constants                              */
/**********************************************************************/

#define ID_PAUSE_BUTTON     500
#define ID_STOP_BUTTON      501

/**********************************************************************/
/*  About box definitions.                                            */
/**********************************************************************/

#define DLG_ABOUT                       100
#define IDD_ABOUT_VERSION_OS            101
#define IDD_ABOUT_VERSION_PLATFORM      102
#define IDD_ABOUT_REG_INSTALLER         103
#define IDD_ABOUT_REG_COMPANY           104

#define ICON_APP                        10

/**********************************************************************/
/*  Help context number.                                              */
/**********************************************************************/

#define IDH_Text_to_Speech_Server_Help 45

/**********************************************************************/
/*  String constants                                                  */
/**********************************************************************/

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

/**********************************************************************/
/*  Definitions for button Bitmap resources.                          */
/**********************************************************************/

#define  PAUSE_SELECTED_RES    1000
#define  PAUSE_ENABLED_RES     1001
#define  PAUSE_DISABLED_RES    1002

#define  STOP_SELECTED_RES     2000
#define  STOP_ENABLED_RES      2001
#define  STOP_DISABLED_RES     2002

/**********************************************************************/
/*  Owner Draw Button definitions and Data structure.                 */
/**********************************************************************/

#define  BUTTON_DISABLED   0
#define  BUTTON_ENABLED    1
#define  BUTTON_SELECTED   2

typedef struct BUTTON_DATA_TAG
{
  HWND hWnd;
  int iButtonState;
  LPBITMAPFILEHEADER pSelectedDib;
  LPBITMAPFILEHEADER pEnabledDib;
  LPBITMAPFILEHEADER pDisabledDib;
} BUTTON_DATA_T;

typedef BUTTON_DATA_T * LPBUTTON_DATA_T;

/**********************************************************************/
/*  Function prototypes                                               */
/**********************************************************************/

LONG APIENTRY MainWndProc( HWND, UINT, UINT, LONG );

BOOL APIENTRY AboutDlgProc( HWND hWnd, UINT uiMessage, UINT wParam, LONG lParam);

BOOL APIENTRY Configure( HWND, UINT, UINT, LONG );

HDDEDATA APIENTRY DdeCallback( UINT,
                               UINT,
                               HCONV,
                               HSZ,
                               HSZ,
                               HDDEDATA,
                               DWORD,
                               DWORD);
BOOL InitWindows( HWND );

static HWND CreateOwnerDrawButton( HWND,
                                   int,
                                   int,
                                   int,
                                   int,
                                   unsigned int,
                                   LPBITMAPFILEHEADER,
                                   LPBITMAPFILEHEADER,
                                   LPBITMAPFILEHEADER );

static void DestroyOwnerDrawButton( HWND );

static LPBITMAPFILEHEADER GetDibHandle( int );

static LRESULT CALLBACK pButtonSubclassWndProc( HWND,
                                                UINT,
                                                WPARAM,
                                                LPARAM );

static void DisplayBitmapUsingHdc( HDC, LPBITMAPFILEHEADER );

static void DisplayBitmapUsingHandle( HWND, LPBITMAPFILEHEADER );

static void SelectOwnerDrawButton( HWND );

static void DisableOwnerDrawButton( HWND );

static void EnableOwnerDrawButton( HWND );
LRESULT _stdcall AppGetWindowsVersion( PTSTR, PTSTR );
static void GetInstallationInfo( LPSTR, LPSTR );

static void GetApplicationParameters( int *,
                                      int *,
                                      int *,
                                      int * );

static void SetApplicationParameters( HWND, int );
