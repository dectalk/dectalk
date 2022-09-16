/*
 ***********************************************************************
 *                                                                      
 *                           Coryright (c)                              
 *    © Digital Equipment Corporation 1996, 1997 All rights reserved.    
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
 *								
 */

unsigned char ptt2tp[] = {
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

U16 lsctype[] = {
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

	IGNORE,
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

 unsigned char nabtab[] = {
	34,	'c',	'l',	EOS,
	E_TH, E_E, E_N, SBOUND, E_T, E_I, SBOUND, E_L, S2, E_I, SBOUND, E_T, E_R, E_O, SIL,
	E_TH, E_E, E_N, SBOUND, E_T, E_I, SBOUND, E_L, S2, E_I, SBOUND, E_T, E_R, E_O, E_S, SIL,

	32,	'd',	'm',	EOS,
	E_D, E_E, SBOUND, E_TH, S1, E_I, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, SIL,
	E_D, E_E, SBOUND, E_TH, S1, E_I, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, E_S, SIL,

	32,	'd',	'l',	EOS,
	E_D, E_E, SBOUND, E_TH, E_I, SBOUND, E_L, S2, E_I, SBOUND, E_T, E_R, E_O, SIL,
	E_D, E_E, SBOUND, E_TH, E_I, SBOUND, E_L, S2, E_I, SBOUND, E_T, E_R, E_O, E_S, SIL,

	19,	'g',	EOS,
	E_G, E_R, S1, E_A, SBOUND, E_M, E_O, SIL,
	E_G, E_R, S1, E_A, SBOUND, E_M, E_O, E_S, SIL,

	20,	'g',	'r',	EOS,
	E_G, E_R, S1, E_A, SBOUND, E_M, E_O, SIL,
	E_G, E_R, S1, E_A, SBOUND, E_M, E_O, E_S, SIL,

	32,	'k',	'l',	EOS,
	E_K, E_I, SBOUND, E_L, E_O, SBOUND, E_L, S2, E_I, SBOUND, E_T, E_R, E_O, SIL,
	E_K, E_I, SBOUND, E_L, E_O, SBOUND, E_L, S2, E_I, SBOUND, E_T, E_R, E_O, E_S, SIL,

	32,	'k',	'm',	EOS,
	E_K, E_I, SBOUND, E_L, S1, E_O, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, SIL,
	E_K, E_I, SBOUND, E_L, S1, E_O, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, E_S, SIL,

	44,	'm',	'2',	EOS,
	E_M, E_E, SBOUND, E_T, E_R, E_O, MBOUND, E_K, E_U, E_A, SBOUND, E_D, E_R, S2, E_A, SBOUND, E_D, E_O, E_S, SIL,
	E_M, E_E, SBOUND, E_T, E_R, E_O, E_S, MBOUND, E_K, E_U, E_A, SBOUND, E_D, E_R, S2, E_A, SBOUND, E_D, E_O, E_S, SIL,

	59,	'k',	'm',	'2',	EOS,
	E_K, E_I, SBOUND, E_L, S1, E_O, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, MBOUND, E_K, E_U, E_A, SBOUND, E_D, E_R, S2, E_A, SBOUND, E_D, E_O, E_S, SIL,
	E_K, E_I, SBOUND, E_L, S1, E_O, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, E_S, MBOUND, E_K, E_U, E_A, SBOUND, E_D, E_R, S2, E_A, SBOUND, E_D, E_O, E_S, SIL,

	50,	'k',	'm',	'/',	'h',	EOS,
	E_K, E_I, SBOUND, E_L, S1, E_O, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, MBOUND, E_P, E_O, E_R, MBOUND, E_O, SBOUND, E_R, E_A, SIL,
	E_K, E_I, SBOUND, E_L, S1, E_O, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, E_S, MBOUND, E_P, E_O, E_R, MBOUND, E_O, SBOUND, E_R, E_A, SIL,

	32,	'k',	'g',	EOS,
	E_K, E_I, SBOUND, E_L, E_O, SBOUND, E_G, E_R, S1, E_A, SBOUND, E_M, E_O, SIL,
	E_K, E_I, SBOUND, E_L, E_O, SBOUND, E_G, E_R, S1, E_A, SBOUND, E_M, E_O, E_S, SIL,

	32,	'k',	'w',	EOS,
	E_K, E_I, SBOUND, E_L, E_O, SBOUND, E_B, S2, E_A, SBOUND, E_T, E_I, E_O, SIL,
	E_K, E_I, SBOUND, E_L, E_O, SBOUND, E_B, S2, E_A, SBOUND, E_T, E_I, E_O, E_S, SIL,

	49,	'k',	'p',	'h',	EOS,
	E_K, E_I, SBOUND, E_L, S1, E_O, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, MBOUND, E_P, E_O, E_R, MBOUND, E_O, SBOUND, E_R, E_A, SIL,
	E_K, E_I, SBOUND, E_L, S1, E_O, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, E_S, MBOUND, E_P, E_O, E_R, MBOUND, E_O, SBOUND, E_R, E_A, SIL,

	32,	'm',	'm',	EOS,
	E_M, E_I, SBOUND, E_L, S1, E_I, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, SIL,
	E_M, E_I, SBOUND, E_L, S1, E_I, SBOUND, E_M, E_E, SBOUND, E_T, E_R, E_O, E_S, SIL,

	32,	'm',	'l',	EOS,
	E_M, E_I, SBOUND, E_L, E_I, SBOUND, E_L, S2, E_I, SBOUND, E_T, E_R, E_O, SIL,
	E_M, E_I, SBOUND, E_L, E_I, SBOUND, E_L, S2, E_I, SBOUND, E_T, E_R, E_O, E_S, SIL,

	32,	'm',	'g',	EOS,
	E_M, E_I, SBOUND, E_L, E_I, SBOUND, E_G, E_R, S1, E_A, SBOUND, E_M, E_O, SIL,
	E_M, E_I, SBOUND, E_L, E_I, SBOUND, E_G, E_R, S1, E_A, SBOUND, E_M, E_O, E_S, SIL,

	19,	'°',	EOS,
	E_G, E_R, S1, E_A, SBOUND, E_D, E_O, SIL,
	E_G, E_R, S1, E_A, SBOUND, E_D, E_O, E_S, SIL,

	52,	'°', 'c', 	EOS,
	E_G, E_R, S1, E_A, SBOUND, E_D, E_O, WBOUND, E_TH, E_E, E_N, SBOUND, E_T, S1, E_I, SBOUND, E_G, E_R, S2, E_A, SBOUND, E_D, E_O, SIL,
	E_G, E_R, S1, E_A, SBOUND, E_D, E_O, WBOUND, E_TH, E_E, E_N, SBOUND, E_T, S1, E_I, SBOUND, E_G, E_R, S2, E_A, SBOUND, E_D, E_O, E_S, SIL

 };



/*
 * This table, which has the same basic
 * format as the number abbreviation table, contains
 * the names and the pronounciation of the number words.
 * There is only a single phoneme string.
 */
/* GL 11/06/98, BATS#721 add this table to support currency reading */
unsigned char nwdtab[] = {
	11,'c','i','e','n',EOS,E_TH,E_I,S1,E_E,E_N,SIL,
	16,'c','i','e','n','t','o',EOS,E_TH,E_I,S1,E_E,E_N,SBOUND,E_T,E_O,SIL,
	18,'c','i','e','n','t','o','s',EOS,E_TH,E_I,S1,E_E,E_N,SBOUND,E_T,E_O,E_S,SIL,
	9, 'm','i','l',EOS,E_M,S1,E_I,E_L,SIL,
	14, 'm','i','l','e','s',EOS,E_M,S1,E_I,SBOUND,E_L,E_E,E_S,SIL,
	15,'m','i','l','l','ó','n',EOS,E_M,E_I,SBOUND,E_LL,S1,E_O,E_N,SIL,
	20,'m','i','l','l','o','n','e','s',EOS,E_M,E_I,SBOUND,E_LL,S1,E_O,E_N,SBOUND,E_E,E_S,SIL,
    //29, 'm','i','l',' ','m','i','l','l','o','n','e','s',EOS,E_M,S1,E_I,E_L,WBOUND,E_M,E_I,SBOUND,E_LL,S1,E_O,E_N,SBOUND,E_E,E_S,SIL,
    22, 'm','i','l','l','a','r','d','o','s',EOS,E_M,E_I,SBOUND,E_LL,S1,E_A,E_R,SBOUND,E_DH,E_O,E_S,SIL,
    15,'b','i','l','l','ó','n',EOS,E_B,E_I,SBOUND,E_LL,S1,E_O,E_N,SIL,
	20,'b','i','l','l','o','n','e', 's',EOS,E_B,E_I,SBOUND,E_LL,S1,E_O,E_N,SBOUND,E_E,E_S,SIL,
	//29, 'm','i','l',' ','b','i','l','l','o','n','e','s',EOS,E_M,S1,E_I,E_L,WBOUND,E_B,E_I,SBOUND,E_LL,S1,E_O,E_N,SBOUND,E_E,E_S,SIL,
	17,'t','r','i','l','l','ó','n',EOS,E_T,E_R,E_I,SBOUND,E_LL,S1,E_O,E_N,SIL,
	22,'t','r','i','l','l','o','n','e','s',EOS,E_T,E_R,E_I,SBOUND,E_LL,S1,E_O,SBOUND,E_N,E_E,E_S,SIL,
     0
};                   


unsigned char m_jan[]="ene";
unsigned char m_feb[]="feb";
unsigned char m_mar[]="mar";
unsigned char m_apr[]="abr";
unsigned char m_may[]="may";
unsigned char m_jun[]="jun";
unsigned char m_jul[]="jul";
unsigned char m_aug[]="ago";
unsigned char m_sep[]="sep";
unsigned char m_oct[]="oct";
unsigned char m_nov[]="nov";
unsigned char m_dec[]="dic";                                   


unsigned char  *months[] = {
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

unsigned char      pdegree[] = {
	E_G,    E_R,    S1,     E_A,    SBOUND, E_DH,    E_O,WBOUND ,    SIL
};


unsigned char      pdash[] = {
	E_G,   E_I,    S1,     E_O,    E_N,WBOUND,     SIL
};


unsigned char  pminus[] = {
	E_M,    S1,     E_E,    SBOUND, E_N,    E_O,    E_S,WBOUND,     SIL
};


unsigned char p0[] = {
	E_TH,   S1,     E_E,    E_R,    E_O,WBOUND,     SIL
};


/* GL 10/12/98,  set 1 to "un" all the time */
unsigned char      p1[] = {
//	   S1,  E_U,    SBOUND, E_N,    E_O, WBOUND,     SIL
    E_U,    E_N,   WBOUND,     SIL
};

unsigned char      p1_uno[] = {
	   S1,  E_U,    SBOUND, E_N,    E_O, WBOUND,     SIL
};

unsigned char      p1_un[] = {
    E_U,    E_N,   WBOUND,     SIL
};


unsigned char      p2[] = {
	E_D, S1,     E_O,    E_S,WBOUND,     SIL
};




unsigned char      p3[] = {
	E_T,    E_R,  S1,       E_E,    E_S,WBOUND,     SIL
};


unsigned char      p4[] = {
	E_K,    E_U,    S1,     E_A,    SBOUND, E_T,    E_R,    E_O,WBOUND,     SIL
};


unsigned char      p5[] = {
	E_TH,   S1,      E_I,    E_N,    SBOUND, E_K,    E_O,WBOUND,     SIL
};


unsigned char      p6[] = {
	E_S,    S1,      E_E, SBOUND,   E_I,    E_S,WBOUND,     SIL
};


unsigned char      p7[] = {
	E_S,    E_I,    S1,      E_E,    SBOUND, E_T,    E_E,WBOUND,     SIL
};
 
unsigned char     ph7[] = {
	E_S,    S1, E_E,        E_T,SBOUND,     E_E,WBOUND,     SIL
};
        
unsigned char      p8[] = {
	S1,      E_O,    SBOUND, E_CH,   E_O,WBOUND,     SIL
};


unsigned char      p9[] = {
	E_N,    E_U, S1,   E_E,SBOUND,  E_BH,   E_E,WBOUND,     SIL
};

unsigned char      ph9[] = {
	E_N,      E_O,        SBOUND, E_BH,   E_E,WBOUND,     SIL
};
        


unsigned char up0[] = {
	E_TH,        E_E,    E_R,    E_O,SBOUND,     SIL
};


unsigned char      up1[] = {
	     E_U,    SBOUND, E_N,    E_O,SBOUND,     SIL
};



unsigned char      up2[] = {
	E_D,         E_O,    E_S,SBOUND,     SIL
};


unsigned char      up3[] = {
	E_T,    E_R,         E_E,    E_S,SBOUND,     SIL
};


unsigned char      up4[] = {
	E_K,    E_U,       E_A,    SBOUND, E_T,    E_R,    E_O,SBOUND,     SIL
};


unsigned char      up5[] = {
	E_TH,       E_I,    E_N,    SBOUND, E_K,    E_O,SBOUND,     SIL
};


unsigned char      up6[] = {
	E_S,      E_E,    E_I,    E_S,SBOUND,     SIL
};


unsigned char      up7[] = {
	E_S,    E_I,      E_E,    SBOUND, E_T,    E_E,SBOUND,     SIL
};
 
unsigned char      uph7[] = {
	E_S,    E_E,        E_T,SBOUND,     E_E,SBOUND,     SIL
};




unsigned char      up8[] = {
	   E_O,    SBOUND, E_CH,   E_O,SBOUND,     SIL
};


unsigned char      up9[] = {
	E_N,    E_U,    E_E,SBOUND,  E_BH,   E_E,SBOUND,     SIL
};

unsigned char      uph9[] = {
	E_N,     E_O,        SBOUND, E_BH,   E_E,SBOUND,     SIL
};



unsigned char   *punits[] = {
	p0,     p1_un,     p2,     p3,     p4,
	p5,     p6,     p7,     p8,     p9
};
unsigned char   *upunits[] = {
	up0,     up1,     up2,     up3,     up4,
	up5,     up6,     up7,     up8,     up9
};

unsigned char     ponehundred[] = {
	E_TH,   E_I,    S1,     E_E,    E_N,    SIL
};
unsigned char     phundredp[] = {
	E_TH,   E_I,    S1,     E_E,    E_N,    SBOUND, E_T,    E_O,  SIL
};

unsigned char     phundred[] = {
	E_TH,   E_I,    S1,     E_E,    E_N,    SBOUND, E_T,    E_O,E_S,  SIL
};
unsigned char     pfivehun[] = {
	E_K,   E_I,    SBOUND, E_N, E_I,  S1,   E_E,    E_N,
		SBOUND, E_T,    E_O,E_S, SIL
};


unsigned char     pthousand[] = {
	E_M,    S2,    E_I,    E_L,   SBOUND,   SIL
};


unsigned char     pmillion[] = {
        E_M,    E_I,    SBOUND, E_LL,   S2,     E_O,
	SBOUND, E_N,         SIL
};

unsigned char     pmilliones[] = {
        E_M,    E_I,    SBOUND, E_LL,   S2,     E_O,
	SBOUND, E_N,    E_E,    E_S,     SIL
};


unsigned char    ponemillion[] = {
        E_U,  E_N,   E_M,    E_I,    SBOUND, E_LL,   S2,     E_O,
	SBOUND, E_N,     SIL
};

unsigned char   pordonemillion[] = {
	E_M, E_I, SBOUND, E_LL, E_O, SBOUND, E_N, S1, E_E, SBOUND, E_S, E_I, SBOUND, E_M, E_O, SIL
};




unsigned char     p10[]   = {                                      
	E_D,    E_I,    S1,     E_E,    E_TH,WBOUND,     SIL
};


unsigned char     p11[]   = {
	S1,     E_O,SBOUND,     E_N,    E_TH,    E_E,WBOUND,     SIL
};


unsigned char     p12[]   = {
	E_D,    S1,     E_O,    SBOUND, E_TH,    E_E,WBOUND,     SIL
};


unsigned char     p13[]   = {
	E_T,    E_R,    S1,     E_E,    SBOUND, E_TH,    E_E,WBOUND,     SIL
};


unsigned char     p14[]   = {
	E_K,    E_A,    SBOUND, E_T,    S1,     E_O,    E_R,    SBOUND,
	E_TH,    E_E,WBOUND,     SIL
};


unsigned char     p15[]   = {
	E_K,    S1,     E_I,    E_N,SBOUND,     E_TH,    E_E,WBOUND,     SIL
};


unsigned char     p16[]   = {
	E_D,    E_I,         E_E, SBOUND,   E_TH,    E_I,   
	SBOUND, E_S,    S1,     E_E,SBOUND,    E_I,    E_S,WBOUND,     SIL
};


unsigned char     p17[]   = {
	E_D,    E_I,         E_E,  SBOUND,  E_TH,    E_I,   
	E_S,    E_I,    S1,     E_E,    SBOUND, E_T,    E_E,WBOUND,     SIL
};


unsigned char     p18[]   = {
	E_D,    E_I,         E_E,    SBOUND, E_TH,  E_I,
	S1,     E_O,    SBOUND, E_CH,   E_O,WBOUND, SIL
};


unsigned char     p19[]   = {
	E_D,    E_I,         E_E,    SBOUND, E_TH,         E_I,    
	E_N,    E_U,    S1,     E_E,    SBOUND, E_BH,   E_E,WBOUND,     SIL
};


unsigned char     *pteens[] = {
	p10,    p11,    p12,    p13,    p14,
	p15,    p16,    p17,    p18,    p19
};


unsigned char    pnone[] = {
	SIL
};


unsigned char     p20[]   = {
	E_V,         E_E,    E_I,    E_N,  SBOUND, E_T,SIL
};
unsigned char     p21[]   = {
	E_V,        E_E,    E_I,    E_N,  SBOUND, E_T, E_YX,SBOUND,
		S1, E_U, E_N, E_O, SIL
};

unsigned char     p20only[]       = {
	E_V,    S1,     E_E,    E_I,    E_N,    SBOUND, E_T,    E_E,     SIL
};


unsigned char     p30[]   = {
	E_T,    E_R,         E_E,    E_I,    E_N,    SBOUND,
	E_T,    E_A,     SIL
};


unsigned char     p40[]   = {
	E_K,    E_U,    E_A,    SBOUND, E_R,         E_E,    E_N,
	SBOUND, E_T,    E_A,     SIL
};


unsigned char     p50[]   = {
	E_TH,   E_I,    E_N,    SBOUND, E_K,    E_U,         E_E,
	E_N, SBOUND,    E_T,    E_A,     SIL
};


unsigned char     p60[]   = {
	E_S,    E_E,    SBOUND, E_S,         E_E,    E_N,    SBOUND,
	E_T,    E_A,     SIL
};


unsigned char     p70[]   = {
	E_S,    E_E,    SBOUND, E_T,         E_E,    E_N,    SBOUND,
	E_T,    E_A,     SIL
};


unsigned char     p80[]   = {
	E_O,    SBOUND, E_CH,        E_E,    E_N,    SBOUND,
	E_T,    E_A,     SIL
};


unsigned char     p90[]   = {
	E_N,    E_O,SBOUND,     E_B,         E_E,    E_N,SBOUND,     E_T,    E_A,     SIL
};


unsigned char    *ptens[]        = {
	pnone,  pnone,  p20,    p30,    p40,
	p50,    p60,    p70,    p80,    p90
};


unsigned char     ppence[] = {
	E_P,    E_E,    SBOUND, E_N,    S2,     E_I,    SBOUND,
	E_K,    E_E,WBOUND,     SIL
};


unsigned char     ppercent[] = {
	WBOUND, E_P,    S1,     E_O,    E_R,    WBOUND, E_TH,   E_I,
	S1,     E_E,    E_N,    SBOUND, E_T,    E_O,WBOUND,     SIL
};
	

unsigned char     pcent[] = {
	WBOUND, E_TH,   E_E,    E_N,    SBOUND, E_T,    S1,     E_A,
	SBOUND, E_BH,   E_O,WBOUND,     SIL
};


unsigned char     ppound[] = {
	WBOUND, E_L,    S1,     E_I,    SBOUND, E_BH,   E_R,    E_A,WBOUND,     SIL
};


unsigned char     pdollar[] = {
	WBOUND, E_D,    S1,     E_O,    SBOUND, E_L,    E_A,    E_R,WBOUND,     SIL
};


unsigned char    pand[] = {
	WBOUND, VPSTART, S2,    E_I,WBOUND,     SIL
};


unsigned char     ppoint[] = {
	E_P,    S1,     E_U,    E_N,    SBOUND, E_T,    E_O,WBOUND,     SIL
};

unsigned char     pcomma[] = {
	E_K,    S1,     E_O,    SBOUND, E_M,    E_A,	WBOUND,     SIL
};


unsigned char    pjan[] = {
	E_E,    SBOUND, E_N,    S1,     E_E,    SBOUND, E_R,    E_O,WBOUND,     SIL
};


unsigned char    pfeb[] = {
	E_F,    E_E,    SBOUND, E_B,    E_R,    S1,     E_E,    SBOUND,
	E_R,    E_O,WBOUND,     SIL
};


unsigned char    pmar[] = {
	E_M,    S1,     E_A,    E_R,    SBOUND, E_TH,   E_O,WBOUND,     SIL
};


unsigned char   papr[] = {
	E_A,    SBOUND, E_B,    E_R,    S1,     E_I,    E_L,WBOUND,     SIL
};


unsigned char    pmay[] = {
	E_M,    S1,     E_A,    SBOUND, E_YH,   E_O,WBOUND,     SIL
};


unsigned char    pjun[] = {
	E_J,    S1,     E_U,    SBOUND, E_N,    E_I,    E_O,WBOUND,     SIL
};


unsigned char    pjul[] = {
	E_J,    S1,     E_U,    SBOUND, E_L,    E_I,    E_O,WBOUND,     SIL

};


unsigned char    paug[] = {
	E_A,    SBOUND, E_G,    S1,     E_O,    E_S,    SBOUND,
	E_T,    E_O,WBOUND,     SIL
};


unsigned char    psep[] = {
	E_S,    E_E,    E_P,    SBOUND, E_T,    E_I,    S1,     E_E,
	E_M,    SBOUND, E_B,    E_R,    E_E,WBOUND,     SIL
};


unsigned char   poct[] = {
	E_O,    E_K,    SBOUND, E_T,    S1,     E_U,    SBOUND, E_B,
	E_R,    E_E,WBOUND,     SIL
};


unsigned char   pnov[] = {
	E_N,    E_O,    SBOUND, E_B,    E_I,    S1,     E_E,    E_M,
	SBOUND, E_B,    E_R,    E_E,WBOUND,     SIL
};


unsigned char   pdec[] = {
	E_D,    E_I,    SBOUND, E_TH,   E_I,    S1,     E_E,    E_M,
	SBOUND, E_B,    E_R,    E_E,WBOUND,     SIL
};


unsigned char     *pmonths[] = {
	pjan,   pfeb,   pmar,   papr,   pmay,   pjun,
	pjul,   paug,   psep,   poct,   pnov,   pdec,
	pjan,   papr,   paug,   pdec,
	NULL
};


unsigned char     p0th[] = {
	E_TH,   S1,     E_E,    SBOUND, E_R,    SIL
};


unsigned char     p1st[] = {
	E_P,    E_R,    E_I,    SBOUND, E_M,    S1,     E_E,    E_R,WBOUND,     SIL
};


unsigned char     p2nd[] = {
	E_S,    E_E,    SBOUND, E_G,    S1,     E_U,    E_N,    SBOUND,
	E_D,    SIL
};


unsigned char     p3rd[] = {
	E_T,    E_E,    E_R,    SBOUND, E_TH,   S1,     E_E,    E_R,WBOUND,     SIL
};


unsigned char     p4th[] = {
	E_K,    E_U,    S1,     E_A,    SBOUND, E_R,    E_T,    SIL
};


unsigned char     p5th[] = {
	E_K,    S1,     E_I,    E_N,    SBOUND, E_T,     SIL
};


unsigned char     p6th[] = {
	E_S,    S1,     E_E,    E_K,    SBOUND, E_S,    E_T,   SIL
};


unsigned char      p7th[] = {
	E_S,    S1,     E_E,    E_P,    SBOUND, E_T,    E_I,    SBOUND,
	E_M,    SIL
};


unsigned char     p8th[] = {
	E_O,    E_K,    SBOUND, E_T,    S1,     E_A,    SBOUND,
	E_B,    SIL
};


unsigned char     p9th[] = {
	E_N,    E_O,    SBOUND, E_B,    S1,     E_E,    SBOUND,
	E_N,    SIL
};

unsigned char   *pordunits[] = {
	p0th,   p1st,   p2nd,   p3rd,   p4th,
	p5th,   p6th,   p7th,   p8th,   p9th
};


unsigned char    p10th[] = {
	E_D,    S1,     E_E,    SBOUND, E_TH,   E_I,    SBOUND,
	E_M,       SIL
};
			  

unsigned char     p11th[] = {
	E_U,  E_N,   E_D,       S1,     E_E,    SBOUND, E_TH,   E_I,    SBOUND,
	E_M,            SIL
};

unsigned char      p12th[] = {
	E_D, E_W, SBOUND, E_O,  E_D,    S1,     E_E,    SBOUND, E_TH,   E_I,    SBOUND,
	E_M,            SIL
};

unsigned char     p13th[] = {
	E_D,    S1,     E_E,    SBOUND, E_TH,   E_I,    SBOUND,
	E_M,    E_O, SBOUND, E_T, E_E, E_R, SBOUND, E_TH, E_I, SIL
};

unsigned char     p14th[] = {
	E_D,    S1,     E_E,    SBOUND, E_TH,   E_I,    SBOUND,
	E_M,    E_O, SBOUND, E_K,       E_U,    S1,     E_A,    SBOUND, E_R,    E_T,    
	SIL

};

unsigned char     p15th[] = {
	E_D,    S1,     E_E,    SBOUND, E_TH,   E_I,    SBOUND,
	E_M,    E_O, SBOUND, E_K,       S1,     E_I,    E_N,    SBOUND, E_T,            SIL
};

unsigned char     p16th[] = {
	E_D,    S1,     E_E,    SBOUND, E_TH,   E_I,    SBOUND,
	E_M,    E_O, SBOUND,  E_S,      S1,     E_E,    E_K, E_S,       SBOUND, E_T,    SIL
};

unsigned char      p17th[] = {
	E_D,    S1,     E_E,    SBOUND, E_TH,   E_I,    SBOUND,
	E_M,    E_O, SBOUND, E_S,       S1,     E_E,    E_P,    SBOUND, E_T,    E_I,    SBOUND,
	E_M,    SIL
};

unsigned char      p18th[] = {
	E_D,    S1,     E_E,    SBOUND, E_TH,   E_I,    SBOUND,
	E_M,    E_O, SBOUND,  E_O,      E_K,    SBOUND, E_T,    S1,     E_A,    SBOUND,
	E_B,    SIL
};

unsigned char      p19th[] = {
	E_D,    S1,     E_E,    SBOUND, E_TH,   E_I,    SBOUND,
	E_M,    E_O, SBOUND, E_N,       E_O,    SBOUND, E_B,    S1,     E_E,    SBOUND,
	E_N,    SIL
};

unsigned char    *pordteens[] = {
	p10th,  p11th,  p12th,  p13th,  p14th,
	p15th,  p16th,  p17th,  p18th,  p19th
};

unsigned char      p20th[] = {
	E_B, E_I, SBOUND, E_J, S1, E_E, SBOUND, E_S, E_I, SBOUND, E_M,  SIL
};

unsigned char      p30th[] = {
	E_T, E_R, E_I, SBOUND,  E_J, S1, E_E, SBOUND, E_S, E_I, SBOUND, E_M,  SIL
};

unsigned char      p40th[] = {
	E_K, E_WX, E_A, SBOUND, E_D, E_R, E_A, SBOUND,  E_J, S1, E_E,
		SBOUND, E_S, E_I, SBOUND, E_M,  SIL
};

unsigned char      p50th[] = {
	E_K, E_WX, E_I, E_N, SBOUND, E_K, E_WX, E_A, SBOUND,    E_J, S1, E_E,
		SBOUND, E_S, E_I, SBOUND, E_M,  SIL
};

unsigned char      p60th[] = {
	E_S, E_E, E_K, SBOUND, E_S, E_A, SBOUND,        E_J, S1, E_E,
		SBOUND, E_S, E_I, SBOUND, E_M,  SIL
};

unsigned char      p70th[] = {
	E_S, E_E, E_P, SBOUND, E_T, E_WX, E_A,  SBOUND, E_J, S1, E_E,
		SBOUND, E_S, E_I, SBOUND, E_M,  SIL
};

unsigned char      p80th[] = {
	E_O, E_K, SBOUND, E_T, E_O, SBOUND, E_J, S1, E_E,
		SBOUND, E_S, E_I, SBOUND, E_M,  SIL
};

unsigned char      p90th[] = {
	E_N, E_O, SBOUND, E_N, E_A, SBOUND, E_J, S1, E_E,
		SBOUND, E_S, E_I, SBOUND, E_M,  SIL
};

unsigned char     pordonehundred[] = {
	E_TH, E_E, E_N, SBOUND, E_T, S1, E_E, SBOUND, E_S, E_I, SBOUND, E_M,  SIL
};


unsigned char     pordthousand[] = {
	E_M,    S1,     E_I,    E_L, S1, E_E, SBOUND, E_S, E_I, SBOUND, E_M,  SIL
};


unsigned char    *pordtens[]     = {
	pnone,  pnone,  p20th,  p30th,  p40th,
	p50th,  p60th,  p70th,  p80th,  p90th
};

#if 0
unsigned char     phalf[] = {
	E_M,    S1,     E_E,    SBOUND, E_D,    E_I,    E_O,WBOUND,     SIL
};
unsigned char      phalves[] = {
	E_M,    S1,     E_E,    SBOUND, E_D,    E_I,    E_O,    E_S,WBOUND,     SIL
};
#endif
/* GL 11/01/1996 use mitad to replace medio for 1/2 */
unsigned char     phalf[] = {
	E_M,	E_I,	SBOUND, E_T,	S1,		E_A,    E_D,	WBOUND,     SIL
};
unsigned char      phalves[] = {
	E_M,	E_I,	SBOUND, E_T,	S1,		E_A,    E_D,	E_S,	WBOUND,     SIL
};

/* GL 10/12/1996, to fix the ordinal number error */
unsigned char     pordonehundred_g[] = {
	E_J, E_E, E_N, SBOUND, E_T, S1, E_E, SBOUND, E_S, E_I, SBOUND, E_M, SIL
};
unsigned char     o200[] = {
	E_D, S1, E_U, SIL
};
unsigned char     o300[] = {
	E_T, E_R, S1, E_I, SIL
};
unsigned char     o400[] = {
	E_K, E_U, S1, E_A, SBOUND, E_D, E_R, E_I, E_N, SIL
};
unsigned char     o500[] = {
	E_K, S1, E_I, E_N, SIL
};
unsigned char     o600[] = {
	E_S, S1, E_E, E_K, E_S, SIL
};
unsigned char     o700[] = {
	E_S, S1, E_E, E_P, SBOUND, E_T, E_I, E_N, SIL
};
unsigned char     o800[] = {
	S1, E_O, E_K, SBOUND, E_T, E_I, E_N, SIL
};
unsigned char     o900[] = {
	E_N, S1, E_O, SBOUND, E_N, E_I, E_N, SIL
};





unsigned char sdic[] = 
{
	
    20,'a','n','u','n','c','i','a',EOS,E_A,SBOUND,E_N,S1,E_U,E_N,SBOUND,E_TH,E_I,E_A,SPECIALWORD,SIL,
    22,'a','n','u','n','c','i','a','n',EOS,E_A,SBOUND,E_N,S1,E_U,E_N,SBOUND,E_TH,E_I,E_A,E_N,SPECIALWORD,SIL,
    20,'a','n','u','n','c','i','ó',EOS,E_A,SBOUND,E_N,E_U,E_N,SBOUND,E_TH,E_I,S1,E_O,SPECIALWORD,SIL,
    27,'a','n','u','n','c','i','a','r','o','n',EOS,E_A,SBOUND,E_N,E_U,E_N,SBOUND,E_TH,E_I,S1,E_A,SBOUND,E_R,E_O,E_N,SPECIALWORD,SIL,
    22,'c','o','n','t','e','s','t','a',EOS,E_K,E_O,E_N,SBOUND,E_T,S1,E_E,E_S,SBOUND,E_T,E_A,SPECIALWORD,SIL,
    24,'c','o','n','t','e','s','t','a','n',EOS,E_K,E_O,E_N,SBOUND,E_T,S1,E_E,E_S,SBOUND,E_T,E_A,E_N,SPECIALWORD,SIL,
    22,'c','o','n','t','e','s','t','ó',EOS,E_K,E_O,E_N,SBOUND,E_T,E_E,E_S,SBOUND,E_T,S1,E_O,SPECIALWORD,SIL,
    29,'c','o','n','t','e','s','t','a','r','o','n',EOS,E_K,E_O,E_N,SBOUND,E_T,E_E,E_S,SBOUND,E_T,S1,E_A,SBOUND,E_R,E_O,E_N,SPECIALWORD,SIL,
    13,'d','i','c','e',EOS,E_D,S1,E_I,SBOUND,E_TH,E_E,SPECIALWORD,SIL,
    15,'d','i','c','e','n',EOS,E_D,S1,E_I,SBOUND,E_TH,E_E,E_N,SPECIALWORD,SIL,
    13,'d','i','j','o',EOS,E_D,S1,E_I,SBOUND,E_J,E_O,SPECIALWORD,SIL,
    20,'d','i','j','e','r','o','n',EOS,E_D,E_I,SBOUND,E_J,S1,E_E,SBOUND,E_R,E_O,E_N,SPECIALWORD,SIL,
    21,'e','x','c','l','a','m','a',EOS,E_E,E_K,E_S,SBOUND,E_K,E_L,S1,E_A,SBOUND,E_M,E_A,SPECIALWORD,SIL,
    23,'e','x','c','l','a','m','a','n',EOS,E_E,E_K,E_S,SBOUND,E_K,E_L,S1,E_A,SBOUND,E_M,E_A,E_N,SPECIALWORD,SIL,
    21,'e','x','c','l','a','m','ó',EOS,E_E,E_K,E_S,SBOUND,E_K,E_L,E_A,SBOUND,E_M,S1,E_O,SPECIALWORD,SIL,
    28,'e','x','c','l','a','m','a','r','o','n',EOS,E_E,E_K,E_S,SBOUND,E_K,E_L,E_A,SBOUND,E_M,S1,E_A,SBOUND,E_R,E_O,E_N,SPECIALWORD,SIL,
    19,'e','x','p','l','i','c','a',EOS,E_E,E_K,E_S,E_P,SBOUND,E_L,S1,E_I,SBOUND,E_K,E_A,SPECIALWORD,SIL,
    21,'e','x','p','l','i','c','a','n',EOS,E_E,E_K,E_S,SBOUND,E_P,E_L,S1,E_I,SBOUND,E_K,E_A,E_N,SPECIALWORD,SIL,
    19,'e','x','p','l','i','c','ó',EOS,E_E,E_K,E_S,SBOUND,E_P,E_L,E_I,SBOUND,E_K,S1,E_O,SPECIALWORD,SIL,
    28,'e','x','p','l','i','c','a','r','o','n',EOS,E_E,E_K,E_S,SBOUND,E_P,E_L,E_I,SBOUND,E_K,S1,E_A,SBOUND,E_R,E_O,E_N,SPECIALWORD,SIL,
    12,'m','w','i','z','i',EOS,E_K,S1,E_O,E_P,E_I,SIL,20,'p','r','e','g','u','n','t','a',EOS,E_P,E_R,E_E,E_G,S1,E_U,E_N,E_T,E_A,SPECIALWORD,SIL,
    24,'p','r','e','g','u','n','t','a','n',EOS,E_P,E_R,E_E,SBOUND,E_G,S1,E_U,E_N,SBOUND,E_T,E_A,E_N,SPECIALWORD,SIL,
    22,'p','r','e','g','u','n','t','ó',EOS,E_P,E_R,E_E,SBOUND,E_G,E_U,E_N,SBOUND,E_T,S1,E_O,SPECIALWORD,SIL,
    29,'p','r','e','g','u','n','t','a','r','o','n',EOS,E_P,E_R,E_E,SBOUND,E_G,E_U,SBOUND,E_N,E_T,S1,E_A,SBOUND,E_R,E_O,E_N,SPECIALWORD,SIL,
	EOS
};

unsigned char whdic[] = 
{
	0	
};         



unsigned char spwhword[] = {
	7,      'd', 'ó', 'n', 'd', 'e', EOS, SIL,
	7,      'd', 'o', 'n', 'd', 'e', EOS, SIL,
	8,      'a', 'd', 'ó', 'n', 'd', 'e',EOS, SIL,
	6,      'c', 'ó', 'm', 'o', EOS, SIL,
	8,      'c', 'u', 'á', 'n', 'd', 'o',EOS, SIL,
	8,      'q', 'u', 'é', EOS, E_K,S1,E_E,SIL,
	8,      'q', 'u', 'e', EOS,E_K,SEMPH,E_E, SIL,
	6,      'c', 'u', 'á','l', EOS, SIL,
	6,      'c', 'u', 'á','l','e','s', EOS, SIL,
	7,      'q', 'u', 'i', 'é', 'n', EOS, SIL,
	9,      'q', 'u', 'i', 'é', 'n','e','s', EOS, SIL,
	8,      'c', 'u', 'á','l', 'e','s',EOS, SIL,
	8,      'c', 'u', 'á', 'n', 't', 'o',        EOS, SIL,
	8,      'c', 'u', 'á', 'n', 't', 'a',        EOS, SIL,
	9,      'c', 'u', 'á', 'n', 't', 'a','s',EOS, SIL,
	9,      'c', 'u', 'á', 'n', 't', 'o','s',EOS, SIL,
	EOS
};
unsigned char prewhword[] = {
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
 * F2BACKI      0000100          iy, y, yu, ir (E_I E_YX)
 * F2BACKF      0000200          iy, y, ey (E_I E_YX E_E)
 */

short place_sp_lts[] = {
      0,                             /* E_SI   */
      0,                             /* E_A    */
      0,                             /* E_E    */
      F2BACKI | F2BACKF,             /* E_I    */
      0,                             /* E_O    */
      0,                             /* E_U    */
      FPALATL,                       /* E_WX   */
      FPALATL | F2BACKI | F2BACKF,   /* E_YX   */
      FALVEL,                        /* E_RR   */
      FALVEL,                        /* E_L    */
      FPALATL,                       /* E_LL   */
      FLABIAL,                       /* E_M    */
      FALVEL,                        /* E_N    */
      FPALATL,                       /* E_NH   */
      FLABIAL,                       /* E_F    */
      FALVEL,                        /* E_S    */
      FVELAR,                        /* E_J    */
      FDENTAL,                       /* E_TH   */
      FLABIAL,                       /* E_BH   */
      FDENTAL,                       /* E_DH   */
      FVELAR,                        /* E_GH   */
      FPALATL,                       /* E_YH   */
      FLABIAL,                       /* E_P    */
      FLABIAL,                       /* E_B    */
      FDENTAL,                       /* E_T    */
      FDENTAL,                       /* E_D    */
      FVELAR,                        /* E_K    */
      FVELAR,                        /* E_G    */
      FPALATL,                       /* E_CH   */
      FPALATL+F2BACKI+F2BACKF,       /* E_Y    */
      FALVEL,                        /* E_R    */
      FGLOTAL,                       /* E_Q    */
      FALVEL,                        /* E_Z    */
      FLABIAL,                       /* E_W    */
      FVELAR,                        /* E_NX   */

#ifdef E_SH
      FPALATL,                       /* E_SH   */
#endif

#ifdef E_V
      FLABIAL,                       /* E_V    */
#endif

      F2BACKI | F2BACKF,             /* E_IX   */
      FLABIAL,                       /* E_MX   */
      FLABIAL                        /* E_PH   */
      };

/*
 * Phonetic features:
 *
 *      FSYLL   0000001  Syllabics: vowels and dipthongs
 *      FVOICD  0000002  Voiced segments
 *      FVOWEL  0000004  Vowels
 *      FSEMIV  0000010  Semivowels (Y, W, YX, WX)
 *      FSONOR  0000020  [-obst], except E_Q  which is [-sonor, -obst]
 *      FOBST   0000040  Occlusives, except E_Q is [-obst]
 *      FPLOSV  0000100  Plosives, but not affricates
 *      FNASAL  0000200  Nasals
 *      FCONSON 0000400  [-syll], except for  SI and  E_Q
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

short featb_sp_lts[TOT_SP_PHONEMES] = {
      /* [ SIL ]  */      FSONOR,
      /* [ E_A ]  */      FSYLL+FVOICD+FVOWEL+FSONOR,
      /* [ E_E ]  */      FSYLL+FVOICD+FVOWEL+FSONOR,
      /* [ E_I ]  */      FSYLL+FVOICD+FVOWEL+FSONOR+FDIPTH,
      /* [ E_O ]  */      FSYLL+FVOICD+FVOWEL+FSONOR,
      /* [ E_U ]  */      FSYLL+FVOICD+FVOWEL+FSONOR+FDIPTH,
      /* [ E_WX ] */      FVOICD+FSONOR+FSEMIV+FDIPTH,
      /* [ E_YX ] */      FVOICD+FSONOR+FSEMIV+FDIPTH,
      /* [ E_RR ] */      FVOICD+FSONOR+FCONSON,
      /* [ E_L ]  */      FVOICD+FSONOR+FCONSON+FSONCON,
      /* [ E_LL ] */      FVOICD+FSONOR+FCONSON+FSONCON,
      /* [ E_M ]  */      FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ E_N ]  */      FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ E_NH ] */      FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ E_F ]  */      FOBST+FCONSON,
      /* [ E_S ]  */      FOBST+FCONSON,
      /* [ E_J ]  */      FOBST+FCONSON,
      /* [ E_TH ] */      FOBST+FCONSON,
      /* [ E_BH ] */      FVOICD+FSONOR+FCONSON+FOBST,
      /* [ E_DH ] */      FVOICD+FSONOR+FCONSON+FOBST,
      /* [ E_GH ] */      FVOICD+FSONOR+FCONSON+FOBST,
      /* [ E_YH ] */      FVOICD+FOBST+FCONSON+FBURST,   /* 23-Apr-86, 5-May */
      /* [ E_P ]  */      FOBST+FPLOSV+FCONSON+FBURST,
      /* [ E_B ]  */      FVOICD+FOBST+FPLOSV+FCONSON+FBURST+FVBAR,
      /* [ E_T ]  */      FOBST+FPLOSV+FCONSON+FBURST,
      /* [ E_D ]  */      FVOICD+FOBST+FPLOSV+FCONSON+FBURST+FVBAR,
      /* [ E_K ]  */      FOBST+FPLOSV+FCONSON+FBURST,
      /* [ E_G ]  */      FVOICD+FOBST+FPLOSV+FCONSON+FBURST+FVBAR,
      /* [ E_CH ] */      FOBST+FCONSON+FBURST,
      /* [ E_Y ]  */      FOBST+FVOICD+FCONSON,      /* 12-May-86       */
      /* [ E_R ]  */      FVOICD+FSONOR+FCONSON,
      /* [ E_Q ]  */      FVOICD+FGLOTAL,
      /* [ E_Z ]  */      FVOICD+FOBST+FCONSON,      /* 5-May-86        */
      /* [ E_W ]  */      FVOICD+FOBST+FCONSON+FSEMIV,
      /* [ E_NX ] */      FVOICD+FSONOR+FNASAL+FCONSON,

#ifdef E_SH
      /* [ E_SH ] */      FOBST+FCONSON,
#endif

#ifdef E_V
      /* [ E_V ]  */      FVOICD+FSONOR+FCONSON,
#endif

      /* [ E_IX ]  */     FVOICD+FSONOR,      /* 7-May: not a vowel     */
      /* [ E_MX]   */     FVOICD+FSONOR+FNASAL+FCONSON,
      /* [ E_PH ]  */     FOBST+FCONSON,
      /* [NOVALID] */     0,

      /* place holders for null range ... */
      0,0,0,0,0,0,0,0,0,0,      /* 40 ... 49 */
      0,0,0,0,0,0,0,0,0,0,      /* 50 ... 59 */
      0,0,0,0,0,0,0,0,0,0,      /* 60 ... 69 */
      0,0,0,0,0,0,0,0,0,0,      /* 70 ... 79 */
      0,0,0,0,0,0,0,0,0,0,      /* 80 ... 89 */
      0,0,0,0,0,0,0,0,0,0,      /* 90 ... 99 */
  
	  /* [BLOCK_RULES */      0,
	  /* [ S3  ]  	  */      FSTMARK,
	  /* [ S2  ]  	  */      FSTMARK,
	  /* [ S1  ]      */      FSTMARK,
	  /* [SEMPH]  	  */      FSTMARK,
	  /* [HAT_R]  	  */      0,
	  /* [HAT_FALL]   */      0,
	  /* [HAT_RF]  	  */  	  0,
	  /* [SBOUND]  	  */ 	  0,
	  /* [MBOUND]  	  */ 	  0,
	  /* [HYPHEN]  	  */ 	  FSTMARK,
	  /* [WBOUND]  	  */ 	  0,0,0,0,0,0,0,0,0
	  /* The rest are zero          */
};

   
   

