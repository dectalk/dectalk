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
 *    File Name:	cmd_lts.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  This file contains all commands that are synchonized by lts.
 *  mode flags are synchronous with the text stream ... they can be buffered
 *  now and will act correctly ...
 *
 ***********************************************************************
 *    Revision History:
 *
 *	04-NOV-1994, Carl Leeber
 *	Changed int i,value; to unsigned in 2 places.
 */


#include	"cmd_def.h"

const unsigned char *mode_options[] = {
	"on",
	"off",
	"set",
	"math",
	"europe",
	"spell",
	"name",
	"homograph",
	"citation",
	"latin",
	0
};


cmd_mode()
{
	unsigned int	i,value;
	unsigned short pipe_value[3];

	pipe_value[0] = (2<<PSNEXTRA)+LTS_SYNC;
	if(esc_command == false)
		{
		pipe_value[1] = 0;
		pipe_value[2] = 0;
		for(i=0;i<param_index;i++)
			{
//			value = string_match(mode_options,(unsigned char *)params[i]);
			value = string_match(mode_options,pString[i]);
			if(value == NO_STRING_MATCH)
				return(CMD_bad_string);
			switch(value)
				{
				case	0	: 				/* on */

					pipe_value[1] = LTS_MODE_SET;
#ifdef SINGLE_THREADED
					lts_loop(pipe_value);
#else
					write_pipe(KS.lts_pipe,pipe_value,3);
#endif
					break;

				case	1	:				/* off */

					pipe_value[1] = LTS_MODE_CLEAR;
#ifdef SINGLE_THREADED
					lts_loop(pipe_value);
#else
					write_pipe(KS.lts_pipe,pipe_value,3);
#endif
					break;

				case	2	:				/* set */

					pipe_value[1] = LTS_MODE_ABS;
#ifdef SINGLE_THREADED
					lts_loop(pipe_value);
#else
					write_pipe(KS.lts_pipe,pipe_value,3);
#endif
					break;

				case	3	:				/* minus */

					pipe_value[2] |= MODE_MATH;
					break;

				case	4	:				/* europe */

					pipe_value[2] |= MODE_EUROPE;
					break;

				case	5	:				/* spell */

					pipe_value[2] |= MODE_SPELL;
					break;

				case	6	:				/* name determination */

					pipe_value[2] |= MODE_NAME;
					break;

				case	7	:				/* homograph determination */

					pipe_value[2] |= MODE_HOMOGRAPH;
					break;

				case	8	:				/* citation mode */

					pipe_value[2] |= MODE_CITATION;
					break;

				case	9	:				/* citation mode */

					pipe_value[2] |= MODE_LATIN;
					break;



				}
			}
		return(CMD_success);
		}
	else
		{
		pipe_value[2] = params[0] & (MODE_MATH|MODE_EUROPE|MODE_SPELL|MODE_NAME|MODE_HOMOGRAPH|MODE_CITATION);
		switch(params[1])
			{
			case	0	:
				pipe_value[1] = LTS_MODE_ABS;
				break;
			case	1	:
				pipe_value[1] = LTS_MODE_SET;
				break;
			case	2	:
				pipe_value[1] = LTS_MODE_CLEAR;
				break;

			default	:
				return(CMD_bad_value);
			}
#ifdef SINGLE_THREADED
		lts_loop(pipe_value);
#else
		write_pipe(KS.lts_pipe,pipe_value,3);
#endif
		return(CMD_success);
		}
}


const unsigned char *pronounce_options[] = {
	"alternate",
	"name",
	"primary",
	0
};


cmd_pronounce()
{
	unsigned int	i,value;
	unsigned short pipe_value[2];

	pipe_value[0] = (1<<PSNEXTRA)+LTS_SYNC;
	if(esc_command == false)
		{
		for(i=0;i<param_index;i++)
			{
//			value = string_match(pronounce_options,(unsigned char *)params[i]);
			value = string_match(pronounce_options,pString[i]);
			if(value == NO_STRING_MATCH)
				return(CMD_bad_string);
			switch(value)
				{
				case	0	: 				/* alternate */

					pipe_value[1] = LTS_DIC_ALTERNATE;
					break;

				case	1	:				/* acna name */

					pipe_value[1] = LTS_ACNA_NAME;
					break;

				case	2	:				/* primary */

					pipe_value[1] = LTS_DIC_PRIMARY;
					break;
				};
#ifdef SINGLE_THREADED
			lts_loop(pipe_value);
#else
			write_pipe(KS.lts_pipe,pipe_value,2);
#endif
		}
		}
	else
		{
		if(params[0] >= (sizeof(pronounce_options)/2))
			return(CMD_bad_value);
		switch(params[0])
			{
			case	0	: 				/* alternate */

				pipe_value[1] = LTS_DIC_ALTERNATE;
				break;

			case	1	:				/* acna name */

				pipe_value[1] = LTS_ACNA_NAME;
				break;

			case	2	:				/* primary */

				pipe_value[1] = LTS_DIC_PRIMARY;
				break;
			}
#ifdef SINGLE_THREADED
		lts_loop(pipe_value);
#else
		write_pipe(KS.lts_pipe,pipe_value,2);
#endif
	}
	return(CMD_success);
}
#endif