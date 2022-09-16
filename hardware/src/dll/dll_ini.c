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
 *    File Name:	dll_ini.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  dectalk.ini file settings ...
 *  DECtalk PC has three basic types of string, value (eg [:vol set 10]),
 *  direct settings (eg [:name paul]), and flags (eg [:log type on]), so
 *  here are the routines that load them out of the init file and send
 *  them on over ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */
 
#include "dll.h"
#include "dll_prot.h"

char    dtpcIniFile[]="dectalk.ini";
char    dtpcSectionName[]="module_0";

#define STRING_VALUE            ((unsigned char *)0)
#define STRING_DIRECT           ((unsigned char *)1)
#define STRING_FLAGS            ((unsigned char *)2)


char *voice_cmd[] = {
	"[:np]",
	"[:nb]",
	"[:nh]",
	"[:nf]",
	"[:nd]",
	"[:nk]",
	"[:nu]",
	"[:nr]",
	"[:nw]",
	"[:nv]" ,
	(char *)0,
/*      0,  */
STRING_DIRECT
};

char *punct_cmd[] = {
	"[:punct none]",
	"[:punct some]",
	"[:punct all]" ,
	(char *)        0,
	(char *)STRING_DIRECT
	};

char *say_cmd[] = {
	"[:say letter]",
	"[:say word]",
	"[:say clause]",
	"[:say line]",
	(char *)0,
	(char *)STRING_DIRECT
};

 char *error_cmd[] = {
	"[:error ignore]",
	"[:error text]",
	"[:error escape]",
	"[:error speak]",
	"[:error tone]",
	(char *)0,
	(char *)STRING_DIRECT
};


char *log_cmd[] = {
	"[:log text off]",              "[:log text on]",
	"[:log phonemes off]",  "[:log phonemes on]",
	"[:log forms off]",             "[:log forms on]",
	"[:log types off]",             "[:log types on]",
	(char *)0,
	(char *)STRING_FLAGS
};

 char *mode_cmd[] = {
	"[:mode math off]",             "[:mode math on]",
	"[:mode euro off]",             "[:mode euro on]",
	"[:mode spel off]",             "[:mode spel on]",
	"[:mode name off]",             "[:mode name on]",
	"[:mode homo off]",             "[:mode homo on]",
	"[:mode cita off]",             "[:mode cita on]",
	(char *)0,
	(char *)STRING_FLAGS
};
	
 char *volume_cmd[] =   {
	"[:volume set ",
	(char *)0,
	(char *)STRING_VALUE
};

 char *rate_cmd[] = {
	"[:rate ",
	(char *)0,
	(char *)STRING_VALUE
};

 char *timeout_cmd[] = {
	"[:timeout ",
	(char *)0,
	(char *)STRING_VALUE
};

 char *period_cmd[] =   {
	"[:pp ",
	(char *)0,
	(char *)STRING_VALUE
};

 char *comma_cmd[] = {
	"[:cp ",
	(char *)0,
	(char *)STRING_VALUE
};


unsigned  int __far __pascal _dtpcLoadSettings()
{
	


	memset((unsigned char _far *)&DTS.settings_loaded,0,sizeof(struct dectalk_settings));
	dtpcSectionName[SECTION_MOD_OFFSET] = '0'+module_index;

/*
 *  load file names ...
 */

	if(GetPrivateProfileString(dtpcSectionName,"Path","",&DTS.path_name[0],PATH_SIZE,dtpcIniFile) == 0)
		{
		MessageBox(0,"No DECtalk init file found","DECtalk(TM) PC",(MB_OK|MB_ICONASTERISK|MB_SYSTEMMODAL));
		return(DLL_FAILURE);
		}
	GetPrivateProfileString(dtpcSectionName,"Kernel","kernel.sys",&DTS.kernel_name[0],FNAME_SIZE,dtpcIniFile);
	GetPrivateProfileString(dtpcSectionName,"Dictionary","dtpc.dic",&DTS.dic_name[0],FNAME_SIZE,dtpcIniFile);
	GetPrivateProfileString(dtpcSectionName,"Lts","lts.exe",&DTS.lts_name[0],FNAME_SIZE,dtpcIniFile);
	GetPrivateProfileString(dtpcSectionName,"Ph","ph.exe",&DTS.ph_name[0],FNAME_SIZE,dtpcIniFile);
	GetPrivateProfileString(dtpcSectionName,"Cmd","cmd.exe",&DTS.cmd_name[0],FNAME_SIZE,dtpcIniFile);
	GetPrivateProfileString(dtpcSectionName,"Lang","usa.exe",&DTS.lang_name[0],FNAME_SIZE,dtpcIniFile);
	GetPrivateProfileString(dtpcSectionName,"CodePage","",&DTS.code_name[0],FNAME_SIZE,dtpcIniFile);
	GetPrivateProfileString(dtpcSectionName,"Test","",&DTS.test_string[0],INI_STRING_SIZE,dtpcIniFile);
	GetPrivateProfileString(dtpcSectionName,"Welcome","",&DTS.welcome_string[0],INI_STRING_SIZE,dtpcIniFile);

/*
 *  integer values ...
 */

	DTS.volume = GetPrivateProfileInt(dtpcSectionName,"Volume",DEF_VOLUME,dtpcIniFile);
	DTS.rate = GetPrivateProfileInt(dtpcSectionName,"Rate",DEF_RATE,dtpcIniFile);
	DTS.period = GetPrivateProfileInt(dtpcSectionName,"Period",DEF_PERIOD,dtpcIniFile);
	DTS.comma = GetPrivateProfileInt(dtpcSectionName,"Comma",DEF_COMMA,dtpcIniFile);
	DTS.log = GetPrivateProfileInt(dtpcSectionName,"Log",DEF_LOG,dtpcIniFile);
	DTS.mode = GetPrivateProfileInt(dtpcSectionName,"Mode",DEF_MODE,dtpcIniFile);
	DTS.error = GetPrivateProfileInt(dtpcSectionName,"Error",DEF_ERROR,dtpcIniFile);
	DTS.timeout = GetPrivateProfileInt(dtpcSectionName,"Timeout",DEF_TIMEOUT,dtpcIniFile);
	DTS.punct = GetPrivateProfileInt(dtpcSectionName,"Punct",DEF_PUNCT,dtpcIniFile);
	DTS.say = GetPrivateProfileInt(dtpcSectionName,"Say",DEF_SAY,dtpcIniFile);
	DTS.voice = GetPrivateProfileInt(dtpcSectionName,"Voice",DEF_VOICE,dtpcIniFile);
	_dtpcLoadVal();

	DTS.settings_loaded = true;
	return(DLL_SUCCESS);
} ;

unsigned  int __far __pascal _dtpcSaveSettings()
{
/*      int     i; */


	dtpcSectionName[SECTION_MOD_OFFSET] = '0'+module_index;

/*
 *  load file names ...
 */

	WritePrivateProfileString(dtpcSectionName,"Path",&DTS.path_name[0],dtpcIniFile);
	WritePrivateProfileString(dtpcSectionName,"Kernel",&DTS.kernel_name[0],dtpcIniFile);
	WritePrivateProfileString(dtpcSectionName,"Dictionary",&DTS.dic_name[0],dtpcIniFile);
	WritePrivateProfileString(dtpcSectionName,"Lts",&DTS.lts_name[0],dtpcIniFile);
	WritePrivateProfileString(dtpcSectionName,"Ph",&DTS.ph_name[0],dtpcIniFile);
	WritePrivateProfileString(dtpcSectionName,"Cmd",&DTS.cmd_name[0],dtpcIniFile);
	WritePrivateProfileString(dtpcSectionName,"Lang",&DTS.lang_name[0],dtpcIniFile);
	WritePrivateProfileString(dtpcSectionName,"CodePage",&DTS.code_name[0],dtpcIniFile);
	WritePrivateProfileString(dtpcSectionName,"Welcome",&DTS.welcome_string[0],dtpcIniFile);
	WritePrivateProfileString(dtpcSectionName,"Test",&DTS.test_string[0],dtpcIniFile);
					       
					       
/*
 *  integer values ...
 */

	wsprintf(temp_buff,"%d",DTS.volume);
	WritePrivateProfileString(dtpcSectionName,"Volume",FTEMP_BUFF,dtpcIniFile);
	wsprintf(temp_buff,"%d",DTS.rate);
	WritePrivateProfileString(dtpcSectionName,"Rate",FTEMP_BUFF,dtpcIniFile);
	wsprintf(temp_buff,"%d",DTS.period);
	WritePrivateProfileString(dtpcSectionName,"Period",FTEMP_BUFF,dtpcIniFile);
	wsprintf(temp_buff,"%d",DTS.comma);
	WritePrivateProfileString(dtpcSectionName,"Comma",FTEMP_BUFF,dtpcIniFile);
	wsprintf(temp_buff,"%d",DTS.log);
	WritePrivateProfileString(dtpcSectionName,"Log",FTEMP_BUFF,dtpcIniFile);
	wsprintf(temp_buff,"%d",DTS.mode);
	WritePrivateProfileString(dtpcSectionName,"Mode",FTEMP_BUFF,dtpcIniFile);
	wsprintf(temp_buff,"%d",DTS.punct);
	WritePrivateProfileString(dtpcSectionName,"Punct",FTEMP_BUFF,dtpcIniFile);
	wsprintf(temp_buff,"%d",DTS.say);
	WritePrivateProfileString(dtpcSectionName,"Say",FTEMP_BUFF,dtpcIniFile);
	wsprintf(temp_buff,"%d",DTS.voice);
	WritePrivateProfileString(dtpcSectionName,"Voice",FTEMP_BUFF,dtpcIniFile);
	wsprintf(temp_buff,"%d",DTS.error);
	WritePrivateProfileString(dtpcSectionName,"Error",FTEMP_BUFF,dtpcIniFile);
	wsprintf(temp_buff,"%d",DTS.timeout);
	WritePrivateProfileString(dtpcSectionName,"Timeout",FTEMP_BUFF,dtpcIniFile);
	_dtpcSaveVal();

	return(DLL_SUCCESS);
}


__export __pascal _dtpcSendSetString(int value, char *str[])
/*char *str[]; */
/*int value;   */
{
	int     i;
	int     flag;
	unsigned char *stype;

/*
 *  Get the string type in skip ...
 */

	for(i=0;str[i];i++);
		stype = (unsigned char *)str[i+1];


/*
 * for value, place the value at the end of the buffer with a closing
 * brace and send that over ...
 */

	if(stype == STRING_VALUE)
		{
		wsprintf(temp_buff,"%s %d]",(unsigned char _far *)str[0],value);
		return(_dtpcSendInitBuff(temp_buff));
		}

/*
 *  easiest case, value is the index of the sent string ...
 */

	if(stype == STRING_DIRECT)
		return(_dtpcSendInitBuff( (char __far *)str[value] ));

/*
 *  here, value is the binary value of the flag setting so we need to
 *  scan the whole buffer over ...
 */

	if(stype == STRING_FLAGS)
		{
		for(i=0;str[i*2];i++)
			{
			flag = (value & (1<<i));
			if(_dtpcSendInitBuff((char __far *)str[(i*2)+flag]) == DLL_FAILURE)
				return(DLL_FAILURE);
			}
		return(DLL_SUCCESS);
		}
	return(DLL_FAILURE);
}


/*
 *  This is an intra-dll call to do send buff ...  only errors cause
 *  this to return so the timeouts are extremely long ...
 */

__export _dtpcSendInitBuff(char __far *buff)
/*char _far *buff; */
{
	int     status,max_count,count;

	for(count=0;buff[count];count++);
	if(count == 0)
		return(DLL_SUCCESS);
	if(DTC.loaded == false)
		return(DLL_SUCCESS);

	if(_dtpcWaitBit(30,STAT_rr_char) == DLL_FAILURE)
		return(DLL_FAILURE);
	while(count)
		{
		max_count = (count > 256) ? 256 : count;
		if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
			return(DLL_FAILURE);
		_outp(DT_DMA,DMA_buff_in);
		if(max_count == 256)
			_outp(DT_DMA,0);
		else
			_outp(DT_DMA,max_count);
		if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
			return(DLL_FAILURE);
		count -= max_count;
		while(max_count--)
			_outp(DT_DMA,(*buff++));
		}
	return(DLL_SUCCESS);
}

__export _dtpcSayWelcome()
{
	if(DTS.welcome_string[0])
		{
		wsprintf(FTEMP_BUFF,"%s%c",(char _far *)&DTS.welcome_string[0],0xb);
		return(_dtpcSendInitBuff(temp_buff));
		}
	return(DLL_SUCCESS);
}

__export _dtpcSayTest()
{
	if(DTS.test_string[0])
		{
		wsprintf(FTEMP_BUFF,"%s%c[:sync]",(char _far *)&DTS.test_string[0],0xb);
		return(_dtpcSendInitBuff(temp_buff));
		}
	return(DLL_SUCCESS);
}

__export _dtpcSendInitChar(char c)
/*char c; */
{
	if(DTC.loaded)
		{
		while((DTC.module_status & STAT_rr_char) == 0);
		if(_dtpcWaitDstat(30) == DLL_FAILURE)
			return(DLL_FAILURE);
		_outp(DT_DMA,DMA_single_in);
		_outp(DT_DMA,c);
		return(DLL_SUCCESS);
		}
	return(DLL_FAILURE);
}
