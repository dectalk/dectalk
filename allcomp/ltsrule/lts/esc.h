/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:	esc.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    character codes, escape value, etc ...
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 001	TEK		12/15/1995		merge dtex
 * 002	MGS		04/02/1996		Added DCS_DEBUG flag
 * 003	GL		08/29/1996		Add DCS_SKIP flag
 * 004  GL		10/29/1996		Add MODE_TABLE
 * 005	GL		11/22/1996		Add DCS_GENDER
 * 006  GL      02/04/1997      Add MODE_EMAIL
 * 007	tek		12nov97			bats404: new DCS codes for new messages
 * 008	gl		03/25/1998		Added DBGV command for debug variable passing
 * 009	mfg		04/24/1998		Added LOG_DBGLOG define for [:log dbglog **] commmand
 * 010	GL		12/17/1998		BATS #846 add say_fletter mode to skip control character 
 * 011	EAB		10/28/99		Modified to support Lookheed-Martin chnages with ifdef SW_VOLUME
 * 012	MGS		07/14/2000		Sapi 5 additions
 * 013	NAL		07/14/2000		Added additional :pron flags for homographs.
 * 014 	CAB		10/16/00		Changed copyright info
 * 015	MGS		02/28/2001		Added Volume attenuator
 * 016  CAB		03/01/2001		Updated copyright info.
 * 017	MGS		02/25/2002		Trial SDK Noise
 * 018	MGS		04/11/2002		ARM7 port
 * 019	MFG		09/19/2002	 	Added support for new chris voice
 */

#ifndef ESCH
#define ESCH 1

#define SOH		(0x01)
#define	STX		(0x02)		/* Start of text		*/
#define	ETX		(0x03)		/* End of text			*/
#define	ENQ		(0x05)		/* enquiry 				*/
#define	BEL		(0x07)		/* Bell					*/
#define	BS		(0x08)		/* Backspace			*/
#define	HT		(0x09)		/* Tab					*/
#define	LF		(0x0A)		/* Line feed			*/
#define	VT		(0x0B)		/* Vertical tab			*/
#define	FF		(0x0C)		/* Form feed			*/
#define	CR		(0x0D)		/* Carriage return		*/
#define	LS1		(0x0E)		/* LS1 (SO)				*/
#define	LS0		(0x0F)		/* LS0 (SI)				*/
#define	SO		(0x0E)		/* LS1 (SO)				*/
#define	SI		(0x0F)		/* LS0 (SI)				*/	
#define DLE		(0x10)		/* datalink escape		*/
#define	XON		(0x11)		/* DC1					*/
#define	XOFF	(0x13)		/* DC3					*/
#define	NAK		(0x15)		/* NAK (^U)				*/
#define	CAN		(0x18)		/* Cancel (^X)			*/
#define	SUB		(0x1A)		/* Substitute			*/
#define	NUL		(0x00)		/* Null code			*/
#define	ESC		(0x1B)		/* Escape				*/
#define	DEL		(0x7F)		/* Delete				*/

#define	SS2		(0x8E)		/* Single shift 2		*/
#define	SS3		(0x8F)		/* Single shift 3		*/
#define	DCS		(0x90)		/* Device control sequence	*/
#define	OLDID	(0x9A)		/* ESC Z				*/
#define	CSI		(0x9B)		/* Control Sequence Introducer	*/
#define	ST		(0x9C)		/* String terminator	*/
#define	OSC		(0x9D)		/* Operating System sequence	*/
#define	PM		(0x9E)		/* Privacy Message		*/
#define	APC		(0x9F)		/* Application Program Control	*/
#define	RDEL	(0xFF)		/* Delete in right side	*/

/*
 *  The p1 and final sequences here are kept for compatability
 *  reasons.  All dcs sequences not bracketed by a p1 of 0 and
 *  ending in z are tossed out.
 */

#define	DCS_F_DECTALK	'z'		/* DECtalk final		*/
#define	P1_DECTALK	0			/* DECtalk param 1		*/

/*
 * The second parameter of a reply
 * indentifies the general flavour of the
 * DCS reply.
 */

#define	R2_IX_REPLY		31			/* Sent after INDEX_REPLY	*/
#define	R2_IX_QUERY		32			/* Sent after INDEX_QUERY	*/
#define	R2_ERROR		300			/* Sent on command error detection */

/*
 * Log flags ... logging immediately changes the output mode 
 */

#define	LOG_TEXT		0x0001		/* Log text input.		*/
#define	LOG_PHONEMES	0x0002		/* Log phonemes to host */
#define	LOG_NAME_TYPES	0x0004		/* Log name types to console */
#define	LOG_FORM_TYPES	0x0008		/* Log name form classes to console */
#define	LOG_SYLLABLES	0x0010		/* Log name syllable structure */
#define	LOG_OUTPHON		0x0020		/* Log phones out  with dur and f0*/
#define LOG_DBGLOG		0x0040		/* Log debug information in file dbglog.txt*/
/*
 * Mode flags.
 */

#define	MODE_MATH		0x0004		/* mathematical pronounciation */
#define	MODE_EUROPE		0x0008		/* Flip "." and "," in numbers	*/
#define	MODE_SPELL		0x0010		/* Spell words			*/
#define	MODE_NAME		0x0040		/* Determine name automatically */
#define	MODE_HOMOGRAPH	0x0080		/* Disambiguate homographs automatically */
#define	MODE_CITATION	0x0100		/* Word citation mode */
#define	MODE_LATIN		0x0200		/* Spanish Latin mode */
#define MODE_SESEO      0x0200      /* Spanish Latin mode */

#ifdef  LATIN_OFF
#define MODE_LATIN          0x0000 
#else
#define MODE_LATIN          0x0200
#endif
#define MODE_TABLE      0x0400      /* table reading mode */

#define MODE_EMAIL        0x1000      /* Email reading mode A */
#define MODE_READING        0x2000      /* Email reading mode A */


/*
 *  say flags.
 */

#define	SAY_CLAUSE		0x0000
#define	SAY_WORD		0x0001
#define	SAY_LETTER		0x0002
#define	SAY_LINE		0x0004
#define	SAY_SYLLABLE	0x0008
#define	SAY_FLETTER		0x0010

/*
 *  pronounce flags ...
 */

#define PRON_DICT_MASK			0x00FB

#define	PRON_DIC_PRIMARY		0x0001
#define	PRON_DIC_ALTERNATE		0x0002
#define	PRON_ACNA_NAME			0x0004
#define PRON_DIC_NOUN			0x0008
#define PRON_DIC_VERB			0x0010
#define PRON_DIC_ADJECTIVE		0x0020
#define PRON_DIC_FUNCTION		0x0040
#define PRON_DIC_INTERJECTION	0x0080


/*
 *  Escape command codes ... each command can be executed as a command or
 *  with an escape sequence.  Each escape sequences are decimal and have a
 *  subcode of zero to ten (if there is one) ...
 */

#define	SKIP_ESCAPE				0x8000			/* codes not escapable */
#define	ESCAPE_CODE				0x7FFF			/* codes that may be */

#define	DCS_RIGHT_BRACKET		0
#define	DCS_RATE				200
#define	DCS_NAME				201
#define	DCS_NAME_PAUL			SKIP_ESCAPE+0
#define	DCS_NAME_BETTY			SKIP_ESCAPE+1
#define	DCS_NAME_HARRY			SKIP_ESCAPE+2
#define	DCS_NAME_FRANK			SKIP_ESCAPE+3
#define	DCS_NAME_DENNIS			SKIP_ESCAPE+4
#define	DCS_NAME_THE_KID		SKIP_ESCAPE+5
#define	DCS_NAME_URSULA			SKIP_ESCAPE+6
#define	DCS_NAME_RITA			SKIP_ESCAPE+7
#define	DCS_NAME_WILLY			SKIP_ESCAPE+8
#define	DCS_NAME_VAL			SKIP_ESCAPE+10
#define	DCS_COMMA				202
#define	DCS_PERIOD				203
#define	DCS_LATIN				SKIP_ESCAPE+11
#define	DCS_NAME_CHRIS			SKIP_ESCAPE+9
#define	DCS_VOLUME_SET			100
#define	DCS_VOLUME_UP			101
#define	DCS_VOLUME_DOWN			102
#ifdef SW_VOLUME //eab 10/6/99 Lockheed Martin Functionality for hardware
#define	DCS_VOLUME_TONE			103 //unused number
#endif      
/* JDB: merged in from Win95 code */      
#ifndef MSDOS

#define     DCS_VOLUME_LSET      103
#define     DCS_VOLUME_LUP       104
#define     DCS_VOLUME_LDOWN     105
#define     DCS_VOLUME_RSET      106
#define     DCS_VOLUME_RUP       107
#define     DCS_VOLUME_RDOWN     108
#define     DCS_VOLUME_SSET      109
#define		DCS_VOLUME_ATT       110
#define	DCS_VOLUME_TONE			111 //unused number
#define     VOLUME_SET           0
#define     VOLUME_UP            1
#define     VOLUME_DOWN          2

#endif
// tek 12nov97 bats404 new index types
// 30may97
// WARNING WARNING WARNING
// these _INDEX_ defines are directly wired together 
// with the command parser definitions, and cm_cmd_mark
// uses this fact!
#define	DCS_INDEX				20
#define	DCS_INDEX_REPLY			21
#define	DCS_INDEX_QUERY			22

//#ifdef _WIN32 // tek these are the new 404 messages
#define DCS_INDEX_PAUSE			23 // really just a placeholder
#define	DCS_INDEX_BOOKMARK		24
#define DCS_INDEX_WORDPOS		25
#define DCS_INDEX_START			26
#define DCS_INDEX_STOP			27
#define DCS_INDEX_SENTENCE		28
#define DCS_INDEX_VOLUME		29 // its not an index, just a cheezy way to get the volume
									// to change in the middle of the clause
#define DCS_INDEX_NOISE			30 // its not an index, just a cheezy way to get the noise on and off
//#endif	//_win32

#define	DCS_ERROR				300
#define	DCS_MODE				80
#define	DCS_LOG					81
#define	DCS_SAY					82
#define	DCS_PHONEME				600
#define	DCS_PUNCT				204
#define	DCS_PAUSE				12
#define	DCS_RESUME				13
#define	DCS_SYNC				11
#define	DCS_FLUSH				10
#define	DCS_ENABLE				14
#define	DCS_DIAL				400
#define	DCS_TONE				401
#define	DCS_TIMEOUT				402
#define	DCS_DEFINE				500
#define	DCS_PRONOUNCE			700
#define	DCS_DIGITIZED			800
#define	DCS_LANGUAGE			900
#define	DCS_REMOVE				1000
#define	DCS_TYPE				1100
#define	DCS_STRESS				1200
#define	DCS_BREAK				1300
#define	DCS_CPU_RATE  			1400
#define	DCS_CODE_PAGE  			1500
#define DCS_DEBUG				0     /* MGS 4/8/1996 */
#define DCS_SKIP                0     /* GL  8/29/1996 */
#define DCS_GENDER              0     /* GL  11/22/1996 */
#ifdef DBGV_ON
#define DCS_DBGV                0     /* GL  03/25/1998 */
#endif
/*
 *  output type codes ...
 */

#define	TEXT_OUTPUT				0
#define	ESCAPE_OUTPUT			1
#define	SPC_INDEX_PAUSE			2

#endif
