/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
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
 *    File Name:	ls_homo.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Homograph disambiguation rules.
 *    Generated from : ls_homo_us.tab
 *    Written to file : ls_homo.h
 *    Created on : 01/10/03 at 15:42:32
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---------------------------------------------------------------------
 * 001  GL      4/30/96         add new rule to handle "please" + verb.
 *				[+verb]   / [+inter] -
 * 002  GL      05/12/96        Update the the latest homograph table
 * 003  GL      10/01/96        Add new rule [+adj] \ [bev] - , to fix the "is perfect Paul" problem     
 * 004  GL      02/01/1997      remove [+verb] \ [noun] -  rule.
 * 005	MGS		04/11/2002		ARM7 port
 * 006	MGS		01/10/2003		Moved ": [+noun] / [pos] - " to above ": [+verb] / [pron] - "
 * 007  MGS		11/15/2004		Changed [ed] : [-noun] and [ing]:[-noun] to [+verb]
 */
#ifndef LSHOMOH
#define LSHOMOH 1


#define MAX_HOMO_RULE 27

struct	homo_rule	{
	S32					h_suffix;
	S32					h_context;
	S32					h_select;
	S32					h_elim;
};

#ifdef OS_PALM
#pragma pcrelconstdata off
#endif

const struct	homo_rule	homo_table[MAX_HOMO_RULE] = {

0x00000080, 0x00000000, 0x00020000, 0x00000000,
0x00000080, 0x00000004, 0x00000001, 0x00000000,
0x00000200, 0x00000000, 0x00020000, 0x00000000,
0x00000200, 0x00000004, 0x00000001, 0x00000000,
0x00000002, 0x00000000, 0x00000001, 0x00000000,
0x00020001, 0x00000000, 0x00000000, 0x00000400,
0x00020400, 0x00000000, 0x00000000, 0x00000001,
0x00000401, 0x00000000, 0x00000000, 0x00020000,
0x00000000, 0x00000020, 0x00000001, 0x00000000,
0x00000000, 0x00100000, 0x00020000, 0x00000000,
0x00000000, 0x00010000, 0x00020000, 0x00000000,
0x00000000, 0x00040000, 0x00000000, 0x00000400,
0x00000000, 0x00000100, 0x00000080, 0x00000000,
0x00000000, 0x00000020, 0x00000080, 0x00000000,
0x00000000, 0x00000010, 0x00000080, 0x00000000,
0x00000000, 0x00000008, 0x00020000, 0x00000000,
0x00000000, 0x00000100, 0x00020000, 0x00000000,
0x00000000, 0x00000020, 0x00020000, 0x00000000,
0x00000000, 0x00000010, 0x00020000, 0x00000000,
0x00000000, 0x00000800, 0x00000400, 0x00000000,
0x00000000, 0x00002000, 0x00020000, 0x00000000,
0x00000000, 0x00001000, 0x00000000, 0x00020000,
0x00000000, 0x00000004, 0x00000000, 0x00020000,
0x00000000, 0x00000004, 0x00000400, 0x00000000,
0x00000000, 0x00000001, 0x00000000, 0x00020000,
0x00000000, 0x00000001, 0x00000400, 0x00000000,
0x00000000, 0x00020000, 0x00000400, 0x00000000
};
#ifdef OS_PALM
#pragma pcrelconstdata on
#endif

#endif
