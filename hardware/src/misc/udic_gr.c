/*
 ***********************************************************************
 *
 *                           Copyright ©
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
 *    File Name:        udic_gr_c.c
 *    Author:		Matthew Schnee
 *    Creation Date:02/01/96
 *
 *    Functionality:
 *		**WARNING** Changes in USERDIC.C will impact this file.
 *
 ***********************************************************************
 *    Revision History:
 *
 *  001 01/21/98	MFG 	Added '^' array member to  arpabet[], BATS#561
 *	002	31mar99		tek		remove ptab, it is now in phonlist.h
 *							(for userdic integration)
 *	003	24apr00		NAL		Changes for integrated phoneme set
 * 	004	10/05/2000	MGS		Redhat 6.2 and linux warning removal
 *  005 10/16/00	CAB		Changed copyright info
 *
 */

#ifndef NEW_PHONES
#define GERMAN_USERDIC
#include "l_gr_ph.h"
#endif

/*
 * general defines ...
 */
/*#define DEBUG         1 */

unsigned char	german_arpa[] = {  /* german arpabet */

	'_',	' ',	       /* 0  =  _ */		
	'a',	' ',	       /* 1   =  a */
	'e',	' ',	       /* 2   =  E */
	'a',	'e',	       /* 3   =  V */
	'e',	'x',	       /* 4   =  @ */
	'i',	' ',	       /* 5   =  I */
	'o',	' ',	       /* 6   =  c */
	'o',	'e',	       /* 7   =  Q */
	'u',	' ',	       /* 8   =  U */
	'u',	'e',	       /* 9   =  Y */
	'a',	'h',	       /* 10   = 1 */
	'e',	'h',	       /* 11   = 2 */
	'a',	'z',	       /* 12   = 7 */
	'i',	'h',	       /* 13   = 3 */
	'o',	'h',	       /* 14   = 4 */
	'o',	'z',	       /* 15   = q */
	'u',	'h',	       /* 16   = 5 */
	'u',	'z',	       /* 17   = y */
	'e',	'i',	       /* 18   = A */
	'a',	'u',	       /* 19   = W */
	'e',	'u',	       /* 20   = H */
	'a',	'n',	       /* 21   = 8 */
	'i',	'm',	       /* 22   = ^ */
	'u',	'm',	       /* 23   = 9 */
	'o',	'n',	       /* 24   = % */
	'j',	' ',	       /* 25   = j */
	'l',	' ',	       /* 26   = l */
	'r',	'r',	       /* 27   = r */
	'r',	' ',	       /* 28   = R */
	'h',	' ',	       /* 29   = h */
	'm',	' ',	       /* 30   = m */
	'n',	' ',	       /* 31   = n */
	'n',	'g',	       /* 32   = G */
	'e',	'l',	       /* 33   = L */
	'e',	'm',	       /* 34   = M */
	'e',	'n',	       /* 35   = N */
	'f',	' ',	       /* 36   = f */
	'v',	' ',	       /* 37   = v */
	's',	' ',	       /* 38   = s */
	'z',	' ',	       /* 39   = z */
	's',	'h',	       /* 40   = S */
	'z',	'h',	       /* 41   = Z */
	'c',	'h',	       /* 42   = x */
	'k',	'h',	       /* 43   = X */
	'p',	' ',	       /* 44   = p */
	'b',	' ',	       /* 45   = b */
	't',	' ',	       /* 46   = t */
	'd',	' ',	       /* 47   = d */
	'k',	' ',	       /* 48   = k */
	'g',	' ',	       /* 49   = g */
	'q',	' ',	       /* 50   = | */
	'p',	'f',	       /* 51   = P */
	't',	's',	       /* 52   = T */
	'd',	'j',	       /* 53   = J */
	't',	'j',	       /* 54   = C */
	'k',	's',	       /* 55   = ? */
		   
/* place holders for null range */

	0,	0,	       /* 56  = */
	0,	0,	       /* 57  = */
	0,	0,	       /* 58  = */
	0,	0,	       /* 59  = */

	0,	0,	       /* 60  = */
	0,	0,	       /* 61  = */
	0,	0,	       /* 62  = */
	0,	0,	       /* 63  = */
	0,	0,	       /* 64  = */
	0,	0,	       /* 65  = */
	0,	0,	       /* 66  = */
	0,	0,	       /* 67  = */
	0,	0,	       /* 68  = */
	0,	0,	       /* 69  = */

	0,	0,	       /* 70  = */
	0,	0,	       /* 71  = */
	0,	0,	       /* 72  = */
	0,	0,	       /* 73  = */
	0,	0,	       /* 74  = */
	0,	0,	       /* 75  = */
	0,	0,	       /* 76  = */
	0,	0,	       /* 77  = */
	0,	0,	       /* 78  = */
	0,	0,	       /* 79  = */

	0,	0,	       /* 80  = */
	0,	0,	       /* 81  = */
	0,	0,	       /* 82  = */
	0,	0,	       /* 83  = */
	0,	0,	       /* 84  = */
	0,	0,	       /* 85  = */
	0,	0,	       /* 86  = */
	0,	0,	       /* 87  = */
	0,	0,	       /* 88  = */
	0,	0,	       /* 89  = */

	0,	0,	       /* 90  = */
	0,	0,	       /* 91  = */
	0,	0,	       /* 92  = */
	0,	0,	       /* 93  = */
	0,	0,	       /* 94  = */
	0,	0,	       /* 95  = */
	0,	0,	       /* 96  = */
	0,	0,	       /* 97  = */
	0,	0,	       /* 98  = */
	0,	0,	       /* 99  = */

	'~',	' ',	       /* BLOCK_RULES =  ~ 	*/
	'=',	' ',	       /* S3 =  	 =	*/
	'`',	' ',	       /* S2 = 		 ` 	*/
	'\'',	' ',	       /* S1 =		 ' 	*/
	'\"',	' ',	       /* SEMPH =	 "	*/
	'/',	' ',	       /* HAT_RISE  = 	 /	*/
	'\\',	' ',	       /* HAT_FALL  = 	 \	*/
	'/',	'\\',	       /* HAT_RF  = 	 <	*/
	'-',	' ',	       /* SBOUND  =	 -	 */
	'*',	' ',	       /* MBOUND  = 	 *	*/

	'#',	' ',	       /* HYPHEN  = 	 #	*/
	' ',	' ',	       /* WBOUND  = 	 	*/
	'(',	' ',	       /* PPSTART = 	 (	*/
	')',	' ',	       /* VPSTART = 	 )	*/
	';',	' ',	       /* RELSTART  = 	 ;	*/
	',',	' ',	       /* COMMA  = 	 ,	*/
	'.',	' ',	       /* PERIOD = 	 .	*/
	'?',	' ',	       /* QUEST  = 	 ?	*/
	'!',	' ',	       /* EXCLAIM  = 	 !	*/
	'+',	' ',	       /* NEW_PARAGRAPH = + 	*/
	'^',	' '
};			       



