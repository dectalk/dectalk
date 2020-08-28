/*
 ************************************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2001 Force Computers Inc. A Solectron company. All rights reserved.
 *    _ Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *************************************************************************************
 *    File Name:	par_char.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    parser_char_types[] is used in parser to check the data type and case
 *    of each incoming character.
 *    ambiguous_char[][] is used in the parser for look ahead to check the
 *    data type ambiguity.
 *
 *************************************************************************************
 *    Revision History:
 *
 *	Rev	Who		Date    	Description
 *	---	-----	-----------	----------------------------------------------------------
 *	001	MGS		04/12/1999	modify from nchar_types[] of cmd_char.c
 *  002 MGS     06/24/1996	Added types TYPE_punct_some and TYPE_vowel_non_y
 *  003 MGS     06/27/1996	removed - from TYPE_clause
 *  004 MGS     07/16/1996	Added $ to TYPE_punct_some
 *  005 MGS     07/24/1996	removed % - from TYPE_number
 *							added & * < > ^ to TYPE_number
 *  006 MGS     07/30/1996	Changed par_lower and par_upper to use
 *							ls_lower.tab and ls_upper.tab
 *	007	MGS		08/01/1996	Removed 0 1 2 3 4 5 6 7 8 9 from TYPE_number
 *							regenerated the ambiguous_char table 
 *	008	MGS		08/09/1996	Moved par_ambi.tab to par_ambi.c
 *  009 GL		08/29/1996	remove TYPE_white for 0xd and 0x9.
 *  010 GL		10/01/1996  Add TYPE_quto for (),{},[],<>,\,|,"
 *  011 GL      10/02/1996  Restore TYPE_white for 0xd.
 *  012 SIK		10/10/1996  Add VOCAL #ifndef switch to support the VOCAL build 
 *  013 GL		10/11/1996  Add par_illegal_cluster[] table.
 *  014 GL		04/07/1997  For BATS#341
 *                          "y" should be a vowel.
 *  015	MGS		11/13/1997	BATS #520, undid BATS #341, it was wrong
 *  016	MGS		07/09/1998	BATS #710 Fixed the type of ß, it was very wrong
 *  017	MFG		05/29/2001	Included dectalkf.h
 *  018	CAB		06/01/2001	Add Force copyright info
 *  021	MGS		04/11/2002		ARM7 port
 */

#include "dectalkf.h"
#include	"port.h"

#ifndef VOCAL
#include	"par_def.h"

const unsigned short parser_char_types[]= {
/* dec    hex     printable  char          non-printable char   */
/* num    num     char       type          description          */
/*                                                              */
/*  0     00      nul	*/	TYPE_null,                                          
/*  1     01      soh	*/	TYPE_any_char,
/*  2     02      stx	*/	TYPE_any_char,
/*  3     03      etx	*/	TYPE_any_char,
/*  4     04      eot	*/	TYPE_any_char,
/*  5     05      enq	*/	TYPE_any_char,	
/*  6     06      ack	*/	TYPE_any_char,
/*  7     07      bel	*/	TYPE_white|TYPE_any_char,
/*  8     08      bs	*/	TYPE_white|TYPE_any_char,
/*  9     09      ht	*/	TYPE_clause|TYPE_any_char,	
/* 10     0A      nl	*/	TYPE_white|TYPE_any_char,
/* 11     0B      vt	*/	TYPE_clause|TYPE_white|TYPE_any_char,
/* 12     0C      ff	*/	TYPE_white|TYPE_any_char,
/* 13     0D      cr	*/	TYPE_any_char|TYPE_white,	
/* 14     0E      so	*/	TYPE_any_char,
/* 15     0F      si	*/	TYPE_white|TYPE_any_char,
/* 16     10      dle	*/	TYPE_any_char,
/* 17     11      dc1	*/	TYPE_number|TYPE_any_char,
/* 18     12      dc2	*/	TYPE_any_char,
/* 19     13      dc3	*/	TYPE_any_char,
/* 20     14      dc4	*/	TYPE_any_char,
/* 21     15      nak	*/	TYPE_any_char,	
/* 22     16      syn	*/	TYPE_any_char,
/* 23     17      etb	*/	TYPE_any_char,
/* 24     18      can	*/	TYPE_any_char,
/* 25     19      em	*/	TYPE_any_char,	
/* 26     1A      sub	*/	TYPE_any_char,
/* 27     1B      esc	*/	TYPE_any_char,
/* 28     1C      fs	*/	TYPE_any_char,
/* 29     1D      gs	*/	TYPE_any_char,	
/* 30     1E      rs	*/	TYPE_any_char,
/* 31     1F      us	*/	TYPE_any_char,
/* 32     20      sp	*/	TYPE_white|TYPE_any_char,
/* 33     21      !		*/	TYPE_non_alpha|TYPE_punct|TYPE_clause|TYPE_any_char,
/* 34     22      "		*/		TYPE_quot|TYPE_non_alpha|TYPE_punct|TYPE_any_char,
/* 35     23      #		*/	TYPE_punct|TYPE_punct_some|TYPE_non_alpha|TYPE_any_char,
/* 36     24      $		*/	TYPE_punct|TYPE_punct_some|TYPE_non_alpha|TYPE_number|TYPE_any_char,
/* 37     25      %		*/	TYPE_punct|TYPE_punct_some|TYPE_non_alpha|TYPE_number|TYPE_any_char, 
/* 38     26      &		*/	TYPE_punct|TYPE_punct_some|TYPE_non_alpha|TYPE_any_char,
/* 39     27      '		*/	TYPE_non_alpha|TYPE_punct|TYPE_any_char, 	
/* 40     28      (		*/		TYPE_quot|TYPE_punct|TYPE_number|TYPE_non_alpha|TYPE_any_char,
/* 41     29      )		*/		TYPE_quot|TYPE_punct|TYPE_number|TYPE_non_alpha|TYPE_any_char,  	
/* 42     2A      *		*/	TYPE_punct|TYPE_punct_some|TYPE_non_alpha|TYPE_number|TYPE_any_char,
/* 43     2B      +		*/	TYPE_punct|TYPE_punct_some|TYPE_number|TYPE_non_alpha|TYPE_any_char,
/* 44     2C      ,		*/	TYPE_punct|TYPE_non_alpha|TYPE_clause|TYPE_any_char,
/* 45     2D      -		*/	TYPE_punct|TYPE_non_alpha|TYPE_any_char|TYPE_number,		
/* 46     2E      .		*/	TYPE_punct|TYPE_non_alpha|TYPE_clause|TYPE_any_char,
/* 47     2F      /		*/	TYPE_punct|TYPE_non_alpha|TYPE_any_char|TYPE_number,
/* 48     30      0		*/	TYPE_non_alpha|TYPE_digit|TYPE_alpha_num|TYPE_any_char,
/* 49     31      1		*/	TYPE_non_alpha|TYPE_digit|TYPE_alpha_num|TYPE_any_char,
/* 50     32      2		*/	TYPE_non_alpha|TYPE_digit|TYPE_alpha_num|TYPE_any_char,
/* 51     33      3		*/	TYPE_non_alpha|TYPE_digit|TYPE_alpha_num|TYPE_any_char,
/* 52     34      4		*/	TYPE_non_alpha|TYPE_digit|TYPE_alpha_num|TYPE_any_char,
/* 53     35      5		*/	TYPE_non_alpha|TYPE_digit|TYPE_alpha_num|TYPE_any_char,
/* 54     36      6		*/	TYPE_non_alpha|TYPE_digit|TYPE_alpha_num|TYPE_any_char,
/* 55     37      7		*/	TYPE_non_alpha|TYPE_digit|TYPE_alpha_num|TYPE_any_char,
/* 56     38      8		*/	TYPE_non_alpha|TYPE_digit|TYPE_alpha_num|TYPE_any_char,
/* 57     39      9		*/	TYPE_non_alpha|TYPE_digit|TYPE_alpha_num|TYPE_any_char,
/* 58     3A      :		*/	TYPE_punct|TYPE_non_alpha|TYPE_clause|TYPE_any_char,
/* 59     3B      ;		*/	TYPE_punct|TYPE_non_alpha|TYPE_clause|TYPE_any_char,
/* 60     3C      <     */  	TYPE_quot|TYPE_punct|TYPE_non_alpha|TYPE_any_char|TYPE_number,
/* 61     3D      =		*/	TYPE_punct|TYPE_punct_some|TYPE_number|TYPE_non_alpha|TYPE_any_char,	
/* 62     3E      >     */  	TYPE_quot|TYPE_punct|TYPE_non_alpha|TYPE_any_char|TYPE_number,
/* 63     3F      ?		*/	TYPE_punct|TYPE_non_alpha|TYPE_clause|TYPE_any_char,
/* 64     40      @		*/	TYPE_punct|TYPE_punct_some|TYPE_non_alpha|TYPE_any_char,
/* 65     41      A		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 66     42      B		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 67     43      C		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 68     44      D		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 69     45      E		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	
/* 70     46      F		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 71     47      G		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 72     48      H		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 73     49      I		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	
/* 74     4A      J		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 75     4B      K		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 76     4C      L		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 77     4D      M		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	
/* 78     4E      N		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 79     4F      O		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 80     50      P		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 81     51      Q		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 82     52      R		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 83     53      S		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 84     54      T		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 85     55      U		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,				
/* 86     56      V		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 87     57      W		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 88     58      X		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 89     59      Y		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_vowel|TYPE_any_char,	
/* 90     5A      Z		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 91     5B      [     */  	TYPE_quot|TYPE_punct|TYPE_non_alpha|TYPE_any_char,
/* 92     5C      \     */  	TYPE_quot|TYPE_punct|TYPE_non_alpha|TYPE_any_char,
/* 93     5D      ]     */  	TYPE_quot|TYPE_punct|TYPE_non_alpha|TYPE_any_char,                                         
/* 94     5E      ^		*/	TYPE_punct|TYPE_punct_some|TYPE_non_alpha|TYPE_any_char|TYPE_number,
/* 95     5F      _		*/	TYPE_punct|TYPE_punct_some|TYPE_non_alpha|TYPE_any_char,
/* 96     60      `		*/	TYPE_punct|TYPE_punct_some|TYPE_non_alpha|TYPE_any_char,
/* 97     61      a		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 98     62      b		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/* 99     63      c		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*100     64      d		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*101     65      e		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	
/*102     66      f		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*103     67      g		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*104     68      h		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*105     69      i		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*106     6A      j		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*107     6B      k		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*108     6C      l		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*109     6D      m		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*110     6E      n		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*111     6F      o		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*112     70      p		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*113     71      q		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*114     72      r		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*115     73      s		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*116     74      t		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*117     75      u		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*118     76      v		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*119     77      w		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*120     78      x		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*121     79      y		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_vowel|TYPE_any_char,	
/*122     7A      z		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,
/*123     7B      {     */  	TYPE_quot|TYPE_punct|TYPE_non_alpha|TYPE_any_char,
/*124     7C      |     */  	TYPE_quot|TYPE_punct|TYPE_non_alpha|TYPE_any_char,
/*125     7D      }     */  	TYPE_quot|TYPE_punct|TYPE_non_alpha|TYPE_any_char,                 
/*126     7E      ~		*/	TYPE_punct|TYPE_punct_some|TYPE_non_alpha|TYPE_any_char,
/*127     7F      		*/	TYPE_any_char,
/*128     80       		*/	TYPE_any_char,
/*129     81       		*/	TYPE_any_char,
/*130     82       		*/	TYPE_any_char,
/*131     83       		*/	TYPE_any_char|TYPE_white,
/*132     84       		*/	TYPE_any_char,
/*133     85       		*/	TYPE_any_char,	
/*134     86       		*/	TYPE_any_char,
/*135     87       		*/	TYPE_any_char,
/*136     88       		*/	TYPE_any_char,
/*137     89    	    */	TYPE_any_char,	
/*138     8A       		*/	TYPE_any_char,
/*139     8B       		*/	TYPE_any_char,
/*140     8C       		*/	TYPE_any_char,
/*141     8D       		*/	TYPE_any_char,	
/*142     8E       		*/	TYPE_any_char,
/*143     8F       		*/	TYPE_any_char,
/*144     90       		*/	TYPE_any_char,
/*145     91       		*/	TYPE_any_char,
/*146     92       		*/	TYPE_any_char,
/*147     93       		*/	TYPE_any_char,
/*148     94       		*/	TYPE_any_char,
/*149     95       		*/	TYPE_any_char,	
/*150     96       		*/	TYPE_any_char,
/*151     97       		*/	TYPE_any_char,
/*152     98       		*/	TYPE_any_char,
/*153     99       		*/	TYPE_any_char,	
/*154     9A       		*/	TYPE_any_char,
/*155     9B      		*/	TYPE_any_char,
/*156     9C      		*/	TYPE_any_char,
/*157     9D      		*/	TYPE_any_char,	
/*158     9E      		*/	TYPE_any_char,
/*159     9F       		*/	TYPE_any_char,
/*160     A0      		*/	TYPE_non_alpha|TYPE_any_char,	/* Blank */
/*161     A1      ¡		*/	TYPE_punct|TYPE_non_alpha|TYPE_any_char,	/* Inverted exclamation mark */
/*162     A2      		*/	TYPE_non_alpha|TYPE_any_char,	/* Cent */
/*163     A3      		*/	TYPE_non_alpha|TYPE_any_char,	/* Pound */
/*164     A4      		*/	TYPE_non_alpha|TYPE_any_char,	/* International currency */
/*165     A5      		*/	TYPE_non_alpha|TYPE_any_char,	/* Yen */
/*166     A6      		*/	TYPE_non_alpha|TYPE_any_char,	/* Pipe */
/*167     A7      		*/	TYPE_non_alpha|TYPE_any_char,	/* Section sign */
/*168     A8      		*/	TYPE_non_alpha|TYPE_any_char,	/* Diaeresis */
/*169     A9       		*/	TYPE_non_alpha|TYPE_any_char,	/* Copyright */	
/*170     AA      		*/	TYPE_non_alpha|TYPE_any_char,	/* Feminine number ordinalizer */
/*171     AB      		*/	TYPE_non_alpha|TYPE_any_char,	/* Left pointing guiellmets */
/*172     AC      		*/	TYPE_non_alpha|TYPE_any_char,	/* Logical not */
/*173     AD      		*/	TYPE_non_alpha|TYPE_any_char,	/* Hyphen */	
/*174     AE      		*/	TYPE_non_alpha|TYPE_any_char,	/* Registered sign */
/*175     AF      		*/	TYPE_non_alpha|TYPE_any_char,	/* Macron symbol */
/*176     B0  			*/	TYPE_non_alpha|TYPE_any_char,	/* Ring (Degree) */
/*177     B1      		*/	TYPE_non_alpha|TYPE_any_char,	/* Plus/minus */
/*178     B2      		*/	TYPE_non_alpha|TYPE_number|TYPE_any_char,	/* Superscipt 2 */
/*179     B3      		*/	TYPE_non_alpha|TYPE_number|TYPE_any_char,	/* Superscipt 3 */
/*180     B4      		*/	TYPE_non_alpha|TYPE_any_char,	/* Accent accute */
/*181     B5      		*/	TYPE_non_alpha|TYPE_any_char,	/* Micro */
/*182     B6      		*/	TYPE_non_alpha|TYPE_any_char,	/* Paragraph sign */
/*183     B7      		*/	TYPE_non_alpha|TYPE_any_char,	/* Centered dot */
/*184     B8      		*/	TYPE_non_alpha|TYPE_any_char,	/* Cedilla */
/*185     B9      		*/	TYPE_non_alpha|TYPE_number|TYPE_any_char,	/* Superscript 1 */
/*186     BA      		*/	TYPE_non_alpha|TYPE_any_char,	/* Masculine number ordinalizer */
/*187     BB      		*/	TYPE_non_alpha|TYPE_any_char,	/* Left pointing guiellmets */
/*188     BC      		*/	TYPE_non_alpha|TYPE_number|TYPE_any_char,	/* Fraction one fourth */
/*189     BD      		*/	TYPE_non_alpha|TYPE_number|TYPE_any_char,	/* Fraction one half */
/*190     BE     		*/	TYPE_non_alpha|TYPE_number|TYPE_any_char,	/* Fraction three-fourths */
/*191     BF     		*/	TYPE_punct|TYPE_non_alpha|TYPE_any_char,	/* Inverted question mark */
/*192     C0     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Grave accent on capital A */
/*193     C1     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Acute accent on capital A */	/* 0xc0 to 0xcf */
/*194     C2     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Circumflex accent on capital A */
/*195     C3     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Tilde accent on capital A */
/*196     C4     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Umlaut or diaresis accent on capital A */
/*197     C5     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Ring accent on capital A */
/*198     C6     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Dipthong A-E ligature */
/*199     C7     		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Cedilla accent on capital C */
/*200     C8     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Grave accent on capital E */
/*201     C9     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Acute accent on capital E */
/*202     CA     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Circumflex accent on capital E */
/*203     CB     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Umlaut or diaresis accent on capital E */
/*204     CC     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Grave accent on capital I */
/*205     CD     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Acute accent on capital I */
/*206     CE     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Circumflex accent on capital I */
/*207     CF     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Umlaut or diaresis accent on capital I */
/*208     D0     		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Upper case ETH */
/*209     D1     		*/	TYPE_upper|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Tilde accent on capital N */	/* 0xd0 to 0xdf */
/*210     D2     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Grave accent on capital O */
/*211     D3     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Acute accent on capital O */
/*212     D4     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Circumflex accent on capital O */
/*213     D5     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Tilde accent on capital O */
/*214     D6     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Umlaut or diaresis accent on capital O */
/*215     D7     		*/	TYPE_any_char,	/* Multiply */
/*216     D8     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Upper case O oblique */
/*217     D9     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Grave accent on capital U */
/*218     DA     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Acute accent on capital U */
/*219     DB     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Circumflex accent on capital U */
/*220     DC     		*/	TYPE_upper|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Umlaut or diaresis accent on capital U */
/*221     DD     		*/	TYPE_upper|TYPE_vowel|TYPE_alpha|TYPE_alpha_num|TYPE_consonant|TYPE_any_char,	/* Accute accent on capital Y */
/*222     DE     		*/	TYPE_upper|TYPE_any_char,	/* Uppercase thorn */
/*223     DF     		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Lowercase es zet ligature */
/*224     E0     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Grave accent on lowercase a */
/*225     E1     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Acute accent on lowercase a */	/* 0xe0 to 0xef */	
/*226     E2     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Circumflex accent on lowercase a */
/*227     E3     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Tilde accent on lowercase a */
/*228     E4     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Umlaut or diaresis accent on lowercase a */
/*229     E5     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Ring accent on lowercase a */	
/*230     E6     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Lowercase a-e ligature */
/*231     E7     		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Cedilla accent on lowercase c */			
/*232     E8     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Grave accent on lowercase e */
/*233     E9     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Acute accent on lowercase e */			
/*234     EA     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Circumflex accent on lowercase e */
/*235     EB     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Umlaut or diaresis accent on lowercase e */
/*236     EC     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Grave accent on lowercase i */
/*237     ED     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Acute accent on lowercase i */
/*238     EE     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Circumflex accent on lowercase i */
/*239     EF     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Umlaut or diaresis accent on lowercase i */	
/*240     F0     		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Lower case eth */
/*241     F1     		*/	TYPE_lower|TYPE_consonant|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Tilde accent on lowercase n */	/* 0xf0 to 0xff */
/*242     F2     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Grave accent on lowercase o */
/*243     F3     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Acute accent on lowercase o */			
/*244     F4     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Circumflex accent on lowercase o */
/*245     F5     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Tilde accent on lowercase o */			
/*246     F6     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Umlaut or diaresis accent on lowercase o */
/*247     F7     		*/	TYPE_any_char,	/* Divide by */		
/*248     F8     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Slash accent on lowercase o */
/*249     F9     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Grave accent on lowercase u */			
/*250     FA     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Acute accent on lowercase u */
/*251     FB     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Circumflex accent on lowercase u */	
/*252     FC     		*/	TYPE_lower|TYPE_vowel|TYPE_vowel_non_y|TYPE_alpha|TYPE_alpha_num|TYPE_any_char,	/* Umlaut or diaresis accent on lowercase u */
/*253     FD     		*/	TYPE_lower|TYPE_vowel|TYPE_alpha|TYPE_alpha_num|TYPE_consonant|TYPE_any_char,	/* Accute accent on lowercase y */			
/*254     FE     		*/	TYPE_lower|TYPE_any_char,	/* Lower case thorn */
/*255     FF     		*/	TYPE_lower|TYPE_vowel|TYPE_alpha|TYPE_alpha_num|TYPE_consonant|TYPE_any_char,	/* Umlaut or diaresis accent on lowercase y */	
/*				*/	TYPE_null
};

#endif /* end if #ifndef VOCAL */

/*
 *  lower-case folding table ... upper case 8 bit characters are
 *  folded to their lower-case 7 bit equivalents ...
 */

const unsigned char par_lower[] = {
#include "ls_lower.tab"
};

/*
 *  Upper case folding table ...  sort of like above but only the 
 *  lower case ascii is folded to upper and the full eight bits are
 *  kept.
 */

const unsigned char par_upper[] = {
#include "ls_upper.tab"
};

const unsigned char *par_illegal_cluster[] = {
"bn",
"bt",
"db",
"hb",
"hp",
"kd",
"mb",
"mc",
"mf",
"mt",
"rf",
"yf",
"wb",
"-"
};