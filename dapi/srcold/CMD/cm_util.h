/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:	cm_util.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Include file for cm_util.c
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev		Who     Date            Description
 * ---     	-----   -----------     --------------------------------------------
 * 001	    SIK		07/15/1996		Cleaning up and maintenance
 */                                                            
 
#ifndef CMUTILH
#define CMUTILH 1

#include "l_com_ph.h"
 
/* The following tables are used in  cm_util_dtpc_tones() and cm_util_dtpc_tones_reset() */
unsigned char tlikmap[] = /* DTMF decode chip map table.	*/
{
	'0',	'1',	'2',	'3',
	'4',	'5',	'6',	'7',
	'8',	'9',	'*',	'#',
	'A',	'B',	'C',	'D'
};

short	tlitone0[] = 
{			/* DTMF frequency 2		*/
	1336,	/* 0 */
	1209,	/* 1 */
	1336,	/* 2 */
	1477,	/* 3 */
	1209,	/* 4 */
	1336,	/* 5 */
	1477,	/* 6 */
	1209,	/* 7 */
	1336,	/* 8 */
	1477,	/* 9 */
	1209,	/* * */
	1477,	/* # */
	1633,	/* A */
	1633,	/* B */
	1633,	/* C */
	1633	/* D */
};

short	tlitone1[] = 
{			/* DTMF frequency 1		*/
	941,	/* 0 */
	697,	/* 1 */
	697,    /* 2 */
	697,    /* 3 */
	770,    /* 4 */
	770,    /* 5 */
	770,    /* 6 */
	852,    /* 7 */
	852,    /* 8 */
	852,	/* 9 */
	941,	/* * */
	941,	/* A */
	770,	/* B */
	852,	/* C */
	941		/* D */
};

short	tliproto[NWDTMF] = 
{				/* DTMF prototype.*/
	0,			/* [F1]				*/
	0, 			/* [F2]				*/
	6550,		/* [RINU1]			*/
	4123,		/* [RINU2]			*/
	5,   		/* [NRMPU]			*/
	DTMF_ON, 	/* [NON] (160 ms.)  */
	6550,		/* [RIND1]			*/
	4123,		/* [RIND2]			*/
	5,   		/* [NRMPD]			*/
	DTMF_OFF	/* [NOFF] (60 ms.)  */
};

#endif
