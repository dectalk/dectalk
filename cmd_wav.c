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
 *    File Name:	cmd_wav.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  pcdt digitized data support ...
 *
 ***********************************************************************
 *    Revision History:
 *
 * 03jan96	...tek		dtex merge; dtex doesn't do digitized.
 */
 
#include	"cmd_def.h"

#ifdef FILE_SYSTEM
cmd_digitized()
{
#if	!defined(DTEX) && !defined(SIMULATOR)

	unsigned int pipe_value;

	if(cmd_sync() == CMD_flushing)
		return(CMD_flushing);
	KS.spc_mode = SPC_mode_digital;
	signal_semaphore(&KS.isa_sem);
	wait_semaphore(&KS.text_sync);

	pipe_value = LAST_VOICE;
	write_pipe(KS.lts_pipe,&pipe_value,1);
#endif /*DTEX*/

	return(CMD_success);
}
#endif
#endif