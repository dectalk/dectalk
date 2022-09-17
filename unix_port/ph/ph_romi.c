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
 *    File Name:    ph_romi.c
 *    Author:       Matthew Schnee
 *    Creation Date:06-Jun-1996
 *
 *    Functionality:
 *  	PH tables for phomemes
 *
 ***********************************************************************
 *    Revision History:
 *	Rev	Who		Date		Description
 *	---	-----	-----------	--------------------------------------------
 *	001	MGS		06/06/1996	Initial creation
 *  002	GL		04/21/1997	BATS#360  remove spaces before "#define" or "#if" 
 * 0003 DR		09/30/1997		UK BUILD: added UK STUFF
 *  004 EAB		01/16/98    Moved language independent parameters to common file
							Needed for Bats 577
 *							This is needed for phedit when complete no ifdef will be needed
							as all versions will share these common files. Cosine  values are the same
							for all languages. 
 */

/* Arrays used by the phonetic component                  */

#include "ph_def.h"            
#ifdef ENGLISH_US
#include "p_us_rom.c"
#endif
#ifdef ENGLISH_UK
#include "p_uk_rom.c"
#endif
#ifdef SPANISH
#include "p_sp_rom.c"
#endif
#ifdef GERMAN
#include "p_gr_rom.c"
#endif
/*							This is needed for phedit when complete no ifdef will be needed
		3/20/98 expanded to include german..*/

#if  (defined ENGLISH_UK ) ||  (defined GERMAN )

short                   getcosine[64] =
{
	164, 163, 161, 158, 154, 148, 141, 132,
	123, 112, 100, 86, 72, 56, 38, 20,
	0, -20, -38, -56, -72, -86, -100, -112,
	-123, -132, -141, -148, -154, -158, -161, -163,
	-164, -163, -161, -158, -154, -148, -141, -132,
	-123, -112, -100, -86, -72, -56, -38, -20,
	0, 20, 38, 56, 72, 86, 100, 112,
	123, 132, 141, 148, 154, 158, 161, 163,
};

/* Linearize the TILT variable */
/* E.g. if you request 3 dB of tilt, must send 12 to chip to get 3 */

short                   lineartilt[32] =
{
	0, 6, 8, 12, 15, 17, 19, 21, 23, 25,
	26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
	35, 36, 36, 37, 37, 38, 38, 39, 39, 39,
	40, 40
};

/* Notes in F0*10 from C2 to C5 */

short                   notetab[] =
{
	640,							   /* 1 = C2              */
	678,							   /* 2 = C#              */
	718,							   /* 3 = D               */
	761,							   /* 4 = D#              */
	806,							   /* 5 = E    B                  (HARRY)         */
	854,							   /* 6 = F    A          */
	905,							   /* 7 = F#   S          */
	959,							   /* 8 = G    S B                (PAUL)          */
	1016,							   /* 9 = G#   | A        */
	1076,							   /* 10 = A    | R        */
	1140,							   /* 11 = A#   | A        */
	1208,							   /* 12 = B    | T        */
	1280,							   /* 13 = C3   | O T              (FRANK)         */
	1356,							   /* 14 = C#   | N E      */
	1437,							   /* 15 = D    | E N      */
	1522,							   /* 16 = D#   | | O      */
	1613,							   /* 17 = E    | | R      */
	1709,							   /* 18 = F    | | | A            (BETTY)         */
	1810,							   /* 19 = F#   | | | L    */
	1918,							   /* 20 = G    | | | T    */
	2032,							   /* 21 = G#   | | | O    */
	2152,							   /* 22 = A    | | | |    */
	2280,							   /* 23 = A#   | | | |    */
	2416,							   /* 24 = B    | | | | S          (URSULA or KIT) */
	2560,							   /* 25 = C4   | B | | O  */
	2712,							   /* 26 = C#   B A | | P  */
	2874,							   /* 27 = D    A R | | R  */
	3044,							   /* 28 = D#   A A | | A  */
	3226,							   /* 29 = E    S T | | N  */
	3418,							   /* 30 = F      O | | O  */
	3620,							   /* 31 = F#     N | | |  */
	3836,							   /* 32 = G      E T | |  */
	4064,							   /* 33 = G#       E | |  */
	4304,							   /* 34 = A        N | |  */
	4560,							   /* 35 = A#       O | |  */
	4832,							   /* 36 = B        R | |  */
	5120							   /* 37 = C5         | |  */
};
/* Switch to set target to const, taram[ptram], or flocu[plocu] */

char                    partyp[] =
{
	  /* F1   F2   F3   FZ   B1   B2   B3   AV              */
	3, 3, 3, 1, 4, 4, 4, 0,
	  /* AP   A2   A3   A4   A5   A6   AB   TILT            */
	0, 2, 2, 2, 2, 2, 2, 2
};

/* Table to permit use of mulsh() for division by 1 to 20 */

short                   divtab[] =
{
	16384, 16384, 8192, 5461, 4096,
	3276, 2730, 2340, 2048, 1820,
	1638, 1489, 1365, 1260, 1170,
	1092, 1024, 964, 910, 862,
	819, 780, 745, 712, 682,
	655, 630, 607, 585, 565,
	546, 528, 512, 496, 482,
	468, 455, 443, 431, 420,
	409, 399, 390, 381, 372,
	364, 356, 349, 341, 334
};
/* Initial values for parameters */

short                   parini[] =
{
	  /* F1   F2   F3   FZ   B1   B2   B3   AV              */
	600, 1600, 2600, 300, 50, 150, 250, 0,
	  /* AP   A2   A3   A4   A5   A6   AB   TILT            */
	0, 0, 0, 0, 0, 0, 0, 0
};

/* Feature value bits for each boundary symbol in input */

short                   bounftab[] =
{
	FSYBNEXT,						   /* SBOUND       */
	FMBNEXT,						   /* MBOUND       */
	FMBNEXT,						   /* HYPHEN       */
	FWBNEXT,						   /* WBOUND       */
	FPPNEXT,						   /* PPSTART      */
	FVPNEXT,						   /* VPSTART      */
	FRELNEXT,						   /* RELSTART     */
	FCBNEXT,						   /* COMMA        */
	FPERNEXT,						   /* PERIOD       */
	FQUENEXT,						   /* QUEST        */
	FEXCLNEXT						   /* EXCLAIM      */
};






#endif /*ENGLISH_UK*/
