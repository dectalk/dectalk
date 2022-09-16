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
 *    File Name:	putseq.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  ansi sequence put ...
 *
 ***********************************************************************
 *    Revision History:
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
 * This routine writes an ANSI sequence
 * to the serial line. The "sp" pointer points at
 * an ANSI structure. The "flag" is TRUE if C1 controls
 * should be output in their 8 bit form. This is a system
 * call, so it has 3 extra arguments. Like "getseq", this
 * is more of a shared routine than a system call, so
 * it does not call "enter" and "leave".
 */

int putseq(struct SEQ _far *sp)
/* SEQ   _far *sp; */
{
	register int    c;
	register int    i;
	

	c = sp->s_type;
	if ((c>=0x80 && c<=0x9F) && KS.eight_bit == false)
		{
		putc(ESC);
		c -= 0x40;
		}
	putc(c);
	c = sp->s_type;
	if (c==ESC || c==DCS || c==CSI || c==OSC || c==PM || c==APC) {
		if (sp->s_pintro != 0)
			putc(sp->s_pintro);
		for (i=0; i<sp->s_nparam; ++i) {
			if (i != 0)
				putc(';');
			if (sp->s_dflag[i] == FALSE)
				putn((unsigned)sp->s_param[i]);
		}
		for (i=0; i<sp->s_ninter; ++i)
			putc(sp->s_inter[i]);
		putc(sp->s_final);
	}
	return(1);
}


