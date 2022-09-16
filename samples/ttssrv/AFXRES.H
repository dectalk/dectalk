// Microsoft Foundation Classes C++ library.
// Copyright (C) 1992 Microsoft Corporation,
// All rights reserved.

// This source code is only intended as a supplement to the
// Microsoft Foundation Classes Reference and Microsoft
// QuickHelp and/or WinHelp documentation provided with the library.
// See these sources for detailed information regarding the
// Microsoft Foundation Classes product.

#ifndef __AFXRES_H__
#define __AFXRES_H__

#define _AFXRES    1            // this is an MFC project

#ifdef RC_INVOKED
#ifndef _INC_WINDOWS
#define _INC_WINDOWS
#include "winres.h"            // extract from windows header
#endif
#endif

#ifdef APSTUDIO_INVOKED
#define APSTUDIO_HIDDEN_SYMBOLS
#endif

/////////////////////////////////////////////////////////////////////////////
// MFC resource types (see Technical note TN024 for implementation details)

#ifdef RC_INVOKED
#define DLGINIT     240
#else
#define RT_DLGINIT  MAKEINTRESOURCE(240)
#endif

#define WM_VBXINIT      (WM_USER+0)

/////////////////////////////////////////////////////////////////////////////

#ifdef APSTUDIO_INVOKED
#undef APSTUDIO_HIDDEN_SYMBOLS
#endif

/////////////////////////////////////////////////////////////////////////////
// General style bits etc

// ControlBar styles
#define CBRS_NOALIGN        0x00000000L
#define CBRS_LEFT           0x00001400L     // align on left, line on right
#define CBRS_TOP            0x00002800L     // align on top, line on bottom
#define CBRS_RIGHT          0x00004100L     // align on right, line on left
#define CBRS_BOTTOM         0x00008200L     // align on bottom, line on top

/////////////////////////////////////////////////////////////////////////////
// Standard window components

// Mode indicators in status bar - these are routed like commands
#define ID_INDICATOR_EXT                0xE700  // extended selection indicator
#define ID_INDICATOR_CAPS               0xE701  // cap lock indicator
#define ID_INDICATOR_NUM                0xE702  // num lock indicator
#define ID_INDICATOR_SCRL               0xE703  // scroll lock indicator
#define ID_INDICATOR_OVR                0xE704  // overtype mode indicator
#define ID_INDICATOR_REC                0xE705  // record mode indicator

#define ID_SEPARATOR                    0   // special separator value


#ifndef RC_INVOKED  // code only
// Standard control bars (IDW = window ID)
#define AFX_IDW_CONTROLBAR_FIRST 0xE800
#define AFX_IDW_CONTROLBAR_LAST 0xE8FF

#define AFX_IDW_TOOLBAR                 0xE800  // main Toolbar for window
#define AFX_IDW_STATUS_BAR              0xE801  // Status bar window
#define AFX_IDW_PREVIEW_BAR             0xE802  // PrintPreview Dialog Bar

// Macro for mapping standard control bars to bitmask (limit of 32)
#define AFX_CONTROLBAR_MASK(nIDC)   (1L << (nIDC - AFX_IDW_CONTROLBAR_FIRST))

// parts of Main Frame
#define AFX_IDW_PANE_FIRST              0xE900  // first pane (256 max)
#define AFX_IDW_PANE_LAST               0xE9ff
#define AFX_IDW_HSCROLL_FIRST           0xEA00  // first Horz scrollbar (16 max)
#define AFX_IDW_VSCROLL_FIRST           0xEA10  // first Vert scrollbar (16 max)

#define AFX_IDW_SIZE_BOX                0xEA20  // size box for splitters
#define AFX_IDW_PANE_SAVE               0xEA21  // to shift AFX_IDW_PANE_FIRST
#endif //!RC_INVOKED

#ifndef APSTUDIO_INVOKED
// common style for form views
#define AFX_WS_DEFAULT_VIEW             (WS_CHILD | WS_VISIBLE | WS_BORDER)
#endif

/////////////////////////////////////////////////////////////////////////////
// Standard app configurable strings

// for application title (defaults to EXE name or name in constructor)
#define AFX_IDS_APP_TITLE               0xE000
// idle message bar line
#define AFX_IDS_IDLEMESSAGE             0xE001
// message bar line when in shift-F1 help mode
#define AFX_IDS_HELPMODEMESSAGE         0xE002

/////////////////////////////////////////////////////////////////////////////
// Standard Commands



// Window commands
#define ID_WINDOW_NEW                   0xE130
#define ID_WINDOW_ARRANGE               0xE131
#define ID_WINDOW_CASCADE               0xE132
#define ID_WINDOW_TILE_HORZ             0xE133
#define ID_WINDOW_TILE_VERT             0xE134
#define ID_WINDOW_SPLIT                 0xE135
#ifndef RC_INVOKED      // code only
#define AFX_IDM_WINDOW_FIRST            0xE130
#define AFX_IDM_WINDOW_LAST             0xE13F
#define AFX_IDM_FIRST_MDICHILD          0xFF00  // window list starts here
#endif //!RC_INVOKED

// Help and App commands
#define ID_APP_ABOUT                    0xE140
#define ID_APP_EXIT                     0xE141
#define ID_HELP_INDEX                   0xE142
#define ID_HELP_USING                   0xE143
#define ID_CONTEXT_HELP                 0xE144      // shift-F1
// special commands for processing help
#define ID_HELP                         0xE145      // first attempt for F1
#define ID_DEFAULT_HELP                 0xE146      // last attempt

// Misc
#define ID_NEXT_PANE                    0xE150
#define ID_PREV_PANE                    0xE151

// OLE commands
#define ID_OLE_INSERT_NEW               0xE200
#define ID_OLE_EDIT_LINKS               0xE201
#define ID_OLE_VERB_FIRST               0xE210     // range - 16 max
#ifndef RC_INVOKED      // code only
#define ID_OLE_VERB_LAST                0xE21F
#endif //!RC_INVOKED

// for print preview dialog bar
#define AFX_ID_PREVIEW_CLOSE            0xE300
#define AFX_ID_PREVIEW_NUMPAGE          0xE301      // One/Two Page button
#define AFX_ID_PREVIEW_NEXT             0xE302
#define AFX_ID_PREVIEW_PREV             0xE303
#define AFX_ID_PREVIEW_PRINT            0xE304
#define AFX_ID_PREVIEW_ZOOMIN           0xE305
#define AFX_ID_PREVIEW_ZOOMOUT          0xE306

// View commands (same number used as IDW used for control bar)
#define ID_VIEW_TOOLBAR                 0xE800
#define ID_VIEW_STATUS_BAR              0xE801
	// -> E8FF reserved for other control bar commands

/////////////////////////////////////////////////////////////////////////////
// Standard control IDs

#define IDC_STATIC              -1      // all static controls

/////////////////////////////////////////////////////////////////////////////
// Standard string error/warnings

#ifndef RC_INVOKED      // code only
#define AFX_IDS_SCFIRST                 0xEF00
#endif //!RC_INVOKED

#define AFX_IDS_SCSIZE                  0xEF00
#define AFX_IDS_SCMOVE                  0xEF01
#define AFX_IDS_SCMINIMIZE              0xEF02
#define AFX_IDS_SCMAXIMIZE              0xEF03
#define AFX_IDS_SCNEXTWINDOW            0xEF04
#define AFX_IDS_SCPREVWINDOW            0xEF05
#define AFX_IDS_SCCLOSE                 0xEF06
#define AFX_IDS_SCRESTORE               0xEF12
#define AFX_IDS_SCTASKLIST              0xEF13

#define AFX_IDS_MDICHILD                0xEF1F


// General strings
#define AFX_IDS_OPENFILE                0xF000
#define AFX_IDS_SAVEFILE                0xF001
#define AFX_IDS_ALLFILTER               0xF002
#define AFX_IDS_UNTITLED                0xF003

// Printing and print preview strings
#define AFX_IDS_PRINTONPORT             0xF040
#define AFX_IDS_ONEPAGE                 0xF041
#define AFX_IDS_TWOPAGE                 0xF042
#define AFX_IDS_PRINTPAGENUM            0xF043
#define AFX_IDS_PREVIEWPAGEDESC         0xF044

// OLE strings
#define AFX_IDS_OBJECT_MENUITEM         0xF080
#define AFX_IDS_EDIT_VERB               0xF081
#define AFX_IDS_ACTIVATE_VERB           0xF082
#define AFX_IDS_CHANGE_LINK             0xF083
#define AFX_IDS_AUTO                    0xF084
#define AFX_IDS_MANUAL                  0xF085
#define AFX_IDS_FROZEN                  0xF086
#define AFX_IDS_ALL_FILES               0xF087
	// dynamically changing menu items
#define AFX_IDS_SAVE_MENU               0xF088
#define AFX_IDS_UPDATE_MENU             0xF089
#define AFX_IDS_SAVE_AS_MENU            0xF08A
#define AFX_IDS_SAVE_COPY_AS_MENU       0xF08B


// General error / prompt strings
#define AFX_IDP_INVALID_FILENAME        0xF100
#define AFX_IDP_FAILED_TO_OPEN_DOC      0xF101
#define AFX_IDP_FAILED_TO_SAVE_DOC      0xF102
#define AFX_IDP_ASK_TO_SAVE             0xF103
#define AFX_IDP_FAILED_TO_CREATE_DOC    0xF104
#define AFX_IDP_FILE_TOO_LARGE          0xF105
#define AFX_IDP_FAILED_TO_START_PRINT   0xF106
#define AFX_IDP_FAILED_TO_LAUNCH_HELP   0xF107
#define AFX_IDP_INTERNAL_FAILURE        0xF108      // general failure
#define AFX_IDP_COMMAND_FAILURE         0xF109      // command failure
#define AFX_IDP_VB2APICALLED            0xF10A

// DDV parse errors
#define AFX_IDP_PARSE_INT               0xF110
#define AFX_IDP_PARSE_REAL              0xF111
#define AFX_IDP_PARSE_INT_RANGE         0xF112
#define AFX_IDP_PARSE_REAL_RANGE        0xF113
#define AFX_IDP_PARSE_STRING_SIZE       0xF114

// CFile/CArchive error strings for user failure
#define AFX_IDP_FAILED_INVALID_FORMAT   0xF120
#define AFX_IDP_FAILED_INVALID_PATH     0xF121
#define AFX_IDP_FAILED_DISK_FULL        0xF122
#define AFX_IDP_FAILED_ACCESS_READ      0xF123
#define AFX_IDP_FAILED_ACCESS_WRITE     0xF124
#define AFX_IDP_FAILED_IO_ERROR_READ    0xF125
#define AFX_IDP_FAILED_IO_ERROR_WRITE   0xF126

// OLE errors / prompt strings
#define AFX_IDP_STATIC_OBJECT           0xF180
#define AFX_IDP_FAILED_TO_CONNECT       0xF181
#define AFX_IDP_SERVER_BUSY             0xF182
#define AFX_IDP_BAD_VERB                0xF183
#define AFX_IDP_FAILED_MEMORY_ALLOC     0xF184
#define AFX_IDP_FAILED_TO_NOTIFY        0xF185
#define AFX_IDP_FAILED_TO_LAUNCH        0xF186
#define AFX_IDP_ASK_TO_UPDATE           0xF187
#define AFX_IDP_FAILED_TO_UPDATE        0xF188
#define AFX_IDP_FAILED_TO_REGISTER      0xF189
#define AFX_IDP_FAILED_TO_AUTO_REGISTER 0xF18A

// 0xf200-0xf20f reserved for use by VBX library code

/////////////////////////////////////////////////////////////////////////////
// AFX implementation - control IDs (AFX_IDC)

// Parts of dialogs
#define AFX_IDC_LISTBOX         100
#define AFX_IDC_CHANGE          101
// Links dialog
#define AFX_IDC_AUTO            201
#define AFX_IDC_MANUAL          202
#define AFX_IDC_VERB1           203
#define AFX_IDC_VERB2           204
#define AFX_IDC_FREEZE          205
#define AFX_IDC_UPDATE          206

// for print dialog
#define AFX_IDC_PRINT_DOCNAME   201
#define AFX_IDC_PRINT_PRINTERNAME 202
#define AFX_IDC_PRINT_PORTNAME  203
#define AFX_IDC_PRINT_PAGENUM   204

/////////////////////////////////////////////////////////////////////////////
// IDRs for standard components

// AFX standard ICON IDs (for MFC V1 apps)
#define AFX_IDI_STD_MDIFRAME            1
#define AFX_IDI_STD_FRAME               2

#ifndef RC_INVOKED  // code only
// These are really COMMDLG dialogs, so there usually isn't a resource
// for them, but these IDs are used as help IDs.
#define AFX_IDD_FILEOPEN                28676
#define AFX_IDD_FILESAVE                28677
#define AFX_IDD_FONT                    28678
#define AFX_IDD_COLOR                   28679
#define AFX_IDD_PRINT                   28680
#define AFX_IDD_PRINTSETUP              28681
#define AFX_IDD_FIND                    28682
#define AFX_IDD_REPLACE                 28683
#endif //!RC_INVOKED

// Standard dialogs app should leave alone (0x7801->)
#define AFX_IDD_NEWTYPEDLG              30721
#define AFX_IDD_PRINTDLG                30722
#define AFX_IDD_PREVIEW_TOOLBAR         30723
#define AFX_IDD_OLEINSERT               30724
#define AFX_IDD_OLELINKS                30725

// Standard cursors (0x7901->)
	// AFX_IDC = Cursor resources
#define AFX_IDC_CONTEXTHELP             30977       // context sensitive help
#define AFX_IDC_MAGNIFY                 30978       // print preview zoom
#define AFX_IDC_SMALLARROWS             30979       // splitter
#define AFX_IDC_HSPLITBAR               30980       // splitter
#define AFX_IDC_VSPLITBAR               30981       // splitter
#define AFX_IDC_NODROPCRSR              30982       // No Drop Cursor

/////////////////////////////////////////////////////////////////////////////
#endif //__AFXRES_H__
