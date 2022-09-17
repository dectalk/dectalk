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
 *    File Name:	cmd.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    cmd.h ... pipe command code definitions ...
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 001	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 */
#ifndef CMDH
#define CMDH 1

#define	PUNUSED		0x8000		/* This bit is unused		*/
#define	PNEXTRA		0x6000		/* # of extra words (0 - 3)	*/
#define	PFONT		0x1F00		/* Font code (0 - 31)		*/
#define	PVALUE		0x00FF		/* The actual code value	*/

#define	PSNEXTRA	13			/* Shift for "PNEXTRA"		*/
#define	PSFONT		8			/* Shift for "PFONT"		*/

#define	PFASCII		0x00		/* ASCII_G/Multinational	*/
#define	PFCONTROL	0x1F		/* Control font			*/


/*
 * Phoneme definitions for the control set. The definitions include the
 * font bits. They do not include the number of	extra words bits. These are 
 * added by parser when the parameters are parsed.
 */

#define	RATE			((PFCONTROL<<PSFONT)+0)
#define	CPAUSE			((PFCONTROL<<PSFONT)+1)
#define	PPAUSE			((PFCONTROL<<PSFONT)+2)
#define	LAST_VOICE		((PFCONTROL<<PSFONT)+3)
#define	LTS_SYNC		((PFCONTROL<<PSFONT)+4)
#define	NEW_SPEAKER		((PFCONTROL<<PSFONT)+5)
#define	NEW_PARAM		((PFCONTROL<<PSFONT)+6)
#define	SAVE			((PFCONTROL<<PSFONT)+7)
#define	INDEX			((PFCONTROL<<PSFONT)+8)
#define	INDEX_REPLY		((PFCONTROL<<PSFONT)+9)
#define	SYNC			((PFCONTROL<<PSFONT)+10)
#define	BREATH_BREAK	((PFCONTROL<<PSFONT)+11)
#define	KILL_TASK		((PFCONTROL<<PSFONT)+12)
#define	FLUSH_SYNC		((PFCONTROL<<PSFONT)+13)
#define	PITCH_CHANGE	((PFCONTROL<<PSFONT)+14)
#define	LATIN			((PFCONTROL<<PSFONT)+15)
#define	PAPAUSE			((PFCONTROL<<PSFONT)+16)
#define	CNTRLK			((PFCONTROL<<PSFONT)+17)
#define RESET                   ((PFCONTROL<<PSFONT)+18)



/*
 *  commands synchronous to lts have these as a second parameter ...
 */

#define	LTS_MODE_SET			0
#define	LTS_MODE_CLEAR			1
#define	LTS_MODE_ABS			2
#define	LTS_DIC_ALTERNATE		3
#define	LTS_ACNA_NAME			4
#define	LTS_DIC_PRIMARY			5

/*
 *  when we flush, we need to know wether or not to toss the next
 *  few characters out ...
 */

#define	CMD_flush_toss			1
#define	CMD_flush_sync			2
#define	CMD_flush_done			3
#define	CMD_sync_char			0xff
#define	CMD_sync_out			0xfe

/*
 *  voice table indexes ...
 */

#define	PERFECT_PAUL		0
#define	BEAUTIFUL_BETTY		1
#define	HUGE_HARRY			2
#define	FRAIL_FRANK			3
#define	DOCTOR_DENNIS		4
#define	KIT_THE_KID			5
#define	UPPITY_URSULA		6
#define	ROUGH_RITA			7
#define	WHISPERY_WILLY		8
#define	VARIABLE_VAL		9


/*
 * Symbolic names for the parameters of
 * a voice. These are the used in the first extra
 * word of a "NEW_PARAM" phoneme. They index into tables
 * in "klvdef.c" and "klvset.c". Be careful if you change
 * any of them; there are tables that have to be
 * edited. Three new ones on the end.
 */

#define	SP_SEX		0
#define	SP_SM		1
#define	SP_AS		2
#define	SP_AP		3
#define	SP_PR		4
#define	SP_BR		5
#define	SP_RI		6
#define	SP_NF		7
#define	SP_LA		8
#define	SP_HS		9
#define	SP_F4		10
#define	SP_B4		11
#define	SP_F5		12
#define	SP_B5		13
#define	SP_P4		14
#define	SP_P5		15
#define	SP_GF		16
#define	SP_GH		17
#define	SP_GV		18
#define	SP_GN		19
#define	SP_G1		20
#define	SP_G2		21
#define	SP_G3		22
#define	SP_G4		23
#define	SP_LO		24			/* Was "g5".			*/
#define	SP_FT		25          /* kak ... fix this later someday */
#define	SP_FL		25          /* kak ... f0flutter changed */
#define	SP_BF		26
#define	SP_LX		27			/* Was "SP_EF", now gone.	*/
#define	SP_QU		28			/* New				*/
#define	SP_HR		29			/* New				*/
#define	SP_SR		30			/* New				*/

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__)
#define SP_OS           31
#define SP_NM           32
#define SPDEF           33
#endif
#ifdef MSDOS
#define	SPDEF		31
#endif

#endif
