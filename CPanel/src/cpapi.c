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

#include <windows.h>
#include <process.h>
#include <commctrl.h>
#include <stdarg.h>

#include "cpapi.h"
#include "cpanel.h"


/* Main API functions
 *  CPInitAPI
 *  CPUnitAPI
 *  CPShow
 */

/* CPInitAPI - Initialize a Control Panel API thread
 *  LPCPTHREAD CPInitAPI(void)
 *   Passed: Void
 *   Return: LPCPTHREAD - Pointer to Thread Structure (Needed for ALL CP functions)
 *           NULL on error
 */
LPCPTHREAD CPInitAPI(void) {
	LPCPTHREAD	thread;
	LPCPTEXT	textptr;
	CPTAB		tab;

	if ((thread = malloc(sizeof(CPTHREAD))) == NULL) {	// Allocate thread data
		return NULL;									// Can't allocate memory
	}
	if ((textptr = malloc(sizeof(CPTEXT))) == NULL) {	// Allocate text data
		free(thread);									// Free thread
		return NULL;									// Can't allocate memory
	}

	thread->thread_data = (void*) NULL;					// Clear CP
	thread->CPAlive = FALSE;

	textptr->String = "DECtalk Control Panel  v1.0";
	textptr->Pos.xPos = 50;
	textptr->Pos.yPos = 50;
	
	/* Create the ABOUT tab */
	tab = CPInitTab(thread,"About");
	CPText(thread, tab, textptr);

	return thread;
}

/* CPUnitAPI - Shut down a Control Panel API thread
 *  void CPUnitAPI(LPCPTHREAD thread)
 *   Passed: LPCPTHREAD thread - Pointer to Thread Structure to close
 *   Return: void
 */
void CPUnitAPI(LPCPTHREAD thread) {
	LPCPTABFIELDS	tabs, next_tab;
	LPCPTABDATA		data, next;

	if (thread == NULL)	return;							// No CP to free
	DestroyWindow(thread->MainWindow);
	tabs = (LPCPTABFIELDS) thread->thread_data;			// Assign to tabs
	while (tabs != NULL) {								// Clear all tabs
		data = tabs->data;									// Assign to tab data
		while (data != NULL) {								// Clear all tab data
			next = data->next_item;								// Assign to next tab data
			free(data);
			data = next;
		}
		next_tab = tabs->next_tab;						// Next tab
		free(tabs);
		tabs = next_tab;
	}
	free(thread);
	return;
}

/* CPShow - Display the control panel
 *  void CPShow(LPCPTHREAD thread)
 *   Passed: LPCPTHREAD thread - Pointer to Thread Structure
 *   Return: void
 */
void CPShow(LPCPTHREAD thread) {
	CPopenwindow(thread);
	return;
}



/* Tab regions
 *  CPInitTab
 */

/* CPInitTab - Initialize a Control Panel tab
 *  CPTAB CPInitTab(LPCPTHREAD thread, LPSTR title);
 *   Passed: LPCPTHREAD thread - Pointer to thread structure
 *           LPSTR title - Title of the tab field
 *   Return: CPTAB - Tab ID number / -1 on error
 */
CPTAB CPInitTab(LPCPTHREAD thread, LPSTR title) {
	LPCPTABFIELDS tab, tabseek;
	int id = 0;

	if (thread == NULL)				return -1;				// Bad thread

	if ((tab = malloc(sizeof(CPTABFIELDS))) == NULL)	return -1;	// Cannot malloc

	/* Place tab structure in array */
	tabseek = (LPCPTABFIELDS) thread->thread_data;
	if (tabseek == NULL) {					// No tab fields
		thread->thread_data = (void*) tab;
	} else {								// Seek to end of fields
		while (tabseek->next_tab != NULL) {
			id++;
			tabseek = tabseek->next_tab;
		}
		id++;
		tabseek->next_tab = tab;
	}

	/* Assign tab data */
	tab->Name = title;
	tab->data = NULL;
	tab->next_tab = (LPCPTABFIELDS) NULL;

	return id;
}



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
BOOL CPText(LPCPTHREAD thread, CPTAB tab, LPCPTEXT text) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int				id = tab;

	if (thread == NULL)		return 1;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return 1;
	while (id) {
		if (tabs->next_tab == NULL)	return 1;		// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	data = tabs->data;
	if (data == NULL) {
		if ((tabs->data = malloc(sizeof(CPTABDATA))) == NULL)		return 1;
		data = tabs->data;
	} else {
		while (data->next_item != NULL)	data = data->next_item;
		if ((data->next_item = malloc(sizeof(CPTABDATA))) == NULL)	return 1;
		data = data->next_item;
	}

	data->data_type = CP_TEXT;
	data->text = text;
	data->next_item = NULL;
	data->wnd = NULL;
	return 0;
}

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
CPTBID CPRegisterTB(LPCPTHREAD thread, CPTAB tab, LPCPTRACKBAR trackbar) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int				id = tab;

	if (thread == NULL)		return -1;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return -1;
	while (id) {
		if (tabs->next_tab == NULL)	return -1;		// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL) {
		if ((tabs->data = malloc(sizeof(CPTABDATA))) == NULL)		return -1;
		data = tabs->data;
	} else {
		while (data->next_item != NULL) {
			data = data->next_item;
			id++;
		}
		if ((data->next_item = malloc(sizeof(CPTABDATA))) == NULL)	return -1;
		data = data->next_item;
		id++;
	}

	data->data_type = CP_TRACKBAR;
	data->trackbar = trackbar;
	data->next_item = NULL;
	data->wnd = NULL;
	data->id = (tab << 8) + id;

	CPUpdateAll(thread);
	return (tab << 8) + id;
}

/* CPUpdateTB - Update the trackbar information
 *  BOOL CPUpdateTB(LPCPTHREAD thread, CPTBID id, ULONG pos)
 *   Passed: LPCPTHREAD thread - Thread
 *           CPTBID id - Trackbar ID
 *           ULONG pos - New position
 *   Return: BOOL - 0 = success / 1 = error
 */
BOOL CPUpdateTB(LPCPTHREAD thread, CPTBID id, ULONG pos) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int				tab = (id >> 8);
	int				dta = id;

	if (thread == NULL)				return 1;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)				return 1;
	while (id) {
		if (tabs->next_tab == NULL)	return 1;		// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	data = tabs->data;
	while (data->id != dta) {
		if (data->next_item == NULL)	return 1;	// Bad TRACK ID
		data = data->next_item;
	}
	if (data->data_type != CP_TRACKBAR)	return 1;	// Bad TRACK ID
	*(data->trackbar->VarPtr) = pos;
	if (data->trackbar->Callback != NULL)	data->trackbar->Callback(data->trackbar->CallBackPtr, data->trackbar->VarPtr);
	CPUpdateAll(thread);
	return 0;
}



/* Checkboxes
 *  CPRegisterCB
 *  CPSetCB
 *  CPClearCB
 *  CPStateCB
 */

/* CPRegisterCB - Register a checkbox for use
 *  CPCBID CPRegisterCB(LPCPTHREAD thread, CPTAB tab, LPCPCHECKBOX check)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPTAB tab - Tab page
 *           LPCPCHECKBOX check - Checkbox Structure
 *   Return: CPCBID - Checkbox ID / -1 = error
 */
CPCBID CPRegisterCB(LPCPTHREAD thread, CPTAB tab, LPCPCHECKBOX check) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int				id = tab;

	if (thread == NULL)		return -1;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return -1;
	while (id) {
		if (tabs->next_tab == NULL)	return -1;		// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL) {
		if ((tabs->data = malloc(sizeof(CPTABDATA))) == NULL)		return -1;
		data = tabs->data;
	} else {
		while (data->next_item != NULL) {
			data = data->next_item;
			id++;
		}
		if ((data->next_item = malloc(sizeof(CPTABDATA))) == NULL)	return -1;
		data = data->next_item;
		id++;
	}

	data->data_type = CP_CHECK;
	data->checkbox = check;
	data->next_item = NULL;
	data->wnd = NULL;
	data->id = (tab << 8) + id;

	CPUpdateAll(thread);
	return (tab << 8) + id;
}

/* CPSetCB - Set a checkbox
 *  BOOL CPSetCB(LPCPTHREAD thread, CPCBID cbid)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPCBID - Checkbox ID
 *   Return: 0 = error / 1 = success
 */
BOOL CPSetCB(LPCPTHREAD thread, CPCBID cbid) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int id = cbid >> 8;

	if (thread == NULL)		return 0;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return 0;
	while (id) {
		if (tabs->next_tab == NULL)		return 0;	// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL)					return 0;	// Bad Data Field
	while (data->id != cbid) {
		if (data->next_item == NULL)	return 0;	// Bad Data ID
		data = data->next_item;
	}

	if (data->data_type != CP_CHECK)	return 0;	// Bad item
	*(data->checkbox->value) = 1;
	if (data->checkbox->Callback != NULL)	data->checkbox->Callback(data->checkbox->CallBackPtr, data->checkbox->value);
	CPUpdateAll(thread);
	return 1;
}

/* CPClearCB - Clear a checkbox
 *  BOOL CPClearCB(LPCPTHREAD thread, CPCBID cbid)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPCBID - Checkbox ID
 *   Return: 0 = error / 1 = success
 */
BOOL CPClearCB(LPCPTHREAD thread, CPCBID cbid) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int id = cbid >> 8;

	if (thread == NULL)		return 0;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return 0;
	while (id) {
		if (tabs->next_tab == NULL)		return 0;	// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL)					return 0;	// Bad Data Field
	while (data->id != cbid) {
		if (data->next_item == NULL)	return 0;	// Bad Data ID
		data = data->next_item;
	}

	if (data->data_type != CP_CHECK)	return 0;	// Bad item
	*(data->checkbox->value) = 0;
	if (data->checkbox->Callback != NULL)	data->checkbox->Callback(data->checkbox->CallBackPtr, data->checkbox->value);
	CPUpdateAll(thread);
	return 1;
}

/* CPStateCB - Set/Get the state of a checkbox
 *  BOOL CPStateCB(LPCPTHREAD thread, CPCBID cbid, int state)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPCBID - Checkbox ID
 *           int state - State to set checkbox (2 = get state)
 *   Return: 0 = error / 1 = success
 */
BOOL CPStateCB(LPCPTHREAD thread, CPCBID cbid, int state) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int id = cbid >> 8;

	if (thread == NULL)		return 0;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return 0;
	while (id) {
		if (tabs->next_tab == NULL)		return 0;	// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL)					return 0;	// Bad Data Field
	while (data->id != cbid) {
		if (data->next_item == NULL)	return 0;	// Bad Data ID
		data = data->next_item;
	}

	if (data->data_type != CP_CHECK)	return 0;	// Bad item

	if (state != 2)	data->checkbox->status = state;
	CPUpdateAll(thread);
	return data->checkbox->status;
}



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
CPRBID CPRegisterRB(LPCPTHREAD thread, CPTAB tab, LPCPRADIOBUTTON radio) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int				id = tab;

	if (thread == NULL)		return -1;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return -1;
	while (id) {
		if (tabs->next_tab == NULL)	return -1;		// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL) {
		if ((tabs->data = malloc(sizeof(CPTABDATA))) == NULL)		return -1;
		data = tabs->data;
	} else {
		while (data->next_item != NULL) {
			data = data->next_item;
			id++;
		}
		if ((data->next_item = malloc(sizeof(CPTABDATA))) == NULL)	return -1;
		data = data->next_item;
		id++;
	}

	data->data_type = CP_RADIO;
	data->radio = radio;
	data->next_item = NULL;
	data->wnd = NULL;
	data->id = (tab << 8) + id;
	CPUpdateAll(thread);
	return (tab << 8) + id;
}

/* CPSetRB - Set a Radio Button
 *  BOOL CPSetRB(LPCPTHREAD thread, CPRBID rbid)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPRBID - Radio Button ID
 *   Return: 0 = error / 1 = success
 */
BOOL CPSetRB(LPCPTHREAD thread, CPRBID rbid) {
	LPCPTABDATA		data, clrdta;
	LPCPTABFIELDS	tabs;
	int id = rbid >> 8;
	UCHAR group;

	if (thread == NULL)		return 0;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return 0;
	while (id) {
		if (tabs->next_tab == NULL)		return 0;	// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL)					return 0;	// Bad Data Field
	while (data->id != rbid) {
		if (data->next_item == NULL)	return 0;	// Bad Data ID
		data = data->next_item;
	}

	if (data->data_type != CP_RADIO)	return 0;	// Bad item

	group = data->radio->group;
	clrdta = tabs->data;
	while (clrdta != NULL) {
		if (clrdta->data_type == CP_RADIO && clrdta->radio->group == group) {
			*(clrdta->radio->value) = 0;
		}
		clrdta = clrdta->next_item;
	}
	*(data->radio->value) = 1;
	if (data->radio->Callback != NULL)	data->radio->Callback(data->radio->CallBackPtr, data->radio->value,group);
	CPUpdateAll(thread);
	return 1;
}

/* CPStateRB - Set/Get the sate of a Radio Button
 *  BOOL CPStateRB(LPCPTHREAD thread, CPRBID rbid, int state)
 *   Passed: LPCPTHREAD thread - Thread ID
 *           CPRBID rbid - Radio Button ID
 *           int state - State to set radio button (2 = get state)
 *   Return: 0 = error / 1 = success
 */
BOOL CPStateRB(LPCPTHREAD thread, CPRBID rbid, int state) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int id = rbid >> 8;

	if (thread == NULL)		return 0;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return 0;
	while (id) {
		if (tabs->next_tab == NULL)		return 0;	// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL)					return 0;	// Bad Data Field
	while (data->id != rbid) {
		if (data->next_item == NULL)	return 0;	// Bad Data ID
		data = data->next_item;
	}

	if (data->data_type != CP_RADIO)	return 0;	// Bad item

	if (state != 2)	data->radio->status = state;
	CPUpdateAll(thread);
	return data->radio->status;
}



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
CPEBID CPRegisterEB(LPCPTHREAD thread, CPTAB tab, LPCPEDITBOX edit) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int				id = tab;

	if (thread == NULL)		return -1;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return -1;
	while (id) {
		if (tabs->next_tab == NULL)	return -1;		// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL) {
		if ((tabs->data = malloc(sizeof(CPTABDATA))) == NULL)		return -1;
		data = tabs->data;
	} else {
		while (data->next_item != NULL) {
			data = data->next_item;
			id++;
		}
		if ((data->next_item = malloc(sizeof(CPTABDATA))) == NULL)	return -1;
		data = data->next_item;
		id++;
	}

	data->data_type = CP_EDIT;
	data->edit = edit;
	data->next_item = NULL;
	data->wnd = NULL;
	data->id = (tab << 8) + id;
	CPUpdateAll(thread);
	return (tab << 8) + id;
}

/* CPUpdateEB - Update an Edit Box
 *  BOOL CPUpdateEB(LPCPTHREAD thread, CPEBID id, LPSTR string)
 *   Passed: LPCPTHREAD thread - Main Thread
 *           CPEBID id - Edit Box ID
 *           LPSTR string - New string to copy
 *   Return: BOOL - 0 = success / 1 = error
 */
BOOL CPUpdateEB(LPCPTHREAD thread, CPEBID id, LPSTR string) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int				tab = (id >> 8);
	int				dta = id;

	if (thread == NULL)					return 1;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)					return 1;
	while (id) {
		if (tabs->next_tab == NULL)		return 1;		// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	data = tabs->data;
	while (data->id != dta) {
		if (data->next_item == NULL)	return 1;	// Bad TRACK ID
		data = data->next_item;
	}

	if (data->data_type != CP_EDIT)		return 1;	// Bad TRACK ID
	strcpy(data->edit->String, string);
	if (data->edit->Callback != NULL)	data->edit->Callback(data->edit->CallBackPtr, data->edit->String);
	CPUpdateAll(thread);
	return 0;
}



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
CPFSID CPRegisterFS(LPCPTHREAD thread, CPTAB tab, LPCPFILE file) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int				id = tab;

	if (thread == NULL)		return -1;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return -1;
	while (id) {
		if (tabs->next_tab == NULL)	return -1;		// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL) {
		if ((tabs->data = malloc(sizeof(CPTABDATA))) == NULL)		return -1;
		data = tabs->data;
	} else {
		while (data->next_item != NULL) {
			data = data->next_item;
			id++;
		}
		if ((data->next_item = malloc(sizeof(CPTABDATA))) == NULL)	return -1;
		data = data->next_item;
		id++;
	}

	data->data_type = CP_FILE;
	data->file = file;

	file->edit_box.String = file->Filename;
	file->edit_box.StrLen = 256;
	file->edit_box.Len = 175;
	file->edit_box.Pos.xPos = file->Pos.xPos;
	file->edit_box.Pos.yPos = file->Pos.yPos;
	file->edit_box.CallBackPtr = NULL;
	file->edit_box.Callback = NULL;
	file->editHWND = NULL;
	file->browse.Title = "Browse";
	file->browse.status = 1;
	file->browse.width = 80;
	file->browse.height = 21;
	file->browse.Pos.xPos = file->Pos.xPos + 180;
	file->browse.Pos.yPos = file->Pos.yPos;
	file->browse.CallBackPtr = NULL;
	file->browse.Callback = CPBrowseCallback;
	file->browseHWND = NULL;

	data->next_item = NULL;
	data->wnd = NULL;
	data->id = (tab << 8) + id;
	CPUpdateAll(thread);
	return (tab << 8) + id;
}

/* CPUpdateFS - Update the file selector
 *  BOOL CPUpdateFS(LPCPTHREAD thread, CPFSID id, LPSTR string)
 *   Passed: LPCPTHREAD thread - Main thread
 *           CPFSID id - File Selector ID
 *           LPSTR string - New file name
 *   Return: BOOL - 0 = success / 1 = error
 */
BOOL CPUpdateFS(LPCPTHREAD thread, CPFSID id, LPSTR string) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int				tab = (id >> 8);
	int				dta = id;

	if (thread == NULL)					return 1;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)					return 1;
	while (id) {
		if (tabs->next_tab == NULL)		return 1;		// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	data = tabs->data;
	while (data->id != dta) {
		if (data->next_item == NULL)	return 1;	// Bad TRACK ID
		data = data->next_item;
	}

	if (data->data_type != CP_FILE)		return 1;	// Bad TRACK ID
	strcpy(data->file->Filename, string);
	if (data->file->Callback != NULL)	data->file->Callback(data->file->CallBackPtr, data->file->Filename);
	CPUpdateAll(thread);
	return 0;
}



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
CPBTID CPRegisterBT(LPCPTHREAD thread, CPTAB tab, LPCPBUTTON button) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int				id = tab;

	if (thread == NULL)		return -1;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return -1;
	while (id) {
		if (tabs->next_tab == NULL)	return -1;		// Bad TAB ID
		tabs = tabs->next_tab;
		id--;
	}

	id = 0;
	data = tabs->data;
	if (data == NULL) {
		if ((tabs->data = malloc(sizeof(CPTABDATA))) == NULL)		return -1;
		data = tabs->data;
	} else {
		while (data->next_item != NULL) {
			data = data->next_item;
			id++;
		}
		if ((data->next_item = malloc(sizeof(CPTABDATA))) == NULL)	return -1;
		data = data->next_item;
		id++;
	}

	data->data_type = CP_BUTTON;
	data->button = button;
	data->next_item = NULL;
	data->wnd = NULL;
	data->id = (tab << 8) + id;
	CPUpdateAll(thread);
	return (tab << 8) + id;
}

/* CPStateBT - Set the state of a button
 *  BOOL CPStateBT(LPCPTHREAD thread, CPBTID id, int state)
 *   Passed: LPCPTHREAD thread - Main thread
 *           CPBTID id - Button ID
 *           int state - State (2 = get state)
 *   Return: BOOL - State (0 = disabled/1=enabled)
 */
BOOL CPStateBT(LPCPTHREAD thread, CPBTID id, int state) {
	LPCPTABDATA		data;
	LPCPTABFIELDS	tabs;
	int tab = id >> 8;

	if (thread == NULL)		return 0;		// Bad thread
	tabs = (LPCPTABFIELDS) thread->thread_data;
	
	if (tabs == NULL)		return 0;
	while (tab) {
		if (tabs->next_tab == NULL)		return 0;	// Bad TAB ID
		tabs = tabs->next_tab;
		tab--;
	}

	data = tabs->data;
	if (data == NULL)					return 0;	// Bad Data Field
	while (data->id != id) {
		if (data->next_item == NULL)	return 0;	// Bad Data ID
		data = data->next_item;
	}

	if (data->data_type != CP_BUTTON)	return 0;	// Bad item

	if (state != 2)	data->button->status = state;
	CPUpdateAll(thread);
	return data->button->status;
}


/* LibMain - Entry point for Windows DLL
 *  int APIENTRY LibMain(HANDLE, DWORD, LPVOID);
 *   Returns: 1 = Success (No initialization needed)
 */
BOOL APIENTRY LibMain( HANDLE hInst,
			  DWORD ul_reason_being_called,
			  LPVOID lpReserved )
{
	return 1;
}