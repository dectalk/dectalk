/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*	Copyright © 2002 Fonix Corporation. All rights reserved			  */
/*  Copyright © 2000, 2001 Force Computers, Inc., a solectron Company. all rights reserved. */
/*  Copyright (c) Digital Equipment Corporation, 1998                 */
/*																	  */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of Fonix Corporation 		  */
/*  Incorporated. Possession, use, duplication or dissemination of    */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from Fonix Corporation.							  */
/*                                                                    */
/*  The name of Fonix Corporation may not be used to				  */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      */
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        */
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        */
/*  FOR A PARTICULAR PURPOSE.                                         */
/*  Force assumes no responsibility AT ALL for the use or           */
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
/**********************************************************************/

/************************************************************************
 * SPEAK SAMPLE PROGRAM FOR THE DECTALK SOFTWARE                        *
 ************************************************************************
 * Revision History:                                                    *
 *  001 - Initial Creation  (Bill Hallahan)                             *
 *  002 - Fix load and find problems (Kevin Bruckert) (7/19/96)         *
 *  003 - Switched to TextToSpeechStartupEx and added message handler   *
 *          (Kevin Bruckert) (7/22/96)                                  *
 *  004 - Added Control Panel option and DLL version checking           *
 *          (Kevin Bruckert) (7/24/96)                                  *
 *  005 - Added better command parser for quoted parameters             *
 *          (Kevin Bruckert) (8/5/96)                                   *
 *  006 - Removed TextToSpeechStartupEx call due to fix in code         *
 *          (Kevin Bruckert) (10/15/96)                                 *
 *  007 - Added DEMO flag to support dtdemo build                       *
 *          (Steve Kaufman)  (12/11/96)                                 *
 *  008 - Add highlighting, versioning information, usage parameters,   *
 *        abd error termination.   (Kevin Bruckert) (12/17/96)          *
 *  009 - Moved the version numbers, and added NO_HIGHLIGHT option      *
 *          (Kevin Bruckert) (12/18/96)                                 *
 *  010 - Put in fix for license info under Help, About DTdemo menu     *
 *			(Steve Kaufman) (12/19/96)                            *
 *  011 - Fixed highlighting to support tabs as whitespace              *
 *          (Kevin Bruckert) (1/14/97)                                  *
 *  012 - Added new speed control and set default to 200 WPM            *
 *          (Kevin Bruckert) (1/14/97)                                  *
 *  013 - Merge the fix in V4.3 speak.c                                 *
 *  014 - Put in new changes for DTDemo from Anne and Rich              *
 *          (Kevin Bruckert) (1/22/97)                                  *
 *  015 - Fixed WM_CUT as the way to clear the edit control to WM_CLEAR *
 *          (Kevin Bruckert) (2/3/97)                                   *
 *  016 - Fixed FIND function again. Was caused by premature free call  *
 *      - and bug in find algorithm. Is now fixed, and functional.      *
 *          (Kevin Bruckert) (2/3/97)                                   *
 *  017 - Change COMMAND.TXT to COMMANDS.TXT                            *
 *          (Carl Leeber) (2/20/97)                                     *
 *  018a- Use symbol DTALK_HELP_FILE_NAME BATS#307; Changed help call.  *
 *          (Carl Leeber) (4/16/97)                                     *
 *  018b- Added RELOAD and RESTART DECTALK items                        *
 *          (Kevin Bruckert) (3/31/97)                                  *
 *  019a- For BATS#373 fix the table reading problem in hightlight mode *
 *          (Ginger Lin) (5/14/97)                                      *
 *  019b- Use symbol DTALK_HELP_FILE_NAME BATS#307; Changed help call.  *
 *          (Carl Leeber) (4/16/97)                                     *
 *  020a- For BATS#DUNNO Fix the check for DECTALK.DLL Version, and     *
 *      - also taught SPEAK what ACCESS32 vs DECTALK means (no typing)  *
 *          (Kevin Bruckert) (8/1/97)                                   *
 *  020b- Added DEBUG mode testing                                      *
 *          (Kevin Bruckert) (5/07/97)                                  *
 *  021a- Moved registry entries to coop.h                              *
 *          (Nick Shin) (08/07/97)                                      *
 *  021b- Added easter egg in ABOUT area                                *
 *          (Kevin Bruckert) (6/25/97)                                  *
 *  022 - Change helptopic entry.                                       *
 *          (Carl Leeber) (8/15/97)                                     *
 *  023 - Fixed bug with half-highlights and fixed highlight done       *
 *          (Kevin Bruckert) (8/19/97) (BATS 445)                       *
 *  024 - Merged in the Multi-Language version of Speak into code-base  *
 *          (Nick Shin) (9/12/97)                                       *
 *  025 - Re-fixed highlighting/index mark bug.                         *
 *          (Carl Leeber/KSB) (9/29/97)
 *  026 - Add UK_english support.                                       *
 *          (Ginger Lin) (10/02/97)
 *  027 - Corrected error exit message.                                 *
 *          (Nick Shen)  (10/06/97)                                     *
 *  028 - Now using ML stuff as the standard setting                    *
 *          (Nick Shen)  (10/16/97)                                     *
 *  029 - Added English UK to edit menu                                 *
 *          (Matthew Schnee) (01/07/1998)                               *
 *  030 - Made current language checked in the menu BATS #563			*
 *			(Matthew Schnee) (02/02/1998)								*
 *  031 - For BATS #456  Fixed GetInstallationInfo(...) so it accesses  *
 *		- correct key within the registry.                              *
 *          (Jason Warlikowski) (2/13/98)                               *
 *  032 - For BATS #632  Use the right "what" for each language         *
 *          (Ginger Lin) (4/16/98)                                      *
 *  033 - BATS #599 Made speak only load 1 language at a time with ML   *
 *          (Matthew Schnee) (7/8/1998)
 *  034	- bats 518: correct min rate for Access32. tek 02nov98			*
 *  035	- bats 862: use SPANISH_LA and SPANISH_SP compiler switch. GL 29Jan99 *
 *  036 - Added French support.
 *          (Charles Jordan) (7/21/2000)
 *	037	- Fixed warnings
 *			(Matthew Schnee) (09/19/2000)
 *	038	- Added French demo
 *			(Matthew Schnee) (10/13/2000)
 *  039 - Fixed copyright
 *          (christian Berrios) 10/13/2000)
 * 040 CAB 12/06/00		1. Fixed error change file from commands to command.txt
 *						2. In addition added [tts_select] to TextToSpeechReset to remove crash error.
 * 041 CAB 12/08/00		1. Fixed bug which asked to saveas when file had a filename already
 *						2. Changed TXT to lowercase for display and saveas extension.
 * 042 CAB	04/04/01	Fixed 0 size file open bug
 * 043 MGS	05/03/2001	Removed useless calls to startup/shutdown for the typing demo.
 *						Part of ACCESS32 Integration BATS #972
 * 044 CAB	05/14/2001	Updated and corrected copyright info
 * 045 CAB	05/16/2002	Removed easter egg stuff
 * 046 CAB	08/08/2002	Updated version
 * 047 CAB	08/13/2002	Changed rate to 180 per Ed
 * 048 MFG	06/30/2003	removed the checkversion() call to fix mismatched dlls
 * 049 MFG	07/07/2003  changed the speak rate from 74 to 50 for the min
 ************************************************************************/

#include <windows.h>
#include <commdlg.h>
#include <dlgs.h>       // includes common dialog template defines
#include <cderr.h>      // includes the common dialog error codes
#include <mmsystem.h>
#include <mmreg.h>
#include <io.h>
#include <stdio.h>
#include <tchar.h>		// For TCHAR mappings 
#include <string.h>
#include <stdlib.h>
#include "ttsapi.h"
#include "speak.h"
#include "resource.h"
#include "resrc1.h"
#include "afxres.h"

#define SPEAK_C
#include "coop.h"
#undef SPEAK_C

/* Major Version Information - KSB */
//#define	DECTALK_DLL_VER			1	// KSB
#define	ACCESS32_DLL_VER			3	// KSB

/* Minor Version Information - KSB */
//#define	DECTALK_CPANEL_DLL_MIN_VER		20	// KSB
//#define	DECTALK_HIGHLIGHT_DLL_MIN_VER	 3	// KSB
#define	ACCESS32_CPANEL_DLL_MIN_VER		20	// KSB
#define	ACCESS32_HIGHLIGHT_DLL_MIN_VER	 0	// KSB
#define	ACCESS32_TYPING_DLL_MIN_VER		20	// KSB

#define	SPEAK_RATE	200

//#define  WAVE_FORMAT_08M08  WAVE_FORMAT_MULAW

#define RATE_MAX 600
#define RATE_MIN 50
#define ACCESS32_RATE_MIN 50

#define RATE 0
#define VOLUME 1
#define PLAY 9
#define PAUSE 10
#define STOP 11
#define RELOAD 12

#define IDC_BUTTON		1
#define IDR_BUTTON      200
#define IDR_BUTTONS     201

#define fbWidth			64     //face buttons
#define fbHeight		64

#define stWidth			100    //static text for rate control
#define stHeight		20

#define sbWidth			154    //scroll bar fore rate control
#define sbHeight		17

#define slWidth			100    //Static text for Label Speaking Rate
#define slHeight		20

#define border			2

#define pbWidth			32      // push buttons
#define pbHeight		32

#define etWidth			600 - border * 4   //edit text for words to speek
#define etHeight		330 - border * 4

#define awWidth			etWidth + border * 4 + 4    //application window
#define awHeight		fbHeight + 60 + stHeight + border * 4  + etHeight

#define FILESIZE 256

/* Command Line Parser */
BOOL CmdParse(LPSTR CmdLine, LPSTR filename, LPSTR dictname);
VOID TTSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);
void typing_demo(HANDLE hinst, HWND hWnd);
void update_mark(ULONG);
BOOL APIENTRY AboutTypingProc(HWND hWnd, UINT uiMsg, WPARAM wParam, LPARAM lParam);
BOOL APIENTRY TypingDlgProc(HWND hWnd, UINT uiMsg, WPARAM wParam, LPARAM lParam);
FARPROC OldTypingDlgProc;

typedef struct mark_pos_struct {
	ULONG start;
	ULONG end;
	struct mark_pos_struct *next_mark;
} MARK_POS;
MARK_POS *mark_pos = NULL;

HWND hwndButton;
HWND DECtalkSpeakWin;
HANDLE hInst;

LPLANG_ENUM languageINFO;

#ifdef ML_DEMO
char *gl_orderfile = "Order.txt";
char *gl_demofile_us = "Demo.en";
/* GL 10/02/1997 add UK english support */
char *gl_demofile_uk = "Demo.uk";
char *gl_demofile_gr = "Demo.gr";
char *gl_demofile_sp = "Demo.sp";
char *gl_demofile_la = "Demo.la";
char *gl_commandfile = "command.txt";
char *gl_emailfile = "EMail.txt";
#endif

#ifdef DEMO
#ifdef ENGLISH_US
char *gl_orderfile = "Order.txt";
char *gl_demofile = "Demo.en";
char *gl_commandfile = "command.txt";
char *gl_emailfile = "EMail.txt";
#endif

/* GL 10/02/1997 add UK english support */
#ifdef ENGLISH_UK
char *gl_orderfile = "Order.txt";
char *gl_demofile = "Demo.uk";
char *gl_commandfile = "command.txt";
char *gl_emailfile = "EMail.txt";
#endif

#ifdef SPANISH_LA
char *gl_orderfile = "Order.txt";
char *gl_demofile = "Demo.la";
char *gl_commandfile = "command.txt";
char *gl_emailfile = "EMail.txt";
#endif	// SPANISH_LA

#ifdef SPANISH_SP
char *gl_orderfile = "Order.txt";
char *gl_demofile = "Demo.sp";
char *gl_commandfile = "command.txt";
char *gl_emailfile = "EMail.txt";
#endif	// SPANISH_SP

#ifdef GERMAN
char *gl_orderfile = "Order.txt";
char *gl_demofile = "Demo.gr";
char *gl_commandfile = "command.txt";
char *gl_emailfile = "EMail.txt";
#endif	// GERMAN

#ifdef FRENCH
char *gl_orderfile = "Order.txt";
char *gl_demofile = "Demo.fr";
char *gl_commandfile = "command.txt";
char *gl_emailfile = "EMail.txt";
#endif  //FRENCH
#endif	// DEMO

#ifdef DEMO
char *szAppName = TEXT("DTdemo");
#else
char *szAppName = TEXT("Speak");
#endif

/**********************************************************************/
/*  Global variables.                                                 */
/**********************************************************************/

BOOL SaveSaveAs = TRUE;	// Do we need to do "Save" as "Save As"?

BOOL CPanel = FALSE;	// Control Panel DLL version found	KSB
BOOL Hilite = FALSE;	// Highlighting Demo Available		KSB
BOOL Typing = FALSE;	// Typing Demo Available			KSB

char szFile[FILESIZE] = "\0";
char szFileTitle[FILESIZE] = "\0";
char szFileSave[FILESIZE] = "\0";
char szFileTitleSave[FILESIZE] = "\0";
char szFindText[FILESIZE];
char szReplaceText[FILESIZE];
HWND hDropWindow;
DWORD   dwUse16ColorBitmaps = 0;
LPTTS_HANDLE_T phTTS[20];
unsigned int tts_select = 0;
int current_language=0;
WNDPROC opVoiceControls;
BOOL bPaused = FALSE; // TRUE means Paused
HDC myHdc;
HWND hWndApp;
HPALETTE hPalLogical, hPalOld, hTeamPalLogical;
HWND hVolume, hRate, hstRate, hstRateLabel, hSpeakText, hDigital, hFind;
OPENFILENAME OpenWaveName;
OPENFILENAME OpenFileName;
OPENFILENAME OpenDictName;
PBYTE pFileData;
ULONG   speak_mark = 0;
unsigned int		DECtalk_maj_ver, DECtalk_min_ver, DECtalk_build;
LPSTR				DECtalk_version;
//PBYTE pFileDataEnd ;
CHAR         szWaveFilter[] = "Wave Files (*.WAV)\0*.WAV\0All Files (*.*)\0*.*\0";
CHAR         szFilter[] = "Text Files (*.txt)\0*.txt\0All Files (*.*)\0*.*\0";
CHAR         szWaveFile[256] = "\0";
CHAR         szWaveFileTitle[256];
HANDLE hFile = 0;
char szBuf[32];
HANDLE hFileMap ;
struct OWNERDRAW {
  HWND hWnd;
  CHAR szSelVoice[80];
  CHAR szTest[80];
  LPBITMAPFILEHEADER  lpbfNormalDib;
  LPBITMAPFILEHEADER  lpbfSelectedDib;
};
//LPBITMAPFILEHEADER easter_egg_DIB;
USHORT current_rate;
struct OWNERDRAW odButton[13];
HWND hPlay, hPause, hStop;
int cBufLen;
int highlight = 0;              // KSB - Highlighting disabled by default
BOOL bWin95 = FALSE;		  //MVP:Flag to specify OS 
	                          //TRUE :	Windows'95
	                          //FALSE :else

// variables to hold the rate limits
int rateMax = RATE_MAX;
int rateMin = RATE_MIN;


/* New functions  (KSB) */
//void easter_egg(void);
BOOL CheckVersion(void);

/* GL 10/02/1997 add UK english support */
unsigned int TTS_us = 0, TTS_uk = 0; TTS_sp = 0, TTS_la = 0, TTS_gr = 0, TTS_fr=0, TTS_it=0;
BOOL us_on, uk_on, sp_on, gr_on, la_on, fr_on, it_on;
BOOL ml_mode;
LPVERSION_INFO versionINFO;

/********************************************************************
 *      Function Name: WinMain()
 *
 *      Description:
 *
 *      Arguments:	HINSTANCE hInstance
 *					HINSTANCE hPrevInstance
 *					LPSTR lpCmdLine
 *					int nCmdShow
 *
 *      Return Value: int:
 *
 *      Comments:
 *
 * *****************************************************************/
int APIENTRY WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance,
					  LPSTR lpCmdLine, int nCmdShow)
{
	int iX;
	int iY;
	int iWidth;
	int iHeight;
	int iShow;
	HWND        hWnd;
	WNDCLASS    wndclass;
	MSG         msg;
	int         xScreen, yScreen;
	MMRESULT    mmStatus;
	int         i = 1;
	OSVERSIONINFO  OSVersionInfo;
	char			title[256];				// KSB Dec 16,1996 - Title line
	char			filename[256], dictname[256];           // 256 for Win95 limits
	HMENU			main_menu, sub_menu;	// KSB Dec 16,1996 - Add Control Panel menu option
	MENUITEMINFO	menu_item;
	
#ifdef DEMO
	strcpy(filename,gl_demofile);			// Default with the language file
	strcpy(dictname,"");				// Default with no user dictionary
#elif ML_DEMO
	strcpy(filename,gl_demofile_us);		// Default with the language file
	strcpy(dictname,"");				// Default with no user dictionary
#else
	strcpy(filename,"");				// No default file to load
	strcpy(dictname,"");				// No default user dictionary to load
#endif
	
	// Scan for command-line parameters now, so we can quit if we wish
	if (CmdParse(lpCmdLine, filename, dictname))	return (FALSE);
	
	OSVersionInfo.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
	GetVersionEx(&OSVersionInfo);
	
	if(OSVersionInfo.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS) 
		bWin95 = TRUE;	 //i.e It is Windows'95 OS.
	
	hInst = hInstance;
	
/*	if (CheckVersion() == FALSE)	 return (FALSE); mfg 061603*/
	if (CheckVersion() == FALSE)	 return (FALSE); //THis has to be called for the help (about speak to work)

	
	wndclass.style         = CS_HREDRAW | CS_VREDRAW | CS_DBLCLKS | CS_OWNDC;
	wndclass.lpfnWndProc   = (WNDPROC) WndProc ;
	wndclass.cbClsExtra    = 0 ;
	wndclass.cbWndExtra    = 0 ;
	wndclass.hInstance     = NULL ;
	wndclass.hIcon         = LoadIcon(hInstance, MAKEINTRESOURCE( ICON_APP ));
	wndclass.hCursor       = LoadCursor (NULL, IDC_ARROW) ;
	wndclass.hbrBackground = GetStockObject (BLACK_BRUSH) ;
	wndclass.lpszMenuName  = TEXT("SPEAK_MENU");
	wndclass.lpszClassName = szAppName ;
	
	if ( ! RegisterClass( &wndclass ))
		return( FALSE );
	
	hFind = NULL;	/* Fixed memory leak in Speak.C (Found with Purify)  KSB */
	
	xScreen = GetSystemMetrics( SM_CXSCREEN );
	yScreen = GetSystemMetrics( SM_CYSCREEN );
	
	GetApplicationParameters( &iX, &iY, &iWidth, &iHeight, &iShow, szFile );
	
	hWnd = CreateWindow( szAppName,
					   szAppName,
					   WS_CAPTION | WS_SYSMENU
					   | WS_OVERLAPPEDWINDOW | WS_VISIBLE
					   | WS_MINIMIZEBOX,
					   iX,
					   iY,
					   iWidth,
					   iHeight,
					   NULL, NULL, NULL, NULL );
	
	/* If window could not be created, return "failure" */
	
	if ( ! hWnd )
	{
		//error = GetLastError();
		return( FALSE );
	}
	
	ShowWindow( hWnd, iShow );
	UpdateWindow( hWnd );                /* Sends WM_PAINT message */
	DragAcceptFiles( hWnd, TRUE );       //Accept files dragged from File Manager
	
#if defined ML_DEMO || defined DEMO
	/* KSB  Jan 28, 1996 - Add menu options in demo for selected files */
	main_menu = GetMenu(hWnd);
	sub_menu = GetSubMenu(main_menu, 0);
	if (Hilite || Typing || CPanel) {
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_SEPARATOR;
		menu_item.fState = 0;
		menu_item.wID = 0;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = NULL;
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
		
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_ORDER;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_ORDER;
		menu_item.dwTypeData = gl_orderfile;
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
		
#ifdef DEMO
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_DEMO;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_DEMO;
		menu_item.dwTypeData = gl_demofile;
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
#endif
		
#ifdef ML_DEMO
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_SEPARATOR;
		menu_item.fState = 0;
		menu_item.wID = 0;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = NULL;
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
		
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_DEMO_US;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_DEMO_US;
		menu_item.dwTypeData = gl_demofile_us;
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
		
		/* GL 10/02/1997 add UK english support */
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_DEMO_UK;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_DEMO_UK;
		menu_item.dwTypeData = gl_demofile_uk;
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
		
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_DEMO_GR;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_DEMO_GR;
		menu_item.dwTypeData = gl_demofile_gr;
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
		
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_DEMO_SP;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_DEMO_SP;
		menu_item.dwTypeData = gl_demofile_sp;
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
		
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_DEMO_LA;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_DEMO_LA;
		menu_item.dwTypeData = gl_demofile_la;
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
		
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_DEMO_FR;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_DEMO_FR;
		menu_item.dwTypeData = gl_demofile_fr;
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
		
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_SEPARATOR;
		menu_item.fState = 0;
		menu_item.wID = 0;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = NULL;
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
#endif
		
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_COMMAND;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_COMMAND;
		menu_item.dwTypeData = gl_commandfile;
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
		
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_EMAIL;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_EMAIL;
		menu_item.dwTypeData = gl_emailfile;
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, IDM_EXIT, 1, &menu_item);
	}
#endif
	
	/* KSB  Dec 17, 1996 - Add separator if more options to be added */
	main_menu = GetMenu(hWnd);
	sub_menu = GetSubMenu(main_menu, 1);
	if (Hilite || Typing || CPanel) {
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
	/* KSB  Dec 17, 1996 - Add highlight menu option IF highlighting is available */
	if (Hilite) {
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_HIGHLIGHT;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_HIGHLIGHT;
		menu_item.dwTypeData = TEXT("&Highlighting");
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, 99, 1, &menu_item);
	}
	/* KSB  Dec 17, 1996 - Add typing demo menu option IF typing demo is available */
	if (Typing) {
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = IDM_TYPING;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = IDM_TYPING;
		menu_item.dwTypeData = TEXT("&Typing Demo");
		menu_item.cch = strlen(menu_item.dwTypeData);
		InsertMenuItem(sub_menu, 99, 1, &menu_item);
	}
	/* KSB  Dec 16, 1996 - Add Control Panel menu option IF the CPanel is available */
	if (CPanel) {
		menu_item.cbSize = sizeof(MENUITEMINFO);
		menu_item.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
		menu_item.fType = MFT_STRING;
		menu_item.fState = 0;
		menu_item.wID = ID_CPANEL;
		menu_item.hSubMenu = NULL;
		menu_item.hbmpChecked = NULL;
		menu_item.hbmpUnchecked = NULL;
		menu_item.dwItemData = ID_CPANEL;
		menu_item.dwTypeData = TEXT("&Control Panel");
		menu_item.cch = strlen(menu_item.dwTypeData);
		
		main_menu = GetMenu(hWnd);
		sub_menu = GetSubMenu(main_menu, 1);
		InsertMenuItem(sub_menu, 99, 1, &menu_item);
	}
	
	// Check for command line invocation with filename and dictionary name
	if (strlen(dictname)) {
		TextToSpeechUnloadUserDictionary(phTTS[tts_select]);
		mmStatus = TextToSpeechLoadUserDictionary(phTTS[tts_select], dictname);
		if ( mmStatus )
		{
			if (mmStatus == MMSYSERR_ERROR)
				MessageBox( hWnd, TEXT("Illegal dictionary format"), TEXT("Load User Dictionary"),
				MB_OK | MB_ICONSTOP );
			else
				MessageBox( hWnd, TEXT("Error in TTS Load Dictionary"), TEXT("ERROR"),
				MB_OK | MB_ICONSTOP );
		}
	}
	
	if (strlen(filename)) {
		if (!MyReadFile(hWnd,filename))
		{
			SaveSaveAs = FALSE;
			strcpy(szFile, filename);
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			wsprintf(title, TEXT("%s - %s"), szAppName, filename);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			//SendMessage(hSpeakText,WM_SETTEXT,0,(LPARAM)pFileData);
			//SendMessage(hSpeakText,WM_SETTEXT, 0, (LPARAM)FileBuf);
			InvalidateRect( hSpeakText, NULL, TRUE );
			DrawMenuBar( hWnd );
			SpeakText( hWnd );
		}
	}
	
	
	/* Enter message loop */
	while (GetMessage (&msg, NULL, 0, 0))
	{
		if( !IsDialogMessage( hFind, &msg ) )
		{
			TranslateMessage (&msg) ;
			DispatchMessage (&msg) ;
		}
	}
	
	return msg.wParam ;
}

/* *******************************************************************
 *      Function Name: WndProc()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *					UINT uiMessage
 *					WPARAM wParam
 *					LPARAM lParam
 *
 *      Return Value: LONG
 *
 *      Comments:
 *
 * *************************************************************** */
LONG APIENTRY WndProc(HWND hWnd, UINT uiMessage, WPARAM wParam, LPARAM lParam)
{
	MMRESULT mmStatus;
	PAINTSTRUCT ps;
	static HMENU hPauseMenu;
	static char szPause[] = {"&Pause"};
	static char szResume[] = {"&Resume"};
	static char * szMenu;
	static char * szCurrentSpeaker = " [:nh]";
	
	RECT  lprc;
	INT x,y;
	UINT uiStatus;
	
	static FARPROC  oldEditProc;
	static HBRUSH hOldBrush, hBrush;
	static char szVolume[5];
	static char szRate[5];
	static short wSpos = SPEAK_RATE;
	static DWORD VolumeLevel;
	LPMINMAXINFO  lpmmiSize;
	DWORD dwStart, dwEnd, dwOffset;
	LONG lSelect;
	DWORD dwTextLen;
	LPSTR lpEditText, lpSelBuf;
	static UINT uiID_Error_Msg;
	static UINT uiMessage_Find_Replace;
	static  LPFINDREPLACE lpfrText;
	CHAR szError[132];
	int iBitsPixel,iPlanes = 0;
	char title[256];
	MARK_POS *next;
	char srate[20];
	HMENU main_menu, sub_menu;
	MENUITEMINFO menu_info;
	
	switch ( uiMessage )
	{
		case WM_DESTROY:
		SetApplicationParameters( hWnd, szFile );
		
		// using ml_mode which is set in WM_CREATE -- NCS 16sept97
		/* GL 10/02/1997 add UK english support */
		if (ml_mode) {
			/* BATS #599 */
			mmStatus = TextToSpeechShutdown( phTTS[tts_select] );
		} else {
			mmStatus = TextToSpeechShutdown(phTTS[0]);
		}
		
		/* Free mark_pos buffer */
		next = mark_pos;
		while (next != NULL) {
			mark_pos = next->next_mark;
			free(next);
			next = mark_pos;
		}
		
		PostQuitMessage(0);
		break ;
		
	case WM_CLOSE:
		
		if ( SendMessage( hSpeakText, EM_GETMODIFY, 0L, 0L ))
		{
			if ( AskToSave( hWnd ))        // returns FALSE is yes or no TRUE if CANCEL
			{
				break ;
			}                            // Cancel pressed
			
			DestroyWindow( hWnd );
			break;
		}
		
		DestroyWindow( hWnd );
		break ;
		
	case WM_CREATE:
		//MVP:06/20/96 Gray out Find Menu Item for W95.
		
		uiID_Error_Msg = RegisterWindowMessage(TEXT("DECtalkErrorMessage"));
		uiMessage_Find_Replace = RegisterWindowMessage(TEXT("commdlg_FindReplace"));
		GetClientRect(hWnd, &lprc);
		hSpeakText = CreateWindow(TEXT("EDIT"), TEXT(""),
			WS_CHILD | WS_VISIBLE | WS_HSCROLL | WS_VSCROLL | WS_BORDER | ES_LEFT |
			ES_MULTILINE | ES_AUTOHSCROLL | ES_AUTOVSCROLL | ES_NOHIDESEL,
			border * 2, border * 2 + fbHeight,
			etWidth,
			etHeight,
			hWnd, NULL, NULL, NULL) ;
		SendMessage(hSpeakText, EM_LIMITTEXT, (WPARAM) 0, (LPARAM) 0);
		
		DECtalkSpeakWin = hSpeakText;
		
		hRate = CreateWindow(TEXT("SCROLLBAR"), TEXT(""),
			WS_CHILD | WS_VISIBLE | SBS_HORZ,
			border + slWidth,
			lprc.bottom - (2 * border + sbHeight + 10),
			sbWidth, sbHeight ,
			hWnd,  NULL, NULL, NULL);
		
		// tek 02nov98 use the correct values for this DLL
		SetScrollRange (hRate,SB_CTL,rateMin,rateMax, TRUE); //Set Rate Range 75 - 600 WPM
		SetScrollPos(hRate, SB_CTL, SPEAK_RATE , TRUE)  ;  //Set default rate
		current_rate = SPEAK_RATE;
		
		wsprintf(srate, TEXT("%d WPM"), SPEAK_RATE);
		hstRate = CreateWindow(TEXT("STATIC"), srate,
			WS_CHILD | WS_VISIBLE | SS_CENTER | WS_BORDER,
			slWidth + border + sbWidth,
			lprc.bottom - (2 * border + sbHeight + 10) ,
			stWidth ,sbHeight ,
			hWnd,  NULL, NULL, NULL);
		
		
		
		hstRateLabel = CreateWindow(TEXT("STATIC"), TEXT("Speaking Rate"),
			WS_CHILD | WS_VISIBLE | SS_CENTER,
			lprc.left + border ,
			lprc.bottom - (2 * border + sbHeight + 10),
			slWidth ,slHeight ,
			hWnd,  NULL, NULL, NULL);
		
		for (x=9; x<12; x++){
			odButton[x].lpbfNormalDib   = findHdib(2000 + x);
			odButton[x].lpbfSelectedDib = findHdib(2100 + x);
			odButton[x].hWnd = CreateWindow(TEXT("BUTTON"), TEXT(""),
				WS_CHILD | WS_VISIBLE | BS_OWNERDRAW,
				(488 + ((x-9) * pbWidth)),
				lprc.bottom -( pbHeight + border * 2),
				pbWidth ,pbHeight ,
				hWnd,  NULL, NULL, NULL);
		}
		
#ifdef _DEBUG
		/* Reload button */
		odButton[12].lpbfNormalDib   = findHdib(2000 + x);
		odButton[12].lpbfSelectedDib = findHdib(2100 + x);
		odButton[12].hWnd = CreateWindow(TEXT("BUTTON"), TEXT(""),
			WS_CHILD | WS_VISIBLE | BS_OWNERDRAW,
			448, lprc.bottom -( pbHeight + border * 2),
			pbWidth ,pbHeight ,
			hWnd,  NULL, NULL, NULL);
#endif
		//
		myHdc = GetDC(hWnd);
		iBitsPixel = GetDeviceCaps(myHdc, BITSPIXEL);
		iPlanes = GetDeviceCaps(myHdc, PLANES);
		//sprintf (szError, "Number of planes= %d n %d bits per pixel " ,iPlanes,  iBitsPixel);
		//MessageBox(hWnd, szError, "Color info", MB_OK);
		if ((iPlanes * iBitsPixel) < 8 ) dwUse16ColorBitmaps = 1000 ;
		//ReleaseDC(hWnd, myHdc);
		
		
		//
		
		for (x=0; x<3; x++) {
			for (y=0; y<3; y++){
				odButton[y*3+x].lpbfNormalDib   = findHdib(2000 + dwUse16ColorBitmaps + y*3+x);
				odButton[y*3+x].lpbfSelectedDib = findHdib(2100 + dwUse16ColorBitmaps + y*3+x);
				
				// extract voice selection string from resource
				uiStatus = LoadStringA(NULL,1000+y*3+x,odButton[y*3+x].szSelVoice,80);
				
				// extract voice test message from resource
				uiStatus = LoadStringA(NULL,1100+y*3+x,odButton[y*3+x].szTest,80);
				
				// create the owner draw buttons for the odButtons
				odButton[y*3+x].hWnd = CreateWindow(TEXT("BUTTON"), TEXT(" "),
					WS_CHILD | WS_VISIBLE | BS_OWNERDRAW  ,
					(y*3+x) * fbWidth + 10 ,  border, //x * fbWidth + border , y * fbHeight + border,
					fbWidth ,fbHeight ,
					hWnd,  NULL, NULL, NULL);
				
				// subclass buttons
				#ifdef _WIN64
				opVoiceControls = (WNDPROC)GetWindowLongPtr (odButton[y*3+x].hWnd, GWLP_WNDPROC);
				SetWindowLongPtr(odButton[y*3+x].hWnd, GWLP_WNDPROC, npVoiceControls);
				#else
				opVoiceControls = (WNDPROC)GetWindowLong(odButton[y*3+x].hWnd, GWL_WNDPROC);
				SetWindowLong (odButton[y*3+x].hWnd, GWL_WNDPROC, (LONG)npVoiceControls);
				#endif
			}
			#ifdef _WIN64
			opVoiceControls = (WNDPROC)GetWindowLongPtr (odButton[x + PLAY].hWnd, GWLP_WNDPROC);
			SetWindowLongPtr(odButton[x + PLAY].hWnd, GWLP_WNDPROC, npVoiceControls);
			#else
			opVoiceControls = (WNDPROC)GetWindowLong(odButton[x + PLAY].hWnd, GWL_WNDPROC);
			SetWindowLong (odButton[x + PLAY].hWnd, GWL_WNDPROC, (LONG)npVoiceControls);
			#endif
		}
#ifdef _DEBUG
		#ifdef _WIN64
		opVoiceControls = (WNDPROC)GetWindowLongPtr (odButton[12].hWnd, GWLP_WNDPROC);
		SetWindowLongPtr(odButton[12].hWnd, GWLP_WNDPROC, npVoiceControls);
		#else
		opVoiceControls = (WNDPROC)GetWindowLong(odButton[12].hWnd, GWL_WNDPROC);
		SetWindowLong (odButton[12].hWnd, GWL_WNDPROC, (LONG)npVoiceControls);
		#endif
#endif
		
		usePalette(hWnd);
		
		main_menu = GetMenu(hWnd);
		sub_menu = GetSubMenu(main_menu, 0);
		
		us_on = FALSE;
		uk_on = FALSE;
		sp_on = FALSE;
		la_on = FALSE;
		gr_on = FALSE;
		fr_on=FALSE;
		it_on=FALSE;
		ml_mode = FALSE;
		
		// #ifdef ML // we are now using ML stuff as standard setting - NCS 16sept97
		if(TextToSpeechEnumLangs(&languageINFO) == 0) 
		{
			MessageBox(NULL, TEXT("Unable to allocate Memory"), TEXT("Error"), MB_OK);
			exit(-1);
		}
		
		if (languageINFO->MultiLang == FALSE) {
			// we are in single language mode
			mmStatus = TextToSpeechStartupEx(&phTTS[0], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
			//				mmStatus = TextToSpeechStartup(hWnd,&phTTS[0], WAVE_MAPPER, REPORT_OPEN_ERROR);
			/* GL 10/02/1997 add UK english support */
			if (!strncmp(languageINFO->Entries[0].lang_code, "US", 2))
			{
				us_on = TRUE;
				current_language=IDM_ENGLISH;
			}
			else if (!strncmp(languageINFO->Entries[0].lang_code, "UK", 2))
			{
				uk_on = TRUE;
				current_language=IDM_ENGLISH_UK;
			}
			else if (!strncmp(languageINFO->Entries[0].lang_code, "SP", 2))
			{
				sp_on = TRUE;
				current_language=IDM_SPANISH;
			}
			else if (!strncmp(languageINFO->Entries[0].lang_code, "GR", 2))
			{
				gr_on = TRUE;
				current_language=IDM_GERMAN;
			}
			else if (!strncmp(languageINFO->Entries[0].lang_code, "LA", 2))
			{
				la_on = TRUE;
				current_language=IDM_LATIN;
			}
			else if (!strncmp(languageINFO->Entries[0].lang_code, "FR", 2))
			{
				fr_on = TRUE;
				current_language=IDM_FRENCH;
			}
			else if (!strncmp(languageINFO->Entries[0].lang_code, "IT", 2))
			{
				it_on = TRUE;
				current_language=IDM_ITALIAN;
			}
			else {
				MessageBox(NULL, TEXT("UNIDENTIFIED DLL\nCan not continue with this program"), TEXT("Error"), MB_OK);
				exit(1);
			}
			menu_info.cbSize=sizeof(menu_info);
			menu_info.fMask=MIIM_STATE;
			menu_info.fState=MFS_CHECKED;
			SetMenuItemInfo(GetMenu(hWnd),current_language,FALSE,&menu_info);
			
			
		} else {	// if (strncmp(versionINFO->Language, "ML", 2)
			ml_mode = TRUE;
			
			TTS_us = TextToSpeechStartLang("US");
			if ((TTS_us & TTS_LANG_ERROR) == 0) {
				us_on = TRUE;
				EnableMenuItem(main_menu,IDM_ENGLISH,MF_BYCOMMAND | MF_ENABLED);
#ifdef ML_DEMO
				EnableMenuItem(sub_menu, 6 ,MF_BYPOSITION | MF_ENABLED);
#endif
			}
			/* GL 10/02/1997 add UK english support */
			TTS_uk = TextToSpeechStartLang("UK");
			if ((TTS_uk & TTS_LANG_ERROR) == 0) {
				uk_on = TRUE;
				EnableMenuItem(main_menu,IDM_ENGLISH_UK,MF_BYCOMMAND | MF_ENABLED);
#ifdef ML_DEMO
				EnableMenuItem(sub_menu, 18 ,MF_BYPOSITION | MF_ENABLED);
#endif
			}
			TTS_gr = TextToSpeechStartLang("GR");
			if ((TTS_gr & TTS_LANG_ERROR) == 0) {
				gr_on = TRUE;
				EnableMenuItem(main_menu,IDM_GERMAN,MF_BYCOMMAND | MF_ENABLED);
#ifdef ML_DEMO
				EnableMenuItem(sub_menu, 15 ,MF_BYPOSITION | MF_ENABLED);
#endif
			}
			TTS_sp = TextToSpeechStartLang("SP");
			if ((TTS_sp & TTS_LANG_ERROR) == 0) {
				sp_on = TRUE;
				EnableMenuItem(main_menu,IDM_SPANISH,MF_BYCOMMAND | MF_ENABLED);
#ifdef ML_DEMO
				EnableMenuItem(sub_menu, 16 ,MF_BYPOSITION | MF_ENABLED);
#endif
			}
			TTS_la = TextToSpeechStartLang("LA");
			if ((TTS_la & TTS_LANG_ERROR) == 0) {
				la_on = TRUE;
				EnableMenuItem(main_menu,IDM_LATIN,MF_BYCOMMAND | MF_ENABLED);
#ifdef ML_DEMO
				EnableMenuItem(sub_menu, 17 ,MF_BYPOSITION | MF_ENABLED);
#endif
			}
			TTS_fr = TextToSpeechStartLang("FR");
			if ((TTS_fr & TTS_LANG_ERROR) == 0) {
				fr_on=TRUE;
				EnableMenuItem(main_menu,IDM_FRENCH,MF_BYCOMMAND | MF_ENABLED);
#ifdef ML_DEMO
				EnableMenuItem(sub_menu, 18 ,MF_BYPOSITION | MF_ENABLED);
#endif
			}
			TTS_it = TextToSpeechStartLang("IT");
			if ((TTS_it & TTS_LANG_ERROR) == 0) {
				it_on=TRUE;
				EnableMenuItem(main_menu,IDM_ITALIAN,MF_BYCOMMAND | MF_ENABLED);
#ifdef ML_DEMO
				EnableMenuItem(sub_menu, 19 ,MF_BYPOSITION | MF_ENABLED);
#endif
			}
		} // if (strncmp(versionINFO->Language, "ML", 2)
		// #endif	// ML	// we are now using ML stuff as standard setting - NCS 16sept97
		
		/* GL 10/02/1997 add UK english support */
		if (us_on == FALSE && uk_on == FALSE && sp_on == FALSE && la_on == FALSE && gr_on == FALSE && fr_on == FALSE && it_on==FALSE) {
			MessageBox(NULL, TEXT("No languages available"), TEXT("Error"), MB_OK);
			exit(1);
		}
		if (la_on) {
			tts_select = TTS_la;
			for (x = 0; x < 9; x++) {
				LoadStringA(NULL,1027+x,odButton[x].szTest,80);
			}
		}
		if (sp_on) {
			tts_select = TTS_sp;
			for (x = 0; x < 9; x++) {
				LoadStringA(NULL,1018+x,odButton[x].szTest,80);
			}
		}
		if (gr_on) {
			tts_select = TTS_gr;
			for (x = 0; x < 9; x++) {
				LoadStringA(NULL,1036+x,odButton[x].szTest,80);
			}
		}
		if (fr_on) {
			tts_select = TTS_fr;
			for (x = 0; x < 9; x++) {
				LoadStringA(NULL,1045+x,odButton[x].szTest,80);
			}
		}
		if (it_on) {
			tts_select = TTS_it;
			for (x = 0; x < 9; x++) {
				LoadStringA(NULL,1054+x,odButton[x].szTest,80);
			}
		}
		/* GL 10/02/1997 add UK english support */
		if (uk_on) {
			tts_select = TTS_uk;
			for (x = 0; x < 9; x++) {
				LoadStringA(NULL,1009+x,odButton[x].szTest,80);
			}
		}
		if (us_on) {
			tts_select = TTS_us;
			for (x = 0; x < 9; x++) {
				LoadStringA(NULL,1009+x,odButton[x].szTest,80);
			}
		}
		
		if (strcmp("US",languageINFO->Entries[0].lang_code)==0)
		{
			tts_select=TTS_us;
			current_language=IDM_ENGLISH;
		}
		else if (strcmp("UK",languageINFO->Entries[0].lang_code)==0)
		{
			tts_select=TTS_uk;
			current_language=IDM_ENGLISH_UK;
		}
		else if (strcmp("SP",languageINFO->Entries[0].lang_code)==0)
		{
			tts_select=TTS_sp;
			current_language=IDM_SPANISH;
		}
		else if (strcmp("LA",languageINFO->Entries[0].lang_code)==0)
		{
			tts_select=TTS_la;
			current_language=IDM_LATIN;
		}
		else if (strcmp("GR",languageINFO->Entries[0].lang_code)==0)
		{
			tts_select=TTS_gr;
			current_language=IDM_GERMAN;
		}
		else if (strcmp("FR",languageINFO->Entries[0].lang_code)==0)
		{
			tts_select=TTS_fr;
			current_language=IDM_FRENCH;
		}
		else if (strcmp("IT",languageINFO->Entries[0].lang_code)==0)
		{
			tts_select=TTS_it;
			current_language=IDM_ITALIAN;
		}
		if (ml_mode)
		{
			TextToSpeechSelectLang(NULL,tts_select);
			mmStatus = TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
		}
		
		
		menu_info.cbSize=sizeof(menu_info);
		menu_info.fMask=MIIM_STATE;
		menu_info.fState=MFS_CHECKED;
		SetMenuItemInfo(GetMenu(hWnd),current_language,FALSE,&menu_info);
		
		
		if ((mmStatus == MMSYSERR_NODRIVER) || (mmStatus == WAVERR_BADFORMAT))
		{
			MessageBox(hWnd, TEXT("No compatible wave device present \n You can continue but only to write wave files"), TEXT("Warning"), MB_OK);
			mmStatus = TextToSpeechStartup(hWnd, &phTTS[tts_select], 0, DO_NOT_USE_AUDIO_DEVICE );
			if ( mmStatus == MMSYSERR_ERROR)
			{
#ifdef DEMO
				MessageBox(hWnd, TEXT("Can't find DECtalk Dictionary \n dectalk.dic, Shutting down!"), TEXT("DTDEMO ERROR"), MB_OK);
#else		
				MessageBox(hWnd, TEXT("Can't find DECtalk Dictionary \n dectalk.dic, Shutting down!"), TEXT("SPEAK ERROR"), MB_OK);
#endif	
				return( -1 );
			}
			else if ( mmStatus != MMSYSERR_NOERROR)
			{
#ifdef DEMO
				MessageBox(hWnd, TEXT("Can't find DECtalk Dictionary \n dectalk.dic, Shutting down!"), TEXT("DTDEMO ERROR"), MB_OK);
#else		
				MessageBox(hWnd, TEXT("Can't find DECtalk Dictionary \n dectalk.dic, Shutting down!"), TEXT("SPEAK ERROR"), MB_OK);
#endif	
				return( -1 );
			}
			
			if (mmStatus)
			{
				sprintf( szError, "Error = %d", mmStatus );
				
				MessageBox(hWnd, szError, TEXT("TTS startup with no audio device"),
					MB_OK | MB_ICONSTOP );
			}
		}
		
		// tek 23aug96 punt on any error..
		if (mmStatus && mmStatus != 11)		// KSB - 11 is bad dictionary, message displayed already in lsw_main.c
		{
			sprintf( szError,
				"TTS startup failed\n\nError = %d\n\nExiting out of application",
				mmStatus );
			// ncs 06oct97 - error out of application if TextToSpeechStartUp Fails
			// (actually changing the message of the error messageBox)
			MessageBox(NULL, szError, TEXT("Speak cannot be started."),
				MB_OK | MB_ICONSTOP);
			
			
			DestroyWindow(hWnd);
			return( -1 );
		} 
		else if (mmStatus == 11) {
			MessageBox(NULL, TEXT("Dictionary not found"), TEXT("TTS startup failed"),
				MB_OK | MB_ICONSTOP);
			DestroyWindow(hWnd);
			return( -1 );
		}
		else
			return FALSE;
		
		case WM_SETFOCUS :
			SetFocus (hSpeakText) ;
			return FALSE ;
			
		case WM_SIZE :  //Reposition all child windows when moved or resized
			
			
			GetClientRect(hWnd, &lprc);
			MoveWindow (hSpeakText, border * 2, border * 2 + fbHeight,  lprc.right - 8,
				lprc.bottom - (112), TRUE) ;
			
			
			MoveWindow (hRate,border + slWidth,
				lprc.bottom - (2 * border + sbHeight + 10),
				sbWidth, sbHeight , TRUE) ;
			MoveWindow (hstRateLabel, border, lprc.bottom - (2 * border + sbHeight + 10),slWidth ,slHeight, TRUE) ;
			MoveWindow (hstRate,  slWidth + border + sbWidth,
				lprc.bottom - (2 * border + sbHeight + 10) ,
				stWidth ,sbHeight , TRUE) ;
			
			for (x=9; x<12; x++)
			{
				MoveWindow( odButton[x].hWnd,  (488 + ((x-9) * pbWidth)),
					lprc.bottom -( pbHeight + border * 2),
					pbWidth ,pbHeight , TRUE );
			}
#ifdef _DEBUG
			MoveWindow( odButton[x].hWnd,  448,
				lprc.bottom -( pbHeight + border * 2),
				pbWidth ,pbHeight , TRUE );
#endif
			
			return FALSE ;
			
		case WM_DROPFILES:
			
			// If edit control has been modified ask to save file .
			if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
				
			{
				if (AskToSave(hWnd))        // returns FALSE is yes or no TRUE if CANCEL
					
					break ;                   // Cancel pressed
				// Yes or No pressed
			}
			DragQueryFile ((HANDLE)wParam, 0, szFile, sizeof(szFile));
			mmStatus = TextToSpeechReset(phTTS[tts_select], FALSE);
			if ( mmStatus )
				
				MessageBox( hWnd,
				TEXT("Error in TTS Reset") ,
				TEXT("ERROR"),
				MB_OK | MB_ICONSTOP );
				/*bPaused = FALSE;
				Infostruct.hwndItem = odButton[PAUSE].hWnd;
				Infostruct.hDC = GetDC(odButton[PAUSE].hWnd);
				DrawControl(odButton[PAUSE].hWnd, &Infostruct);
			ReleaseDC(odButton[PAUSE].hWnd, Infostruct.hDC);*/
			//SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");
			
			if ( ! MyReadFile( hWnd, szFile ))
			{
				DrawMenuBar( hWnd);
				// reset the title in the title bar to reflect the
				// new open file
				wsprintf(title, TEXT("%s - %s"), szAppName, szFile);
				strcpy(szFileSave, szFile);
				SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
				InvalidateRect( hSpeakText, NULL, TRUE );
				DrawMenuBar( hWnd );
				DragFinish ((HANDLE)wParam);
				SpeakText ( hWnd );
				return FALSE;
			}
			else
				break;
			
		case WM_DRAWITEM:
			
		case WM_MEASUREITEM:
			DrawControl(hWnd, (LPDRAWITEMSTRUCT)lParam); // Owner draw stuff
			break;
			
		case WM_COMMAND:
			menuCommand(hWnd, wParam, lParam);
			break;
			
		case WM_QUERYNEWPALETTE:
			if ((HWND) wParam != hWnd)
				
			{
				//               myHdc = GetDC(hWnd);
				SelectPalette(myHdc, hPalLogical, FALSE);
				if (RealizePalette(myHdc))
					InvalidateRect(hWnd, NULL, FALSE);
			}
			
			return 0;
			
			
		case WM_PALETTECHANGED:
			if ((HWND) wParam != hWnd)
			{
				//               myHdc = GetDC(hWnd);
				SelectPalette(myHdc, hPalLogical, FALSE);
				
				if (RealizePalette(myHdc))
					UpdateColors(myHdc);
				
			}
			return 0;
			
			
		case WM_PAINT:
			BeginPaint(hWnd, &ps);
			/*  lpbf = findHdib(2200);
			lpbi = (LPVOID)((CHAR*)lpbf + sizeof(BITMAPFILEHEADER));
			dibBits = (LPVOID)((CHAR*)lpbf + lpbf->bfOffBits);
			
			  // put our DIB on the screen
			  SetDIBitsToDevice(GetDC(hWnd),
			  (INT)lprc.right - (lpbi->biWidth + border),
			  (INT)fbHeight * 3 + border * 2,
			  (DWORD)lpbi->biWidth,
			  (DWORD)lpbi->biHeight,
			  (INT)0,
			  (INT)0,
			  (UINT)0, (UINT)lpbi->biHeight ,
			  (LPVOID)dibBits,
			(LPBITMAPINFO)lpbi, (UINT)DIB_RGB_COLORS);  */
			
			EndPaint(hWnd, &ps);
			break ;
			
		case WM_INITMENUPOPUP: /*Enable Paste menu item if clipboard data available*/
			
			HandleMenuPopup(wParam);
			
			return FALSE;
			
		case WM_GETMINMAXINFO:   //Limit minimum size of window
			
			lpmmiSize = (LPMINMAXINFO) lParam;
			lpmmiSize->ptMinTrackSize.x = (LONG)etWidth + border * 4 + 4 ;
			lpmmiSize->ptMinTrackSize.y = 300L;
			
			return FALSE;
			
		case WM_ERASEBKGND:
			hBrush = GetStockObject(LTGRAY_BRUSH);
			hOldBrush = SelectObject((HDC)wParam, hBrush);
			GetClientRect(hWnd, &lprc);
			FillRect((HDC)wParam, &lprc, hBrush);
			break;
			
		case WM_CTLCOLORSTATIC:
			hBrush = GetStockObject(LTGRAY_BRUSH);
			SetBkColor ((HDC) wParam, RGB ((BYTE)192, (BYTE)192, (BYTE)192));
			return  (LRESULT) hBrush;
			
		case WM_HSCROLL:
			
			if (((HWND)lParam) == hRate)
			{
				wSpos = HandleScrollBar(wParam,wSpos);  // Call Scroll Bar handling routine
				mmStatus = TextToSpeechSetRate(phTTS[tts_select],(UINT)wSpos); // New rate returned in wSpos
				current_rate = wSpos;
				if ( mmStatus )
					
					MessageBox( hWnd,
					TEXT("Error Setting Rate") ,
					TEXT("ERROR"),
					MB_OK | MB_ICONSTOP );
				return FALSE;
			}
			break ;
			/*      This section implements Right Mouse Button click functionality.
			*       This action will cause reading selected text in the Edit
			*       Control
			*   Parent notify message is used to check for the right mouse button being activated.
			*   The selected text is then spoken.
			*/
			
		case WM_PARENTNOTIFY:
			
			if (LOWORD(wParam) == WM_RBUTTONDOWN)
			{
				lSelect = SendMessage (hSpeakText, EM_GETSEL,(WPARAM)&dwStart,(LPARAM)&dwEnd) ;
				
				if (HIWORD (lSelect) == LOWORD (lSelect))
				{
					char WHAT_STRING[10];
					switch (current_language)
					{
					case IDM_SPANISH :
					case IDM_ITALIAN:
					case IDM_LATIN :	strcpy(WHAT_STRING,"qué?"); break;
					case IDM_GERMAN :	strcpy(WHAT_STRING,"wie bitte?"); break;
					case IDM_FRENCH :   strcpy(WHAT_STRING,"ce qui?"); break;
					case IDM_ENGLISH :
					case IDM_ENGLISH_UK :
					default :			strcpy(WHAT_STRING,"what?"); break;
						
					}
					mmStatus = TextToSpeechSpeak(phTTS[tts_select], WHAT_STRING, TTS_FORCE);
					if ( mmStatus )
						MessageBox( hWnd,
						TEXT("Error in TTS Speak") ,
						TEXT("ERROR"),
						MB_OK | MB_ICONSTOP );
					break;
				}
				else
				{
					dwTextLen = SendMessage(hSpeakText, WM_GETTEXTLENGTH, 0, 0);
					lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof(char)) ;
					SendMessage(hSpeakText, WM_GETTEXT, (WPARAM) dwTextLen+1, (LPARAM) lpEditText);
					lpSelBuf = (char *)malloc((1 + dwEnd - dwStart)  * sizeof(char)) ;
					strncpy((char*)lpSelBuf,(char*)&lpEditText[dwStart],(1 + dwEnd - dwStart));
					lpSelBuf[dwEnd - dwStart] = '\0';
					mmStatus = TextToSpeechSpeak(phTTS[tts_select], lpSelBuf, TTS_FORCE);
					if ( mmStatus )
						MessageBox( hWnd,
						TEXT("Error in TTS Speak") ,
						TEXT("ERROR"),
						MB_OK | MB_ICONSTOP );
					free (lpSelBuf);
					free (lpEditText);
				}
			}
			break;
			
			
		default:
			if (uiMessage ==  uiID_Error_Msg )
				
			{
				//TextToSpeechReset(phTTS[tts_select], FALSE);
				switch (wParam)
				{
					
				case ERROR_IN_AUDIO_WRITE:
					MessageBox(hWnd, TEXT("Error in Writing Audio"), TEXT("Async Error"), MB_OK | MB_ICONSTOP);
					break;
					
				case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
					MessageBox(hWnd,
						TEXT("The wave device is in use by another application \n DECtalk will wait until the device is free."),
						TEXT("Warning"), MB_OK | MB_ICONSTOP);
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
					
				case ERROR_OPENING_WAVE_FILE:
					MessageBox(hWnd, TEXT("Error"), TEXT("Error Opening Wave File"), MB_OK | MB_ICONSTOP);
					break;
					
				case ERROR_BAD_WAVE_FILE_FORMAT:
					MessageBox(hWnd, TEXT("Error"), TEXT("Error Bad Wave File Format"), MB_OK | MB_ICONSTOP);
					break;
					
				case ERROR_UNSUPPORTED_WAVE_FILE_FORMAT:
					MessageBox(hWnd, TEXT("Error"), TEXT("Error Unsupported Wave File Format"), MB_OK | MB_ICONSTOP);
					break;
					
				case ERROR_UNSUPPORTED_WAVE_AUDIO_FORMAT:
					MessageBox(hWnd, TEXT("Error Unsupported Wave Audio Format"), TEXT(""), MB_OK | MB_ICONSTOP);
					break;
					
				case ERROR_READING_WAVE_FILE:
					MessageBox(hWnd, TEXT("Error"), TEXT("Error Reading Wave File"), MB_OK | MB_ICONSTOP);
					break;
				}
			}
			else
				//
				// Process "Find-Replace" Messages
				//
				if( uiMessage == uiMessage_Find_Replace )
				{
					lpfrText = ( LPFINDREPLACE ) lParam;
					
					if( lpfrText->Flags & FR_DIALOGTERM )
						hFind = NULL;
					
					dwOffset = HIWORD( SendMessage( hSpeakText, EM_GETSEL, 0, 0L ));
					if( lpfrText->Flags & FR_FINDNEXT )
						if( !FindSearchString( hSpeakText, &dwOffset, lpfrText ))
						{
							wsprintf(szError, TEXT("Search string \"%s\" was not found."), lpfrText->lpstrFindWhat);
							MessageBox(hWnd, szError, TEXT("Find Error"), MB_OK | MB_ICONEXCLAMATION);
						}
						
						return( 0 );
				}
				
				return (DefWindowProc (hWnd, uiMessage, wParam, lParam)) ;
				
	}
	return 0L ;
	
}

/* *******************************************************************
 *      Function Name: findHdib()
 *
 *      Description:
 *
 *      Arguments:	INT id
 *		
 *      Return Value: LPVOID
 *
 *      Comments:
 *
 * *****************************************************************/
LPVOID findHdib(INT id)
{	
	HRSRC hDibRes, hDibResInfo;
	
	// find our DIB in the resource
	hDibResInfo = FindResource(NULL, MAKEINTRESOURCE(id), TEXT("DIB"));
	if (hDibResInfo == NULL)
		return (LPVOID)ErrMsg(TEXT("Line %d Error = %d\nFindResource"), __LINE__ - 2, GetLastError());
	
	// get a handle to the DIB
	hDibRes = LoadResource(NULL, hDibResInfo);
	if (hDibRes == NULL)
		return (LPVOID)ErrMsg(TEXT("Line %d Error = %d\nLoadResource"), __LINE__, GetLastError());
	return (LockResource(hDibRes));
}

//#pragma page
/* *******************************************************************
 *      Function Name: menuCommand()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *					WPARAM wParam
 *					LPARAM lParam
 *
 *      Return Value: BOOL
 *
 *      Comments:
 *
 * *****************************************************************/
BOOL menuCommand(HWND hWnd, WPARAM wParam, LPARAM lParam)
{
	static char szTextWindow[8192];
	char title[512];
	
	static HMENU hPauseMenu;
	static char szPause[] = {"&Pause"};
	static char szResume[] = {"&Resume"};
	static char * szMenu;
	static char * szCurrentSpeaker = " [:nh]";
	INT i, x;
	RECT lprc;
	MMRESULT mmStatus;
	CHAR szError[132];
	LPCTSTR lpszHelpFile = TEXT(DTALK_HELP_FILE_NAME);
	LPCTSTR lpszHelpTopic = TEXT("Speak applet, overview");
	HCURSOR hCursor ;
	DWORD dwStart, dwEnd, dwTextLen;
	LPSTR lpEditText;
	LONG lSelect;
	MENUITEMINFO menuinfo;
	HMENU hmenu;
	MENUITEMINFO menu_info;
	
	switch (LOWORD(wParam)) {
		
#if defined ML_DEMO || defined DEMO // START DEMO STUFF
		
	case IDM_ORDER:
		// If edit control has been modified ask to save file .
		if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
		{
			if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
				break;					// Cancel pressed
		}								// Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );
		if (!MyReadFile( hWnd, gl_orderfile ))
		{
			strcpy(szFile, gl_orderfile);
			strcpy( szFileTitle, szFileTitleSave );
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			sprintf(title, "%s - %s",szAppName, szFile);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			InvalidateRect( hWnd, NULL, TRUE );
			TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
		}
		break;
		
#ifdef DEMO
	case IDM_DEMO:
		// If edit control has been modified ask to save file .
		if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
		{
			if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
				break;					// Cancel pressed
		}								// Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );
		if (!MyReadFile( hWnd, gl_demofile ))
		{
			strcpy(szFile, gl_demofile);
			strcpy( szFileTitle, szFileTitleSave );
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			sprintf(title, "%s - %s",szAppName, szFile);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			InvalidateRect( hWnd, NULL, TRUE );
			TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
		}
		break;
#else
	case IDM_DEMO_US:
		// If edit control has been modified ask to save file .
		if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
		{
			if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
				break;					// Cancel pressed
		}								// Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );
		if (!MyReadFile( hWnd, gl_demofile_us ))
		{
			strcpy(szFile, gl_demofile_us);
			strcpy( szFileTitle, szFileTitleSave );
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			sprintf(title, "%s - %s",szAppName, szFile);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			InvalidateRect( hWnd, NULL, TRUE );
			TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
		}
		break;
		
		/* GL 10/02/1997 add UK english support */
	case IDM_DEMO_UK:
		// If edit control has been modified ask to save file .
		if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
		{
			if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
				break;					// Cancel pressed
		}								// Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );
		if (!MyReadFile( hWnd, gl_demofile_uk ))
		{
			strcpy(szFile, gl_demofile_uk);
			strcpy( szFileTitle, szFileTitleSave );
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			sprintf(title, "%s - %s",szAppName, szFile);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			InvalidateRect( hWnd, NULL, TRUE );
			TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
		}
		break;
		
	case IDM_DEMO_GR:
		// If edit control has been modified ask to save file .
		if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
		{
			if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
				break;					// Cancel pressed
		}								// Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );
		if (!MyReadFile( hWnd, gl_demofile_gr ))
		{
			strcpy(szFile, gl_demofile_gr);
			strcpy( szFileTitle, szFileTitleSave );
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			sprintf(title, "%s - %s",szAppName, szFile);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			InvalidateRect( hWnd, NULL, TRUE );
			TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
		}
		break;
		
	case IDM_DEMO_SP:
		// If edit control has been modified ask to save file .
		if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
		{
			if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
				break;					// Cancel pressed
		}								// Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );
		if (!MyReadFile( hWnd, gl_demofile_sp ))
		{
			strcpy(szFile, gl_demofile_sp);
			strcpy( szFileTitle, szFileTitleSave );
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			sprintf(title, "%s - %s",szAppName, szFile);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			InvalidateRect( hWnd, NULL, TRUE );
			TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
		}
		break;
		
	case IDM_DEMO_LA:
		// If edit control has been modified ask to save file .
		if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
		{
			if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
				break;					// Cancel pressed
		}								// Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );
		if (!MyReadFile( hWnd, gl_demofile_la ))
		{
			strcpy(szFile, gl_demofile_la);
			strcpy( szFileTitle, szFileTitleSave );
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			sprintf(title, "%s - %s",szAppName, szFile);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			InvalidateRect( hWnd, NULL, TRUE );
			TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
		}
		break;
	case IDM_DEMO_FR:
		// If edit control has been modified ask to save file .
		if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
		{
			if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
				break;					// Cancel pressed
		}								// Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );
		if (!MyReadFile( hWnd, gl_demofile_fr ))
		{
			strcpy(szFile, gl_demofile_fr);
			strcpy( szFileTitle, szFileTitleSave );
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			sprintf(title, "%s - %s",szAppName, szFile);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			InvalidateRect( hWnd, NULL, TRUE );
			TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
		}
		break;
#endif
		
	case IDM_COMMAND:
		// If edit control has been modified ask to save file .
		if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
		{
			if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
				break;					// Cancel pressed
		}								// Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );
		if (!MyReadFile( hWnd, gl_commandfile ))
		{
			strcpy( szFile,gl_commandfile );
			strcpy( szFileTitle, szFileTitleSave );
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			sprintf(title, "%s - %s",szAppName, szFile);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			InvalidateRect( hWnd, NULL, TRUE );
			TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
		}
		break;
		
	case IDM_EMAIL:
		// If edit control has been modified ask to save file .
		if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
		{
			if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
				break;					// Cancel pressed
		}								// Yes or No pressed
		strcpy( szFileSave, szFile );
		strcpy( szFileTitleSave, szFileTitle );
		if (!MyReadFile( hWnd, gl_emailfile ))
		{
			strcpy( szFile,gl_emailfile );
			strcpy( szFileTitle, szFileTitleSave );
			DrawMenuBar( hWnd);
			// reset the title in the title bar to reflect the
			// new open file
			sprintf(title, "%s - %s",szAppName, szFile);
			SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			InvalidateRect( hWnd, NULL, TRUE );
			TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
		}
		break;
		
#endif // END DEMO STUFF
		
#ifdef _DEBUG
	case IDM_RESTART:
		TextToSpeechReset(phTTS[tts_select],TRUE);
		TextToSpeechSync(phTTS[tts_select]);
		TextToSpeechShutdown(phTTS[tts_select]);
		TextToSpeechSelectLang(NULL, tts_select);
		TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
		TextToSpeechSetRate(phTTS[tts_select],(UINT)current_rate);
		break;
#endif
		
	case IDM_HIGHLIGHT:
		highlight = abs(highlight - 1);
		menuinfo.cbSize = sizeof(MENUITEMINFO);
		menuinfo.fMask = MIIM_STATE;
		if (highlight)			menuinfo.fState = MFS_CHECKED;
		else                    menuinfo.fState = 0;
		SetMenuItemInfo(GetMenu(hWnd), IDM_HIGHLIGHT, FALSE, &menuinfo);
		
		break;
		
	case IDM_TYPING:	typing_demo(hInst, hWnd);
		break;
		
		  case IDM_HELP:
			  
			  WinHelp( hWnd,
				  lpszHelpFile,
				  HELP_PARTIALKEY,
				  lpszHelpTopic );
			  
			  
			  //              Changed the help access... 4/18/97 cjl
#if 0
			  WinHelp( hWnd,
				  lpszHelpFile,
				  HELP_CONTEXT,
				  IDH_Speak_Program_Applet_Index );
#endif
			  
			  break;
			  
		  case  IDM_ABOUT:
			  
			  DialogBox( hInst,
				  MAKEINTRESOURCE(DLG_ABOUT),
				  hWnd,
				  (DLGPROC)AboutDlgProc );
			  break;
			  
		  case  IDM_FILE_OPEN:
			  
			  // If edit control has been modified ask to save file .
			  if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
				  
			  {
				  if (AskToSave(hWnd))        // returns FALSE is yes or no TRUE if CANCEL
					  
					  break ;                   // Cancel pressed
				  // Yes or No pressed
			  }
			  
			  strcpy( szFileSave, szFile );
			  strcpy( szFileTitleSave, szFileTitle );
			  
			  if ( MyOpenFile( hWnd, szFileSave, szFileTitleSave ) == TRUE )
			  {
				  strcpy( szFile, szFileSave );
				  strcpy( szFileTitle, szFileTitleSave );
				  DrawMenuBar( hWnd);
				  // reset the title in the title bar to reflect the
				  // new open file
				  SaveSaveAs = FALSE;
				  wsprintf(title, TEXT("%s - %s"), szAppName, szFile);
				  SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
				  InvalidateRect( hWnd, NULL, TRUE );
				  TextToSpeechReset(phTTS[tts_select], FALSE); //Flush out data and reset TTS
			  }
			  break;
			  
			  
		  case IDM_FILE_NEW:
		  case IDM_FILE_CLOSE:
			  // If edit control has been modified ask to save file .
			  if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
			  {
				  if (AskToSave(hWnd))		// returns FALSE is yes or no TRUE if CANCEL
					  break;					// Cancel pressed
			  }								// Yes or No pressed
			  wsprintf(title, TEXT("%s - Untitled"), szAppName);
			  SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)title);
			  SendMessage(hSpeakText, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
			  SendMessage(hSpeakText,WM_CLEAR,0,0L);
			  SendMessage(hSpeakText, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
			  SaveSaveAs = TRUE;
			  return FALSE;
			  
		  case IDM_SAVE:
			  
			  GetWindowText( hWnd, szError, 30) ;
			  if (SaveSaveAs) {
				  if (SaveFileAs ( hWnd) )
				  {
					  strcpy(szFile, OpenFileName.lpstrFile);
					  wsprintf(title, TEXT("%s - %s"), szAppName, OpenFileName.lpstrFile);
					  SetWindowText( hWnd, title );
					  SaveSaveAs = FALSE;
					  DrawMenuBar ( hWnd );
				  }
				  else
					  return FALSE ;
			  }
			  else
			  {
				  MySaveFile(hWnd);			
			  }
			  return FALSE ;
			  
		  case IDM_SAVEAS:
			  
			  if (SaveFileAs ( hWnd) )
			  {
				  strcpy(szFile, OpenFileName.lpstrFile);
				  wsprintf(title, TEXT("%s - %s"), szAppName, OpenFileName.lpstrFile);
				  SetWindowText( hWnd, title );
				  DrawMenuBar ( hWnd );
				  SaveSaveAs = FALSE;
			  }
			  
			  return FALSE ;
			  
			  
		  case IDM_LOAD_DIC:
			  
			  if (GetDictName( hWnd ) == TRUE )
				  
			  {
				  TextToSpeechUnloadUserDictionary(phTTS[tts_select]);
				  mmStatus = TextToSpeechLoadUserDictionary(phTTS[tts_select],OpenDictName.lpstrFile) ;
				  if ( mmStatus )
				  {
					  if (mmStatus == MMSYSERR_ERROR)
						  
						  MessageBox( hWnd,
						  TEXT("Dictionary already loaded or illegal format"),
						  TEXT("Load User Dictionary"),
						  MB_OK | MB_ICONSTOP );
					  
					  else
						  MessageBox( hWnd,
						  szError,
						  TEXT("Load User Dictionary"),
						  MB_OK | MB_ICONSTOP );
				  }
				  break;
			  }
			  
			  else
				  
			  /*MessageBox( hWnd,
			  "Couldn't get Dictionary Name",
			  "Load User Dictionary",
			  MB_OK | MB_ICONSTOP );
			  */
			  break;
			  
		  case IDM_UNLOAD_DIC:
			  
			  mmStatus = TextToSpeechUnloadUserDictionary(phTTS[tts_select]) ;
			  if ( mmStatus )
			  {
				  sprintf( szError, "Error = %d", mmStatus );
				  
				  MessageBox( hWnd,
					  szError,
					  TEXT("Unload User Dictionary"),
					  MB_OK | MB_ICONSTOP );
			  }
			  break;
			  
		  case IDM_WAVE1116:
			  
			  if (SaveWaveName ( hWnd ))
			  {
				  mmStatus = TextToSpeechOpenWaveOutFile(phTTS[tts_select], OpenWaveName.lpstrFile, WAVE_FORMAT_1M16);
				  if ( mmStatus )
				  {
					  sprintf( szError, "Error = %d", mmStatus );
					  
					  MessageBox( hWnd,
						  szError,
						  TEXT("OpenWaveOutFile 16 bit linear"),
						  MB_OK | MB_ICONSTOP );
				  }
				  hCursor = SetCursor (LoadCursor (NULL, IDC_WAIT));
				  ShowCursor (TRUE) ;
				  SpeakText (hWnd);
				  mmStatus = TextToSpeechCloseWaveOutFile(phTTS[tts_select]);
				  if ( mmStatus )
					  
					  MessageBox( hWnd,
					  TEXT("Error in TTS Close Wave File") ,
					  TEXT("ERROR"),
					  MB_OK | MB_ICONSTOP );
				  ShowCursor  (FALSE) ;
				  SetCursor (hCursor) ;
				  if ( mmStatus )
				  {
					  sprintf( szError, "Error = %d", mmStatus );
					  
					  MessageBox( hWnd,
						  szError,
						  TEXT("CloseWaveOutFile"),
						  MB_OK | MB_ICONSTOP );
				  }
			  }
			  
			  
			  break;
			  
		  case IDM_WAVE1108:
			  if (SaveWaveName ( hWnd ) )
			  {
				  mmStatus = TextToSpeechOpenWaveOutFile(phTTS[tts_select], OpenWaveName.lpstrFile, WAVE_FORMAT_1M08);
				  if ( mmStatus )
				  {
					  sprintf( szError, "Error = %d", mmStatus );
					  
					  MessageBox( hWnd,
						  szError,
						  TEXT("OpenWaveOutFile 8 bit Linear"),
						  MB_OK | MB_ICONSTOP );
				  }
				  hCursor = SetCursor (LoadCursor (NULL, IDC_WAIT));
				  ShowCursor (TRUE) ;
				  SpeakText ( hWnd ) ;
				  mmStatus = TextToSpeechCloseWaveOutFile(phTTS[tts_select]);
				  if ( mmStatus )
					  
					  MessageBox( hWnd,
					  TEXT("Error in TTS Close Wave File") ,
					  TEXT("ERROR"),
					  MB_OK | MB_ICONSTOP );
				  
				  ShowCursor  (FALSE) ;
				  SetCursor (hCursor) ;
			  }
			  break;
			  
		  case IDM_MULAW:
			  if (SaveWaveName ( hWnd ) )
			  {
				  mmStatus = TextToSpeechOpenWaveOutFile(phTTS[tts_select], OpenWaveName.lpstrFile, WAVE_FORMAT_08M08);
				  if ( mmStatus )
				  {
					  sprintf( szError, "Error = %d", mmStatus );
					  
					  MessageBox( hWnd,
						  szError,
						  TEXT("OpenWaveOutFile µLaw"),
						  MB_OK | MB_ICONSTOP );
				  }
				  hCursor = SetCursor (LoadCursor (NULL, IDC_WAIT));
				  ShowCursor (TRUE) ;
				  SpeakText ( hWnd ) ;
				  mmStatus = TextToSpeechCloseWaveOutFile(phTTS[tts_select]);
				  if ( mmStatus )
					  
					  MessageBox( hWnd,
					  TEXT("Error in TTS Close Wave File") ,
					  TEXT("ERROR"),
					  MB_OK | MB_ICONSTOP );
				  ShowCursor  (FALSE) ;
				  SetCursor (hCursor) ;
				  
			  }
			  break;
			  
			  //case  IDCANCEL:
			  
			  
		  case  IDM_EXIT:
			  
			  // If edit control has been modified ask to save file .
			  if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))
				  
			  {
				  if (AskToSave(hWnd))        // returns FALSE is yes or no TRUE if CANCEL
					  
					  break ;                   // Cancel pressed
				  
				  DestroyWindow( hWnd );
				  break;
			  }
			  
			  
			  DestroyWindow( hWnd );
			  break ;
			  
		  case ID_EDIT_CUT:
			  
			  SendMessage(hSpeakText,WM_CUT,0,0L);
			  break;
			  
		  case ID_EDIT_COPY:
			  
			  SendMessage(hSpeakText,WM_COPY,0,0L);
			  break;
			  
		  case ID_EDIT_PASTE:
			  
			  SendMessage(hSpeakText,WM_PASTE,0,0L);
			  break;
			  
		  case ID_EDIT_CLEAR:
			  
			  SendMessage(hSpeakText,WM_CLEAR,0,0L);
			  break;
			  
		  case ID_EDIT_SELECT_ALL:
			  SendMessage(hSpeakText, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
			  SetFocus(hSpeakText);
			  //InvalidateRect( hSpeakText, NULL, TRUE );
			  //UpdateWindow(hSpeakText);
			  
			  break;
			  
		  case ID_EDIT_UNDO:
			  
			  SendMessage(hSpeakText, EM_UNDO, 0L, 0L);
			  break;
			  
		  case ID_FIND:
			  lSelect = SendMessage( hSpeakText, EM_GETSEL, (WPARAM)&dwStart, (LPARAM)&dwEnd );
			  if( HIWORD( lSelect ) != LOWORD( lSelect ))
			  {
				  dwTextLen = SendMessage( hSpeakText, WM_GETTEXTLENGTH, 0, 0);
				  lpEditText = (char *)malloc((1+dwTextLen) * sizeof( char ));
				  SendMessage(hSpeakText, WM_GETTEXT, (WPARAM) dwTextLen+1, (LPARAM)lpEditText);
				  strncpy(szFindText, (char *)&lpEditText[dwStart], dwEnd - dwStart );
				  szFindText[dwEnd - dwStart] = '\0';
				  free( lpEditText );
			  }
			  hFind = FindDialog( hWnd );
			  GetClientRect( hFind, &lprc );
			  MoveWindow( hFind, 200, 0, lprc.right + 10, lprc.bottom + 20, TRUE );
			  
			  break;
			  
		  case ID_CPANEL:
			  TextToSpeechControlPanel(phTTS[tts_select]);
			  break;
			  // #ifdef ML // we are now using ML stuff as standard setting - NCS 16sept97
		  case IDM_ENGLISH:
			  if (current_language==IDM_ENGLISH)
				  break;
			  if (us_on)
			  {
				  hmenu=GetMenu(hWnd);
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_UNCHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
				  
				  TextToSpeechShutdown(phTTS[tts_select]);
				  phTTS[tts_select]=NULL;
				  tts_select = TTS_us;
				  current_language=IDM_ENGLISH;
				  
				  TextToSpeechSelectLang(NULL,tts_select);
				  mmStatus = TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
				  
				  if ( mmStatus != MMSYSERR_NOERROR)
				  {
					  MessageBox( hWnd, TEXT("Error starting DECtalk English US"), TEXT("SPEAK ERROR"), MB_OK);
					  return(-1);
				  }
				  
				  mmStatus = TextToSpeechSetRate(phTTS[tts_select],(UINT)current_rate); // New rate returned in wSpos
				  // extract voice test message from resource
				  for (x = 0; x < 9; x++) {
					  LoadString(NULL,1009+x,odButton[x].szTest,80);
				  }
				  
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_CHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
				  
				  
			  }
			  
			  break;
			  
			  /* GL 10/02/1997 add UK english support */
		  case IDM_ENGLISH_UK:
			  if (current_language==IDM_ENGLISH_UK)
				  break;
			  if (uk_on)
			  {
				  hmenu=GetMenu(hWnd);
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_UNCHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
				  
				  TextToSpeechShutdown(phTTS[tts_select]);
				  phTTS[tts_select]=NULL;
				  tts_select = TTS_uk;
				  current_language=IDM_ENGLISH_UK;
				  
				  TextToSpeechSelectLang(NULL,tts_select);
				  mmStatus = TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
				  
				  if ( mmStatus != MMSYSERR_NOERROR)
				  {
					  MessageBox( hWnd, TEXT("Error starting DECtalk English UK"), TEXT("SPEAK ERROR"), MB_OK);
					  return(-1);
				  }
				  mmStatus = TextToSpeechSetRate(phTTS[tts_select],(UINT)current_rate); // New rate returned in wSpos
				  // extract voice test message from resource
				  for (x = 0; x < 9; x++) {
					  LoadString(NULL,1009+x,odButton[x].szTest,80);
				  }
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_CHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
			  }
			  break;
			  
		  case IDM_SPANISH:
			  if (current_language==IDM_SPANISH)
				  break;
			  if (sp_on) {
				  hmenu=GetMenu(hWnd);
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_UNCHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
				  
				  TextToSpeechShutdown(phTTS[tts_select]);
				  phTTS[tts_select]=NULL;
				  tts_select = TTS_sp;
				  current_language=IDM_SPANISH;
				  
				  TextToSpeechSelectLang(NULL,tts_select);
				  mmStatus = TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
				  
				  if ( mmStatus != MMSYSERR_NOERROR)
				  {
					  MessageBox( hWnd, TEXT("Error starting DECtalk Spanish"), TEXT("SPEAK ERROR"), MB_OK);
					  return(-1);
				  }
				  mmStatus = TextToSpeechSetRate(phTTS[tts_select],(UINT)current_rate); // New rate returned in wSpos
				  // extract voice test message from resource
				  for (x = 0; x < 9; x++) {
					  LoadString(NULL,1018+x,odButton[x].szTest,80);
				  }
				  
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_CHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
			  }
			  break;
			  
		  case IDM_LATIN:
			  if (current_language==IDM_LATIN)
				  break;
			  if (la_on) {
				  hmenu=GetMenu(hWnd);
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_UNCHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
				  
				  TextToSpeechShutdown(phTTS[tts_select]);
				  phTTS[tts_select]=NULL;
				  tts_select = TTS_la;
				  current_language=IDM_LATIN;
				  
				  TextToSpeechSelectLang(NULL,tts_select);
				  mmStatus = TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
				  
				  if ( mmStatus != MMSYSERR_NOERROR)
				  {
					  MessageBox( hWnd, TEXT("Error starting DECtalk Latin American"), TEXT("SPEAK ERROR"), MB_OK);
					  return(-1);
				  }
				  mmStatus = TextToSpeechSetRate(phTTS[tts_select],(UINT)current_rate); // New rate returned in wSpos
				  // extract voice test message from resource
				  for (x = 0; x < 9; x++) {
					  LoadString(NULL,1027+x,odButton[x].szTest,80);
				  }
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_CHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
			  }
			  break;
			  
		  case IDM_GERMAN:
			  if (current_language==IDM_GERMAN)
				  break;
			  if (gr_on) {
				  hmenu=GetMenu(hWnd);
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_UNCHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
				  
				  TextToSpeechShutdown(phTTS[tts_select]);
				  phTTS[tts_select]=NULL;
				  current_language=IDM_GERMAN;
				  tts_select = TTS_gr;
				  
				  TextToSpeechSelectLang(NULL,tts_select);
				  mmStatus = TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
				  
				  if ( mmStatus != MMSYSERR_NOERROR)
				  {
					  MessageBox( hWnd, TEXT("Error starting DECtalk German"), TEXT("SPEAK ERROR"), MB_OK);
					  return(-1);
				  }
				  mmStatus = TextToSpeechSetRate(phTTS[tts_select],(UINT)current_rate); // New rate returned in wSpos
				  // extract voice test message from resource
				  for (x = 0; x < 9; x++) {
					  LoadString(NULL,1036+x,odButton[x].szTest,80);
				  }
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_CHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
			  }	
			  break;
		  case IDM_FRENCH:
			  if (current_language==IDM_FRENCH)
				  break;
			  if (fr_on)
			  {
				  hmenu=GetMenu(hWnd);
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_UNCHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
				  
				  TextToSpeechShutdown(phTTS[tts_select]);
				  phTTS[tts_select]=NULL;
				  tts_select = TTS_fr;
				  current_language=IDM_FRENCH;
				  
				  TextToSpeechSelectLang(NULL,tts_select);
				  mmStatus = TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
				  
				  if ( mmStatus != MMSYSERR_NOERROR)
				  {
					  MessageBox( hWnd, TEXT("Error starting DECtalk French"), TEXT("SPEAK ERROR"), MB_OK);
					  return(-1);
				  }
				  
				  mmStatus = TextToSpeechSetRate(phTTS[tts_select],(UINT)current_rate); // New rate returned in wSpos
				  // extract voice test message from resource
				  for (x = 0; x < 9; x++) {
					  LoadString(NULL,1045+x,odButton[x].szTest,80);
				  }
				  
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_CHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
				  
				  
			  }
			  
			  break;
		  case IDM_ITALIAN:
			  if (current_language==IDM_ITALIAN)
				  break;
			  if (it_on)
			  {
				  hmenu=GetMenu(hWnd);
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_UNCHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
				  
				  TextToSpeechShutdown(phTTS[tts_select]);
				  phTTS[tts_select]=NULL;
				  tts_select = TTS_it;
				  current_language=IDM_ITALIAN;
				  
				  TextToSpeechSelectLang(NULL,tts_select);
				  mmStatus = TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
				  
				  if ( mmStatus != MMSYSERR_NOERROR)
				  {
					  MessageBox( hWnd, TEXT("Error starting DECtalk French"), TEXT("SPEAK ERROR"), MB_OK);
					  return(-1);
				  }
				  
				  mmStatus = TextToSpeechSetRate(phTTS[tts_select],(UINT)current_rate); // New rate returned in wSpos
				  // extract voice test message from resource
				  for (x = 0; x < 9; x++) {
					  LoadString(NULL,1054+x,odButton[x].szTest,80);
				  }
				  
				  menu_info.cbSize=sizeof(menu_info);
				  menu_info.fMask=MIIM_STATE;
				  menu_info.fState=MFS_CHECKED;
				  SetMenuItemInfo(hmenu,current_language,FALSE,&menu_info);
				  
				  
			  }
			  
			  break;
			  //#endif
		  default:

				// Check if the user has selected a voice.
			  for (i=0; i<9; i++)
					// If the button pressed is a voice...
				  if (lParam == (LPARAM)odButton[i].hWnd) {
						// Switch the voice to the selected one by passing in the `[:np]` style input
					  mmStatus = TextToSpeechSpeak(phTTS[tts_select], odButton[i].szSelVoice, TTS_NORMAL);
					  if ( mmStatus )
						  MessageBox( hWnd,
						  TEXT("Error in TTS Speak") ,
						  TEXT("ERROR"),
						  MB_OK | MB_ICONSTOP );

						// Speak the name of the voice.
					  mmStatus = TextToSpeechSpeak(phTTS[tts_select], odButton[i].szTest, TTS_FORCE);

					  //SendMessage(hSpeakText, EM_GETSEL,(WPARAM) &dwStart,(LPARAM) &dwEnd);
					  //SendMessage(hSpeakText, EM_SETSEL,(WPARAM)(INT) -1L,(LPARAM)(INT) -1L);
					  SetFocus(hSpeakText);
					  if ( mmStatus )
#ifdef DEMO
						  MessageBox( hWnd,
						  TEXT("Error in DTdemo") ,
						  TEXT("ERROR"),
						  MB_OK | MB_ICONSTOP );
#else
					  MessageBox( hWnd,
						  TEXT("Error in Speak") ,
						  TEXT("ERROR"),
						  MB_OK | MB_ICONSTOP );
#endif	
				  }
				  
				  break;
	}
	
	return(0);
}

/* *******************************************************************
 *      Function Name: DrawControl()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *					LPDRAWITEMSTUCT lpInfo
 *
 *      Return Value: INT
 *
 *      Comments:
 *
 * *****************************************************************/
INT DrawControl(HWND hWnd, LPDRAWITEMSTRUCT lpInfo)
{
	INT  i;
	UINT uiStatus;
	LPBITMAPFILEHEADER   lpbf;
	LPBITMAPINFOHEADER   lpbi;
	LPVOID dibBits;
	
	//  Select our palette into the Device DC
	hPalOld = SelectPalette (lpInfo->hDC, hPalLogical, FALSE);
	if (hPalOld == FALSE)
		return ErrMsg ("Line %d Error = %d\nSelectPalette",__LINE__,GetLastError());
	
	// Activate palette
	uiStatus = RealizePalette (myHdc);
	if (uiStatus == GDI_ERROR)
		return ErrMsg ("Line %d Error = %d\nRealizePalette",__LINE__,GetLastError());
	
	for (i=0; i<13; i++) {
		if (lpInfo->hwndItem == odButton[i].hWnd) {
			lpbf = odButton[i].lpbfNormalDib;
			if (lpInfo->itemState & ODS_SELECTED) {
				lpbf = odButton[i].lpbfSelectedDib;
			}
		}
	}
	if (lpInfo->hwndItem == odButton[PAUSE].hWnd) {   //Is this pause button?
		if (bPaused) {
			lpbf = odButton[PAUSE].lpbfSelectedDib;
		} else {
			lpbf = odButton[PAUSE].lpbfNormalDib;
		}
	}
	lpbi = (LPVOID)((CHAR*)lpbf + sizeof(BITMAPFILEHEADER));
	dibBits = (LPVOID)((CHAR*)lpbf + lpbf->bfOffBits);
	
	// put our DIB on the screen
	SetDIBitsToDevice((HDC)lpInfo->hDC,
		(INT)0, (INT)0,
		(DWORD)lpbi->biWidth,
		(DWORD)lpbi->biHeight,
		(INT)0, (INT)0,
		(UINT)0, (UINT)lpbi->biHeight ,
		(LPVOID)dibBits,
		(LPBITMAPINFO)lpbi, (UINT)DIB_RGB_COLORS);
	
	return(0);
}

/* *******************************************************************
 *      Function Name: SpeakText()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *
 *      Return Value: BOOL
 *
 *      Comments:
 *
 * *************************************************************** */
BOOL SpeakText( HWND hWnd )
{
	DWORD		dwTextLen;
	LPSTR		lpEditText;
	MMRESULT	mmStatus;
	char		szError[32];
	char		lpEditIM[256];
	ULONG       ptr = 0;
	ULONG       pos = 0;
	ULONG       mark = 2;
	char        temp[50];
	MARK_POS    *next = mark_pos;
	BOOL        inbracket = FALSE;
	// tek 19jun97
	char		cPrevchar='\0';
	
	while (next != NULL) {
		mark_pos = next->next_mark;
		free(next);
		next = mark_pos;
	}
	
	dwTextLen = SendMessageA(hSpeakText, WM_GETTEXTLENGTH, 0, 0);
	lpEditText = (char *)malloc((1 + dwTextLen) * sizeof(char)) ;
	SendMessageA(hSpeakText, WM_GETTEXT, (WPARAM) dwTextLen + 1, (LPARAM) lpEditText);
	
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
					sprintf(temp," [:i m %lu]", mark++);
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
			{
				cPrevchar = lpEditText[pos-2];
			}
			else
			{
				cPrevchar = '\0';
			}
			if ((ptr > 224) || ( cPrevchar=='.' || cPrevchar==',' || cPrevchar=='?' || cPrevchar=='!'))
			{
				lpEditIM[ptr++] = '\0';
				mmStatus = TextToSpeechSpeak(phTTS[tts_select], lpEditIM, TTS_NORMAL);
				if ( mmStatus ) {
					sprintf( szError, "Error = %d", mmStatus );
					MessageBox( hWnd, szError, TEXT("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP);
					return TRUE;
				}
				ptr = 0;
			}
		}
		if (ptr) {
			lpEditIM[ptr++] = '\0';
			mmStatus = TextToSpeechSpeak(phTTS[tts_select], lpEditIM, TTS_NORMAL);
			if ( mmStatus ) {
				sprintf( szError, "Error = %d", mmStatus );
				MessageBox( hWnd, szError, TEXT("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP);
				return TRUE;
			}
			ptr = 0;
		}
	  		
		mmStatus = TextToSpeechSpeak(phTTS[tts_select], "", TTS_FORCE);
		if ( mmStatus ) {
			sprintf( szError, "Error = %d", mmStatus );
			MessageBox( hWnd, szError, TEXT("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP);
			return TRUE;
		}
		
		free(lpEditText);
		
		if ( mmStatus )
		{
			sprintf( szError, "Error = %d", mmStatus );
			MessageBox( hWnd, szError, TEXT("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP);
			return TRUE;
		}
	} else {
		mmStatus = TextToSpeechSpeak(phTTS[tts_select], lpEditText, TTS_FORCE);
					
		if ( mmStatus )
			MessageBox( hWnd,
			TEXT("Error in TTS Speak"),
			TEXT("ERROR"),
			MB_OK | MB_ICONSTOP );
		free(lpEditText);
		
		if ( mmStatus )
		{
			sprintf( szError, "Error = %d", mmStatus );
			MessageBox( hWnd, szError, TEXT("TextToSpeechSpeak"), MB_OK | MB_ICONSTOP);
			return TRUE;
		}
	}
	return FALSE;
}

/* *******************************************************************
 *      Function Name: MyOpenFile()
 *
 *      Description: Function to Open a file.
 *
 *      Arguments:	HWND hWnd
 *					char szFile[]
 *					char szFileTitle[]
 *
 *      Return Value: LONG
 *
 *      Comments:
 *
 * *****************************************************************/
INT MyOpenFile( HANDLE hWnd, char szFile[], char szFileTitle[] )
{
	OpenFileName.lStructSize		= sizeof(OPENFILENAME);
	OpenFileName.hwndOwner			= hWnd;
	OpenFileName.hInstance			= (HANDLE) hInst;
	OpenFileName.lpstrFilter		= szFilter;
	OpenFileName.lpstrCustomFilter	= (LPSTR) NULL;
	OpenFileName.nMaxCustFilter		= 0L;
	OpenFileName.nFilterIndex		= 1L;
	OpenFileName.lpstrFile			= szFile;
	OpenFileName.nMaxFile			= 256;
	OpenFileName.lpstrFileTitle		= szFileTitle;
	OpenFileName.nMaxFileTitle		= 256;
	OpenFileName.lpstrInitialDir	= NULL;
	OpenFileName.lpstrTitle			= TEXT("Open a File");
	OpenFileName.nFileOffset		= 0;
	OpenFileName.nFileExtension		= 0;
	OpenFileName.lpstrDefExt		= TEXT("txt");
	OpenFileName.lCustData			= 0;
	OpenFileName.Flags				= OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY;
	
	if ( GetOpenFileName(&OpenFileName))
	{
		if (!MyReadFile( hWnd, OpenFileName.lpstrFile ))
		{
			return( TRUE );
		}
	}
	else
	{
		ProcessCDError(CommDlgExtendedError(), hWnd );
		return( FALSE );
	}
	return( FALSE );
}

/* *******************************************************************
 *      Function Name: MyReadFile()
 *
 *      Description: Function to read file
 *
 *      Arguments:	HWND hWnd
 *					char *szReadFile
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *************************************************************** */
int MyReadFile( HWND hWnd, char *szReadFile )
{
	//MVP:06/20/96
	// On windows'95 File size >64k bug related code is added.
	// File size of 0 bytes causes FileMapping APIs Fail.
	// A Message box saying Invalid file is added.
	DWORD dwFileSizeHigh =0;
    DWORD dwFileSizeLow = 0;
	DWORD dwError;
	//	char title[255];
	CHAR szErrMsg[80];
	char* pFileDataPlusOne;				// Create a null terminated copy
	
	//if (strcmp(szReadFile,"easter.egg") == 0)	easter_egg();	// Easter Egg  v1.0  KSB
	
	// open the file
	
	hFile = CreateFile( szReadFile, GENERIC_READ, FILE_SHARE_READ, (LPSECURITY_ATTRIBUTES)NULL,
		OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, (HANDLE)NULL ) ;
	
	if ( hFile == INVALID_HANDLE_VALUE ) {
		MessageBox( hWnd, TEXT("File open failed."), NULL, MB_OK);
		return( TRUE );
	}
	
	//MVP:06/20/96 :Check for file size for 64K on Windows'95
	dwFileSizeLow = GetFileSize(hFile, &dwFileSizeHigh);
	if(dwFileSizeLow ==	0xFFFFFFFF &&
		(dwError = GetLastError()) != NO_ERROR)
	{
		MessageBox(hWnd,TEXT("GetFileSize is Failed"), TEXT("Error"), MB_OK | MB_ICONSTOP);
		return TRUE;
	}
	
	if(dwFileSizeLow==0)
		goto jump;

	if(bWin95)
	{
		if( dwFileSizeLow > 0xFFFF || dwFileSizeHigh)
		{
#ifdef DEMO
			MessageBox(hWnd,TEXT("Can not load files more than 64K size into DTdemo Editor under Windows'95"), TEXT("Information"), MB_OK | MB_ICONSTOP);
#else
			MessageBox(hWnd,TEXT("Can not load files more than 64K size into Speak Editor under Windows'95"), TEXT("Information"), MB_OK | MB_ICONSTOP);
#endif	
			return TRUE;
		}
	}
	
	hFileMap = CreateFileMapping(hFile, NULL, PAGE_READONLY, 0, 0, NULL);
	if(!hFileMap)
	{
		//MVP :06/20/96 :File size of 0 bytes creates an ERROR.
		// Reports that Information below.
		//dwError = GetLastError();
		//sprintf(szErrMsg,"The Error code returned by CreateFileMapping is %d\n",dwError);
		//MessageBox( hWnd, szErrMsg, "ERROR", MB_OK | MB_ICONSTOP );
		sprintf(szErrMsg,"Invalid File :%s %d",szReadFile,GetLastError());
		MessageBox( hWnd, szErrMsg, TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return TRUE;
	}
	pFileData = MapViewOfFile(hFileMap, FILE_MAP_READ, 0, 0, 0);
	if(!pFileData)
	{
		MessageBox( hWnd, TEXT("MapViewOfFile in MyReadFile Failed"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return TRUE;
	}
	
	if ((pFileDataPlusOne = malloc(dwFileSizeLow+1)) == NULL)
	{
		MessageBox(hWnd, TEXT("Insufficient memory to load file"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return TRUE;
	}
	
	memcpy(pFileDataPlusOne, pFileData, dwFileSizeLow);
	pFileDataPlusOne[dwFileSizeLow] = TEXT('\0');
	
	SendMessage(hSpeakText, WM_SETTEXT, 0, (LPARAM) pFileDataPlusOne);
	free(pFileDataPlusOne);
	
	if (! UnmapViewOfFile ( pFileData ))
	{
		MessageBox( hWnd, TEXT("File Unmap in MyReadFile Failed"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return TRUE;
	}
jump:
	CloseHandle(hFileMap);
	CloseHandle(hFile);
	
	return FALSE;
	
	
	//dwFileSize = GetFileSize( hFile, NULL);
	//sprintf(szBuf,"file size is %d", dwFileSize);
	// MessageBox( hWnd, szBuf, "INFO", MB_OK );
	
	// read it's contents into a buffer
	
}

/* *******************************************************************
 *      Function Name: AskToSave()
 *
 *      Description: Puts up a Message box asking to save - yes, no or cancel
 *
 *      Arguments:	HWND hWnd
 *
 *      Return Value: BOOL
 *						TRUE  -  Cancel button pushed
 *						FALSE -  Yes or No pushed
 *      Comments:
 *
 * *****************************************************************/
BOOL AskToSave( HWND hWnd )
{
	int iResponse ;
	char szBuf[128];
	
	iResponse = MessageBox(hWnd,
		TEXT("The Text in this file has changed. \n\n Do you wish to save the changes?"),
		szAppName ,  MB_YESNOCANCEL | MB_ICONEXCLAMATION )  ;
	switch (iResponse)
	{
	case IDYES:
		
		GetWindowText( hWnd, szBuf, 30) ;
		if (strcmp  (szBuf,  szAppName) == 0)
		{
			if (!SaveFileAs ( hWnd ))
				return TRUE;
			return FALSE;
		}
		else
		{
			MySaveFile ( hWnd ) ;
			return FALSE ;
		}
		break;
		
	case IDCANCEL:
		return TRUE;
		break;
		
	case IDNO:
		return FALSE ;
		break;
	}
	
	
	return TRUE;
}

/* *******************************************************************
 *      Function Name: GetDictName()
 *
 *      Description: Function to get dictionary name
 *
 *      Arguments:	HWND hWnd
 *
 *      Return Value: BOOL
 *
 *      Comments:
 *
 * *****************************************************************/
BOOL GetDictName( HWND hWnd )
{
	CHAR szDictFilter[] = "Dictionary Files (*.DIC)\0*.DIC\0All Files (*.*)\0*.*\0";
	static char szDict[256];
	static char szDictTitle[256];
	strcpy( szDict, "");
	strcpy( szDictTitle, "");
		
	OpenDictName.lStructSize		= sizeof(OPENFILENAME);
	OpenDictName.hwndOwner			= hWnd;
	OpenDictName.hInstance			= (HANDLE) hInst;
	OpenDictName.lpstrFilter		= szDictFilter;
	OpenDictName.lpstrCustomFilter	= (LPSTR) NULL;
	OpenDictName.nMaxCustFilter		= 0L;
	OpenDictName.nFilterIndex		= 1L;
	OpenDictName.lpstrFile			= szDict;
	OpenDictName.nMaxFile			= 256;
	OpenDictName.lpstrFileTitle		= szDictTitle;
	OpenDictName.nMaxFileTitle		= 256;
	OpenDictName.lpstrInitialDir	= NULL;
	OpenDictName.lpstrTitle			= TEXT("Load a Dictionary");
	OpenDictName.nFileOffset		= 0;
	OpenDictName.nFileExtension		= 0;
	OpenDictName.lpstrDefExt		= TEXT("dic");
	OpenDictName.lCustData			= 0;
	OpenDictName.Flags				= OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY;
	
	if ( GetOpenFileName(&OpenDictName))
		return TRUE;
	else
	{
		ProcessCDError(CommDlgExtendedError(), hWnd );
	}
	return( FALSE );
}

/* *******************************************************************
 *      Function Name: handleScrollbar()
 *
 *      Description:	Handle all "Seaking Rate" Scroll Bar Logic
 *						Line logic changes speaking rate in increments of 5 Words Per Minute
 *						Page Logic Changes in 20 word per minutes
 *						Thumbtrack is rounded to 5 WPM boundries
 *
 *      Arguments:	WPARAM wParam
 *					SHORT wSpos
 *
 *      Return Value: SHORT
 *
 *      Comments: The return value is the new selected rate in WPM
 *
 * *****************************************************************/

SHORT  HandleScrollBar(WPARAM wParam, SHORT wSpos)
{	
	static  CHAR szText[12] ="\0";
	
	switch(LOWORD(wParam))
	{
		// tek 02nov98 fixed to use correct range for this DLL
			 case SB_PAGEDOWN:         // Increment Rate Slider by 20 to Max of 600
				 if (wSpos > rateMax-20)
					 wSpos = rateMax;
				 else
					 wSpos += 20;
				 break;
				 
			 case SB_LINEDOWN:         // Increment Rate Slider by 5 to Max of 600
				 if (wSpos > rateMax-5)
					 wSpos = rateMax;
				 else
					 wSpos   += 5;
				 break;
				 
			 case SB_PAGEUP:           // Decrement Rate Slider by 20 to Min of 75
				 if (wSpos < rateMin+20)
					 wSpos = rateMin;
				 else
					 wSpos   -= 20;
				 break;
				 
			 case SB_LINEUP:           // Increment Rate Slider by 5 to Max of 75
				 if (wSpos < rateMin+5)
					 wSpos = rateMin;
				 else
					 wSpos   -= 5;
				 break;
				 
			 case SB_TOP:              // Rate Slider to Max
				 wSpos   =rateMax;
				 break;
				 
			 case SB_BOTTOM:           // Rate Slider to Min
				 wSpos   = rateMin;
				 break;
				 
			 case SB_THUMBPOSITION:
				 
			 case SB_THUMBTRACK:
				 wSpos = ((HIWORD(wParam))/5)*5;       // Round speaking rate to nearest 5
				 
			 default:
				 break;
	}
			 SetScrollPos(hRate, SB_CTL, wSpos , TRUE)  ; // Set Slider Control position
			 wsprintf(szText, TEXT("%d WPM"), wSpos);
			 SetWindowText(hstRate,szText );   // Display Rate in Static control
			 return (wSpos);
}

/* *******************************************************************
 *      Function Name: handleScrollbar()
 *
 *      Description: Error handler
 *
 *      Arguments:	HANDLE hwnd
 *					CHAR *szError
 *					CHAR *szAppName
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ErrorHandler( HANDLE hWnd, CHAR *szError, CHAR *szAppName )
{
	MessageBeep(0);
	MessageBox( hWnd, szError, szAppName, MB_ICONEXCLAMATION | MB_OK );
	return;
}

/* *******************************************************************
 *      Function Name: npVoiceControls()
 *
 *      Description:	
 *
 *      Arguments:	HWND hWnd
 *					UINT msg
 *					WPARAM wParam
 *					LPARAM lParam
 *
 *      Return Value: LRESULT CALLBACK
 *
 *      Comments:
 *
 * *****************************************************************/
LRESULT CALLBACK npVoiceControls(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	static char szTextWindow[8192];
	MMRESULT mmStatus;

	switch(msg)
	{
	case WM_LBUTTONUP:
		if (hWnd == odButton[PLAY].hWnd)
		{
            // tek 08oct96 we should reset the speaker and speed here.
            TextToSpeechSetRate(phTTS[tts_select],current_rate); // New rate returned in wSpos
			
			// TODO: Switch to the ANSI version of SendMessage
			SendMessageA(hSpeakText,
				WM_GETTEXT,
				sizeof(szTextWindow),
				(LPARAM)szTextWindow);
			
			SpeakText( hWnd );
			SetFocus(hSpeakText);
		}
		
		if (hWnd == odButton[PAUSE].hWnd)
		{
			if ( ! bPaused )
			{
				if ( TextToSpeechPause( phTTS[tts_select] ) == MMSYSERR_NOERROR )
					
				{
					SetFocus(hSpeakText);		/* GL 01/15/1997, move into {} */
					bPaused = TRUE;
				}
			}
			else
			{
				if ( TextToSpeechResume( phTTS[tts_select] ) == MMSYSERR_NOERROR )
				{
					SetFocus(hSpeakText);		/* GL 01/15/1997, move into {} */
					bPaused = FALSE;
				}
			}
		}
		
		if (hWnd == odButton[STOP].hWnd)
		{
			mmStatus = TextToSpeechReset( phTTS[tts_select], FALSE );
			if ( mmStatus )
				
				MessageBox( hWnd,
				"Error in TTS Reset" ,
				"ERROR",
				MB_OK | MB_ICONSTOP );
			//bPaused = FALSE;
			/* Infostruct.hwndItem = odButton[PAUSE].hWnd;
			Infostruct.hDC = GetDC(odButton[PAUSE].hWnd);
			DrawControl(odButton[PAUSE].hWnd, &Infostruct);
			ReleaseDC(odButton[PAUSE].hWnd, Infostruct.hDC); */
			SetFocus(hSpeakText);
		}
		
		if (hWnd == odButton[RELOAD].hWnd)
		{
			TextToSpeechReset(phTTS[tts_select],TRUE);
			TextToSpeechSync(phTTS[tts_select]);
			TextToSpeechShutdown(phTTS[tts_select]);
			TextToSpeechSelectLang(NULL, tts_select);
			TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
			TextToSpeechSetRate(phTTS[tts_select],(UINT)current_rate);
		}
		
	default:
		return CallWindowProc (opVoiceControls, hWnd, msg, wParam, lParam);
	}
}

/* *******************************************************************
 *      Function Name: AboutDlgProc()
 *
 *		Author: Bill Hallahan
 *		Date: October 5, 1994
 *
 *      Description: This dialog procedure is for the about box.
 *
 *      Arguments:	HWND hWnd		Handle to window
 *					UINT uiMsg		Message being sent to the window.
 *					WPARAM wParam	Specific argument to message.
 *					LPARAM lParam	Specific argument to message.
 *
 *      Return Value: BOOL APIENTRY
 *						The return value is specific to the message that was
 *						received. It is FALSE if this dialog procedure does not handle
 *						a message (an exception is the WM_INITDIALOG message where
 *						TRUE is always returned).
 *      Comments:
 *
 * *****************************************************************/
#define MAX_STRING 512

BOOL APIENTRY AboutDlgProc( HWND hWnd, UINT uiMsg, WPARAM wParam, LPARAM lParam )
{
	HWND hDlgItem;
	LPSTR pString;
	LPSTR fString;
	char szInstaller[MAX_STRING];
	char szCompany[MAX_STRING];
	
	switch( uiMsg )
	{
	case WM_RBUTTONUP:
		//easter_egg();
		return 0;
		
	case WM_INITDIALOG:
		
		/******************************************************************/
		/*  Display some OS version information.                          */
		/******************************************************************/
		
		pString = (LPSTR)malloc( MAX_STRING * sizeof(CHAR));
		fString = (LPSTR)malloc( MAX_STRING * sizeof(CHAR));
		
		if ( pString == NULL )
		{
			MessageBox( hWnd, TEXT("Out of Memory"), TEXT("Error"), MB_OK );
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
		
		hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_REG_INSTALLER );
		SetWindowTextA( hDlgItem, szInstaller );
		
		hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_REG_COMPANY );
		SetWindowTextA( hDlgItem, szCompany );
		
		/******************************************************************/
		/* Display the version of DECtalk DLL file                        */
		/******************************************************************/
		wsprintf(fString, TEXT("%d.%02d (build %X)"), DECtalk_maj_ver, DECtalk_min_ver, DECtalk_build);
		hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_DECTALK_VERSION );
		SetWindowText( hDlgItem, fString );
		
		hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_DECTALK_VERSION_STR );
		SetWindowTextA( hDlgItem, DECtalk_version );
		
		free(pString);
		free(fString);
		
		return( TRUE );
		
	case WM_COMMAND:
		
		if ( LOWORD( wParam ) == IDOK || LOWORD( wParam ) == IDCANCEL )
		{
			EndDialog( hWnd, ( IDOK == LOWORD( wParam )));
		}
		break;
		
	default:
		
		break;
	}
	return( FALSE );
}

/* *******************************************************************
 *      Function Name: ErrMsg()
 *
 *      Description:
 *
 *      Arguments:	PSTR sz
 *					...
 *
 *      Return Value: INT
 *
 *      Comments:
 *
 * *****************************************************************/
#ifdef UNICODE
INT ErrMsg(PWSTR sz, ...)
{
	CHAR ach[128];
	
	wvsprintf (ach, sz, (LPWSTR)(&sz+1));   /* Format the string */
	MessageBox (NULL, ach, NULL, MB_OK|MB_ICONEXCLAMATION|MB_APPLMODAL);
	return FALSE;
}
#else
INT ErrMsg(PSTR sz, ...)
{
	CHAR ach[128];

	wvsprintf(ach, sz, (LPSTR)(&sz + 1));   /* Format the string */
	MessageBox(NULL, ach, NULL, MB_OK | MB_ICONEXCLAMATION | MB_APPLMODAL);
	return FALSE;
}
#endif

/* *******************************************************************
 *      Function Name: usePalette()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *					CHAR *szPalResName
 *
 *      Return Value: INT
 *
 *      Comments:
 *
 * *****************************************************************/
INT usePalette(HWND hWnd)
{
	LOGPALETTE  *pPalData;
	HRSRC       hPalRes, hPalData;
	UINT        uiStatus;
	
	//         myHdc = GetDC(hWnd);
		  hPalRes = FindResource(hInst, TEXT("SPEAKPAL"), TEXT("MYPALETTE"));
		  if (hPalRes == NULL)
			  return ErrMsg(TEXT("Line %d Error = %d\nFindResource"), __LINE__, GetLastError());
		  
		  hPalData = LoadResource(NULL, hPalRes);
		  if (hPalData == NULL)
			  return ErrMsg(TEXT("Line %d Error = %d\nLoadResource"), __LINE__, GetLastError());
		  
		  pPalData = (LPVOID)((CHAR*)LockResource(hPalData) + 0x14);
		  
		  hPalLogical = CreatePalette(pPalData);
		  
		  if (hPalLogical == NULL)
			  return ErrMsg(TEXT("Line %d Error = %d\nCreatePalette"), __LINE__, GetLastError());
		  
		  //  Select our palette into the Device DC
		  hPalOld = SelectPalette (myHdc, hPalLogical, FALSE);
		  if (hPalOld == FALSE)
			  return ErrMsg(TEXT("Line %d Error = %d\nSelectPalette"), __LINE__, GetLastError());
		  
		  // Activate palette
		  uiStatus = RealizePalette (myHdc);
		  if (uiStatus == GDI_ERROR)
			  return ErrMsg(TEXT("Line %d Error = %d\nRealizePalette"), __LINE__, GetLastError());
		  return(0);
}

/* *******************************************************************
 *      Function Name: MySaveFile()
 *
 *      Description: Saves current contents of edit control to current filename.
 *
 *      Arguments:	HWND hWnd
 *
 *      Return Value: BOOL
 *						TRUE - The file was saved successfully
 *						FALSE - The file was not saved
 *
 *      Comments:
 *
 * *****************************************************************/
BOOL MySaveFile( HWND hWnd)
{
	LRESULT lResult;
		
	hFile = CreateFile( szFile,
		GENERIC_READ | GENERIC_WRITE,
		FILE_SHARE_READ,
		(LPSECURITY_ATTRIBUTES)NULL,
		CREATE_ALWAYS,
		FILE_ATTRIBUTE_NORMAL,
		(HANDLE)NULL );
	
	if ( hFile == INVALID_HANDLE_VALUE )
	{
		MessageBox( hWnd, "File open failed.", NULL, MB_OK );
		return( FALSE );
	}
	
	hFileMap = CreateFileMapping(hFile,
		(LPSECURITY_ATTRIBUTES)NULL,
		PAGE_READWRITE,
		0,
		(SendMessage(hSpeakText, WM_GETTEXTLENGTH, 0, 0)),NULL);
	
	pFileData = MapViewOfFile(hFileMap, FILE_MAP_WRITE, 0, 0, 0);
	lResult  = SendMessage(hSpeakText, WM_GETTEXTLENGTH, 0 ,0 ) ;
	SendMessage(hSpeakText, WM_GETTEXT, lResult + 1, (LPARAM)pFileData );
	if (! UnmapViewOfFile ( pFileData ))
	{
		MessageBox( hWnd, "File Unmap Failed", "ERROR", MB_OK | MB_ICONSTOP );
		return FALSE ;
	}
		  CloseHandle(hFileMap);
		  CloseHandle(hFile);
		  SendMessage(hSpeakText, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
		  return TRUE;
}

/* *******************************************************************
 *      Function Name: SaveFileAs()
 *
 *      Description: Saves current contents of edit control to new filename.
 *
 *      Arguments:	HWND hWnd
 *
 *      Return Value: BOOL
 *						TRUE - The file was saved successfully
 *						FALSE - The file was not saved
 *
 *      Comments:
 *
 * *****************************************************************/
BOOL SaveFileAs( HWND hWnd)
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
	OpenFileName.lpstrTitle        = "Save File As";
	OpenFileName.nFileOffset       = 0;
	OpenFileName.nFileExtension    = 0;
	OpenFileName.lpstrDefExt       = "txt";
	OpenFileName.lCustData         = 0;
	OpenFileName.Flags             = OFN_OVERWRITEPROMPT | OFN_PATHMUSTEXIST | OFN_CREATEPROMPT
									 | OFN_HIDEREADONLY;
	OpenFileName.lpfnHook          = (LPOFNHOOKPROC) (FARPROC) NULL;
	OpenFileName.lpTemplateName    = (LPSTR) NULL;
	
	if (GetSaveFileName(&OpenFileName))
		return (MySaveFile ( hWnd )) ;
	else	
	{
		ProcessCDError(CommDlgExtendedError(), hWnd );
		return FALSE;
	}
}

/* *******************************************************************
 *      Function Name: SaveWaveName()
 *
 *      Description: Gets filename for Wave out to file.
 *
 *      Arguments:	HWND hWnd
 *
 *      Return Value: BOOL
 *						TRUE - The filename was retrieved
 *						FALSE - The filename was not retreived
 *
 *      Comments: This function fills in the OpenWaveName OPENFILENAME Structure
 *
 * *****************************************************************/
BOOL SaveWaveName( HWND hWnd )
{	
	OpenWaveName.lStructSize       = sizeof(OPENFILENAME);
	OpenWaveName.hwndOwner         = hWnd;
	OpenWaveName.hInstance         = (HANDLE) hInst;
	OpenWaveName.lpstrFilter       = szWaveFilter;
	OpenWaveName.lpstrCustomFilter = (LPSTR) NULL;
	OpenWaveName.nMaxCustFilter    = 0L;
	OpenWaveName.nFilterIndex      = 1L;
	OpenWaveName.lpstrFile         = szWaveFile;
	OpenWaveName.nMaxFile          = sizeof(szWaveFile);
	OpenWaveName.lpstrFileTitle    = szWaveFileTitle;
	OpenWaveName.nMaxFileTitle     = sizeof(szWaveFileTitle);
	OpenWaveName.lpstrInitialDir   = NULL;
	OpenWaveName.lpstrTitle        = "Convert to Wave File";
	OpenWaveName.nFileOffset       = 0;
	OpenWaveName.nFileExtension    = 0;
	OpenWaveName.lpstrDefExt       = "wav";
	OpenWaveName.lCustData         = 0;
	OpenWaveName.Flags             = OFN_OVERWRITEPROMPT | OFN_PATHMUSTEXIST | OFN_CREATEPROMPT |
		OFN_HIDEREADONLY ;
	OpenWaveName.lpfnHook          = (LPOFNHOOKPROC) (FARPROC) NULL ;
	OpenWaveName.lpTemplateName    = (LPSTR) NULL ;
	
	
	
	if (GetSaveFileName(&OpenWaveName))
		return TRUE ;
	else
		
	{
		ProcessCDError(CommDlgExtendedError(), hWnd ) ;
		return FALSE ;
		
	}
	
}

/* *******************************************************************
 *      Function Name: ProcessCDError()
 *
 *      Description: Processes errors from the common dialog functions.
 *
 *      Arguments:	HWND hWnd
 *
 *      Return Value: void
 *
 *      Comments:	This function is called whenever a common dialog function
 *					fails. The CommonDialogExtendedError() value is passed to
 *					the function which maps the error value to a string table.
 *					The string is loaded and displayed for the user.
 *
 * *****************************************************************/
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

/* *******************************************************************
 *      Function Name: HandleMenuPopup()
 *
 *      Description: Handle Edit menu popup logic
 *
 *      Arguments:	WPARAM wParam
 *
 *      Return Value: void
 *
 *      Comments:	This function is called whenever a common dialog function
 *					fails. The CommonDialogExtendedError() value is passed to
 *					the function which maps the error value to a string table.
 *					The string is loaded and displayed for the user.
 *
 * *****************************************************************/
void HandleMenuPopup(WPARAM wParam)
{
	LONG lSelect;
	WORD wEnable;
	INT iLen;

	if ( IsClipboardFormatAvailable( CF_TEXT ))
		EnableMenuItem((HANDLE)wParam, ID_EDIT_PASTE, MF_ENABLED);
	else
		EnableMenuItem((HANDLE)wParam, ID_EDIT_PASTE, MF_GRAYED);
	
	/*Enable  menu cut, copy & delete menu items if data is selected */
	
	lSelect = SendMessage (hSpeakText, EM_GETSEL, 0L, 0L) ;
	
	if (HIWORD (lSelect) != LOWORD (lSelect))
		wEnable= MF_ENABLED;
	else
		wEnable= MF_GRAYED;
	
	EnableMenuItem ((HANDLE)wParam, ID_EDIT_CUT, wEnable);
	EnableMenuItem ((HANDLE)wParam, ID_EDIT_COPY, wEnable);
	EnableMenuItem ((HANDLE)wParam, ID_EDIT_CLEAR, wEnable);
	iLen = GetWindowTextLength( hSpeakText );
	
	if (iLen == 0)
	{
		EnableMenuItem((HANDLE)wParam, IDM_SAVE, MF_GRAYED);
		EnableMenuItem((HANDLE)wParam, IDM_SAVEAS, MF_GRAYED);
	}
	
	else
	{
		EnableMenuItem((HANDLE)wParam, IDM_SAVE, MF_ENABLED);
		EnableMenuItem((HANDLE)wParam, IDM_SAVEAS, MF_ENABLED);
	}
	if (SendMessage(hSpeakText, EM_CANUNDO, 0L, 0L))
		EnableMenuItem((HANDLE)wParam, ID_EDIT_UNDO, MF_ENABLED);
	else
		EnableMenuItem((HANDLE)wParam, ID_EDIT_UNDO, MF_GRAYED);
	
	return ;
}

/* *******************************************************************
 *      Function Name:	FindDialog()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *
 *      Return Value: HWND
 *
 *      Comments:
 *
 * *****************************************************************/
HWND FindDialog( HWND hWnd )
{
	static FINDREPLACE frText;
	
	frText.lStructSize      = sizeof( FINDREPLACE );
	frText.hwndOwner        = hWnd;
	frText.hInstance        = NULL;
	frText.Flags			= FR_DOWN | ! FR_WHOLEWORD | ! FR_MATCHCASE;
	frText.lpstrFindWhat    = szFindText;
	frText.lpstrReplaceWith = NULL;
	frText.wFindWhatLen     = sizeof( szFindText );
	frText.wReplaceWithLen  = 0;
	frText.lCustData        = 0;
	frText.lpfnHook			= NULL;
	frText.lpTemplateName   = NULL;
	
	return( FindText( &frText ));
}

/* *******************************************************************
 *      Function Name:	FindNextText()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *					DWORD *lpdwSearchOffSet
 *
 *      Return Value: BOOL
 *
 *      Comments:
 *
 * *****************************************************************/
BOOL FindNextText( HWND hSearch, DWORD *lpdwSearchOffset )
{
	FINDREPLACE frText;
	
	frText.lpstrFindWhat = szFindText;
	
	return( FindSearchString( hSearch, lpdwSearchOffset, &frText ));
}

/* *******************************************************************
 *      Function Name:	FindSearchString()
 *
 *      Description: Find a string
 *
 *      Arguments:	HWND hSearch
 *					DWORD *lpdwSearchOffSet
 *					LPFINDEREPLACE lpfr
 *
 *      Return Value: BOOL
 *						TRUE - Found
 *						FALSE - Not Found
 *      Comments:
 *
 * *****************************************************************/
BOOL FindSearchString( HWND hSearch, DWORD *lpdwSearchOffset, LPFINDREPLACE lpfr )
{
	DWORD   dwPos;
	LPSTR   lpstrDoc, lpstrPos, lpstrFind, lpstrPtr;
	BOOL    bFind = TRUE;
	static char szAlphabet[] = {"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"};
	LRESULT	lResult;
	
	/* Retrieve the data from the edit box  (KSB 7/22/96) */
	lResult  = SendMessage(hSpeakText, WM_GETTEXTLENGTH, 0 ,0 ) ;
	if ((lpstrDoc = (LPSTR) malloc(lResult+1)) == NULL) {
		return FALSE;
	}
	lpstrPtr = lpstrDoc;
	SendMessage(hSpeakText, WM_GETTEXT, lResult + 1, (LPARAM)lpstrDoc );
	
	//
	// Set the string for up/down searching, make a copy of the strings we search
	// so that the original string on the screen doesn't get munged.
	//
	if (lpfr->Flags & FR_DOWN) {
		lpstrFind = _strdup(lpfr->lpstrFindWhat);
	} else {
		lpstrFind = _strrev(_strdup(lpfr->lpstrFindWhat));
		_strrev(lpstrDoc);
	}
	
	*lpdwSearchOffset = *lpdwSearchOffset;
	
	//
	// Search the document for the find string
	//
	while( bFind )
	{
		if( lpfr->Flags & FR_MATCHCASE )
			lpstrPos = strstr( lpstrDoc + *lpdwSearchOffset, lpstrFind );
		else
			lpstrPos = strstr( CharLower(lpstrDoc) + *lpdwSearchOffset, CharLower(lpstrFind));
		
		if( lpfr->Flags & FR_WHOLEWORD )
		{
			//
			// If there are no words matched, then quit looking for one
			//
			if( lpstrPos == NULL )
			{
				bFind = FALSE;
			} else {
				//
				// if the string was matched, let's see if the next character will make
				// an exact match.  Note, any letter in the alphabet immediately after the last
				// character matched will cause this exact match to fail.
				//
				if(!strspn((lpstrPos + strlen(lpstrFind)), szAlphabet))
				{
					bFind = FALSE;
				} else {
					//
					// Find the current position in the document and the new start offset
					//
					dwPos = lpstrPos - lpstrDoc;
					*lpdwSearchOffset = dwPos + strlen( lpstrFind );
				}
			}
		} else {
			bFind = FALSE;
		}
	}
	
	//
	// Return an error code if the string cannot be found
	//
	if( lpstrPos == NULL ) {
		free(lpstrPtr);
		return( FALSE );
	}
	
	//
	// Find the current position in the document and the new start offset
	// Don't forget, we might have done this in the UP direction.
	//
	dwPos = ( lpfr->Flags & FR_DOWN ) ? lpstrPos - lpstrDoc
		: strlen(lpstrDoc) - (lpstrPos - lpstrDoc) - strlen( lpstrFind );
	*lpdwSearchOffset = dwPos + strlen( lpfr->lpstrFindWhat );
	
	//
	// Select the found text
	//
	SendMessage( hSearch, EM_SETSEL, dwPos, *lpdwSearchOffset );
	SendMessage( hSearch, EM_SCROLLCARET, 0L, 0L );
	SetFocus( hFind );
	free(lpstrPtr);
	return( TRUE );
}

/* *******************************************************************
 *      Function Name:	FindValidText()
 *
 *      Description:
 *
 *      Arguments:	void
 *
 *      Return Value: BOOL
 *
 *      Comments:
 *
 * *****************************************************************/
BOOL FindValidFind( void )
{
	return( *szFindText != '\0' );
}

/* *******************************************************************
 *      Function Name: AppGetWindowsVersion()
 *
 *      Description:	This function returns the version of Windows that the application
 *						is running on plus some platform information.
 *
 *      Arguments:	PTSTR pszEnvirnoment	Options pointer to buffer to receive text string of windows version.
 *					PTSTR pszPlatform		Opitons pointer to buffer to receive text string of platform.
 *
 *      Return Value: LRESULT _stdcall
 *						The return value will be the version and platform information of
 *						the current operating system in the following format:
 *
 *						0xPPPPMMRR where:
 *						MM:   major version of Windows
 *						RR:   minor version (revision) of Windows
 *						PPPP:   the platform the application is running on which
 *								will be one of the following:
 *
 *						#ifdef WIN32
 *							the HIWORD() is RESERVED except for the high bit:
 *							high bit is 0 = Windows NT
 *							high bit is 1 = Win32s/Windows 3.1
 *						#else
 *							0xMMRR = Major and Minor version of [MS-]DOS
 *							GetWinFlags() & 0x8000 = Windows on OS/2 (WLO)
 *							GetWinFlags() & 0x4000 = Windows on Windows NT (WOW)
 *						#endif
 *
 *      Comments:
 *
 * *****************************************************************/
LRESULT _stdcall AppGetWindowsVersion( PTSTR pszEnvironment, PTSTR pszPlatform )
{
	LRESULT lr;
	OSVERSIONINFO  OSVersionInfo;
	
	OSVersionInfo.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
	GetVersionEx(&OSVersionInfo);
	
	// Dummy return value 
	lr = OSVersionInfo.dwPlatformId;
	//
	//  if caller wants the environment string version...
	//
	if (NULL != pszEnvironment)
	{

#ifdef WIN32
		{
			static TCHAR    szFormatVersion[]   = TEXT("%s Version %u.%.2u");
			static TCHAR    szEnvWinNT[]        = TEXT("Windows NT");
			static TCHAR    szEnvWin95[]        = TEXT("Windows 95");
			static TCHAR    szEnvWin32s[]       = TEXT("Win32s");
			TCHAR			szPlatform[15];
			
			switch(OSVersionInfo.dwPlatformId) 
			{
			case VER_PLATFORM_WIN32s:
				_tcscpy(szPlatform,szEnvWin32s);
				break;
			case VER_PLATFORM_WIN32_WINDOWS:
				_tcscpy(szPlatform,szEnvWin95);
				break;
			case VER_PLATFORM_WIN32_NT:
				_tcscpy(szPlatform,szEnvWinNT);
				break;
			}
			
			wsprintf(pszEnvironment, szFormatVersion,
				(LPSTR)(szPlatform),
				OSVersionInfo.dwMajorVersion, 
				OSVersionInfo.dwMinorVersion);
		}
#else
		{
#ifndef WF_WINNT
#define WF_WINNT        0x4000
#define WF_WLO          0x8000
#endif // WIN32

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
			static TCHAR    szProcessorAMD64[]  = TEXT("AMD64 ");
			static TCHAR    szProcessorARM64[]  = TEXT("ARM64 ");
			static TCHAR    szProcessorARM[]  = TEXT("ARM ");
			static TCHAR    szProcessorIA32[]  = TEXT("Intel ");
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
			switch (sysinfo.wProcessorArchitecture)
			{
			#ifdef PROCESSOR_ARCHITECTURE_AMD64
			case PROCESSOR_ARCHITECTURE_AMD64:
				pszProcessor = szProcessorAMD64;
				break;
			#endif

			case PROCESSOR_ARCHITECTURE_INTEL:
				pszProcessor = szProcessorIA32;
				break;

			#ifdef PROCESSOR_ARCHITECTURE_ARM64
			case PROCESSOR_ARCHITECTURE_ARM64:
				pszProcessor = szProcessorARM64;
				break;
			#endif

			#ifdef PROCESSOR_ARCHITECTURE_ARM
			case PROCESSOR_ARCHITECTURE_ARM:
				pszProcessor = szProcessorARM;
				break;
			#endif
				
			case PROCESSOR_ARCHITECTURE_MIPS:
				pszProcessor = szProcessorMIPS;
				break;
				
			case PROCESSOR_ARCHITECTURE_ALPHA:
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
}

/* *******************************************************************
 *      Function Name:	GetInstallationInfo()
 *		Author: Bill Hallahan
 *		Date: October 5, 1994
 *
 *      Description: This function gets the installer name and company from the
 *					 registry.
 *
 *      Arguments:	LPSTR szInstaller	A pointer to a string that will contain the
 *										name provided during installation.         
 *										The returned value will be NULL terminated.
 *                                                              
 *					LPSTR szCompany     A pointer to a string that will contain the
 *										company name provided during installation. 
 *										The returned value will be NULL terminated.
 *
 *      Return Value: static void
 *
 *      Comments:
 *
 * *****************************************************************/

/* moved to coop.h -- ncs 06aug97
#ifndef DEMO
LPSTR szLocalMachineDECtalk =
"SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.40";
#endif
*/

static void GetInstallationInfo( LPSTR szInstaller, LPSTR szCompany )
{
	HKEY hKey;
	DWORD dwType;
	DWORD cbData;
	
#ifndef DEMO
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
#else	/* Fix for license info under Help, About DTdemo menu */
	szInstaller[0] = '\0';
	szCompany[0] = '\0';
#endif /* #ifndef DEMO */
	
	return;
}

/* *******************************************************************
 *      Function Name:	GetApplicationParameters()
 *		Author: Bill Hallahan
 *		Date: October 6, 1994
 *
 *      Description:	This function gets the last window position and show state
 *						in the registry.
 *
 *      Arguments:	int piX			A pointer to an integer that will contain the
 *									X (horizontal) position of the application window.                                                                      
 *					int piY			A pointer to an integer that will contain the 
 *									Y (vertical) position of the application window.                                                     
 *					int piWidth		A pointer to an integer that will contain the 
 *									width of the application window.                               
 *					int piHeight	A pointer to an integer that will contain the 
 *									height of the application window.                           
 *					int piShow		A pointer to an integer that will contain the
 *									show state of the window.                           
 *					char pszFile    A pointer to memory that will contain a NULL  
 *									terminated string of characters. It must be at
 *									least FILESIZE bytes.                         
 *
 *      Return Value: static void
 *
 *      Comments:
 *
 * *****************************************************************/

/* moved to coop.h -- ncs 06aug97
LPSTR szCurrentUsersSpeak =
"Software\\DigitalEquipmentCorporation\\DECtalk\\4.40\\Applications\\Speak";
*/

static void GetApplicationParameters( int * piX, int * piY, int * piWidth,int * piHeight,
									  int * piShow, char * pszFile )
{
	HKEY hKey;
	DWORD dwType;
	DWORD cbData;
	DWORD dwXY;
	DWORD dwWH;
	
	/********************************************************************/
	/*  Open the registry for the application.                          */
	/********************************************************************/
#ifndef DEMO
	if ( RegOpenKeyEx( HKEY_CURRENT_USER,
		szCurrentUsersSpeak,
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
		*piWidth = awWidth;
		*piHeight = awHeight;
		*pszFile = '\0';
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
		/*  Read the former window width and height.                      */
		/******************************************************************/
		
		cbData = 4;
		
		if ( RegQueryValueEx( hKey,
			"Size",
			NULL,
			&dwType,
			(LPBYTE)&dwWH,
			&cbData ) != ERROR_SUCCESS )
		{
			*piWidth = awWidth;
			*piHeight = awHeight;
		}
		else
		{
			*piWidth = dwWH & 0xFFFF;
			*piHeight = ( dwWH >> 16 ) & 0xFFFF;
			
			if ( *piWidth > 32767 )
				*piWidth = awWidth;
			
			if ( *piHeight > 32767 )
				*piHeight = awHeight;
		}
		
		/******************************************************************/
		/*  Read the former file title.                                   */
		/******************************************************************/
		
		cbData = FILESIZE;
		
		if ( RegQueryValueEx( hKey,
			"File",
			NULL,
			&dwType,
			(LPBYTE)pszFile,
			&cbData ) != ERROR_SUCCESS )
		{
			*pszFile = '\0';
		}
		
		/******************************************************************/
		/*  Close the registry.                                           */
		/******************************************************************/
		
		RegCloseKey( hKey );
	}
#else
	*piShow = SW_SHOWNORMAL;
	*piX = 0;
	*piY = 0;
	*piWidth = awWidth;
	*piHeight = awHeight;
	*pszFile = '\0';
#endif
	
	return;
}

/* *******************************************************************
 *      Function Name:	SetApplicationParameters()
 *		Author: Bill Hallahan
 *		Date: October 6, 1994
 *
 *      Description:	This function sets the last window position and show state
 *						in the registry.
 *
 *      Arguments:	HWND hwnd	A handle to the application window
 *                                                              
 *					pszFile		A pointer to memory that contains a NULL
 *								terminated string of characters.
 *
 *      Return Value: static void
 *
 *      Comments:
 *
 * *****************************************************************/
static void SetApplicationParameters( HWND hWnd, char * pszFile )
{
	int iX;
	int iY;
	int iWidth;
	int iHeight;
	int iShow;
	HKEY hKey;
	DWORD cbData;
	DWORD dwXY;
	DWORD dwWH;
	DWORD dwDisposition;
	WINDOWPLACEMENT WindowPlacement;
	
#ifndef DEMO
	/********************************************************************/
	/*  Open the registry for the application.                          */
	/********************************************************************/
	
	if ( RegOpenKeyEx( HKEY_CURRENT_USER,
		szCurrentUsersSpeak,
		0,
		KEY_ALL_ACCESS,
		&hKey ) != ERROR_SUCCESS )
	{
		/******************************************************************/
		/*  The specified key was NOT found in the registry. Create       */
		/*  the registry entries.                                         */
		/******************************************************************/
		
		if ( RegCreateKeyEx( HKEY_CURRENT_USER,
			szCurrentUsersSpeak,
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
		
		/******************************************************************/
		/*  Set the registry entries for the window width and height.     */
		/******************************************************************/
		
		iWidth = WindowPlacement.rcNormalPosition.right
			- WindowPlacement.rcNormalPosition.left;
		
		iHeight = WindowPlacement.rcNormalPosition.bottom
			- WindowPlacement.rcNormalPosition.top;
		
		dwWH = ( iHeight << 16 ) + iWidth;
		
		cbData = 4;
		
		RegSetValueEx( hKey,
			"Size",
			0,
			REG_DWORD,
			(LPBYTE)&dwWH,
			sizeof( DWORD ));
	}
	
	/********************************************************************/
	/*  Set the registry entry for the current file title.              */
	/********************************************************************/
	
	RegSetValueEx( hKey,
		"File",
		0,
		REG_SZ,
		(LPBYTE)pszFile,
		1 + strlen( pszFile ));
	
	/********************************************************************/
	/*  Close the registry.                                             */
	/********************************************************************/
	
	RegCloseKey( hKey );
#endif
	return;
}

/* *******************************************************************
 *      Function Name:	CheckVersion()
 *		Author: Kevin Bruckert
 *
 *      Description:	This function will check the version of the DECTALK.DLL file for
 *						functionality validation.
 *
 *      Arguments:	void
 *                                                              
 *      Return Value: BOOL
 *						TRUE  - Version OK
 *						FALSE - Version BAD
 *
 *      Comments:
 *
 * *****************************************************************/
BOOL CheckVersion(void)
{
	ULONG version;
	char str[200];
	ULONG dt_maj, dt_min, dll_maj, dll_min;
	BOOL DLLDebug = FALSE, SpeakDebug = FALSE;
	
#ifdef _DEBUG
	SpeakDebug = TRUE;
#endif
	
	version = TextToSpeechVersion(&DECtalk_version);
	
	if (version & 0x80000000)	DLLDebug = TRUE;
	dt_maj = (version & 0x7F000000) >> 24;
	dt_min = (version & 0x00FF0000) >> 16;
	dll_maj = (version & 0x0000FF00) >> 8;
	dll_min = (version & 0x000000FF);
	DECtalk_build = version & 0x0000FFFF;
	DECtalk_maj_ver = dt_maj;
	DECtalk_min_ver = dt_min;
//	if (DLLDebug != SpeakDebug) {
//		MessageBox(NULL, "Speak/DLL Debug/Release mismatch", "DECtalk Mismatch", MB_OK | MB_ICONSTOP);
//	}
	// CAB Removed
	/*
	if (dll_maj == DECTALK_DLL_VER) {
		if (dll_min >= DECTALK_CPANEL_DLL_MIN_VER)	CPanel = TRUE;
		if (dll_min >= DECTALK_HIGHLIGHT_DLL_MIN_VER)	Hilite = TRUE;
		return TRUE;
	}
	*/
#ifdef why_check
	if (dll_maj == ACCESS32_DLL_VER)
	{	Typing = TRUE;
		rateMin = ACCESS32_RATE_MIN; // tek 02nov98
		if (dll_min >= ACCESS32_CPANEL_DLL_MIN_VER)	CPanel = TRUE;
		if (dll_min >= ACCESS32_HIGHLIGHT_DLL_MIN_VER)	Hilite = TRUE;
		return TRUE;
	}
	sprintf(str,"Incorrect DECtalk.DLL version\nVersion %d.%02d found, %d.xx expected.",dll_maj,dll_min,ACCESS32_DLL_VER);
	MessageBox(NULL, str, "DECtalk.DLL", MB_OK | MB_ICONSTOP);
	return FALSE;
#else
	Typing = TRUE;
	Hilite = TRUE;
	return TRUE;
#endif
}

/* *******************************************************************
 *      Function Name:	CmdParse()
 *
 *      Description:	Parse command line arguments
 *
 *      Arguments:	LPSTR CmdLine - Command Line List
 *					LPSTR filename - String for file name
 *					LPSTR dictname - Dictionary name
 *                                                              
 *      Return Value: BOOL
 *						0 for continue
 *						1 for program exit
 *
 *      Comments:
 *
 * *****************************************************************/
BOOL CmdParse(LPSTR CmdLine, LPSTR filename, LPSTR dictname)
{
	unsigned int cmdpos = 0;			// Command-line argument offset position
	unsigned int strpos = 0;			// filename/dictname offset position
	BOOL inquote = 0;		// Quote test
	unsigned int string = 0;			// parameter selector (0 = filename, 1 = dictname)
	
	if (!strlen(CmdLine))	return 0;			// Don't parse if no parameters
	
	/*	USAGE parameter */
	
	if (strcmp(CmdLine,"/?") == 0 || strcmp(CmdLine,"-?") == 0) {
		MessageBox( NULL, "Usage: speak [filename] [dictionary_name]", "Usage of Speak", MB_OK);
		return 1;
	}
	
	/*  Backdoor routine */
	if (strcmp(CmdLine,"/SMARTModularTechnologies") == 0) {
		CPanel = TRUE;
		Hilite = TRUE;
		Typing = TRUE;
		return 0;
	}
	
	while (cmdpos < strlen(CmdLine)) {
		if (CmdLine[cmdpos] == ' ' && !inquote) {
			switch (string) {
			case 0:		filename[strpos++] = '\0';
				break;
			case 1:		dictname[strpos++] = '\0';
				break;
			}
			strpos = 0;
			string++;
		} else if (CmdLine[cmdpos] == '\"') {
			if (inquote)	inquote = 0;
			else			inquote = 1;
		} else {
			switch (string) {
			case 0:		filename[strpos++] = CmdLine[cmdpos];
				break;
			case 1:		dictname[strpos++] = CmdLine[cmdpos];
				break;
			}
		}
		cmdpos++;
	}
	switch (string) {
	case 0:		filename[strpos++] = '\0';
		break;
	case 1:		dictname[strpos++] = '\0';
		break;
	}
	return 0;
}

/*
 * ******************************************************************
 *      Function Name:	DrawTeamControl()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *					LPDRAWITEMSTRUCT lpinfo
 *
 *      Return Value: INT
 *
 *      Comments:
 *
 * ******************************************************************
// Easter Egg
INT DrawTeamControl(HWND hWnd, LPDRAWITEMSTRUCT lpInfo)
{
	//	INT  i;
	UINT uiStatus;
	LPBITMAPFILEHEADER   lpbf;
	LPBITMAPINFOHEADER   lpbi;
	LPVOID dibBits;
	
	//  Select our palette into the Device DC
	SelectPalette (lpInfo->hDC, hTeamPalLogical, FALSE);
	
	// Activate palette
	uiStatus = RealizePalette (GetDC(hWnd));
	if (uiStatus == GDI_ERROR)
		return ErrMsg ("Line %d Error = %d\nRealizePalette",__LINE__,GetLastError());
	
	lpbf = easter_egg_DIB;
	lpbi = (LPVOID)((CHAR*)lpbf + sizeof(BITMAPFILEHEADER));
	dibBits = (LPVOID)((CHAR*)lpbf + lpbf->bfOffBits);
	
	// put our DIB on the screen
	SetDIBitsToDevice((HDC)lpInfo->hDC,
		(INT)0, (INT)0,
		(DWORD)lpbi->biWidth,
		(DWORD)lpbi->biHeight,
		(INT)0, (INT)0,
		(UINT)0, (UINT)lpbi->biHeight ,
		(LPVOID)dibBits,
		(LPBITMAPINFO)lpbi, (UINT)DIB_RGB_COLORS);
	
	return(0);
}
*/

/*
 * ******************************************************************
 *      Function Name:	EasterEggProc()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *					UINT uiMsg
 *					WPARAM wParam
 *					LPARAM lParam
 *
 *      Return Value: BOOL APIENTRY
 *
 *      Comments:
 *
 * *******************************************************************
BOOL APIENTRY EasterEggProc( HWND hWnd, UINT uiMsg, WPARAM wParam, LPARAM lParam )
{
	HDC dc = GetDC(hWnd);
	LOGPALETTE  *pPalData;
	HRSRC       hPalRes, hPalData;
	UINT        uiStatus;
	//	LPBITMAPFILEHEADER   lpbf;
	//	LPBITMAPINFOHEADER   lpbi;
	PAINTSTRUCT ps;
	//	LPVOID dibBits;
	//	UINT err;
	static HWND btnwnd;
	static HDC btndc;
	
	switch( uiMsg )
	{
	case WM_INITDIALOG:
		btnwnd = CreateWindow("BUTTON", "",
			WS_CHILD | WS_VISIBLE | BS_OWNERDRAW,
			5,5,
			600, 400,
			hWnd,  NULL, NULL, NULL);
		
		UnrealizeObject(hPalLogical);
		
		hPalRes = FindResource(hInst, "TEAMPALETTE", "MYPALETTE");
		hPalData = LoadResource(NULL, hPalRes);
		pPalData = (LPVOID)((CHAR*)LockResource(hPalData) + 0x14);
		hTeamPalLogical = CreatePalette(pPalData);
		SelectPalette (dc, hTeamPalLogical, FALSE);
		uiStatus = RealizePalette (dc);
		
		return( TRUE );
		
	case WM_QUERYNEWPALETTE:
		SelectPalette (dc, hTeamPalLogical, FALSE);
		uiStatus = RealizePalette (dc);
		return (TRUE);
		
	case WM_PAINT:
		dc = BeginPaint(hWnd, &ps);
		EndPaint(hWnd, &ps);
		return (TRUE);
		
	case WM_DRAWITEM:
	case WM_MEASUREITEM:
		DrawTeamControl(hWnd, (LPDRAWITEMSTRUCT)lParam); // Owner draw stuff
		break;
		
	case WM_PALETTECHANGED:
		UpdateColors(dc);
		return (TRUE);
		
		
	case WM_COMMAND:
		if ( LOWORD( wParam ) == IDOK)	EndDialog( hWnd, ( IDOK == LOWORD( wParam )));
		break;
	default:
		break;
	}
	return( FALSE );
}
*/

/*
 * ******************************************************************
 *      Function Name:	easter_egg()
 *
 *      Description:
 *
 *      Arguments:	void
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * ******************************************************************
void easter_egg(void)
{
	if (dwUse16ColorBitmaps)	return;
	
	easter_egg_DIB = findHdib(IDB_TEAM);
	
	DialogBox( hInst,
		MAKEINTRESOURCE(IDD_EASTEREGG),
		NULL,
		(DLGPROC)EasterEggProc );
	
	return;
}
*/

/* ******************************************************************
 *      Function Name:	TTSCallbackRoutine()
 *
 *      Description:
 *
 *      Arguments:	LONG lParam1
 *					LONG lParam2
 *					DWORD dwInstanceParam
 *					UNINT uiMsg
 *
 *      Return Value: VOID
 *
 *      Comments:
 *
 * *****************************************************************/
VOID TTSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg)
{	
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
			break;
		default:
			break;
	}
}

/* ******************************************************************
 *      Function Name:	update_mark()
 *
 *      Description:
 *
 *      Arguments:	ULONG mark
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void update_mark(ULONG mark)
{
	MARK_POS *next = mark_pos;
	ULONG pos;
	
	if (mark == 0xFFFFFFFFL) {
		PostMessage(DECtalkSpeakWin, EM_SETSEL, (WPARAM)-1, (LPARAM) 0);
		PostMessage(DECtalkSpeakWin, EM_SCROLLCARET, (WPARAM) 0, (LPARAM) 0);
		return;
	}
	if (next == NULL)       return;
	for (pos = 1; pos < mark; pos++) {
		if (next->next_mark == NULL)    return;
		next = next->next_mark;
	}
	if (highlight) {
		PostMessage(DECtalkSpeakWin, EM_SETSEL, (WPARAM)next->start, (LPARAM) next->end);
		PostMessage(DECtalkSpeakWin, EM_SCROLLCARET, (WPARAM) 0, (LPARAM) 0);
	}
	return;
}

/* ******************************************************************
 *      Function Name:	typing_demo()
 *
 *      Description:
 *
 *      Arguments:	HANDLE hinst
 *					HWND hWnd
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void typing_demo(HANDLE hinst, HWND hWnd)
{
	DialogBox( hInst, MAKEINTRESOURCE(IDD_TYPING),
			   hWnd, (DLGPROC)AboutTypingProc );
	return;
}

/* ******************************************************************
 *      Function Name:	AboutTypingProc()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *					UNIT uiMsg
 *					WAPARAM wParam
 *					LPARAM lParam
 *
 *      Return Value: BOOL APIENTRY
 *
 *      Comments:
 *
 * *****************************************************************/
BOOL APIENTRY AboutTypingProc( HWND hWnd, UINT uiMsg, WPARAM wParam, LPARAM lParam )
{
	HWND hDlgItem;
	
	switch( uiMsg )
	{
	case WM_INITDIALOG:
		hDlgItem = GetDlgItem(hWnd, IDC_EDIT1);
		#ifdef _WIN64
		OldTypingDlgProc = GetWindowLongPtr(hDlgItem, GWLP_WNDPROC);
		SetWindowLongPtr(hDlgItem, GWLP_WNDPROC, TypingDlgProc);
		#else
		OldTypingDlgProc = GetWindowLong(hDlgItem, GWL_WNDPROC);
		SetWindowLong(hDlgItem, GWL_WNDPROC, (LONG) TypingDlgProc);
		#endif
		
//		TextToSpeechShutdown(phTTS[tts_select]);
//		TextToSpeechSelectLang(NULL, tts_select);
//		if (TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR | OWN_AUDIO_DEVICE, TTSCallbackRoutine, 0) != MMSYSERR_NOERROR) {
//			MessageBox( hWnd, "DECtalk Software Engine Error", "Startup Error",
//				MB_OK | MB_ICONSTOP );
//			return(FALSE);
//		}
		
		TextToSpeechSpeak(phTTS[tts_select],"[:ra 350]Ready to speak. [:say letter]",TTS_NORMAL);
		return( TRUE );
		
	case WM_COMMAND:
		if ( LOWORD( wParam ) == IDOK )
		{
			TextToSpeechReset(phTTS[tts_select],TRUE);
			TextToSpeechSpeak(phTTS[tts_select],"Thank you.",TTS_FORCE);
//			TextToSpeechSync(phTTS[tts_select]);
//			TextToSpeechShutdown(phTTS[tts_select]);
//			TextToSpeechSelectLang(NULL, tts_select);
//			TextToSpeechStartupEx(&phTTS[tts_select], WAVE_MAPPER, REPORT_OPEN_ERROR, TTSCallbackRoutine, 0);
			TextToSpeechSetRate(phTTS[tts_select],(UINT)current_rate);
			EndDialog( hWnd, ( IDOK == LOWORD( wParam )));
		}
		break;
		
	default:
		break;
	}
	return( FALSE );
}

/* ******************************************************************
 *      Function Name:	TypingDlgProc()
 *
 *      Description:
 *
 *      Arguments:	HWND hWnd
 *					UNIT uiMsg
 *					WAPARAM wParam
 *					LPARAM lParam
 *
 *      Return Value: BOOL APIENTRY
 *
 *      Comments:
 *
 * *****************************************************************/
BOOL APIENTRY TypingDlgProc( HWND hWnd, UINT uiMsg, WPARAM wParam, LPARAM lParam )
{
	//	HWND hDlgItem;
	switch( uiMsg )
	{
		case WM_CHAR:
			TextToSpeechTyping(phTTS[tts_select], wParam);
			break;
		case WM_COMMAND:
			if ( LOWORD( wParam ) == IDOK )
			{
				EndDialog( hWnd, ( IDOK == LOWORD( wParam )));
			}
			break;		
	}
	return CallWindowProc(OldTypingDlgProc, hWnd, uiMsg, wParam, lParam);
}