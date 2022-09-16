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
 *    File Name:	dll_cust.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  Windows custom voice defines ...
 *
 ***********************************************************************
 *    Revision History:
 */

#include "dll.h"
#include "dll_prot.h"

#define ZAPF            2500            /* Magic f value to zap b constant of diff eqn  */
#define ZAPB            2048            /* Magic bw value to zap c constant of diff eqn */
#define MALE            1                       /* Value of malfem for male voice               */
#define FEMALE          0                       /* Value of malfem for female voice             */

struct slist{
	char name[30];
	};

char *sp_names[]  =
	{
    
	"Sex","SX",
	"Smoothness","SM",
	"Assertiveness","AS",
	"Average pitch","AP",
	"Pitch Range","PR",
	"Breathiness","BR",
	"Richness","RI",
	"Nasal Frication","NF",
	"Laryngealization","LA",
	"Head Size","HS",
	"Frequency 4th","F4",
	"Bandwidth 4th","B4",
	"Frequency 5th","F5",
	"Bandwidth 5th","B5",
	"Parallel freq. 4th","F7",
	"Parallel freq. 5th","F8",
	"Gain of Frication","GF",
	"Gain of Asperation","GH",
	"Gain of Voicing","GV",
	"Gain of Nasal","GN",
	"Gain of 5th","G1",
	"Gain of 4th","G2",
	"Gain of 3rd","G3",
	"Gain of 2nd","G4",
	"Loudness","G5",
	"F0 spectal tilt","FT",
	"F0 baseline fall","BF",
	"Lax folds","LX",
	"Quickness","QU",
	"Hat-pattern rise","HR",
	"Stress Rise","SR",
	(char)0,(char)0
};         



/*
 *  limits ....
 */

int sp_limit[] = {
	0,      1,                              /* SEX                  */
	0,      100,                            /* SM                   */
	0,      100,                            /* AS                   */
	50,     350,                            /* AP                   */
	0,      250,                            /* PR                   */
	0,      72,                             /* BR                   */
	0,      100,                            /* RI                   */
	0,      100,                            /* NF                   */
	0,      100,                            /* LA                   */
	65,     145,                            /* HS                   */
	2000,   4650,                           /* F4                   */
	100,    ZAPB,                           /* B4                   */
	2500,   4950,                           /* F5                   */
	100,    ZAPB,                           /* B5                   */
	2500,   4950,                           /* P4                   */
	2500,   4950,                           /* P5                   */
	0,      86,                             /* GF                   */
	0,      86,                             /* GH                   */
	0,      86,                             /* GV                   */
	0,      86,                             /* GN                   */
	0,      86,                             /* G1                   */
	0,      86,                             /* G2                   */
	0,      86,                             /* G3                   */
	0,      86,                             /* G4                   */
	0,      86,                             /* LO                   */
	0,      100,                            /* FT                   */
	0,      40,                             /* BF                   */
	0,      100,                            /* LX                   */
	0,      100,                            /* QU                   */
	2,      100,                            /* HR                   */
	1,      100                             /* SR                   */
};


unsigned int sp_defaults[] = {
	MALE,   /* SEX = m */
	   3,   /* SM (smoothness in %, actually spectral tilt offset) */
	 100,   /* AS (assertiveness, degree of final f0 fall in % */
	 122,   /* AP (Average pitch in Hz) */
	 100,   /* PR (pitch range in percent of Paul's range) */
	   0,   /* BR (breathiness in dB) */
	  70,   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	   0,   /* NF (additional fixed number of samples in nopen) */
	   0,   /* LA (laryngealization, in percent) */
	 100,   /* HS (head size, in percent relative to normal for SEX) */
	3300,   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	 260,   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	3650,   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	 330,   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3350,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	  70,   /* GF (gain of frication source in dB) */
	  70,   /* GH (gain of aspiration source in dB) */
	  65,   /* GV (gain of voicing source in dB ) */
	  74,   /* GN (gain of input to cascade nasal pole pair in dB) */
	  68,   /* G1 (gain of input to cascade 5th formant in dB) */
	  60,   /* G2 (gain of input to cascade 4th formant in dB) */
	  48,   /* G3 (gain of input to cascade 3rd formant in dB) */
	  64,   /* G4 (gain of input to cascade 2nd formant in dB) */
	  86,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	  75,   /* FT (f0-dependent spectral tilt in % of max) */
	  18,   /* BF (baseline f0 fall in Hz) */
	   0,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	  40,   /* QU (quickness of larynx gestures in % of max quickness) */
	  18,   /* HR (hat-pattern fundamental frequency rise in Hz) */
	  32    /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
};


int     curr_set[31];
int     new_set[31];
int     curr_param,new_delta,my_write;

#define CVAL    (DTS.val[curr_param])
#define NVAL    (new_set[curr_param])
#define SVAL    (curr_set[curr_param])
#define CMIN    (sp_limit[curr_param*2])
#define CMAX    (sp_limit[curr_param*2+1])
#define CTEXT   ((char _far *)&sp_names[curr_param*2][0])
#define CNAME   ((char _far *)&sp_names[curr_param*2+1][0])
#define CDEF    (sp_defaults[curr_param])

BOOL FAR PASCAL _loadds _dtpcCustomDlg(HWND hWndDlg, WORD Message, WORD wParam, LONG lParam)
{

	HWND    hScrollWnd;
	int     temp,ok_flag;
	

	switch(Message)
		{
		case WM_INITDIALOG:

	 _dtpcCenter(hWndDlg);
			for(curr_param=0;curr_param<31;curr_param++)
				NVAL = CVAL;
			_dtpcSetValDlg(hWndDlg,0);
			break;
			   
    case WM_CLOSE:
	 PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
	 break;

/*
 *  handle the scroll sliders ...
 */

		case WM_VSCROLL:

			if(GetDlgCtrlID((HWND)HIWORD(lParam)) == ID_CUSTOM_PSCROLL)
				{                                                 
			
				switch(wParam)  {
				
					case    SB_LINEDOWN     :
					case    SB_PAGEDOWN     :
						curr_param = (curr_param >= 30) ? 0 : curr_param+1;
						break;
					case    SB_LINEUP       :
					case    SB_PAGEUP       :
						curr_param = (curr_param <= 0) ? 30 : curr_param-1;
						break;
					case    SB_BOTTOM       :
						curr_param  = 0;
						break;
					case    SB_TOP  :
						curr_param = 30;
						break;
					case    SB_THUMBPOSITION        :
					case    SB_THUMBTRACK   :
						curr_param = LOWORD(lParam);
						break;
						}
				_dtpcSetValDlg(hWndDlg,curr_param);
				}

		case WM_HSCROLL:

			if(GetDlgCtrlID((HWND)HIWORD(lParam)) == ID_CUSTOM_VSCROLL)
				{
				switch(wParam)  {
				
					case    SB_LINEDOWN     :
						NVAL = (NVAL >= CMAX) ? CMAX : NVAL+1;
						break;
					case    SB_PAGEDOWN     :
						NVAL = (NVAL >= CMAX+new_delta) ? CMAX : NVAL+new_delta;
						break;
					case    SB_LINEUP       :
						NVAL = (NVAL <= CMIN) ? CMIN : NVAL-1;
						break;
					case    SB_PAGEUP       :
						NVAL = (NVAL <= CMIN) ? CMIN : NVAL-new_delta;
						break;
					case    SB_BOTTOM       :
						NVAL = CMIN;
						break;
					case    SB_TOP  :
						NVAL = CMIN;
						break;
					case    SB_THUMBPOSITION        :
					case    SB_THUMBTRACK   :
						NVAL = LOWORD(lParam);
						break;
						}
				SetDlgItemInt(hWndDlg,ID_CUSTOM_VALUE,NVAL,FALSE);
				hScrollWnd = GetDlgItem(hWndDlg,ID_CUSTOM_VSCROLL);
				SetScrollPos(hScrollWnd,SB_CTL,NVAL,TRUE);
				}               
			break;
   
    case WM_COMMAND:

			if(wParam >= ID_VAL_0 && wParam <= ID_VAL_30 && my_write == false)
				_dtpcSetValDlg(hWndDlg,wParam-ID_VAL_0);
			else switch(wParam)
	   {
				case    IDOK    :

						temp = GetDlgItemInt(hWndDlg,ID_CUSTOM_VALUE,(BOOL FAR *)&ok_flag,FALSE);
						if(ok_flag)
							{
							if(temp < CMIN)
								{
								SetDlgItemInt(hWndDlg,ID_CUSTOM_VALUE,CMIN,FALSE);
								break;
								}
							if (temp > CMAX)
								{
								SetDlgItemInt(hWndDlg,ID_CUSTOM_VALUE,CMAX,FALSE);
								break;
								}
							if(NVAL != temp)
								{
								NVAL = temp;
								hScrollWnd = GetDlgItem(hWndDlg,ID_CUSTOM_VSCROLL);
								SetScrollPos(hScrollWnd,SB_CTL,temp,TRUE);
								}
							}
						else
							SetDlgItemInt(hWndDlg,ID_CUSTOM_VALUE,NVAL,FALSE);
					break;

	    case ID_SET:

					for(curr_param=0;curr_param<31;curr_param++)
						CVAL = NVAL;
					if(DTC.loaded)
						_dtpcSetVal();
					EndDialog(hWndDlg, TRUE);
			break;

				case ID_CUSTOM_SAVE:

					for(curr_param=0;curr_param<31;curr_param++)
						CVAL = NVAL;
					if(DTC.loaded)
						{
						_dtpcSetVal();
						_dtpcSendInitBuff("[:dv save ]");
						_dtpcSendSetString(DTS.voice,voice_cmd);
						}
					EndDialog(hWndDlg, TRUE);
			break;


				case    ID_CUSTOM_CURRENT       :

					if(DTC.loaded)
						{
						for(curr_param=0;curr_param<31;curr_param++)
							{
							temp = curr_param;
							_dtpcDoImmdGet(CMD_control+CTRL_speech+CTRL_SP_get_param,(unsigned int _far *)&temp);
							NVAL = temp;
							}
						_dtpcSetValDlg(hWndDlg,0);
						}
					else
						MessageBox(hWndDlg,"Module must be loaded first.","DECtalk(TM) PC",MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
					break;

	    case ID_TEST:

					if(DTC.loaded)
						{
						ok_flag = curr_param;
						for(curr_param=0;curr_param<31;curr_param++)
							{
							temp = curr_param;
							_dtpcDoImmdGet(CMD_control+CTRL_speech+CTRL_SP_get_param,(unsigned int _far *)&temp);
							SVAL = temp;
							}
						for(curr_param=0;curr_param<31;curr_param++)
							{
							wsprintf(temp_buff,"[:dv %s %d]",CNAME,NVAL);
							_dtpcSendInitBuff(temp_buff);
							}
						_dtpcSayTest();
						for(curr_param=0;curr_param<31;curr_param++)
							{
							wsprintf(temp_buff,"[:dv %s %d]",CNAME,SVAL);
							_dtpcSendInitBuff(temp_buff);
							}
						curr_param = ok_flag;
						}
					else
						MessageBox(hWndDlg,"Module must be loaded first.","DECtalk(TM) PC",MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
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
 *  Init file load and store ...
 */

void _dtpcLoadVal()
{
	dtpcSectionName[SECTION_MOD_OFFSET] = '0'+module_index;
	for(curr_param=0;curr_param<31;curr_param++)
		{
		wsprintf(temp_buff,"Val_%s",CNAME);
		DTS.val[curr_param] = GetPrivateProfileInt(dtpcSectionName,FTEMP_BUFF,CDEF,dtpcIniFile);
		}
}

void _dtpcSaveVal()
{
	char    val_buff[10];

	dtpcSectionName[SECTION_MOD_OFFSET] = '0'+module_index;
	for(curr_param=0;curr_param<31;curr_param++)
		{
		wsprintf(temp_buff,"Val_%s",CNAME);
		wsprintf(val_buff,"%d",CVAL);
		WritePrivateProfileString(dtpcSectionName,FTEMP_BUFF,(char _far *)&val_buff[0],dtpcIniFile);
		}
}

void _dtpcSetVal()
{
	for(curr_param=0;curr_param<31;curr_param++)
		{
		wsprintf(temp_buff,"[:dv %s %d]",CNAME,CVAL);
		_dtpcSendInitBuff(temp_buff);
		}
}
	
_dtpcSetValDlg(HWND hWndDlg,int param)
/*HWND hWndDlg; */
/*int param; */
{

	HWND    hScrollWnd;
/*
 *  first, fill in the boxes ...
 */
	my_write = true;
	for(curr_param = 0;curr_param < 31; curr_param++)
		{
		wsprintf(temp_buff,"%s: %d",CNAME,NVAL);
		SetDlgItemText(hWndDlg,ID_VAL_0+curr_param,temp_buff);
		}

	curr_param = param;
	new_delta = (CMAX-CMIN)/4;
	if(new_delta == 0)
		new_delta = 1;
	wsprintf(temp_buff,"%s (%s)",CTEXT,CNAME);
	SetDlgItemText(hWndDlg,ID_CUSTOM_TEXT,temp_buff);
	SetDlgItemInt(hWndDlg,ID_CUSTOM_VALUE,NVAL,FALSE);
	wsprintf(temp_buff,"Min: %d",CMIN);
	SetDlgItemText(hWndDlg,ID_CUSTOM_MIN,temp_buff);
	wsprintf(temp_buff,"Max: %d",CMAX);
	SetDlgItemText(hWndDlg,ID_CUSTOM_MAX,temp_buff);

/*
 *  set the param scroll ...
 */

	hScrollWnd = GetDlgItem(hWndDlg,ID_CUSTOM_PSCROLL);
	SetScrollRange(hScrollWnd,SB_CTL,1,30,TRUE);
	SetScrollPos(hScrollWnd,SB_CTL,curr_param,TRUE);

/*
 *  set the param scroll ...
 */

	hScrollWnd = GetDlgItem(hWndDlg,ID_CUSTOM_VSCROLL);
	SetScrollRange(hScrollWnd,SB_CTL,CMIN,CMAX,TRUE);
	SetScrollPos(hScrollWnd,SB_CTL,NVAL,TRUE);
	my_write = false;
	return(1);
}

