/******************************************************************************\
*       ttstst.h
*
*       Header file for CTTStstApp
*
*       This code and information is provided "as is" without warranty
*       of any kind, either expressed or implied, including but not
*       limited to the implied warranties of merchantability and/or
*       fitness for a particular purpose.
*
*       Copyright (C) 1995 Microsoft Corporation.  All Rights Reserved.
*
\******************************************************************************/

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#define MAX_ENUMMODES 80
#define MAX_LANGUAGES 27
#define MAX_NAMELEN   30	// number of characters in the name excluding the path info
#define ATTR_NAMELEN  60    // length of SCHARs in the ITTSAttributes struct
#define ID_TIMERPOSTRACK 1  // ID of the ITTSCentral posisition tracking control

#define CursorWait	saveCur = SetCursor( waitCur )  // BUGBUG: Use MFC functions?
#define CursorGo	SetCursor( saveCur )

typedef struct
{
	BOOL bAttribChanged;
	BOOL bAudioStart;
	BOOL bAudioStop;
	BOOL bVisual;
	BOOL bBookMark;
	BOOL bTextDataDone;
	BOOL bTextDataStarted;
	BOOL bWordPosition;
} ITTSNotify_t;

typedef struct
{
	BOOL        bPaused;
	BOOL        bPosTracking;
	ITTSNotify_t Not;
} EngData_t;

typedef EngData_t  *PENGDATA;

extern PENGDATA  gpEng;                   	// global pointer to current engine data struct
extern PITTSCENTRAL	gpITTSCentral;				// global pointer to Central interface
extern PITTSATTRIBUTES gpITTSAttributes;		// global attributes interface pointer
extern PITTSDIALOGS	gpITTSDialogs;				// global dialogs interface pointer
extern PILEXPRONOUNCE	gpILexPronounce;		// global lex pronounce interface pointer

extern int gnmodes;                        	// the total number of enumerated modes
extern int gnListModes;                    	// the total number of selected modes


/////////////////////////////////////////////////////////////////////////////
// CTTStstApp:
// See ttstst.cpp for the implementation of this class
//

class CTTStstApp : public CWinApp
{
public:
	CTTStstApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTTStstApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CTTStstApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////
