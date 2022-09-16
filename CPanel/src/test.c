/*******************************
 * Control Panel API Tester    *
 * copyright (c) Digital  1996 *
 *******************************
 * Author: Kevin Bruckert      *
 * Created: August 6, 1996     *
 *******************************
 * Revision History            *
 *                             *
 *  08/06/96- 000 KSB          *
 *   Initial Creation          *
 *******************************/

#include <windows.h>
#include <process.h>
#include <commctrl.h>
#include <stdarg.h>

#include "cpapi.h"

void button_callback(LPSTR title) {
	return;
}

int WINAPI WinMain(HINSTANCE  hInstance,	// handle to current instance
    HINSTANCE  hPrevInstance,	// handle to previous instance
    LPSTR  lpCmdLine,	// pointer to command line
    int  nShowCmd) { 	// show state of window

	unsigned char *str = "Greetings";
	unsigned char *str2 = "Salutations";
	unsigned char *title = "Checkbox";
	unsigned char *rtitle1 = "Radio Button 1";
	unsigned char *rtitle2 = "Radio Button 2";
	unsigned char *rtitle3 = "Radio Button 3";
	unsigned char *rtitle4 = "Radio Button 4";
	LPCPTHREAD	thread;
	CPTEXT		text, text2;
	CPTAB		tab, tab2;
	CPTRACKBAR	track;
	CPCHECKBOX	check;
	CPRADIOBUTTON radio1, radio2, radio3, radio4;
	BOOL		bool = 1, ret;
	BOOL		rb1 = 1, rb2 = 0, rb3 = 0, rb4 = 1;
	ULONG		tmp = 5;

	unsigned char	*btn = "Testing";
	CPBUTTON		testbtn;

	CPTAB			ftab;
	unsigned char	fname[256] = "dectalk.ph";
	CPFILE			file;

	unsigned char	*rstr = "Rule File";
	unsigned char	rfile[256] = "dectalk.rul";
	unsigned char	*lstr = "Language";
	unsigned char	*srb1 = "English";
	unsigned char	*srb2 = "Spanish";
	unsigned char	*srb3 = "German";
	CPEDITBOX		ebox;
	CPRADIOBUTTON	lrb1, lrb2, lrb3;
	CPTEXT			ltext, rtext;
	BOOL			l1 = 1, l2 = 0, l3 = 0;
	CPTAB			ltab;

	track.VarPtr = &tmp;
	track.Min = 0;
	track.Max = 10;
	track.Len = 100;
	track.Pos.xPos = 100;
	track.Pos.yPos = 100;
	track.Callback = NULL;

	radio1.value = &rb1;
	radio1.group = 0;
	radio1.status = 1;
	radio1.title = rtitle1;
	radio1.Pos.xPos = 15;
	radio1.Pos.yPos = 250;
	radio1.Callback = NULL;

	radio2.value = &rb2;
	radio2.group = 0;
	radio2.status = 1;
	radio2.title = rtitle2;
	radio2.Pos.xPos = 15;
	radio2.Pos.yPos = 275;
	radio2.Callback = NULL;

	radio3.value = &rb3;
	radio3.group = 1;
	radio3.status = 1;
	radio3.title = rtitle3;
	radio3.Pos.xPos = 15;
	radio3.Pos.yPos = 325;
	radio3.Callback = NULL;

	radio4.value = &rb4;
	radio4.group = 1;
	radio4.status = 1;
	radio4.title = rtitle4;
	radio4.Pos.xPos = 15;
	radio4.Pos.yPos = 350;
	radio4.Callback = NULL;

	check.value = &bool;
	check.status = 1;
	check.title = title;
	check.Pos.xPos = 50;
	check.Pos.yPos = 50;
	check.Callback = NULL;

	text.String = str;
	text.Pos.xPos = 50;
	text.Pos.yPos = 50;
	text2.String = str2;
	text2.Pos.xPos = 200;
	text2.Pos.yPos = 200;

/* Language Tab */
	ltext.String = lstr;
	ltext.Pos.xPos = 25;
	ltext.Pos.yPos = 50;
	lrb1.value = &l1;
	lrb1.group = 0;
	lrb1.status = 1;
	lrb1.title = srb1;
	lrb1.Pos.xPos = 35;
	lrb1.Pos.yPos = 70;
	lrb1.Callback = NULL;
	lrb2.value = &l2;
	lrb2.group = 0;
	lrb2.status = 1;
	lrb2.title = srb2;
	lrb2.Pos.xPos = 35;
	lrb2.Pos.yPos = 90;
	lrb2.Callback = NULL;
	lrb3.value = &l3;
	lrb3.group = 0;
	lrb3.status = 0;
	lrb3.title = srb3;
	lrb3.Pos.xPos = 35;
	lrb3.Pos.yPos = 110;
	lrb3.Callback = NULL;

	rtext.String = rstr;
	rtext.Pos.xPos = 25;
	rtext.Pos.yPos = 140;
	ebox.String = rfile;
	ebox.StrLen = 256;
	ebox.Pos.xPos = 100;
	ebox.Pos.yPos = 140;
	ebox.Len = 100;
	ebox.Callback = NULL;

	/* Button Test */
	testbtn.Title = btn;
	testbtn.status = 1;
	testbtn.width = 75;
	testbtn.height = 25;
	testbtn.Pos.xPos = 200;
	testbtn.Pos.yPos = 75;
	testbtn.Callback = button_callback;

	file.Filename = fname;
	file.Pos.xPos = 25;
	file.Pos.yPos = 100;
	file.Callback = NULL;

	thread = CPInitAPI();
	tab = CPInitTab(thread, "General");
	tab2 = CPInitTab(thread, "Other");
	ret = CPText(thread, tab, &text);
	ret = CPText(thread, tab2, &text2);
	ret = CPRegisterTB(thread, tab, &track);
	ret = CPRegisterCB(thread, tab2, &check);
	ret = CPRegisterRB(thread, tab2, &radio1);
	ret = CPRegisterRB(thread, tab2, &radio2);
	ret = CPRegisterRB(thread, tab2, &radio3);
	ret = CPRegisterRB(thread, tab2, &radio4);
	ret = CPRegisterBT(thread, tab2, &testbtn);

	ltab = CPInitTab(thread, "Language");
	CPText(thread, ltab, &ltext);
	CPRegisterRB(thread, ltab, &lrb1);
	CPRegisterRB(thread, ltab, &lrb2);
	CPRegisterRB(thread, ltab, &lrb3);

	CPText(thread, ltab, &rtext);
	CPRegisterEB(thread, ltab, &ebox);

	ftab = CPInitTab(thread, "File");
	CPRegisterFS(thread, ftab, &file);

	CPShow(thread);
	CPUnitAPI(thread);
	return 0;
}