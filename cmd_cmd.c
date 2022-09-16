#ifndef NO_CMD
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
 *    File Name:	cmd_cmd.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  This file contains all command stubs that are implemented in the
 *  command processor itself ...
 *
 ***********************************************************************
 *    Revision History:
 *
 *0001 09/07/95 cjl cmd_enable() now allows interupts for non-flush(tek).
 *0002 09/12/95 cjl added hardw.h for partial merged DTPC1/2
 *0003 09/13/95 tek sub START/STOP_SAMPCLK macros for get/set_gpio calls.
 *0004 09/26/95 cjl removed duplicate code & turn off non_Eng PUNCT_*.  
 *0005 01/03/96	tek merge dtex 
 *0006 02/21/96	tek	remove FIELD_TEST (0005 in pre-merge pool)
 *0007 03/07/96 cjl per tek change param[1] of cmd_vs;
 *0008 05/16/96 tek make arg of say_string volatile to kill warning..
 */
 
#include "cmd_def.h"
//#include <dos.h>
//#include "hardw.h"

short cmd_number;
short cmd_count;
short insertflag = 0;
char tempa[60];
extern struct icomm setv[10];
/*
 *  change the phonemic mode for the commands ...
 */
unsigned char *phoneme_modes[] = {"off","on","asky","arpabet","speak","silent",0};

cmd_phoneme()
{
	int     value,i;

	if(esc_command == false)
		{                
		for(i=0;i<(int)param_index;i++)
			{
//			value = string_match(phoneme_modes,(unsigned char *)params[i]);
			value = string_match(phoneme_modes,(unsigned char *)pString[i]);
			if(value == NO_STRING_MATCH)
				return(CMD_bad_string);
			switch(value)
				{
				case    0       :       KS.phoneme_mode |= PHONEME_OFF; break;
				case    1       :       KS.phoneme_mode &= (~PHONEME_OFF); break;
				case    2       :       KS.phoneme_mode |= PHONEME_ASCKY; break;
				case    3       :       KS.phoneme_mode &= (~PHONEME_ASCKY); break;
				case    4       :       KS.phoneme_mode |= PHONEME_SPEAK; break;
				case    5       :       KS.phoneme_mode &= (~PHONEME_SPEAK); break;
				}
			}
		}
	else
		{
		if(defaults[0] == false)
			KS.phoneme_mode = params[0];
		} 
	return(CMD_success);
}       

/*
 *  log flags are used to send text back to the user in some way shape or
 *  form ... all are immediate commands ...
 */

unsigned char *log_options[] = {
	"on",
	"off",
	"set",
	"text",
	"phonemes",
	"types",
	"forms",
	"syllables",
	"outphon",
	0
};

cmd_log()
{
	int     i,value;
	unsigned int flag_mask;

if(esc_command == false)
		{ 
		flag_mask = 0;
		for(i=0;i<param_index;i++)
			{
//			value = string_match(log_options,(unsigned char *)params[i]);
			value = string_match(log_options,pString[i]);
			if(value == NO_STRING_MATCH)
				return(CMD_bad_string);
			switch(value)
				{
				case    0       :                               /* on */

					KS.logflag |= flag_mask;
					flag_mask = 0;
					break;

				case    1       :                               /* off */

					KS.logflag &= (~flag_mask);
					flag_mask = 0;
					break;

				case    2       :                               /* set */

					KS.logflag = flag_mask;
					flag_mask = 0;
					break;

				case    3       :                               /* text */

					flag_mask |= LOG_TEXT;
					break;

				case    4       :                               /* phoneme */

					flag_mask |= LOG_PHONEMES;
					break;

				case    5       :                               /* name types */

					flag_mask |= LOG_NAME_TYPES;
					break;

				case    6       :                               /* word form classes */

					flag_mask |= LOG_FORM_TYPES;
					break;

				case    7       :                               /* word syllable structure */

					flag_mask |= LOG_SYLLABLES;
					break;
				case    8       :                               /* word syllable structure */

					flag_mask |= LOG_OUTPHON;
					break;

		
				}
			}
		return(CMD_success);
		}
	else
		{
		params[0] &= (LOG_TEXT|LOG_PHONEMES|LOG_NAME_TYPES|LOG_FORM_TYPES|LOG_SYLLABLES|LOG_OUTPHON);
		switch(params[1])
			{
			case    0       :
				KS.logflag = params[0];
				break;
			case    1       :
				KS.logflag |= params[0];
				break;
			case    2       :
				KS.logflag &= (~params[0]);
				break;
			}
		return(CMD_success);
		}
}

/*
 *  break is used to instruct the ph code to generate a autopause at
 *  every wbound.
 */
  
/* commented out as unused var - 8/8/95   JDB   
unsigned char *break_options[] = {
	"on",
	"off",
	0
};                                           
*/

cmd_break()
{
	int     i,value;
	unsigned int flag_mask;

	if(esc_command == false)
		{
		flag_mask = 0;
		for(i=0;i<param_index;i++)
			{
//			value = string_match(log_options,(unsigned char *)params[i]);
			value = string_match(log_options,pString[i]);
			if(value == NO_STRING_MATCH)
				return(CMD_bad_string);
			switch(value)
				{
				case    0       :                               /* on */

					KS.wbreak = true;
					break;

				case    1       :                               /* off */

					KS.wbreak = false;
					break;
	
				}
			}
		return(CMD_success);
		}
	else
		{
		params[0]  = false;
		switch(params[1])
			{
			case    0       :
				KS.wbreak = false;
				break;
			case    1       :
				KS.wbreak = true;
				break;
			default :
				KS.wbreak = false;
				break;
			}
		return(CMD_success);
		}
}
/*
 * say flags are used to control how the word is broken up
 */

unsigned char *say_options[] = {
	"clause",
	"word",
	"letter",
	"line",
	"syllable",
	0
};

cmd_say()
{
	int     value;
	/*unsigned int flag_mask;*/

	if(esc_command == false)
		{
//		value = string_match(say_options,(unsigned char *)params[0]);
		value = string_match(say_options,pString[0]);
		if(value == NO_STRING_MATCH)
			return(CMD_bad_string);
		switch(value)
			{
			case    0       :                               /* clause */

				KS.sayflag = SAY_CLAUSE;
				break;

			case    1       :                               /* word */

				KS.sayflag = SAY_WORD;
				break;

			case    2       :                               /* letter */

				if(cmd_sync() == CMD_flushing)
					return(CMD_flushing);
				KS.sayflag = SAY_LETTER;
				break;

			case    3       :                               /* line */

				KS.sayflag = SAY_LINE;
				break;

			case    4       :                               /* syllables */

				KS.sayflag = SAY_SYLLABLE;
				break;
			}
		return(CMD_success);
		}
	else
		{
		if(params[0] > 3)
			return(CMD_bad_value);
		KS.sayflag = params[0];
		return(CMD_success);
		}       
}

/*
 * error flags are used to control how errors are processed
 */

unsigned char *error_options[] = {
	"ignore",
	"text",
	"escape",
	"speak",
	"tone",
	0
};

cmd_error()
{
	int     value;
	/*unsigned int flag_mask;*/

	if(esc_command == false)
		{ 
//		value = string_match(error_options,(unsigned char *)params[0]);
		value = string_match(error_options,pString[0]);
		if(value == NO_STRING_MATCH)
			return(CMD_bad_string);
		switch(value)
			{
			case    0       :                               /* ignore */

				error_mode = ERROR_ignore;
				break;

			case    1       :                               /* text */

				error_mode = ERROR_text;
				break;

			case    2       :                               /* escape */

				error_mode = ERROR_escape;
				break;


			case    3       :                               /* speak */

				error_mode = ERROR_speak;
				break;

			case    4       :                               /* tone */

				error_mode = ERROR_tone;
				break;
			}
		return(CMD_success);
		}
	else
		{
		if(params[0] > 4)
			return(CMD_bad_value);
		error_mode = params[0];
		return(CMD_success);
		} 
}
cmd_pause()
{
#ifndef	SIMULATOR		
	KS.pause = true;
	STOP_SAMPCLK;
	if(defaults[0] == false)
		{
		sleep(params[0]);
		KS.pause = false;
		START_SAMPCLK;
		}
#endif
	return(CMD_success);
}

	
int cmd_resume(void)
{
#ifndef SIMULATOR
	KS.pause = false;
	START_SAMPCLK;       
#endif
	return(1);
		
}
unsigned char *flush_options[] = {
	"all",
	"until",
	"mask",
	"after",
	"speech",
	0
};

cmd_flush()
{                                
//	unsigned short int old_flags;
	if(defaults[0] == true || defaults[1] == true)
		{
/*              start_flush(true);  */
#ifdef DTEX
		p_putc(XON);
#endif /*DTEX*/
		return(CMD_success);
		}
	if(esc_command == false)
		{
//		params[0] = string_match(flush_options,(unsigned char *)params[0]);
		params[0] = string_match(flush_options,pString[0]);
		if(params[0] == NO_STRING_MATCH)
			return(CMD_bad_string);
		}                 
	if(params[0] >= (sizeof(flush_options)/2))
		return(CMD_bad_value);
	switch(params[0])
		{
		case    0       :                               /* all */
			return(CMD_success);
/*                      start_flush(true);  */
			break;
		
		case    1       :                               /* until */

			KS.spc_flush_type = SPC_flush_until;
			KS.spc_flush_value = params[1];
			KS.spc_flush = true;
			break;

		case    2       :                               /* mask */

			KS.spc_flush_type = SPC_flush_mask;
			KS.spc_flush_value = params[1];
			KS.spc_flush = true;
			break;

		case    3       :                               /* after */

//			old_flags = kernel_disable();
			if(KS.halting == false)
				{
				KS.spc_flush_type = SPC_flush_after;
				KS.spc_flush_value = params[1];
				KS.spc_flush = true;
				KS.spc_sync.value = 0;    
//				kernel_enable(old_flags);
#ifndef	SIMULATOR
				wait_semaphore(&KS.spc_sync);
#endif
				}
			  else
				{
//				kernel_enable(old_flags);
				}
			start_flush(true);
			break;

		case    4       :                               /* text */

			KS.spc_flush_type = SPC_flush_all;
			KS.spc_flush = true;
			KS.text_flush = true;
			break;

			}
	return(CMD_success);
}


cmd_sync()
{
	unsigned short pipe_value;//,old_flags;
#ifdef DTEX
	/* KS.idleflag is used to tell when we've been quiescent long
	 * enough to fall asleep.. */
	KS.idleflag = 0;
#endif /*DTEX*/	

//	old_flags = kernel_disable();
	if(KS.halting == false)
		{
		KS.spc_sync.value = 0;
		pipe_value = (PFASCII<<PSFONT)+0xb;
#ifdef SINGLE_THREADED
		lts_loop(&pipe_value);
#else
		write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
		pipe_value = SYNC;
#ifdef SINGLE_THREADED
		lts_loop(&pipe_value);
#else
		write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
		//		kernel_enable(old_flags);
#ifndef	SIMULATOR
		wait_semaphore(&KS.spc_sync);
#endif
		}
	  else
	  	{
//		kernel_enable(old_flags);
		}
	if(KS.cmd_flush)
		return(CMD_flushing);
	return(CMD_success);
}

cmd_enable()
{
	unsigned int pipe_value;//,old_flags;

//	old_flags = kernel_disable();
	if(KS.halting == false)
		{
		KS.spc_sync.value = 0;
		pipe_value = (PFASCII<<PSFONT)+0xb;
#ifdef SINGLE_THREADED
		lts_loop(&pipe_value);
#else
		write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
		pipe_value = SYNC;
#ifdef SINGLE_THREADED
		lts_loop(&pipe_value);
#else
		write_pipe(KS.lts_pipe,&pipe_value,1);  
#endif
		//		kernel_enable(old_flags);
#ifndef	SIMULATOR
		wait_semaphore(&KS.spc_sync);
#endif
		}
	  else
	  	{
//		kernel_enable(old_flags);
		}
	KS.spc_flush = false;
	KS.text_flush = false;
	reset_spc();
	return(CMD_success);
}

/*
 *  punctuation flags are used to control how punctuation characters
 *  are dealt with ...
 */

unsigned char *punct_options[] = {
	"none",
	"some",
	"all",
	"pass",
	0
};

cmd_punct()
{
	int     value;

	if(esc_command == false)
		{
//		value = string_match(punct_options,(unsigned char *)params[0]);
		value = string_match(punct_options,pString[0]);
		if(value == NO_STRING_MATCH)
			return(CMD_bad_string);
		switch(value)

			{
			case    PUNCT_none       :

				punct_mode = PUNCT_none;
				break;

			case    PUNCT_some       :

				punct_mode = PUNCT_some;
				break;

			case    PUNCT_all       :

				punct_mode = PUNCT_all;
				break;
				
			case    PUNCT_pass       :

				punct_mode = PUNCT_pass;
				break;
				
			default                  :
				return(CMD_bad_value);
				break;
			}         
/*		punct_mode=value; duplicate code? cjl 26-sep-95 */
		return(CMD_success);
		}
	else
		{
		if(params[0] > 2)
			return(CMD_bad_value);
		punct_mode = params[0];
		return(CMD_success);
		}

}

cmd_timeout()
{
	if(defaults[0] == true)
		params[0] = 0;

	timeout = params[0];
	KS.input_timeout = timeout;
	return(CMD_success);
}

cmd_cpu_rate()
{
#ifdef MSDOS
	if(defaults[0] == true)
		params[0] = 10;
	if(params[0] <= 0 || params[0] > 25)
		return(CMD_bad_value);
	module_clocks(params[0]);
#endif
	return(CMD_success);
}

cmd_setv()
{
	if(params[0] < 0 || params[0] > 9)
		return(CMD_bad_value);
	cmd_count=0;
	cmd_number=params[0];      
	insertflag=2;                     /*state == insert pending*/
	return(CMD_success);
}

cmd_loadv()
{               
   /* this will probably crash and burn if a flush happens 
    * in the middle.. (tek 1/3/96)*/
   int j=0;
   int flag=1;
   if(params[0] < 0 || params[0] > 9)
		return(CMD_bad_value);
   cmd_count=0;
	cmd_number=params[0];
   while (flag) 
      {
      tempa[j] = getc();
      if (tempa[j] == ']')
	 flag = 0;
      j++;
      }
   tempa[j] = '\0';
   strcpy(setv[cmd_number].cmd,tempa);
	return(CMD_success);
}


cmd_code_page()
{
	volatile struct dtpc_code_pages _far *cp;
	int     i;

	if(defaults[0] == true || params[0] == 0)
		{
		for(i=0;i<256;i++)
			KS.code_page[i] = i;
		return(CMD_success);
		}


	cp = KS.loaded_code_pages;
	while(cp != NULL_CP)
		{
		if((*cp).dos_id == (int)params[0])
			{
			for(i=0;i<256;i++)
				KS.code_page[i] = (*cp).translation_page[i];
			return(CMD_success);
			}
		cp = (*cp).link;
		}
	return(CMD_bad_value);
}


/*
 *  change the volume ...
 */
unsigned char *volume_options[] = {
	"set",
	"up",
	"down",
	0
};
                                 
/* cmd_vs implements the short form of the volume command that is no longer
 * always unique but happened to work before... ugh... */
cmd_vs()
{
#ifdef	VOL_CTRL
	vol_set(params[0]);
#endif
	return(CMD_success);
}                              

cmd_volume()
{
#ifdef	VOL_CTRL
	int     cmd_type,cmd_value;

	if(esc_command == false)
		{
//		cmd_type = string_match(volume_options,(unsigned char *)params[0]);
		cmd_type = string_match(volume_options,pString[0]);
		if(cmd_type == NO_STRING_MATCH)
			return(CMD_bad_string);
		cmd_type += DCS_VOLUME_SET;
		cmd_value = params[1];
		}
	else
		{
		cmd_type = CT[cmd_index].esc_value;
		cmd_value = params[0];
		}                                

	if(cmd_sync() == CMD_flushing)
		return(CMD_flushing);
	switch(cmd_type)        {

		case    DCS_VOLUME_SET  :

			vol_set(cmd_value);
			break;

		case    DCS_VOLUME_UP   :

			vol_up(cmd_value);
			break;

		case    DCS_VOLUME_DOWN :

			vol_down(cmd_value);
			break;

		default :
			return(CMD_bad_value);
		};
#endif
	return(CMD_success);
}
/*
 *  change to an alternately loaded language ...
 */
#ifdef MULTI_LANG
unsigned char *lang_options[] = {
	"english",
	"french",
	"german",
	"spanish",
	0
};


cmd_language()
{

	int     cmd_type;
	unsigned int pipe_value;

	if(esc_command == false)
		{
//		cmd_type = string_match(lang_options,(unsigned char *)params[0]);
		cmd_type = string_match(lang_options,pString[0]);
		if(cmd_type == NO_STRING_MATCH)
			return(CMD_bad_string);
		}
	else
		cmd_type = params[0];
				  
	if(cmd_sync() == CMD_flushing)
		return(CMD_flushing);
	switch(cmd_type)        {

		case    0       :                               /* english */

			if(KS.lang_ready[LANG_english] == LANG_both_ready)
				cmd_type = LANG_english;
			else
				return(CMD_bad_value);
			break;

		case    1       :                               /* french */

			if(KS.lang_ready[LANG_french] == LANG_both_ready)
				cmd_type = LANG_french;
			else
				return(CMD_bad_value);
			break;


		case    2       :                               /* german */

			if(KS.lang_ready[LANG_german] == LANG_both_ready)
				cmd_type = LANG_german;
			else
				return(CMD_bad_value);
			break;

		case    3       :                               /* spanish */

			if(KS.lang_ready[LANG_spanish] == LANG_both_ready)
				cmd_type = LANG_spanish;
			else
				return(CMD_bad_value);
			break;


		default :
			return(CMD_bad_value);
		};

	if(cmd_sync() == CMD_flushing)
		return(CMD_flushing);
	default_lang(cmd_type,0);
	pipe_value = LAST_VOICE;
	write_pipe(KS.lts_pipe,&pipe_value,1);
	return(CMD_success);
}
#endif

#ifndef SINGLE_THREADED
int cmd_remove()
{
	unsigned int pipe_value;

	KS.lang_ready[KS.lang_curr] = 0;
	pipe_value = KILL_TASK;
#ifdef SINGLE_THREADED
	lts_loop(&pipe_value);
#else
	write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
	KS.lts_pipe = NULL_PIPE;
	KS.ph_pipe = NULL_PIPE;
	return(CMD_success);
}
#endif

#ifdef DTEX
/*
 * things related to the battery and external power..
 */
unsigned char *power_options[] = {
	"speak",	// say the power status.
	"interval",	// interval to repeat batt-low beeps (0=don't beep)
	"status",	// send back the power status.
	"sleep",	// time to wait before sleeping.. 
	"check",	// beep if batt low.
	0
	};


void say_string(volatile unsigned char _far *instr)
{
	// push a string into the input buffer..
	unsigned short i;
	for (i=0;instr[i] != '\0'; i++)
		put_ring(KS.in_ring,&instr[i]);

}
int cmd_power()
{
	int cmd_type,cmd_value;
	volatile unsigned short int statusreg, i;
	volatile unsigned long j;
//	unsigned short int flags;
	int status;

//	cmd_type =  string_match(power_options,(unsigned char *)params[0]);
	cmd_type =  string_match(power_options,pString[0]);
	if (cmd_type == NO_STRING_MATCH)
		return(CMD_bad_string);

	if(cmd_sync() == CMD_flushing)
		return(CMD_flushing);
	// we need to load down the power supply a bit to make sure
	// we get a reliable indication of battery state. Run in a 
	// loop for about a millisecond doing things..
//	flags = kernel_disable();
	j = 0;
	for (i=0;i<1000;i++)
		{
		j = i;
		statusreg = _inp(GPIO);
		}
//	kernel_enable(flags);

	switch (cmd_type)
		{
		case 0:	//speak
			say_string("[:sync]");
			if (statusreg&EXTPWR)
				{
			     	say_string("External power on.[:sync]");
				return(CMD_success);
				}
			if (statusreg&BATTOK)
				{
			     	say_string("Battery okay.[:sync]");
				return(CMD_success);
				}
			say_string("Battery is low.[:sync]");
			return(CMD_success);
		    break;

		case 1:	// interval
			KS.power_interval=params[1];
#ifdef DEBUG
			printf("[:rem interval %d]",KS.power_interval);
#endif //debug
			return(CMD_success);
		    break;

		case 2: // status
			if (statusreg&EXTPWR)
				{
			     	printf("[:power external]");
				return(CMD_success);
				}
			if (statusreg&BATTOK)
				{
			     	printf("[:power batt_OK]");
				return(CMD_success);
				}
			printf("[:power batt_low]");
			return(CMD_success);
		    break;

		case 3: // sleep
			KS.sleep_interval = params[1];
			return(CMD_success);
		    break;

		case 4: // check
			if (!(statusreg&BATTOK))
				{
				if(cmd_sync() == CMD_flushing)
					return(CMD_flushing);
				status = dtpc_tones(0,750,250);
				if (status != CMD_success)
					return(status);
				return(dtpc_tones_reset());
				}
			return(CMD_success);
		    break;

		default:
			return(CMD_bad_string);
		}
}
/*
 * version stuff
 */
unsigned char *version_options[] = {
	"speak",
	"status",
	0
	};

int cmd_version()
{
	int cmd_type,cmd_value;
	unsigned int old_sayflag;

//	cmd_type =  string_match(version_options,(unsigned char *)params[0]);
	cmd_type =  string_match(version_options,pString[0]);
	if (cmd_type == NO_STRING_MATCH)
		return(CMD_bad_string);

	if(cmd_sync() == CMD_flushing)
		return(CMD_flushing);


	switch (cmd_type)
		{
		case 0:	//speak
			if(cmd_sync() == CMD_flushing)
				return(CMD_flushing);
			say_string(&KS.versionspeak[0]);
			if(cmd_sync() == CMD_flushing)
				return(CMD_flushing);
			return(CMD_success);
		    break;

		case 1: // status
			printf("[:version %f]\n",&KS.version[0]);
			return(CMD_success);
		    break;


		default:
			return(CMD_bad_string);
		}
}

/*
 * [:tsr  stuff
 */
unsigned char *tsr_options[] = {
	"on",
	"off",
	0
	};

int cmd_tsr()
{
	int cmd_type,cmd_value;

//	cmd_type =  string_match(tsr_options,(unsigned char *)params[0]);
	cmd_type =  string_match(tsr_options,pString[0]);
	if (cmd_type == NO_STRING_MATCH)
		return(CMD_bad_string);

	if(cmd_sync() == CMD_flushing)
		return(CMD_flushing);


	switch (cmd_type)
		{
		case 0:	//on
			KS.dleseq_OK = true;
			return(CMD_success);
		    break;

		case 1: // off
			KS.dleseq_OK = false;
			return(CMD_success);
		    break;


		default:
			return(CMD_bad_string);
		}
}
#endif /*DTEX*/
#endif