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
 *    File Name:	denef.c
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
 * 16may95     ...tek          put back the status_clear_update()
 * 11dec95	...tek		dtex merge, fix libp protos
 *
 */

#include        "defs.h"
#include        "dectalk.h"
#include        "kernel.h"
#include "cmd.h"
#include "esc.h"
#include        "l_us_ph.h"
#include "pcport.h"
#include        "186.h"
#include "libp.h"


/*
 *  flush_done() clears the flushing bit and allows the command processor
 *  to restart ...
 */
       
 /* 16may95     ...tek          put back the status_clear_update() */
	
void flush_done()
{
	KS.cmd_flush = false;
	KS.spc_sync.value = 0;
	status_clear_update(STAT_flushing); /* might not want to update */
						/* on an express.. */
}

