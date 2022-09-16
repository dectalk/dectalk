/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * Copyright (c) 1985, Digital Equipment Corporation, Maynard, Mass.
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
 *    File Name:	putn.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * The routines in this file
 * parse ANSI control sequences, as
 * described in DEC STD 138. They do no
 * interpretation of the sequences.
 * Thanks to Roy for the start!
 *
 ***********************************************************************
 *    Revision History:
 * 01 06-Mar-85	DGC	Moved to system code group.
 * 02 17-Apr-85 DGC	Added code to tell "0" from "default".
 * 03 18-Sep-85 DGC	Sytlistic changes, suggested by "lint".
 * ----------------	Released as C5005 V1.0 firmware.
 * 04 21-Oct-86 DGC	Changed for KRM.
 * 05 06-Apr-87 DGC	Since I need to re-release the firmware
 *			to get rid of the stack overflow, I decided
 *			to comment out the range check that
 *			makes the DT_MASK a pain to use on the
 *			military keypad.
 * 06 17-Sep-90 SGS	Added PR control switches
 */


#include "defs.h"
#include "esc.h"
#include "cmd.h"
#include "kernel.h"
#include "dectalk.h"
#include "pcport.h"

/*
 *  protos for this module ...
 */

unsigned int getc();
void putc();

/*
 * Convert an unsigned integer
 * to ASCII digits. Uses a simple, recursive
 * algorithm. May not be optimal on a machine
 * like the PDP11 which lacks an unsigned
 * divide instruction.
 */
putn(n)
unsigned int	n;
{
	unsigned int	q;

	q = n/10;
	if (q != 0)
		putn(q);
	putc((n%10)+'0'); 
	return (1);
}

