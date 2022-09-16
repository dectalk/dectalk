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
 *    File Name:        udic_uk_c.c
 *    Author:           Ginger Lin
 *    Creation Date:10/28/97
 *
 *    Functionality:
 *		**WARNING** Changes in USERDIC.C will impact this file.
 *
 ***********************************************************************
 *    Revision History:
 *	001	31mar99		tek		remove ptab, it is now in phonlist.h
 *							(for userdic integration)
 *	002	24apr00		NAL		Changes for integrated phoneme set
 * 	003	10/05/2000	MGS		Redhat 6.2 and linux warning removal
 *  004 10/16/00	CAB		Changed copyright info
 *
 */
#ifndef NEW_PHONES
#define BRITISH_USERDIC
#include "l_uk_ph.h"
#endif

/*
 * general defines ...
 */

/*#define DEBUG 	1 */



unsigned char   uk_arpa[] = {  /* british arpabet */  
	'_',	' ',
	'i',	'y',
	'i',	'h',
	'e',	'y',
	'e',	'h',
	'a',	'e',
	'a',	'a',
	'a',	'y',
	'a',	'w',
	'a',	'h',
	'a',	'o',
	'o',	'w',
	'o',	'y',
	'u',	'h',
	'u',	'w',
	'r',	'r',
	'y',	'u',
	'a',	'x',
	'i',	'x',
	'i',	'r',
	'e',	'r',
	'a',	'r',
	'o',	'r',
	'u',	'r',
	'w',	' ',
	'y',	'x',
	'r',	' ',
	'l',	' ',
	'h',	'x',
	'o',	'h',
	'l',	'x',
	'm',	' ',
	'n',	' ',
	'n',	'x',
	'e',	'l',
	'd',	'z',			/* Dentalized "d".		*/
	'e',	'n',
	'f',	' ',
	'v',	' ',
	't',	'h',
	'd',	'h',
	's',	' ',
	'z',	' ',
	's',	'h',
	'z',	'h',
	'p',	' ',
	'b',	' ',
	't',	' ',
	'd',	' ',
	'k',	' ',
	'g',	' ',
	'y',	'r',
	't',	'x',
	'q',	' ',
	'c',	'h',
	'j',	'h',
	'd',	'f',
/* place holders for null range */

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
	0,	0,   	   /* 95  = */
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



