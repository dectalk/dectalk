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
 *    File Name:	saveind.c
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
#include "cmd.h"
#include "esc.h"
#include        "l_us_ph.h"
#include "pcport.h"
#include        "186.h"

void kernel_enable(unsigned int);
/*unsigned int kernel_disable(); */

/*
 *  Index marks are now handled a bit diferently ... they are flushed out
 *  tighter to the spc processing the phoneme, so they are saved in a
 *  pending queue until the phoneme is ready to be placed in the spc
 *  queue, they are placed in the spc queue, and the spc driver flushes
 *  them out as the data is processed ..
 *
 *  data field usage ...
 *
 *  data[0] == symbol marker (lts-phmain-phsort)
 *  data[1] == index style (mark or reply) 
 *  data[2] == index value (user specified)
 *  data[3] == reply style (escape, text or pause) 
 *  data[4] == phone offset (phsort converts) 
 *  data[5] == allophone offset (phalloph converts)
 *  data[6] == delete count
 */

void save_index(sym,type,value,how)
unsigned int sym,type,value,how;
{
	struct spc_packet _far *spc_pkt;

	spc_pkt = wait_queue(&KS.spc_pool);
	(*spc_pkt).type = SPC_type_index;
	(*spc_pkt).data[0] = sym;
	(*spc_pkt).data[1] = type;
	(*spc_pkt).data[2] = value;
	(*spc_pkt).data[3] = how;
	(*spc_pkt).data[4] = sym;
	(*spc_pkt).data[5] = sym;
	(*spc_pkt).data[6] = 0;
	signal_queue(&KS.index_pending,spc_pkt);
}

