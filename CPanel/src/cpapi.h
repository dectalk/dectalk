/*******************************
 * Control Panel API Functions *
 * copyright (c) Digital  1996 *
 *******************************
 * Author: Kevin Bruckert      *
 * Created: August 5, 1996     *
 *******************************
 * Revision History            *
 *                             *
 *  08/05/96- 000 KSB          *
 *   Initial Creation          *
 *******************************/

#ifndef _CP_API_HEADER
#define _CP_API_HEADER


/* ID's */
typedef int		CPTAB;	// Control Panel Tab ID
typedef int		CPTBID;	// Track Bar ID
typedef int		CPRBID;	// Radio Box ID
typedef int		CPCBID;	// Check Box ID
typedef int		CPEBID;	// Edit Box ID
typedef int		CPFSID;	// File ID
typedef int		CPBTID;	// Button ID

/* Positioning */
typedef struct {
	ULONG	xPos;		// X-Position
	ULONG	yPos;		// Y-Position
} CPPOS;
typedef CPPOS* LPCPPOS;

typedef struct {
	LPSTR	String;			// String
	CPPOS	Pos;			// Position
} CPTEXT;
typedef CPTEXT* LPCPTEXT;

typedef struct {
	ULONG	*VarPtr;	// Pointer to variable to adjust
	ULONG	Min;		// Minimum selection
	ULONG	Max;		// Maximum selection
	ULONG	Len;		// Length of bar
	CPPOS	Pos;		// Position
	VOID*	CallBackPtr;	// Data for Callback (Passed to callback function)
	void	(*Callback)(VOID*, ULONG*);	// Callback routine
} CPTRACKBAR;
typedef CPTRACKBAR* LPCPTRACKBAR;

typedef struct {
	BOOL*	value;			// Pointer to a BOOL for status
	UCHAR	group;			// Group ID
	BOOL	status;			// 1 = usable, 0 = gray
	LPSTR	title;			// Title to display to right of button
	CPPOS	Pos;			// Position
	VOID*	CallBackPtr;	// Data for Callback (Passed to callback function)
	void	(*Callback)(VOID*, BOOL*,UCHAR);
} CPRADIOBUTTON;
typedef CPRADIOBUTTON* LPCPRADIOBUTTON;

typedef struct {
	BOOL*	value;			// Pointer to a BOOL for status
	BOOL	status;			// 1 = usable, 0 = gray
	LPSTR	title;			// Title to display to right of button
	CPPOS	Pos;			// Position
	VOID*	CallBackPtr;	// Data for Callback (Passed to callback function)
	void	(*Callback)(VOID*, BOOL*);
} CPCHECKBOX;
typedef CPCHECKBOX* LPCPCHECKBOX;

typedef struct {
	LPSTR	String;			// String Pointer
	ULONG	StrLen;			// Max String Length
	ULONG	Len;			// Length
	CPPOS	Pos;			// Position
	VOID*	CallBackPtr;	// Data for Callback (Passed to callback function)
	void	(*Callback)(VOID*, LPSTR);
} CPEDITBOX;
typedef CPEDITBOX* LPCPEDITBOX;

typedef struct {
	LPSTR	Title;			// Title
	BOOL	status;			// Status (1 = enabled / 0 = grayed)
	ULONG	width;			// Width
	ULONG	height;			// Height
	CPPOS	Pos;			// Position
	VOID*	CallBackPtr;	// Data for Callback (Passed to callback function)
	void	(*Callback)(VOID*, LPSTR);
} CPBUTTON;
typedef CPBUTTON* LPCPBUTTON;

typedef struct {
	LPSTR	Filename;		// File Name	(256 chars)
	CPPOS	Pos;			// Position
	CPEDITBOX	edit_box;	// Edit box (RESERVED FOR SYSTEM)
	HWND		editHWND;	// Edit handle
	CPBUTTON	browse;		// Browse button (RESERVED FOR SYSTEM)
	HWND		browseHWND;	// Browse HWND
	VOID*	CallBackPtr;	// Data for Callback (Passed to callback function)
	void	(*Callback)(VOID*, LPSTR);
} CPFILE;
typedef CPFILE* LPCPFILE;


/* Thread Handle */
typedef struct {
	void	*thread_data;		// Thread Pointer (NULL for no CP)
	BOOL	CPAlive;			// Control Panel Alive
	HWND	CPWindow;
	HWND	MainWindow;
	HWND	TabWindow;
	HWND	OKButton;
} CPTHREAD;
typedef CPTHREAD* LPCPTHREAD;

/* Prototypes */

/* Main API functions
 *  CPInitAPI
 *  CPUnitAPI
 *	CPShow
 */

/* CPInitAPI - Initialize a Control Panel API thread
 *  LPCPTHREAD CPInitAPI(void)
 *   Passed: Void
 *   Return: LPCPTHREAD - Pointer to Thread Structure (Needed for ALL CP functions)
 *           NULL on error
 */
LPCPTHREAD CPInitAPI(void);

/* CPUnitAPI - Shut down a Control Panel API thread
 *  void CPUnitAPI(LPCPTHREAD thread)
 *   Passed: LPCPTHREAD thread - Pointer to Thread Structure to close
 *   Return: void
 */
void CPUnitAPI(LPCPTHREAD thread);

/* CPShow - Display the control panel
 *  void CPShow(LPCPTHREAD thread)
 *   Passed: LPCPTHREAD thread - Pointer to Thread Structure
 *   Return: void
 */
void CPShow(LPCPTHREAD thread);



/* Tab regions
 *  CPInitTab
 */

/* CPInitTab - Initialize a Control Panel tab
 *  CPTAB CPInitTab(LPCPTHREAD thread, LPSTR title);
 *   Passed: LPCPTHREAD thread - Pointer to thread structure
 *           LPSTR title - Title of the tab field
 *   Return: CPTAB - Tab ID number / -1 on error
 */
CPTAB CPInitTab(LPCPTHREAD thread, LPSTR title);



/* Text
 *  CPText
 */

/* CPText - Display a text string
 *  BOOL CPText(LPCPTHREAD thread, CPTAB tab, LPCPTEXT text)
 *   Passed: LPCPTHREAD thread - Thread Structure
 *           CPTAB tab - Tab ID
 *           LPCPTEXT text - Pointer to text structure
 *   Return: BOOL - 0 = success / 1 = failure
 */
BOOL CPText(LPCPTHREAD thread, CPTAB tab, LPCPTEXT text);




/* Trackbars
 *  CPRegisterTB
 *  CPUpdateTB
 */

/* CPRegisterTB - Register a trackbar for use
 *  CPTBID CPRegisterTB(LPCPTHREAD thread, CPTAB tab, LPCPTRACKBAR trackbar)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPTAB tab - Tab page
 *           LPCPTRACKBAR trackbar - Trackbar Structure
 *   Return: CPTBID - Trackbar ID / -1 = error
 */
CPTBID CPRegisterTB(LPCPTHREAD thread, CPTAB tab, LPCPTRACKBAR trackbar);

/* CPUpdateTB - Update the trackbar information
 *  BOOL CPUpdateTB(LPCPTHREAD thread, CPTBID id, ULONG pos)
 *   Passed: LPCPTHREAD thread - Thread
 *           CPTBID id - Trackbar ID
 *           ULONG pos - New position
 *   Return: BOOL - 0 = success / 1 = error
 */
BOOL CPUpdateTB(LPCPTHREAD thread, CPTBID id, ULONG pos);



/* Checkboxes
 *  CPRegisterCB
 *  CPUpdateCB
 */

/* CPRegisterCB - Register a checkbox for use
 *  CPCBID CPRegisterCB(LPCPTHREAD thread, CPTAB tab, LPCPCHECKBOX check)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPTAB tab - Tab page
 *           LPCPCHECKBOX check - Checkbox Structure
 *   Return: CPCBID - Checkbox ID / -1 = error
 */
CPCBID CPRegisterCB(LPCPTHREAD thread, CPTAB tab, LPCPCHECKBOX check);

/* CPSetCB - Set a checkbox
 *  BOOL CPSetCB(LPCPTHREAD thread, CPCBID cbid)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPCBID - Checkbox ID
 *   Return: 0 = error / 1 = success
 */
BOOL CPSetCB(LPCPTHREAD thread, CPCBID cbid);

/* CPClearCB - Clear a checkbox
 *  BOOL CPClearCB(LPCPTHREAD thread, CPCBID cbid)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPCBID - Checkbox ID
 *   Return: 0 = error / 1 = success
 */
BOOL CPClearCB(LPCPTHREAD thread, CPCBID cbid);

/* CPStateCB - Set/Get the sate of a checkbox
 *  BOOL CPStateCB(LPCPTHREAD thread, CPCBID cbid, int state)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPCBID - Checkbox ID
 *           int state - State to set checkbox (2 = get state)
 *   Return: 0 = error / 1 = success
 */
BOOL CPStateCB(LPCPTHREAD thread, CPCBID cbid, int state);



/* Radio Buttons
 *  CPRegisterRB
 *  CPSetRB
 *  CPStateRB
 */

/* CPRegisterRB - Register a radio button for use
 *  CPRBID CPRegisterRB(LPCPTHREAD thread, CPTAB tab, LPCPRADIOBUTTON radio)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPTAB tab - Tab page
 *           LPCPRADIOBUTTON radio - Radio Button Structure
 *   Return: CPRBID - Radio Button ID / -1 = error
 */
CPRBID CPRegisterRB(LPCPTHREAD thread, CPTAB tab, LPCPRADIOBUTTON radio);

/* CPSetRB - Set a Radio Button
 *  BOOL CPSetRB(LPCPTHREAD thread, CPRBID rbid)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPRBID - Radio Button ID
 *   Return: 0 = error / 1 = success
 */
BOOL CPSetRB(LPCPTHREAD thread, CPRBID rbid);

/* CPStateRB - Set/Get the sate of a Radio Button
 *  BOOL CPStateRB(LPCPTHREAD thread, CPRBID rbid, int state)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPRBID rbid - Radio Button ID
 *           int state - State to set radio button (2 = get state)
 *   Return: 0 = error / 1 = success
 */
BOOL CPStateRB(LPCPTHREAD thread, CPRBID rbid, int state);



/* Edit Box
 *  CPRegisterEB
 *  CPUpdateEB
 */

/* CPRegisterEB - Register an Edit Box
 *  CPEBID CPRegisterRB(LPCPTHREAD thread, CPTAB tab, LPCPEDITBOX edit)
 *   Passed: LPCPTHREAD thread - CP Thread
 *           CPTAB tab - Tab ID
 *           LPCPEDITBOX edit - Pointer to Edit Box Structure
 *   Return: CPEBID - Edit Box ID / -1 on error
 */
CPEBID CPRegisterEB(LPCPTHREAD thread, CPTAB tab, LPCPEDITBOX edit);

/* CPUpdateEB - Update an Edit Box
 *  BOOL CPUpdateEB(LPCPTHREAD thread, CPEBID id, LPSTR string)
 *   Passed: LPCPTHREAD thread - Main Thread
 *           CPEBID id - Edit Box ID
 *           LPSTR string - New string to copy
 *   Return: BOOL - 0 = success / 1 = error
 */
BOOL CPUpdateEB(LPCPTHREAD thread, CPEBID id, LPSTR string);



/* File Selector
 *  CPRegisterFS
 *  CPUpdateEB
 */

/* CPRegisterFS - Register a File Selector
 *  CPFSID CPRegisterFS(LPCPTHREAD thread, CPTAB tab, LPCPFILE file)
 *   Passed: LPCPTHREAD thread - Main thread
 *           CPTAB tab - Tab ID
 *           LPCPFILE file - Pointer to File Selector structure
 *   Return: CPFSID - File Selector ID / -1 on error
 */
CPFSID CPRegisterFS(LPCPTHREAD thread, CPTAB tab, LPCPFILE file);

/* CPUpdateFS - Update the file selector
 *  BOOL CPUpdateFS(LPCPTHREAD thread, CPFSID id, LPSTR string)
 *   Passed: LPCPTHREAD thread - Main thread
 *           CPFSID id - File Selector ID
 *           LPSTR string - New file name
 *   Return: BOOL - 0 = success / 1 = error
 */
BOOL CPUpdateFS(LPCPTHREAD thread, CPFSID id, LPSTR string);



/* Buttons
 *  CPRegisterBT
 *  CPStateBT
 */

/* CPRegisterBT - Register a button
 *  CPBTID CPRegisterBT(LPCPTHREAD thread, CPTAB tab, LPCPBUTTON button)
 *   Passed: LPCPTHREAD thread - Main thread
 *           CPTAB tab - Tab ID
 *           LPCPBUTTON button - Pointer to Button structure
 *   Return: CPBTID - Button ID / -1 on error
 */
CPBTID CPRegisterBT(LPCPTHREAD thread, CPTAB tab, LPCPBUTTON button);

/* CPStateBT - Set the state of a button
 *  BOOL CPStateBT(LPCPTHREAD thread, CPBTID id, int state)
 *   Passed: LPCPTHREAD thread - Main thread
 *           CPBTID id - Button ID
 *           int state - State (2 = get state)
 *   Return: BOOL - State (0 = disabled/1=enabled)
 */
BOOL CPStateBT(LPCPTHREAD thread, CPBTID id, int state);

#endif
