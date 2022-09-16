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
 *    File Name:	serialu.c
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
 * 11dec95	...tek		merge dtex, fix libp protos.
 */

#include	"defs.h"
#include	"dectalk.h"
#include	"kernel.h"
#include "cmd.h"
#include "esc.h"
#include        "l_us_ph.h"
#include "pcport.h"
#include	"186.h"           
#include	"hardw.h"
#include 	"libp.h"

#ifndef DTEX /*non-dex code */
void serial_update()
{
	unsigned int flags;

	flags=kernel_disable();
	KS.isa_status &= ~(STAT_tr_char|STAT_rr_char);
	if(IN_RING.count < IN_RING_MAX)
		KS.isa_status |= STAT_rr_char;
	if(OUT_RING.count)
		KS.isa_status |= STAT_tr_char;
	KS.isa_status |= STAT_new_status;
	port_out_186(ISA_STATUS,KS.isa_status);
	kernel_enable(flags);

}
#else /* dtex code */
unsigned char statbuf[5] = { DLE,0x50,0,0,0};

void serial_update()
{
	unsigned short int flags, temp;

	if (!KS.dleseq_OK)	// in TSR mode?
		return;		// no - don't send.

	flags=kernel_disable();
	// build a status string.
	temp=KS.isa_status;
	statbuf[1] = 0x40 | ((temp>>12)&0xf);
	statbuf[2] = ((temp>>6)&0x3f);
	if (statbuf[2]<0x20)
		statbuf[2] += 0x40;
	statbuf[3] = (temp&0x3f);
	if (statbuf[3]<0x20)
		statbuf[3] += 0x40;
	kernel_enable(flags);
	p_putstring(statbuf);

}
#endif /*DTEX*/
