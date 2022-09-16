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
 *    File Name:	sendind.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * Kernel services ... this is a shared file of common routines that
 * can be included with other processes.  It uses only kernel data
 * structures (KS.xxx) and stack, both of which will resolve at link
 * time.
 *
 ***********************************************************************
 *    Revision History:
 */

#include        "defs.h"
#include        "dectalk.h"
#include        "kernel.h"
#include        "cmd.h"
#include        "esc.h"
#include        "l_us_ph.h"
#include        "pcport.h"
#include        "186.h"
#include        "libp.h"

void kernel_enable(unsigned int);
/*unsigned int kernel_disable(); */

void __far send_index(int how,int value)
/*int how;  */
/*nt value; */
{
	SEQ     seq;


	if(how == ESCAPE_OUTPUT)
	{
		seq.s_type   = DCS;
		seq.s_pintro = 0;
		seq.s_final  = DCS_F_DECTALK;
		seq.s_ninter = 0;
		seq.s_nparam = 3;
		seq.s_dflag[0] = FALSE;
		seq.s_param[0] = P1_DECTALK;
		seq.s_param[1] = R2_IX_REPLY;
		seq.s_dflag[1] = FALSE;
		seq.s_param[2] = value;
		seq.s_dflag[2] = FALSE;
		if (seq.s_param[2] == 0)
			seq.s_dflag[2] = TRUE;
		putseq((SEQ  *)&seq);
		seq.s_type = ST;
		putseq((SEQ  *)&seq);
	}
	else
    {
        WAIT_PRINT;
		printf("\n[:index %d]",value);
        SIGNAL_PRINT;
    }
    return;
	
}       

