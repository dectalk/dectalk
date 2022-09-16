/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996,1999. All rights reserved.
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
 *    File Name:        udic_us.c
 *
 ***********************************************************************
 *    Revision History:
 *		31mar99		tek		This is now the US-specific stuff; the common
 *							code has been moved to udic_com.c
 */

#ifdef _DEBUG
#pragma message("udic_us.c")
#endif /*_DEBUG*/

#include "l_us_ph.h"

unsigned char	arpabet[] = {
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
	'r',	'x',
	'l',	'x',
	'm',	' ',
	'n',	' ',
	'n',	'x',
	'e',	'l',
	'd',	'z',			/* Dentalized "d" eab changed frm d to dz 3/25/97*/
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
	'd',	'x',
	't',	'x',
	'q',	' ',
	'c',	'h',
	'j',	'h',
	'd',    'f',			/*eab changed frm fx to df 3/25/97 */
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	 0,	 0,
	'~',	' ',
	'=', ' ',  /* tek 11feb99 correct syntax. */
	'`',	' ',
	'\'',	' ',
	'\"',	' ',
	'/',	' ',
	'\\',	' ',
	'/',	'\\',
	'-',	' ',
	'*',	' ',
	'#',	' ',
	' ',	' ',
	'(',	' ',
	')',	' ',
	' ',	' ',
	',',	' ',
	'.',	' ',
	'?',	' ',
	'!',	' ',
	'+',	' ',
	'^',	' '

};
