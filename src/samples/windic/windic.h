/*
 ***********************************************************************
 *          
 *                           Copyright ©
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *    © SMART Modular Technologies 1999, 2000. All rights reserved.
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    windic.h
 *    Author:       
 *    Creation Date:
 *
 ***********************************************************************
 *    Revision History 
 *
 * Rev	Who     Date		Description
 * ---  -----   -------		---------------------------------------
 * 001	MGS		01/24/2001	Added copyright header.
 * 002  MGS		01/24/2001	Added French support 
 */
// File commands
#define IDM_FILE_OPEN                   0xE101
#define IDM_EXIT                        0xE102
#define IDM_SAVE			0xE203
#define IDM_SAVEAS			0xE204
#define IDM_COMPILE_DICTIONARY		0xE205
#define IDM_HELP                        40001
#define IDM_ABOUT                       40002

#define	IDM_FILE_CLOSE				0xE206	//tek 73jul96

// Edit commands
#define ID_EDIT_CLEAR                   0xE120
#define ID_EDIT_COPY                    0xE122
#define ID_EDIT_CUT                     0xE123
#define ID_EDIT_PASTE                   0xE125
#define ID_EDIT_SELECT_ALL              0xE12A
#define ID_EDIT_UNDO                    0xE12B
#define ID_FIND				0xE12C
#define ID_XLATE                        0xE12D

// Dialog box  & Child window constants
#define ID_PLAY				503
#define ID_PREV		    		504
#define ID_NEXT		    		505
#define ID_EDITCTL          		506

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
#define ID_LANGUAGE_FRENCH			776


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
BOOL    CALLBACK DialogProc ( HWND, UINT, WPARAM, LPARAM );
LONG    APIENTRY WndProc    ( HWND, UINT, UINT, LONG) ;
BOOL 		 menuCommand( HWND, WPARAM, LPARAM, char *, LPOPENFILENAME );
BOOL APIENTRY AboutDlgProc( HWND hWnd, UINT uiMessage, UINT wParam, LONG lParam);
LPVOID 		 findHdib   ( INT );
BOOL             ErrMsg     ( PSTR sz,...);
void 		 ProcessCDError    ( DWORD, HWND );

void 		 HandleMenuPopup   ( WPARAM );
INT              MyOpenFile ( LPOPENFILENAME,HANDLE, char *, char * );
int 		 MyReadFile ( HWND, char * );
BOOL 		 SaveFile   ( HWND, char * );
BOOL 		 SaveFileAs ( LPOPENFILENAME, HWND, char * );
BOOL MySaveFile( HWND hWnd, char szFileTitle[] );
BOOL 		 AskToSave  ( HWND, LPOPENFILENAME, char * );
void 		 DefineOpenFileName( HWND, LPOPENFILENAME, char *, char *, char * );
HWND 		 FindDialog( HWND );
BOOL 		 FindSearchString( HWND, DWORD *, LPFINDREPLACE );
BOOL 		 FindValidFind( void );
BOOL 	 	 FindNextText( HWND, DWORD * );

BOOL 		 SpeakText  ( HWND );
BOOL 		 SpeakPronouncation( HANDLE, char * );
void 		 SpeakLine( HANDLE, int );
void 		 CompileUserDic    ( HWND, HWND );
BOOL		 UserDic    ( HWND, UINT, UINT, LPSTR, LPSTR );
BOOL 		 AskToCompile( HWND, HWND );
LRESULT _stdcall AppGetWindowsVersion( PTSTR, PTSTR );
static void GetInstallationInfo( LPSTR, LPSTR );
static void GetApplicationParameters( int *,
                                      int *,
                                      int *,
                                      int *,
                                      int *,
                                      char * );

static void SetApplicationParameters( HWND, char * );
