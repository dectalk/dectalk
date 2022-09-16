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
 *    File Name:	tsr_com.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC serial com port emulation ... this module traps calls
 *  to the serial port bios and redirects them to the dectalk module
 *  if desired ...
 *
 ***********************************************************************
 *    Revision History:
 */

#include "tsr.h"
#include	"tsrp.h"

void (__interrupt __far *old_int14)();		/* serial com thread */

static union  _REGS 	com_regs;

void interrupt _far dectalk_com(int_frame)
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
			if(DTI.port == (unsigned int)IFB.dl)
				break;
			}
		if(i == 4)
			_chain_intr(old_int14);
		}
	else
		{
		i = 0;
		if(DTI.port != (unsigned int)IFB.dl)
			_chain_intr(old_int14);
		}
	
/*
 *  do what ever the command says ...
 */

	switch(IFB.ah)	{

		case	_COM_init	:

			DTI.mode = IFB.al;
			break;

		case	_COM_send	:

			do {
				com_regs.h.ah = DECTALK_ID;
				com_regs.h.al = SEND_CHAR;
				com_regs.h.bl = IFB.al;
				com_regs.x.si = i;
				_int86((unsigned)0x2f, &com_regs, &com_regs);
				} while (com_regs.x.ax == TSR_BUSY || com_regs.x.ax == TSR_RETRY);

			IFW.ax = 0;
			if(com_regs.x.dx & STAT_tr_char)
				IFW.ax |= _CS_data_ready;
			if(com_regs.x.dx & STAT_rr_char)
				IFW.ax |= _CS_trans_shift_empty + _CS_trans_buffer_empty;
			break;

		case	_COM_receive	:

			do {
				com_regs.h.ah = DECTALK_ID;
				com_regs.h.al = GET_CHAR;
				com_regs.x.si = i;
				_int86((unsigned)0x2f, &com_regs, &com_regs);
				} while (com_regs.x.ax == TSR_BUSY || com_regs.x.ax == TSR_RETRY);

			IFB.al = com_regs.h.bl;
			IFB.ah = 0;
			if(com_regs.x.ax != TSR_SUCCESS)
				IFW.ax |= _CS_framing_error;
			if(com_regs.x.dx & STAT_tr_char)
				IFW.ax |= _CS_data_ready;
		  	if(com_regs.x.dx & STAT_rr_char)
				IFW.ax |= _CS_trans_shift_empty + _CS_trans_buffer_empty;
			break;

		case	_COM_status	:

			do {
				com_regs.h.ah = DECTALK_ID;
				com_regs.h.al = GET_STATUS;
				com_regs.x.si = i;
				_int86((unsigned)0x2f, &com_regs, &com_regs);
				} while (com_regs.x.ax == TSR_BUSY || com_regs.x.ax == TSR_RETRY);

			IFW.ax = _CS_CTS | _CS_DSR | _CS_delta_CTS | _CS_delta_DSR;
			if(com_regs.x.ax == TSR_SUCCESS || com_regs.x.ax == TSR_BUSY)
				{
				if(com_regs.x.dx & STAT_tr_char)
			 		IFW.ax |= _CS_data_ready;
				if(com_regs.x.dx & STAT_rr_char)
					IFW.ax |= (_CS_trans_shift_empty + _CS_trans_buffer_empty);
				break;
				}
		}
}


