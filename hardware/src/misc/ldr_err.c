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
 *    File Name:	ldr_boot.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC I/O error support ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include "ldr.h"
#include "ldrp.h"

/*
 *  error exit routines ... if we are in dos, then we exit, if not
 *  we post the status and hang until we are cleared out ...
 */

int tsr_error(char *str)
/*char *str;*/
{
	struct dectalk_control _far *dtp;
	union _REGS  tsr_regs;
	char *s;

	RB.ah = DECTALK_ID;
	RB.al = GET_DTC;
	RW.si = load_module;
	_int86(0x2f, &tsr_regs, &tsr_regs);

	FP_SEG(dtp) = RW.dx;
	FP_OFF(dtp) = RW.bx;

	printf("\nDectalk PC Error %s.",str);
	printf("\nLast status : %04x  Last command : %04x.",
		DTP.status,DTP.command);
	printf("\nCurr status : %04x  Driver error code : %04x.",
		((inp(DTP.base+1)<<8) + inp(DTP.base)), DTP.error_status);
	printf("\nLast module status : %04x.",DTP.module_status);
	switch (DTP.id)	{
		case	ID_kernel	: s="kernel";break;
		case	ID_boot		: s="boot";break;
		}
	printf("Run mode : %s.",s);
	exit(1);
}
