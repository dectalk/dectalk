/*******************************
 * Control Panel API Functions *
 * copyright (c) Digital  1996 *
 *******************************
 * Author: Kevin Bruckert      *
 * Created: August 5, 1996     *
 *******************************
 * Revision History            *
 *                             *
 *  08/06/96- 000 KSB          *
 *   Initial Creation          *
 *******************************/

#ifndef _CPANEL_HEADER
#define _CPANEL_HEADER

#include "cpapi.h"

#define	CP_TEXT			1
#define	CP_RADIO		2
#define	CP_CHECK		3
#define	CP_TRACKBAR		4
#define	CP_EDIT			5
#define CP_FILE			6
#define	CP_BUTTON		7

typedef struct STRUCT_TAB_DATA {
	HWND	wnd;		// Handle to window
	UCHAR	data_type;	// Data type (Text, Radio Button, Check Box, Trackbar)
	union {
		LPCPTEXT		text;
		LPCPTRACKBAR	trackbar;
		LPCPRADIOBUTTON	radio;
		LPCPCHECKBOX	checkbox;
		LPCPEDITBOX		edit;
		LPCPFILE		file;
		LPCPBUTTON		button;
	};
	int		id;			// ID
	struct STRUCT_TAB_DATA *next_item;	// Next object
} CPTABDATA;
typedef CPTABDATA* LPCPTABDATA;

typedef struct STRUCT_TAB_FIELDS {
	LPSTR		Name;						// Tab field name
	LPCPTABDATA	data;						// Tab data
	struct STRUCT_TAB_FIELDS	*next_tab;	// Next tab
} CPTABFIELDS;
typedef CPTABFIELDS* LPCPTABFIELDS;

/* Prototypes */
BOOL CPopenwindow(LPCPTHREAD thread);
void CPBrowseCallback(VOID* vfilter, LPSTR title);
void CPUpdateAll(LPCPTHREAD thread);

/* LibMain */
BOOL APIENTRY LibMain( HANDLE hInst,
			  DWORD ul_reason_being_called,
			  LPVOID lpReserved );

#endif
