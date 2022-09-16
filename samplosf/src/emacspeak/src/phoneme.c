/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	12	05/14/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	05/14/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	05/14/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	05/14/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	05/14/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	05/14/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	05/14/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	05/14/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	05/14/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	05/14/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	05/14/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	05/14/97	leeber	Initial Version
$
 * Revision 1.1.2.2  1995/11/14  21:35:07  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 * 	[1995/11/14  21:33:41  Krishna_Mangipudi]
 *
 * $EndLog$
 */
#include "phoneme.h"

char *spnames[]={
	"PAUL",
	"BETTY",
	"HARRY",
	"FRANK",
	"DENNIS",
	"KIT",
	"URSULA",
	"RITA",
	"WENDY"
};

struct ph_table_t  eng_ph_table[]={  
{  " ",		" ",	""},	/* SIL */
{  "i",		"iy",	"beet"},	/* IY */
{  "I",		"ih",	"bit"},		/* IH */
{  "e",		"ey",	"bait"},	/* EY */
{  "E",		"eh",	"bet"},		/* EH */
{  "@",		"ae",	"bat"},		/* AE */
{  "a",		"aa",	"bob"},		/* AA */
{  "A",		"ay",	"buy"},		/* AY */
{  "W",		"aw",	"bout"},	/* AW */
{  "^",		"ah",	"but"},		/* AH */
{  "c",		"ao",	"bought"},	/* AO */
{  "o",		"ow",	"boat"},	/* OW */
{  "O",		"oy",	"boy"},		/* OY */
{  "U",		"uh",	"put"},		/* UH */
{  "u",		"uw",	"view"},	/* UW */
{  "R",		"rr",	"burr"},	/* RR */
{  "Y",		"yu",	""},		/* YU */
{  "x",		"ax",	"a"},		/* AX */
{  "|",		"ix",	""},		/* IX */
{  "[ir]",	"ir",	"beer"},	/* IR */
{  "[er]",	"er",	"bear"},	/* ER */
{  "[ar]",	"ar",	"bar"},		/* AR */
{  "[or]",	"or",	"boar"},	/* OR */
{  "[ur]",	"ur",	""},		/* UR */
{  "w",		"w",	"way"},		/* W */
{  "y",		"y",	"yell"},	/* Y */
{  "r",		"r",	"rag"},		/* R */
{  "l",		"ll",	"clue"},	/* LL */
{  "h",		"hx",	"hat"},		/* HX */
{  "[rx]",	"rx",	""},		/* RX */
{  "[lx]",	"lx",	""},		/* LX */
{  "m",		"m",	""},		/* M */
{  "n",		"n",	""},		/* N */
{  "G",		"nx",	""},		/* NX */
{  "L",		"el",	""},		/* EL */
{  "[D_D]",	"d",	""},		/* D_DENTALIZED */
{  "N",		"en",	""},		/* EN */
{  "f",		"f",	""},		/* F */
{  "v",		"v",	""},		/* V */
{  "T",		"th",	""},		/* TH */
{  "D",		"dh",	""},		/* DH */
{  "s",		"s",	""},		/* S */
{  "z",		"z",	""},		/* Z */
{  "S",		"sh",	""},		/* SH */
{  "Z",		"zh",	""},		/* ZH */
{  "p",		"p",	""},		/* P */
{  "b",		"b",	""},		/* B */
{  "t",		"t",	""},		/* T */
{  "d",		"d",	""},		/* D */
{  "k",		"k",	""},		/* K */
{  "g",		"g",	""},		/* G */
{  "&",		"dx",	""},		/* DX */
{  "Q",		"tx",	""},		/* TX */
{  "q",		"q",	""},		/* Q */
{  "C",		"ch",	""},		/* CH */
{  "J",		"jh",	""},		/* JH */
{  "~",		"block_rules",	""},	/* BLOCK_RULES */
{  "`",	"s2",	""},		/* S2 */
{  "\'",	"s1",	""},		/* S1 */
{  "\"",	"semph",	""},		/* SEMPH */
{  "?",		"hat_rise",	""},	/* HAT_RISE */
{  "?",		"hat_fall",	""},	/* HAT_FALL */
{  "?",		"hat_rf",	""},	/* HAT_RF */
{  "=",		"sbound",	""},	/* SBOUND */
{  "+",		"mbound",	""},	/* MBOUND */
{  "-",		"hyphen",	""},	/* HYPHEN */
{  " ",		"wbound",	""},	/* WBOUND */
{  "(",		"ppstart",	""},	/* PPSTART */
{  ")",		"vpstart",	""},	/* VPSTART */
{  "?",		"relstart",	""},	/* RELSTART */
{  ", ",	"comma",	""},	/* COMMA */
{  ". ",	"period",	""},	/* PERIOD */
{  "? ",	"quest",	""},	/* QUEST */
{  "! ",	"exclaim",	""},	/* EXCLAIM */
{  " ",		"new_paragraph",	""}	/* NEW_PARAGRAPH */
};

int sz_eng_ph_table=sizeof(eng_ph_table)/sizeof(eng_ph_table[0]);
