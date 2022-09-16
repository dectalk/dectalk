/*
 ***********************************************************************
 *
 *                           Copyright (c)
 *	  Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996,1999. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:        udic_sp_c.c
 *    Author:		Matthew Schnee
 *    Creation Date:02/01/96
 *
 *    Functionality:
 *		**WARNING** Changes in USERDIC.C will impact this file.
 *
 ***********************************************************************
 *    Revision History:
 *
 *  001 01/21/98	MFG Added '^' array member to  arpabet[], BATS#561
 *	002	31mar99		tek		remove ptab, it is now in phonlist.h
 *							(for userdic integration)
 *	003	24apr00		NAL		Changes for integrated phoneme set
 *  004	10/05/2000	MGS		Redhat 6.2 and linux warning removal
 *  005 10/16/00	CAB		Changed copyright info
 */
#ifndef NEW_PHONES

#define SPANISH_USERDIC
#include "l_sp_ph.h"
#endif

/*
 * general defines ...
 */

/*#define DEBUG 	1 */


          
unsigned char   spanish_arpa[] = {  /* spanish arpabet */  

	'_',    ' ',           /* 0  =  _ */            
	'a',    ' ',           /* 1  =  a */
	'e',    ' ',           /* 2  =  e */
	'i',    ' ',           /* 3  =  i */
	'o',    ' ',           /* 4  =  o */
	'u',    ' ',           /* 5  =  u */
	'w',    'x',           /* 6  =  W */
	'y',    'x',           /* 7  =  Y */
	'r',    'r',           /* 8  =  R */
	'l',    ' ',           /* 9  =  l */

	'l',    'l',           /* 10  =  L */
	'm',    ' ',           /* 11  =  m */
	'n',    ' ',           /* 12  =  n */
	'n',    'h',           /* 13  =  1 */
	'f',    ' ',           /* 14  =  f */
	's',    ' ',           /* 15  =  s */
	'j',    ' ',           /* 16  =  j */
	't',    'h',           /* 17  =  T */
	'b',    'h',           /* 18  =  B */
	'd',    'h',           /* 19  =  D */

	'g',    'h',           /* 20  = G */
	'y',    'h',           /* 21  = 2 */
	'p',    ' ',           /* 22  = p */
	'b',    ' ',           /* 23  = b */
	't',    ' ',           /* 24  = t */
	'd',    ' ',           /* 25  = d */
	'k',    ' ',           /* 26  = k */
	'g',    ' ',           /* 27  = g */
	'c',    'h',           /* 28  = C */
	'y',    ' ',           /* 29  = y */

	'r',    ' ',           /* 30  = r */
	'q',    ' ',           /* 31  = q */
	'z',    ' ',           /* 32  = z */
	'w',    ' ',           /* 33  = w */
	'n',    'x',           /* 34  = N */
	'v',    ' ',           /* 35  = v */
	'i',    'x',           /* 36  = I */
	'm',    'x',           /* 37  = M */
	'p',    'h',           /* 38  = P */
	0,      0,             /* 39  = */

	0,      0,             /* 40  = */
	0,      0,             /* 41  = */
	0,      0,             /* 42  = */
	0,      0,             /* 43  = */
	0,      0,             /* 44  = */
	0,      0,             /* 45  = */
	0,      0,             /* 46  = */
	0,      0,             /* 47  = */
	0,      0,             /* 48  = */
	0,      0,             /* 49  = */

	0,      0,             /* 50  = */
	0,      0,             /* 51  = */
	0,      0,             /* 52  = */
	0,      0,             /* 53  = */
	0,      0,             /* 54  = */
	0,      0,             /* 55  = */
	0,      0,             /* 56  = */
	0,      0,             /* 57  = */
	0,      0,             /* 58  = */
	0,      0,             /* 59  = */

	0,      0,             /* 60  = */
	0,      0,             /* 61  = */
	0,      0,             /* 62  = */
	0,      0,             /* 63  = */
	0,      0,             /* 64  = */
	0,      0,             /* 65  = */
	0,      0,             /* 66  = */
	0,      0,             /* 67  = */
	0,      0,             /* 68  = */
	0,      0,             /* 69  = */

	0,      0,             /* 70  = */
	0,      0,             /* 71  = */
	0,      0,             /* 72  = */
	0,      0,             /* 73  = */
	0,      0,             /* 74  = */
	0,      0,             /* 75  = */
	0,      0,             /* 76  = */
	0,      0,             /* 77  = */
	0,      0,             /* 78  = */
	0,      0,             /* 79  = */

	0,      0,             /* 80  = */
	0,      0,             /* 81  = */
	0,      0,             /* 82  = */
	0,      0,             /* 83  = */
	0,      0,             /* 84  = */
	0,      0,             /* 85  = */
	0,      0,             /* 86  = */
	0,      0,             /* 87  = */
	0,      0,             /* 88  = */
	0,      0,             /* 89  = */

	0,      0,             /* 90  = */
	0,      0,             /* 91  = */
	0,      0,             /* 92  = */
	0,      0,             /* 93  = */
	0,      0,             /* 94  = */
	0,      0,             /* 95  = */
	0,      0,             /* 96  = */
	0,      0,             /* 97  = */
	0,      0,             /* 98  = */
	0,      0,             /* 99  = */


	'~',    ' ',           /* BLOCK_RULES =  ~      */
	'=',    ' ',           /* S3 =           =      */
	'`',    ' ',           /* S2 =           `      */
	'\'',   ' ',           /* S1 =           '      */
	'\"',	' ',	       /* SEMPH =	 " */
	'/',    ' ',           /* HAT_RISE  =    /      */
	'\\',   ' ',           /* HAT_FALL  =    \      */
	'/',    '\\',          /* HAT_RF  =      <      */
	'-',    ' ',           /* SBOUND  =      -       */
	'*',    ' ',           /* MBOUND  =      *      */

	'#',    ' ',           /* HYPHEN  =      #      */
	' ',    ' ',           /* WBOUND  =             */
	'(',    ' ',           /* PPSTART =      (      */
	')',    ' ',           /* VPSTART =      )      */
	';',    ' ',           /* RELSTART  =    ;      */
	',',    ' ',           /* COMMA  =       ,      */
	'.',    ' ',           /* PERIOD =       .      */
	'?',    ' ',           /* QUEST  =       ?      */
	'!',    ' ',           /* EXCLAIM  =     !      */
	'+',    ' ',           /* NEW_PARAGRAPH = +     */
	'^',	' '
};                             


