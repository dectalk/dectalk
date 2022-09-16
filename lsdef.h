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
 *    File Name:	lsdef.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * This header file contains all
 * of the definitions used by the letter to
 * sound part of DECtalk III. This has been
 * modified to incorporate the changes for
 * the new top level code.
 *
 ***********************************************************************
 *    Revision History:
 * 01 21-Feb-85	DGC	Compound word stress.
 * 02 08-Apr-85 DGC	First/Second status on lookups.
 * 03 29-May-85 DGC	Added "TTYPUTC".
 * 04 18-Sep-85 DGC	FIRST was multiply defined to be 0. Made
 *			the one in the "wh" code be UNK_WH.
 * 05 10-May-95 GL	Get the order right. lsdefs.h should be before ltsp.h
 * 06 24-Oct-96 GL      add palloc() function declaration.
 */

#ifndef LSDEFH
#define LSDEFH 1

#include	"kernel.h"
#ifdef GERMAN
#include	"glschar.h"
#else
#include	"lschar.h"
#endif
#include	"dict.h"
#include	"lsdefs.h"
#ifdef GERMAN
#include	"gltsp.h"
#else
#include	"ltsp.h"
#endif

#ifndef NULL
#define	NULL	0
#endif



extern PHONE *palloc(void);

//#ifdef MFG 
//int namef;
//#endif

#endif
