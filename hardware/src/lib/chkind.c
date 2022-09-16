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
 *    File Name:	chkind.c
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

void kernel_enable(unsigned int);
/* unsigned int kernel_disable();  */

void check_index(which_phone)
unsigned int which_phone;
{
	struct spc_packet _far *spc_pkt;

	while((spc_pkt = (struct spc_packet _far *)KS.index_pending.head) != NULL_SPC_PACKET)
		{
		if((*spc_pkt).data[5] > which_phone)
			break;
		spc_pkt = wait_queue(&KS.index_pending);
		signal_queue(&KS.spc_active,spc_pkt);
		}
}

