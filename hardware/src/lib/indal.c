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
 *    File Name:	indal.c
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
 * 11dec95	...tek		correct kernel_*() prototypes (now in libp)
 */

#include        "defs.h"
#include        "dectalk.h"
#include        "kernel.h"
#include        "cmd.h"
#include        "esc.h"
#include        "l_us_ph.h"
#include        "pcport.h"
#include        "186.h"
#include	"libp.h"

void    set_index_allo(nphone,nallo)
unsigned int nallo,nphone;
{
	struct spc_packet _far *spc_pkt;

	if((spc_pkt = (struct spc_packet _far *)KS.index_pending.head) != NULL_SPC_PACKET)
		{
		while(spc_pkt != NULL_SPC_PACKET)
			{
		  /*    printf("nphone = %d %d\n",nphone,nallo);*/
			if((*spc_pkt).data[4] == nphone)        {
				(*spc_pkt).data[5] = nallo;
  /*                            printf(" got a hit");*/
				}
			spc_pkt = (struct spc_packet _far *)(*spc_pkt).link;
			}
		}
}

