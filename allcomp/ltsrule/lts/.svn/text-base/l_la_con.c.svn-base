/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997 All rights reserved.
                                                                  
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
 *    File Name:	l_la_con.c
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
 *  001 DGC		04/05/1985 		Changed [s] to [z] in "thousand".
 *  002 DGC		04/08/1985 		Added "pdegree".
 *  003 DGC		04/24/1985 		Fix some phomenes to agree with some
 *								dictionary changes.
 *  004	DGC		06/14/1985 		The "pplus" array isn't needed anymore.
 *  005 DGC		06/27/1985	 	Remove last [d] from "thousand".
 *  006 DGC		07/24/1985		[f'owr] to [f'or] and related forms.
 *  007 DGC		08/20/1985 		Undid 05; sounded bad.
 *  008 GL		07/29/1996		remove feats[] and pfeats[] two unused table.
 *  009 GL		11/01/1996		Fix the number system.
 *  010	GL		11/14/1996		Add p1_un[] and up1_un[]
 *  011	GL		02/10/1997		Bug fix for BATS#284.add NULL at the end of months[]
 *  012	MFG		06/17/1998		Copied from l_la_con.c
 *  013	GL		08/18/1998		Bug fix for BATS#745.  use S1 for all number.
 *  014 EAB		9/24/98			Improving numbers there are a lot of different problems ranging from 
 *						        stress changes to word bundary and syl boundary issues,
 *  015	GL.Juan	10/02/1998		add number abbreviation
 *  016	GL/Juan	10/12/1998		set "1" defaulted to "un" for all case.
 *                              use pre-process to translate "1" to "uno" or "una"
 *  017	GL.Juan	10/14/1998		add more number abbreviation
 *  018	GL		11/03/1998		BATS#783 add p1_uno[] for two digits number in date, time
 *  019	GL.Juan	11/04/1998		BATS#786 fix error in sdic[], spwhword[]
 *  020	GL.Juan	11/06/1998		BATS#721 add entry for nwdtab[]
 *  021	GL.Juan	11/06/1998		add more new entry for number abbrv.
 *  022	GL.Juan	11/12/1998		remove SBOUND from ponehundred[]
 *  023	MGS		04/13/2000		Changes for integrated phoneme set
 *  024 CAB		9/21/2000		Fixed copyright info and formatted comment section.
 *	025	CAB		04/24/2002		Fixed changed to const as ls_cons.h
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
	LA_TH, LA_E, LA_N, SBOUND, LA_T, LA_I, SBOUND, LA_L, S2, LA_I, SBOUND, LA_T, LA_R, LA_O, SIL,
	LA_TH, LA_E, LA_N, SBOUND, LA_T, LA_I, SBOUND, LA_L, S2, LA_I, SBOUND, LA_T, LA_R, LA_O, LA_S, SIL,

	32,	'd',	'm',	EOS,
	LA_D, LA_E, SBOUND, LA_TH, S1, LA_I, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, SIL,
	LA_D, LA_E, SBOUND, LA_TH, S1, LA_I, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, LA_S, SIL,

	32,	'd',	'l',	EOS,
	LA_D, LA_E, SBOUND, LA_TH, LA_I, SBOUND, LA_L, S2, LA_I, SBOUND, LA_T, LA_R, LA_O, SIL,
	LA_D, LA_E, SBOUND, LA_TH, LA_I, SBOUND, LA_L, S2, LA_I, SBOUND, LA_T, LA_R, LA_O, LA_S, SIL,

	19,	'g',	EOS,
	LA_G, LA_R, S1, LA_A, SBOUND, LA_M, LA_O, SIL,
	LA_G, LA_R, S1, LA_A, SBOUND, LA_M, LA_O, LA_S, SIL,

	20,	'g',	'r',	EOS,
	LA_G, LA_R, S1, LA_A, SBOUND, LA_M, LA_O, SIL,
	LA_G, LA_R, S1, LA_A, SBOUND, LA_M, LA_O, LA_S, SIL,

	32,	'k',	'l',	EOS,
	LA_K, LA_I, SBOUND, LA_L, LA_O, SBOUND, LA_L, S2, LA_I, SBOUND, LA_T, LA_R, LA_O, SIL,
	LA_K, LA_I, SBOUND, LA_L, LA_O, SBOUND, LA_L, S2, LA_I, SBOUND, LA_T, LA_R, LA_O, LA_S, SIL,

	32,	'k',	'm',	EOS,
	LA_K, LA_I, SBOUND, LA_L, S1, LA_O, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, SIL,
	LA_K, LA_I, SBOUND, LA_L, S1, LA_O, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, LA_S, SIL,

	44,	'm',	'2',	EOS,
	LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, MBOUND, LA_K, LA_U, LA_A, SBOUND, LA_D, LA_R, S2, LA_A, SBOUND, LA_D, LA_O, LA_S, SIL,
	LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, LA_S, MBOUND, LA_K, LA_U, LA_A, SBOUND, LA_D, LA_R, S2, LA_A, SBOUND, LA_D, LA_O, LA_S, SIL,

	59,	'k',	'm',	'2',	EOS,
	LA_K, LA_I, SBOUND, LA_L, S1, LA_O, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, MBOUND, LA_K, LA_U, LA_A, SBOUND, LA_D, LA_R, S2, LA_A, SBOUND, LA_D, LA_O, LA_S, SIL,
	LA_K, LA_I, SBOUND, LA_L, S1, LA_O, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, LA_S, MBOUND, LA_K, LA_U, LA_A, SBOUND, LA_D, LA_R, S2, LA_A, SBOUND, LA_D, LA_O, LA_S, SIL,

	50,	'k',	'm',	'/',	'h',	EOS,
	LA_K, LA_I, SBOUND, LA_L, S1, LA_O, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, MBOUND, LA_P, LA_O, LA_R, MBOUND, LA_O, SBOUND, LA_R, LA_A, SIL,
	LA_K, LA_I, SBOUND, LA_L, S1, LA_O, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, LA_S, MBOUND, LA_P, LA_O, LA_R, MBOUND, LA_O, SBOUND, LA_R, LA_A, SIL,

	32,	'k',	'g',	EOS,
	LA_K, LA_I, SBOUND, LA_L, LA_O, SBOUND, LA_G, LA_R, S1, LA_A, SBOUND, LA_M, LA_O, SIL,
	LA_K, LA_I, SBOUND, LA_L, LA_O, SBOUND, LA_G, LA_R, S1, LA_A, SBOUND, LA_M, LA_O, LA_S, SIL,

	32,	'k',	'w',	EOS,
	LA_K, LA_I, SBOUND, LA_L, LA_O, SBOUND, LA_B, S2, LA_A, SBOUND, LA_T, LA_I, LA_O, SIL,
	LA_K, LA_I, SBOUND, LA_L, LA_O, SBOUND, LA_B, S2, LA_A, SBOUND, LA_T, LA_I, LA_O, LA_S, SIL,

	49,	'k',	'p',	'h',	EOS,
	LA_K, LA_I, SBOUND, LA_L, S1, LA_O, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, MBOUND, LA_P, LA_O, LA_R, MBOUND, LA_O, SBOUND, LA_R, LA_A, SIL,
	LA_K, LA_I, SBOUND, LA_L, S1, LA_O, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, LA_S, MBOUND, LA_P, LA_O, LA_R, MBOUND, LA_O, SBOUND, LA_R, LA_A, SIL,

	32,	'm',	'm',	EOS,
	LA_M, LA_I, SBOUND, LA_L, S1, LA_I, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, SIL,
	LA_M, LA_I, SBOUND, LA_L, S1, LA_I, SBOUND, LA_M, LA_E, SBOUND, LA_T, LA_R, LA_O, LA_S, SIL,

	32,	'm',	'l',	EOS,
	LA_M, LA_I, SBOUND, LA_L, LA_I, SBOUND, LA_L, S2, LA_I, SBOUND, LA_T, LA_R, LA_O, SIL,
	LA_M, LA_I, SBOUND, LA_L, LA_I, SBOUND, LA_L, S2, LA_I, SBOUND, LA_T, LA_R, LA_O, LA_S, SIL,

	32,	'm',	'g',	EOS,
	LA_M, LA_I, SBOUND, LA_L, LA_I, SBOUND, LA_G, LA_R, S1, LA_A, SBOUND, LA_M, LA_O, SIL,
	LA_M, LA_I, SBOUND, LA_L, LA_I, SBOUND, LA_G, LA_R, S1, LA_A, SBOUND, LA_M, LA_O, LA_S, SIL,

	19,	0xb0,	EOS,	//0xb0='°'
	LA_G, LA_R, S1, LA_A, SBOUND, LA_D, LA_O, SIL,
	LA_G, LA_R, S1, LA_A, SBOUND, LA_D, LA_O, LA_S, SIL,

	52,	0xb0, 'c', 	EOS,	//0xb0='°'
	LA_G, LA_R, S1, LA_A, SBOUND, LA_D, LA_O, WBOUND, LA_TH, LA_E, LA_N, SBOUND, LA_T, S1, LA_I, SBOUND, LA_G, LA_R, S2, LA_A, SBOUND, LA_D, LA_O, SIL,
	LA_G, LA_R, S1, LA_A, SBOUND, LA_D, LA_O, WBOUND, LA_TH, LA_E, LA_N, SBOUND, LA_T, S1, LA_I, SBOUND, LA_G, LA_R, S2, LA_A, SBOUND, LA_D, LA_O, LA_S, SIL,
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
	11,'c','i','e','n',EOS,LA_TH,LA_I,S1,LA_E,LA_N,SIL,
	16,'c','i','e','n','t','o',EOS,LA_TH,LA_I,S1,LA_E,LA_N,SBOUND,LA_T,LA_O,SIL,
	18,'c','i','e','n','t','o','s',EOS,LA_TH,LA_I,S1,LA_E,LA_N,SBOUND,LA_T,LA_O,LA_S,SIL,
	9, 'm','i','l',EOS,LA_M,S1,LA_I,LA_L,SIL,
	14, 'm','i','l','e','s',EOS,LA_M,S1,LA_I,SBOUND,LA_L,LA_E,LA_S,SIL,
	15,'m','i','l','l',0xf3,'n',EOS,LA_M,LA_I,SBOUND,LA_LL,S1,LA_O,LA_N,SIL,	//0xf3='ó'
	20,'m','i','l','l','o','n','e','s',EOS,LA_M,LA_I,SBOUND,LA_LL,S1,LA_O,LA_N,SBOUND,LA_E,LA_S,SIL,
    //29, 'm','i','l',' ','m','i','l','l','o','n','e','s',EOS,LA_M,S1,LA_I,LA_L,WBOUND,LA_M,LA_I,SBOUND,LA_LL,S1,LA_O,LA_N,SBOUND,LA_E,LA_S,SIL,
    22, 'm','i','l','l','a','r','d','o','s',EOS,LA_M,LA_I,SBOUND,LA_LL,S1,LA_A,LA_R,SBOUND,LA_DH,LA_O,LA_S,SIL,
    15,'b','i','l','l',0xf3,'n',EOS,LA_B,LA_I,SBOUND,LA_LL,S1,LA_O,LA_N,SIL,	//0xf3='ó'
	20,'b','i','l','l','o','n','e', 's',EOS,LA_B,LA_I,SBOUND,LA_LL,S1,LA_O,LA_N,SBOUND,LA_E,LA_S,SIL,
	//29, 'm','i','l',' ','b','i','l','l','o','n','e','s',EOS,LA_M,S1,LA_I,LA_L,WBOUND,LA_B,LA_I,SBOUND,LA_LL,S1,LA_O,LA_N,SBOUND,LA_E,LA_S,SIL,
	17,'t','r','i','l','l',0xf3,'n',EOS,LA_T,LA_R,LA_I,SBOUND,LA_LL,S1,LA_O,LA_N,SIL,	//0xf3='ó'
	22,'t','r','i','l','l','o','n','e','s',EOS,LA_T,LA_R,LA_I,SBOUND,LA_LL,S1,LA_O,SBOUND,LA_N,LA_E,LA_S,SIL,
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
	LA_G,    LA_R,    S1,     LA_A,    SBOUND, LA_DH,    LA_O,WBOUND ,    SIL
};

/* CAB Removed no longer used
unsigned char      pdash[] = {
	LA_G,   LA_I,    S1,     LA_O,    LA_N,WBOUND,     SIL
};
*/

const unsigned char pminus[] = {
	LA_M,    S1,     LA_E,    SBOUND, LA_N,    LA_O,    LA_S,WBOUND,     SIL
};


const unsigned char p0[] = {
	LA_TH,   S1,     LA_E,    LA_R,    LA_O,WBOUND,     SIL
};

/* GL 10/12/98,  set 1 to "un" all the time */
const unsigned char p1[] = {
	   S1,  LA_U,    SBOUND, LA_N,    LA_O, WBOUND,     SIL
//    LA_U,    LA_N,   WBOUND,     SIL
};

const unsigned char p1_uno[] = {
	   S1,  LA_U,    SBOUND, LA_N,    LA_O, WBOUND,     SIL
};

const unsigned char p1_un[] = {
    LA_U,    LA_N,   WBOUND,     SIL
};

const unsigned char p2[] = {
	LA_D, S1,     LA_O,    LA_S,WBOUND,     SIL
};

const unsigned char p3[] = {
	LA_T,    LA_R,  S1,       LA_E,    LA_S,WBOUND,     SIL
};

const unsigned char p4[] = {
	LA_K,    LA_U,    S1,     LA_A,    SBOUND, LA_T,    LA_R,    LA_O,WBOUND,     SIL
};

const unsigned char p5[] = {
	LA_TH,   S1,      LA_I,    LA_N,    SBOUND, LA_K,    LA_O,WBOUND,     SIL
};

const unsigned char p6[] = {
	LA_S,    S1,      LA_E, SBOUND,   LA_I,    LA_S,WBOUND,     SIL
};


const unsigned char p7[] = {
	LA_S,    LA_I,    S1,      LA_E,    SBOUND, LA_T,    LA_E,WBOUND,     SIL
};
 
const unsigned char ph7[] = {
	LA_S,    S1, LA_E,        LA_T,SBOUND,     LA_E,WBOUND,     SIL
};
        
const unsigned char p8[] = {
	S1,      LA_O,    SBOUND, LA_CH,   LA_O,WBOUND,     SIL
};


const unsigned char p9[] = {
	LA_N,    LA_U, S1,   LA_E,SBOUND,  LA_BH,   LA_E,WBOUND,     SIL
};

const unsigned char ph9[] = {
	LA_N,      LA_O,        SBOUND, LA_BH,   LA_E,WBOUND,     SIL
};
        


const unsigned char up0[] = {
	LA_TH,        LA_E,    LA_R,    LA_O,SBOUND,     SIL
};


const unsigned char up1[] = {
	     LA_U,    SBOUND, LA_N,    LA_O,SBOUND,     SIL
};



const unsigned char up2[] = {
	LA_D,         LA_O,    LA_S,SBOUND,     SIL
};


const unsigned char up3[] = {
	LA_T,    LA_R,         LA_E,    LA_S,SBOUND,     SIL
};


const unsigned char up4[] = {
	LA_K,    LA_U,       LA_A,    SBOUND, LA_T,    LA_R,    LA_O,SBOUND,     SIL
};


const unsigned char up5[] = {
	LA_TH,       LA_I,    LA_N,    SBOUND, LA_K,    LA_O,SBOUND,     SIL
};


const unsigned char up6[] = {
	LA_S,      LA_E,    LA_I,    LA_S,SBOUND,     SIL
};


const unsigned char up7[] = {
	LA_S,    LA_I,      LA_E,    SBOUND, LA_T,    LA_E,SBOUND,     SIL
};

/* CAB 04/24/2002 Removed not used 
unsigned char      uph7[] = {
	LA_S,    LA_E,        LA_T,SBOUND,     LA_E,SBOUND,     SIL
};
*/

const unsigned char up8[] = {
	   LA_O,    SBOUND, LA_CH,   LA_O,SBOUND,     SIL
};


const unsigned char up9[] = {
	LA_N,    LA_U,    LA_E,SBOUND,  LA_BH,   LA_E,SBOUND,     SIL
};

/* CAB 04/24/2002 Removed not used
unsigned char      uph9[] = {
	LA_N,     LA_O,        SBOUND, LA_BH,   LA_E,SBOUND,     SIL
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
	LA_TH,   LA_I,    S1,     LA_E,    LA_N,    SIL
};

const unsigned char phundredp[] = {
	LA_TH,   LA_I,    S1,     LA_E,    LA_N,    SBOUND, LA_T,    LA_O,  SIL
};

const unsigned char phundred[] = {
	LA_TH,   LA_I,    S1,     LA_E,    LA_N,    SBOUND, LA_T,    LA_O,LA_S,  SIL
};

const unsigned char pfivehun[] = {
	LA_K,   LA_I,    SBOUND, LA_N, LA_I,  S1,   LA_E,    LA_N,
		SBOUND, LA_T,    LA_O,LA_S, SIL
};

const unsigned char pthousand[] = {
	LA_M,    S2,    LA_I,    LA_L,   SBOUND,   SIL
};

const unsigned char pmillion[] = {
        LA_M,    LA_I,    SBOUND, LA_LL,   S2,     LA_O,
	SBOUND, LA_N,         SIL
};

const unsigned char pmilliones[] = {
        LA_M,    LA_I,    SBOUND, LA_LL,   S2,     LA_O,
	SBOUND, LA_N,    LA_E,    LA_S,     SIL
};


const unsigned char ponemillion[] = {
        LA_U,  LA_N,   LA_M,    LA_I,    SBOUND, LA_LL,   S2,     LA_O,
	SBOUND, LA_N,     SIL
};

const unsigned char pordonemillion[] = {
	LA_M, LA_I, SBOUND, LA_LL, LA_O, SBOUND, LA_N, S1, LA_E, SBOUND, LA_S, LA_I, SBOUND, LA_M, LA_O, SIL
};

const unsigned char p10[] = {
	LA_D,    LA_I,    S1,     LA_E,    LA_TH,WBOUND,     SIL
};

const unsigned char p11[] = {
	S1,     LA_O,SBOUND,     LA_N,    LA_TH,    LA_E,WBOUND,     SIL
};

const unsigned char p12[] = {
	LA_D,    S1,     LA_O,    SBOUND, LA_TH,    LA_E,WBOUND,     SIL
};

const unsigned char p13[] = {
	LA_T,    LA_R,    S1,     LA_E,    SBOUND, LA_TH,    LA_E,WBOUND,     SIL
};

const unsigned char p14[] = {
	LA_K,    LA_A,    SBOUND, LA_T,    S1,     LA_O,    LA_R,    SBOUND,
	LA_TH,    LA_E,WBOUND,     SIL
};

const unsigned char p15[] = {
	LA_K,    S1,     LA_I,    LA_N,SBOUND,     LA_TH,    LA_E,WBOUND,     SIL
};

const unsigned char p16[] = {
	LA_D,    LA_I,         LA_E, SBOUND,   LA_TH,    LA_I,   
	SBOUND, LA_S,    S1,     LA_E,SBOUND,    LA_I,    LA_S,WBOUND,     SIL
};

const unsigned char p17[] = {
	LA_D,    LA_I,         LA_E,  SBOUND,  LA_TH,    LA_I,   
	LA_S,    LA_I,    S1,     LA_E,    SBOUND, LA_T,    LA_E,WBOUND,     SIL
};

const unsigned char p18[] = {
	LA_D,    LA_I,         LA_E,    SBOUND, LA_TH,  LA_I,
	S1,     LA_O,    SBOUND, LA_CH,   LA_O,WBOUND, SIL
};

const unsigned char p19[] = {
	LA_D,    LA_I,         LA_E,    SBOUND, LA_TH,         LA_I,    
	LA_N,    LA_U,    S1,     LA_E,    SBOUND, LA_BH,   LA_E,WBOUND,     SIL
};

const unsigned char *const pteens[] = {
	p10,    p11,    p12,    p13,    p14,
	p15,    p16,    p17,    p18,    p19
};

const unsigned char pnone[] = {
	SIL
};

const unsigned char p20[] = {
	LA_V,         LA_E,    LA_I,    LA_N,  SBOUND, LA_T,SIL
};

const unsigned char p21[] = {
	LA_V,        LA_E,    LA_I,    LA_N,  SBOUND, LA_T, LA_YX,SBOUND,
		S1, LA_U, LA_N, LA_O, SIL
};

const unsigned char p20only[] = {
	LA_V,    S1,     LA_E,    LA_I,    LA_N,    SBOUND, LA_T,    LA_E,     SIL
};

const unsigned char p30[] = {
	LA_T,    LA_R,         LA_E,    LA_I,    LA_N,    SBOUND,
	LA_T,    LA_A,     SIL
};

const unsigned char p40[] = {
	LA_K,    LA_U,    LA_A,    SBOUND, LA_R,         LA_E,    LA_N,
	SBOUND, LA_T,    LA_A,     SIL
};

const unsigned char p50[] = {
	LA_TH,   LA_I,    LA_N,    SBOUND, LA_K,    LA_U,         LA_E,
	LA_N, SBOUND,    LA_T,    LA_A,     SIL
};

const unsigned char p60[] = {
	LA_S,    LA_E,    SBOUND, LA_S,         LA_E,    LA_N,    SBOUND,
	LA_T,    LA_A,     SIL
};

const unsigned char p70[] = {
	LA_S,    LA_E,    SBOUND, LA_T,         LA_E,    LA_N,    SBOUND,
	LA_T,    LA_A,     SIL
};

const unsigned char p80[] = {
	LA_O,    SBOUND, LA_CH,        LA_E,    LA_N,    SBOUND,
	LA_T,    LA_A,     SIL
};

const unsigned char p90[] = {
	LA_N,    LA_O,SBOUND,     LA_B,         LA_E,    LA_N,SBOUND,     LA_T,    LA_A,     SIL
};

const unsigned char *const ptens[] = {
	pnone,  pnone,  p20,    p30,    p40,
	p50,    p60,    p70,    p80,    p90
};

const unsigned char ppence[] = {
	LA_P,    LA_E,    SBOUND, LA_N,    S2,     LA_I,    SBOUND,
	LA_K,    LA_E,WBOUND,     SIL
};

const unsigned char ppercent[] = {
	WBOUND, LA_P,    S1,     LA_O,    LA_R,    WBOUND, LA_TH,   LA_I,
	S1,     LA_E,    LA_N,    SBOUND, LA_T,    LA_O,WBOUND,     SIL
};

const unsigned char pcent[] = {
	WBOUND, LA_TH,   LA_E,    LA_N,    SBOUND, LA_T,    S1,     LA_A,
	SBOUND, LA_BH,   LA_O,WBOUND,     SIL
};

const unsigned char peuro[] = {
	WBOUND, S1, LA_E, LA_U, SBOUND, LA_R, LA_O, SIL
};

const unsigned char ppound[] = {
	WBOUND, LA_L,    S1,     LA_I,    SBOUND, LA_BH,   LA_R,    LA_A,WBOUND,     SIL
};

const unsigned char pdollar[] = {
	WBOUND, LA_D,    S1,     LA_O,    SBOUND, LA_L,    LA_A,    LA_R,WBOUND,     SIL
};

const unsigned char pand[] = {
	WBOUND, VPSTART, S2,    LA_I,WBOUND,     SIL
};

const unsigned char ppoint[] = {
	LA_P,    S1,     LA_U,    LA_N,    SBOUND, LA_T,    LA_O,WBOUND,     SIL
};

const unsigned char pcomma[] = {
	LA_K,    S1,     LA_O,    SBOUND, LA_M,    LA_A,	WBOUND,     SIL
};

const unsigned char pjan[] = {
	LA_E,    SBOUND, LA_N,    S1,     LA_E,    SBOUND, LA_R,    LA_O,WBOUND,     SIL
};

const unsigned char pfeb[] = {
	LA_F,    LA_E,    SBOUND, LA_B,    LA_R,    S1,     LA_E,    SBOUND,
	LA_R,    LA_O,WBOUND,     SIL
};

const unsigned char pmar[] = {
	LA_M,    S1,     LA_A,    LA_R,    SBOUND, LA_TH,   LA_O,WBOUND,     SIL
};

const unsigned char papr[] = {
	LA_A,    SBOUND, LA_B,    LA_R,    S1,     LA_I,    LA_L,WBOUND,     SIL
};

const unsigned char pmay[] = {
	LA_M,    S1,     LA_A,    SBOUND, LA_YH,   LA_O,WBOUND,     SIL
};

const unsigned char pjun[] = {
	LA_J,    S1,     LA_U,    SBOUND, LA_N,    LA_I,    LA_O,WBOUND,     SIL
};

const unsigned char pjul[] = {
	LA_J,    S1,     LA_U,    SBOUND, LA_L,    LA_I,    LA_O,WBOUND,     SIL

};

const unsigned char paug[] = {
	LA_A,    SBOUND, LA_G,    S1,     LA_O,    LA_S,    SBOUND,
	LA_T,    LA_O,WBOUND,     SIL
};

const unsigned char psep[] = {
	LA_S,    LA_E,    LA_P,    SBOUND, LA_T,    LA_I,    S1,     LA_E,
	LA_M,    SBOUND, LA_B,    LA_R,    LA_E,WBOUND,     SIL
};

const unsigned char poct[] = {
	LA_O,    LA_K,    SBOUND, LA_T,    S1,     LA_U,    SBOUND, LA_B,
	LA_R,    LA_E,WBOUND,     SIL
};

const unsigned char pnov[] = {
	LA_N,    LA_O,    SBOUND, LA_B,    LA_I,    S1,     LA_E,    LA_M,
	SBOUND, LA_B,    LA_R,    LA_E,WBOUND,     SIL
};

const unsigned char pdec[] = {
	LA_D,    LA_I,    SBOUND, LA_TH,   LA_I,    S1,     LA_E,    LA_M,
	SBOUND, LA_B,    LA_R,    LA_E,WBOUND,     SIL
};

const unsigned char *const pmonths[] = {
	pjan,   pfeb,   pmar,   papr,   pmay,   pjun,
	pjul,   paug,   psep,   poct,   pnov,   pdec,
	pjan,   papr,   paug,   pdec,
	NULL
};

const unsigned char p0th[] = {
	LA_TH,   S1,     LA_E,    SBOUND, LA_R,    SIL
};

const unsigned char p1st[] = {
	LA_P,    LA_R,    LA_I,    SBOUND, LA_M,    S1,     LA_E,    LA_R,WBOUND,     SIL
};

const unsigned char p2nd[] = {
	LA_S,    LA_E,    SBOUND, LA_G,    S1,     LA_U,    LA_N,    SBOUND,
	LA_D,    SIL
};

const unsigned char p3rd[] = {
	LA_T,    LA_E,    LA_R,    SBOUND, LA_TH,   S1,     LA_E,    LA_R,WBOUND,     SIL
};

const unsigned char p4th[] = {
	LA_K,    LA_U,    S1,     LA_A,    SBOUND, LA_R,    LA_T,    SIL
};

const unsigned char p5th[] = {
	LA_K,    S1,     LA_I,    LA_N,    SBOUND, LA_T,     SIL
};

const unsigned char p6th[] = {
	LA_S,    S1,     LA_E,    LA_K,    SBOUND, LA_S,    LA_T,   SIL
};

const unsigned char p7th[] = {
	LA_S,    S1,     LA_E,    LA_P,    SBOUND, LA_T,    LA_I,    SBOUND,
	LA_M,    SIL
};

const unsigned char p8th[] = {
	LA_O,    LA_K,    SBOUND, LA_T,    S1,     LA_A,    SBOUND,
	LA_B,    SIL
};

const unsigned char p9th[] = {
	LA_N,    LA_O,    SBOUND, LA_B,    S1,     LA_E,    SBOUND,
	LA_N,    SIL
};

const unsigned char *const pordunits[] = {
	p0th,   p1st,   p2nd,   p3rd,   p4th,
	p5th,   p6th,   p7th,   p8th,   p9th
};

const unsigned char p10th[] = {
	LA_D,    S1,     LA_E,    SBOUND, LA_TH,   LA_I,    SBOUND,
	LA_M,       SIL
};

const unsigned char p11th[] = {
	LA_U,  LA_N,   LA_D,       S1,     LA_E,    SBOUND, LA_TH,   LA_I,    SBOUND,
	LA_M,            SIL
};

const unsigned char p12th[] = {
	LA_D, LA_W, SBOUND, LA_O,  LA_D,    S1,     LA_E,    SBOUND, LA_TH,   LA_I,    SBOUND,
	LA_M,            SIL
};

const unsigned char p13th[] = {
	LA_D,    S1,     LA_E,    SBOUND, LA_TH,   LA_I,    SBOUND,
	LA_M,    LA_O, SBOUND, LA_T, LA_E, LA_R, SBOUND, LA_TH, LA_I, SIL
};

const unsigned char p14th[] = {
	LA_D,    S1,     LA_E,    SBOUND, LA_TH,   LA_I,    SBOUND,
	LA_M,    LA_O, SBOUND, LA_K,       LA_U,    S1,     LA_A,    SBOUND, LA_R,    LA_T,    
	SIL

};

const unsigned char p15th[] = {
	LA_D,    S1,     LA_E,    SBOUND, LA_TH,   LA_I,    SBOUND,
	LA_M,    LA_O, SBOUND, LA_K,       S1,     LA_I,    LA_N,    SBOUND, LA_T,            SIL
};

const unsigned char p16th[] = {
	LA_D,    S1,     LA_E,    SBOUND, LA_TH,   LA_I,    SBOUND,
	LA_M,    LA_O, SBOUND,  LA_S,      S1,     LA_E,    LA_K, LA_S,       SBOUND, LA_T,    SIL
};

const unsigned char p17th[] = {
	LA_D,    S1,     LA_E,    SBOUND, LA_TH,   LA_I,    SBOUND,
	LA_M,    LA_O, SBOUND, LA_S,       S1,     LA_E,    LA_P,    SBOUND, LA_T,    LA_I,    SBOUND,
	LA_M,    SIL
};

const unsigned char p18th[] = {
	LA_D,    S1,     LA_E,    SBOUND, LA_TH,   LA_I,    SBOUND,
	LA_M,    LA_O, SBOUND,  LA_O,      LA_K,    SBOUND, LA_T,    S1,     LA_A,    SBOUND,
	LA_B,    SIL
};

const unsigned char p19th[] = {
	LA_D,    S1,     LA_E,    SBOUND, LA_TH,   LA_I,    SBOUND,
	LA_M,    LA_O, SBOUND, LA_N,       LA_O,    SBOUND, LA_B,    S1,     LA_E,    SBOUND,
	LA_N,    SIL
};

const unsigned char *const pordteens[] = {
	p10th,  p11th,  p12th,  p13th,  p14th,
	p15th,  p16th,  p17th,  p18th,  p19th
};

const unsigned char p20th[] = {
	LA_B, LA_I, SBOUND, LA_J, S1, LA_E, SBOUND, LA_S, LA_I, SBOUND, LA_M,  SIL
};

const unsigned char p30th[] = {
	LA_T, LA_R, LA_I, SBOUND,  LA_J, S1, LA_E, SBOUND, LA_S, LA_I, SBOUND, LA_M,  SIL
};

const unsigned char p40th[] = {
	LA_K, LA_WX, LA_A, SBOUND, LA_D, LA_R, LA_A, SBOUND,  LA_J, S1, LA_E,
		SBOUND, LA_S, LA_I, SBOUND, LA_M,  SIL
};

const unsigned char p50th[] = {
	LA_K, LA_WX, LA_I, LA_N, SBOUND, LA_K, LA_WX, LA_A, SBOUND,    LA_J, S1, LA_E,
		SBOUND, LA_S, LA_I, SBOUND, LA_M,  SIL
};

const unsigned char p60th[] = {
	LA_S, LA_E, LA_K, SBOUND, LA_S, LA_A, SBOUND,        LA_J, S1, LA_E,
		SBOUND, LA_S, LA_I, SBOUND, LA_M,  SIL
};

const unsigned char p70th[] = {
	LA_S, LA_E, LA_P, SBOUND, LA_T, LA_WX, LA_A,  SBOUND, LA_J, S1, LA_E,
		SBOUND, LA_S, LA_I, SBOUND, LA_M,  SIL
};

const unsigned char p80th[] = {
	LA_O, LA_K, SBOUND, LA_T, LA_O, SBOUND, LA_J, S1, LA_E,
		SBOUND, LA_S, LA_I, SBOUND, LA_M,  SIL
};

const unsigned char p90th[] = {
	LA_N, LA_O, SBOUND, LA_N, LA_A, SBOUND, LA_J, S1, LA_E,
		SBOUND, LA_S, LA_I, SBOUND, LA_M,  SIL
};

const unsigned char pordonehundred[] = {
	LA_TH, LA_E, LA_N, SBOUND, LA_T, S1, LA_E, SBOUND, LA_S, LA_I, SBOUND, LA_M,  SIL
};

const unsigned char pordthousand[] = {
	LA_M,    S1,     LA_I,    LA_L, S1, LA_E, SBOUND, LA_S, LA_I, SBOUND, LA_M,  SIL
};

const unsigned char *const pordtens[] = {
	pnone,  pnone,  p20th,  p30th,  p40th,
	p50th,  p60th,  p70th,  p80th,  p90th
};

/* ************************ NOT USED ***************************** */
#if 0
const unsigned char phalf[] = {
	LA_M,    S1,     LA_E,    SBOUND, LA_D,    LA_I,    LA_O,WBOUND,     SIL
};

const unsigned char phalves[] = {
	LA_M,    S1,     LA_E,    SBOUND, LA_D,    LA_I,    LA_O,    LA_S,WBOUND,     SIL
};
#endif // 0
/* *************************************************************** */

/* GL 11/01/1996 use mitad to replace medio for 1/2 */
const unsigned char phalf[] = {
	LA_M,	LA_I,	SBOUND, LA_T,	S1,		LA_A,    LA_D,	WBOUND,     SIL
};

const unsigned char phalves[] = {
	LA_M,	LA_I,	SBOUND, LA_T,	S1,		LA_A,    LA_D,	LA_S,	WBOUND,     SIL
};

/* GL 10/12/1996, to fix the ordinal number error */
const unsigned char pordonehundred_g[] = {
	LA_J, LA_E, LA_N, SBOUND, LA_T, S1, LA_E, SBOUND, LA_S, LA_I, SBOUND, LA_M, SIL
};

const unsigned char o200[] = {
	LA_D, S1, LA_U, SIL
};

const unsigned char o300[] = {
	LA_T, LA_R, S1, LA_I, SIL
};

const unsigned char o400[] = {
	LA_K, LA_U, S1, LA_A, SBOUND, LA_D, LA_R, LA_I, LA_N, SIL
};

const unsigned char o500[] = {
	LA_K, S1, LA_I, LA_N, SIL
};

const unsigned char o600[] = {
	LA_S, S1, LA_E, LA_K, LA_S, SIL
};

const unsigned char o700[] = {
	LA_S, S1, LA_E, LA_P, SBOUND, LA_T, LA_I, LA_N, SIL
};

const unsigned char o800[] = {
	S1, LA_O, LA_K, SBOUND, LA_T, LA_I, LA_N, SIL
};

const unsigned char o900[] = {
	LA_N, S1, LA_O, SBOUND, LA_N, LA_I, LA_N, SIL
};

const unsigned char sdic[] = 
{
    20,'a','n','u','n','c','i','a',EOS,LA_A,SBOUND,LA_N,S1,LA_U,LA_N,SBOUND,LA_TH,LA_I,LA_A,SPECIALWORD,SIL,
    22,'a','n','u','n','c','i','a','n',EOS,LA_A,SBOUND,LA_N,S1,LA_U,LA_N,SBOUND,LA_TH,LA_I,LA_A,LA_N,SPECIALWORD,SIL,
    20,'a','n','u','n','c','i',0xf3,EOS,LA_A,SBOUND,LA_N,LA_U,LA_N,SBOUND,LA_TH,LA_I,S1,LA_O,SPECIALWORD,SIL,	//0xf3='ó'
    27,'a','n','u','n','c','i','a','r','o','n',EOS,LA_A,SBOUND,LA_N,LA_U,LA_N,SBOUND,LA_TH,LA_I,S1,LA_A,SBOUND,LA_R,LA_O,LA_N,SPECIALWORD,SIL,
    22,'c','o','n','t','e','s','t','a',EOS,LA_K,LA_O,LA_N,SBOUND,LA_T,S1,LA_E,LA_S,SBOUND,LA_T,LA_A,SPECIALWORD,SIL,
    24,'c','o','n','t','e','s','t','a','n',EOS,LA_K,LA_O,LA_N,SBOUND,LA_T,S1,LA_E,LA_S,SBOUND,LA_T,LA_A,LA_N,SPECIALWORD,SIL,
    22,'c','o','n','t','e','s','t',0xf3,EOS,LA_K,LA_O,LA_N,SBOUND,LA_T,LA_E,LA_S,SBOUND,LA_T,S1,LA_O,SPECIALWORD,SIL,	//0xf3='ó'
    29,'c','o','n','t','e','s','t','a','r','o','n',EOS,LA_K,LA_O,LA_N,SBOUND,LA_T,LA_E,LA_S,SBOUND,LA_T,S1,LA_A,SBOUND,LA_R,LA_O,LA_N,SPECIALWORD,SIL,
    13,'d','i','c','e',EOS,LA_D,S1,LA_I,SBOUND,LA_TH,LA_E,SPECIALWORD,SIL,
    15,'d','i','c','e','n',EOS,LA_D,S1,LA_I,SBOUND,LA_TH,LA_E,LA_N,SPECIALWORD,SIL,
    13,'d','i','j','o',EOS,LA_D,S1,LA_I,SBOUND,LA_J,LA_O,SPECIALWORD,SIL,
    20,'d','i','j','e','r','o','n',EOS,LA_D,LA_I,SBOUND,LA_J,S1,LA_E,SBOUND,LA_R,LA_O,LA_N,SPECIALWORD,SIL,
    21,'e','x','c','l','a','m','a',EOS,LA_E,LA_K,LA_S,SBOUND,LA_K,LA_L,S1,LA_A,SBOUND,LA_M,LA_A,SPECIALWORD,SIL,
    23,'e','x','c','l','a','m','a','n',EOS,LA_E,LA_K,LA_S,SBOUND,LA_K,LA_L,S1,LA_A,SBOUND,LA_M,LA_A,LA_N,SPECIALWORD,SIL,
    21,'e','x','c','l','a','m',0xf3,EOS,LA_E,LA_K,LA_S,SBOUND,LA_K,LA_L,LA_A,SBOUND,LA_M,S1,LA_O,SPECIALWORD,SIL,	//0xf3='ó'
    28,'e','x','c','l','a','m','a','r','o','n',EOS,LA_E,LA_K,LA_S,SBOUND,LA_K,LA_L,LA_A,SBOUND,LA_M,S1,LA_A,SBOUND,LA_R,LA_O,LA_N,SPECIALWORD,SIL,
    19,'e','x','p','l','i','c','a',EOS,LA_E,LA_K,LA_S,LA_P,SBOUND,LA_L,S1,LA_I,SBOUND,LA_K,LA_A,SPECIALWORD,SIL,
    21,'e','x','p','l','i','c','a','n',EOS,LA_E,LA_K,LA_S,SBOUND,LA_P,LA_L,S1,LA_I,SBOUND,LA_K,LA_A,LA_N,SPECIALWORD,SIL,
    19,'e','x','p','l','i','c',0xf3,EOS,LA_E,LA_K,LA_S,SBOUND,LA_P,LA_L,LA_I,SBOUND,LA_K,S1,LA_O,SPECIALWORD,SIL,	//0xf3='ó'
    28,'e','x','p','l','i','c','a','r','o','n',EOS,LA_E,LA_K,LA_S,SBOUND,LA_P,LA_L,LA_I,SBOUND,LA_K,S1,LA_A,SBOUND,LA_R,LA_O,LA_N,SPECIALWORD,SIL,
    12,'m','w','i','z','i',EOS,LA_K,S1,LA_O,LA_P,LA_I,SIL,20,'p','r','e','g','u','n','t','a',EOS,LA_P,LA_R,LA_E,LA_G,S1,LA_U,LA_N,LA_T,LA_A,SPECIALWORD,SIL,
    24,'p','r','e','g','u','n','t','a','n',EOS,LA_P,LA_R,LA_E,SBOUND,LA_G,S1,LA_U,LA_N,SBOUND,LA_T,LA_A,LA_N,SPECIALWORD,SIL,
    22,'p','r','e','g','u','n','t',0xf3,EOS,LA_P,LA_R,LA_E,SBOUND,LA_G,LA_U,LA_N,SBOUND,LA_T,S1,LA_O,SPECIALWORD,SIL,	//0xf3='ó'
    29,'p','r','e','g','u','n','t','a','r','o','n',EOS,LA_P,LA_R,LA_E,SBOUND,LA_G,LA_U,SBOUND,LA_N,LA_T,S1,LA_A,SBOUND,LA_R,LA_O,LA_N,SPECIALWORD,SIL,
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
	5,      'q', 'u', 0xe9, EOS,SIL,	//0xe9='é'
	5,      'q', 'u', 0xe9, EOS, SIL,	//0xe9='é'
	6,      'c', 'u', 0xe1,'l', EOS, SIL,	//0xe1='á'
	8,      'c', 'u', 0xe1,'l','e','s', EOS, SIL,	//0xe1='á'
	7,      'q', 'u', 'i', 0xe9, 'n', EOS, SIL,	//0xe9='é'
	9,      'q', 'u', 'i', 0xe9, 'n','e','s', EOS, SIL,	//0xe9='é'
	10,		'q', 'u', 'i', 0xe9, 't','r','e', 's',EOS,SIL,	//0xe9='é'
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
 * Phonetic feature values allowed in place_la_lts[]
 *
 * Note: Spanish does not currently use FDENTAL or FALVEL.  It is
 * not clear what the proper value for [l] should be, possibly dental.
 * FLABIAL      0000001          p, b, m, f, v
 * FDENTAL      0000002          th, dh, d$
 * FPALATL      0000004          sh, zh, ch, jh
 * FALVEL       0000010          t, d, n, en, s, z, tx (not l,r,dx)
 * FVELAR       0000020          k, g, nx
 * FGLOTAL      0000040          q, tq (signals glottal stop)
 * F2BACKI      0000100          iy, y, yu, ir (LA_I LA_YX)
 * F2BACKF      0000200          iy, y, ey (LA_I LA_YX LA_E)
 */

const short place_la_lts[] = {
      0,                             /* LA_SI   */
      0,                             /* LA_A    */
      0,                             /* LA_E    */
      F2BACKI | F2BACKF,             /* LA_I    */
      0,                             /* LA_O    */
      0,                             /* LA_U    */
      FPALATL,                       /* LA_WX   */
      FPALATL | F2BACKI | F2BACKF,   /* LA_YX   */
      FALVEL,                        /* LA_RR   */
      FALVEL,                        /* LA_L    */
      FPALATL,                       /* LA_LL   */
      FLABIAL,                       /* LA_M    */
      FALVEL,                        /* LA_N    */
      FPALATL,                       /* LA_NH   */
      FLABIAL,                       /* LA_F    */
      FALVEL,                        /* LA_S    */
      FVELAR,                        /* LA_J    */
      FDENTAL,                       /* LA_TH   */
      FLABIAL,                       /* LA_BH   */
      FDENTAL,                       /* LA_DH   */
      FVELAR,                        /* LA_GH   */
      FPALATL,                       /* LA_YH   */
      FLABIAL,                       /* LA_P    */
      FLABIAL,                       /* LA_B    */
      FDENTAL,                       /* LA_T    */
      FDENTAL,                       /* LA_D    */
      FVELAR,                        /* LA_K    */
      FVELAR,                        /* LA_G    */
      FPALATL,                       /* LA_CH   */
      FPALATL+F2BACKI+F2BACKF,       /* LA_Y    */
      FALVEL,                        /* LA_R    */
      FGLOTTAL,                       /* LA_Q    */
      FALVEL,                        /* LA_Z    */
      FLABIAL,                       /* LA_W    */
      FVELAR,                        /* LA_NX   */

#ifdef LA_SH
      FPALATL,                       /* LA_SH   */
#endif

#ifdef LA_V
      FLABIAL,                       /* LA_V    */
#endif

      F2BACKI | F2BACKF,             /* LA_IX   */
      FLABIAL,                       /* LA_MX   */
      FLABIAL                        /* LA_PH   */
};

/*
 * Phonetic features:
 *
 *      FSYLL   0000001  Syllabics: vowels and dipthongs
 *      FVOICD  0000002  Voiced segments
 *      FVOWEL  0000004  Vowels
 *      FSEMIV  0000010  Semivowels (Y, W, YX, WX)
 *      FSONOR  0000020  [-obst], except LA_Q  which is [-sonor, -obst]
 *      FOBST   0000040  Occlusives, except LA_Q is [-obst]
 *      FPLOSV  0000100  Plosives, but not affricates
 *      FNASAL  0000200  Nasals
 *      FCONSON 0000400  [-syll], except for  SI and  LA_Q
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

const unsigned short featb_la_lts[PHO_SYM_TOT] = {
      /* [ SIL ]  */      FSONOR,
      /* [ LA_A ]  */      FSYLL+FVOICD+FVOWEL+FSONOR,
      /* [ LA_E ]  */      FSYLL+FVOICD+FVOWEL+FSONOR,
      /* [ LA_I ]  */      FSYLL+FVOICD+FVOWEL+FSONOR+FDIPTH,
      /* [ LA_O ]  */      FSYLL+FVOICD+FVOWEL+FSONOR,
      /* [ LA_U ]  */      FSYLL+FVOICD+FVOWEL+FSONOR+FDIPTH,
      /* [ LA_WX ] */      FVOICD+FSONOR+FSEMIV+FDIPTH,
      /* [ LA_YX ] */      FVOICD+FSONOR+FSEMIV+FDIPTH,
      /* [ LA_RR ] */      FVOICD+FSONOR+FCONSON,
      /* [ LA_L ]  */      FVOICD+FSONOR+FCONSON+FSONCON,
      /* [ LA_LL ] */      FVOICD+FSONOR+FCONSON+FSONCON,
      /* [ LA_M ]  */      FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ LA_N ]  */      FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ LA_NH ] */      FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ LA_F ]  */      FOBST+FCONSON,
      /* [ LA_S ]  */      FOBST+FCONSON,
      /* [ LA_J ]  */      FOBST+FCONSON,
      /* [ LA_TH ] */      FOBST+FCONSON,
      /* [ LA_BH ] */      FVOICD+FSONOR+FCONSON+FOBST,
      /* [ LA_DH ] */      FVOICD+FSONOR+FCONSON+FOBST,
      /* [ LA_GH ] */      FVOICD+FSONOR+FCONSON+FOBST,
      /* [ LA_YH ] */      FVOICD+FOBST+FCONSON+FBURST,   /* 23-Apr-86, 5-May */
      /* [ LA_P ]  */      FOBST+FPLOSV+FCONSON+FBURST,
      /* [ LA_B ]  */      FVOICD+FOBST+FPLOSV+FCONSON+FBURST+FVBAR,
      /* [ LA_T ]  */      FOBST+FPLOSV+FCONSON+FBURST,
      /* [ LA_D ]  */      FVOICD+FOBST+FPLOSV+FCONSON+FBURST+FVBAR,
      /* [ LA_K ]  */      FOBST+FPLOSV+FCONSON+FBURST,
      /* [ LA_G ]  */      FVOICD+FOBST+FPLOSV+FCONSON+FBURST+FVBAR,
      /* [ LA_CH ] */      FOBST+FCONSON+FBURST,
      /* [ LA_Y ]  */      FOBST+FVOICD+FCONSON,      /* 12-May-86       */
      /* [ LA_R ]  */      FVOICD+FSONOR+FCONSON,
      /* [ LA_Q ]  */      FVOICD+FGLOTTAL,
      /* [ LA_Z ]  */      FVOICD+FOBST+FCONSON,      /* 5-May-86        */
      /* [ LA_W ]  */      FVOICD+FOBST+FCONSON+FSEMIV,
      /* [ LA_NX ] */      FVOICD+FSONOR+FNASAL+FCONSON,

#ifdef LA_SH
      /* [ LA_SH ] */      FOBST+FCONSON,
#endif

#ifdef LA_V
      /* [ LA_V ]  */      FVOICD+FSONOR+FCONSON,
#endif

      /* [ LA_IX ]  */     FVOICD+FSONOR,      /* 7-May: not a vowel     */
      /* [ LA_MX]   */     FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ LA_PH ]  */     FOBST+FCONSON,
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