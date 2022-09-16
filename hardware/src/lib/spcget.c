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
 *    File Name:	spcget.c
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
 * 16oct96	...tek		added queue_count() (see queue.asm)
 */

#include        "defs.h"
#include        "dectalk.h"
#include        "kernel.h"
#include "cmd.h"
#include "esc.h"
#include "l_us_ph.h"
#include "pcport.h"
#include        "186.h"

void kernel_enable(unsigned int);
/*unsigned int kernel_disable(); */

/*
 *  allocating and sending packets to the spc driver ...
 */

int     spc_dma_lengths[] = { 18, 22, 11, 0, 1, 0, 0, 0, 0 };

short _far *spcget(spc_type)
unsigned int spc_type;
{
	struct spc_packet _far *spc_pkt;

	spc_pkt = wait_queue(&KS.spc_pool);
	(*spc_pkt).type = spc_type;
	(*spc_pkt).length = spc_dma_lengths[spc_type];
	return((short far *)&(*spc_pkt).data[0]);
}

unsigned int queue_count(P_QS queue)
{
// return the count of entries on queue queue..
P_QS	qp;
unsigned int count=0;

	// walk the list..                            
	qp = queue;
	while(qp->head)
		{ 
		count++;
                qp = qp->head;
                }
	return(count);
}
