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
 *    File Name:	cmd_err.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * cmd_err() is used to process errors that occur during command
 * execution ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#ifndef NO_CMD

#include	"cmd_def.h"

#define	CMD_success				0
#define	CMD_bad_string			1
#define	CMD_bad_value			2
#define	CMD_bad_command		3
#define	CMD_bad_param			4
#define	CMD_bad_phoneme		5

void command_error(type)
int type;
{
	unsigned int pipe_value[3];
	char _far *es;
	SEQ	seq;


	es = (unsigned char _far *)KS.error_table[type];
	switch(error_mode)	{

		case	ERROR_ignore	:
			break;

		case	ERROR_text		:
#ifdef PRINT_OUTPUT
			printf("\n[:error %s]",es);
#endif
			break;

		case	ERROR_escape		:
#ifdef ESCAPE_SEQUENCES
			seq.s_type   = DCS;
			seq.s_pintro = 0;
			seq.s_final  = DCS_F_DECTALK;
			seq.s_ninter = 0;
			seq.s_nparam = 4;
			seq.s_dflag[0] = FALSE;
			seq.s_param[0] = P1_DECTALK;
			seq.s_param[1] = R2_ERROR;
			seq.s_dflag[1] = FALSE;
			seq.s_param[2] = CT[cmd_index].esc_value;
			seq.s_dflag[2] = FALSE;
			seq.s_param[3] = type;
			putseq((SEQ  *)&seq);
			seq.s_type = ST;
			putseq((SEQ  *)&seq);
#endif
			break;
			
		case	ERROR_speak		:
			
			cmd_sync();
			while(*es)
				{
				pipe_value[0] = (PFASCII<<PSFONT) + *es++;
#ifdef SINGLE_THREADED
				lts_loop(pipe_value);
#else
				write_pipe(KS.lts_pipe,pipe_value,1);
#endif
				}
			pipe_value[0] = (PFASCII<<PSFONT) + 0xb;
#ifdef SINGLE_THREADED
			lts_loop(pipe_value);
#else
			write_pipe(KS.lts_pipe,pipe_value,1);
#endif
			break;
#ifndef SIMULATOR
		case	ERROR_tone		:

			cmd_sync();
			dtpc_tones(0,697,100);
			dtpc_tones_reset();
			break;
#endif
		};
}
#endif

#endif