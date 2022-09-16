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
 *    File Name:	cmd_ph.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  This file contains all the command code that passes phonemes along
 *  to the ph process for actual implementation (ie, these commands are
 *  synchronized with the text stream).
 *
 ***********************************************************************
 *    Revision History:
 * 0001 19-SEP-95 cjl Add FIELD_TEST; turn off female voices in non-English langs
 * 0002 10-OCT-95 CJL Changed exit method for non-English female voices.
 * 0003 04-DEC-95 CJL Re-Enabled Female Voices.
 *
 */
 
#include	"cmd_def.h"
#include	"eng_phon.h"

/*
 *  set the speaking rate ...
 */
cmd_rate()
{
	unsigned short	pipe_value[2];

	pipe_value[0] = (1<<PSNEXTRA) + RATE;
	pipe_value[1] = params[0];
#ifdef SINGLE_THREADED
	lts_loop(pipe_value);
#else
	write_pipe(KS.lts_pipe,pipe_value,2);
#endif
	return(CMD_success);

}

/*
 *  set the speaking voice ...
 */
const unsigned char *voice_names[] = {

	"paul",
	"betty",
	"harry",
	"frank",
	"dennis",
	"kit",
	"ursula",
	"rita",
	"wendy",
	"val",
	0

};

cmd_name()
{
	unsigned short pipe_value[2];

	if(esc_command)
		pipe_value[1] = params[0];
	else if(CT[cmd_index].esc_value == DCS_NAME)
//			pipe_value[1] = string_match(voice_names,(unsigned char *)params[0]);
			pipe_value[1] = string_match(voice_names,pString[0]);
		 else
			pipe_value[1] = CT[cmd_index].esc_value & ESCAPE_CODE;
			
	if((pipe_value[1] >= 0) && (pipe_value[1] < MAX_VOICES))
		{
		pipe_value[0] = (1<<PSNEXTRA) + NEW_SPEAKER;
#ifdef SINGLE_THREADED
		lts_loop(pipe_value);
#else
		write_pipe(KS.lts_pipe,pipe_value,2);
#endif
		return(CMD_success);
		}
	if(esc_command == false)
		return(CMD_bad_string);
	else
		return(CMD_bad_value);
}

cmd_latin()
{
	unsigned short pipe_value[2];
	pipe_value[0] = (1<<PSNEXTRA) + CPAUSE;
	pipe_value[1] = params[0];
#ifdef SINGLE_THREADED
	lts_loop(pipe_value);
#else
	write_pipe(KS.lts_pipe,pipe_value,2);
#endif
	return(CMD_success);
}

/*
 *  set the comma pause ...
 */

cmd_comma()
{
	unsigned short pipe_value[2];

	pipe_value[0] = (1<<PSNEXTRA) + CPAUSE;
	pipe_value[1] = params[0];
#ifdef SINGLE_THREADED
	lts_loop(pipe_value);
#else
	write_pipe(KS.lts_pipe,pipe_value,2);
#endif
	return(CMD_success);
}

/*
 *  set the comma pause ...
 */

cmd_period()
{
	unsigned short pipe_value[2];

	pipe_value[0] = (1<<PSNEXTRA) + PPAUSE;
	pipe_value[1] = params[0];
#ifdef SINGLE_THREADED
	lts_loop(pipe_value);
#else
	write_pipe(KS.lts_pipe,pipe_value,2);
#endif
	return(CMD_success);
}

/*
 *  process index commands ...
 */
#ifndef NO_INDEXES
const unsigned char *index_options[] = {
	"mark",
	"reply",
	"query",
	"pause",
	0
};

cmd_mark()
{
	unsigned int pipe_value[3];
	int	cmd_type,cmd_value;

	if(esc_command == false)
		{
//		cmd_type = string_match(index_options,(unsigned char *)params[0]);
		cmd_type = string_match(index_options,pString[0]);
		if(cmd_type == NO_STRING_MATCH)
			return(CMD_bad_string);
		if(cmd_type == 3)
			{
			cmd_type = DCS_INDEX;
			pipe_value[2] = SPC_INDEX_PAUSE;
			}
		else
			{
			cmd_type += DCS_INDEX;
			pipe_value[2] = TEXT_OUTPUT;
			}
		cmd_value = params[1];
		}
	else
		{
		cmd_type = CT[cmd_index].esc_value;
		pipe_value[2] = ESCAPE_OUTPUT;
		cmd_value = params[0];
		}

	switch(cmd_type)
		{
		case	DCS_INDEX	:

			pipe_value[0] = (2<<PSNEXTRA) + INDEX;
			break;

		case	DCS_INDEX_REPLY	:

			pipe_value[0] = (2<<PSNEXTRA) + INDEX_REPLY;
			break;

		case	DCS_INDEX_QUERY	:

			send_index(pipe_value[2],KS.lastindex);
			return(CMD_success);

		default			:

			if(esc_command == false)
				return(CMD_bad_string);
			return(CMD_bad_value);
		}

	pipe_value[1] = cmd_value;
	write_pipe(KS.lts_pipe,pipe_value,3);
	return(CMD_success);
}
#endif
/*
 * new, complete define voice ...
 */

const unsigned char *define_options[] = {

	"save", /* make the changes permanent */
	"sx",   /* SEX = m */
	"sm",   /* SM (smoothness in %, actually spectral tilt offset) */
	"as",   /* AS (assertiveness, degree of final f0 fall in % */
	"ap",   /* AP (Average pitch in Hz) */
	"pr",   /* PR (pitch range in percent of Paul's range) */
	"br",   /* BR (breathiness in dB) */
	"ri",   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	"nf",   /* NF (additional fixed number of samples in nopen) */
	"la",   /* LA (laryngealization, in percent) */
	"hs",   /* HS (head size, in percent relative to normal for SEX) */
	"f4",   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	"b4",   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	"f5",   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	"b5",   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	"f7",   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	"f8",   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	"gf",   /* GF (gain of frication source in dB) */
	"gh",   /* GH (gain of aspiration source in dB) */
	"gv",   /* GV (gain of voicing source in dB ) */
	"gn",   /* GN (gain of input to cascade nasal pole pair in dB) */
	"g1",   /* G1 (gain of input to cascade 5th formant in dB) */
	"g2",   /* G2 (gain of input to cascade 4th formant in dB) */
	"g3",   /* G3 (gain of input to cascade 3rd formant in dB) */
	"g4",   /* G4 (gain of input to cascade 2nd formant in dB) */
	"g5",   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	"ft",   /* FT (f0-dependent spectral tilt in % of max) */
	"bf",   /* BF (baseline f0 fall in Hz) */
	"lx",   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	"qu",   /* QU (quickness of larynx gestures in % of max quickness) */
	"hr",   /* HR (hat-pattern fundamental frequency rise in Hz) */
	"sr",	  /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0
};

cmd_define()
{
	unsigned short pipe_value[3];

	if(param_index == 0)
		return(CMD_success);
	if(esc_command == false)
		{
//		pipe_value[1] = string_match(define_options,(unsigned char *)params[0]);
		pipe_value[1] = string_match(define_options,pString[0]);
		if(pipe_value[1] == NO_STRING_MATCH)
			return(CMD_bad_string);
		}
	else
		{
		if(defaults[0] == true)
			return(CMD_bad_value);
		pipe_value[1] = params[0];
		}
/*
 *  do the save first ...
 */

	if(pipe_value[1] == 0)
		{
		if(defaults[1] == false)
			return(CMD_bad_value);
		else
			{
			pipe_value[0] = SAVE;
#ifdef SINGLE_THREADED
			lts_loop(pipe_value);
#else
			write_pipe(KS.lts_pipe,pipe_value,1);
#endif
			}
		}
	else
		{
		if(defaults[1] == true)
			return(CMD_bad_value);
		else
			{
			pipe_value[0] = (2<<PSNEXTRA)+NEW_PARAM;
			pipe_value[1] -= 1;
			pipe_value[2] = params[1];
#ifdef SINGLE_THREADED
			lts_loop(pipe_value);
#else
			write_pipe(KS.lts_pipe,pipe_value,3);
#endif
			}
		}
	return(CMD_success);
}

/*
 *  speak and print the phonemic table ...
 */

#ifdef FULL_LANGUAGE_SUPPORT
#ifdef PRINT_OUTPUT
cmd_plang()
{

	unsigned int pipe_value;
	int	i;

	if(cmd_sync() == CMD_flushing)
		return(CMD_flushing);
	if(params[0] == 0 || defaults[0] == true)
		{
		for(i=1;i < TOT_ALLOPHONES ;i++)
			if(KS.arpabet[i*2])
				{
				WAIT_PRINT;
				printf("\n  %d arpabet (%c%c)  asky (%c)",
					i,KS.arpabet[i*2],KS.arpabet[i*2+1],KS.ascky[i]);
				SIGNAL_PRINT;
				pipe_value = (PFUSA<<PSFONT) | i;
				write_pipe(KS.ph_pipe,&pipe_value,1);
				pipe_value = (PFUSA<<PSFONT) | COMMA;
				write_pipe(KS.ph_pipe,&pipe_value,1);
				sleep(100);
				}
		}
	else if(params[0] < TOT_ALLOPHONES)
		{
		i = params[0];
		WAIT_PRINT;
		printf("\n  %d arpabet (%c%c)  asky (%c)",
				i,KS.arpabet[i*2],KS.arpabet[i*2+1],KS.ascky[i]);
		SIGNAL_PRINT;
		pipe_value = (PFUSA<<PSFONT) | i;
		write_pipe(KS.ph_pipe,&pipe_value,1);
		pipe_value = (PFUSA<<PSFONT) | COMMA;
		write_pipe(KS.ph_pipe,&pipe_value,1);
		}
	return(CMD_success);
}
#endif

#endif
#endif