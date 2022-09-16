/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	wsr_file.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  WSR file read support
 *
 ***********************************************************************
 *    Revision History:
 */

#include "wsr.h"
#include	<commdlg.h>

char 				wsrDirectory[256];
char 				wsrFileName[256];
char 				wsrFileTitle[256];
HFILE				wsrFile;
FARPROC			ReadControl;
HGLOBAL			hReadBuff;
char _huge		*read_buff;
int				BytesAvail;
int				ByteIndex;
int				AbortFlag;
int				ReadFlag;
int				ReadModule;
unsigned long	ReadWait;
int				UserReadControl;
int				UserTextControl;
int				UserPauseControl;
DWORD	Waitsome;

wsrOpenFile()
{
	OPENFILENAME	ofn;
	FARPROC	TextProc;
	HANDLE	TextDlg;

	if(wsrDirectory[0] == 0)
		GetSystemDirectory(wsrDirectory,sizeof(wsrDirectory));

	memset(&ofn,0,sizeof(OPENFILENAME));
	ofn.lStructSize = sizeof(OPENFILENAME);
	ofn.hwndOwner=wsrWnd;
	ofn.lpstrFilter="Text (*.txt)\0*.txt\0";
	ofn.nFilterIndex=1;
	ofn.lpstrFile=wsrFileName;
	ofn.nMaxFile=sizeof(wsrFileName);
	ofn.lpstrFileTitle=wsrFileTitle;
	ofn.nMaxFileTitle=sizeof(wsrFileTitle);
	ofn.lpstrInitialDir=wsrDirectory;
	ofn.Flags=OFN_SHOWHELP|OFN_PATHMUSTEXIST|OFN_FILEMUSTEXIST;
	if(GetOpenFileName(&ofn) == 0)
		return(wsrFileError("Error opening file."));
	if((wsrFile = _lopen(ofn.lpstrFile,READ)) == 0)
		return(wsrFileError("Error reading file."));
	TextProc = MakeProcInstance(wsrTextDlg, wsrInst);
	TextDlg = DialogBox(wsrInst, MAKEINTATOM(DLG_TEXT_CONTROL), wsrWnd, TextProc);
	FreeProcInstance(TextProc);
	wsrClearTTY();
	return(SUCCESS);
}


wsrReadFile(mod)
int mod;
{

	AbortFlag = false;
	ReadFlag = false;
	if(UserReadControl)
		{
		ReadControl = MakeProcInstance(wsrReadControl, wsrInst);
		if(ReadControl == 0L)
			return(wsrFileError("No read process."));
		wsrDlg = CreateDialog(wsrInst, MAKEINTATOM(DLG_READ_CONTROL), wsrWnd, ReadControl);
		if(wsrDlg == NULL)
			return(wsrFileError("No control dialog."));
		}
	if((hReadBuff = GlobalAlloc(GMEM_FIXED,READ_BUFF_SIZE+16)) == NULL)
		return(wsrFileError("No read buffer memory."));
	read_buff = (char _huge *)GlobalLock(hReadBuff);
	if(UserTextControl != ID_NO_TEXT && UserTextControl != ID_CLEAR_TEXT)
		wsrStartIndex();
	BytesAvail = ByteIndex = 0;
	ReadFlag = true;
	ReadModule = mod;
	ReadWait = GetTickCount();
	return(SUCCESS);
}

void wsrDoRead()
{
	if(ReadFlag == false)
		return;
	if(AbortFlag)
		ReadFlag = false;
	else if(UserTextControl == ID_NO_TEXT || UserTextControl == ID_CLEAR_TEXT)
		wsrSimpleRead();
	else
		wsrIndexRead();
	if(ReadFlag == false)
		{
		_lclose(wsrFile);
		GlobalUnlock(hReadBuff);
		GlobalFree(hReadBuff);
		if(UserReadControl)
			{
			DestroyWindow(wsrDlg);
			FreeProcInstance(ReadControl);
			}
		}
}

void wsrSimpleRead()
{
	unsigned int	send_act,send_size,status;
	int				used_bytes;
	char				save_char;

	if(BytesAvail == 0)
		{
		ByteIndex=0;
		BytesAvail=_lread(wsrFile,read_buff,READ_BUFF_SIZE);
		if(BytesAvail == HFILE_ERROR)
			{
			wsrFileError("Error reading File.");
			return;
			}
		if(BytesAvail == 0)
			{
			ReadFlag = false;
			return;
			}
		}
	if(ReadWait >= GetTickCount())
		return;
	/*Code was looping too rapidly on dtpcbuffused causing dectalk to do
		nothing but answer the question 4/18/95 eab*/
	Waitsome=GetTickCount()+100;
	while (Waitsome >=GetTickCount());

	dtpcBuffUsed(ReadModule,&used_bytes);
	if(used_bytes >= MAX_OUT_BYTES)
		{
		ReadWait = GetTickCount() + READ_DELAY;
		return;
		}
	send_size = send_act = (SEND_SIZE > BytesAvail) ? BytesAvail : SEND_SIZE;
	if((status = dtpcSendBuff(ReadModule,&read_buff[ByteIndex],&send_act)) == DLL_SUCCESS)
		{
		if(UserTextControl == ID_CLEAR_TEXT)
			{
			save_char=read_buff[ByteIndex+send_size];
			read_buff[ByteIndex+send_size] = 0;
			wsrTextOut(&read_buff[ByteIndex]);
			read_buff[ByteIndex+send_size] = save_char;
			}
		BytesAvail -= send_size;
		ByteIndex += send_size;
		return;
		}
	if(status == DLL_FAILURE)
		wsrFileError("Sending to DECtalk Module.");
}

	
wsrFileError(str)
char _far *str;
{
	if(read_buff)
		GlobalUnlock(hReadBuff);
	if(hReadBuff)
		GlobalFree(hReadBuff);
	if(wsrFile)
		_lclose(wsrFile);
	if(wsrDlg);
		DestroyWindow(wsrDlg);
	if(ReadControl)
		FreeProcInstance(ReadControl);
	if(IndexFlag)
		wsrStopIndex();

	wsrFile = 0;
	hReadBuff = 0;
	read_buff = (char _huge *)0L;
	wsrDlg = 0;
	ReadControl = 0;
	ReadFlag = false;

	MessageBox(wsrWnd,str,"DECtalk(TM) Windows File Reader.",MB_ICONHAND|MB_TASKMODAL|MB_OK);
	return(FAILURE);
}

/*
 *  Wsr Read control box ...
 */

int new_volume;
int new_voice;
int new_rate;

#define	VOLUME_DELTA	((MAX_VOLUME-MIN_VOLUME)/6)
#define	RATE_DELTA		((MAX_RATE-MIN_RATE)/6)

BOOL FAR PASCAL wsrReadControl(HWND hWndDlg, WORD Message, WORD wParam, LONG lParam)
{

	HWND	hScrollWnd;
	int	temp;
	BOOL	ok_flag;

	switch(Message)
		{
		case WM_INITDIALOG:

			wsrCenter(hWndDlg);
			while(dtpcGetSetting(0,DTPC_get_volume,&new_volume) != DLL_SUCCESS);
			while(dtpcGetSetting(0,DTPC_get_rate,&new_rate) != DLL_SUCCESS);
			while(dtpcGetSetting(0,DTPC_get_voice,&new_voice) != DLL_SUCCESS);

			SetDlgItemInt(hWndDlg,ID_VOLUME_VALUE,new_volume,FALSE);
			hScrollWnd = GetDlgItem(hWndDlg,ID_VOLUME_SCROLL);
			SetScrollRange(hScrollWnd,SB_CTL,MIN_VOLUME,MAX_VOLUME,FALSE);
			SetScrollPos(hScrollWnd,SB_CTL,new_volume,TRUE);

			SetDlgItemInt(hWndDlg,ID_RATE_VALUE,new_rate,FALSE);
			hScrollWnd = GetDlgItem(hWndDlg,ID_RATE_SCROLL);
			SetScrollRange(hScrollWnd,SB_CTL,MIN_RATE,MAX_RATE,FALSE);
			SetScrollPos(hScrollWnd,SB_CTL,new_rate,TRUE);

			CheckRadioButton(hWndDlg,ID_VOICE_PAUL,ID_VOICE_VAL,new_voice+ID_VOICE_PAUL);

			break;
                           
		case WM_CLOSE:

         PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
         break;

		case WM_HSCROLL:

			if(GetDlgCtrlID((HWND)HIWORD(lParam)) == ID_VOLUME_SCROLL)
				{
				switch(wParam)	{
					case	SB_LINEDOWN	:
						new_volume = (new_volume >= MAX_VOLUME) ? MAX_VOLUME : new_volume+1;
						break;
					case	SB_PAGEDOWN	:
						new_volume = (new_volume >= MAX_VOLUME-VOLUME_DELTA) ? MAX_VOLUME : new_volume+VOLUME_DELTA;
						break;
					case	SB_LINEUP	:
						new_volume = (new_volume <= MIN_VOLUME) ? MIN_VOLUME : new_volume-1;
						break;
					case	SB_PAGEUP	:
						new_volume = (new_volume <= MIN_VOLUME+VOLUME_DELTA) ? MIN_VOLUME : new_volume-VOLUME_DELTA;
						break;
					case	SB_BOTTOM	:
						new_volume = MIN_VOLUME;
						break;
					case	SB_TOP	:
						new_volume = MAX_VOLUME;
						break;
					case	SB_THUMBPOSITION	:
					case	SB_THUMBTRACK	:
						new_volume = LOWORD(lParam);
						break;
					}
				while(dtpcVolumeSet(ReadModule,new_volume) != DLL_SUCCESS);
				SetDlgItemInt(hWndDlg,ID_VOLUME_VALUE,new_volume,FALSE);
				hScrollWnd = GetDlgItem(hWndDlg,ID_VOLUME_SCROLL);
				SetScrollPos(hScrollWnd,SB_CTL,new_volume,TRUE);
				}

			else if(GetDlgCtrlID((HWND)HIWORD(lParam)) == ID_RATE_SCROLL)
				{
				switch(wParam)	{
				
					case	SB_LINEDOWN	:
						new_rate = (new_rate >= MAX_RATE) ? MAX_RATE : new_rate+1;
						break;
					case	SB_PAGEDOWN	:
						new_rate = (new_rate >= MAX_RATE-RATE_DELTA) ? MAX_RATE : new_rate+RATE_DELTA;
						break;
					case	SB_LINEUP	:
						new_rate = (new_rate <= MIN_RATE) ? MIN_RATE : new_rate-1;
						break;
					case	SB_PAGEUP	:
						new_rate = (new_rate <= MIN_RATE+RATE_DELTA) ? MIN_RATE : new_rate-RATE_DELTA;
						break;
					case	SB_BOTTOM	:
						new_rate = MIN_RATE;
						break;
					case	SB_TOP	:
						new_rate = MAX_RATE;
						break;
					case	SB_THUMBPOSITION	:
					case	SB_THUMBTRACK	:
						new_rate = LOWORD(lParam);
						break;
					}
				while(dtpcImmdRate(ReadModule,new_rate) != DLL_SUCCESS);
				SetDlgItemInt(hWndDlg,ID_RATE_VALUE,new_rate,FALSE);
				hScrollWnd = GetDlgItem(hWndDlg,ID_RATE_SCROLL);
				SetScrollPos(hScrollWnd,SB_CTL,new_rate,TRUE);
				}
			break;


		
		case WM_COMMAND:

			if(wParam >= ID_VOICE_PAUL && wParam <= ID_VOICE_VAL)
				{
				new_voice = wParam-ID_VOICE_PAUL;
				while(dtpcImmdVoice(0,new_voice) != DLL_SUCCESS);
				}
			else switch(wParam)
           		{
            	case IDOK:

							temp = GetDlgItemInt(hWndDlg,ID_VOLUME_VALUE,(BOOL FAR *)&ok_flag,FALSE);
							if(ok_flag)
								{
								if(temp < MIN_VOLUME)
									{
									SetDlgItemInt(hWndDlg,ID_VOLUME_VALUE,MIN_VOLUME,FALSE);
									break;
									}
								if (temp > MAX_VOLUME)
									{
									SetDlgItemInt(hWndDlg,ID_VOLUME_VALUE,MAX_VOLUME,FALSE);
									break;
									}
								if(new_volume != temp)
									{
									new_volume = temp;
									while(dtpcVolumeSet(ReadModule,new_volume) != DLL_SUCCESS);
									hScrollWnd = GetDlgItem(hWndDlg,ID_VOLUME_SCROLL);
									SetScrollPos(hScrollWnd,SB_CTL,temp,TRUE);
									}
								}
							else
								SetDlgItemInt(hWndDlg,ID_VOLUME_VALUE,new_volume,FALSE);

							temp = GetDlgItemInt(hWndDlg,ID_RATE_VALUE,(BOOL FAR *)&ok_flag,FALSE);
							if(ok_flag)
								{
								if(temp < MIN_RATE)
									{
									SetDlgItemInt(hWndDlg,ID_RATE_VALUE,MIN_RATE,FALSE);
									break;
									}
								if (temp > MAX_RATE)
									{
									SetDlgItemInt(hWndDlg,ID_RATE_VALUE,MAX_RATE,FALSE);
									break;
									}
								if(new_rate != temp)
									{
									new_rate = temp;
									while(dtpcImmdRate(ReadModule,new_rate) != DLL_SUCCESS);
									hScrollWnd = GetDlgItem(hWndDlg,ID_RATE_SCROLL);
									SetScrollPos(hScrollWnd,SB_CTL,temp,TRUE);
									}
								}
							else
								SetDlgItemInt(hWndDlg,ID_RATE_VALUE,new_rate,FALSE);
						break;

					case	ID_FLUSH:

						while(dtpcFlushText(0) != DLL_SUCCESS);
						if(IndexFlag)
							wsrResetIndex();
						break;
						
					case	ID_PAUSE:
						
						while(dtpcPause(0) != DLL_SUCCESS);
						break;

					case	ID_RESUME:
						while(dtpcResume(0) != DLL_SUCCESS);
						break;
 
					case	ID_ABORT:
						AbortFlag = true;
						while(dtpcFlushText(0) != DLL_SUCCESS);
						break;
            		}
         	break;
		default:
        return FALSE;
	}
	return TRUE;
}



BOOL FAR PASCAL wsrTextDlg(HWND hWndDlg, WORD Message, WORD wParam, LONG lParam)
{

	switch(Message)
		{
		case WM_INITDIALOG:

			wsrCenter(hWndDlg);
			CheckRadioButton(hWndDlg,ID_NO_TEXT,ID_HIGHLIGHT_LINE,UserTextControl);
			CheckDlgButton(hWndDlg,ID_READ_CONTROL,UserReadControl);
			CheckDlgButton(hWndDlg,ID_PAUSE_CONTROL,UserPauseControl);

			break;
                           
		case WM_CLOSE:

         PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
         break;

		case WM_COMMAND:

			switch(wParam)
           	{
            case IDOK:
					for(UserTextControl=ID_NO_TEXT;UserTextControl<=ID_HIGHLIGHT_LINE;UserTextControl++)
						if(IsDlgButtonChecked(hWndDlg,UserTextControl))
							break;
					if(IsDlgButtonChecked(hWndDlg,ID_READ_CONTROL))
						UserReadControl = true;
					else
						UserReadControl = false;
/* Took out pause cuz it slowed windows down.  ADN  7/11/95 */
/*					if(IsDlgButtonChecked(hWndDlg,ID_PAUSE_CONTROL))
						UserPauseControl = true;	 
					else								  */
					UserPauseControl = false;   
					EndDialog(hWndDlg, TRUE);
               break;

            case IDCANCEL:
					EndDialog(hWndDlg, FALSE);
					break;
           	}
         break;

		default:
        return FALSE;
	}
	return TRUE;
}


void wsrFileInit()
{
	wsrDirectory[0] = '\0';
	wsrFileName[0] = '\0';
	wsrFileTitle[0] = '\0';
	wsrFile = 0;
	hReadBuff = 0;
	read_buff = (char _huge *)0L;
	ReadControl = 0;
	BytesAvail = 0;
	ByteIndex = 0;
	AbortFlag = false;
	ReadFlag = false;
	UserReadControl = true;
	UserPauseControl = false;
	UserTextControl = ID_NO_TEXT;
	ReadWait = GetTickCount();
}



