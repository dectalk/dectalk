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
 *    File Name:	dll_user.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC Windows DLL ...
 *
 *  The windows DLL is essentially a rewrite of the tsr version of the
 *  code to run as a windows dll.  The dll piece encompases the i/o of
 *  the tsr.
 *
 *  The I/O is now direct to the module.  This file contains the actual
 *  module interface calls.  Various parts of the dll use these entrys.
 *  The user can interface to these calls via the calls in the dll_user
 *  file that are the exported versions of these calls.
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include "dll.h"
#include	"dll_prot.h"

extern volatile int num_mod;
/***********************************************************
 *      volume and output controls
 ***********************************************************/

__export __far __pascal dtpcVolumeUp(int mod,int vol)
{
	int	status;

	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_vol_up,(unsigned char)(vol&0xff));
	DTS.volume += vol;
	return(_dtpcDllExit(status));
}

__export  FAR PASCAL dtpcVolumeDown(int mod,int vol)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_vol_down,(unsigned char)(vol&0xff));
	DTS.volume -= vol;
	return(_dtpcDllExit(status));
}

__export  FAR PASCAL dtpcVolumeSet(int mod,int vol)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_vol_set,(unsigned char)(vol&0xff));
	DTS.volume = vol;
	return(_dtpcDllExit(status));
}

__export  FAR PASCAL dtpcPause(int mod)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_pause,0);
	return(_dtpcDllExit(status));
}

__export  FAR PASCAL dtpcResume(int mod)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_resume,0);
	return(_dtpcDllExit(status));
}

__export  FAR PASCAL dtpcResumeSpc(int mod)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_resume+CTRL_resume_spc,0);
	return(_dtpcDllExit(status));
}


/**********************************************************************
 *                   module flush controls ....
 **********************************************************************/

__export __pascal  __far  dtpcFlushText(int mod)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if((status = _dtpcDoImmd(CMD_control+CTRL_flush,0)) == DLL_FAILURE)
		return(_dtpcDllExit(status));
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(_dtpcDllExit(status));
	_outp(DT_DMA,DMA_sync);
	_outp(DT_DMA,0);
	status = _dtpcWaitFlush();
	return(_dtpcDllExit(status));
}

__export __pascal  FAR  dtpcFlushChar(int mod,char c)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if((status = _dtpcDoImmd(CMD_control+CTRL_flush,0)) == DLL_FAILURE)
		return(_dtpcDllExit(status));
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(_dtpcDllExit(status));
	_outp(DT_DMA,DMA_sync_char);
	_outp(DT_DMA,c);
	status = _dtpcWaitFlush();
	return(_dtpcDllExit(status));
}

__export  FAR PASCAL dtpcFlushSpeech(int mod)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if((status = _dtpcDoImmd(CMD_control+CTRL_flush,1)) == DLL_FAILURE)
	return(_dtpcDllExit(status));
    return(1);
}

/***************************************************************
 *            immediate synth changes ...
 ***************************************************************/

__export __far __pascal  dtpcImmdVoice(int mod,int voice)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_speech+CTRL_SP_voice,voice);
	DTS.voice = voice;
	return(_dtpcDllExit(status));
}

int __export __far __pascal dtpcImmdRate(int mod,int rate)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_speech+CTRL_SP_rate,rate);
	DTS.rate = rate;
	return(_dtpcDllExit(status));
}



int __export __far __pascal DTPCIMMDRATEDELTA(int mod,int rate)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_speech+CTRL_SP_rate_delta,rate);
	DTS.rate += rate;
	return(_dtpcDllExit(status));
}

int __export __far PASCAL dtpcImmdPeriod(int mod,int pause)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_speech+CTRL_SP_period,pause);
	DTS.period = pause;
	return(_dtpcDllExit(status));
}

int __export __far PASCAL dtpcImmdComma(int mod,int pause)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_speech+CTRL_SP_comma,pause);
	DTS.comma = pause;
	return(_dtpcDllExit(status));
}

/************************************************************
 *                    miscelleanous control
 ************************************************************/

int __export __far PASCAL dtpcBuffFree(int mod, int __far *bytes)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmdGet(CMD_control+CTRL_buff_free,(unsigned int __far *)bytes);
	return(_dtpcDllExit(status));
}

int __export __far PASCAL dtpcLastIndex(int mod, int __far *index)
{
	int	status,curr_index;

	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	curr_index = _dtpcGetData();
	if((unsigned int)curr_index != DTC.lastindex && DTC.module_status & STAT_index_valid)
		{
		DTC.lastindex = curr_index;
		(*index) = curr_index;
		return(_dtpcDllExit(DLL_SUCCESS));
		}
	else if(DTC.module_status & STAT_new_index)
		{
		status = _dtpcDoImmdGet(CMD_control+CTRL_last_index,(unsigned int __far *)index);
		if(status == DLL_SUCCESS)
			{
			if(DTC.lastindex == (unsigned int)(*index))
				status = DLL_RETRY;
			else
				DTC.lastindex = (*index);
			}
		}
	else
		status = DLL_RETRY;
	return(_dtpcDllExit(status));
}

int __export __far PASCAL dtpcBuffUsed(int mod, int __far *bytes)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmdGet(CMD_control+CTRL_buff_used,(unsigned int _far *)bytes);
	return(_dtpcDllExit(status));
}

int __export __far PASCAL dtpcFreeMem(int mod, int __far *paras)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmdGet(CMD_control+CTRL_free_mem,(unsigned int __far *)paras);
	return(_dtpcDllExit(status));
}

int __export __far PASCAL dtpcIoPriority(int mod,int priority)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_control+CTRL_io_priority,priority);
	return(_dtpcDllExit(status));
}

__export FAR PASCAL dtpcDigitizedMode(int mod)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_spc_mode+CMD_spc_to_digit,0);
	return(_dtpcDllExit(status));
}

int __export __far PASCAL dtpcTextMode(int mod)
{
	int	status;
	if((status = _dtpcDllEntry(mod,true)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	status = _dtpcDoImmd(CMD_spc_mode+CMD_spc_to_text,0);
	return(_dtpcDllExit(status));
}

__export  FAR PASCAL dtpcReset(int mod)
{
	int	status;
	if((status = _dtpcDllEntry(mod,false)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	_outp(DT_CMD_LOW,0xff);
	_outp(DT_CMD_HIGH,0xff);
	_outp(DT_INT,0);
	DTC.id = ID_boot;
	return(_dtpcDllExit(DLL_SUCCESS));
}

int __export __far PASCAL dtpcGetStatus(int mod,unsigned int *mod_status,int *number,int *mode)
{
	int	status;

	if((status = _dtpcDllEntry(mod,false)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	(*mod_status) = DTC.module_status;
	(*number) = num_mod;
	(*mode) = DTC.id;
	return(_dtpcDllExit(DLL_SUCCESS));
}

/**************************************************************
 *              character send
 **************************************************************/

int __export __far PASCAL dtpcSendChar(int mod,char c)
{
	int	status;
	if((status = _dtpcDllEntry(mod,false)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if((DTC.module_status & STAT_rr_char) == 0 || _dtpcCheckDstat() == false)
		return(_dtpcDllExit(DLL_RETRY));
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(_dtpcDllExit(status));
	_outp(DT_DMA,DMA_single_in);
	_outp(DT_DMA,c);
	return(_dtpcDllExit(DLL_SUCCESS));
}


int __export __far PASCAL dtpcGetChar(int mod,char __far *c)
{
	int	status;
	if((status = _dtpcDllEntry(mod,false)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if((DTC.module_status & STAT_tr_char) == 0 || _dtpcCheckDstat() == false)
		return(_dtpcDllExit(DLL_RETRY));
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(_dtpcDllExit(status));
	_outp(DT_DMA,DMA_single_out);
	_outp(DT_DMA,0);
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(_dtpcDllExit(status));
	(*c) = _inp(DT_DMA);
	return(_dtpcDllExit(DLL_SUCCESS));
}

/*
 *  send a buffer at a time to the module ... the buffer is send 256 bytes
 *  at a time and broken up if the overall size is greater than that ...
 */

int __export __far PASCAL dtpcSendBuff(int mod,char __far *buff,int __far *count)
{
	int	status,max_count;
	
	if((status = _dtpcDllEntry(mod,false)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if((DTC.module_status & STAT_rr_char) == 0 || _dtpcCheckDstat() == false)
		return(_dtpcDllExit(DLL_RETRY));
	while((*count))
		{
		max_count = ((*count) > 256) ? 256 : (*count);
		if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
			return(_dtpcDllExit(status));
		_outp(DT_DMA,DMA_buff_in);
		if(max_count == 256)
			_outp(DT_DMA,0);
		else
			_outp(DT_DMA,max_count);
		if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
			return(_dtpcDllExit(status));
		(*count) -= max_count;
		while(max_count--)
			_outp(DT_DMA,(*buff++));
		}
	return(_dtpcDllExit(DLL_SUCCESS));
}

/*
 *  get buff is used to read a whole buffer at a time upto count bytes.
 *  The number of bytes actually read is returned in 'count'.
 */

int __export __far PASCAL dtpcGetBuff(int mod,char __far *buff,unsigned int __far *count)
{
	int	status,i,j,max_count;

	if((status = _dtpcDllEntry(mod,false)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if((DTC.module_status & STAT_tr_char) == 0 || _dtpcCheckDstat() == false)
		return(_dtpcDllExit(DLL_RETRY));

	max_count = (*count);
	(*count) = 0;
	while(max_count)
		{
		if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
			return(_dtpcDllExit(status));
		i = (max_count > 128) ? 128 : max_count;
		_outp(DT_DMA,DMA_buff_out);
		_outp(DT_DMA,i);
		if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
			return(_dtpcDllExit(status));
		j = _inp(DT_DMA) & 0xff;
		if(j == 0)
			break;
		(*count) += j;
		max_count -= j;
		i = j;
		while(i--)
			(*buff++) = _inp(DT_DMA);
		if(j != 128)
			break;
		}
	return(_dtpcDllExit(DLL_SUCCESS));
}

/*************************************************************
 *          digitized voice data send ...
 *************************************************************/

int __export __far PASCAL dtpcSendDigitized(int mod,char __far *buff,int frames)
{
	int	status;
	int	i,j;

	if((status = _dtpcDllEntry(mod,false)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if((DTC.module_status & STAT_digitized) == 0)
		return(_dtpcDllExit(DLL_RETRY));
	if(frames > SPC_DIGITIZED_MAX)
		return(_dtpcDllExit(DLL_FAILURE));
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(_dtpcDllExit(status));
	_outp(DT_DMA,DMA_control);
	_outp(DT_DMA,DT_DIGITAL_IN);
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(_dtpcDllExit(status));
	_outp(DT_DMA,(frames&0xff));
	_outp(DT_DMA,0);
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(_dtpcDllExit(status));
	for(i=0;i<(int)frames;i++)
		{
		_outp(DT_DMA,SPC_DIGITIZED_DATA);
		_outp(DT_DMA,0);
		for(j=0;j<128;j++)
			_outp(DT_DMA,(*buff++));
		}
	return(_dtpcDllExit(DLL_SUCCESS));
}

/*
 *  Load the module and set the default parameters ...
 */

__export  __far PASCAL	dtpcLoadModule(int mod)
{
	unsigned int status;

	if((status = _dtpcDllEntry(mod,false)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));

/*
 *  Do an auto init file load here if it is not yet loaded ...
 */

	if(DTS.settings_loaded == false)
		if((status=_dtpcLoadSettings()) != DLL_SUCCESS)
			return(_dtpcDllExit(status));
/*
 *  Create a loading info window ...
 */

	_dtpcMessageWindow(dtpcInst);

/*
 *  Load up the run files ...
 */

	if(status = _dtpcLoadFile(&DTS.kernel_name[0],&DTS.path_name[0]) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcLoadFile(&DTS.dic_name[0],&DTS.path_name[0]) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcLoadFile(&DTS.lts_name[0],&DTS.path_name[0]) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcLoadFile(&DTS.ph_name[0],&DTS.path_name[0]) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcLoadFile(&DTS.lang_name[0],&DTS.path_name[0]) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(DTS.code_name[0] != '\0')
		{
		if(status = _dtpcLoadFile(&DTS.code_name[0],&DTS.path_name[0]) != DLL_SUCCESS)
			return(_dtpcDllExit(status));
		}
	if(status = _dtpcLoadFile(&DTS.cmd_name[0],&DTS.path_name[0]) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	DTC.loaded = true;

/*
 *  Set up the loadable parameters ...
 */

	_dtpcClearMessWindow();
	_dtpcOutMessWindow(5,1,"Setting parameters");

	_dtpcSetVal();
	_dtpcSendInitBuff("[:dv save ]");
	if(status = _dtpcSendSetString(DTS.voice,voice_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcSendSetString(DTS.rate,rate_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcSendSetString(DTS.period,period_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcSendSetString(DTS.comma,comma_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcSendSetString(DTS.punct,punct_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcSendSetString(DTS.say,say_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcSendSetString(DTS.log,log_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcSendSetString(DTS.mode,mode_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcSendSetString(DTS.volume,volume_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcSendSetString(DTS.error,error_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(status = _dtpcSendSetString(DTS.timeout,timeout_cmd) != DLL_SUCCESS)
		return(_dtpcDllExit(status));


	_dtpcSayWelcome();
	_dtpcKillMessageWindow();
	return(_dtpcDllExit(DLL_SUCCESS));
}

/*
 *  Change the configuration ...
 */

__export  FAR PASCAL	dtpcSetup(HWND mod,int wnd)
{
	FARPROC cnfDlg;
	int	status;

	if((status = _dtpcDllEntry(mod,false)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(DTS.settings_loaded == false)
		if((status=_dtpcLoadSettings()) != DLL_SUCCESS)
			return(_dtpcDllExit(status));
	cnfDlg=MakeProcInstance((FARPROC)_dtpcConfigDlg,dtpcInst);
	DialogBox(dtpcInst, MAKEINTATOM(DLG_CONFIG), wnd, cnfDlg);
	FreeProcInstance(cnfDlg);
	return(_dtpcDllExit(DLL_SUCCESS));
}

/*
 *  Return the value to various synth settings ...
 */

__export FAR PASCAL	dtpcGetSetting(int mod,int setting,unsigned int __far *rvalue)
{
	int	status;

	if((status = _dtpcDllEntry(mod,false)) != DLL_SUCCESS)
		return(_dtpcDllExit(status));
	if(DTS.settings_loaded == false)
		if((status=_dtpcLoadSettings()) != DLL_SUCCESS)
			return(_dtpcDllExit(status));
	switch(setting)	{
		case	DTPC_get_volume	:
			*rvalue = DTS.volume;
			break;
		case	DTPC_get_rate		:
			*rvalue = DTS.rate;
			break;
		case	DTPC_get_voice		:
			*rvalue = DTS.voice;
			break;
		case	DTPC_get_period	:
			*rvalue = DTS.period;
			break;
		case	DTPC_get_comma		:
			*rvalue = DTS.comma;
			break;
		default:
			return(_dtpcDllExit(DLL_FAILURE));
		}
	return(_dtpcDllExit(DLL_SUCCESS));
}
