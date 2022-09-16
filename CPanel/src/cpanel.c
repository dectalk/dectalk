/*******************************
 * Control Panel API Functions *
 * copyright (c) Digital  1996 *
 *******************************
 * Author: Kevin Bruckert      *
 * Created: July 18, 1996      *
 *******************************
 * Revision History            *
 *                             *
 *  07/18/96- 000 KSB          *
 *   Initial Creation          *
 *  08/28/96- 001 KSB          *
 *   Added OK button to CP     *
 *******************************/

#include <windows.h>
#include <process.h>
#include <commctrl.h>
#include <stdarg.h>

#include "cpanel.h"
#include "cpapi.h"


#define	MAJ_VER		0
#define	MIN_VER		91

#define	WIN_STYLE		(WS_CAPTION | WS_SYSMENU | WS_VISIBLE)
#define	CP_STYLE		(WS_CHILD | WS_CLIPSIBLINGS | WS_VISIBLE | TCS_MULTILINE)
#define	TB_STYLE		(WS_CHILD | WS_VISIBLE | TBS_AUTOTICKS)
#define	STATIC_STYLE	(WS_CHILD | WS_VISIBLE)

#define	WIN_X_START		0
#define	WIN_Y_START		0
#define	WIN_X_SIZE		400
#define	WIN_Y_SIZE		600

#define	CP_X_START		10
#define	CP_Y_START		10
#define	CP_X_SIZE		(WIN_X_SIZE - CP_X_START - 15)
#define	CP_Y_SIZE		(WIN_Y_SIZE - CP_Y_START - 60)

#define	OK_X_START		300
#define	OK_Y_START		545
#define	OK_X_SIZE		75
#define	OK_Y_SIZE		25

#define	TB_X_START		50
#define	TB_Y_START		200
#define	TB_X_SIZE		200
#define	TB_Y_SIZE		30

#define	WIN_MENU		NULL

/* WinProc */
LONG APIENTRY CPWinProc(HWND hWnd, UINT uiMessage, WPARAM wParam, LPARAM lParam);

/* Prototypes */
void PaintCP(LPCPTHREAD thread, HWND win);
void CPdotabs(LPCPTHREAD thread);
BOOL CPopenwindow(LPCPTHREAD thread);
BOOL create_CP_window(LPCPTHREAD thread);
BOOL Build_CP_Window(LPCPTHREAD thread, CPTAB tab);
BOOL Kill_CP_Windows(LPCPTHREAD thread);
void initialize_CP_window(void);
void unitialize_window(void);

BOOL CPNotify(LPCPTHREAD thread, int, LPNMHDR);
BOOL TBNotify(LPCPTHREAD thread, int, int);
BOOL CBRBNotify(LPCPTHREAD thread, int);
void CPaddtab(LPCPTHREAD thread, CPTAB tab, LPSTR tabstr);
HWND CPShowText(HWND wnd, LPCPTEXT text);
HWND CPShowTrack(HWND wnd, LPCPTRACKBAR track, int id);
HWND CPShowCheck(HWND wnd, LPCPCHECKBOX check, int id);
HWND CPShowRadio(HWND wnd, LPCPRADIOBUTTON radio, int id);
HWND CPShowEdit(HWND wnd, LPCPEDITBOX edit);
HWND CPShowFile(HWND wnd, LPCPFILE file, int id);
HWND CPShowButton(HWND wnd, LPCPBUTTON button, int id);
 
/* Main Window Initializer and controls */
BOOL create_CP_window(LPCPTHREAD thread) {
	HWND		handle;
	WNDCLASS	Wndclass;
	static BOOL	registered = FALSE;
	DWORD		err;
	char		WndClass[] = "Control Panel";

	Wndclass.style = CS_BYTEALIGNCLIENT | CS_GLOBALCLASS | CS_HREDRAW | CS_VREDRAW;
	Wndclass.lpfnWndProc = CPWinProc;
	Wndclass.cbClsExtra = 0;
	Wndclass.cbWndExtra = 0;
	Wndclass.hInstance = NULL;
	Wndclass.hIcon         = LoadIcon(NULL, IDI_APPLICATION);
	Wndclass.hCursor       = LoadCursor (NULL, IDC_ARROW) ;
	Wndclass.hbrBackground = GetStockObject (LTGRAY_BRUSH) ;
	Wndclass.lpszMenuName = NULL;
	Wndclass.lpszClassName = WndClass;

	if (!registered) {
		if (!RegisterClass(&Wndclass))	return 1;
		registered = TRUE;
	}
	
	handle = CreateWindowEx((ULONG) NULL /*| WS_EX_CONTEXTHELP*/, WndClass, "DECtalk Control Panel",
							WIN_STYLE, WIN_X_START, WIN_Y_START,
							WIN_X_SIZE, WIN_Y_SIZE, WIN_MENU, NULL, NULL, NULL);
	
	if (handle == NULL) {
		err = GetLastError();
		return 1;
	}

	thread->MainWindow = handle;
	SetWindowLong(handle, GWL_USERDATA, (LONG) thread);
	
	handle = CreateWindow(WC_TABCONTROL, "DECtalk Control Panel",
				CP_STYLE, CP_X_START, CP_Y_START, CP_X_SIZE, CP_Y_SIZE,
				thread->MainWindow, WIN_MENU, NULL, NULL);

	thread->CPWindow = handle;
	SetWindowLong(handle, GWL_USERDATA, (LONG) thread);

	if (handle == NULL) {
		err = GetLastError();
		return 1;
	}

	thread->OKButton = CreateWindowEx(0, "BUTTON", "",
				STATIC_STYLE | BS_PUSHBUTTON, OK_X_START, OK_Y_START,
				OK_X_SIZE, OK_Y_SIZE, thread->MainWindow, (HMENU) 0xFFFE, NULL, NULL);

	SetWindowText(thread->OKButton, "OK");
	
	return 0;
}

/* CPUpdateAll - Update the Control Panel if it's open
 *  void CPUpdateAll(LPCPTHREAD thread)
 *   Passed: LPCPTHREAD thread - Main thread
 *   Return: void
 */
void CPUpdateAll(LPCPTHREAD thread) {
	if (thread == NULL || thread->thread_data == NULL)	return;
	if (thread->MainWindow == NULL)						return;
	PaintCP(thread, thread->MainWindow);
	return;
}

//
//  WindowProc
//
LONG APIENTRY CPWinProc(HWND hWnd, UINT uiMessage, WPARAM wParam, LPARAM lParam) {
	LPCPTHREAD thread = (LPCPTHREAD) GetWindowLong(hWnd, GWL_USERDATA);

	switch (uiMessage) {
		case WM_NOTIFY:		/* Someone's talking about the CP */
							if (CPNotify(thread, (int) LOWORD(wParam), (LPNMHDR) lParam))
								return DefWindowProc(hWnd, uiMessage, wParam, lParam);
							break;

		case WM_DESTROY:	PostQuitMessage(0);
							break ;

		case WM_CLOSE:		/* Close window */
							DestroyWindow(hWnd);
							thread->MainWindow = NULL;
							thread->CPWindow = NULL;
							thread->CPAlive = FALSE;
							break;

		case WM_PAINT:		PaintCP(thread, hWnd);
							break;

		case WM_HSCROLL:	if (TBNotify(thread, (int) LOWORD(wParam), (int) lParam))
								return DefWindowProc(hWnd, uiMessage, wParam, lParam);
							break;

		case WM_COMMAND:	if (HIWORD(wParam) == BN_CLICKED) {
								if (CBRBNotify(thread, (int) LOWORD(wParam)))
									return DefWindowProc(hWnd, uiMessage, wParam, lParam);
							} else {
								return DefWindowProc(hWnd, uiMessage, wParam, lParam);
							}
							break;

		default:			return DefWindowProc(hWnd,uiMessage, wParam, lParam);
	}
	return 0L;
}

BOOL TBNotify(LPCPTHREAD thread, int code, int handle) {
	HWND hdl = (HWND) handle;
	LPCPTABFIELDS tabs;
	LPCPTABDATA data;
	BOOL found = 0;
	ULONG pos;

	pos = (ULONG) SendMessage(hdl, TBM_GETPOS, 0, 0);

	if (thread == NULL)		return 1;
	tabs = (LPCPTABFIELDS) thread->thread_data;

	while (tabs != NULL && !found) {
		data = tabs->data;
		while (data != NULL && !found) {
			if (data->wnd == hdl)	found = 1;
			else					data = data->next_item;
		}
		if (!found)	tabs = tabs->next_tab;
	}
	if (!found)	return 1;

	if (data->data_type != CP_TRACKBAR)		return 1;

	if (*(data->trackbar->VarPtr) == (ULONG) pos)	return 0;

	*(data->trackbar->VarPtr) = (ULONG) pos;
	if (data->trackbar->Callback != NULL) {
		data->trackbar->Callback(data->trackbar->CallBackPtr, data->trackbar->VarPtr);
	}

	return 0;
}

BOOL CBRBNotify(LPCPTHREAD thread, int id) {
	CPTAB tab = (id >> 8);
	LPCPTABFIELDS tabs;
	LPCPTABDATA data, clrdta;
	UCHAR RBgroup;

	if (thread == NULL)		return 1;

	if (id == 0xFFFE) {		/* Is the OK button */
		DestroyWindow(thread->MainWindow);
		thread->CPAlive = FALSE;
		return 0;
	}
	tabs = (LPCPTABFIELDS) thread->thread_data;
	while (tab) {
		if (tabs->next_tab == NULL)		return 1;
		tabs = tabs->next_tab;
		tab--;
	}
	if ((data = tabs->data) == NULL)	return 1;
	while (data->id != id) {
		if (data->next_item == NULL)	return 1;
		data = data->next_item;
	}

	/* Checkbox */
	if (data->data_type == CP_CHECK) {
		if (*(data->checkbox->value))	*(data->checkbox->value) = 0;
		else							*(data->checkbox->value) = 1;
		SendMessage(data->wnd, BM_SETCHECK, *(data->checkbox->value), 0);
		if (data->checkbox->Callback != NULL) {
			data->checkbox->Callback(data->checkbox->CallBackPtr, data->checkbox->value);
		}
		return 0;
	}

	/* Radio Button */
	if (data->data_type == CP_RADIO) {
		if (*(data->radio->value))		return 0;		// Already set
		RBgroup = data->radio->group;

		/* Clear all radio buttons in group */
		clrdta = tabs->data;
		while (clrdta != NULL) {
			if (clrdta->data_type == CP_RADIO && clrdta->radio->group == RBgroup) {
				*(clrdta->radio->value) = 0;
				SendMessage(clrdta->wnd, BM_SETCHECK, 0, 0);
			}
			clrdta = clrdta->next_item;
		}

		*(data->radio->value) = 1;
		SendMessage(data->wnd, BM_SETCHECK, 1, 0);
		if (data->radio->Callback != NULL) {
			data->radio->Callback(data->radio->CallBackPtr, data->radio->value, RBgroup);
		}
		return 0;
	}

	/* Push button */
	if (data->data_type == CP_BUTTON) {
		if (data->button->Callback != NULL) {
			data->button->Callback(data->button->CallBackPtr, data->button->Title);
		}
		return 0;
	}

	/* BROWSE internal push button (Send the filename) */
	if (data->data_type == CP_FILE) {
		if (data->file->browse.Callback != NULL) {
			data->file->browse.Callback(data->file->CallBackPtr, data->file->Filename);
		}
		SetWindowText(data->file->editHWND, data->file->Filename);
		return 0;
	}

	return 1;
}

void PaintCP(LPCPTHREAD thread, HWND win) {
	HDC CPDC;
	PAINTSTRUCT ps;

	Build_CP_Window(thread,TabCtrl_GetCurSel(thread->CPWindow));
	CPDC = BeginPaint(win, &ps);
	EndPaint(win, &ps);
	return;
}

/* CPopenwindow - Open the Control Panel window (modal)
 *  BOOL CPopenwindow(LPCPTHREAD thread)
 *   Passed: LPCPTHREAD thread - Thread
 *   Return: BOOL - 0 = success / 1 = failure
 */
BOOL CPopenwindow(LPCPTHREAD thread)
{
	MSG msg;

	if (thread == NULL)					return 1;	// Bad Thread
	if (thread->thread_data == NULL)	return 1;	// No tabs
	InitCommonControls();							// Init common controls
	if (thread->CPAlive == TRUE)		return 1;	// Control Panel Already Open
	thread->CPAlive = TRUE;
	if (create_CP_window(thread) == 1)	return 1;	// Build control panel windows
	CPdotabs(thread);								// Set tabs
	Build_CP_Window(thread, 0);						// Display controls

	while (GetMessage(&msg, NULL, 0, 0)) {
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}
	return msg.wParam;
}

void CPaddtab(LPCPTHREAD thread, CPTAB tab, LPSTR tabstr) {
	TC_ITEM item;

	item.mask = TCIF_TEXT | TCIF_IMAGE;
	item.iImage = -1;
	item.lParam = 0;

	item.pszText = tabstr;
	item.cchTextMax = strlen(item.pszText);

	if (TabCtrl_InsertItem(thread->CPWindow, tab, &item) == -1) {
		return;
	}

	return;
}

void CPdotabs(LPCPTHREAD thread) {
	LPCPTABFIELDS tabs;
	int id = 0;

	if (thread == NULL)		return;
	tabs = (LPCPTABFIELDS) thread->thread_data;
	while (tabs != NULL) {
		CPaddtab(thread, id, tabs->Name);
		id++;
		tabs = tabs->next_tab;
	}
	return;
}

/* Control Panel Notify Routine for Tab Fields
 *  Return 1 for DefWinProc or 0 for processed
 */
BOOL CPNotify(LPCPTHREAD thread, int id, LPNMHDR nmhdr) {
	HWND handle = nmhdr->hwndFrom;
	UINT code = nmhdr->code;
	CPTAB sel;

	switch (code) {
		case TCN_SELCHANGE:		/* Tab Field Selection Changed */
						sel = TabCtrl_GetCurSel(thread->CPWindow);
						Build_CP_Window(thread, sel);
						return 0;
	}
	return 1;
}

void CPClearWin(LPCPTHREAD thread, HWND win) {
	HDC		dc;
	RECT	rect;

	dc = GetDC(win);
	GetClientRect(win, &rect);
	TabCtrl_AdjustRect(win, FALSE, &rect);
	FillRect(dc, &rect, (HBRUSH) GetStockObject(LTGRAY_BRUSH));
	ReleaseDC(win, dc);
	return;
}

/* Build_CP_Window - Redraw / Build the CP window
 *  void Build_CP_Window(LPCPTHREAD thread, CPTAB tab)
 *   Passed: LPCPTHREAD thread - Thread
 *           CPTAB tab - Tab to display
 *   Return: BOOL - 0 = success / 1 = failure
 */
BOOL Build_CP_Window(LPCPTHREAD thread, CPTAB tab) {
	HWND			wnd;
	LPCPTABFIELDS	tabs;
	LPCPTABDATA		data;
	int				id = tab;

	if (thread == NULL)		return 1;

	wnd = thread->MainWindow;

	Kill_CP_Windows(thread);

	tabs = (LPCPTABFIELDS) thread->thread_data;
	while (tabs != NULL && id) {
		tabs = tabs->next_tab;
		id--;
	}
	if (tabs == NULL)		return 1;
	data = tabs->data;
	while (data != NULL) {
		if (data->wnd == NULL) {
			switch (data->data_type) {
				case CP_TEXT:		data->wnd = CPShowText(wnd,data->text);					break;
				case CP_RADIO:		data->wnd = CPShowRadio(wnd,data->radio,data->id);		break;
				case CP_CHECK:		data->wnd = CPShowCheck(wnd,data->checkbox,data->id);	break;
				case CP_TRACKBAR:	data->wnd = CPShowTrack(wnd,data->trackbar,data->id);	break;
				case CP_EDIT:		data->wnd = CPShowEdit(wnd,data->edit);					break;
				case CP_FILE:		data->wnd = CPShowFile(wnd,data->file,data->id);		break;
				case CP_BUTTON:		data->wnd = CPShowButton(wnd,data->button,data->id);	break;
			}
		}
		data = data->next_item;
	}
	return 0;
}

/* Kill_CP_Windows - Destroy the CP controls
 *  void Kill_CP_Windows(LPCPTHREAD thread)
 *   Passed: LPCPTHREAD thread - Thread
 *   Return: BOOL - 0 = success / 1 = failure
 */
BOOL Kill_CP_Windows(LPCPTHREAD thread) {
	LPCPTABFIELDS	tabs;
	LPCPTABDATA		data;

	if (thread == NULL)		return 1;

	tabs = (LPCPTABFIELDS) thread->thread_data;
	while (tabs != NULL) {
		data = tabs->data;
		while (data != NULL) {
			if (data->wnd != NULL) {
				
				/* Save data before delete */
				switch (data->data_type) {
					case CP_CHECK:	*(data->checkbox->value) = SendMessage(data->wnd, BM_GETCHECK, 0, 0);
									break;
					case CP_RADIO:	*(data->radio->value) = SendMessage(data->wnd, BM_GETCHECK, 0, 0);
									break;

					case CP_TRACKBAR:	*(data->trackbar->VarPtr) = SendMessage(data->wnd, TBM_GETPOS, 0, 0);
									break;

					case CP_EDIT:	GetWindowText(data->wnd, data->edit->String, data->edit->StrLen);
									break;
				}

				DestroyWindow(data->wnd);
				data->wnd = NULL;
			}
			if (data->data_type == CP_FILE) {		// Kill both windows
				if (data->file->editHWND != NULL) {
					GetWindowText(data->file->editHWND, data->file->edit_box.String, data->file->edit_box.StrLen);
					DestroyWindow(data->file->editHWND);
					data->file->editHWND = NULL;
				}
				if (data->file->browseHWND != NULL) {
					DestroyWindow(data->file->browseHWND);
					data->file->browseHWND = NULL;
				}
			}
			data = data->next_item;
		}
		tabs = tabs->next_tab;
	}

	return 0;
}

/* CPShowTrack - Show a trackbar
 *  HWND CPShowTrack(HWND wnd, LPCPTRACKBAR track, int id)
 *   Passed: HWND wnd - Parent Window handle
 *           LPCPTRACKBAR track - Trackbar data
 *           int id - ID number for messages
 *   Return: HWND - Trackbar handle
 */
HWND CPShowTrack(HWND wnd, LPCPTRACKBAR track, int id) {
	HWND hdl;

	hdl = CreateWindowEx(0, TRACKBAR_CLASS, "Trackbar Control",
				TB_STYLE, track->Pos.xPos, track->Pos.yPos, track->Len, TB_Y_SIZE,
				wnd, (HMENU) id, NULL, NULL);

	SendMessage(hdl, TBM_SETRANGE, (WPARAM) TRUE,
		(LPARAM) MAKELONG(track->Min,track->Max));
	SendMessage(hdl, TBM_SETPAGESIZE, 0, (LPARAM) 2);
	SendMessage(hdl, TBM_SETPOS, (WPARAM) TRUE,
		(LPARAM) *(track->VarPtr));

	SetFocus(hdl);
	return hdl;
}

/* CPShowText - Show text
 *  HWND CPShowText(HWND wnd, LPCPTEXT text)
 *   Passed: HWND wnd - Window handle
 *           LPCPTEXT text - Text structure
 *   Return: HWND - Handle to STATIC control window
 */
HWND CPShowText(HWND wnd, LPCPTEXT text) {
	HWND hdl;
	HDC dc;
	SIZE sz;

	dc = GetDC(wnd);
	GetTextExtentPoint(dc, text->String, strlen(text->String), &sz);
	ReleaseDC(wnd, dc);

	hdl = CreateWindowEx(0, "STATIC", "",
				STATIC_STYLE, text->Pos.xPos, text->Pos.yPos, sz.cx, sz.cy,
				wnd, NULL, NULL, NULL);

	SetWindowText(hdl, text->String);
	return hdl;
}

/* CPShowCheck - Show Checkbox
 *  HWND CPShowCheck(HWND wnd, LPCPCHECKBOX check, int id)
 *   Passed: HWND wnd - Window handle
 *           LPCPCHECKBOX check - Check box structure
 *           int id - ID for messaging
 *   Return: HWND - Handle to CHECKBOX control window
 */
HWND CPShowCheck(HWND wnd, LPCPCHECKBOX check, int id) {
	HWND hdl;
	HDC dc;
	SIZE sz;

	dc = GetDC(wnd);
	GetTextExtentPoint(dc, check->title, strlen(check->title), &sz);
	ReleaseDC(wnd, dc);

	sz.cx += 20;

	hdl = CreateWindowEx(0, "BUTTON", "",
				STATIC_STYLE | BS_CHECKBOX, check->Pos.xPos, check->Pos.yPos,
				sz.cx, sz.cy, wnd, (HMENU) id, NULL, NULL);

	SetWindowText(hdl, check->title);
	SendMessage(hdl, BM_SETCHECK, *(check->value), 0);
	EnableWindow(hdl, check->status);
	return hdl;
}

/* CPShowRadio - Show Radio Button
 *  HWND CPShowRadio(HWND wnd, LPCPRADIOBUTTON radio, int id)
 *   Passed: HWND wnd - Window handle
 *           LPCPRADIOBUTTON radio - Radio Button structure
 *           int id - ID for messaging
 *   Return: HWND - Handle to RADIOBUTTON control window
 */
HWND CPShowRadio(HWND wnd, LPCPRADIOBUTTON radio, int id) {
	HWND hdl;
	HDC dc;
	SIZE sz;

	dc = GetDC(wnd);
	GetTextExtentPoint(dc, radio->title, strlen(radio->title), &sz);
	ReleaseDC(wnd, dc);

	sz.cx += 20;

	hdl = CreateWindowEx(0, "BUTTON", "",
				STATIC_STYLE | BS_RADIOBUTTON, radio->Pos.xPos, radio->Pos.yPos,
				sz.cx, sz.cy, wnd, (HMENU) id, NULL, NULL);

	SetWindowText(hdl, radio->title);
	SendMessage(hdl, BM_SETCHECK, *(radio->value), 0);
	EnableWindow(hdl, radio->status);
	return hdl;
}

/* CPShowEdit - Show Edit Box
 *  HWND CPShowEdit(HWND wnd, LPCPEDITBOX edit)
 *   Passed: HWND wnd - Window handle
 *           LPCPEDITBOX edit - Edit Box structure
 *   Return: HWND - Handle to EDITBOX control window
 */
HWND CPShowEdit(HWND wnd, LPCPEDITBOX edit) {
	HWND hdl;
	HDC dc;
	SIZE sz;

	dc = GetDC(wnd);
	GetTextExtentPoint(dc, "AA", 2, &sz);
	ReleaseDC(wnd, dc);

	sz.cy += 5;

	hdl = CreateWindowEx(0, "EDIT", "",
				STATIC_STYLE | WS_BORDER | ES_AUTOHSCROLL, edit->Pos.xPos, edit->Pos.yPos,
				edit->Len, sz.cy, wnd, NULL, NULL, NULL);

	SetWindowText(hdl, edit->String);
	return hdl;
}

/* CPShowFile - Show File Box
 *  HWND CPShowFile(HWND wnd, LPCPFILE file, int id)
 *   Passed: HWND wnd - Window handle
 *           LPCPFILE file - File structure
 *           int id - Messaging ID
 *   Return: HWND - Handle to FILE edit control window
 */
HWND CPShowFile(HWND wnd, LPCPFILE file, int id) {
	file->editHWND = CPShowEdit(wnd, &(file->edit_box));
	file->browseHWND = CPShowButton(wnd, &(file->browse), id);
	return NULL;
}

/* CPShowButton - Show Button
 *  HWND CPShowButton(HWND wnd, LPCPBUTTON check, int id)
 *   Passed: HWND wnd - Window handle
 *           LPCPBUTTON button - Button structure
 *           int id - ID for messaging
 *   Return: HWND - Handle to BUTTON control window
 */
HWND CPShowButton(HWND wnd, LPCPBUTTON button, int id) {
	HWND hdl;

	hdl = CreateWindowEx(0, "BUTTON", "",
				STATIC_STYLE | BS_PUSHBUTTON, button->Pos.xPos, button->Pos.yPos,
				button->width, button->height, wnd, (HMENU) id, NULL, NULL);

	SetWindowText(hdl, button->Title);
	EnableWindow(hdl, button->status);
	return hdl;
}


/* CPBrowseCallback - Callback used for BROWSE button
 *  void CPBrowseCallback(LPSTR title)
 *   Passed: LPSTR title - title "BROWSE"
 *   Return: void
 */
void CPBrowseCallback(VOID* vfilter, LPSTR title) {
	OPENFILENAME file;
	BOOL ret;
	UCHAR filenm[300];
	UCHAR filter[256];

	if (vfilter != NULL)	strcpy(filter, (char*) vfilter);
	else					strcpy(filter,"*.*");
	filter[strlen(filter)+1] = '\0';
	strcpy(filenm,title);

	file.lStructSize = sizeof(OPENFILENAME);
	file.hwndOwner = NULL;
	file.hInstance = NULL;
	file.lpstrFilter = filter;
	file.lpstrCustomFilter = NULL;
	file.nMaxCustFilter = (ULONG) NULL;
	file.nFilterIndex = (ULONG) 1;
	file.lpstrFile = filenm;
	file.nMaxFile = 300;
	file.lpstrFileTitle = NULL;
	file.nMaxFileTitle = 0;
	file.lpstrInitialDir = NULL;
	file.lpstrTitle = "Browse...";
	file.Flags = OFN_LONGNAMES | OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST;
	file.nFileOffset = 0;
	file.nFileExtension = (USHORT) NULL;
	file.lpstrDefExt = NULL;
	file.lCustData = (long) NULL;
	file.lpfnHook = NULL;
	file.lpTemplateName = NULL;

	ret = GetOpenFileName(&file);
	if (ret == FALSE)	return;

	strcpy(title, filenm);
	return;
}
