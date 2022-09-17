/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997 All rights reserved.
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
 *    File Name:	l_sp_con.c
 *    Author:		JDB                                         
 *    Creation Date:05/29/96                                                   
 *                                                                             
 *    Functionality:        
 *    DECtalk p3 and beyond ... constant tabular data is collected here
 *    just to make dealing with it a bit easier ...
 *    This file contains a number
 *	  of canned phoneme strings. These are
 * 	  used by the number rules, etc.
 *    All are streams of bytes with a SI
 *    phoneme on the end.                                                                   
 ***********************************************************************       
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	-----------		---------------------------------------
 *  01 	DGC		04/05/1985 		Changed [s] to [z] in "thousand".
 *  02 	DGC		04/08/1985 		Added "pdegree".
 *  03 	DGC		04/24/1985 		Fix some phomenes to agree with some
 *								dictionary changes.
 *  04 	DGC		06/14/1985 		The "pplus" array isn't needed anymore.
 *  05 	DGC		06/27/1985	 	Remove last [d] from "thousand".
 *  06 	DGC		07/24/1985		[f'owr] to [f'or] and related forms.
 *  07 	DGC		08/20/1985 		Undid 05; sounded bad.
 *  08  GL		07/29/1996		remove feats[] and pfeats[] two unused table.
 *  09  GL		11/01/1996		Fix the number system.
 *  10	GL		11/14/1996		Add p1_un[] and up1_un[]
 *  11	GL		02/10/1997		Bug fix for BATS#284.add NULL at the end of months[]
 *  12	MFG		06/17/1998		Copied from l_la_con.c
 *  13	GL		08/18/1998		Bug fix for BATS#745.  use S1 for all number.
 *  14  EAB		9/24/98			Improving numbers there are a lot of different problems ranging from 
 *						        stress changes to word bundary and syl boundary issues,
 *  15	GL.Juan	10/02/1998		add number abbreviation
 *  16	GL/Juan	10/12/1998		set "1" defaulted to "un" for all case.
 *                              use pre-process to translate "1" to "uno" or "una"
 *  17	GL.Juan	10/14/1998		add more number abbreviation
 *  18	GL		11/03/1998		BATS#783 add p1_uno[] for two digits number in date, time
 *  19	GL.Juan	11/04/1998		BATS#786 fix error in sdic[], spwhword[]
 *  20	GL.Juan	11/06/1998		BATS#721 add entry for nwdtab[]
 *  21	GL.Juan	11/06/1998		add more new entry for number abbrv.
 *  22	GL.Juan	11/12/1998		remove SBOUND from ponehundred[]
 *  23	MGS		04/13/2000		Changes for integrated phoneme set 
 *  24	CAB		09/21/2000		Fixed copyright info
 *	25	CAB		04/24/2002		Fixed by adding const per ls_cons.h
 *								
 */
#include        "tts.h"    /* For the declarartion of LPTTS_HANDLE_T */
#ifdef WIN32
#include <windows.h>
#endif

#if !defined OS_PALM && !defined CASIO_SH3
#include <stdio.h>
#endif
#include <string.h>

#include "port.h"  
#include "kernel.h"
#include "ls_char.h"
#include "ls_dict.h"
#include "ls_defs.h"
#include "ls_data.h"
#include "ph_def.h"

#include "ls_prot.h"

#ifdef ACNA
#include "ls_acna.h"
#include "l_ac_con.c"
#endif


const unsigned char ptt2tp[] = {
      0
};
  
/*
 * This rather large table is
 * used to obtain the attributes of characters
 * in the ASCII_G and DEC multinational character
 * set. It is indexed by character code, with ASCII_G
 * in GL, ASCII_C in C0, the DEC multinational set
 * in GR, and the supplimental control set in C1.
 * The major client of this table is the word
 * reading stuff.
 */ 

const U16 lsctype[] = {
	IGNORE,                         /* NUL                          */
	IGNORE,                         /* SOH                          */
	IGNORE,                         /* STX                          */
	IGNORE,                         /* ETX                          */
	IGNORE,                         /* EOT                          */
	IGNORE,                         /* ENQ                          */
	IGNORE,                         /* ACK                          */
	IGNORE,                         /* BEL  (Could be a word)       */
	BACKUP,                         /* BS                           */
	NEVER,                          /* HT                           */
	NEVER,                          /* LF                           */
	NEVER,                          /* VT                           */
	NEVER,                          /* FF                           */
	NEVER,                          /* CR                           */
	IGNORE,                         /* SO                           */
	IGNORE,                         /* SI                           */

	IGNORE,                         /* DLE                          */
	IGNORE,                         /* DC1                          */
	IGNORE,                         /* DC2                          */
	IGNORE,                         /* DC3                          */
	IGNORE,                         /* DC4                          */
	IGNORE,                         /* NAK                          */
	IGNORE,                         /* SYN                          */
	IGNORE,                         /* ETB                          */
	IGNORE,                         /* CAN                          */
	IGNORE,                         /* EM                           */
	IGNORE,                         /* SUB  (Is this right?)        */
	IGNORE,                         /* ESC                          */
	IGNORE,                         /* FS                           */
	IGNORE,                         /* GS                           */
	IGNORE,                         /* RS                           */
	IGNORE,                         /* US                           */

	NEVER,                          /* SP                           */
	MIGHT+PR,     					/* !                            */
	ALWAYS+LS+RS+PR,     			/* "							*/
	ALWAYS+PR,     					/* #                            */
	ALWAYS+PR,     					/* $                            */
	ALWAYS+PR,     					/* %                            */
	ALWAYS +PR,     				/* &                            */
	ALWAYS+PR,     					/* '                            */
	ALWAYS+LS+FB+PR,     			/* (                            */
	ALWAYS+RS+FB+PR,     			/* )                            */
	ALWAYS+PR,     					/* *                            */
	ALWAYS+PR,     					/* +                            */
	MIGHT+PR,     					/* ,                            */
	ALWAYS+PR,     					/* -                            */
	MIGHT+PR,     					/* .                            */
	ALWAYS+PR,     					/* /                            */

	ALWAYS+PR,     					/* 0                            */
	ALWAYS+PR,     					/* 1                            */
	ALWAYS+PR,     					/* 2                            */
	ALWAYS+PR,     					/* 3                            */
	ALWAYS+PR,    	 				/* 4                            */
	ALWAYS+PR,     					/* 5                            */
	ALWAYS+PR,     					/* 6                            */
	ALWAYS+PR,     					/* 7                            */
	ALWAYS+PR,     					/* 8                            */
	ALWAYS+PR,     					/* 9                            */
	MIGHT+PR,     					/* :                            */
	MIGHT+PR,     					/* ;                            */
	ALWAYS+LS+FB+PR,     			/* <                            */
	ALWAYS+PR,     					/* =                            */
	ALWAYS+RS+FB+PR,     			/* >                            */
	MIGHT+PR,     					/* ?                            */

	ALWAYS+PR,     					/* @                            */
	ALWAYS+UU+L+OO+PR,    			/* A                            */
	ALWAYS+UU+L+C+PR,    			/* B                            */
	ALWAYS+UU+L+C+PR,    			/* C                            */
	ALWAYS+UU+L+C+PR,    			/* D                            */
	ALWAYS+UU+L+OO+PR,   			/* E                            */
	ALWAYS+UU+L+C+PR,    			/* F                            */
	ALWAYS+UU+L+C+PR,    			/* G                            */
	ALWAYS+UU+L+C+PR,    			/* H                            */
	ALWAYS+UU+L+OO+PR,   			/* I                            */
	ALWAYS+UU+L+C+PR,    			/* J                            */
	ALWAYS+UU+L+C+PR,    			/* K                            */
	ALWAYS+UU+L+C+PR,    			/* L                            */
	ALWAYS+UU+L+C+PR,    			/* M                            */
	ALWAYS+UU+L+C+PR,    			/* N                            */
	ALWAYS+UU+L+OO+PR,   			/* O                            */

	ALWAYS+UU+L+C+PR,    			/* P                            */
	ALWAYS+UU+L+C+PR,    			/* Q                            */
	ALWAYS+UU+L+C+PR,    			/* R                            */
	ALWAYS+UU+L+C+PR,    			/* S                            */
	ALWAYS+UU+L+C+PR,    			/* T                            */
	ALWAYS+UU+L+OO+PR,   			/* U                            */
	ALWAYS+UU+L+C+PR,    			/* V                            */
	ALWAYS+UU+L+C+PR,    			/* W                            */
	ALWAYS+UU+L+C+PR,    			/* X                            */
	ALWAYS+UU+L+PR,    				/* Y (-V, -C)                   */
	ALWAYS+UU+L+C+PR,    			/* Z                            */
	ALWAYS+LS+FB+PR,     			/* [                            */
	ALWAYS+PR,     					/* \                            */
	ALWAYS+RS+FB+PR,     			/* ]                            */
	ALWAYS+PR,     					/* ^                            */
	ALWAYS+II+PR,    				/* _                            */

	ALWAYS+PR,     					/* `                            */
	ALWAYS+LC+L+OO+PR,    			/* a                            */
	ALWAYS+LC+L+C+PR,     			/* b                            */
	ALWAYS+LC+L+C+PR,     			/* c                            */
	ALWAYS+LC+L+C+PR,     			/* d                            */
	ALWAYS+LC+L+OO+PR,    			/* e                            */
	ALWAYS+LC+L+C+PR,     			/* f                            */
	ALWAYS+LC+L+C+PR,     			/* g                            */
	ALWAYS+LC+L+C+PR,     			/* h                            */
	ALWAYS+LC+L+OO+PR,    			/* i                            */
	ALWAYS+LC+L+C+PR,     			/* j                            */
	ALWAYS+LC+L+C+PR,     			/* k                            */
	ALWAYS+LC+L+C+PR,     			/* l                            */
	ALWAYS+LC+L+C+PR,     			/* m                            */
	ALWAYS+LC+L+C+PR,     			/* n                            */
	ALWAYS+LC+L+OO+PR,    			/* o                            */

	ALWAYS+LC+L+C+PR,     			/* p                            */
	ALWAYS+LC+L+C+PR,     			/* q                            */
	ALWAYS+LC+L+C+PR,     			/* r                            */
	ALWAYS+LC+L+C+PR,     			/* s                            */
	ALWAYS+LC+L+C+PR,     			/* t                            */
	ALWAYS+LC+L+OO+PR,    			/* u                            */
	ALWAYS+LC+L+C+PR,     			/* v                            */
	ALWAYS+LC+L+C+PR,     			/* w                            */
	ALWAYS+LC+L+C+PR,     			/* x                            */
	ALWAYS+LC+L+PR,     			/* y (-V, -C)                   */
	ALWAYS+LC+L+C+PR,     			/* z                            */
	ALWAYS+LS+FB+PR,     			/* {                            */
	ALWAYS+PR,     					/* |                            */
	ALWAYS+RS+FB+PR,     			/* }                            */
	ALWAYS+PR,     					/* ~                            */
	IGNORE,                         /* DEL                          */

	ALWAYS+PR,						/* euro symbol                  */
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,                         /* IND                          */
	IGNORE,                         /* NEL                          */
	IGNORE,                         /* SSA                          */
	IGNORE,                         /* ESA                          */
	IGNORE,                         /* HTS                          */
	IGNORE,                         /* HTJ                          */
	IGNORE,                         /* VTS                          */
	IGNORE,                         /* PLD                          */
	IGNORE,                         /* PLU                          */
	IGNORE,                         /* RI                           */
	IGNORE,                         /* SS2                          */
	IGNORE,                         /* SS3                          */

	IGNORE,                         /* DCS                          */
	IGNORE,                         /* PU1                          */
	IGNORE,                         /* PU2                          */
	IGNORE,                         /* STS                          */
	IGNORE,                         /* CCH                          */
	IGNORE,                         /* MW                           */
	IGNORE,                         /* SPA                          */
	IGNORE,                         /* EPA                          */
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,                         /* CSI                          */
	IGNORE,                         /* ST                           */
	IGNORE,                         /* OSC                          */
	IGNORE,                         /* PM                           */
	IGNORE,                         /* APC                          */

	NEVER+PR,     					/* SP                           */
	ALWAYS+LS+PR,     				/* Inverted !                   */
	ALWAYS+PR,     					/* Cent symbol                  */
	ALWAYS+PR,     					/* UK currency symbol           */
	IGNORE,
	ALWAYS+PR,     					/* Yen symbol                   */
	ALWAYS+PR,
	ALWAYS+PR,     					/* Section symbol               */
	ALWAYS+PR,     					/* Blob with 4 little spikes    */
	ALWAYS+PR,     					/* Copyright symbol             */
	ALWAYS+PR,     					/* Underlined "a"               */
	ALWAYS+LS+PR,     				/* <<                           */
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,

	ALWAYS+PR,     					/* Degree symbol                */
	ALWAYS+PR,    	 				/* Plus-Minus                   */
	ALWAYS+PR,     					/* Superscript 2                */
	ALWAYS+PR,     					/* Superscript 3                */
	IGNORE,
	ALWAYS+PR,   					/* Mu                           */
	ALWAYS+PR,     					/* Paragraph                    */
	ALWAYS+PR,     					/* Solid circle                 */
	IGNORE,
	ALWAYS+PR,     					/* Superscript 1                */
	ALWAYS+PR,     					/* Underlined "o"               */
	ALWAYS+RS+PR,     				/* >>                           */
	ALWAYS+PR,     					/* 1/4                          */
	ALWAYS+PR,     					/* 1/2                          */
	IGNORE,
	ALWAYS+LS+PR,     				/* Inverted ?                   */

	ALWAYS+UU+L+OO+PR,     			/* A grave                      */
	ALWAYS+UU+L+OO+PR,     			/* A acute                      */
	ALWAYS+UU+L+OO+PR,     			/* A circumflex                 */
	ALWAYS+UU+L+OO+PR,     			/* A tilde                      */
	ALWAYS+UU+L+OO+PR,     			/* A diarasis                   */
	ALWAYS+UU+L+OO+PR,     			/* A with circle 			    */
	ALWAYS+UU+L+OO+PR,     			/* AE                           */
	ALWAYS+UU+L+C+PR,      			/* C cdl.                       */
	ALWAYS+UU+L+OO+PR,     			/* E grave                      */
	ALWAYS+UU+L+OO+PR,     			/* E acute                      */
	ALWAYS+UU+L+OO+PR,     			/* E circumflex                 */
	ALWAYS+UU+L+OO+PR,     			/* E diarasis                   */
	ALWAYS+UU+L+OO+PR,     			/* I grave                      */
	ALWAYS+UU+L+OO+PR,     			/* I acute                      */
	ALWAYS+UU+L+OO+PR,     			/* I circumflex                 */
	ALWAYS+UU+L+OO+PR,     			/* I diarasis                   */

	IGNORE,
	ALWAYS+UU+L+C+PR,      			/* N tilde                      */
	ALWAYS+UU+L+OO+PR,     			/* O grave                      */
	ALWAYS+UU+L+OO+PR,     			/* O acute                      */
	ALWAYS+UU+L+OO+PR,     			/* O circumflex                 */
	ALWAYS+UU+L+OO+PR,     			/* O tilde                      */
	ALWAYS+UU+L+OO+PR,     			/* O diarasis                   */
	ALWAYS+UU+L+OO+PR,     			/* OE                           */
	ALWAYS+UU+L+OO+PR,     			/* O with backslash             */
	ALWAYS+UU+L+OO+PR,     			/* U grave                      */
	ALWAYS+UU+L+OO+PR,     			/* U acute                      */
	ALWAYS+UU+L+OO+PR,     			/* U circumflex                 */
	ALWAYS+UU+L+OO+PR,     			/* U diarasis                   */
	ALWAYS+UU+L+C+PR,      			/* Y diarasis                   */
	IGNORE,
	ALWAYS+L+C+PR,       			/* The "Beta" German thing.     */

	ALWAYS+LC+L+OO+PR,     			/* a grave                      */
	ALWAYS+LC+L+OO+PR,     			/* a acute                      */
	ALWAYS+LC+L+OO+PR,     			/* a circumflex                 */
	ALWAYS+LC+L+OO+PR,     			/* a tilde                      */
	ALWAYS+LC+L+OO+PR,     			/* a diarasis                   */
	ALWAYS+LC+L+OO+PR,     			/* a with little circle         */
	ALWAYS+LC+L+OO+PR,     			/* ae                           */
	ALWAYS+LC+L+C+PR,      			/* c cdl.                       */
	ALWAYS+LC+L+OO+PR,     			/* e grave                      */
	ALWAYS+LC+L+OO+PR,     			/* e acute                      */
	ALWAYS+LC+L+OO+PR,     			/* e circumflex                 */
	ALWAYS+LC+L+OO+PR,     			/* e diarasis                   */
	ALWAYS+LC+L+OO+PR,     			/* i grave                      */
	ALWAYS+LC+L+OO+PR,     			/* i acute                      */
	ALWAYS+LC+L+OO+PR,     			/* i circumflex                 */
	ALWAYS+LC+L+OO+PR,     			/* i diarasis                   */

	IGNORE,
	ALWAYS+LC+L+C+PR,      			/* n tilde                      */
	ALWAYS+LC+L+OO+PR,     			/* o grave                      */
	ALWAYS+LC+L+OO+PR,     			/* o acute                      */
	ALWAYS+LC+L+OO+PR,     			/* o curcumflex                 */
	ALWAYS+LC+L+OO+PR,     			/* o tilde                      */
	ALWAYS+LC+L+OO+PR,     			/* o diarasis                   */
	ALWAYS+LC+L+OO+PR,     			/* oe                           */
	ALWAYS+LC+L+OO+PR,     			/* o with line                  */
	ALWAYS+LC+L+OO+PR,     			/* u grave                      */
	ALWAYS+LC+L+OO+PR,     			/* u acute                      */
	ALWAYS+LC+L+OO+PR,     			/* u circumflex                 */
	ALWAYS+LC+L+OO+PR,     			/* u diarasis                   */
	ALWAYS+LC+L+C+PR,      			/* y diarasis                   */
	IGNORE,
	IGNORE

};

/*
 * This table contains a list of
 * "number abbreviations" and the desired
 * phoneme string. There are actually two strings, that
 * sit side by side with a "SIL" phoneme between them. The
 * caller will scan over the first one (the singular format
 * of the abbreviation) if the plural form is the one
 * that is desired. Used by heuristics. It would be
 * nice if there was a way to make C count the
 * blocks, like you can in MACRO and other very
 * high level languages.
 */

 const unsigned char nabtab[] = {
	34,	'c',	'l',	EOS,
	SP_TH, SP_E, SP_N, SBOUND, SP_T, SP_I, SBOUND, SP_L, S2, SP_I, SBOUND, SP_T, SP_R, SP_O, SIL,
	SP_TH, SP_E, SP_N, SBOUND, SP_T, SP_I, SBOUND, SP_L, S2, SP_I, SBOUND, SP_T, SP_R, SP_O, SP_S, SIL,

	32,	'd',	'm',	EOS,
	SP_D, SP_E, SBOUND, SP_TH, S1, SP_I, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, SIL,
	SP_D, SP_E, SBOUND, SP_TH, S1, SP_I, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, SP_S, SIL,

	32,	'd',	'l',	EOS,
	SP_D, SP_E, SBOUND, SP_TH, SP_I, SBOUND, SP_L, S2, SP_I, SBOUND, SP_T, SP_R, SP_O, SIL,
	SP_D, SP_E, SBOUND, SP_TH, SP_I, SBOUND, SP_L, S2, SP_I, SBOUND, SP_T, SP_R, SP_O, SP_S, SIL,

	19,	'g',	EOS,
	SP_G, SP_R, S1, SP_A, SBOUND, SP_M, SP_O, SIL,
	SP_G, SP_R, S1, SP_A, SBOUND, SP_M, SP_O, SP_S, SIL,

	20,	'g',	'r',	EOS,
	SP_G, SP_R, S1, SP_A, SBOUND, SP_M, SP_O, SIL,
	SP_G, SP_R, S1, SP_A, SBOUND, SP_M, SP_O, SP_S, SIL,

	32,	'k',	'l',	EOS,
	SP_K, SP_I, SBOUND, SP_L, SP_O, SBOUND, SP_L, S2, SP_I, SBOUND, SP_T, SP_R, SP_O, SIL,
	SP_K, SP_I, SBOUND, SP_L, SP_O, SBOUND, SP_L, S2, SP_I, SBOUND, SP_T, SP_R, SP_O, SP_S, SIL,

	32,	'k',	'm',	EOS,
	SP_K, SP_I, SBOUND, SP_L, S1, SP_O, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, SIL,
	SP_K, SP_I, SBOUND, SP_L, S1, SP_O, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, SP_S, SIL,

	44,	'm',	'2',	EOS,
	SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, MBOUND, SP_K, SP_U, SP_A, SBOUND, SP_D, SP_R, S2, SP_A, SBOUND, SP_D, SP_O, SP_S, SIL,
	SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, SP_S, MBOUND, SP_K, SP_U, SP_A, SBOUND, SP_D, SP_R, S2, SP_A, SBOUND, SP_D, SP_O, SP_S, SIL,

	59,	'k',	'm',	'2',	EOS,
	SP_K, SP_I, SBOUND, SP_L, S1, SP_O, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, MBOUND, SP_K, SP_U, SP_A, SBOUND, SP_D, SP_R, S2, SP_A, SBOUND, SP_D, SP_O, SP_S, SIL,
	SP_K, SP_I, SBOUND, SP_L, S1, SP_O, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, SP_S, MBOUND, SP_K, SP_U, SP_A, SBOUND, SP_D, SP_R, S2, SP_A, SBOUND, SP_D, SP_O, SP_S, SIL,

	50,	'k',	'm',	'/',	'h',	EOS,
	SP_K, SP_I, SBOUND, SP_L, S1, SP_O, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, MBOUND, SP_P, SP_O, SP_R, MBOUND, SP_O, SBOUND, SP_R, SP_A, SIL,
	SP_K, SP_I, SBOUND, SP_L, S1, SP_O, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, SP_S, MBOUND, SP_P, SP_O, SP_R, MBOUND, SP_O, SBOUND, SP_R, SP_A, SIL,

	32,	'k',	'g',	EOS,
	SP_K, SP_I, SBOUND, SP_L, SP_O, SBOUND, SP_G, SP_R, S1, SP_A, SBOUND, SP_M, SP_O, SIL,
	SP_K, SP_I, SBOUND, SP_L, SP_O, SBOUND, SP_G, SP_R, S1, SP_A, SBOUND, SP_M, SP_O, SP_S, SIL,

	32,	'k',	'w',	EOS,
	SP_K, SP_I, SBOUND, SP_L, SP_O, SBOUND, SP_B, S2, SP_A, SBOUND, SP_T, SP_I, SP_O, SIL,
	SP_K, SP_I, SBOUND, SP_L, SP_O, SBOUND, SP_B, S2, SP_A, SBOUND, SP_T, SP_I, SP_O, SP_S, SIL,

	49,	'k',	'p',	'h',	EOS,
	SP_K, SP_I, SBOUND, SP_L, S1, SP_O, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, MBOUND, SP_P, SP_O, SP_R, MBOUND, SP_O, SBOUND, SP_R, SP_A, SIL,
	SP_K, SP_I, SBOUND, SP_L, S1, SP_O, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, SP_S, MBOUND, SP_P, SP_O, SP_R, MBOUND, SP_O, SBOUND, SP_R, SP_A, SIL,

	32,	'm',	'm',	EOS,
	SP_M, SP_I, SBOUND, SP_L, S1, SP_I, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, SIL,
	SP_M, SP_I, SBOUND, SP_L, S1, SP_I, SBOUND, SP_M, SP_E, SBOUND, SP_T, SP_R, SP_O, SP_S, SIL,

	32,	'm',	'l',	EOS,
	SP_M, SP_I, SBOUND, SP_L, SP_I, SBOUND, SP_L, S2, SP_I, SBOUND, SP_T, SP_R, SP_O, SIL,
	SP_M, SP_I, SBOUND, SP_L, SP_I, SBOUND, SP_L, S2, SP_I, SBOUND, SP_T, SP_R, SP_O, SP_S, SIL,

	32,	'm',	'g',	EOS,
	SP_M, SP_I, SBOUND, SP_L, SP_I, SBOUND, SP_G, SP_R, S1, SP_A, SBOUND, SP_M, SP_O, SIL,
	SP_M, SP_I, SBOUND, SP_L, SP_I, SBOUND, SP_G, SP_R, S1, SP_A, SBOUND, SP_M, SP_O, SP_S, SIL,

	19,	0xb0,	EOS,	//0xb0='°'
	SP_G, SP_R, S1, SP_A, SBOUND, SP_D, SP_O, SIL,
	SP_G, SP_R, S1, SP_A, SBOUND, SP_D, SP_O, SP_S, SIL,

	52,	0xb0, 'c', 	EOS,	//0xb0='°'
	SP_G, SP_R, S1, SP_A, SBOUND, SP_D, SP_O, WBOUND, SP_TH, SP_E, SP_N, SBOUND, SP_T, S1, SP_I, SBOUND, SP_G, SP_R, S2, SP_A, SBOUND, SP_D, SP_O, SIL,
	SP_G, SP_R, S1, SP_A, SBOUND, SP_D, SP_O, WBOUND, SP_TH, SP_E, SP_N, SBOUND, SP_T, S1, SP_I, SBOUND, SP_G, SP_R, S2, SP_A, SBOUND, SP_D, SP_O, SP_S, SIL,

	0

};



/*
 * This table, which has the same basic
 * format as the number abbreviation table, contains
 * the names and the pronounciation of the number words.
 * There is only a single phoneme string.
 */

/* GL 11/06/98, BATS#721 add this table to support currency reading */
const unsigned char nwdtab[] = {
	11,'c','i','e','n',EOS,SP_TH,SP_I,S1,SP_E,SP_N,SIL,
	16,'c','i','e','n','t','o',EOS,SP_TH,SP_I,S1,SP_E,SP_N,SBOUND,SP_T,SP_O,SIL,
	18,'c','i','e','n','t','o','s',EOS,SP_TH,SP_I,S1,SP_E,SP_N,SBOUND,SP_T,SP_O,SP_S,SIL,
	9, 'm','i','l',EOS,SP_M,S1,SP_I,SP_L,SIL,
	14, 'm','i','l','e','s',EOS,SP_M,S1,SP_I,SBOUND,SP_L,SP_E,SP_S,SIL,
	15,'m','i','l','l',0xf3,'n',EOS,SP_M,SP_I,SBOUND,SP_LL,S1,SP_O,SP_N,SIL,	//0xf3='ó'
	20,'m','i','l','l','o','n','e','s',EOS,SP_M,SP_I,SBOUND,SP_LL,S1,SP_O,SP_N,SBOUND,SP_E,SP_S,SIL,
    //29, 'm','i','l',' ','m','i','l','l','o','n','e','s',EOS,SP_M,S1,SP_I,SP_L,WBOUND,SP_M,SP_I,SBOUND,SP_LL,S1,SP_O,SP_N,SBOUND,SP_E,SP_S,SIL,
    22, 'm','i','l','l','a','r','d','o','s',EOS,SP_M,SP_I,SBOUND,SP_LL,S1,SP_A,SP_R,SBOUND,SP_DH,SP_O,SP_S,SIL,
    15,'b','i','l','l',0xf3,'n',EOS,SP_B,SP_I,SBOUND,SP_LL,S1,SP_O,SP_N,SIL,	//0xf3='ó'
	20,'b','i','l','l','o','n','e', 's',EOS,SP_B,SP_I,SBOUND,SP_LL,S1,SP_O,SP_N,SBOUND,SP_E,SP_S,SIL,
	//29, 'm','i','l',' ','b','i','l','l','o','n','e','s',EOS,SP_M,S1,SP_I,SP_L,WBOUND,SP_B,SP_I,SBOUND,SP_LL,S1,SP_O,SP_N,SBOUND,SP_E,SP_S,SIL,
	17,'t','r','i','l','l',0xf3,'n',EOS,SP_T,SP_R,SP_I,SBOUND,SP_LL,S1,SP_O,SP_N,SIL,	//0xf3='ó'
	22,'t','r','i','l','l','o','n','e','s',EOS,SP_T,SP_R,SP_I,SBOUND,SP_LL,S1,SP_O,SBOUND,SP_N,SP_E,SP_S,SIL,
     0
};                   


const unsigned char m_jan[]="ene";
const unsigned char m_feb[]="feb";
const unsigned char m_mar[]="mar";
const unsigned char m_apr[]="abr";
const unsigned char m_may[]="may";
const unsigned char m_jun[]="jun";
const unsigned char m_jul[]="jul";
const unsigned char m_aug[]="ago";
const unsigned char m_sep[]="sep";
const unsigned char m_oct[]="oct";
const unsigned char m_nov[]="nov";
const unsigned char m_dec[]="dic";                                   


const unsigned char *const months[] = {
   m_jan,
   m_feb,
   m_mar,
   m_apr,
   m_may,
   m_jun,
   m_jul,
   m_aug,
   m_sep,
   m_oct,
   m_nov,
   m_dec,
   NULL
};

const unsigned char pdegree[] = {
	SP_G,    SP_R,    S1,     SP_A,    SBOUND, SP_DH,    SP_O,WBOUND ,    SIL
};

/*	CAB Removed not used
unsigned char      pdash[] = {
	SP_G,   SP_I,    S1,     SP_O,    SP_N,WBOUND,     SIL
};
*/

const unsigned char pminus[] = {
	SP_M,    S1,     SP_E,    SBOUND, SP_N,    SP_O,    SP_S,WBOUND,     SIL
};


const unsigned char p0[] = {
	SP_TH,   S1,     SP_E,    SP_R,    SP_O,WBOUND,     SIL
};


/* GL 10/12/98,  set 1 to "un" all the time */
const unsigned char p1[] = {
	   S1,  SP_U,    SBOUND, SP_N,    SP_O, WBOUND,     SIL
//    SP_U,    SP_N,   WBOUND,     SIL
};

const unsigned char p1_uno[] = {
	   S1,  SP_U,    SBOUND, SP_N,    SP_O, WBOUND,     SIL
};

const unsigned char p1_un[] = {
    SP_U,    SP_N,   WBOUND,     SIL
};


const unsigned char p2[] = {
	SP_D, S1,     SP_O,    SP_S,WBOUND,     SIL
};

const unsigned char p3[] = {
	SP_T,    SP_R,  S1,       SP_E,    SP_S,WBOUND,     SIL
};

const unsigned char p4[] = {
	SP_K,    SP_U,    S1,     SP_A,    SBOUND, SP_T,    SP_R,    SP_O,WBOUND,     SIL
};

const unsigned char p5[] = {
	SP_TH,   S1,      SP_I,    SP_N,    SBOUND, SP_K,    SP_O,WBOUND,     SIL
};


const unsigned char p6[] = {
	SP_S,    S1,      SP_E, SBOUND,   SP_I,    SP_S,WBOUND,     SIL
};


const unsigned char p7[] = {
	SP_S,    SP_I,    S1,      SP_E,    SBOUND, SP_T,    SP_E,WBOUND,     SIL
};
 
const unsigned char ph7[] = {
	SP_S,    S1, SP_E,        SP_T,SBOUND,     SP_E,WBOUND,     SIL
};
        
const unsigned char p8[] = {
	S1,      SP_O,    SBOUND, SP_CH,   SP_O,WBOUND,     SIL
};


const unsigned char p9[] = {
	SP_N,    SP_U, S1,   SP_E,SBOUND,  SP_BH,   SP_E,WBOUND,     SIL
};

const unsigned char ph9[] = {
	SP_N,      SP_O,        SBOUND, SP_BH,   SP_E,WBOUND,     SIL
};
        
const unsigned char up0[] = {
	SP_TH,        SP_E,    SP_R,    SP_O,SBOUND,     SIL
};

const unsigned char up1[] = {
	     SP_U,    SBOUND, SP_N,    SP_O,SBOUND,     SIL
};

const unsigned char up2[] = {
	SP_D,         SP_O,    SP_S,SBOUND,     SIL
};

const unsigned char up3[] = {
	SP_T,    SP_R,         SP_E,    SP_S,SBOUND,     SIL
};

const unsigned char up4[] = {
	SP_K,    SP_U,       SP_A,    SBOUND, SP_T,    SP_R,    SP_O,SBOUND,     SIL
};

const unsigned char up5[] = {
	SP_TH,       SP_I,    SP_N,    SBOUND, SP_K,    SP_O,SBOUND,     SIL
};

const unsigned char up6[] = {
	SP_S,      SP_E,    SP_I,    SP_S,SBOUND,     SIL
};


const unsigned char up7[] = {
	SP_S,    SP_I,      SP_E,    SBOUND, SP_T,    SP_E,SBOUND,     SIL
};

/* CAB 04/24/2002 Removed not used
unsigned char uph7[] = {
	SP_S,    SP_E,        SP_T,SBOUND,     SP_E,SBOUND,     SIL
};
*/

const unsigned char up8[] = {
	   SP_O,    SBOUND, SP_CH,   SP_O,SBOUND,     SIL
};

const unsigned char up9[] = {
	SP_N,    SP_U,    SP_E,SBOUND,  SP_BH,   SP_E,SBOUND,     SIL
};

/* CAB 04/24/2002 Removed not used
unsigned char uph9[] = {
	SP_N,     SP_O,        SBOUND, SP_BH,   SP_E,SBOUND,     SIL
};
*/

const unsigned char *const punits[] = {
	p0,     p1_un,     p2,     p3,     p4,
	p5,     p6,     p7,     p8,     p9
};

const unsigned char *const upunits[] = {
	up0,     up1,     up2,     up3,     up4,
	up5,     up6,     up7,     up8,     up9
};

const unsigned char ponehundred[] = {
	SP_TH,   SP_I,	S1,     SP_E,    SP_N,	SIL
};

const unsigned char phundredp[] = {
	SP_TH,   SP_I,    S1,     SP_E,    SP_N,    SBOUND, SP_T,    SP_O,  SIL
};

const unsigned char phundred[] = {
	SP_TH,   SP_I,    S1,     SP_E,    SP_N,    SBOUND, SP_T,    SP_O,SP_S,  SIL
};

const unsigned char pfivehun[] = {
	SP_K,   SP_I,    SBOUND, SP_N, SP_I,  S1,   SP_E,    SP_N,
		SBOUND, SP_T,    SP_O,SP_S, SIL
};

const unsigned char pthousand[] = {
	SP_M,    S2,    SP_I,    SP_L,   SBOUND,   SIL
};

const unsigned char pmillion[] = {
        SP_M,    SP_I,    SBOUND, SP_LL,   S2,     SP_O,
	SBOUND, SP_N,         SIL
};

const unsigned char pmilliones[] = {
        SP_M,    SP_I,    SBOUND, SP_LL,   S2,     SP_O,
	SBOUND, SP_N,    SP_E,    SP_S,     SIL
};

const unsigned char ponemillion[] = {
        SP_U,  SP_N,   SP_M,    SP_I,    SBOUND, SP_LL,   S2,     SP_O,
	SBOUND, SP_N,     SIL
};

const unsigned char pordonemillion[] = {
	SP_M, SP_I, SBOUND, SP_LL, SP_O, SBOUND, SP_N, S1, SP_E, SBOUND, SP_S, SP_I, SBOUND, SP_M, SP_O, SIL
};

const unsigned char p10[] = {                                      
	SP_D,    SP_I,    S1,     SP_E,    SP_TH,WBOUND,     SIL
};

const unsigned char p11[] = {
	S1,     SP_O,SBOUND,     SP_N,    SP_TH,    SP_E,WBOUND,     SIL
};

const unsigned char p12[] = {
	SP_D,    S1,     SP_O,    SBOUND, SP_TH,    SP_E,WBOUND,     SIL
};

const unsigned char p13[] = {
	SP_T,    SP_R,    S1,     SP_E,    SBOUND, SP_TH,    SP_E,WBOUND,     SIL
};

const unsigned char p14[] = {
	SP_K,    SP_A,    SBOUND, SP_T,    S1,     SP_O,    SP_R,    SBOUND,
	SP_TH,    SP_E,WBOUND,     SIL
};

const unsigned char p15[] = {
	SP_K,    S1,     SP_I,    SP_N,SBOUND,     SP_TH,    SP_E,WBOUND,     SIL
};

const unsigned char p16[] = {
	SP_D,    SP_I,         SP_E, SBOUND,   SP_TH,    SP_I,   
	SBOUND, SP_S,    S1,     SP_E,SBOUND,    SP_I,    SP_S,WBOUND,     SIL
};

const unsigned char p17[] = {
	SP_D,    SP_I,         SP_E,  SBOUND,  SP_TH,    SP_I,   
	SP_S,    SP_I,    S1,     SP_E,    SBOUND, SP_T,    SP_E,WBOUND,     SIL
};

const unsigned char p18[] = {
	SP_D,    SP_I,         SP_E,    SBOUND, SP_TH,  SP_I,
	S1,     SP_O,    SBOUND, SP_CH,   SP_O,WBOUND, SIL
};

const unsigned char p19[] = {
	SP_D,    SP_I,         SP_E,    SBOUND, SP_TH,         SP_I,    
	SP_N,    SP_U,    S1,     SP_E,    SBOUND, SP_BH,   SP_E,WBOUND,     SIL
};

const unsigned char *const pteens[] = {
	p10,    p11,    p12,    p13,    p14,
	p15,    p16,    p17,    p18,    p19
};

const unsigned char pnone[] = {
	SIL
};

const unsigned char p20[] = {
	SP_V,         SP_E,    SP_I,    SP_N,  SBOUND, SP_T,SIL
};

const unsigned char p21[] = {
	SP_V,        SP_E,    SP_I,    SP_N,  SBOUND, SP_T, SP_YX,SBOUND,
		S1, SP_U, SP_N, SP_O, SIL
};

const unsigned char p20only[] = {
	SP_V,    S1,     SP_E,    SP_I,    SP_N,    SBOUND, SP_T,    SP_E,     SIL
};

const unsigned char p30[] = {
	SP_T,    SP_R,         SP_E,    SP_I,    SP_N,    SBOUND,
	SP_T,    SP_A,     SIL
};

const unsigned char p40[] = {
	SP_K,    SP_U,    SP_A,    SBOUND, SP_R,         SP_E,    SP_N,
	SBOUND, SP_T,    SP_A,     SIL
};

const unsigned char p50[] = {
	SP_TH,   SP_I,    SP_N,    SBOUND, SP_K,    SP_U,         SP_E,
	SP_N, SBOUND,    SP_T,    SP_A,     SIL
};

const unsigned char p60[] = {
	SP_S,    SP_E,    SBOUND, SP_S,         SP_E,    SP_N,    SBOUND,
	SP_T,    SP_A,     SIL
};

const unsigned char p70[] = {
	SP_S,    SP_E,    SBOUND, SP_T,         SP_E,    SP_N,    SBOUND,
	SP_T,    SP_A,     SIL
};

const unsigned char p80[] = {
	SP_O,    SBOUND, SP_CH,        SP_E,    SP_N,    SBOUND,
	SP_T,    SP_A,     SIL
};

const unsigned char p90[] = {
	SP_N,    SP_O,SBOUND,     SP_B,         SP_E,    SP_N,SBOUND,     SP_T,    SP_A,     SIL
};

const unsigned char *const ptens[] = {
	pnone,  pnone,  p20,    p30,    p40,
	p50,    p60,    p70,    p80,    p90
};

const unsigned char ppence[] = {
	SP_P,    SP_E,    SBOUND, SP_N,    S2,     SP_I,    SBOUND,
	SP_K,    SP_E,WBOUND,     SIL
};

const unsigned char ppercent[] = {
	WBOUND, SP_P,    S1,     SP_O,    SP_R,    WBOUND, SP_TH,   SP_I,
	S1,     SP_E,    SP_N,    SBOUND, SP_T,    SP_O,WBOUND,     SIL
};
	
const unsigned char pcent[] = {
	WBOUND, SP_TH,   SP_E,    SP_N,    SBOUND, SP_T,    S1,     SP_A,
	SBOUND, SP_BH,   SP_O,WBOUND,     SIL
};

const unsigned char peuro[] = {
	WBOUND, S1, LA_E, LA_U, SBOUND, LA_R, LA_O, SIL
};

const unsigned char ppound[] = {
	WBOUND, SP_L,    S1,     SP_I,    SBOUND, SP_BH,   SP_R,    SP_A,WBOUND,     SIL
};

const unsigned char pdollar[] = {
	WBOUND, SP_D,    S1,     SP_O,    SBOUND, SP_L,    SP_A,    SP_R,WBOUND,     SIL
};

const unsigned char pand[] = {
	WBOUND, VPSTART, S2,    SP_I,WBOUND,     SIL
};

const unsigned char ppoint[] = {
	SP_P,    S1,     SP_U,    SP_N,    SBOUND, SP_T,    SP_O,WBOUND,     SIL
};

const unsigned char pcomma[] = {
	SP_K,    S1,     SP_O,    SBOUND, SP_M,    SP_A,	WBOUND,     SIL
};

const unsigned char pjan[] = {
	SP_E,    SBOUND, SP_N,    S1,     SP_E,    SBOUND, SP_R,    SP_O,WBOUND,     SIL
};

const unsigned char pfeb[] = {
	SP_F,    SP_E,    SBOUND, SP_B,    SP_R,    S1,     SP_E,    SBOUND,
	SP_R,    SP_O,WBOUND,     SIL
};

const unsigned char pmar[] = {
	SP_M,    S1,     SP_A,    SP_R,    SBOUND, SP_TH,   SP_O,WBOUND,     SIL
};

const unsigned char papr[] = {
	SP_A,    SBOUND, SP_B,    SP_R,    S1,     SP_I,    SP_L,WBOUND,     SIL
};

const unsigned char pmay[] = {
	SP_M,    S1,     SP_A,    SBOUND, SP_YH,   SP_O,WBOUND,     SIL
};

const unsigned char pjun[] = {
	SP_J,    S1,     SP_U,    SBOUND, SP_N,    SP_I,    SP_O,WBOUND,     SIL
};

const unsigned char pjul[] = {
	SP_J,    S1,     SP_U,    SBOUND, SP_L,    SP_I,    SP_O,WBOUND,     SIL

};

const unsigned char paug[] = {
	SP_A,    SBOUND, SP_G,    S1,     SP_O,    SP_S,    SBOUND,
	SP_T,    SP_O,WBOUND,     SIL
};

const unsigned char psep[] = {
	SP_S,    SP_E,    SP_P,    SBOUND, SP_T,    SP_I,    S1,     SP_E,
	SP_M,    SBOUND, SP_B,    SP_R,    SP_E,WBOUND,     SIL
};

const unsigned char poct[] = {
	SP_O,    SP_K,    SBOUND, SP_T,    S1,     SP_U,    SBOUND, SP_B,
	SP_R,    SP_E,WBOUND,     SIL
};

const unsigned char pnov[] = {
	SP_N,    SP_O,    SBOUND, SP_B,    SP_I,    S1,     SP_E,    SP_M,
	SBOUND, SP_B,    SP_R,    SP_E,WBOUND,     SIL
};

const unsigned char pdec[] = {
	SP_D,    SP_I,    SBOUND, SP_TH,   SP_I,    S1,     SP_E,    SP_M,
	SBOUND, SP_B,    SP_R,    SP_E,WBOUND,     SIL
};

const unsigned char *const pmonths[] = {
	pjan,   pfeb,   pmar,   papr,   pmay,   pjun,
	pjul,   paug,   psep,   poct,   pnov,   pdec,
	pjan,   papr,   paug,   pdec,
	NULL
};

const unsigned char p0th[] = {
	SP_TH,   S1,     SP_E,    SBOUND, SP_R,    SIL
};

const unsigned char p1st[] = {
	SP_P,    SP_R,    SP_I,    SBOUND, SP_M,    S1,     SP_E,    SP_R,WBOUND,     SIL
};

const unsigned char p2nd[] = {
	SP_S,    SP_E,    SBOUND, SP_G,    S1,     SP_U,    SP_N,    SBOUND,
	SP_D,    SIL
};

const unsigned char p3rd[] = {
	SP_T,    SP_E,    SP_R,    SBOUND, SP_TH,   S1,     SP_E,    SP_R,WBOUND,     SIL
};

const unsigned char p4th[] = {
	SP_K,    SP_U,    S1,     SP_A,    SBOUND, SP_R,    SP_T,    SIL
};

const unsigned char p5th[] = {
	SP_K,    S1,     SP_I,    SP_N,    SBOUND, SP_T,     SIL
};

const unsigned char p6th[] = {
	SP_S,    S1,     SP_E,    SP_K,    SBOUND, SP_S,    SP_T,   SIL
};

const unsigned char p7th[] = {
	SP_S,    S1,     SP_E,    SP_P,    SBOUND, SP_T,    SP_I,    SBOUND,
	SP_M,    SIL
};

const unsigned char p8th[] = {
	SP_O,    SP_K,    SBOUND, SP_T,    S1,     SP_A,    SBOUND,
	SP_B,    SIL
};

const unsigned char p9th[] = {
	SP_N,    SP_O,    SBOUND, SP_B,    S1,     SP_E,    SBOUND,
	SP_N,    SIL
};

const unsigned char *const pordunits[] = {
	p0th,   p1st,   p2nd,   p3rd,   p4th,
	p5th,   p6th,   p7th,   p8th,   p9th
};

const unsigned char p10th[] = {
	SP_D,    S1,     SP_E,    SBOUND, SP_TH,   SP_I,    SBOUND,
	SP_M,       SIL
};
			  
const unsigned char p11th[] = {
	SP_U,  SP_N,   SP_D,       S1,     SP_E,    SBOUND, SP_TH,   SP_I,    SBOUND,
	SP_M,            SIL
};

const unsigned char p12th[] = {
	SP_D, SP_W, SBOUND, SP_O,  SP_D,    S1,     SP_E,    SBOUND, SP_TH,   SP_I,    SBOUND,
	SP_M,            SIL
};

const unsigned char p13th[] = {
	SP_D,    S1,     SP_E,    SBOUND, SP_TH,   SP_I,    SBOUND,
	SP_M,    SP_O, SBOUND, SP_T, SP_E, SP_R, SBOUND, SP_TH, SP_I, SIL
};

const unsigned char p14th[] = {
	SP_D,    S1,     SP_E,    SBOUND, SP_TH,   SP_I,    SBOUND,
	SP_M,    SP_O, SBOUND, SP_K,       SP_U,    S1,     SP_A,    SBOUND, SP_R,    SP_T,    
	SIL

};

const unsigned char p15th[] = {
	SP_D,    S1,     SP_E,    SBOUND, SP_TH,   SP_I,    SBOUND,
	SP_M,    SP_O, SBOUND, SP_K,       S1,     SP_I,    SP_N,    SBOUND, SP_T,            SIL
};

const unsigned char p16th[] = {
	SP_D,    S1,     SP_E,    SBOUND, SP_TH,   SP_I,    SBOUND,
	SP_M,    SP_O, SBOUND,  SP_S,      S1,     SP_E,    SP_K, SP_S,       SBOUND, SP_T,    SIL
};

const unsigned char p17th[] = {
	SP_D,    S1,     SP_E,    SBOUND, SP_TH,   SP_I,    SBOUND,
	SP_M,    SP_O, SBOUND, SP_S,       S1,     SP_E,    SP_P,    SBOUND, SP_T,    SP_I,    SBOUND,
	SP_M,    SIL
};

const unsigned char p18th[] = {
	SP_D,    S1,     SP_E,    SBOUND, SP_TH,   SP_I,    SBOUND,
	SP_M,    SP_O, SBOUND,  SP_O,      SP_K,    SBOUND, SP_T,    S1,     SP_A,    SBOUND,
	SP_B,    SIL
};

const unsigned char p19th[] = {
	SP_D,    S1,     SP_E,    SBOUND, SP_TH,   SP_I,    SBOUND,
	SP_M,    SP_O, SBOUND, SP_N,       SP_O,    SBOUND, SP_B,    S1,     SP_E,    SBOUND,
	SP_N,    SIL
};

const unsigned char *const pordteens[] = {
	p10th,  p11th,  p12th,  p13th,  p14th,
	p15th,  p16th,  p17th,  p18th,  p19th
};

const unsigned char p20th[] = {
	SP_B, SP_I, SBOUND, SP_J, S1, SP_E, SBOUND, SP_S, SP_I, SBOUND, SP_M,  SIL
};

const unsigned char p30th[] = {
	SP_T, SP_R, SP_I, SBOUND,  SP_J, S1, SP_E, SBOUND, SP_S, SP_I, SBOUND, SP_M,  SIL
};

const unsigned char p40th[] = {
	SP_K, SP_WX, SP_A, SBOUND, SP_D, SP_R, SP_A, SBOUND,  SP_J, S1, SP_E,
		SBOUND, SP_S, SP_I, SBOUND, SP_M,  SIL
};

const unsigned char p50th[] = {
	SP_K, SP_WX, SP_I, SP_N, SBOUND, SP_K, SP_WX, SP_A, SBOUND,    SP_J, S1, SP_E,
		SBOUND, SP_S, SP_I, SBOUND, SP_M,  SIL
};

const unsigned char p60th[] = {
	SP_S, SP_E, SP_K, SBOUND, SP_S, SP_A, SBOUND,        SP_J, S1, SP_E,
		SBOUND, SP_S, SP_I, SBOUND, SP_M,  SIL
};

const unsigned char p70th[] = {
	SP_S, SP_E, SP_P, SBOUND, SP_T, SP_WX, SP_A,  SBOUND, SP_J, S1, SP_E,
		SBOUND, SP_S, SP_I, SBOUND, SP_M,  SIL
};

const unsigned char p80th[] = {
	SP_O, SP_K, SBOUND, SP_T, SP_O, SBOUND, SP_J, S1, SP_E,
		SBOUND, SP_S, SP_I, SBOUND, SP_M,  SIL
};

const unsigned char p90th[] = {
	SP_N, SP_O, SBOUND, SP_N, SP_A, SBOUND, SP_J, S1, SP_E,
		SBOUND, SP_S, SP_I, SBOUND, SP_M,  SIL
};

const unsigned char pordonehundred[] = {
	SP_TH, SP_E, SP_N, SBOUND, SP_T, S1, SP_E, SBOUND, SP_S, SP_I, SBOUND, SP_M,  SIL
};

const unsigned char pordthousand[] = {
	SP_M,    S1,     SP_I,    SP_L, S1, SP_E, SBOUND, SP_S, SP_I, SBOUND, SP_M,  SIL
};

const unsigned char *const pordtens[]     = {
	pnone,  pnone,  p20th,  p30th,  p40th,
	p50th,  p60th,  p70th,  p80th,  p90th
};

/* ******************* NOT USED *************************************/
#if 0
unsigned char phalf[] = {
	SP_M,    S1,     SP_E,    SBOUND, SP_D,    SP_I,    SP_O,WBOUND,     SIL
};

unsigned char phalves[] = {
	SP_M,    S1,     SP_E,    SBOUND, SP_D,    SP_I,    SP_O,    SP_S,WBOUND,     SIL
};
#endif // 0
/* ******************************************************************/

/* GL 11/01/1996 use mitad to replace medio for 1/2 */
const unsigned char phalf[] = {
	SP_M,	SP_I,	SBOUND, SP_T,	S1,		SP_A,    SP_D,	WBOUND,     SIL
};
const unsigned char phalves[] = {
	SP_M,	SP_I,	SBOUND, SP_T,	S1,		SP_A,    SP_D,	SP_S,	WBOUND,     SIL
};

/* GL 10/12/1996, to fix the ordinal number error */
const unsigned char pordonehundred_g[] = {
	SP_J, SP_E, SP_N, SBOUND, SP_T, S1, SP_E, SBOUND, SP_S, SP_I, SBOUND, SP_M, SIL
};

const unsigned char o200[] = {
	SP_D, S1, SP_U, SIL
};

const unsigned char o300[] = {
	SP_T, SP_R, S1, SP_I, SIL
};

const unsigned char o400[] = {
	SP_K, SP_U, S1, SP_A, SBOUND, SP_D, SP_R, SP_I, SP_N, SIL
};

const unsigned char o500[] = {
	SP_K, S1, SP_I, SP_N, SIL
};

const unsigned char o600[] = {
	SP_S, S1, SP_E, SP_K, SP_S, SIL
};

const unsigned char o700[] = {
	SP_S, S1, SP_E, SP_P, SBOUND, SP_T, SP_I, SP_N, SIL
};

const unsigned char o800[] = {
	S1, SP_O, SP_K, SBOUND, SP_T, SP_I, SP_N, SIL
};

const unsigned char o900[] = {
	SP_N, S1, SP_O, SBOUND, SP_N, SP_I, SP_N, SIL
};

const unsigned char sdic[] = 
{
    20,'a','n','u','n','c','i','a',EOS,SP_A,SBOUND,SP_N,S1,SP_U,SP_N,SBOUND,SP_TH,SP_I,SP_A,SPECIALWORD,SIL,
    22,'a','n','u','n','c','i','a','n',EOS,SP_A,SBOUND,SP_N,S1,SP_U,SP_N,SBOUND,SP_TH,SP_I,SP_A,SP_N,SPECIALWORD,SIL,
    20,'a','n','u','n','c','i',0xf3,EOS,SP_A,SBOUND,SP_N,SP_U,SP_N,SBOUND,SP_TH,SP_I,S1,SP_O,SPECIALWORD,SIL,	////0xf3='ó'
    27,'a','n','u','n','c','i','a','r','o','n',EOS,SP_A,SBOUND,SP_N,SP_U,SP_N,SBOUND,SP_TH,SP_I,S1,SP_A,SBOUND,SP_R,SP_O,SP_N,SPECIALWORD,SIL,
    22,'c','o','n','t','e','s','t','a',EOS,SP_K,SP_O,SP_N,SBOUND,SP_T,S1,SP_E,SP_S,SBOUND,SP_T,SP_A,SPECIALWORD,SIL,
    24,'c','o','n','t','e','s','t','a','n',EOS,SP_K,SP_O,SP_N,SBOUND,SP_T,S1,SP_E,SP_S,SBOUND,SP_T,SP_A,SP_N,SPECIALWORD,SIL,
    22,'c','o','n','t','e','s','t',0xf3,EOS,SP_K,SP_O,SP_N,SBOUND,SP_T,SP_E,SP_S,SBOUND,SP_T,S1,SP_O,SPECIALWORD,SIL,	//0xf3='ó'
    29,'c','o','n','t','e','s','t','a','r','o','n',EOS,SP_K,SP_O,SP_N,SBOUND,SP_T,SP_E,SP_S,SBOUND,SP_T,S1,SP_A,SBOUND,SP_R,SP_O,SP_N,SPECIALWORD,SIL,
    13,'d','i','c','e',EOS,SP_D,S1,SP_I,SBOUND,SP_TH,SP_E,SPECIALWORD,SIL,
    15,'d','i','c','e','n',EOS,SP_D,S1,SP_I,SBOUND,SP_TH,SP_E,SP_N,SPECIALWORD,SIL,
    13,'d','i','j','o',EOS,SP_D,S1,SP_I,SBOUND,SP_J,SP_O,SPECIALWORD,SIL,
    20,'d','i','j','e','r','o','n',EOS,SP_D,SP_I,SBOUND,SP_J,S1,SP_E,SBOUND,SP_R,SP_O,SP_N,SPECIALWORD,SIL,
    21,'e','x','c','l','a','m','a',EOS,SP_E,SP_K,SP_S,SBOUND,SP_K,SP_L,S1,SP_A,SBOUND,SP_M,SP_A,SPECIALWORD,SIL,
    23,'e','x','c','l','a','m','a','n',EOS,SP_E,SP_K,SP_S,SBOUND,SP_K,SP_L,S1,SP_A,SBOUND,SP_M,SP_A,SP_N,SPECIALWORD,SIL,
    21,'e','x','c','l','a','m',0xf3,EOS,SP_E,SP_K,SP_S,SBOUND,SP_K,SP_L,SP_A,SBOUND,SP_M,S1,SP_O,SPECIALWORD,SIL,	//0xf3='ó'
    28,'e','x','c','l','a','m','a','r','o','n',EOS,SP_E,SP_K,SP_S,SBOUND,SP_K,SP_L,SP_A,SBOUND,SP_M,S1,SP_A,SBOUND,SP_R,SP_O,SP_N,SPECIALWORD,SIL,
    19,'e','x','p','l','i','c','a',EOS,SP_E,SP_K,SP_S,SP_P,SBOUND,SP_L,S1,SP_I,SBOUND,SP_K,SP_A,SPECIALWORD,SIL,
    21,'e','x','p','l','i','c','a','n',EOS,SP_E,SP_K,SP_S,SBOUND,SP_P,SP_L,S1,SP_I,SBOUND,SP_K,SP_A,SP_N,SPECIALWORD,SIL,
    19,'e','x','p','l','i','c',0xf3,EOS,SP_E,SP_K,SP_S,SBOUND,SP_P,SP_L,SP_I,SBOUND,SP_K,S1,SP_O,SPECIALWORD,SIL,	//0xf3='ó'
    28,'e','x','p','l','i','c','a','r','o','n',EOS,SP_E,SP_K,SP_S,SBOUND,SP_P,SP_L,SP_I,SBOUND,SP_K,S1,SP_A,SBOUND,SP_R,SP_O,SP_N,SPECIALWORD,SIL,
    12,'m','w','i','z','i',EOS,SP_K,S1,SP_O,SP_P,SP_I,SIL,20,'p','r','e','g','u','n','t','a',EOS,SP_P,SP_R,SP_E,SP_G,S1,SP_U,SP_N,SP_T,SP_A,SPECIALWORD,SIL,
    24,'p','r','e','g','u','n','t','a','n',EOS,SP_P,SP_R,SP_E,SBOUND,SP_G,S1,SP_U,SP_N,SBOUND,SP_T,SP_A,SP_N,SPECIALWORD,SIL,
    22,'p','r','e','g','u','n','t',0xf3,EOS,SP_P,SP_R,SP_E,SBOUND,SP_G,SP_U,SP_N,SBOUND,SP_T,S1,SP_O,SPECIALWORD,SIL,	//0xf3='ó'
    29,'p','r','e','g','u','n','t','a','r','o','n',EOS,SP_P,SP_R,SP_E,SBOUND,SP_G,SP_U,SBOUND,SP_N,SP_T,S1,SP_A,SBOUND,SP_R,SP_O,SP_N,SPECIALWORD,SIL,
	EOS
	
};

const unsigned char whdic[] = 
{
	0	
};         

const unsigned char spwhword[] = {
	7,      'd', 0xf3, 'n', 'd', 'e', EOS, SIL,	//0xf3='ó'
	7,      'd', 'o', 'n', 'd', 'e', EOS, SIL,
	8,      'a', 'd', 0xf3, 'n', 'd', 'e',EOS, SIL,	//0xf3='ó'
	6,      'c', 0xf3, 'm', 'o', EOS, SIL,	//0xf3='ó'
	8,      'c', 'u', 0xe1, 'n', 'd', 'o',EOS, SIL,	//0xe1='á'
	8,      'q', 'u', 0xe9, EOS, SP_K,S1,SP_E,SIL,	//0xe9='é'
	8,      'q', 'u', 'e', EOS,SP_K,SEMPH,SP_E, SIL,
	6,      'c', 'u', 0xe1,'l', EOS, SIL,	//0xe1='á'
	6,      'c', 'u', 0xe1,'l','e','s', EOS, SIL,	//0xe1='á'
	7,      'q', 'u', 'i', 0xe9, 'n', EOS, SIL,	//0xe9='é'
	9,      'q', 'u', 'i', 0xe9, 'n','e','s', EOS, SIL,	//0xe9='é'
	8,      'c', 'u', 0xe1,'l', 'e','s',EOS, SIL,	//0xe1='á'
	8,      'c', 'u', 0xe1, 'n', 't', 'o',        EOS, SIL,	//0xe1='á'
	8,      'c', 'u', 0xe1, 'n', 't', 'a',        EOS, SIL,	//0xe1='á'
	9,      'c', 'u', 0xe1, 'n', 't', 'a','s',EOS, SIL,	//0xe1='á'
	9,      'c', 'u', 0xe1, 'n', 't', 'o','s',EOS, SIL,	//0xe1='á'
	EOS
};

const unsigned char prewhword[] = {
	5,	'p', 'o', 'r', EOS, SIL,
	4,	'd', 'e', EOS, SIL,
	3,	'a', EOS, SIL,
	6,	'p', 'a', 'r','a',EOS, SIL,
	5,	'c', 'o', 'n',EOS, SIL,
	7,	'h', 'a', 'c','i','a',EOS, SIL,
	7,	'h', 'a', 's','t','a',EOS, SIL,
	7,	'd', 'e', 's','d','e',EOS, SIL,
	EOS
};

/*
 * Phonetic feature values allowed in place_sp_lts[]
 *
 * Note: Spanish does not currently use FDENTAL or FALVEL.  It is
 * not clear what the proper value for [l] should be, possibly dental.
 * FLABIAL      0000001          p, b, m, f, v
 * FDENTAL      0000002          th, dh, d$
 * FPALATL      0000004          sh, zh, ch, jh
 * FALVEL       0000010          t, d, n, en, s, z, tx (not l,r,dx)
 * FVELAR       0000020          k, g, nx
 * FGLOTAL      0000040          q, tq (signals glottal stop)
 * F2BACKI      0000100          iy, y, yu, ir (SP_I SP_YX)
 * F2BACKF      0000200          iy, y, ey (SP_I SP_YX SP_E)
 */

const short place_sp_lts[] = {
      0,                             /* SP_SI   */
      0,                             /* SP_A    */
      0,                             /* SP_E    */
      F2BACKI | F2BACKF,             /* SP_I    */
      0,                             /* SP_O    */
      0,                             /* SP_U    */
      FPALATL,                       /* SP_WX   */
      FPALATL | F2BACKI | F2BACKF,   /* SP_YX   */
      FALVEL,                        /* SP_RR   */
      FALVEL,                        /* SP_L    */
      FPALATL,                       /* SP_LL   */
      FLABIAL,                       /* SP_M    */
      FALVEL,                        /* SP_N    */
      FPALATL,                       /* SP_NH   */
      FLABIAL,                       /* SP_F    */
      FALVEL,                        /* SP_S    */
      FVELAR,                        /* SP_J    */
      FDENTAL,                       /* SP_TH   */
      FLABIAL,                       /* SP_BH   */
      FDENTAL,                       /* SP_DH   */
      FVELAR,                        /* SP_GH   */
      FPALATL,                       /* SP_YH   */
      FLABIAL,                       /* SP_P    */
      FLABIAL,                       /* SP_B    */
      FDENTAL,                       /* SP_T    */
      FDENTAL,                       /* SP_D    */
      FVELAR,                        /* SP_K    */
      FVELAR,                        /* SP_G    */
      FPALATL,                       /* SP_CH   */
      FPALATL+F2BACKI+F2BACKF,       /* SP_Y    */
      FALVEL,                        /* SP_R    */
      FGLOTTAL,                       /* SP_Q    */
      FALVEL,                        /* SP_Z    */
      FLABIAL,                       /* SP_W    */
      FVELAR,                        /* SP_NX   */

#ifdef SP_SH
      FPALATL,                       /* SP_SH   */
#endif

#ifdef SP_V
      FLABIAL,                       /* SP_V    */
#endif

      F2BACKI | F2BACKF,             /* SP_IX   */
      FLABIAL,                       /* SP_MX   */
      FLABIAL                        /* SP_PH   */
};

/*
 * Phonetic features:
 *
 *      FSYLL   0000001  Syllabics: vowels and dipthongs
 *      FVOICD  0000002  Voiced segments
 *      FVOWEL  0000004  Vowels
 *      FSEMIV  0000010  Semivowels (Y, W, YX, WX)
 *      FSONOR  0000020  [-obst], except SP_Q  which is [-sonor, -obst]
 *      FOBST   0000040  Occlusives, except SP_Q is [-obst]
 *      FPLOSV  0000100  Plosives, but not affricates
 *      FNASAL  0000200  Nasals
 *      FCONSON 0000400  [-syll], except for  SI and  SP_Q
 *      FSONCON 0001000  Laterals (was vd liq & glides, RR, lat's and  YH)
 *      FDIPTH  0002000  [i, u, yx, wx]
 *      FBURST  0004000  Plosives and affricates
 *      FSTMARK 0010000  Stress marks
 *      FGLOTAL 0020000  The glottal stop
 *      FVBAR   0040000  Generates voicebar
 * Note: FSYLL and FVOWEL are identical
 * [bh, dh, gh]->FOBST (needed to trigger nasal assimilation)    8-May-86
 * Note: Everything marked FOBST here must have entries in
 * the boundary value table.
 * [y] -> +FOBST, -FDIPTH -FSONOR                               12-May-86
 */

const unsigned short featb_sp_lts[PHO_SYM_TOT] = {
      /* [ SIL ]  */      FSONOR,
      /* [ SP_A ]  */      FSYLL+FVOICD+FVOWEL+FSONOR,
      /* [ SP_E ]  */      FSYLL+FVOICD+FVOWEL+FSONOR,
      /* [ SP_I ]  */      FSYLL+FVOICD+FVOWEL+FSONOR+FDIPTH,
      /* [ SP_O ]  */      FSYLL+FVOICD+FVOWEL+FSONOR,
      /* [ SP_U ]  */      FSYLL+FVOICD+FVOWEL+FSONOR+FDIPTH,
      /* [ SP_WX ] */      FVOICD+FSONOR+FSEMIV+FDIPTH,
      /* [ SP_YX ] */      FVOICD+FSONOR+FSEMIV+FDIPTH,
      /* [ SP_RR ] */      FVOICD+FSONOR+FCONSON,
      /* [ SP_L ]  */      FVOICD+FSONOR+FCONSON+FSONCON,
      /* [ SP_LL ] */      FVOICD+FSONOR+FCONSON+FSONCON,
      /* [ SP_M ]  */      FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ SP_N ]  */      FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ SP_NH ] */      FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ SP_F ]  */      FOBST+FCONSON,
      /* [ SP_S ]  */      FOBST+FCONSON,
      /* [ SP_J ]  */      FOBST+FCONSON,
      /* [ SP_TH ] */      FOBST+FCONSON,
      /* [ SP_BH ] */      FVOICD+FSONOR+FCONSON+FOBST,
      /* [ SP_DH ] */      FVOICD+FSONOR+FCONSON+FOBST,
      /* [ SP_GH ] */      FVOICD+FSONOR+FCONSON+FOBST,
      /* [ SP_YH ] */      FVOICD+FOBST+FCONSON+FBURST,   /* 23-Apr-86, 5-May */
      /* [ SP_P ]  */      FOBST+FPLOSV+FCONSON+FBURST,
      /* [ SP_B ]  */      FVOICD+FOBST+FPLOSV+FCONSON+FBURST+FVBAR,
      /* [ SP_T ]  */      FOBST+FPLOSV+FCONSON+FBURST,
      /* [ SP_D ]  */      FVOICD+FOBST+FPLOSV+FCONSON+FBURST+FVBAR,
      /* [ SP_K ]  */      FOBST+FPLOSV+FCONSON+FBURST,
      /* [ SP_G ]  */      FVOICD+FOBST+FPLOSV+FCONSON+FBURST+FVBAR,
      /* [ SP_CH ] */      FOBST+FCONSON+FBURST,
      /* [ SP_Y ]  */      FOBST+FVOICD+FCONSON,      /* 12-May-86       */
      /* [ SP_R ]  */      FVOICD+FSONOR+FCONSON,
      /* [ SP_Q ]  */      FVOICD+FGLOTTAL,
      /* [ SP_Z ]  */      FVOICD+FOBST+FCONSON,      /* 5-May-86        */
      /* [ SP_W ]  */      FVOICD+FOBST+FCONSON+FSEMIV,
      /* [ SP_NX ] */      FVOICD+FSONOR+FNASAL+FCONSON,

#ifdef SP_SH
      /* [ SP_SH ] */      FOBST+FCONSON,
#endif

#ifdef SP_V
      /* [ SP_V ]  */      FVOICD+FSONOR+FCONSON,
#endif

      /* [ SP_IX ]  */     FVOICD+FSONOR,      /* 7-May: not a vowel     */
      /* [ SP_MX]   */     FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ SP_PH ]  */     FOBST+FCONSON,
      /* [NOVALID] */     0,

      /* place holders for null range ... */
      0,0,0,0,0,0,0,0,0,0,      /* 40 ... 49 */
      0,0,0,0,0,0,0,0,0,0,      /* 50 ... 59 */
      0,0,0,0,0,0,0,0,0,0,      /* 60 ... 69 */
      0,0,0,0,0,0,0,0,0,0,      /* 70 ... 79 */
      0,0,0,0,0,0,0,0,0,0,      /* 80 ... 89 */
      0,0,0,0,0,0,0,0,0,0,      /* 90 ... 99 */
  
	  /* [BLOCK_RULES */      0,
	  /* [ S3  ]  	  */      0,
	  /* [ S2  ]  	  */      0,
	  /* [ S1  ]      */      0,
	  /* [SEMPH]  	  */      0,
	  /* [HAT_R]  	  */      0,
	  /* [HAT_FALL]   */      0,
	  /* [HAT_RF]  	  */  	  0,
	  /* [SBOUND]  	  */ 	  0,
	  /* [MBOUND]  	  */ 	  0,
	  /* [HYPHEN]  	  */ 	  0,
	  /* [WBOUND]  	  */ 	  0,0,0,0,0,0,0,0,0
	  /* The rest are zero          */
};
