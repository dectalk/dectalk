/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved. 
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
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
 * 001 GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 * 002 MGS		10/17/1997		Add WORD_CLASS definition 
 * 002 tek		11/13/1997		bats404: new index control codes (causes
 *								WORD_CLASS to change..)
 * 003 JAW		04/27/1998		Added definition for SPD_GS.
 * 004 ETT		10/05/1998		Added Linux code.
 * 005 EAB		04/07/1999		Modified SP_ for universal phonemes
 * 006 MGS		07/14/2000		Sapi 5 additions
 * 007 NAL		07/14/2000		Added additional :pron flags for homographs.
 * 008 CAB		10/16/2000		Changed copyright info
 * 009 MGS		02/28/2001		Merged in base changes needed for ACCESS32 merge
 * 010 CAB		03/01/2001		Updated copyright info
 * 011 MGS		05/09/2001		Some VxWorks porting BATS#972
 * 012 MGS		06/19/2001		Solaris Port BATS#972
 * 013 MGS		02/25/2002		Trail SDK Noise
 * 014 MGS		04/11/2002		ARM7 port
 * 015 CAB		05/02/2002		Removed redunant code
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
//#ifdef _WIN32 // tek 01aug97 bats 404 new index control codes
// WARNING: these are also in cm_defs.h!
#define	INDEX_BOOKMARK	((PFCONTROL<<PSFONT)+19)
#define	INDEX_WORDPOS	((PFCONTROL<<PSFONT)+20)
#define	INDEX_START		((PFCONTROL<<PSFONT)+21)
#define	INDEX_STOP		((PFCONTROL<<PSFONT)+22)
#define	INDEX_SENTENCE	((PFCONTROL<<PSFONT)+24)
#define	INDEX_VOLUME	((PFCONTROL<<PSFONT)+25)
#define	INDEX_NOISE		((PFCONTROL<<PSFONT)+26)
#define	INDEX_REPLACE_START		((PFCONTROL<<PSFONT)+28)
#define	INDEX_REPLACE_END		((PFCONTROL<<PSFONT)+29)
//#endif //_WIN32
#define WORD_CLASS		((PFCONTROL<<PSFONT)+23)
#define PREAMBLE		((PFCONTROL<<PSFONT)+27)

/*
 *  commands synchronous to lts have these as a second parameter ...
 */

#define LTS_MODE_SET			0
#define LTS_MODE_CLEAR			1
#define LTS_MODE_ABS			2
#define LTS_DIC_ALTERNATE		3
#define LTS_ACNA_NAME			4
#define LTS_DIC_PRIMARY			5
#define LTS_DIC_NOUN			6
#define LTS_DIC_VERB			7
#define LTS_DIC_ADJECTIVE		8
#define LTS_DIC_FUNCTION		9
#define LTS_DIC_INTERJECTION	10

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

/* CAB Removed redundant code
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
*/

/*
 * Symbolic names for the parameters of
 * a voice. These are the used in the first extra
 * word of a "NEW_PARAM" phoneme. They index into tables
 * in "klvdef.c" and "klvset.c". Be careful if you change
 * any of them; there are tables that have to be
 * edited. Three new ones on the end.
 */

#define	SPD_SEX		 0
#define	SPD_SM		 1
#define	SPD_AS		 2
#define	SPD_AP		 3
#define	SPD_PR		 4
#define	SPD_BR		 5
#define	SPD_RI		 6
#define	SPD_NF		 7
#define	SPD_LA		 8
#define	SPD_HS		 9
#define	SPD_F4		10
#define	SPD_B4		11
#define	SPD_F5		12
#define	SPD_B5		13
#define	SPD_P4		14
#define	SPD_P5		15
#define	SPD_GF		16
#define	SPD_GH		17
#define	SPD_GV		18
#define	SPD_GN		19
#define	SPD_G1		20
#define	SPD_G2		21
#define	SPD_G3		22
#define	SPD_G4		23
#define	SPD_LO		24			/* Was "g5".			*/
#define	SPD_FT		25          /* kak ... fix this later someday */
#define	SPD_FL		25          /* kak ... f0flutter changed */
#define	SPD_BF		26
#define	SPD_LX		27			/* Was "SPD_EF", now gone.	*/
#define	SPD_QU		28			/* New				*/
#define	SPD_HR		29			/* New				*/
#define	SPD_SR		30			/* New				*/
#define SPD_AGO		31          /* avg glottal opening */
#define SPD_AGVO	32          /* for a voiced obs */
#define SPD_AGUO	33          /* unvoiced onbstr */
#define SPD_UNVOW	34
#define SPD_CHINK	35
#define SPD_OQ  	36
#define SPD_GP		37
#define SPD_GZ		38
#define SPD_NEW2	39
#define SPD_NEW3	40
#define SPD_NEW4	41
#define SPD_NEW5	42
#define SPD_NEW6	43
#define SPD_NEW7 	44
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined _UNIX_LIKE_ ||  defined ARM7
#define SPD_OS		38	
#define SPD_NM		39
#define SPDEF		50
#endif

#ifdef MSDOS
#define	SPDEF		32
#endif

#endif /* CMDH */
