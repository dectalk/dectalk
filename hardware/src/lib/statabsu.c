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
 *    File Name:	statabsu.c
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
 * 11dec95	...tek		merge dtex, fix libp protos
 * 24jan97      ...gl           change status_abs_update() to "void"
 */

#include	"defs.h"
#include	"dectalk.h"
#include	"kernel.h"
#include "cmd.h"
#include "esc.h"
#include        "l_us_ph.h"
#include "pcport.h"
#include	"186.h"       
#include "hardw.h"
#include "libp.h"

#ifndef DTEX /* non-express code*/
void status_abs_update(bits)
unsigned int bits;
{
	unsigned int flags;

	flags=kernel_disable();
	KS.isa_status = bits;
	KS.isa_status |= STAT_new_status;
	port_out_186(ISA_STATUS,KS.isa_status);
	kernel_enable(flags); 
        /* return (1); */
}
#else /*express code*/
void status_abs_update(bits)
unsigned int bits;
{
	unsigned int flags;

	status_abs(bits);
	serial_update();
}
#endif /*DTEX*/
