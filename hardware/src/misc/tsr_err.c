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
 *    File Name:	tsr_err.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC I/O error support ...
 *
 ***********************************************************************
 *    Revision History:
 * 31 jun 96	...tek		merge dtex
 */

#include "tsr.h"
#include	"tsrp.h"


/*
 *  error exit routines ... if we are in dos, then we exit, if not
 *  we post the status and hang until we are cleared out ...
 */

tsr_error(str)
char *str;
{
	struct dectalk_control _far *dtc;
	union _REGS  tsr_regs;
	char *s;

	RB.ah = DECTALK_ID;
	RB.al = GET_DTC;
	_int86(0x2f, &tsr_regs, &tsr_regs);

	FP_SEG(dtc) = RW.dx;
	FP_OFF(dtc) = RW.bx;

	printf("\n  !Dectalk PC Error ... %s.",str);
	printf("\n   Last status : %04x  Last command : %04x",
		DTC.status,DTC.command);
#ifndef DTEX
	printf("\n   Curr status : %04x  Driver error code : %04x",
		((inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW)), DTC.error_status);
#endif
	printf("\n   Last module status : %04x",DTC.module_status);
	switch (DTC.id)	{
		case	ID_kernel	: s="kernel";break;
		case	ID_boot		: s="boot";break;
		}
	printf("  Run mode : %s",s);			
	exit(1);
	return (0);
}
