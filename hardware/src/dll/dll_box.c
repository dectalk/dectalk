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
 *    File Name:	dll_box.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  Configuration boxes ....
 *
 ***********************************************************************
 *    Revision History:
 */

#include "dll.h"
#include	"dll_prot.h"


/*
 *  Main config box ... this one spawns the others ....
 */

BOOL FAR PASCAL _loadds _dtpcConfigDlg(HWND hWndDlg, WORD Message, WORD wParam, LONG lParam)
{

	switch(Message)
		{
		case WM_INITDIALOG:
         _dtpcCenter(hWndDlg);
         break;
                           
		case WM_CLOSE:
			PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
			break;
           
		case WM_COMMAND:
         switch(wParam)
           {								
            case IDM_OUTPUT			:

				   DialogBox(dtpcInst, MAKEINTATOM(DLG_OUTPUT), hWndDlg, (FARPROC)_dtpcOutputDlg);
               break;

            case IDM_SPEECH 			:

				   DialogBox(dtpcInst, MAKEINTATOM(DLG_SPEECH), hWndDlg, (FARPROC)_dtpcSpeechDlg);
               break;

            case IDM_SETTINGS			:

				   DialogBox(dtpcInst, MAKEINTATOM(DLG_SETTINGS), hWndDlg, (FARPROC)_dtpcSettingsDlg);
               break;

				case IDM_CUSTOM			:

				   DialogBox(dtpcInst, MAKEINTATOM(DLG_CUSTOM), hWndDlg, (FARPROC)_dtpcCustomDlg);
               break;

				case IDM_FILES			:

				   DialogBox(dtpcInst, MAKEINTATOM(DLG_FILES), hWndDlg, (FARPROC)_dtpcFilesDlg);
               break;

				case IDM_STRINGS			:

				   DialogBox(dtpcInst, MAKEINTATOM(DLG_STRINGS), hWndDlg, (FARPROC)_dtpcStringsDlg);
               break;

				case ID_REVERT	:
					_dtpcLoadSettings();
					break;
				
				case ID_SAVE	:
					_dtpcSaveSettings();
               EndDialog(hWndDlg, TRUE);
					break;

				case IDOK:
               EndDialog(hWndDlg, TRUE);
               break;
           }
         break;
    default:
        return FALSE;
   }
 return TRUE;
}


/*
 *  change the voice, rate, comma pause, period pause ...
 */

int	new_voice,new_rate,new_comma,new_period;

BOOL FAR PASCAL _loadds _dtpcSpeechDlg(HWND hWndDlg, WORD Message, WORD wParam, LONG lParam)
{

	HWND	hScrollWnd;


	switch(Message)
		{
		case WM_INITDIALOG:

         _dtpcCenter(hWndDlg);
/*
 *  check the proper voice button ...
 */
			new_voice = DTS.voice;
			CheckRadioButton(hWndDlg,ID_VOICE_PAUL,ID_VOICE_VAL,new_voice+ID_VOICE_PAUL);
/*
 *  set the correct rate ...
 */
			new_rate = DTS.rate;
			SetDlgItemInt(hWndDlg,ID_RATE_VALUE,new_rate,FALSE);
			hScrollWnd = GetDlgItem(hWndDlg,ID_RATE_SCROLL);
			SetScrollRange(hScrollWnd,SB_CTL,MIN_RATE,MAX_RATE,FALSE);
			SetScrollPos(hScrollWnd,SB_CTL,new_rate,TRUE);
/*
 *  set the correct period pause ...
 */
			new_period = DTS.period;
			SetDlgItemInt(hWndDlg,ID_PERIOD_VALUE,new_period,TRUE);
			hScrollWnd = GetDlgItem(hWndDlg,ID_PERIOD_SCROLL);
			SetScrollRange(hScrollWnd,SB_CTL,(MIN_PERIOD/10),(MAX_PERIOD/10),FALSE);
			SetScrollPos(hScrollWnd,SB_CTL,(new_period/10),TRUE);
/*
 *   and finally comma pause ...
 */
			new_comma = DTS.comma;
			SetDlgItemInt(hWndDlg,ID_COMMA_VALUE,new_comma,TRUE);
			hScrollWnd = GetDlgItem(hWndDlg,ID_COMMA_SCROLL);
			SetScrollRange(hScrollWnd,SB_CTL,(MIN_COMMA/10),(MAX_COMMA/10),FALSE);
			SetScrollPos(hScrollWnd,SB_CTL,new_comma,TRUE);
 			break;
                           
    case WM_CLOSE:
         PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
         break;

/*
 *  handle the scroll sliders ...
 */

		case WM_HSCROLL:

			if(GetDlgCtrlID((HWND)HIWORD(lParam)) == ID_RATE_SCROLL)
				{
				_dtpcSetScroll(	hWndDlg,
										ID_RATE_VALUE,
										ID_RATE_SCROLL,
										wParam,
										LOWORD(lParam),
										(int _far *)&new_rate,
										MIN_RATE,
										MAX_RATE,
										false);
				}
			else if(GetDlgCtrlID((HWND)HIWORD(lParam)) == ID_PERIOD_SCROLL)
				{
				_dtpcSetScroll(	hWndDlg,
										ID_PERIOD_VALUE,
										ID_PERIOD_SCROLL,
										wParam,
										LOWORD(lParam),
										(int _far *)&new_period,
										MIN_PERIOD,
										MAX_PERIOD,
										false);
				}		
			else if(GetDlgCtrlID((HWND)HIWORD(lParam)) == ID_COMMA_SCROLL)
				{
				_dtpcSetScroll(	hWndDlg,
										ID_COMMA_VALUE,
										ID_COMMA_SCROLL,
										wParam,
										LOWORD(lParam),
										(int _far *)&new_comma,
										MIN_COMMA,
										MAX_COMMA,
										false);
					}
			break;
   
    case WM_COMMAND:

         switch(wParam)
           {
            case ID_VOICE_BETTY:
            case ID_VOICE_DENNIS:
            case ID_VOICE_FRANK:
            case ID_VOICE_HARRY:
            case ID_VOICE_THE_KID:
            case ID_VOICE_PAUL:
            case ID_VOICE_RITA:
            case ID_VOICE_URSULA:
            case ID_VOICE_VAL:
            case ID_VOICE_WILLY:
					new_voice = wParam-ID_VOICE_PAUL;
					break;

            case IDOK:

						_dtpcReadOkValue(	hWndDlg,
												ID_RATE_VALUE,
												ID_RATE_SCROLL,
												(int _far *)&new_rate,
												MIN_RATE,
												MAX_RATE,
												DTS.rate,
												false);
						_dtpcReadOkValue(	hWndDlg,
												ID_PERIOD_VALUE,
												ID_PERIOD_SCROLL,
												(int _far *)&new_period,
												MIN_PERIOD,
												MAX_PERIOD,
												DTS.period,
												false);
						_dtpcReadOkValue(	hWndDlg,
												ID_COMMA_VALUE,
												ID_COMMA_SCROLL,
												(int _far *)&new_comma,
												MIN_COMMA,
												MAX_COMMA,
												DTS.comma,
												false);


            case ID_TEST:

					if(DTC.loaded == true)
						{
						_dtpcSendSetString(new_voice,voice_cmd);
						_dtpcSendSetString(new_rate,rate_cmd);
						_dtpcSendSetString(new_period,period_cmd);
						_dtpcSendSetString(new_comma,comma_cmd);
						_dtpcSayTest();
						_dtpcSendSetString(DTS.voice,voice_cmd);
						_dtpcSendSetString(DTS.rate,rate_cmd);
						_dtpcSendSetString(DTS.period,period_cmd);
						_dtpcSendSetString(DTS.comma,comma_cmd);
						}
					else
						MessageBox(hWndDlg,"Module must be loaded first.","DECtalk(TM) PC",MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
               break;

            case ID_SET:

					DTS.period = new_period;
					DTS.comma = new_comma;
					DTS.rate = new_rate;
					DTS.voice = new_voice;
					if(DTC.loaded == true)
						{
						_dtpcSendSetString(DTS.voice,voice_cmd);
						_dtpcSendSetString(DTS.rate,rate_cmd);
						_dtpcSendSetString(DTS.period,period_cmd);
						_dtpcSendSetString(DTS.comma,comma_cmd);
						}
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

/*
 *  change the default punctuation mode ...
 */

int new_mode,new_punct,new_say,new_log;

BOOL FAR PASCAL _loadds _dtpcSettingsDlg(HWND hWndDlg, WORD Message, WORD wParam, LONG lParam)
{

	int	i,button_state;

 switch(Message)
   {
    case WM_INITDIALOG:
         _dtpcCenter(hWndDlg);
			new_punct = DTS.punct;
			CheckRadioButton(hWndDlg,ID_PUNCT_NONE,ID_PUNCT_ALL,ID_PUNCT_NONE+new_punct);
			new_say = DTS.say;
			CheckRadioButton(hWndDlg,ID_SAY_LETTER,ID_SAY_LINE,ID_SAY_LETTER+new_say);
			for(i=0;i<6;i++)
				{
				button_state = (DTS.mode & (1<<i)) ? true : false;
				CheckDlgButton(hWndDlg,ID_MODE_MATH+i,button_state);
				}
			for(i=0;i<4;i++)
				{
				button_state = (DTS.log & (1<<i)) ? true : false;
				CheckDlgButton(hWndDlg,ID_LOG_TEXT+i,button_state);
				}
			break;
                           
    case WM_CLOSE:
         PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
         break;
           
    case WM_COMMAND:

         switch(wParam)
           {
            case ID_SET:

					new_mode = 0;
					for(i=0;i<6;i++)
						new_mode |= (IsDlgButtonChecked(hWndDlg,ID_MODE_MATH+i)<<i);
					new_log = 0;
					for(i=0;i<4;i++)
						new_log |= (IsDlgButtonChecked(hWndDlg,ID_LOG_TEXT+i)<<i);
					for(new_say=0;new_say<4;new_say++)
						if(IsDlgButtonChecked(hWndDlg,ID_SAY_LETTER+new_say))
							break;
					for(new_punct=0;new_punct<3;new_punct++)
						if(IsDlgButtonChecked(hWndDlg,ID_PUNCT_NONE+new_punct))
							break;

					if(DTC.loaded == true)
						{
						_dtpcSendSetString(DTS.mode,mode_cmd);
						_dtpcSendSetString(DTS.log,log_cmd);
						_dtpcSendSetString(DTS.say,say_cmd);
						_dtpcSendSetString(DTS.punct,punct_cmd);
						}
					DTS.mode = new_mode;
					DTS.log = new_log;
					DTS.say = new_say;
					DTS.punct = new_punct;
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

int new_volume,new_timeout,new_error;

BOOL FAR PASCAL _loadds _dtpcOutputDlg(HWND hWndDlg, WORD Message, WORD wParam, LONG lParam)
{

	HWND	hScrollWnd;
	

	switch(Message)
		{
		case WM_INITDIALOG:

			_dtpcCenter(hWndDlg);
			new_volume = DTS.volume;
			SetDlgItemInt(hWndDlg,ID_VOLUME_VALUE,new_volume,FALSE);
			hScrollWnd = GetDlgItem(hWndDlg,ID_VOLUME_SCROLL);
			SetScrollRange(hScrollWnd,SB_CTL,MIN_VOLUME,MAX_VOLUME,FALSE);
			SetScrollPos(hScrollWnd,SB_CTL,MAX_VOLUME-new_volume,TRUE);
			new_timeout = DTS.timeout;
			SetDlgItemInt(hWndDlg,ID_TIMEOUT_VALUE,new_timeout,FALSE);
			hScrollWnd = GetDlgItem(hWndDlg,ID_TIMEOUT_SCROLL);
			SetScrollRange(hScrollWnd,SB_CTL,MIN_TIMEOUT,MAX_TIMEOUT,FALSE);
			SetScrollPos(hScrollWnd,SB_CTL,MAX_TIMEOUT-new_timeout,TRUE);
			new_error = DTS.error;
			CheckRadioButton(hWndDlg,ID_ERROR_IGNORE,ID_ERROR_TONE,new_error+ID_ERROR_IGNORE);
			break;
                           
		case WM_CLOSE:

         PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
         break;

		case WM_VSCROLL:

			if(GetDlgCtrlID((HWND)HIWORD(lParam)) == ID_VOLUME_SCROLL)
				{
				_dtpcSetScroll(	hWndDlg,
										ID_VOLUME_VALUE,
										ID_VOLUME_SCROLL,
										wParam,
										LOWORD(lParam),
										(int _far *)&new_volume,
										MIN_VOLUME,
										MAX_VOLUME,
										true);
					}
			else if(GetDlgCtrlID((HWND)HIWORD(lParam)) == ID_TIMEOUT_SCROLL)
				{
				_dtpcSetScroll(	hWndDlg,
										ID_TIMEOUT_VALUE,
										ID_TIMEOUT_SCROLL,
										wParam,
										LOWORD(lParam),
										(int _far *)&new_timeout,
										MIN_TIMEOUT,
										MAX_TIMEOUT,
										true);
				}
			break;

		
		case WM_COMMAND:

         	switch(wParam)
           		{
	            case ID_ERROR_IGNORE:
	            case ID_ERROR_TEXT:
	            case ID_ERROR_ESCAPE:
	            case ID_ERROR_SPEAK:
	            case ID_ERROR_TONE:
						new_error = wParam-ID_ERROR_IGNORE;
					break;

             	case IDOK:

						_dtpcReadOkValue(	hWndDlg,
												ID_VOLUME_VALUE,
												ID_VOLUME_SCROLL,
												(int _far *)&new_volume,
												MIN_VOLUME,
												MAX_VOLUME,
												DTS.volume,
												true);
						_dtpcReadOkValue(	hWndDlg,
												ID_TIMEOUT_VALUE,
												ID_TIMEOUT_SCROLL,
												(int _far *)&new_timeout,
												MIN_TIMEOUT,
												MAX_TIMEOUT,
												DTS.timeout,
												true);
						break;


            	case ID_TEST:

						if(DTC.loaded == true)
							{
							_dtpcSendSetString(new_error,error_cmd);
							_dtpcSendSetString(new_volume,volume_cmd);
							_dtpcSayTest();
							_dtpcSendSetString(DTS.error,error_cmd);
							_dtpcSendSetString(DTS.volume,volume_cmd);
							}
						else
							MessageBox(hWndDlg,"Module must be loaded first.","DECtalk(TM) PC",MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
						break;

            	case ID_SET:

						DTS.volume = new_volume;
						if(DTC.loaded == true)
							_dtpcDoImmd(CMD_control+CTRL_vol_set,new_volume);
						EndDialog(hWndDlg, FALSE);
						break;

					case	IDCANCEL:
						EndDialog(hWndDlg, FALSE);
						break;
           		}
         	break;
		default:
        return FALSE;
	}
	return TRUE;
}



char	save_strings[10][INI_STRING_SIZE];

#define	CLEAR_STRING	((unsigned char _far *)&save_strings[0][0])
#define	TEMP_STRING		((char _far *)&save_strings[1][0])

#define	NEW_WELCOME		((char _far *)&save_strings[2][0])
#define	NEW_TEST			((char _far *)&save_strings[3][0])

#define	NEW_PATH			((char _far *)&save_strings[2][0])
#define	NEW_KERNEL		((char _far *)&save_strings[3][0])
#define	NEW_DIC			((char _far *)&save_strings[4][0])
#define	NEW_LTS			((char _far *)&save_strings[5][0])
#define	NEW_PH			((char _far *)&save_strings[6][0])
#define	NEW_CMD			((char _far *)&save_strings[7][0])
#define	NEW_LANG			((char _far *)&save_strings[8][0])
#define	NEW_CODE			((char _far *)&save_strings[9][0])


BOOL FAR PASCAL _loadds _dtpcStringsDlg(HWND hWndDlg, WORD Message, WORD wParam, LONG lParam)
{


	switch(Message)
		{
		case WM_INITDIALOG:

			_dtpcCenter(hWndDlg);
			memset(CLEAR_STRING,' ',INI_STRING_SIZE);
			save_strings[0][INI_STRING_SIZE-1]=0;
			SetDlgItemText(hWndDlg,ID_WELCOMESTR,CLEAR_STRING);
			SetDlgItemText(hWndDlg,ID_TESTSTR,CLEAR_STRING);
			lstrcpy(NEW_WELCOME,(char _far *)DTS.welcome_string);
			lstrcpy(NEW_TEST,(char _far *)DTS.test_string);
			SetDlgItemText(hWndDlg,ID_WELCOMESTR,NEW_WELCOME);
			SetDlgItemText(hWndDlg,ID_TESTSTR,NEW_TEST);
			break;
                           
		case WM_CLOSE:

         PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
         break;

		case WM_COMMAND:

         	switch(wParam)
           		{

            	case ID_TEST:

						if(DTC.loaded)
							{
							_dtpcGetStringDlg(	hWndDlg,
														ID_WELCOMESTR,
														NEW_WELCOME,
														(char _far *)DTS.welcome_string,
														INI_STRING_SIZE);
							_dtpcGetStringDlg(	hWndDlg,
														ID_TESTSTR,
														NEW_TEST,
														(char _far *)DTS.test_string,
														INI_STRING_SIZE);
							_dtpcSendInitBuff(NEW_WELCOME);
							_dtpcSendInitChar(0xb);
							_dtpcSendInitBuff(NEW_TEST);
							_dtpcSendInitChar(0xb);
							}
						else
							MessageBox(hWndDlg,"Module must be loaded first.","DECtalk(TM) PC",MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
						break;

            	case ID_SET:

						_dtpcGetStringDlg(	hWndDlg,
													ID_WELCOMESTR,
													NEW_WELCOME,
													(char _far *)&DTS.welcome_string[0],
													INI_STRING_SIZE);
						_dtpcGetStringDlg(	hWndDlg,
													ID_TESTSTR,
													NEW_TEST,
													(char _far *)&DTS.test_string[0],
													INI_STRING_SIZE);
						lstrcpy((char _far *)&DTS.test_string[0],NEW_TEST);
						lstrcpy((char _far *)&DTS.welcome_string[0],NEW_WELCOME);
						EndDialog(hWndDlg, FALSE);
						break;

					case	IDCANCEL:
						EndDialog(hWndDlg, FALSE);
						break;
           		}
         	break;
		default:
        return FALSE;
	}
	return TRUE;
}

BOOL FAR PASCAL _loadds _dtpcFilesDlg(HWND hWndDlg, WORD Message, WORD wParam, LONG lParam)
{

	switch(Message)
		{
		case WM_INITDIALOG:

			_dtpcCenter(hWndDlg);
			lstrcpy(NEW_PATH,(char _far *)&DTS.path_name[0]);
			lstrcpy(NEW_KERNEL,(char _far *)&DTS.kernel_name[0]);
			lstrcpy(NEW_DIC,(char _far *)&DTS.dic_name[0]);
			lstrcpy(NEW_LTS,(char _far *)&DTS.lts_name[0]);
			lstrcpy(NEW_PH,(char _far *)&DTS.ph_name[0]);
			lstrcpy(NEW_CMD,(char _far *)&DTS.cmd_name[0]);
			lstrcpy(NEW_LANG,(char _far *)&DTS.lang_name[0]);
			lstrcpy(NEW_CODE,(char _far *)&DTS.code_name[0]);
			SetDlgItemText(hWndDlg,ID_PATH,NEW_PATH);
			SetDlgItemText(hWndDlg,ID_KERNEL,NEW_KERNEL);
			SetDlgItemText(hWndDlg,ID_DIC,NEW_DIC);
			SetDlgItemText(hWndDlg,ID_LTS,NEW_LTS);
			SetDlgItemText(hWndDlg,ID_PH,NEW_PH);
			SetDlgItemText(hWndDlg,ID_CMD,NEW_CMD);
			SetDlgItemText(hWndDlg,ID_LANG,NEW_LANG);
			SetDlgItemText(hWndDlg,ID_CODE,NEW_CODE);
			break;
                           
		case WM_CLOSE:

         PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
         break;

		case WM_COMMAND:

         	switch(wParam)
           		{

            	case ID_SET:

						_dtpcGetStringDlg(hWndDlg,ID_PATH,NEW_PATH,(char _far *)&DTS.path_name[0],PATH_SIZE);
						_dtpcGetStringDlg(hWndDlg,ID_KERNEL,NEW_KERNEL,(char _far *)&DTS.kernel_name[0],FNAME_SIZE);
						_dtpcGetStringDlg(hWndDlg,ID_DIC,NEW_DIC,(char _far *)&DTS.dic_name[0],FNAME_SIZE);
						_dtpcGetStringDlg(hWndDlg,ID_PH,NEW_PH,(char _far *)&DTS.ph_name[0],FNAME_SIZE);
						_dtpcGetStringDlg(hWndDlg,ID_LTS,NEW_LTS,(char _far *)&DTS.lts_name[0],FNAME_SIZE);
						_dtpcGetStringDlg(hWndDlg,ID_CMD,NEW_CMD,(char _far *)&DTS.cmd_name[0],FNAME_SIZE);
						_dtpcGetStringDlg(hWndDlg,ID_LANG,NEW_LANG,(char _far *)&DTS.lang_name[0],FNAME_SIZE);
						_dtpcGetStringDlg(hWndDlg,ID_CODE,NEW_CODE,(char _far *)&DTS.code_name[0],FNAME_SIZE);
						lstrcpy((char _far *)&DTS.path_name[0],NEW_PATH);
						lstrcpy((char _far *)&DTS.kernel_name[0],NEW_KERNEL);
						lstrcpy((char _far *)&DTS.dic_name[0],NEW_DIC);
						lstrcpy((char _far *)&DTS.lts_name[0],NEW_LTS);
						lstrcpy((char _far *)&DTS.ph_name[0],NEW_PH);
						lstrcpy((char _far *)&DTS.cmd_name[0],NEW_CMD);
						lstrcpy((char _far *)&DTS.lang_name[0],NEW_LANG);
						lstrcpy((char _far *)&DTS.code_name[0],NEW_CODE);
						EndDialog(hWndDlg, FALSE);
						break;

					case	IDCANCEL:
						EndDialog(hWndDlg, FALSE);
						break;
           		}
         	break;
		default:
        return FALSE;
	}
	return TRUE;
}



void _dtpcReadOkValue(unsigned int dlg,int ctrlv,int ctrls,int _far *param,int min,int max,int def,int invert)
{
	int	temp;
	HWND	hScrollWnd;
	BOOL	ok_flag;

	temp = GetDlgItemInt(dlg,ctrlv,(BOOL FAR *)&ok_flag,TRUE);
	if(ok_flag)
		{
		if(temp < min)
			{
			(*param) = min;
			SetDlgItemInt(dlg,ctrlv,min,TRUE);
			return;
			}
		if (temp > max)
			{
			(*param) = max;
			SetDlgItemInt(dlg,ctrlv,max,TRUE);
			return;
			}
		if((*param) != temp)
			{
			(*param) = temp;
			hScrollWnd = GetDlgItem(dlg,ctrls);
			if(invert)
				SetScrollPos(hScrollWnd,SB_CTL,max-temp,TRUE);
			else
				SetScrollPos(hScrollWnd,SB_CTL,temp,TRUE);
			}
		}
	else
		{
		(*param) = def;
		SetDlgItemInt(dlg,ctrlv,def,TRUE);
		}
}

void _dtpcSetScroll(unsigned int dlg,int ctrlv,int ctrls,unsigned int action,int value,int __far *param,int min,int max,int invert)
{
	HWND	hScrollWnd;
	int	delta,scale;

	if(min < 0)
		{
		scale = 10;
		delta = max/4;
		}
	else
		{
		delta = (max-min)/8;
		scale = 1;
		}
	switch(action)	{
				
	case	SB_LINEUP	:
		if(invert)
			(*param) = ((*param) >= max) ? max : (*param)+1;
		else
			(*param) = ((*param) <= min) ? min : (*param)-1;
		break;

	case	SB_PAGEUP	:
		if(invert)
			(*param) = ((*param) >= max-delta) ? max : (*param)+delta;
		else
			(*param) = ((*param) <= delta) ? min : (*param)-delta;
		break;
	case	SB_LINEDOWN	:
		if(invert)
			(*param) = ((*param) <= min) ? min : (*param)-1;
		else
			(*param) = ((*param) >= max) ? max : (*param)+1;
		break;

		break;
	case	SB_PAGEDOWN	:
		if(invert)
			(*param) = ((*param) <= delta) ? min : (*param)-delta;
		else
			(*param) = ((*param) >= max-delta) ? max : (*param)+delta;
		break;
	case	SB_BOTTOM	:
		if(invert)
			(*param) = min;
		else
			(*param) = max;
		break;
	case	SB_TOP	:
		if(invert)
			(*param) = max;
		else
			(*param) = min;
		break;
	case	SB_THUMBPOSITION	:
	case	SB_THUMBTRACK	:
		if(invert)
			(*param) = (max-value)*scale;
		else
			(*param) = value*scale;
		break;
		}
	SetDlgItemInt(dlg,ctrlv,(*param),TRUE);
	hScrollWnd = GetDlgItem(dlg,ctrls);
	if(invert)
		SetScrollPos(hScrollWnd,SB_CTL,(max-(*param))/scale,TRUE);
	else
		SetScrollPos(hScrollWnd,SB_CTL,(*param)/scale,TRUE);
}

_dtpcGetStringDlg(unsigned int dlg,int ctrl,char __far *ns,char __far *ds,int size)
{

	int	length;

	if((length=GetDlgItemText(dlg,ctrl,TEMP_STRING,size)) == size)
		{
		MessageBox(dlg,"String too long","DECtalk(TM) PC",MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
		SetDlgItemText(dlg,ctrl,CLEAR_STRING);
		lstrcpy(ns,ds);
		SetDlgItemText(dlg,ctrl,ns);
		}
	save_strings[1][length]=0;
	lstrcpy(ns,TEMP_STRING);
	SetDlgItemText(dlg,ctrl,CLEAR_STRING);
	SetDlgItemText(dlg,ctrl,ns);
	return(1);
}
	
