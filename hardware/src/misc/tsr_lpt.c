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
 *    File Name:	tsr_lpt.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC lpt port emulation ... this module traps calls
 *  to the lpt bios and redirects them to the dectalk module
 *  if desired ...
 *
 ***********************************************************************
 *    Revision History:
 */

#include "tsr.h"
#include	"tsrp.h"

void (__interrupt _far *old_int17)();		/* parallel thread */

static union  _REGS 	lpt_regs;

void interrupt _far dectalk_lpt(int_frame)
union	INT_REGS	int_frame;
{

	int	i;

/*
 *  if the call is not for us, then simply pass it on ... pick a
 *  port ...
 */

	if(num_modules > 1)
		{
		for(i=0;i<4;i++)
			{
			if(DTI.base == 0)
				continue;
			if(DTI.lpt == (unsigned int)IFW.dx)
				break;
			}
		if(i == 4)
			_chain_intr(old_int17);
		}
	else
		{
		i = 0;
		if(DTI.lpt != (unsigned int)IFW.dx)
			_chain_intr(old_int17);
		}
/*
 *  do what ever the command says ...
 */

	switch(IFB.ah)	{


		case	_LPT_send	:

			do {
				lpt_regs.h.ah = DECTALK_ID;
				lpt_regs.h.al = SEND_CHAR;
				lpt_regs.h.bl = IFB.al;
				lpt_regs.x.si = i;
				_int86((unsigned)0x2f, &lpt_regs, &lpt_regs);
				} while (lpt_regs.x.ax == TSR_BUSY || lpt_regs.x.ax == TSR_RETRY);

			IFB.al = 0;
			IFB.ah = _LS_acknowledge+_LS_selected;
			if(lpt_regs.x.ax == TSR_SUCCESS && lpt_regs.x.dx & STAT_rr_char)
					IFB.ah |= _LS_not_busy;
			break;

		case	_LPT_init	:
		case	_LPT_status	:

			lpt_regs.h.ah = DECTALK_ID;
			lpt_regs.h.al = GET_STATUS;
			lpt_regs.x.si = i;
			_int86((unsigned)0x2f, &lpt_regs, &lpt_regs);

			IFB.al = 0;
			IFB.ah = _LS_acknowledge+_LS_selected;
			if(lpt_regs.x.ax == TSR_SUCCESS && lpt_regs.x.dx & STAT_rr_char)
					IFB.ah |= _LS_not_busy;
			break;
		}
}


