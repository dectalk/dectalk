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
 *    File Name:	la_def.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  language code page switch main def file ...
 *
 ***********************************************************************
 *    Revision History:
 *	001	MFG	06/19/1998	Copied from file spa_def.h for latin american support
 *  002	GL	09/01/98	BATS#758 change PFSPAIN to PFSP.
 */

#ifndef LA_DEFH
#define LA_DEFH 1

#include "defs.h"
#include "kernel.h"
#include        "iso_char.h"
#include        "l_la_ph.h"
#include        "cmd.h"

//#define NULL    0
#define NULL_ASCKY              0xffff
#define PLA(x)					((PFLA<<PSFONT) | (x))
#endif

