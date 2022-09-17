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
 *    File Name:	pcdt.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  general pc dectalk includes ...
 *
 ***********************************************************************
 *    Revision History:
 *  15sep95   JDB   commented out several definition to eliminate re-defs
                    from hardw.h   
 */

#ifndef PCDTH
#define PCDTH 1

#define	IO_BASE		0x400

#define	ISA_STATUS		(IO_BASE+0x00)			/* posted isa status */
#define	ISA_COMMAND		(IO_BASE+0x00)			/* command data from isa */

/* JDB 9/15/95 commented out to avoid redefinition from hardw.h      */
/* #define	ISA_DO			(IO_BASE+0x80)	 */ /* data out to isa   */
/* #define	ISA_DI			(IO_BASE+0x80)	 */ /* data in from isa  */

#define	SPCIO			(IO_BASE+0x100)
#define	ISA_INT		(IO_BASE+0x180)
#define	IN_VOL		(IO_BASE+0x200)
#define	DMA_BUFF		(IO_BASE+0x280)                              

/* JDB 9/15/95 commented out to avoid redefinition from hardw.h      
#define	RAM_ENABLE	(IO_BASE+0x300)                                  */


#define	ANY_CHANGE		0
#define	LOW_CHANGE		1
#define	HIGH_CHANGE		2

#define	ROM_STRING	char _based(_segname("_CODE"))
#define	ROM_WORD		unsigned ing _based(_segname("_CODE"))

void _far pcdt_init();

#endif
