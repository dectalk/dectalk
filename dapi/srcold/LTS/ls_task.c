/*
 ***********************************************************************
 *          
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © SMART Modular Technologies 1999, 2000. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:    ls_task.c
 *    Author:       Matthew Schnee
 *    Creation Date:02/06/96
 *
 *    Functionality:
 *    This file contains the words by
 *    word driving loop of letter to sound.
 *    Blocks out words in the input stream, applies
 *    a number of heuristics to the words, and if all
 *    else fails, speaks the word using letter to sound.
 *    To do the job, it calls a number of secondary
 *    routines in ls_dict.c, ls_rule.c, ls_adju.c and ls_proc.c
 *
 ***********************************************************************
 *    Revision History (from old ls1.c)
 *
 * Rev	Who     Date		Description
 * ---  -----   -------		---------------------------------------
 * 01 	DGC 	03/01/1985 	Added user dictionary lookup.
 * 02 	DGC		03/05/1985 	Main dictionary now understands case.
 * 03 	DGC		03/25/1985 	Organized the flags. Massively changed the
 *                      	comments in the "ls_task_main".
 * 04 	DGC		04/01/1985 	The "lookup" code is smarter, and is in
 *                      	"ls7.c".
 * 05 	DGC		04/05/1985 	The code at "gok" now puts out a comma
 *                      	at the end in some situations.
 * 06 	DGC		04/08/1985 	Do the "degree" symbol correctly. Changed
 *                      	arguments to dictionary lookup.
 * 07 	DGC		05/02/1985 	Make "st." and "dr." independent of case.
 * 08 	DGC		05/13/1985 	Fix abbreviation bug; "Abb.," didn't match.
 * 09	DGC		05/15/1985 	(Gov. Smith)
 * 10 	DGC		05/16/1985 	Make "yyy" work right, even though it is
 *                      	probably not worth it!
 * 11 	DGC		05/21/1985 	Heuristic changes. Changed the "if" in the
 *                      	parenthesis stripper to a "while" (again).
 *                      	Made stuff like "Gov." and "Jesse." (the quotes
 *                      	are part of the text) work.
 * 12 	DGC		05/23/1985 	Improved the handling of words like "I.B.M.".
 *                      	The final period is now eaten.
 * 13 	DGC		05/24/1985 	The last phoneme output by anybody is saved
 *                      	in "pLts_t->lphone". This is used by code that puts
 *                      	extra stuff on the end of a word. This is a
 *                      	generalization of the old "lastlook" code.
 *                      	Added plural numbers.
 * 14 	DGC		06/14/1985 	Redid the support for the "single letter word"
 *                      	multinationals. The old scheme was just too
 *                      	naive.
 * 15 	DGC		06/20/1985 	Added "secs." to the number abbreviation table,
 *                      	as per the manual.
 * 16 	DGC		06/27/1985 	Added a COMMA in front of slow spelling.
 * 17 	DGC		08/21/1985 	A new rule. Single upper case character words
 *                      	followed by a period are spelled, and the
 *                      	period is eaten. This is to make stuff like
 *                      	"David G. Conroy" work better. We understand
 *                      	that "The King and I." will screw up.
 * 18 	DGC		08/28/1985 	Adjusted the phonetics on "hectares". The stress
 *                      	was bad, and the last phoneme was "funny".
 *                      	Changed the [x] in "nanoseconds" to [o].
 * 19 	DGC		09/18/1985 	Stylistic changes suggested by "lint".
 * 20 	DGC		10/29/1985 	Almost too late! Although is is correct to put
 *                      	a pause in front of blocks of spelled words,
 *                      	doing it in front of single letter words is an
 *                      	incompatability with DECtalk I, and makes the
 *                      	old "to spell fast, put blanks between the
 *                      	letters" rule false.
 *
 * ----------------     	Released as C5005 V1.0 firmware.
 * 21 	DGC		10/21/1986 	Changes for KRM.
 * 22 	DGC		11/17/1986 	More changes for KRM.
 * 23 	EAB		04/11/1987 	Added change for Kurzweil to make negative numbers
 *                      	spell out for small negative as well as positive no.
 * 24 	EAB		05/25/1993 	made many changes how dash was pronounced etc.
 * 25 	EAB		06/02/1993  Changed "wh" question rule to acutally look for the words it
 *                      	should. It used to not fire when it should and fire when it chouldn't.
 * 26 	MGS     02/20/1996 	Reorganized ls_task_main to be more readable and manageable                     
 * 27 	EAB     02/17/1996 	When I put on debug found that one sendinex had not been
 *                          removed and the routine was still there--removed both!
 * 28 	GL      02/16/1996 	Fix the problem while processing xxxx-yyyy string.
 *                          The ending pointer of xxxx is incorrectly offset by 1.
 *                          So in the dictionary search we are looking for "xxx"
 *                          instead of "xxxx".  It will also messup the suffix stripping.
 * 29 	CJL     02/19/1996 	Removed KRM code.
 * 30 	MSG     02/22/1996 	changed reference to lscrush to ls_lower because the
 *                          two tables do the same thing 
 * 31 	MGS     02/22/1996 	Fixed bug with compound words that have parts that can't be spoken
 *                          words like cccc-matt-dddd and yyy-ginger
 * 32 	MGS     02/25/1996 	Moved sdic and whdic to l_us_con.c
 * 33 	MGS		03/18/1996	Finished WIN32 code merge, function headers need updating
 * 34 	GL		04/30/1996  set up the form class of "to","and" and "for" in wlookup()
 *                          to pick up the correct homograph after these special words.
 * 35 	JDB     05/30/1996  remove gotos, start language merge
 * 36 	GL      07/11/1996  fix 5 sq. ft. problem.
 * 37 	GL      07/29/1996  use ls_util_write_pipe() to replace write_pipe()
 * 38	GL		09/10/1996	use isnumabr for number indication of last word.
 * 39   GL		10/03/1996  fix the problem of miss-merge ordinal processing of SPANISH
 * 40	GL		10/23/1996	remove the unused index mark handling code.
 * 41	GL		11/07/1996	fix the Spanish decimal number
 * 42	GL		11/15/1996  fix 4 digits number problem for Spanish and German
 * 43	GL		11/21/1996	change the way local language handle nabtab[]
 * 44	GL		12/06/1996	need to use --(*rlp) in strip_right_punct() routine
 *							instead of --rlp
 *							Also need to use the **rlp argument for
 *							dictionary_after_punct() since it will be change in
 *							this routine to remove period. 
 * 45	GL		01/01/1997	Use "OO" to replace "O" for vowel type checking.
 *							"OO" is defined in ls_defs.h for all languages.
 * 46   GL		01/31/1997  initialize the formcalss state for control-k(VT)
 * 47   GL		02/13/1997	Use 4 digits form for German years.
 * 48   GL      02/13/1997  Support US style am/pm for Spanish.
 * 49   GL      02/14/1997  Fix the pural/singular problem of money
 *							set pflag to -1 to force Spanish using "un" for "1"
 * 50	GL		02/17/1997  set pflag to -1 to force German using "ein" for "1"
 * 51	GL		02/25/1997  rollback the change of rev 36, set isnumabr to 3 to
 *							fix the 5 sq. ft. problem.
 *							Also fix St. Dr. back to back problem.
 * 52   GL      03/03/1997  if Dr./St. is the first word of sentence, it should be
 *                          doctor/saint.
 * 53	GL		03/04/1997	fix the problem of "ttest-lin", should not send comma
 *							for "-" if "ttest" is not a dictionary word.
 * 54	GL		03/21/1997	for BATS#308
 *							add LTD 4200 debug switch for data dump.
 * 55	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 * 56	GL		04/21/1997	BATS#360  remove spaces before "#define" or "#if" 
 * 58	MGS		06/13/1997	BATS#389  fixed f-a-r problem, code in ls_task_process word changed
 * 59	MGS		06/16/1997	BATS#387  fixed problem with uppercase compound words
 * 60	GL      08/14/1997  BATS#441  only pLts_t->isnumabr is 0  or 1 "a" will be "AX"
 *							fix "3 is a number" problem
 * 61	MGS		08/20/1997	Added kerzweil code for first word vowels stressing
 * 62   DR		09/30/1997 	UK BUILD: added uk build stuff
 * 63	MGS		10/08/1997	BATS 490 MGS fix for A. B. C. problem losing periods  
 * 64   MGS		10/17/1997	Edited to handle form class info, set old_fc_index to -1.
 * 65   GL		11/03/1997	Add UK support code.
 * 66   MG		11/04/1997	for BATS#509  add 'Y' for vowel checking
 * 67   GL		11/06/1997	add debug switch to log form class
 *                          also move the log statement before formclass arrary get initialized
 * 68   GL		11/21/1997	remove "pand" for UK_english
 * 69   GL		03/20/1998	BATS#633, fixt data type error in ls_task_wlookup()
 * 70   GL		03/23/1998	BATS#613, remove the extra pulse after ordinal number like "2."
 * 71	GL		04/10/1998	BATS#651  fix 4 digits number reading problem.
 * 72	MFG		05/13/1998	added support debug switch 0x4400 spelled word hit
 * 73   MFG		05/19/1998	excluded dbglog logging when build 16-bit code (MSDOS)	 
 * 74   ETT		10/05/1998  Added Linux code.
 * 75	GL		10/06/1998  Handle Spanish number abbreviation like German 
 * 76	GL.Juan	11/16/1998	BATS#721 to fix/support $5 and $5 millones
 * 77   EAB		01/11/2000  	//eab 1/1199 Modify the stress to a secondary stress which is more appropriate.
 * 78   MFG		03/10/2000  #ifdef out the printf "hit it" for debug only
 * 79   MFG     03/21/2000  comment out ls_task_dictionary_search 2nd iteration for now breaks in Windows CE 
 * 80	MGS		04/13/2000	Changes for integrated phoneme set 
 * 81	NAL		06/12/2000	Warning removal
 * 82	MGS		07/14/2000	indexing fix found by sapi 5 work
 * 83	CHJ		07/20/2000	French added
 * 84	CAB		09/21/2000	Fixed copyright info
 * 85	MGS		09/21/2000	Fixed Whitespace before #ifdefs and friends 
 * 86	MGS		10/05/2000	Redhat 6.2 and linux warning removal
 * 87	MGS		12/13/2000	Added code to change ae oe ue to umlated in german
 * 88	MGS		12/18/2000	add for german ae oe ue processing to umlated vowels after dic search
 * 89	MGS		12/28/2000	Removed l_ip from LETTER structure
 * 90	MGS		01/04/2001	Made the german vowels thing recognize case of the first letter
 * 91	MGS		01/12/2001	Removed some duplicated French code
 * 92	CAB		01/15/2001	Merged Michel Divay changes to French
 * 93	CAB		01/22/2001	Changed Done to done to fix compile error
 * 94	MGS		02/12/2001	Removed first words lookup from french
 * 95	EAB		3/8/2001 	Added fix for german neue problem
 * 96   EAB		3/15/01 	Chnage to make French compile
 * 97	CAB		03/21/2001	Added changes by michel
 * 98	MGS		03/29/2001	Fixed ls_rule_lts for french
 * 99	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 100 	CAB		05/14/2001 	Fixed copyright
 * 101	MGS		06/19/2001	Enhanced(?) debug window
 * 102	MGS		02/26/2002	Another indexing fix
 * 103	MGS		02/26/2002	new LTs parsing
 * 105	MGS		04/03/2002	Single threaded lts
 * 106	MGS		04/11/2002	ARM7 port
 * 107	CAB		04/25/2002	Removed warnings by typecast
 *							Added missing }
 *							Moved apres_tiret,premiere,premier,francs,categ to ls_cons.h
 * 108	MGS		08/19/2002	LTS Parsing debugging output.
 * 109	MFG		03/11/2003	added added the windows CE version of _stricmp for UNDER_CE builds
 *
 */
 
#include "ls_def.h"   
#include "ls_prot.h"
#ifdef SINGLE_THREADED
#include "cm_def.h"
#endif

#define DbgLs1 0

void ls_task_parse_sentence(LPTTS_HANDLE_T phTTS);


/* protos */
extern PHONE * ls_rule_phone_alloc(PLTS_T pLts_t);
extern void ls_suff_print_fc(LPTTS_HANDLE_T phTTS);
/*#define LS1DEBUG 1*/

/*#define DUMP_WORD*/

#define KEEP_SEARCHING  0
#define LS_TASK_LOOP    1
#define SPELL_WORD      2
#define FINISHED_WORD   3

#ifdef __linux__
#include <stdio.h>
#endif

#ifndef ARM7
extern char *form_class_strings[];
#endif
/* when running on DECtalk PC this parameter can't be passed to */
/* ls_task_main so a global is used */
/* GL 04/21/1997  change this for OSF build */
#ifdef MSDOS           
	extern LPTTS_HANDLE_T phTTS;
#endif

#if defined (WIN32) && defined (PRINTFDEBUG) && defined _DEBUG
extern int Thread_Alive;
extern int in_winmain;
#endif

/* ******************************************************************
 *  Function Name:
 *      ls_task_main()
 *
 *  Description:    
 *      the main loop of lts.   once the loop starts, it never ends.
 *
 *  Arguments:                                                      
 *      none
 *
 *  Return Value:
 *      none, it should never return.
 *
 *  Comments:
 *      for WIN32, this function is passed a parameter 
 *          LPTTS_HANDLE_T  phTTS	Text-to-speech handle
 *      
 *
* *****************************************************************/
     
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_ 
void ls_task_main(LPTTS_HANDLE_T phTTS)
#endif

#ifdef ARM7
void ls_task_main(LPTTS_HANDLE_T phTTS)
#endif

#ifdef MSDOS
void far ls_task_main(void)
#endif

{
	/* of special words.*/ 
	PKSD_T  pKsd_t;
	PLTS_T  pLts_t;
	PHONE   *pp; 
#ifndef SINGLE_THREADED
	int     done; // array_i=0;
	LETTER  *llp;
	LETTER  *rlp;
	LETTER  *elp;
	LETTER  *lp1;
	LETTER	origword[NGWORD];
#endif
#if 0 // SINGLE_THREADED
	PHONE   pnode[NPNODE];                  /* Phoneme pool.                */
	/* MGS 6/16/97 BATS #387 Added to allow case to reach ls_task_process_word */
#ifdef FRENCH
//	char  c;       /* for current char of cword */
//	int   Fini=0;  /* de 0 à 4 : end of cword analysis */
//	int   rbphone; /* phone due to right striping */
//	int   sign;    /* sign if number */
//	int   lflag;   /* attributes of cword : LSTRIP, RSTRIP, etc */
//	int   speed;   /* speed when spelled */
//	int   TypDic;  /* dico result */
//	short wstate;  /* "Which" state : quoi, qui */
//	FLAG  contgc;  /* current word is left context for next word */
#endif
	int namef=0; 							/* this flag seems useless */ 
#endif // 0 // SINGLE_THREADED
	
	/* printf("this is the start of lts\n"); */
	
		
	pKsd_t = phTTS->pKernelShareData;
	pLts_t = phTTS->pLTSThreadData;	
	pLts_t->isnumabr=0;

    pLts_t->pflp = 0;   
#ifdef MSDOS
	pKsd_t->lang_curr = LANG_none; 
#endif
#ifdef SPANISH
    pLts_t->got_quote = 0;
#endif  
    memset(&(pLts_t->nitem),0,sizeof(ITEM));
    memset(&(pLts_t->citem),0,sizeof(ITEM));
	
	pp = &pLts_t->pnode[0];                         		/* Pool of PHONE nodes. */
	
	while (pp < &pLts_t->pnode[NPNODE])         			/* free all the phonemes */
	{
		ls_rule_phone_free(pLts_t,pp);
		++pp;
	}
	
	pLts_t->wstate = UNK_WH;                        /* Start of sentence.   */
	pLts_t->lphone = WBOUND;                        /* Out of band.         */
	pLts_t->namef=0;

#ifdef SINGLE_THREADED
	pLts_t->cur_input_pos=0;
	memset(pLts_t->input_array,0,500);
#endif

#ifdef FRENCH
	strcpy(pLts_t->precedent, "");
	pLts_t->nitem.i_nword = 0; /* nothing in nitem */
#endif

#ifdef SINGLE_THREADED
}

#ifdef EPSON_ARM7
void lts_loop_2(LPTTS_HANDLE_T phTTS,unsigned short *input)
#else
void lts_loop(LPTTS_HANDLE_T phTTS,unsigned short *input)
#endif
{
//	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PLTS_T pLts_t = phTTS->pLTSThreadData;	
	int temp;
//	int i;

	if ((input[0]&PFONT)==(PFASCII<<PSFONT))
	{
		temp=pLts_t->cur_input_pos;
		pLts_t->input_array[pLts_t->cur_input_pos++]=(input[0]&PVALUE);
		if ( ((char_types[pLts_t->input_array[temp]]&MARK_space) && 
			  (char_types[pLts_t->input_array[temp-1]]&MARK_clause)) ||
			 (temp>400 && (char_types[pLts_t->input_array[temp]]&MARK_space)) ||
			 (temp>480) ||
			 (pLts_t->input_array[temp]==0x0b)
			 )

		{
#ifndef ARM7
			if (phTTS->bInReset)	
				return;
#endif
			pLts_t->first_pass=1;
#ifdef HLSYN
			ls_task_parse_sentence(phTTS);
#endif
			pLts_t->input_array[pLts_t->cur_input_pos]=0;
			pLts_t->first_pass=0;
#ifndef ARM7
			if (!phTTS->bInReset)	
#endif
				lts_main_loop(phTTS);
			pLts_t->cur_input_pos=0;
			pLts_t->num_indexes=0;
			pLts_t->cur_index=-1;
		}
		else
		{
			return;
		}
	}
	else if ((input[0]&PFONT)==(PFCONTROL<<PSFONT))
	{
		switch (input[0]&(PFONT|PVALUE))
		{
			case INDEX:
			case INDEX_REPLY:
			case INDEX_BOOKMARK:
			case INDEX_WORDPOS:
			case INDEX_START:	
			case INDEX_STOP:
			case INDEX_SENTENCE:
			case INDEX_VOLUME:
			case INDEX_NOISE:	
				if (pLts_t->cur_input_pos==0)
				{
					goto parse_label;
				}
				// add index to index list 
				pLts_t->cur_index=0;;

				pLts_t->indexes[pLts_t->num_indexes].data[0]=input[0];
				pLts_t->indexes[pLts_t->num_indexes].data[1]=input[1];
				pLts_t->indexes[pLts_t->num_indexes].data[2]=input[2];
				pLts_t->indexes[pLts_t->num_indexes].pos=pLts_t->cur_input_pos;
				pLts_t->num_indexes++;
				break;
			default:
			{
				goto parse_label;
			}
			break;
		}
	}
	else
	{
parse_label:		if (pLts_t->cur_input_pos!=0)
		{
			pLts_t->first_pass=1;
			ls_task_parse_sentence(phTTS);
			pLts_t->input_array[pLts_t->cur_input_pos]=0;
			pLts_t->first_pass=0;
#ifndef ARM7
			if (!phTTS->bInReset)	
#endif
				lts_main_loop(phTTS);
		}
		pLts_t->cur_input_pos=0;
		pLts_t->num_indexes=0;
		pLts_t->cur_index=-1;
		if (ls_util_next_item_new(phTTS,input))
			//		{
			//			ls_util_read_item(phTTS);
			//			ls_util_write_item(phTTS);
			//		}
#ifdef EPSON_ARM7
		fill_TTP_buffer(phTTS,input,(((input[0])&PNEXTRA) >> PSNEXTRA)+1);
#else
			ph_loop(phTTS,input);
#endif
		pLts_t->nitem.i_nword = 0;
		
		//		lts_main_loop(phTTS);
	}
}

	// if character, add to array and if end of clause, run lts
	// if command or phoneme, run lts below, send command or phoneme

		
void lts_main_loop(LPTTS_HANDLE_T phTTS)
{
	int     done=0; // array_i=0;
	LETTER  *llp;
	LETTER  *rlp;
	LETTER  *elp;
	LETTER  *lp1;
	/* MGS 6/16/97 BATS #387 Added to allow case to reach ls_task_process_word */
	LETTER	origword[NGWORD];
	int second_time=0;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PLTS_T pLts_t = phTTS->pLTSThreadData;	

	pLts_t->cur_read_pos=0;
#endif


#ifndef NEW_LTS
	ls_util_read_item(phTTS);	
	ls_task_readword(phTTS,&(pLts_t->cword[0]));	
	pLts_t->fc_index = 0;
	pLts_t->old_fc_index = -1;
#endif
	/*
	 * Top of the word processing main loop.
	 * Called with a word in "cword" and the delimiter in
	 * "pLts_t->citem". Look at the word, and update the "which" state
	 * if this is the first word in a sentence. Allow the
	 * "W" to be in either case. Don't get fooled by
	 * strippable punctuation.
	 */
#ifdef SINGLE_THREADED
	while ((pLts_t->cur_read_pos<=pLts_t->cur_input_pos))
#else
	while (1)
#endif
	{
#ifdef SINGLE_THREADED
		if (second_time)
			break;
		if (pLts_t->cur_read_pos==pLts_t->cur_input_pos)
			second_time=1;
#endif

		/* ET 6/9/1998: BATS #691
		copied from ...\dapi\src\CMD\cm_pars.c to get the debug win to come up */
#if defined (WIN32) && defined (PRINTFDEBUG)
		/* open debug window for window environement */
		if (/*(windbg_flag == 0) && ET 6/9/1998*/(Thread_Alive == 0) && (in_winmain==0) && (pKsd_t->debug_switch != 0 || pKsd_t->logflag != 0))
		{
			WINstart_thread();
		/*	windbg_flag = 1;	ET 6/9/1998: not defined in ls_task. */ 
		}
#endif
#ifdef FRENCH
		pLts_t->contgc = FALSE; //default is false
#endif
		/* display debug switch manual once */
#ifndef ARM7_NOSWI
		if (pKsd_t->debug_switch == 0x4fff)
		{
			printf("LTS debug switch description:\n");
			printf("4001 -- Incoming data string  4002 -- Dictionary HIT/MISS (0) for miss\n");
			printf("4004 -- Suffix stripping HIT  4008 -- Display MISS word, not speaking\n");
			printf("4010 -- Dict. search trace    4020 -- Homograph rule HIT\n");
			printf("4040 -- Form class array dump 4080 -- ACNA name type\n");
			printf("4100 -- log form class        4200 -- dump data before write_pipe\n");
			printf("4400 -- Spell it rule HIT     4800 -- drain data before write_pipe\n");
			printf("1002 -- Parser Output\n");
						
			/* reset to 0 again */
			pKsd_t->debug_switch = 0;
		}
#endif

#ifdef NEW_LTS
		pLts_t->first_pass=1; // this is here for now
		ls_task_read_sentence(phTTS);  // read the sentence
		ls_task_process_sentence(phTTS); // do the parsing stuff
		//read the entire sentence into the data array
		//  fill the word_structure array with the appropriate data
		//  when a sync or Ctrl-k is encountered, force the stuff to be converted
		//  read the sentence until a ,_ ._ :_ ;_ ?_ !_ is encountered
		//  do the dictioanry search now for each word and fill in the 
		//    dict_index, dict_type, homograph, form_class for each word found in the dictionary
		//    have to adapt the ls_dict search to return this information.
		//    the homograph code should be re-written to use the
		//    right context if it is available


		// after the words are read in to the array and processed, each word 
		// will be put into the cword structure
		// when lookahead is called, put the next word into the nword structure.
		// Eventually we should convert all the routines to use the array form of the data
		// and do away with the LETTER structure entirely.  this means no more llp->l_ch crap,
		// just *llp

		// create modified dictionary search that returns form_class, dict_index, dict_type, 
			// dict_hit_type, and homograph info.

		// ls_task_get_word_for_output retrieves the words from the structure
		// for the rest of the lts rules to process and produce phonemes
		pLts_t->first_pass=0; 
		while (ls_task_get_word_for_output(phTTS,*llp,&rlp))
		{
#endif
	
		/* debug switch */
#ifndef NEW_LTS
		if (DT_DBG(LTS_DBG,0x001))
		{
#ifndef ARM7_NOSWI
			ls_util_dump_cword (pLts_t->cword, "LTS Input:");
#endif
		}
#ifdef DUMP_WORD
		ls_util_dump_cword (pLts_t->cword, "ltsinput:");
#endif
#endif
		done=KEEP_SEARCHING;
		/* 
		 *...tek block here to make sure PH has something to do and that
		 *	we don't hog the CPU.. 
		 */
#ifdef MSDOS
		block(NULL_FP);
#endif    
		/* 
		 * xxxx eab WE added code to allow for double abreviations such as
		 *	4 sq. ft. but we need to block these abbreviations in normal
		 *	contexts so things like in and ha don't come out as hectors
		 *	and inches. so The 2nd abrreviation checker (nabtab)
		 *	is blocked unless the first time after a look ahead from
		 *	a number hit in the first case using the pLts_t->isnumabr being
		 *	set
		 */

		if(pLts_t->isnumabr)
			pLts_t->isnumabr--;

		if( (pKsd_t->pronflag & PRON_ACNA_NAME) !=0)
		{
			if(pLts_t->namef == 1)
			{
				pLts_t->namef=0;
				/*clear pron name even if we did it with the dic*/
				pKsd_t->pronflag &= (~PRON_ACNA_NAME);
			}
			else
			{
				pLts_t->namef++;
			}
		}
		else
		{
			pLts_t->namef=0;
		}
	
		/* find out if one of the what words are at the beginning of the clause */
		done=ls_task_set_what_state(phTTS,pLts_t);

		if (!done)
		{
			/* find the end of the word */
			llp = &(pLts_t->cword[0]);
			ls_task_find_end_of_word(llp,&rlp,&elp);

#ifdef LS1DEBUG
			printf("after find end of word ");
			printf("left=%u  right=%u\n",llp,rlp);
#endif
			/*
			 * Bow out quickly on null words.
			 * These happen when you type something like
			 * "[ax] there.". The schwa gets copied right into
			 * the output, and the current word is null.
			 */
			if (llp == rlp) 
			{
				ls_task_do_right_punct(phTTS,MISS);
				ls_task_readword(phTTS,&(pLts_t->cword[0]));
				// add 1 to isnumabr to restore the value from before the null word
				// another fix for 43 sq. ft. with multiple index marks
				if (pLts_t->isnumabr)
				{
					pLts_t->isnumabr++;
				}
				continue;
			}
		}
		if (!done) 
			done=ls_task_spell_mode(phTTS,llp,rlp);
		
		if (!done) 
			done=ls_task_minidic_search(phTTS,llp,rlp); 
		
		if (!done) 
			done=ls_task_math_mode(pKsd_t,llp,rlp);
		
		if (!done) 	
			done = ls_task_dictionary_search(phTTS,llp,rlp);

#ifdef GERMAN_out //because it nicht gerverken un reiner's stuff goes gaga
		if (!done)
		{
			if (ls_task_fix_german_vowels(pLts_t,llp,&rlp))
			{
				done=ls_task_dictionary_search(phTTS,llp,rlp);
			}
		}
#endif


#if 0 //comment out for now breaks in Windows CE mfg 03/21/2000
		if (!done)
		{
			done=ls_task_dictionary_search(phTTS,llp,rlp);
			//eab 10/5/99 if we messed with prefix fix up pointers 
			if (done <0)
			{
				while(done <0)
				{
					rlp --;
					done++;
				}
#ifdef _DEBUG 
#ifndef UNDER_CE
			printf("hit it \n");
#endif
#endif // _DEBUG
			//eab what if prefix-looks like another prefix imim should be ok
			done=ls_task_dictionary_search(phTTS,llp,rlp);
			}
		}
#endif // 0

		if (!done)
			ls_task_strip_left_punctuation(pLts_t,&llp,rlp);        

		if (!done)
			ls_task_strip_right_punctuation(pLts_t,llp,&rlp);

		if (!done)
			done=ls_task_spell_all_punct(phTTS,llp,rlp,&(pLts_t->cword[0]),elp);
	
		if (!done)
			done=ls_task_dictionary_after_punct(phTTS,llp,&rlp);

		if (!done)
			done=ls_task_spell_vs_speak(phTTS,llp,rlp);

		if (!done)
			done=ls_task_single_letter_spell_rules(phTTS,llp,rlp);

		/*
		 * We are getting ready to feed this
		 * thing to the default processing rules. The
		 * first step is to fold out case distinctions and
		 * diacritical marks. We used to rescan the dictionary
		 * if anything changed; we don't do it anymore because
		 * the dictionary lookup was made more clever, and
		 * understands case distinctions.
		 */
		if (!done) 
			ls_util_is_name(phTTS,llp,rlp);
		
		/* MGS 6/16/97 BATS #387  added to keep oroginal word */
		if (!done) 
			memcpy(&origword,&(pLts_t->cword),sizeof(origword));
		
		if (!done) 
			ls_task_remove_case(llp,rlp);

#ifdef ENGLISH
		if (!done) 
			done=ls_task_Dr_St_process(phTTS,llp,rlp);
#endif
		
		if (!done) 
			done=ls_task_set_sign_flag(phTTS,llp,rlp,&lp1);

#ifndef FRENCH
		if (!done) 
			done=ls_task_currency_processing(phTTS,lp1,rlp);
#else
		if (!done) 
			done=ls_task_currency_processing(phTTS, llp, lp1, rlp);
#endif // FRENCH
		if (!done) 
			done=ls_task_date_processing(phTTS,llp,rlp);
		
		if (!done) 
			done=ls_task_frac_processing(phTTS,lp1,rlp);
		
		if (!done) 	
			done=ls_task_plain_number_processing(phTTS,llp,rlp,lp1);

		/*	
		 * Well, all of the fancy heuristics have
		 * failed. Either this is just an ordinary word, or it
		 * is garbage. This first scan looks for things that might
		 * actually be part numbers, and runs the standard part
		 * number rules.
		 */

		/* MGS 6/16/97 BATS #387  added to restore oroginal word */
		if (!done) 
			memcpy(&(pLts_t->cword),&origword,sizeof(origword));
		
		if (!done) 
			done=ls_task_part_number(phTTS,llp,rlp);
	
		
		if (!done) 
			done=ls_task_process_word(phTTS,llp,rlp);
#ifndef FRENCH
		switch (done)
		{
			case LS_TASK_LOOP:
				continue;
			case SPELL_WORD:
				ls_task_spell_word(phTTS,llp,rlp);
				break;
			case FINISHED_WORD:
				ls_task_read_next_word(phTTS);
				break;
		}
#else
		switch (done)
		{   /* no break : we have to do 1 then 2, etc */
    		/*
      			1 : Gets things spelled
      			2 : Means the word was handled by 1:, lookup, dodate, dotime,
        			dofrac, donumber, dopartnumber, or lts with -
          			Process any right hand punctuation
          			in 1: and 2:, no linking with this word, and the following
      			3 : read next word
      			4 : Next read, loop around for another word
    		*/
      		case 1:
				// speed=spellspeed (llp, rlp);
				ls_spel_spell(phTTS, llp, rlp);
      		case 2:
    			if ( pLts_t->rbphone!=WBOUND && ls_util_is_white(&(pLts_t->citem)) ) 
				{	ls_util_send_phone (phTTS, pLts_t->rbphone);
      				while (ls_util_is_white(&(pLts_t->citem))) 
					{	ls_util_read_item(phTTS);
        				while (ls_util_is_index(&(pLts_t->citem)) || (pLts_t->citem.i_word[0]==SYNC)) 
						{	ls_util_write_item(phTTS);
          					ls_util_read_item(phTTS);
	        			} /* while */
    	  			} /* while */
    			} /* if */

				// sendindex (rlp, elp);
      		case 3 :
    			/* DoRPunct : send punctuation in citem, modify contgc */
    			ls_task_do_right_punct(phTTS, MISS);
    			ls_task_readword (phTTS, pLts_t->cword);
      		case 4:
    			if (!(pLts_t->contgc)) 
					strcpy(pLts_t->precedent, ""); /* don't keep cword as left context */
    	} /* switch */
#endif	// FRENCH

#ifdef NEW_LTS
		}
#endif
	}
}

/* ******************************************************************
 *  Function Name:
 *      ls_task_parse_number() 
 *
 *  Description:
 *		Scan a number. The "llp" is where
 * 		you start. The "rlp" is as far as you can go.
 * 		The "np" points to a NUM structure that gets filled
 * 		in. Return the right hand end of the scanned off
 * 		characters. This routine understands about the two
 * 		multinational characters "1/2" and "1/4". They are
 * 		part of the integer part of the number, and
 * 		block the scanning of additional stuff.
 *
 *
 *  Arguments:	LPTTS_HANDLE_T phTTS
 *				LETTER *llp
 *				LETTER *rlp
 *				NUM *np
 *
 *  Return Value: LETTER  *
 *
 *  Comments:
 *
 * *****************************************************************/

LETTER  *ls_task_parse_number(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp, NUM *np)
{
	LETTER  *tlp1;
	LETTER  *tlp2;
	int     ncbs;   
	int break_flag;
	PLTS_T  pLts_t;
	PKSD_T  pKsd_t;

	pLts_t = phTTS->pLTSThreadData;
	pKsd_t = phTTS->pKernelShareData;   

	np->n_ilp = NULL;                       /* Null scan. */
	np->n_flp = NULL;
	np->n_elp = NULL;
	tlp1 = llp;
	if (tlp1 != rlp
	&& (tlp1->l_ch == 0xBC                  /* 1/4 */
	||  tlp1->l_ch == 0xBD                  /* 1/2 */
	||  IS_DIGIT(tlp1->l_ch))) 
	{
		np->n_ilp = tlp1;
		while (tlp1 != rlp) 
		{
			/* 1/2 and 1/4. */
			if (tlp1->l_ch==0xBC || tlp1->l_ch==0xBD) 
			{
				++tlp1;
				np->n_irp = tlp1;
				return (tlp1);
			}
			/* Comma (period if this is MODE_EUROPE).*/
			if (tlp1->l_ch == pLts_t->schar) 
			{
				tlp2 = tlp1;
				ncbs = 3;
				break_flag = 0;
				while (ncbs-- && tlp2!=llp) 
				{
					--tlp2;
					if (tlp2->l_ch == pLts_t->schar)
                    {						
						break_flag = 1;
						break;
				    }
				}    
				if (break_flag)
				   break;
				if (tlp2!=llp && (tlp2-1)->l_ch!=pLts_t->schar)
					break;
				tlp2 = tlp1+1;
				ncbs = 3;
				while (ncbs--) 
				{
					if (tlp2==rlp || !IS_DIGIT(tlp2->l_ch))
					{
					   break_flag = 1;
					   break;
					}	
					++tlp2;
				}
				
				if (break_flag)
				   break;
				   
				/*
				 * The normal DECtalk code does not
				 * make this check; instead, it implemented
				 * the exact rules of the DECtalk I. Peter
				 * Stevens at Kurzweil thought that this extra
				 * check was appropriate, and I tend to
				 * agree with him. We should probably make
				 * this change in all DECtalk code.
				 */
				/* Note from EAB-I have looked at this and 
				 * can't figure out how it makes the dectalk
				 * do anything different, but for chicken 
				 * soup reasons I'm leaving it in. 
				 */     

				if (tlp2!=rlp && IS_DIGIT(tlp2->l_ch))
					break;
				++tlp1;
				continue;
			}
			if (IS_DIGIT(tlp1->l_ch)) 
			{
				++tlp1;
				continue;
			}
			break;
		}
		np->n_irp = tlp1;
	}
	if (tlp1!=rlp && tlp1->l_ch==pLts_t->fchar) 
	{   /* Fraction             */
		np->n_flp = tlp1;
		++tlp1;
		while (tlp1!=rlp && IS_DIGIT(tlp1->l_ch))
			++tlp1;
		np->n_frp = tlp1;
	}
	if (tlp1!=rlp && tlp1->l_ch=='e' && (pKsd_t->modeflag & MODE_MATH)) 
	{        /* Exponant.            */
		tlp2 = tlp1;
		++tlp1;
		if ( tlp1!=rlp && (tlp1->l_ch=='+' || tlp1->l_ch=='-'))
			++tlp1;
		if (tlp1!=rlp && IS_DIGIT(tlp1->l_ch)) 
		{
			np->n_elp = tlp2;
			++tlp1;
			while (tlp1!=rlp && IS_DIGIT(tlp1->l_ch))
				++tlp1;
			np->n_erp = tlp1;
		}
	}
	return (tlp1);
}


/* ******************************************************************
 *  Function Name:
 *      ls_task_wlookup() 
 *
 *  Description:
 * 		The "word" is just an array of
 * 		LETTER structures, containing a word which
 * 		might just be special. Look it up in a table, and
 * 		return either the phoneme string, or NULL, which
 * 		indicates "no match". Case insensitive. Each
 * 		table entry consists of a size, a text string
 * 		with an EOS on the end, and a bunch of bytes
 * 		that are usually phonemes.
 *
 *  Arguments:	PLTS_T pLts_t
 *				LETTER word[]
 *				unsigned char table[]
 *
 *  Return Value: char*
 *
 *  Comments:
 *
 * *****************************************************************/

char  *ls_task_wlookup(PLTS_T pLts_t, LETTER word[], unsigned char table[])
{
	LETTER  *lp;
	/* GL 03/20/1998, BATS#633  use "unsigned char" instead of "char" */
	unsigned char  	*cp;
	unsigned char  	*tp;
	int   	c;
	int   	len;

	tp = &table[0];                 /* Start at the start.  */
	while ((len = *tp++) != 0) 
	{            					/* 0 => end of table.   */
		lp = &word[0];              
		cp = tp;                    /* Start of text.       */
		for (;;) 
		{
			c = ls_lower[lp->l_ch]; /* Fold case.           */
			if (c != *cp++)         /* Lose.                */
				break;
			if (c == EOS)           /* Win.                 */
            {
#ifdef ENGLISH
#ifdef NEW_LTS
                 /* set form class for "to" */
                 if (ls_lower[(&word[0])->l_ch] == 't') pLts_t->word_info[pLts_t->cur_word_index].form_class = FC_TO | FC_PREP | FC_FUNC;
                 /* set form class for "and" */
                 if (ls_lower[(&word[0])->l_ch] == 'a') pLts_t->word_info[pLts_t->cur_word_index].form_class = FC_CONJ | FC_VERB | FC_FUNC;
                 /* set form class for "for" */
                 if (ls_lower[(&word[0])->l_ch] == 'f') pLts_t->word_info[pLts_t->cur_word_index].form_class = FC_ADV | FC_PREP | FC_NEG;
#else
                 /* set form class for "to" */
                 if (ls_lower[(&word[0])->l_ch] == 't') pLts_t->fc_struct[pLts_t->fc_index] = FC_TO | FC_PREP | FC_FUNC;
                 /* set form class for "and" */
                 if (ls_lower[(&word[0])->l_ch] == 'a') pLts_t->fc_struct[pLts_t->fc_index] = FC_CONJ | FC_VERB | FC_FUNC;
                 /* set form class for "for" */
                 if (ls_lower[(&word[0])->l_ch] == 'f') pLts_t->fc_struct[pLts_t->fc_index] = FC_ADV | FC_PREP | FC_NEG;
#endif
#endif
                 return (cp);    	/* Return phonemes.     */
            }
			++lp;   
		}
		tp += len;                  /* Next.                */
	}
	return (NULL);
}

/* ******************************************************************
 *  Function Name:
 *      ls_task_lookahead()  
 *
 *  Description:
 * 		Advance the current item, in anticipation 
 * 		of a ls_task_lookahead. The only tricky stuff has to do with
 * 		index marks, which have to be appended to the current
 * 		word. The index nodes are linked together via the
 * 		"p_ip" field. The current word must not be empty
 * 		or this routine will die a horrible death.
 *
 *  Arguments: PLTS_T pLts_t
 *
 *  Return Value: void
 *
 *  Comments:
 *
 * *****************************************************************/
void ls_task_lookahead(PLTS_T pLts_t)
{
    LETTER	*elp;

	if (ls_util_is_index(&(pLts_t->citem)) == FALSE)	/* Duck if no index     */
		return;
	elp = &(pLts_t->cword[0]);                        	/* Find end of word,    */
	while ((elp+1)->l_ch != EOS)
	{
		++elp;
	}
}

/* ******************************************************************
 *  Function Name:
 *      ls_task_do_right_punct  
 *
 *  Description:
 * 	After a word is spoken, this
 * 	routine is called to process its right
 * 	(delimiter) punctuation. A phoneme is usually
 * 	sent to the synthesizer. This routine is also
 * 	responsible for updating the "pLts_t->wstate" when
 * 	the end of a clause is reached. The "flag" tells
 * 	the state of the last dictionary search. The 
 * 	only interesting case is "ABBREV", because a
 * 	"." may be a clause terminator too.
 *
 *  Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *				int flag
 *
 *  Return Value: void
 *
 *  Comments:
 *
 * *****************************************************************/
void ls_task_do_right_punct(LPTTS_HANDLE_T phTTS,int flag)
{
	int   c;
	short   buf[1];
	PLTS_T  pLts_t;
	PKSD_T  pKsd_t;

	pLts_t = phTTS->pLTSThreadData;
	pKsd_t = phTTS->pKernelShareData;

	if ((pLts_t->citem.i_word[0]&PFONT) != (PFASCII<<PSFONT))
		return;
	c = pLts_t->citem.i_word[0] & PVALUE;
	if (flag==ABBREV && (c==CR || c==LF)) 
	{
		ls_util_send_phone(phTTS,PERIOD);
		pLts_t->wstate = UNK_WH;

/* GL 11/06/1997 add switch 4100. form class log can be used by any language */
//#ifdef ENGLISH		
		if((pKsd_t->logflag& LOG_FORM_TYPES) || DT_DBG(LTS_DBG,0x100))
		{
#ifndef ARM7_NOSWI
			ls_suff_print_fc(phTTS);
#endif
		}
//#endif
		return;
	}
	switch (c) 
	{
		case '.':
#ifdef GERMAN
			/* GL 03/23/1998, BATS#613 remove the extra pulse for German ordinal number */
			if (ls_util_is_dot(pLts_t) && pLts_t->isnumabr == 3)
				;
			else
			ls_util_send_phone(phTTS,PERIOD);
#else
			ls_util_send_phone(phTTS,PERIOD);
#endif
/* GL 11/06/1997 add switch 4100. form class log can be used by any language */
//#ifdef ENGLISH			
			if((pKsd_t->logflag & LOG_FORM_TYPES) || DT_DBG(LTS_DBG,0x100))
			{
#ifndef ARM7_NOSWI
				ls_suff_print_fc(phTTS);
#endif
			}
//#endif				
			ls_util_read_item(phTTS);
			pLts_t->wstate = UNK_WH;
			break;

		case '?':
			if (pLts_t->wstate == IS_WH)    			/* Ignore the "?" if at */
			{
#ifdef LS1DEBUG
				printf("Changing question mark to period! \n");
#endif
				ls_util_send_phone(phTTS,PERIOD);       /* the end of a "Wh..." */
			}
			else                            			/* style sentence.      */
			{
				ls_util_send_phone(phTTS,QUEST);
			}
/* GL 11/06/1997 add switch 4100. form class log can be used by any language */
//#ifdef ENGLISH
		    if((pKsd_t->logflag& LOG_FORM_TYPES) || DT_DBG(LTS_DBG,0x100))
			{
#ifndef ARM7_NOSWI
				ls_suff_print_fc(phTTS);
#endif
			}
//#endif
			ls_util_read_item(phTTS);
			pLts_t->wstate = UNK_WH;
			break;

		case '!':
			ls_util_send_phone(phTTS,EXCLAIM);

			ls_util_read_item(phTTS);
/* GL 11/06/1997 add switch 4100. form class log can be used by any language */
//#ifdef ENGLISH			
		    if((pKsd_t->logflag& LOG_FORM_TYPES) || DT_DBG(LTS_DBG,0x100))
			{
#ifndef ARM7_NOSWI
				ls_suff_print_fc(phTTS);
#endif
			}
//#endif				
			pLts_t->wstate = UNK_WH;
			break;

		case VT:
		    /* Vertical tab, flush  */
		    /*
			   GL 01/31/1996, need to initialize the form class state for
			   control-k(VT)
			*/
/* GL 11/06/1997 add switch 4100. form class log can be used by any language */
//#ifdef ENGLISH			
			if((pKsd_t->logflag& LOG_FORM_TYPES) || DT_DBG(LTS_DBG,0x100))
			{
#ifndef ARM7_NOSWI
				ls_suff_print_fc(phTTS);
#endif
			}
//#endif				
#ifndef NEW_LTS
			pLts_t->fc_index = 0;
			pLts_t->old_fc_index = -1;
			pLts_t->fc_struct[0] = 0;
			pLts_t->fc_struct[1] = 0;
#endif

			buf[0] = BREATH_BREAK;
			ls_util_write_pipe(pKsd_t,&buf[0],1);
			ls_util_read_item(phTTS);
			break;

		case ',':
		case ':':
		case ';':
		case HT:                                /* Tab, longish pause   */

#ifndef NEW_LTS
			pLts_t->fc_index = 1;
			pLts_t->old_fc_index = -1;
			pLts_t->fc_struct[0] = 0;
			pLts_t->fc_struct[1] = 0;
#endif
			ls_util_send_phone(phTTS,COMMA);
			ls_util_read_item(phTTS);
			break;

		case ' ':                               /* ASCII SP             */
		case 0xA0:                              /* Multinational SP     */
		case LF:                                /* Linefeed             */
		case FF:                                /* Formfeed             */
		case CR:                                /* Carriage return.     */
			if ((pKsd_t->modeflag&MODE_SPELL)!=0)
				ls_util_send_phone(phTTS,COMMA);       /* Make longer pause if */
			else                            /* forced spelling.     */
				ls_util_send_phone(phTTS,WBOUND);
			ls_util_read_item(phTTS);
			break;
	}
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_readword()
 *
 *  Description:        
 *      this function reads a word in from the pipe and stores it in
 *      an array of LETTER nodes.  Any index marks are placed in
 *      PHONE nodes and attached to the LETTER nodes.
 *
 * 		Read in a word. Store the letters, and the
 * 		associated index marks, into the array of LETTER
 * 		nodes passed as an argument. Any index marks found
 * 		during the read are packed into PHONE nodes and
 * 		attached to the LETTER nodes. This may not be very
 * 		easy to understand if you don't have the big
 * 		state machine flow in the DECtalk III notebook.
 *
 *  Arguments:                                           
 *      LPTTS_HANDLE_T phTTS    pointer to the instance specific stuff
 *      LETTER word[]			The array of LETTER nodes to store the word in
 *
 *  Return Value:                                     
 *      void
 *
 *  Comments:
 *      the maximum word read is NGWORD-1
 *
 * *****************************************************************/
void ls_task_readword(LPTTS_HANDLE_T phTTS,LETTER word[])
{
	LETTER        *lp1;
	LETTER        *lp2;
	int   ksf=0;
	int   t;
	int   c=0;
	int second_time=0;
	PLTS_T  pLts_t;
	PKSD_T  pKsd_t;

	pLts_t = phTTS->pLTSThreadData;
	pKsd_t = phTTS->pKernelShareData;   
	
/*
 *  start with no flags for this word ...
 */
	while (ls_util_is_white(&(pLts_t->citem)) != FALSE) 
	{      /* Skip spaces.         */
		ls_util_read_item(phTTS);
		while (ls_util_is_index(&(pLts_t->citem)) != FALSE) 
		{
			ls_util_write_item(phTTS);
			ls_util_read_item(phTTS);
		}
	}
	lp1 = &word[0];                         /* Current location     */
	lp2 = &word[0];                         /* Rightmost location   */
	ksf = FALSE;                            /* Nothing kept         */
        
/* JDB: simple fix to avoid the goto's that used to be here */
/* loop: */
#ifdef SINGLE_THREADED
	while (pLts_t->cur_read_pos<=pLts_t->cur_input_pos) 
#else
	while (TRUE)
#endif
  { 
#ifdef SINGLE_THREADED
	if (second_time)
		break;
	if (pLts_t->cur_read_pos==pLts_t->cur_input_pos)
		second_time=1;
#endif
		if (ls_util_is_index(&(pLts_t->citem)) != FALSE)
		{         
			/* Index markers.       */
			if (lp1 == &word[0])            /* Flush through if at  */
			{
				ls_util_write_item(phTTS);  /* left edge of word.   */
				ls_util_read_item(phTTS); /* read next item */ 
				/* an item is a character with a bunch of other info about it */
				continue; /* goto loop; */
			}
			else
			{
				break;
			}

		}

		t = PHONEME;
		if ((pLts_t->citem.i_word[0]&PFONT) == (PFASCII<<PSFONT)) 
		{
			c = pLts_t->citem.i_word[0] & PVALUE;
			t = lsctype[c] & TYPE;
			if (t == IGNORE) 
			{   
				/* These two are easy.  */
				ls_util_read_item(phTTS);
				continue; /* goto loop; */
			}
			if (t == BACKUP) 
			{
				if (lp1 != &word[0])
					--lp1;           
				ls_util_read_item(phTTS);
				continue; /* goto loop; */
			}
		}
		
		if (lp1 < lp2) 
		{                        /* Overstrike.          */

			if (t==MIGHT || t==ALWAYS)
			{
				if ((lsctype[c]&II) == 0)
					lp1->l_ch = c;
				++lp1;
				ls_util_read_item(phTTS);
				continue; /* goto loop; */
			}
		} 
		else
		{
 
			if (lp1 == &word[0])
			{           /* Initial position.    */
				if (t == PHONEME) 
				{
					ls_util_write_item(phTTS);
					ls_util_read_item(phTTS);
					ksf = TRUE;             /* Kept something       */
				continue; /* goto loop; */
				}

				if (t==ALWAYS || (t==MIGHT && ksf==FALSE)) 
				{

					lp1->l_ch = c;
					//	lp1->l_ip = NULL;
					++lp1;
					++lp2;
					ls_util_read_item(phTTS);
					ksf = TRUE;             /* Kept something.      */
				continue; /* goto loop; */
				}
#ifdef FRENCH
				if (t==SINGLE)
				{
					lp1->l_ch=c;
					++lp1;
					++lp2;
					ksf=TRUE;
					ls_util_read_item(phTTS);
				}
#endif
			}
			else 
			{
				if (t==ALWAYS || (t==MIGHT && ls_util_is_might(phTTS)!=FALSE)) 
				{
					if (lp1 < &word[NGWORD-1]) 
					{
						lp1->l_ch = c;
						//	lp1->l_ip = NULL;
						++lp1;
						++lp2;
					}
					ls_util_read_item(phTTS);
				continue; /* goto loop; */
				}
			}
		}
		break;
	}

	lp1->l_ch = EOS;
	// lp1->l_ip = NULL; 
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_spell_word
 *
 *  Description:          
 *      Spell the word that is bounded by llp and rlp and 
 *          then read the next wod from the pipe
 *
 *  Arguments:
 *		LPTTS_HANDLE_T	Text-to-speech handle
 *      LETTER *llp     the left bounding pointer of the word
 *      LETTER *rlp     The right bounding pointer of the word
 *
 *  Return Value:                                             
 *      NONE
 *
 *  Comments:
 *
 * *****************************************************************/
void ls_task_spell_word(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{     

	int     speed;
	PLTS_T pLts_t;
	
	pLts_t=phTTS->pLTSThreadData;

#ifdef LS1DEBUG
			printf(" gok spell\n");
#endif
		   
		   
	speed = FAST;/* always fast now ls_spel_spell_speed(llp, rlp);*/
#ifdef NEW_LTS
	pLts_t->word_info[pLts_t->cur_word_index].form_class = FC_NOUN;
#else
	pLts_t->fc_struct[pLts_t->fc_index] = FC_NOUN;
#endif
	ls_spel_spell(phTTS,llp, rlp);
	if (speed!=FAST && rlp!=llp+1 && pLts_t->rbphone==WBOUND)
		pLts_t->rbphone = COMMA;        
	/* BATS 490 MGS 10/08/1997 fix for A. B. C. problem ??? */
	if (pLts_t->rbphone==PERIOD)
	{
		ls_util_send_phone(phTTS,PERIOD);
	}
	ls_task_read_next_word(phTTS);
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_read_next_word()
 *
 *  Description:              
 *      after a word has been spoken read the enxt word from the pipe
 *
 *  Arguments:                                                       
 *      LPTTS_HANDLE_T phTTS	text-to-speech handle
 *
 *  Return Value:
 *      void
 *
 *  Comments:
 *
 * *****************************************************************/
void ls_task_read_next_word(LPTTS_HANDLE_T phTTS)
{
	PLTS_T pLts_t;
	
	pLts_t=phTTS->pLTSThreadData;
#ifdef LS1DEBUG
	printf(" got to out\n");
#endif
	if (pLts_t->rbphone!=WBOUND && ls_util_is_white(&(pLts_t->citem))!=FALSE) 
	{
		ls_util_send_phone(phTTS,pLts_t->rbphone);
		while (ls_util_is_white(&(pLts_t->citem)) != FALSE) 
		{
			ls_util_read_item(phTTS);
			while (ls_util_is_index(&pLts_t->citem) != FALSE) 
			{
				ls_util_write_item(phTTS);
				ls_util_read_item(phTTS);
			}
		}
	}
	ls_task_do_right_punct(phTTS,MISS);
	ls_task_readword(phTTS,&(pLts_t->cword[0]));
}
	 
/* ******************************************************************
 *  Function Name:  
 *      ls_task_set_what_state
 *
 *  Description:    
 *      this function sets the pLts_t->wstate flag if the first word in a clause
 *      is in the whdic.  
 *
 *  Arguments:            
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      PLTS_T  pLts_t			a pointer to the thread specific data
 *
 *  Return Value:
 *      None
 *
 *  Comments:
 *      the pLts_t->wstate flag is used in ls_task_do_right_punct to change a ?
 *      to a . if pLts_t->wstate is set to IS_WH
 *
 * *****************************************************************/
int ls_task_set_what_state(LPTTS_HANDLE_T phTTS, PLTS_T pLts_t)  
{
	LETTER *llp;
#ifdef LS1DEBUG
		printf("entering ls_task_set_what_state\n");
#endif
	if (pLts_t->wstate==UNK_WH && pLts_t->cword[0].l_ch!=EOS)
	{
#ifdef NEW_LTS
		// This will probably have to change when the rest of the stuff is done
		if (pLts_t->first_pass)
		{
			pLts_t->cur_word_index = 1;
//			pLts_t->old_fc_index = -1;
			pLts_t->word_info[0].form_class = 0;
			pLts_t->word_info[1].form_class = 0;
		}
#else
		pLts_t->fc_index = 1;
		pLts_t->old_fc_index = -1;
		pLts_t->fc_struct[0] = 0;
		pLts_t->fc_struct[1] = 0;
#endif // NEW_LTS

		pLts_t->wstate = NOT_WH;
		llp = &(pLts_t->cword[0]);
		while ((lsctype[llp->l_ch]&LS) != 0)
			++llp;                                              

#if defined (ENGLISH) || defined (GERMAN)
		// CAB 08/15/2002	Removed warnings by typecast
		if ( (ls_task_wlookup(pLts_t, llp,(unsigned char *)&whdic[0])) != NULL)
		{
			pLts_t->wstate = IS_WH;
		}        
#ifdef ENGLISH
/* MGS 8/20/97 hack for stressing first words in the sentence for kerzweil */
		//eab 1/1199 Modify the stress to a secondary stress which is more appropriate.
		if (ls_task_lookup_first_verbs(phTTS))
			return(FINISHED_WORD);
#endif // ENGLISH
#endif // defined (ENGLISH) || defined (GERMAN)
#ifdef FRENCH
		if ( ls_lower[(char)llp->l_ch]=='q' && (llp+1)->l_ch=='u' ) 
		{
			pLts_t->wstate = IS_WH;
		}
#endif
#ifdef SPANISH
		// CAB 08/15/2002	Removed warnings by typecast
	  	if ((ls_task_wlookup(pLts_t, llp, (unsigned char *)&spwhword[0])) != NULL)
		{
			/*	we need to look at potential legal combinations of wh
				question introducers so if first word is an introducer
				then firstnum !=0 and wstate is rest to UNK_wh indicating
				beginning of sentence
			*/
/* 		   sendlist(cp);*/
			pLts_t->wstate = IS_WH;
/*			goto out; */
		}
	  	else if (ls_task_wlookup(pLts_t, llp, (unsigned char*)&spwhword[0]) != NULL)	// CAB 08/15/2002	Removed warnings by typecast
		{
			pLts_t->wstate = UNK_WH;			
			/*pretend start of sentence*/
			/*becuase got an intro word*/
		}

#endif
		
	}   /*  if (pLts_t->wstate==UNK_WH && cword[0].l_ch!=EOS) */
#ifndef FRENCH
	else
	{
#ifdef NEW_LTS
		if (pLts_t->first_pass)
		{
			if((pLts_t->cword[0].l_ch!=SIL ) && pLts_t->cur_word_index != MAX_WORDS)
			{
				pLts_t->cur_word_index += 1;
				pLts_t->word_info[pLts_t->cur_word_index].form_class = 0;
			}
		}
#else
		if((pLts_t->cword[0].l_ch!=SIL ) && pLts_t->fc_index != sizeof(pLts_t->fc_struct)/4)
		{
			pLts_t->fc_index += 1;
			pLts_t->fc_struct[pLts_t->fc_index] = 0;
		}
#endif // NEW_LTS
	}   /*  if (pLts_t->wstate==UNK_WH && cword[0].l_ch!=EOS) */
#endif // FRENCH
	return(KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:                      
 *      ls_task_find_end_of_word()
 *
 *  Description:                
 *      finds the end of the word contained the global cword array
 *
 *  Arguments:
 *      LETTER  *llp    the left bounding pointer to the word
 *      LETTER **rlp    the right bounding pointer to the word
 *      LETTER **elp    another pointer (set to the value of rlp)
 *
 *  Return Value:                               
 *      None
 *
 *  Comments:
 *      rlp and elp are set by this function and passed back to the 
 *      caller
 *
 * *****************************************************************/
void ls_task_find_end_of_word(LETTER *llp, LETTER **rlp, LETTER **elp)
{
#ifdef LS1DEBUG
		printf("entering ls_task_find_end_of_word\n");
#endif
	(*elp) = llp;
	while ((*elp)->l_ch != EOS) /* find the end of the word ?? */
	{
#ifdef LS1DEBUG
			printf(" %02x %c \n",(*elp)->l_ch,(*elp)->l_ch);
#endif   
		
		++(*elp);               
	}
#ifdef LS1DEBUG
		printf (" %02x %c \n",(*elp)->l_ch,(*elp)->l_ch);
#endif
	
	(*rlp) = (*elp);
	
#ifdef LS1DEBUG
		printf("found the end of word ");
		printf("left=%u  right=%u\n",llp,*rlp);
#endif
}

/* ******************************************************************
 *  Function Name:                      
 *      ls_task_fix_german_vowels()
 *
 *  Description:                
 *      converts the ae oe and ue vowels to their umlated cousins
 *
 *  Arguments:
 *		PLTS_T pLts_t
 *      LETTER  *llp    the left bounding pointer to the word
 *      LETTER **rlp    the right bounding pointer to the word
 *
 *  Return Value:                               
 *      Int				returns if the dictionar shoudl be searched again with this
 *						new word.
 *
 *  Comments:
 *		This function can be optimized a little (but not much)
 *
 *
 * *****************************************************************/
int ls_task_fix_german_vowels(PLTS_T pLts_t, LETTER *llp, LETTER **rlp)
{
	int ret=0;
	int move=0;
	LETTER *elp;
	LETTER *flp;
	//mgs fix for	u eab added eue fix for neue...
	for (elp=llp;elp->l_ch!=EOS;elp++)
	{
		if (ls_lower[(elp->l_ch)]=='q' && (ls_lower[((elp+1)->l_ch)]=='u'))
		{
			elp++;
			continue;
		}
		if (ls_lower[(elp->l_ch)]=='e' && (ls_lower[((elp+1)->l_ch)]=='u'))
		{
			elp++;
			continue;
		}
		if (ls_lower[((elp+1)->l_ch)] == 'e')
		{
			switch (elp->l_ch)
			{
			case 'a':
				elp->l_ch=(unsigned char)'ä';
				move=1;
				break;
			case 'A':
				elp->l_ch=(unsigned char)'Ä';
				move=1;
				break;
			case 'o':
				elp->l_ch=(unsigned char)'ö';
				move=1;
				break;
			case 'O':
				elp->l_ch=(unsigned char)'Ö';
				move=1;
				break;
			case 'u':
				elp->l_ch=(unsigned char)'ü';
				move=1;
				break;
			case 'U':
				elp->l_ch=(unsigned char)'Ü';
				move=1;
				break;
			}
			if (move)
			{
				move=0;
				ret=1;
				for (flp=elp+1;flp->l_ch!=EOS;flp++)
				{
					flp->l_ch=(flp+1)->l_ch;
				}
				(*rlp)--;
			}
		}
	}
	return(ret);
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_spell_mode()
 *
 *  Description:          
 *      this function handles the case when [:mode spell on] is used
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_spell_mode(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
	/*
	 * Word spelling.
	 * A new feature for AT&T - IS.
	 * Spell the word using the fast spelling speed.
	 * These is some special code in "ls_task_do_right_punct" that
	 * helps out word spelling, by speaking " "
	 * (between words) as COMMA.
	 */  
	PLTS_T  pLts_t;
	PKSD_T  pKsd_t;

	pLts_t = phTTS->pLTSThreadData;
	pKsd_t = phTTS->pKernelShareData;   

#ifdef LS1DEBUG
		printf("entering ls_task_spell_mode\n");
#endif
	if ((pKsd_t->modeflag&MODE_SPELL)!=0) 
	{

#ifdef LS1DEBUG
		printf(" mode spell spell\n");
#endif

		ls_spel_spell(phTTS,llp, rlp);
#ifndef FRENCH
		ls_task_do_right_punct(phTTS,MISS);
		ls_task_readword(phTTS,&(pLts_t->cword[0]));

		return(LS_TASK_LOOP);
#else
		return 3;
#endif // FRENCH
	}                  
	return(KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_minidic_search()
 *
 *  Description:              
 *      search the mini dictionary sdic for any word in it
 *      the words currently in it are  'for' 'and' 'to'
 *      these words ahve special pronunciations and attrubutes
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_minidic_search(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
#if (defined ENGLISH) || (defined SPANISH)
	char    *cp;
	PLTS_T  pLts_t;
	PKSD_T  pKsd_t;

	pLts_t = phTTS->pLTSThreadData;
	pKsd_t = phTTS->pKernelShareData;   
#ifdef LS1DEBUG
		printf("entering ls_task_minidic_search\n");
#endif
	// CAB 08/15/2002	Removed warning by typecast
	if ( (cp = (char *)ls_task_wlookup(pLts_t, llp, (unsigned char *)&sdic[0])) != NULL)
	{       /*eab mini dictionary lookup */
		ls_util_send_phone_list(phTTS,cp);
		pLts_t->lbphone=WBOUND;
		pLts_t->rbphone=WBOUND;
		return(FINISHED_WORD);
	}
#endif // (defined ENGLISH) || (defined SPANISH)
	return(KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_math_mode()
 *
 *  Description:
 *      this function handles pronouncing some punctuation correctly when
 *      [:mode math on] is used
 *
 *  Arguments:                                                      
 *		PKSD_T pKsd_t
 *      LETTER *llp     the left bounding pointer of the word
 *      LETTER *rlp     The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_math_mode(PKSD_T pKsd_t, LETTER *llp, LETTER *rlp)
{
	if (llp+1==rlp && (pKsd_t->modeflag & MODE_MATH))   
	{
		if (ls_math_do_math(pKsd_t,(unsigned char )llp->l_ch)!=FALSE)
			return(FINISHED_WORD);
	}
	return(KEEP_SEARCHING);
}


/* ******************************************************************
 *  Function Name:  
 *      ls_task_categ_gram()
 *
 *  Description:
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	text-to-speech handle
 *
 *  Return Value:                                   
 *		void
 *
 *  Comments:
 *
 * *****************************************************************/
#ifdef FRENCH
void ls_task_categ_gram(LPTTS_HANDLE_T phTTS)
{
	char *pt;
	char c;
	PLTS_T pLts_t = phTTS->pLTSThreadData;
//	PKSD_T pKsd_t = phTTS->pKernelShareData;
#ifdef DEBG
    //if (DbgLs1) printf ("ls1.c categgram entree\n");
#endif
	
	c = ls_lower [(char)(pLts_t->cword[0].l_ch)];
	
	pt = NULL;
	if ( c>='a' && c<='z' )
	{
		if (categ [c-'a'] != NULL) 
			pt = ls_task_wlookup(pLts_t, pLts_t->cword, (unsigned char *)categ[c-'a']);	// CAB 08/15/2002 removed warnings by typecast
	}
	else
	{	// CAB 08/15/2002 removed warnings by typecast
		pt = ls_task_wlookup(pLts_t, pLts_t->cword, (unsigned char *)categ[26]);
	}

	if (pt!=NULL) 
	{
		//sendpipe ((FRGC << 8) | *pt); 
		//send the grammatical category through the pipe
		//picked up in ph_task.c
		ls_util_send_phone( phTTS, ((FRGC << 8) | *pt));
	}
#ifdef DEBG
    if (DbgLs1) printf ("ls_task.c ls_task_categ_gram sortie %4x\n", (FRGC << 8) | *pt);
#endif
	
} /* ls_task_categ_gram */
#endif //FRENCH

/* ******************************************************************
 *  Function Name:  
 *      ls_task_dictionary_search()
 *
 *  Description:       
 *      this function searches the usd dictionary and the main dictionary
 *      looking out for abbreviations
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_dictionary_search(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
	int flag;
	int has_dot=0;

#ifdef WORK_IN_PROGRESS
	int i, count;
#endif

	int context;
	char    *cp;
	PLTS_T pLts_t;
	
	pLts_t = phTTS->pLTSThreadData;

#ifdef LS1DEBUG
		printf("entering ls_task_dictionary_search\n");
#endif

	/*
	 * Before you do *anything*, look up the word
	 * in the dictionaries. This gives the client the ability
	 * to override almost any built in rules (the only rules that
	 * must be used are the word framing rules). There are
	 * two big cases. If the word is at least 2 characters long,
	 * and the last character is a ".", then look up the root
	 * with the "." stripped (this is the "Gov.." case). There
	 * is no additional processing. Else check if the next
	 * character is a "."; if there is an abbreviation hit then
	 * the "." has to be eaten.
	 */

	/* 
	 * The dictionary uses the fact that it never gets passed a word
	 *	with a space at the bigging to store items that are to be spelled
	 *	in the spell routine but don't want to hit here such as numbers.
	 *	with numbers it does a ls_task_lookahead to see if the next item is in
	 *	nabtab
	 */

#ifdef LS1DEBUG
	printf("%c %02x -- %c %02x\n",llp->l_ch,llp->l_ch,(llp+1)->l_ch,(llp+1)->l_ch);
#endif

	if (rlp>=llp+2 && (rlp-1)->l_ch=='.' && ls_util_is_dot(pLts_t) == FALSE) 
	{	

		if ((flag = ls_util_lookup(phTTS,llp, rlp-1, FABBREV)) != MISS) 
		{
#ifndef FRENCH
			ls_task_do_right_punct(phTTS,flag);
			ls_task_readword(phTTS,&(pLts_t->cword[0]));
			return LS_TASK_LOOP;
#else
	return 3;
#endif // FRENCH
		}
	} 
	else 
	{
#ifdef FRENCH
		ls_task_categ_gram(phTTS);
#endif
		context = FIRST;
		if (ls_util_is_dot(pLts_t) != FALSE)
		{
			context = FABBREV;
			if (rlp>=llp+2 && (rlp-1)->l_ch=='.')
			{
				has_dot=1;
				(rlp-1)->l_ch=0;
			}
		}
		if (ls_util_is_clause(pLts_t)==TRUE && rlp>=llp+2 && (rlp-1)->l_ch=='.')
		{
			context=FABBREV;
			has_dot=1;
			(rlp-1)->l_ch=0;
		}
		/* xxxx eab 9/94 added to take care of 5 sq. ft. double
		abbrev in context*/
		/* Change 7/11/96 to fix 5 sq. ft. problem by removing pLts_t->isnumab.  GL */
		/* GL 11/21/1996, set the handling approach based on the language */
		/* GL 02/25/1997, restore pLts_t->isnumabr back  */  
#ifndef GWMICRO
#ifdef ENGLISH
		// CAB 08/15/2002 Removed warning by typecast
		if(pLts_t->isnumabr && context == FABBREV &&
			(cp=(char *)ls_task_wlookup(pLts_t, &(pLts_t->cword[0]), (unsigned char *)&nabtab[0])) != NULL)
#endif
#ifdef SPANISH
		/* GL 10/05/1998, Handle Spanish number abbreviation like German */
		/* if(pLts_t->isnumabr && context == FABBREV && */
		// CAB 08/15/2002 Removed warning by typecast
		if(pLts_t->isnumabr &&
			(cp=(char *)ls_task_wlookup(pLts_t, &(pLts_t->cword[0]), (unsigned char *)&nabtab[0])) != NULL)
#endif
#ifdef GERMAN
		// CAB 08/15/2002 Removed warning by typecast
		if(pLts_t->isnumabr &&
			(cp=(char *)ls_task_wlookup(pLts_t, &(pLts_t->cword[0]), (unsigned char *)&nabtab[0])) != NULL)
#endif
#ifdef FRENCH
		if (0)
#endif
		{
			if(pLts_t->pflag != FALSE)      /* Pick right form.     */
			{
				while (*cp++ != SIL);
			}
			ls_util_send_phone_list(phTTS,cp);  /* Send abbreviation.    */
			if (!has_dot)
				ls_util_read_item(phTTS);           /* Eat up the ".".      */
			ls_task_do_right_punct(phTTS,MISS);
			ls_task_readword(phTTS,&(pLts_t->cword[0]));    /* Advance, continue.   */
			return(LS_TASK_LOOP);
		}
		if (has_dot)
		{
			// restore the removed dot.
			(rlp-1)->l_ch='.';
		}
#endif		
		if ((flag=ls_util_lookup(phTTS,llp, rlp, context)) != MISS) 
		{
			if (flag == ABBREV)     /* Need to gobble up    */
			{
				ls_util_read_item(phTTS);                     /* the "." here.        */
#ifdef GWMICRO
				return(KEEP_SEARCHING);
#endif
			}
#ifndef FRENCH
			ls_task_do_right_punct(phTTS,flag);
			ls_task_readword(phTTS,&(pLts_t->cword[0]));
			return(LS_TASK_LOOP);
#else
			return FINISHED_WORD;
#endif // FRENCH
		}
	}
	/*eab 1/5/99 temporary code for ce to reduce dictionary
	will get more eligant with the re-write*/

	/* this is fir a class of imxxx words */
#ifdef nevermore	
	if( ( (llp->l_ch,llp->l_ch == 'i') && 
		(llp+1)->l_ch == 'm') &&
		( (llp+2)->l_ch == 'p'||
		(llp+2)->l_ch == 'b' )
		)
	{
		ls_util_send_phone(phTTS,IX);
		ls_util_send_phone(phTTS,M);
		for(i=0;i<NGWORD;i++)
		{
			pLts_t->cword[i] = pLts_t->cword[i+2];
		}
		return(-2);
	}
#endif

		/*eab 1/5/99 temporary code for ce to reduce dictionary
	will get more eligant with the re-write*/
#ifdef WORK_IN_PROGRESS

	if ( (cp = (char *)ls_task_prelookup(pLts_t, llp, &count,&predic[0])) != NULL)
	{       /*eab mini dictionary lookup */
		ls_util_send_phone_list(phTTS,cp);
		pLts_t->lbphone = WBOUND;
		// pLts_t->rbphone = WBOUND;
		// ls_util_send_phone(phTTS,IX);
		// ls_util_send_phone(phTTS,N);
		for(i=0; i<NGWORD; i++)
		{
			pLts_t->cword[i] = pLts_t->cword[i+count];
			if(pLts_t->cword[i+2]. l_ch == '0')
				break;
		}
		return(-count);
	}
#endif 

	return (KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_strip_left_punctuation()
 *
 *  Description:             
 *      this function strips off the right punctuation from the word
 *      and changes llp for the character stripped
 *
 *  Arguments:                                                      
 *		PLTS_T pLts_t
 *      LETTER **llp    the left bounding pointer of the word
 *      LETTER *rlp     The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      None
 *
 *  Comments:       
 *      llp is changed by this function and is passed back to the caller
 *
 * *****************************************************************/
void ls_task_strip_left_punctuation(PLTS_T pLts_t, LETTER **llp, LETTER *rlp)        
{
	/*
	 * Pull off all left and
	 * right enclosing punctuation. We only pull one
	 * layer, so ((a)) gets spelled (it seems like the right
	 * thing). Keep track of any required pauses. Also watch
	 * for things like "I went (last year?) to the show".
	 * Shuffle the "?" to the right spot. We don't shuffle the
	 * ".", because it might be part of an abbreviation,
	 * and abbreviations are more common than imbedded
	 * periods.
	 */
#ifdef LS1DEBUG
		printf("entering ls_task_strip_left_punctuation\n");
#endif
	 pLts_t->lflag  = 0;                             /* Clear all flags.     */

#ifdef LS1DEBUG
	printf("before punctuation stripping ");
	printf("left=%u  right=%u\n",(*llp),rlp);
#endif
	pLts_t->lbphone = WBOUND;
	pLts_t->rbphone = WBOUND;
	/* Change this "while" to an "if" to strip only 1 layer.        */
	while ((lsctype[(*llp)->l_ch]&LS) != 0)
	{
#ifdef LS1DEBUG
			printf("in left stripping loop %c\n",(*llp)->l_ch);
#endif
		pLts_t->lflag |= LSTRIP;
		if ((lsctype[(*llp)->l_ch]&FB) != 0)
		{
			pLts_t->lbphone = COMMA;
		}
		++(*llp);
	}
}           

/* ******************************************************************
 *  Function Name:  
 *      ls_task_strip_right_punctuation()
 *
 *  Description:             
 *      this function strips off the left punctuation from the word
 *      and changes rlp for the character stripped
 *
 *  Arguments:                                                      
 *		PLTS_T pLts_t
 *      LETTER *llp     the left bounding pointer of the word
 *      LETTER **rlp    The right bounding pointer of the word
 *
 *  Return Value:                                    
 *      None
 *
 *  Comments:       
 *      rlp is changed by this function and is passed back to the caller
 *
 * *****************************************************************/
void ls_task_strip_right_punctuation(PLTS_T pLts_t, LETTER *llp, LETTER **rlp)
{
#ifdef LS1DEBUG
		printf("entering ls_task_strip_right_punctuation\n");
#endif
	/* Change this "while" to an "if" to strip only 1 layer. */
	while ((*rlp)!=llp && (lsctype[((*rlp)-1)->l_ch]&RS)!=0) 
	{
#ifdef LS1DEBUG
			printf("in right stripping loop %c\n",llp->l_ch);
#endif
		pLts_t->lflag |= RSTRIP;
		--(*rlp);
		if ((lsctype[(*rlp)->l_ch]&FB) != 0)
		{
			pLts_t->rbphone = COMMA;
		}
		if ((*rlp) > llp+1) 
		{
			switch (((*rlp)-1)->l_ch) 
			{
			case '?':
				pLts_t->rbphone = QUEST;
				--(*rlp);
				break;

			case '!':
				pLts_t->rbphone = EXCLAIM;
				--(*rlp);
				break;

			case ',':
			case ':':
			case ';':
				pLts_t->rbphone = COMMA;
				--(*rlp);
				break;
			}
		}
	}
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_spell_all_punct()
 *
 *  Description:               
 *      handles speaking words that are all punctuation
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *      LETTER *lp1				The left bounding pointer of the whole word
 *      LETTER *lp2				The right bounding pointer of the whole word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * ******************************************************************/
int ls_task_spell_all_punct(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp, LETTER *lp1, LETTER *lp2)
{
	PLTS_T pLts_t;
	pLts_t = phTTS->pLTSThreadData;
#ifdef LS1DEBUG
		printf("entering ls_task_spell_all_punct\n");
#endif
	if (llp == rlp) 
	{                       /* Null word            */
		ls_spel_spell(phTTS,lp1, lp2);  /* Always slowly.       */
#ifdef LS1DEBUG
			printf("null word spell\n");
#endif

#ifndef FRENCH
		ls_task_do_right_punct(phTTS,MISS);
		ls_task_readword(phTTS,&(pLts_t->cword[0]));

		return(LS_TASK_LOOP);
#else
		return 3;
#endif
	}
	/*
	 * Deal with any side effects of the
	 * stripped left hand end punctuation marks.
	 * They will never be looked at again.
	 */

	if (pLts_t->lbphone != WBOUND)
		ls_util_send_phone(phTTS,pLts_t->lbphone);

#ifdef LS1DEBUG
	printf("after punctuation stripping ");
	printf("left=%u  right=%u\n",llp,rlp);
#endif

	return(KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_dictionary_after_punct()
 *
 *  Description:                      
 *      this function searches the dictionaries after all the puntiation 
 *      is stripped
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Tetx-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_dictionary_after_punct(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER **rlp)
{
	int context;
	int flag;
	LETTER *lp1;
	PLTS_T pLts_t;
	pLts_t = phTTS->pLTSThreadData;
#ifdef LS1DEBUG
		printf("entering ls_task_dictionary_after_punct\n");
#endif
	
	/*
	 * If the above code stripped off a
	 * punctuation mark, give the dictionary another try
	 * at it. Duck out through the common exit if we get a
	 * hit at this level. We also understand how to deal
	 * with an abbreviation contexts that are hidden
	 * by right end strippable punctuation.
	 */

	context = FIRST;
	if (((pLts_t->lflag)&RSTRIP) != 0) 
	{
		lp1 = (*rlp)-1;
		if (llp!=lp1 && lp1->l_ch=='.') 
		{
			if ((flag=ls_util_lookup(phTTS,llp, lp1, FABBREV)) != MISS) 
			{
				if (flag != ABBREV)
					pLts_t->rbphone = PERIOD;
				return(FINISHED_WORD);
			}
			pLts_t->rbphone = PERIOD;       /* Very strong.         */
			--(*rlp);
		}
	} 
	else 
	{
		if (ls_util_is_dot(pLts_t) != FALSE)            /* "(Gov. Smith)"       */
			context = FABBREV;
	}
	if (((pLts_t->lflag)&(LSTRIP|RSTRIP)) != 0
		&& (flag=ls_util_lookup(phTTS,llp, (*rlp), context)) != MISS) 
	{
		if (flag == ABBREV)             /* Eat the "."          */
			ls_util_read_item(phTTS);
		return(FINISHED_WORD);
	}
	return(KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_spell_vs_speak()
 *
 *  Description:              
 *      this function decides weather or not to spell the word
 *      if the word is to be spelled, spell the word now
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_spell_vs_speak(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{   
/*
 *  run through the new speak/spell rule tables ...
 */
	PKSD_T	pKsd_t;
	pKsd_t = phTTS->pKernelShareData;   

#ifdef LS1DEBUG
	printf("entering ls_task_spell_vs_speak\n");
	printf("ls_spel_say_it ");
	printf("left=%u  right=%u\n",llp,rlp);
#endif

	if(ls_spel_say_it(llp,rlp) == FALSE)
	{
#ifdef LS1DEBUG
			printf("ls_spel_say_it spell\n");
#endif
				/* debug switch */
		if (DT_DBG(LTS_DBG,0x400))
			{
#ifndef ARM7_NOSWI
#ifndef MSDOS
				if (pKsd_t->dbglog)			/*mfg 05/13/98 added debug support*/
					fprintf((FILE *)pKsd_t->dbglog,"\nSPELL IT (HIT)");
#endif // MSDOS
				printf("\nSPELL IT (HIT)");
#endif // ARM7_NOSWI
		}

		ls_spel_spell(phTTS,llp,rlp);
		return(FINISHED_WORD);
	}                         
	return(KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_single_letter_spell_rules()
 *
 *  Description:                         
 *      this function takes care of spelling single lettter correctly
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_single_letter_spell_rules(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
	int c;
#ifndef FRENCH
	LETTER *lp1;
	int flag;
#endif //warning removal
	//int done=0;
	PLTS_T pLts_t;
	pLts_t = phTTS->pLTSThreadData;

#ifdef LS1DEBUG
	printf("entering ls_task_single_letter_spell_rules");
	printf("left=%u  right=%u\n",llp,rlp);
#endif 

	/*
	 * There are a small set of rules that must be
	 * run before case distinctions and diacritical marks
	 * are lost. Single character words are usually spelled,
	 * but there are some important exceptions. Sequences of
	 * upper case letters separated by periods (I.B.M.)
	 * are processed by a fast spelling rule.
	 */
	if (llp+1 == rlp)
	{
		c = llp->l_ch;

		/*
		 * Any upper case letter that does not have
		 * any stripped punctuation, and is followed by a
		 * period, is taken to be someones initial. The
		 * period goes away, and the word is spelled.
		 *
		 * If you want to make this rule go away you
		 * can safely just delete the following "if" and
		 * it's corresponding body.
		 */

		if (IS_UPPER(c) 
		&& ((pLts_t->lflag)&(LSTRIP|RSTRIP))==0 && ls_util_is_dot(pLts_t)!=FALSE)
		{
			/* BATS 460 MGS 10/08/1997 Fixed A. B. C. problem losing periods */
			pLts_t->rbphone=PERIOD;
			ls_util_read_item(phTTS);
#ifdef LS1DEBUG
			printf(" spell cap letter \n");
#endif

#ifndef FRENCH
			return(SPELL_WORD);
#else
			return 1;
#endif // FRENCH
		}                                         

#ifdef ENGLISH_US
		/*
		 * I    => [`A].        Note stress.
		 * "I"  => ['A].        This is consistant with
		 * (I)  => ['A].        the spelling entry.
		 */

		if (c=='i' || c=='I')
		{
			if (((pLts_t->lflag)&(LSTRIP|RSTRIP)) != 0)
				ls_util_send_phone(phTTS,S1);
			else            
				ls_util_send_phone(phTTS,S2);

			ls_util_send_phone(phTTS,US_AY);			
			return(FINISHED_WORD);
		}

		/*
		 * The single character word "a" has two
		 * different pronounciations. The default one, from
		 * the spelling entry in the dictionary, is ['e]. The
		 * exception (actually the most common case) is [x].
		 * Use [x] if no stripping, and the "a" is not sitting
		 * against a punctuation mark ("a box." vs "box a.").
		 */
        /*
           GL 9/10/1996, add checking isnumabr to fix "4.4 a" problem
		   GL 8/14/1997, for BATS#441 only pLts_t->isnumabr is 0  or 1 "a" will be "AX"
         */
		if ((c=='a' || c=='A') && (pLts_t->isnumabr == 0 || pLts_t->isnumabr == 1)
			&& ((pLts_t->lflag)&(LSTRIP|RSTRIP))==0 && ls_util_is_white(&(pLts_t->citem))==TRUE)
		{
#ifdef NEW_LTS
			pLts_t->word_info[pLts_t->cur_word_index].form_class = FC_ART;
#else
			pLts_t->fc_struct[pLts_t->fc_index] = FC_ART;
#endif
			ls_util_send_phone(phTTS,SPECIALWORD);	
			ls_util_send_phone(phTTS,US_AX);			
#ifdef LS1DEBUG
			printf(" a to ah code \n");
#endif
			return(FINISHED_WORD);
		}
#endif // ENGLISH_US
#ifdef ENGLISH_UK
		/*
		 * I    => [`A].        Note stress.
		 * "I"  => ['A].        This is consistant with
		 * (I)  => ['A].        the spelling entry.
		 */

		if (c=='i' || c=='I')
		{
			if (((pLts_t->lflag)&(LSTRIP|RSTRIP)) != 0)
				ls_util_send_phone(phTTS,S1);
			else            
				ls_util_send_phone(phTTS,S2);

			ls_util_send_phone(phTTS,UK_AY);			
			return(FINISHED_WORD);
		}

		/*
		 * The single character word "a" has two
		 * different pronounciations. The default one, from
		 * the spelling entry in the dictionary, is ['e]. The
		 * exception (actually the most common case) is [x].
		 * Use [x] if no stripping, and the "a" is not sitting
		 * against a punctuation mark ("a box." vs "box a.").
		 */
        /*
           GL 9/10/1996, add checking isnumabr to fix "4.4 a" problem
		   GL 8/14/1997, for BATS#441 only pLts_t->isnumabr is 0  or 1 "a" will be "AX"
         */
		if ((c=='a' || c=='A') && (pLts_t->isnumabr == 0 || pLts_t->isnumabr == 1)
			&& ((pLts_t->lflag)&(LSTRIP|RSTRIP))==0 && ls_util_is_white(&(pLts_t->citem))==TRUE)
		{
			pLts_t->fc_struct[pLts_t->fc_index] = FC_ART;
			ls_util_send_phone(phTTS,SPECIALWORD);	
			ls_util_send_phone(phTTS,UK_AX);			
#ifdef LS1DEBUG
			printf(" a to ah code \n");
#endif
			return(FINISHED_WORD);
		}
#endif //ENGLISH_UK
#ifdef SPANISH_SP
		/*igrega or i code*/
		if ((c=='y' || c=='Y')
		&& ((pLts_t->lflag)&(LSTRIP|RSTRIP))==0 && ls_util_is_white(&(pLts_t->citem))!=FALSE)
		{
			pLts_t->fc_struct[pLts_t->fc_index] = FC_CONJ;
			ls_util_send_phone(phTTS,SP_I);
#ifdef LS1DEBUG
			printf(" iggre to i  code \n");
#endif
			return(FINISHED_WORD);
		}

#endif // SPANISH_SP

#ifdef SPANISH_LA
		/*igrega or i code*/
		if ((c=='y' || c=='Y')
		&& ((pLts_t->lflag)&(LSTRIP|RSTRIP))==0 && ls_util_is_white(&(pLts_t->citem))!=FALSE)
		{
			pLts_t->fc_struct[pLts_t->fc_index] = FC_CONJ;
			ls_util_send_phone(phTTS,LA_I);
#ifdef LS1DEBUG
			printf(" iggre to i  code \n");
#endif

			return(FINISHED_WORD);
		}

#endif // SPANISH_LA

		/*
		 * Most other single letter words get
		 * spelled. Watch out for single character numbers
		 * (the digits, and the 1/4 and 1/2 DEC supplimental
		 * characters) which must go through the number
		 * processing heuristics.
		 */
#ifndef FRENCH
		if (c!=0xBC && c!=0xBD && !IS_DIGIT(llp->l_ch))
#else
		if (c!=0xBC && c!=0xBD && ( (lsctype[c] & O) == 0)
		&& !IS_DIGIT(llp->l_ch) )
#endif // FRENCH
		{
#ifdef LS1DEBUG
			printf("single letter spell\n");
#endif

#ifndef FRENCH
			return(SPELL_WORD);
#else
			switch (c)
			{
				case ':':
				case '-':
					if ( ls_util_is_white (&(pLts_t->citem)) )
					{	ls_util_send_phone(phTTS, COMMA);
						return 2;  /* il dit : il ... */
					}
					else
					{
						return 1; /* Spell  :, */
					}
					break;
				case '?':
					if ( ls_util_is_white (&(pLts_t->citem)) || ls_util_is_dot(pLts_t) )
					{	if (pLts_t->wstate == IS_WH)
						{
							ls_util_send_phone (phTTS, PERIOD); /* qui est-tu ?  ou  ... ?. */
						}
						else
						{
							ls_util_send_phone (phTTS, QUEST);  /* viens ? ou viens ?. */
						}
						pLts_t->wstate = FIRST;
						return 2;
					}
					else
					{
						return 1; /* Spell  ?, */
					}
					break;
				case '!':
					if ( ls_util_is_white (&(pLts_t->citem)) || ls_util_is_dot(pLts_t) )
					{	ls_util_send_phone (phTTS, EXCLAIM);
						pLts_t->wstate = FIRST;
						return 2;  /* Ah bon ! Il dit ... ou Ah !. */
					}
					else
					{
						return 1; /* Spell  :, */
					}
					break;
				default : /* D G % " { = ] */
					return 1;   /* spell */
					break;
			} /* switch */
#endif //FRENCH
		}
	}
#ifndef FRENCH
	else
	{
		flag = FALSE;                   /* Start validation.    */
		lp1  = llp;
		while (lp1 != rlp) 
		{
			if (flag == FALSE) 
			{    /* FALSE => even.       */

				/*
				 * On a standard DECtalk all of
				 * the characters in an "I.B.M." thing
				 * must be in upper case. On the special
				 * Kurzweil DECtalk any letter will do.
				 * A letter is defined here as vowel
				 * or consonant.
				 */
				
				if (!(IS_UPPER(lp1->l_ch)))
					break;
				flag = TRUE;
			} 
			else 
			{                /* TRUE => odd.         */
				if (lp1->l_ch != '.')
					break;
				flag = FALSE;
			}
			++lp1;
		}
		if (lp1 == rlp) 
		{               /* Ate it all.          */
			lp1 = llp;
			while (lp1 != rlp) 
			{
#ifdef LS1DEBUG
				printf("ate it all spell\n");
#endif

				ls_spel_spell(phTTS,lp1, lp1+1);
				++lp1;
				if (lp1 != rlp) 
				{
					++lp1;
				}
				if (lp1 != rlp)
					ls_util_send_phone(phTTS,WBOUND);
			}
			if (flag != FALSE       /* Last a letter.       */
			&& ((pLts_t->lflag)&RSTRIP) == 0  /* and no right strip   */
			&& ls_util_is_dot(pLts_t) != FALSE)    /* and sitting on "."   */
				ls_util_read_item(phTTS);     /* eat up the ".".      */
			return(FINISHED_WORD);
		}
	}
#endif //#ifndef FRENCH
	return(KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_remove_case()
 *
 *  Description:           
 *      this function removes the case from the current word
 *
 *  Arguments:                                                      
 *      LETTER *llp     the left bounding pointer of the word
 *      LETTER *rlp     The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
void ls_task_remove_case(LETTER *llp, LETTER *rlp)
{       
	while (llp != rlp) 
	{
		llp->l_ch = ls_lower[(llp->l_ch)];
		++llp;
	}
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_Dr_Sr_process()
 *
 *  Description:             
 *      this function takes care of the Dr. and St. abbreviations
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *      doctor and saint if the first letter of the next word 
 *      is capitlaized
 * *****************************************************************/
#ifdef ENGLISH // NAL warning removal
int ls_task_Dr_St_process(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{ 
	int     c1;
	int     c2;
	PLTS_T pLts_t;
	pLts_t = phTTS->pLTSThreadData;

	/*
	 * Watch for "Dr." and "St.". Look ahead to
	 * determine the correct pronounciation, then move
	 * the ls_task_lookahead into the working word. The two line
	 * "if" at the start implements rules similar in spirit
	 * to the code in the first dictionary scan, that has
	 * do decide if this is an abbreviation context.
	 */

#ifdef LS1DEBUG
	printf("dr. st. processing ");
	printf("left=%u  right=%u\n",llp,rlp);
#endif
				
	if ((llp+3==rlp && (llp+2)->l_ch=='.')
	||  (llp+2==rlp && ((pLts_t->lflag)&RSTRIP)==0 && ls_util_is_dot(pLts_t)!=FALSE)) 
	{
		c1 = (llp+0)->l_ch;
		c2 = (llp+1)->l_ch;
		if ((c1=='s' && c2=='t') || (c1=='d' && c2=='r')) 
		{
			if (llp+2 == rlp)       /* Gobble up the "."    */
				ls_util_read_item(phTTS);     /* after abbreviation.  */
			ls_task_lookahead(pLts_t);
			if (ls_util_is_white(&(pLts_t->citem)) != FALSE) 
			{
				ls_task_readword(phTTS,&(pLts_t->nword[0]));
				if ((lsctype[pLts_t->nword[0].l_ch]&UU) != 0)
				{
					/* GL 02/25/1997  fix St. Dr. back to back problem */ 
					if ((pLts_t->nword[0].l_ch=='D' &&
					     pLts_t->nword[1].l_ch=='r' &&
					     pLts_t->nword[2].l_ch==0) ||
					     (pLts_t->nword[0].l_ch=='S' &&
					      pLts_t->nword[1].l_ch=='t' &&
					      pLts_t->nword[2].l_ch==0))
					ls_util_send_phone_list(phTTS,c1=='s' ? pstreet : pdrive);
					else
					ls_util_send_phone_list(phTTS,c1=='s' ? psaint : pdoctor);
				}
				else
				{
					/* GL 03/03/1997  it is doctor or saint if is the first word of sentenct */
#ifdef NEW_LTS
					if (pLts_t->cur_word_index == 1)
#else
					if (pLts_t->fc_index == 1)
#endif // NEW_LTS
						ls_util_send_phone_list(phTTS,c1=='s' ? psaint : pdoctor);
					else
						ls_util_send_phone_list(phTTS,c1=='s' ? pstreet : pdrive);
				}

				ls_util_send_phone(phTTS,pLts_t->rbphone);
				ls_util_copyword(&(pLts_t->cword[0]), &(pLts_t->nword[0]));

				return(LS_TASK_LOOP);
			}
			ls_util_send_phone_list(phTTS,c1=='s' ? pstreet : pdrive);

			return(FINISHED_WORD);
		}
	}   
	return(KEEP_SEARCHING);
}
#endif /* #ifdef ENGLISH */

/* ******************************************************************
 *  Function Name:  
 *      ls_task_set_sign_flag()
 *
 *  Description:             
 *      This function takes care of setting the sign flag for numbers
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *      LETTER **lp1			the left bounding pointer after the sign was removed
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *      this function changes lp1 for use in the later number 
 *      processing functions
 * *****************************************************************/
int ls_task_set_sign_flag(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, LETTER **lp1)
{
	PKSD_T  pKsd_t;
	PLTS_T  pLts_t;
		
	pKsd_t = phTTS->pKernelShareData;
	pLts_t = phTTS->pLTSThreadData;	

#ifdef LS1DEBUG       
	printf("entering ls_task_set_sign_flag\n");
	printf("beginnning number processing   ");
	printf("left=%u  right=%u\n",llp,rlp);
#endif
							  
	/*
	 * This is the top of number processing. The first
	 * step is to decide how "." and "," will be interpreted.
	 * This is controlled by a mode flag (MODE_EUROPE) if
	 * the unit is running at level 2. Then pull off any signs,
	 * and revert to spelling if this makes the whole word
	 * go away.
	 */
	/* pLts_t->fc_struct[pLts_t->fc_index] = FC_ADJ;xxx marks more than numbers here*/

	/*eab 8/94 numbers form class needs to be marked*/
	pLts_t->fchar = '.';                            /* Pick the right one.  */
	pLts_t->schar = ',';
    if ((pKsd_t->modeflag&MODE_EUROPE)!=0) {
		pLts_t->fchar = ',';
		pLts_t->schar = '.';
	}
	/* GL 11/07/1996, change to fix Spanish Decimal number */
	/* SPANISH use the "." and "," just as MODE_EUROPE for both Latin and Spanish */
#if defined (SPANISH_SP) || defined (GERMAN)
		pLts_t->fchar = ',';
		pLts_t->schar = '.';
#endif
	
	pLts_t->sign = 0;
	(*lp1)  = llp;
	if ((*lp1)->l_ch == '-'                     /* Signs.               */
	||  (*lp1)->l_ch == '+'
	||  (*lp1)->l_ch == 0xA7                    /* Section mark.        */
	||  (*lp1)->l_ch == 0xB1                    /* Plus-minus.          */
	||  (*lp1)->l_ch == 0xB6)          			/* Item.                */
		{               
		pLts_t->sign = (*lp1)->l_ch;
		++(*lp1);
#ifdef LS1DEBUG
		printf("num processing sign found\n");
#endif
		if ((*lp1) == rlp)
		{
#ifdef LS1DEBUG
			printf(" spell from num processing\n");
#endif

#ifndef FRENCH
			return(SPELL_WORD);
#else
			return 1;
#endif
		}
	}                          
	return(KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:
 *      ls_task_currency_processing()
 *
 *  Description:
 *      this function takes care of the currency processing 
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE-T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
#ifndef FRENCH
int ls_task_currency_processing(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
#else
int ls_task_currency_processing(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *lp1, LETTER *rlp)
#endif
{   
	NUM     num;
	LETTER *lp2;
	PLTS_T pLts_t;
#ifndef FRENCH 
	int     type;
	int     flag;
	char    *cp;
#else
	int Fini=0;
#endif
	
	pLts_t = phTTS->pLTSThreadData;

#ifndef FRENCH
#ifdef LS1DEBUG
		printf("entering ls_task_currency_processing\n");
#endif
	/*
	 * If the first character in the remaining string
	 * is a currency symbol (both the USA/Canada and the
	 * United Kingdom versions are accepted) this is a signal
	 * to begin running the money rules.
	 */

#ifdef LS1DEBUG
	printf("currency rules ");
	printf("left=%u  right=%u\n",llp,rlp);
#endif
	if (llp->l_ch=='$' || llp->l_ch==0xA3 || llp->l_ch==0x80) 
	{
		type = llp->l_ch;
		if (++llp == rlp)               /* Lone currency mark.  */
		{
#ifdef LS1DEBUG
			printf("currency mark spell \n");
#endif

			return(SPELL_WORD);
		}
		if (llp->l_ch == '-'            /* Signs.               */
		||  llp->l_ch == '+'
		||  llp->l_ch == 0xB1) 
		{        						/* Plus-minus.          */

			if (pLts_t->sign != 0)
			{
#ifdef LS1DEBUG
			printf("sign spell \n");
#endif

				return(SPELL_WORD);
			}

			pLts_t->sign = llp->l_ch;
			if (++llp == rlp)       /* "$+"                 */
			{
#ifdef LS1DEBUG
			printf(" spell from num sign proc \n");
#endif

				return(SPELL_WORD);
			}
		}

		lp2 = ls_task_parse_number(phTTS,llp, rlp, &num);
		if (num.n_elp!=NULL || lp2!=rlp)
		{
#ifdef LS1DEBUG
			printf("ls_task_parse_number spell \n");
#endif

			return(SPELL_WORD);
		}

		/*
		 * You need to look ahead to see if the
		 * next word is one of the special words like
		 * "million" that alters where the word "dollar" or
		 * or "pound" is spoken.
		 */

		flag = FALSE;                   /* No ls_task_lookahead.        */
		ls_task_lookahead(pLts_t);
		if (ls_util_is_white(&(pLts_t->citem)) != FALSE) 
		{
			flag = TRUE;            /* Did ls_task_lookahead.       */
			ls_task_readword(phTTS,&(pLts_t->nword[0]));
			// CAB 08/15/2002 Removed warning by typecast
			cp = ls_task_wlookup(pLts_t, &(pLts_t->nword[0]), (unsigned char *)&nwdtab[0]);
			if (cp != FALSE) 
			{
				ls_proc_do_sign(phTTS,pLts_t->sign);
				pLts_t->pflag=ls_proc_do_number(phTTS,llp, rlp, FALSE);
				ls_util_send_phone(phTTS,pLts_t->rbphone);
				ls_util_send_phone_list(phTTS,cp);
				llp = &(pLts_t->nword[0]);
				while (llp->l_ch != EOS)
					++llp;

#ifdef SPANISH_SP
				/* GL 11/16/1998, BATS#721 fix number with currency sign */
				ls_util_send_phone(phTTS,WBOUND);
				ls_util_send_phone(phTTS,SP_D);
//				ls_util_send_phone(phTTS,S1);
				ls_util_send_phone(phTTS,SP_E);
#endif
#ifdef SPANISH_LA
				/* GL 11/16/1998, BATS#721 fix number with currency sign */
				ls_util_send_phone(phTTS,WBOUND);
				ls_util_send_phone(phTTS,LA_D);
//				ls_util_send_phone(phTTS,S1);
				ls_util_send_phone(phTTS,LA_E);
#endif
				if (type==0x80)
				{
					ls_util_send_phone_list(phTTS,peuro);
				}
				else
				{
					ls_util_send_phone_list(phTTS,type=='$' ? pdollar : ppound);
				}

/* 
 * JDB: this looks like it is only for ENGLISH_US, so for now it's
 *  conditional
 */				
#ifdef ENGLISH_US
				ls_util_send_phone(phTTS,US_Z);
#endif
#ifdef ENGLISH_UK
				ls_util_send_phone(phTTS,UK_Z);
#endif
/* GL 02/14/1997, add pural for Spanish */
#ifdef SPANISH_SP
				/* GL 11/16/1998, BATS#721 fix number with currency sign */
				ls_util_send_phone(phTTS,SP_E);
				ls_util_send_phone(phTTS,SP_S);
#endif
#ifdef SPANISH_LA
				/* GL 11/16/1998, BATS#721 fix number with currency sign */
				ls_util_send_phone(phTTS,LA_E);
				ls_util_send_phone(phTTS,LA_S);
#endif
				return(FINISHED_WORD);
			}
		}

		/*
		 * $3      Three dollars.
		 * $3.00   Three dollars.
		 * $3.24   Three dollars and twenty four cents.
		 * $3.240  Three point two four zero dollars.
		 */

		ls_proc_do_sign(phTTS,pLts_t->sign);

		if (num.n_flp==NULL || (num.n_frp-num.n_flp)==3)        
		{
			if (num.n_ilp != NULL) 
			{

#if defined (SPANISH) || defined (GERMAN)
				/* GL 02/15/1997, set to -1 to force Spanish say "1" as un  */
				/* GL 02/17/1997, set to -1 to force German say "1" as ein  */
				pLts_t->pflag = -1;
#endif
				pLts_t->pflag = ls_proc_do_number(phTTS,num.n_ilp, num.n_irp, FALSE);

				if (type==0x80)
				{
					ls_util_send_phone_list(phTTS,peuro);
				}
				else
				{
					ls_util_send_phone_list(phTTS,type=='$' ? pdollar : ppound);
				}

/* 
 * JDB: this is more plural stuff that doesn't seem to happen
 * in the spanish- make it conditional
 */
#ifdef ENGLISH_US
				if (pLts_t->pflag != FALSE)
					ls_util_send_phone(phTTS,US_Z);
#endif
#ifdef ENGLISH_UK
				if (pLts_t->pflag != FALSE)
					ls_util_send_phone(phTTS,UK_Z);
#endif
/* GL 02/14/1997, add pural for Spanish */
#ifdef SPANISH_SP
				if (pLts_t->pflag != FALSE)
				{
					/* GL 11/16/1998, BATS#721 fix number with currency sign */
					ls_util_send_phone(phTTS,SP_E);
				    ls_util_send_phone(phTTS,SP_S);
				}
#endif
#ifdef SPANISH_LA
				if (pLts_t->pflag != FALSE)
				{
					/* GL 11/16/1998, BATS#721 fix number with currency sign */
					ls_util_send_phone(phTTS,LA_E);
				    ls_util_send_phone(phTTS,LA_S);
				}
#endif
#ifdef FRENCH
				if (pLts_t->pflag != FALSE)
					ls_util_send_phone(phTTS,F_Z);
#endif	
				if (num.n_flp == NULL) 
				{
					if (flag == FALSE)
						return(FINISHED_WORD);
					ls_util_send_phone(phTTS,pLts_t->rbphone);

					ls_util_copyword(&(pLts_t->cword[0]), &(pLts_t->nword[0]));

					return(LS_TASK_LOOP);
				}
				if ((num.n_flp+1)->l_ch == '0'
				&&  (num.n_flp+2)->l_ch == '0') 
				{

					if (flag == FALSE)
						return(FINISHED_WORD);
					ls_util_send_phone(phTTS,pLts_t->rbphone);

					ls_util_copyword(&(pLts_t->cword[0]), &(pLts_t->nword[0]));
					return(LS_TASK_LOOP);
				}
#ifndef ENGLISH_UK
				ls_util_send_phone_list(phTTS,pand);
#endif
			}
			lp2 = num.n_flp + 1;    /* Just after the "."   */
			if (lp2->l_ch == '0')
				++lp2;

#if defined (SPANISH) || defined (GERMAN)
				/* GL 02/15/1997, set to -1 to force Spanish say "1" as un  */
				/* GL 02/17/1997, set to -1 to force German say "1" as ein  */
				pLts_t->pflag = -1;
#endif
			pLts_t->pflag = ls_proc_do_number(phTTS,lp2, num.n_frp, FALSE);
			ls_util_send_phone(phTTS,WBOUND);
			if (type == '$' || type==0x80) 
			{
				ls_util_send_phone_list(phTTS,pcent);
				
/* JDB: again, ENGLISH plurals made conditional... */				
#ifdef ENGLISH_US
				if (pLts_t->pflag != FALSE)
					ls_util_send_phone(phTTS,US_S);
#endif
#ifdef ENGLISH_UK
				if (pLts_t->pflag != FALSE)
					ls_util_send_phone(phTTS,UK_S);
#endif
/* GL 02/14/1997, add pural for Spanish */
#ifdef SPANISH_SP
				if (pLts_t->pflag != FALSE)
					ls_util_send_phone(phTTS,SP_S);
#endif
#ifdef SPANISH_LA
				if (pLts_t->pflag != FALSE)
					ls_util_send_phone(phTTS,LA_S);
#endif
#ifdef FRENCH
				if (pLts_t->pflag != FALSE)
					ls_util_send_phone(phTTS,F_S);
#endif
			} 
			else
				ls_util_send_phone_list(phTTS,ppence);
			if (flag != FALSE) 
			{
				ls_util_send_phone(phTTS,pLts_t->rbphone);
				ls_util_copyword(&(pLts_t->cword[0]), &(pLts_t->nword[0]));
				return(LS_TASK_LOOP);
			}
			return(FINISHED_WORD);
		}
#if defined (SPANISH) || defined (GERMAN)
		/* GL 02/15/1997, set to -1 to force Spanish say "1" as un  */
		/* GL 02/17/1997, set to -1 to force German say "1" as ein  */
		pLts_t->pflag = -1;
#endif
		pLts_t->pflag = ls_proc_do_number(phTTS,llp, rlp, FALSE);
		if (type==0x80)
		{
			ls_util_send_phone_list(phTTS,peuro);
		}
		else
		{
			ls_util_send_phone_list(phTTS,type=='$' ? pdollar : ppound);
		}

/* JDB: again, ENGLISH plurals made conditional... */						
#ifdef ENGLISH_US
		if (pLts_t->pflag != FALSE)
			ls_util_send_phone(phTTS,US_Z);
#endif
#ifdef ENGLISH_UK
		if (pLts_t->pflag != FALSE)
			ls_util_send_phone(phTTS,UK_Z);
#endif
/* GL 02/14/1997, add pural for Spanish */
#ifdef SPANISH_SP
		if (pLts_t->pflag != FALSE)
			ls_util_send_phone(phTTS,SP_S);
#endif
#ifdef SPANISH_LA
		if (pLts_t->pflag != FALSE)
			ls_util_send_phone(phTTS,LA_S);
#endif
#ifdef FRENCH
		if (pLts_t->pflag != FALSE)
			ls_util_send_phone(phTTS,F_Z);
#endif
		if (flag != FALSE) 
		{
			ls_util_send_phone(phTTS,pLts_t->rbphone);
			ls_util_copyword(&(pLts_t->cword[0]), &(pLts_t->nword[0]));
			return(LS_TASK_LOOP);
		}
		return(FINISHED_WORD);
	}
	return(KEEP_SEARCHING);
#endif // #ifndef FRENCH

#ifdef FRENCH
	//printf ("\nls1.c **** Somme_en_frcs nombre suivi de F pour francs\n");
    //printf ("******** %c %c %c\n", (llp)->l_ch, (lp1)->l_ch, (rlp-1)->l_ch);

	if ( llp!=rlp-1 && (rlp-1)->l_ch=='F') { /* 20F, 12.23F */
											 /*
											 8-1 : CURRENCY SYMBOL.
											 The last character in the remaining string is a currency symbol.
											 ex : +123F   llp points +, lp1 points 1, rlp-1 points f
		*/
		lp2=ls_task_parse_number (phTTS, lp1, rlp-1, &num); /* lp2 : last analysed digit */
		if (num.n_elp != NULL) {
			Fini=1;   /* 237.21e+10f is spelled */
		} 
		else
		{
			if (lp2==rlp-1) { /* number from lp1 to rlp-1 */
				ls_proc_do_sign (phTTS, pLts_t->sign);
				//    sendindex (llp, lp1); /* sign */
				ls_proc_do_number (phTTS, lp1, rlp-1, FALSE);
				//    sendindex (rlp, elp);   /* elp equal rlp if no stripping done */
				ls_util_send_phone (phTTS, WBOUND);
				ls_util_send_phone_list (phTTS, francs);
				ls_util_send_phone (phTTS, WBOUND);
				Fini=2;
#ifdef DEBG
				if (DbgLs1)
		 		{
					printf ("ls1.c Somme_en_frcs nombre suivi de F pour francs\n");
					//Ecrit (llp, rlp);
				}
#endif
			} /* elp exists or not */
		} /* if last char is f */
	} /* dernier car. est F de francs */
	
	return (Fini);
#endif // FRENCH
} /* ls_task_currency_processing*/

/* ******************************************************************
 *  Function Name:  
 *      ls_task_date_processing()
 *
 *  Description:               
 *      this function processes dates and times
 *
 *  Arguments:                                                      
		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_date_processing(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{  
#ifndef FRENCH
	LETTER *lp1;
#endif //warning removal
	PLTS_T pLts_t;
	
	pLts_t = phTTS->pLTSThreadData;
	/*
	 * Dates and times are handled by special
	 * validation and speaking routines. Times are a little
	 * bit special, because of "AM" and "PM" processing.
	 * Fractions are special too, but less special then a
	 * date or a time, because signs are legal.
	 */

#ifdef LS1DEBUG
	printf("date time processing ");
	printf("left=%u  right=%u\n",llp,rlp);
#endif

	if (pLts_t->sign == 0) 
	{
		if (ls_proc_is_date(llp, rlp) != FALSE) 
		{
			ls_proc_do_date(phTTS,llp, rlp);
#ifndef FRENCH
			return(FINISHED_WORD);
#else
			return 2;
#endif
		} 
		
		if (ls_proc_is_time(pLts_t,llp, rlp) != FALSE) 
		{
			ls_proc_do_time(phTTS,llp, rlp);
#ifndef FRENCH
			ls_task_lookahead(pLts_t);
			if (ls_util_is_white(&(pLts_t->citem)) == FALSE)
				return(FINISHED_WORD);
			ls_util_send_phone(phTTS,pLts_t->rbphone);

			ls_task_readword(phTTS,&(pLts_t->nword[0]));

			lp1 = &(pLts_t->nword[0]);
			while (lp1->l_ch != EOS)
				++lp1;       
				
/* GL 02/13/1997, support am, pm for spanish as well since sometime they do use */
			if (ls_proc_is_am_pm(&(pLts_t->nword[0]), lp1) != FALSE)
			{
#ifdef LS1DEBUG
			printf("ls_proc_is_am_pm spell\n");
#endif
				ls_spel_spell(phTTS,&(pLts_t->nword[0]), lp1);
				ls_task_do_right_punct(phTTS,MISS);
				ls_task_readword(phTTS,&(pLts_t->cword[0]));

				return(LS_TASK_LOOP);
			} 	
			ls_util_copyword(&(pLts_t->cword[0]), &(pLts_t->nword[0]));
			return(LS_TASK_LOOP);
		}
	}
#endif // #ifndef FRENCH

#ifdef FRENCH
			return 2;
		}
	}
#endif
	return(KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:
 *      ls_task_frac_processing()
 *
 *  Description:               
 *      this function processes fractions
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_frac_processing(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
	PLTS_T pLts_t;
	pLts_t = phTTS->pLTSThreadData;
#ifdef LS1DEBUG
		printf("entering ls_task_frac_processing\n");
#endif             

/* GL 10/03/96  include fraction processing for Spanish */
#if defined (ENGLISH) || defined (SPANISH)	|| defined (FRENCH)
	if (ls_proc_is_frac(llp, rlp) != FALSE) 
	{
		ls_proc_do_sign(phTTS,pLts_t->sign);

		ls_proc_do_frac(phTTS,llp, rlp);
		return(FINISHED_WORD);
	}            
#endif	
	return(KEEP_SEARCHING);
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_plain_number_processing()
 *
 *  Description:
 *      This function process plain numbers.
 *		Just digits, digits followed
 * 		by the "%" symbol and the "cent" sign at (10,2) in
 * 		the Multinational set, and ordinal numbers with
 * 		"st", "nd", "rd", and "th" on the end. There is special
 * 		stuff to deal with years (1984 is best spoken as
 * 		19 84) and abbreviations like "ft." that have two
 * 		different pronounciations, based on the value of the
 * 		number in front of it.                          
 *
 * 		Number processing is a little less sophisticated
 * 		on the Kurzweil. Any integer that is greater than 4
 * 		digits (9999) is spelled. The rationale is that large
 * 		numbers are rare, and stuff like zip codes is
 * 		common. I'll accept their judgement on this one.
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_plain_number_processing(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, LETTER *lp1)
{
	LETTER  *lp2;
	int     c;
	NUM     num;
	char    *cp;
	PLTS_T pLts_t;
#ifdef FRENCH
//	int Fini=0;
#endif
	pLts_t = phTTS->pLTSThreadData;

	 /* Kurz. now wants it to be symetrical with negative numbers
	 EAB-4-11-89*/
#ifdef LS1DEBUG
	printf("entering ls_task_plain_number_processing\n");
	printf("number procesing ");
	printf("left=%u  right=%u\n",llp,rlp);
#endif
/*ls_util_dump_llp_rlp(llp,rlp,"input number is:");*/	
	if (lp1->l_ch == '.'                    /* As in ".5".          */
	||  lp1->l_ch == 0xBC                   /* 1/4                  */
	||  lp1->l_ch == 0xBD                   /* 1/2                  */
	||  IS_DIGIT(lp1->l_ch))        		/* ls_proc_digit() */
	{
		/* GL 9/10/1996, borrow pLts_t->isnumabr to set up the number indication */
		pLts_t->isnumabr = 3;
		lp2 = ls_task_parse_number(phTTS,lp1, rlp, &num);
		if (lp2 == rlp)
		{           
			/* All digits.          */
#ifdef NEW_LTS
			pLts_t->word_info[pLts_t->cur_word_index].form_class = FC_ADJ;
#else
			pLts_t->fc_struct[pLts_t->fc_index] = FC_ADJ;
#endif

			/*eab 8/94 numbers form class needs to be marked xxx*/
#ifndef FRENCH
			if (pLts_t->sign==0 && ls_util_is_year(llp, rlp)!=FALSE)
			{
/* GL 11/15/1996, only English need to take special care of 4 digits year */
#ifdef ENGLISH
				ls_proc_do_4_digits(phTTS,llp);
#endif
#ifdef GERMAN
				/* GL 02/13/1997  use 4 digits form for German years */
				/* GL 04/10/1998  BATS#651 1000-1099, 2000+ pronunce the same way */
				if ((lp1->l_ch != '1') || ((lp1->l_ch == '1') & ((lp1+1)->l_ch == '0')))
					pLts_t->pflag = ls_proc_do_number(phTTS,lp1, rlp, ls_util_is_dot(pLts_t));
				else
					ls_proc_do_4_digits(phTTS,llp);
#endif
#ifdef SPANISH
				pLts_t->pflag = ls_proc_do_number(phTTS,lp1, rlp, FALSE);
#endif
				pLts_t->pflag = TRUE;   /* 1984 is plural.      */
			}
			else
#endif // FRENCH
			{
				ls_proc_do_sign(phTTS,pLts_t->sign);
#ifdef GERMAN
				/* German use ending period to send ordial number */
                pLts_t->pflag = ls_proc_do_number(phTTS,lp1, rlp, ls_util_is_dot(pLts_t));
#endif

#if defined (ENGLISH) || defined (SPANISH) || defined (FRENCH)
				pLts_t->pflag = ls_proc_do_number(phTTS,lp1, rlp, FALSE);
#endif

			}
			
			ls_task_lookahead(pLts_t);            			/* Watch for "ft."      */

			if (ls_util_is_white(&(pLts_t->citem)) == FALSE)
			{
#ifndef FRENCH
				return(FINISHED_WORD);
#else
				return 2; //Fini = 2
#endif // FRENCH
			}
			ls_util_send_phone(phTTS,pLts_t->rbphone);

			ls_task_readword(phTTS,&(pLts_t->nword[0]));    /* Read next word.      */

			lp1 = &(pLts_t->nword[0]);
			while (lp1->l_ch != EOS)
				++lp1;
#if defined (ENGLISH) || defined (GERMAN)
			if (ls_proc_is_am_pm(&(pLts_t->nword[0]), lp1) != FALSE) 
			{
#ifdef LS1DEBUG
			printf("iasmpm spell\n");
#endif

				ls_spel_spell(phTTS,&(pLts_t->nword[0]), lp1);
				ls_task_do_right_punct(phTTS,MISS);
				ls_task_readword(phTTS,&(pLts_t->cword[0]));

				return(LS_TASK_LOOP);
			}
#endif // defined (ENGLISH) || defined (GERMAN)
			// 08/15/2002 CAB Removed warning by typecast
			if (ls_util_is_dot(pLts_t) == FALSE    /* Check if special.    */
			|| (cp=ls_task_wlookup(pLts_t, &(pLts_t->nword[0]), (unsigned char *)&nabtab[0]) ) == NULL)
			{
#ifdef FRENCH
      /*
        right word not an abreviation :
        next not ending in .,  like 10 avions
        or not in nabtab         like 10 TT.
      */

      /* for the linking, keep graphemes of the last digit */
      if (llp==rlp-1                   /* one digit */
        || ( (rlp-1)->l_ch != '0'
        && (rlp-2)->l_ch!='1' && (rlp-2)->l_ch!='7'
        && (rlp-2)->l_ch!='9') ) {
        /*
          1 digit : 1 enfant
          not : ..0    : 70, 100
          not 1. 7. 9. : 12, 17, 99
          OK : 0, 1, 5, 31, 55, 82
        */
        pLts_t->contgc = TRUE;
        switch ( (rlp-1)->l_ch) {
          case '1': strcpy( pLts_t->precedent, "un");     break;
          case '2': strcpy( pLts_t->precedent, "deux");   break;
          case '3': strcpy( pLts_t->precedent, "trois");  break;
          case '4': strcpy( pLts_t->precedent, "quatre"); break;
          case '5': strcpy( pLts_t->precedent, "cinq");   break;
          case '6': strcpy( pLts_t->precedent, "six");    break;
          case '7': strcpy( pLts_t->precedent, "sept");   break;
          case '8': strcpy( pLts_t->precedent, "huit");   break;
          case '9': strcpy( pLts_t->precedent, "neuf");   break;
        }
      } else if ( (rlp-1)->l_ch=='0' && (rlp-2)->l_ch!='0' ) {
        /* 10, 70, 2370 120, 80 */
        pLts_t->contgc = TRUE;
        switch ( (rlp-2)->l_ch) {
          case '1':
          case '7':
          case '9': strcpy( pLts_t->precedent, "dis");    break;
          case '2': strcpy( pLts_t->precedent, "vingt");  break;
          case '8': strcpy( pLts_t->precedent, "vingts"); break;
        }
      } else if ( llp<=(rlp-3) && (rlp-3)->l_ch!='0') {
        if ( (rlp-2)->l_ch=='0' && (rlp-1)->l_ch=='0' ) {
          pLts_t->contgc = TRUE;
          if ( (rlp-3)->l_ch=='1' ) {
        strcpy( pLts_t->precedent, "cent"); /* 100 */
          } else if ( (rlp-3)->l_ch!='0' ) {
        strcpy( pLts_t->precedent, "cents");  /* 800 */
          }
        }
      }
#endif // FRENCH
				ls_util_copyword(&(pLts_t->cword[0]), &(pLts_t->nword[0]));
#ifndef FRENCH
				return(LS_TASK_LOOP);
#else
				return 4; //Fini = 4;
#endif // FRENCH
			}
			pLts_t->isnumabr=3;
#ifndef FRENCH
			if (pLts_t->pflag != FALSE)
			{   /* Pick right form.     */
				while (*cp++ != SIL)
					;
			}
#endif
			ls_util_send_phone_list(phTTS,cp);           	/* Send abbreviation.   */

			ls_util_read_item(phTTS);             			/* Eat up the ".".      */
#ifndef FRENCH
			ls_task_do_right_punct(phTTS,MISS);
			ls_task_readword(phTTS,&(pLts_t->cword[0]));    /* Advance, continue.   */

			return(LS_TASK_LOOP);
#else
			return 3;
#endif // FRENCH
		}

		/*
		 * Deal with plural numbers, like
		 * "60s" and "60's". The last phoneme of
		 * the number is hidden in "pLts_t->lphone", which is
		 * looked at by the standard pluralizing
		 * code in "ls7.c". Also deal with cents,
		 * percents, and degrees.
		 */
                         
/* JDB:  Spanish doesn't use this section! */                        
#ifdef ENGLISH
		if (lp2+2 == rlp) 
		{             
			/* 2 after the digits.  */
			/* Plurals, like "60's".                        */
			if (lp2->l_ch=='\'' && (lp2+1)->l_ch=='s') 
			{
				ls_proc_do_sign(phTTS,pLts_t->sign);

				pLts_t->pflag=ls_proc_do_number(phTTS,lp1, lp2, FALSE);
				ls_util_pluralize(phTTS);
				return(FINISHED_WORD);
			}               
#endif		 
/* JDB: end of dependent section */
			
			/* Ordinals, like "1st", "2nd", "3rd".          */
#ifndef FRENCH
			if (pLts_t->sign==0 && ls_util_is_ordinal(phTTS,&num)!=FALSE) 
			{
				pLts_t->pflag=ls_proc_do_number(phTTS,llp, lp2, TRUE);
				return(FINISHED_WORD);
			}
#else
		if (lp2+3 == rlp && lp2->l_ch==(unsigned char)'è' && (lp2+1)->l_ch=='m' 
			&& ((lp2+2)->l_ch=='e')) 
			{
				pLts_t->pflag= ls_proc_do_number (phTTS, llp, lp2, TRUE); /* TRUE for ordinal */
				return(2);
		} 
		else if ( llp+3 == rlp && llp->l_ch=='1'    /* 1er */
		&& (llp+1)->l_ch=='e' && (llp+2)->l_ch=='r' ) 
		{
			ls_util_send_phone_list (phTTS, premier);
//			sendindex (llp, rlp);
//			Fini=2;
			return (2);
		} 
		else if ( llp+4 == rlp && llp->l_ch=='1'    /* 1e2re */
		&& (llp+1)->l_ch==(unsigned char)'è' && (llp+2)->l_ch=='r'
		&& (llp+3)->l_ch=='e' ) 
		{
			ls_util_send_phone_list (phTTS, premiere);
//			sendindex (llp, rlp);
//			Fini=2;
			return (2);
		} 
		else if (lp2+1 == rlp) 
		{
    /* there is 1 character after last digit like 10% or 10° */
		if ( (c=lp2->l_ch)=='%' || c==(unsigned char)'°') 
		{
			ls_proc_do_sign (phTTS, pLts_t->sign);
//			sendindex (llp, lp1);
			ls_proc_do_number (phTTS, lp1, lp2, FALSE);
		if ( c=='%') 
		{
			ls_util_send_phone_list (phTTS, ppercent);
		} 
		else 
		{
			ls_util_send_phone (phTTS, WBOUND);
			ls_util_send_phone_list (phTTS, pdegree);
		}
//			sendindex (lp2,rlp);
//			Fini=2;
		return (2);
		} /* if % ou ° */
      } /* else if one char after number */
		}
		
		return KEEP_SEARCHING;
#endif // FRENCH

#ifndef FRENCH
/* JDB:  Spanish doesn't use this section! */                        
#ifdef ENGLISH			
		}
		else
#endif		
		if (lp2+1 == rlp) 
		{      
			/* 1 after the digits.  */
			/* Plurals, like "60s". */
			if ((c=lp2->l_ch) == 's') 
			{           
				ls_proc_do_sign(phTTS,pLts_t->sign);
				pLts_t->pflag=ls_proc_do_number(phTTS,lp1, lp2, FALSE);
				ls_util_pluralize(phTTS);
				return(FINISHED_WORD);
			}
			/* "10%", "10 cents", "10 degrees". */
			if (c=='%' || c==0xA2 || c==0xB0) 
			{
				ls_proc_do_sign(phTTS,pLts_t->sign);
				pLts_t->pflag = ls_proc_do_number(phTTS,lp1, lp2, FALSE);
				if (c == '%')
					ls_util_send_phone_list(phTTS,ppercent);
				else 
				{
					ls_util_send_phone(phTTS,WBOUND);
					if (c == 0xA2) 
					{
						ls_util_send_phone_list(phTTS,pcent);        
/* JDB: again, English plurals made conditional... */							
#ifdef ENGLISH_US
						if (pLts_t->pflag != FALSE)
							ls_util_send_phone(phTTS,US_S);
#endif							
#ifdef ENGLISH_UK					
						if (pLts_t->pflag != FALSE)
							ls_util_send_phone(phTTS,UK_S);
#endif							
					} 
					else 
					{
						ls_util_send_phone_list(phTTS,pdegree);
/* JDB: again, English plurals made conditional... */				
#ifdef ENGLISH_US
						if (pLts_t->pflag != FALSE)
							ls_util_send_phone(phTTS,US_Z);
#endif							
#ifdef ENGLISH_UK
						if (pLts_t->pflag != FALSE)
							ls_util_send_phone(phTTS,UK_Z);
#endif								
					}
				}
				return(FINISHED_WORD);
			}
		}
	}
	return(KEEP_SEARCHING);
#endif // #ifndef FRENCH
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_part_number()
 *
 *  Description:
 *      this function processes part numbers
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
int ls_task_part_number(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{              
	int c;
	LETTER *lp1;
	PLTS_T pLts_t;
	pLts_t = phTTS->pLTSThreadData;

#ifdef LS1DEBUG
	printf("entering ls_task_part_number\n");
	printf("no more heuristics ");
	printf("left=%u  right=%u\n",llp,rlp);
#endif        
	lp1=llp;
	while (lp1 != rlp) 
	{
		c = lp1->l_ch;
		if (c=='/' || (c>='0' && c<='9'))
		{
			pLts_t->lflag |= DIGSLSH;
		}
		else if (c == '\'')
		{
			pLts_t->lflag |= SQUOTE;
		}
		else if (c!='-' && !(IS_ALPHA(c)))
		{
#ifdef LS1DEBUG
			printf(" drop through spell %c  \n",c);
#endif

#ifndef FRENCH
			return(SPELL_WORD);
#else
			return 1;
#endif // FRENCH
		}
		++lp1;
	}
	if (((pLts_t->lflag)&DIGSLSH) != 0) 
	{             /* Parts have digits or */
		if (((pLts_t->lflag)&SQUOTE) != 0)        /* slashes, and do not  */
		{
#ifdef LS1DEBUG
			printf(" punt spell \n");
#endif

#ifndef FRENCH
			return(SPELL_WORD);
#else
			return 1;
#endif // FRENCH
		}
		ls_proc_do_part_number(phTTS,llp, rlp);
#ifndef FRENCH
		return(FINISHED_WORD);
#else
		return 2;
#endif // FRENCH
	}
	return(KEEP_SEARCHING);                           
}

/* ******************************************************************
 *  Function Name:  
 *      ls_task_process_word()
 *
 *  Description:        
 *      this function takes care of compound nouns, and all other words
 *      that no other function took care of.
 *      this function eventally calls ls_rule_do_lts
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/

#ifndef FRENCH
int ls_task_process_word(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
	volatile int    firsttim;
	LETTER *lp1;
	LETTER *lp2;
	int     type;
	int     c;
#ifdef FRENCH
	int    done=0;
	LETTER *elp;   /* always right end of cword */
	FLAG   Echec;
	FLAG   Trouve_Voy;
	int    lflag=0;
#endif //FRENCH
	PLTS_T pLts_t;
	pLts_t = phTTS->pLTSThreadData;
	
	/*
	 * The second scan checks that each
	 * chunk of of the word (which may be the whole word,
	 * or a bit of a compound word) contains a vowel, and a
	 * consonant except for some special cases. If you get
	 * to the end without a fail, run the thing through
	 * the letter to sound rules.
	 */
#ifdef LS1DEBUG
	printf("entering ls_task_process_word ");
	printf("left=%u  right=%u\n",llp,rlp);
#endif

	lp1 = llp;
	firsttim=1;                             
#ifdef FRENCH
	Echec = FALSE;
	Trouve_Voy = FALSE;
#endif // FRENCH
	while (lp1 != rlp
#ifdef FRENCH
		&& !Echec
#endif
		   ) /* while */
	{
		lp2 = lp1;
#ifndef FRENCH
		pLts_t->lflag &= ~(HNONY|HCONS|HVOWEL);
#else
		pLts_t->lflag &= ~(HCONS|HVOWEL);
#endif // FRENCH
		// GWMICRO FIX for blowinf up on the word "Rev."
		while (lp1<rlp && (c=lp1->l_ch)!='-')
		{
			type = lsctype[c];
			if ((type&C) != 0)
#ifndef FRENCH
				pLts_t->lflag |= HNONY|HCONS;
#else
				pLts_t->lflag |= HCONS;
#endif // FRENCH
			else 
			{
				/* 1/2/1997 GL, use OO (defined in ls_defs.h" for vowel checking */
				if ((type&OO) != 0)
#ifndef FRENCH
					pLts_t->lflag |= HNONY|HVOWEL;
#else
					pLts_t->lflag |= HVOWEL;
#endif // FRENCH
				else 
				{
					/* MG 11/04/1997 BATS#509 add 'Y for checking */  
					if (c == 'y' || c == 'Y') 
					{           
/* JDB: language dependent */
#ifdef ENGLISH_US					
						if (lp1 == lp2)
							pLts_t->lflag |= HCONS;
						else
							pLts_t->lflag |= HVOWEL;
#endif
#ifdef ENGLISH_UK
						if (lp1 == lp2)
							pLts_t->lflag |= HCONS;
						else
							pLts_t->lflag |= HVOWEL;
#endif

#ifdef SPANISH
                        pLts_t->lflag |= (HNONY | HCONS);							
#endif                        
#ifdef FRENCH
							pLts_t->lflag |= HVOWEL;
#endif
					}
				}
			}
			++lp1;
		}

		pLts_t->tlflag=pLts_t->lflag;

#ifdef LS1DEBUG
		printf("b2a %c %c %d\n",lp2->l_ch,lp1->l_ch, lp1->l_ch);
		printf("looking \n");

#endif
		/* ttlp1=lp1;   */
		/* if(lp1->l_ch == '-') */ /* this is a bug */
			/* ttlp1--;  */
		if (ls_util_lookup(phTTS,lp2, lp1, FIRST) != MISS)
		{
#ifdef LS1DEBUG

			printf("got a hit");
#endif
			// GWMICRO FIX for blowing up on the word "Rev."
			if(firsttim == 1 && lp1<rlp)
			{
				lp1++;
#ifdef LS1DEBUG
printf("sending hypen");
#endif
				ls_util_send_phone(phTTS, HYPHEN );
				lp2=lp1;
				llp=lp1;
				firsttim=0;
				continue;
			}
			lp2=lp1;
			llp=lp1;
		}
		else
		{ 
			/* MGS 6/13/97 BATS #389 changed so single letters get spelled */
			if( ((pLts_t->tlflag)&HVOWEL) != 0  && (lp2+1 != lp1))
			{
#ifdef LS1DEBUG
				printf("doing lts1 ");
				printf("left=%u  right=%u\n",lp2,lp1);
#endif
#ifdef DUMP_WORD
				//printf("doing lts1\n");
#endif

				/* MGS 6/16/97 BATS #387 Added becasue rule engine needs lower case characters */
				ls_task_remove_case(lp2,lp1);

				ls_rule_do_lts(phTTS,lp2, lp1);

#ifdef DUMP_WORD
				//printf("done lts1\n");
#endif
#ifdef LS1DEBUG

				printf("done lts1 ");
				printf("left=%u  right=%u\n",lp2,lp1);
#endif
				if (lp1 < rlp)
				{               /* Inter-chunk gap.     */
					lp2 = lp1;
					while (lp1<rlp && lp1->l_ch=='-')
						++lp1;
					llp=lp1; 
					/* GL 03/04/1997  Who add this one? it is a bug */
					/* it will force lp2_1  never equal to lp1 */
					/*lp2=lp1;*/
					ls_util_send_phone(phTTS,lp2+1==lp1 ? HYPHEN : COMMA);
					/* MGS 6/13/97 BATS #389 added for f-a-r wont say ef a dash r */
					if (lp2+1==lp1)
						lp2++;
				}
				else
				{
					llp=lp1;
					lp2=lp1;
				}
#ifdef LS1DEBUG
				printf("done lts1 333");
				printf("left=%u  right=%u\n",llp,rlp);
#endif
			}
		}
		firsttim=0;   
		if (lp2!=lp1)
		{
			if (((pLts_t->lflag)&HNONY) == 0)         /* Spell if all "y".    */
			{
#ifdef LS1DEBUG
				printf(" spell all y \n");
#endif
				ls_spel_spell(phTTS,lp2,lp1);
				/* return(SPELL_WORD); */
			}
			if (((pLts_t->lflag)&HVOWEL) == 0)        /* Spell if no vowels.  */
			{
#ifdef LS1DEBUG
				printf("spell no vowel  \n");
#endif
				ls_spel_spell(phTTS,lp2,lp1);
				/* return(SPELL_WORD); */
			}
			if (((pLts_t->lflag)&HCONS) == 0)
			{       /* If no consonant, the */
				/* if (lp2+1 != lp1)
				{ */
#ifdef LS1DEBUG
					printf(" spell no cons. \n");
#endif
					ls_spel_spell(phTTS,lp2,lp1);
					/* return(SPELL_WORD); */   /* are legal.*/         
			/*  } */

			}
		}
		if (lp1 < rlp)
		{               /* Hit "-", allow long  */
			pLts_t->lflag |= HHYPHEN;       /* blocks of "---".     */
			while (lp1!=rlp && lp1->l_ch=='-')
				++lp1;
		}
	}
	return(FINISHED_WORD);
}
#endif // #ifndef FRENCH

/* ******************************************************************
 *  Function Name:  
 *      ls_task_process_word()
 *
 *  Description:        
 *      this function takes care of compound nouns, and all other words
 *      that no other function took care of.
 *      this function eventally calls ls_rule_do_lts
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *      LETTER *llp				the left bounding pointer of the word
 *      LETTER *rlp				The right bounding pointer of the word
 *
 *  Return Value:                                   
 *      a value that indicates what action to take next
 *      possible values are
 *      KEEP_SEARCHING  Tells ls_task_to continue the search for a possible
 *                      text type
 *      LS_TASK_LOOP    Return to the top of the while loop on ls_task_main
 *      SPELL_WORD      Spell the entire word
 *      FINISHED_WORD   The word was spoken. Read the next word from the pipe
 *
 *  Comments:
 *
 * *****************************************************************/
#ifdef FRENCH
int ls_task_process_word(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp)
{
	int    Fini=0;
	LETTER *lp1;
	LETTER *lp2;
	//  LETTER *elp;   /* always right end of cword */
	FLAG   Echec;
	FLAG   Trouve_Voy;
	unsigned char   c;
	int    lflag=0;
	int    type;
	PLTS_T pLts_t;
	pLts_t = phTTS->pLTSThreadData; 
	/*
    10 : COMPOUND WORD or WORD
	*/
	/* each part between - has a vowel : coq-au-vin */
	lp1 = llp;
	Echec = FALSE;
	Trouve_Voy = FALSE;
	while (lp1 != rlp && !Echec)
	{	c=(unsigned char)lp1->l_ch;
		if (c=='-') {
			if (!Trouve_Voy) {
				Echec=TRUE;
			} else {
				Trouve_Voy=FALSE; /* for next chunk */
				lp1++;
			}
		} else {
			if ( (lsctype[c] & O) != 0) 
				Trouve_Voy=TRUE;
			lp1++;
		}
	} /* while */
	
	if (lp1==rlp && Trouve_Voy) { /* analyse the entire word */
		/* Trouve_Voy for last part :
		   sous-officier, c'est-à-dire, tout-à-coup, vis-à-vis, dit-elle
	       petit, papa
		*/
		if (ls_util_is_white(&(pLts_t->citem))) 
		{  
			/* for : "tous les" with tous in cword */
			/* we have swapped the readword and these lts & sendphone calls from their
			   original ordering. this code used to hold each word which was entered
			   until the next word was retrieved, now it sends each word to the 
			   pipe as it is seen and sync'ing works correctly.
			*/ 
			ls_rule_lts (phTTS, llp, rlp, FALSE); /* "tous" */
			/* chj 8/21/00 changed fourth argument to false 
		 	   because nword no longer contains the next word because of
			   the above-mentioned 'swap' that happened in 1995.
 			*/
			ls_util_send_phone (phTTS, WBOUND);
			
			pLts_t->contgc=TRUE;          /* keep "tous" as left context in lts */
			ls_task_readword (phTTS, pLts_t->nword);     /* "les" */
			
			
			Fini=4;
			
#ifdef DEBG
			if (DbgLs1) {
				printf ("ls1.c Word_or_Compound LTS for word without - : ");
				//Ecrit (llp, rlp);
			}
#endif
			/* copyword after printf : nword in cword for next loop */
			ls_util_copyword (pLts_t->cword, pLts_t->nword);
			
		} else {
			/* not followed by a space, no liaison */
			ls_rule_lts (phTTS, llp, rlp, FALSE); /* les ANS.     ET,  */
			/* helpme should pLts_t->precedent get set to "" here? or contgc to FALSE? */
			Fini=2;
#ifdef DEBG
			if (DbgLs1) {
				printf ("ls1.c Word_or_Compound LTS for word with - : ");
				//Ecrit (llp, rlp);
			}
#endif
			
		}
		
	} else {
    /*
	not a regular word : hyphen with no vowel for one chunk
	check each chunk and spell it or present it to LTS
		*/
		lp1 = llp;
		while (lp1 != rlp) { /* 3 loops hiv-cv-dc */
			lp2=lp1;
			lflag &= ~(HCONS|HVOWEL);
			
			/* loop for one chunk */
			while (lp1 != rlp && (c = (char)lp1->l_ch) != '-') {
				type = lsctype [c];
				if ((type & C) != 0) {
					lflag |= HCONS;
				} else if ((type & O) != 0) {
					lflag |= HVOWEL;
				} else if (c=='y') {
					lflag |= HVOWEL;
				}
				++lp1;
			} /* while not found a chunk */
			
#ifdef DEBG
			if (DbgLs1) {
				printf ("ls1.c Word_or_Compound spell or lts? : ");
				//Ecrit (lp2, lp1);
			}
#endif
			
			if ( (lflag & HVOWEL) == 0) {
				/* Spell if no vowel except : t  of va-t-en, sera-t-elle */
				// CAB 08/15/2002 Removed warnings by typecast
				if (lp2+1==lp1 && lp1->l_ch=='-'
					&& ls_task_wlookup (pLts_t, lp2, (unsigned char *)apres_tiret) )  {
					/* -t-... : va-t-en, sera-t-elle, or -z-en... */
					lp1->l_ch = '\''; /* va-t'en */
					while (++lp1 != rlp && lp1->l_ch!='-');
					ls_rule_lts (phTTS, lp2, lp1, FALSE);    /* lp1 points on - or rlp */
				} else {
					/* spell : BC, b-c-d, MS-dos */
					ls_spel_spell (phTTS, lp2, lp1);
					//    sendindex (lp2, lp1);
				}
			} else {     /* the chunk has a vowel */
				/* ms-DOS : lp2 sur D, lp1 sur S */
				
#ifdef DEBG
				if (DbgLs1) {
					printf ("ls1.c Word_or_Compound hyphen  LTS : ");
					//Ecrit (lp2, lp1);
				}
#endif
				
				/* don't keep DOS for next time */
				strcpy(pLts_t->precedent, "");       /* nothing on the left */
				ls_rule_lts (phTTS, lp2, lp1, FALSE); /* DOS */
			} /* if has or has not a vowel */
			
			if (lp1 != rlp) {
				lp2=lp1;
				/* blocks of "----" */
				while (lp2 != rlp && lp1->l_ch=='-') lp1++;
				ls_util_send_phone (phTTS, WBOUND);  /* comma ? if several - */
				// sendindex (lp2, lp1);
			} /* if */
			
		} /* while not reached the end of cword */
		
		Fini=2;
		
	} /* if regular word or word with hyphen */
	
	return (Fini);
}
#endif // FRENCH

/* MGS this code is for kerzweil and is a hack */
#ifdef ENGLISH // (1)
typedef struct verb_words {
	char word[5];
	int phone[5];
	int fc;
} verb_words_t;

const verb_words_t verbs[6]=
{	
#ifdef ENGLISH_US
	{{"are" }, { S2, US_AA, US_R,  SIL, SIL }, 0x00820020},
	{{"had" }, { US_HX, S2, US_EH, US_D,   SIL }, 0x00820100},
	{{"is"  }, { S2, US_IH, US_Z,  SIL, SIL }, 0x00820020},
	{{"was" }, { US_W,  S2, US_AX, US_Z,   SIL }, 0x00820020},
	{{"were"}, { US_W,  S2, US_RR, SIL, SIL }, 0x00820020},
	{{"will"}, { US_W,  S2, US_IH, US_LX,  SIL }, 0x00820408},
#endif
/* GL 11/03/1997  add UK code */
#ifdef ENGLISH_UK
	{{"are" }, { S2, UK_AA, SIL, SIL, SIL }, 0x00820020},
	{{"had" }, { UK_HX, S2, UK_AE, UK_D,   SIL }, 0x00820100},
	{{"is"  }, { S1, UK_IH, UK_Z,  SIL, SIL }, 0x00820020},
	{{"was" }, { UK_W,  S2, UK_AX, UK_Z,   SIL }, 0x00820020},
	{{"were"}, { UK_W,  S2, UK_RR, SIL, SIL }, 0x00820020},
	{{"will"}, { UK_W,  S2, UK_IH, UK_LX,  SIL }, 0x00820408},
#endif

};

/* ******************************************************************
 *  Function Name:  
 *      ls_task_lookup_first_verbs()
 *
 *  Description:        
 *
 *  Arguments:                                                      
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *
 *  Return Value:                                   
 *		int
 *  Comments:
 *
 * *****************************************************************/
int ls_task_lookup_first_verbs(LPTTS_HANDLE_T phTTS)
{
	PLTS_T pLts_t;
	PKSD_T pKsd_t;
	LETTER *llp, *elp;

	int j,i;
	pKsd_t = phTTS->pKernelShareData;
	pLts_t = phTTS->pLTSThreadData;
	llp = &(pLts_t->cword[0]);
	
/* ***************** NOT USED **************************************/
#if 0
	for (i=0;i<6;i++)
	{
		WINprintf("%d %s %c%c %c%c %c%c %c%c %c%c\n",i,verbs[i].word,
			pKsd_t->arpabet[(verbs[i].phone[0])<<1],pKsd_t->arpabet[((verbs[i].phone[0])<<1)+1],
			pKsd_t->arpabet[(verbs[i].phone[1])<<1],pKsd_t->arpabet[((verbs[i].phone[1])<<1)+1],
			pKsd_t->arpabet[(verbs[i].phone[2])<<1],pKsd_t->arpabet[((verbs[i].phone[2])<<1)+1],
			pKsd_t->arpabet[(verbs[i].phone[3])<<1],pKsd_t->arpabet[((verbs[i].phone[3])<<1)+1],
			pKsd_t->arpabet[(verbs[i].phone[4])<<1],pKsd_t->arpabet[((verbs[i].phone[4])<<1)+1]);
	}
#endif // 0
/* *****************************************************************/

	for (i=0;i<6;i++)
	{
		j=0;
		elp=llp;
		while (elp->l_ch !=EOS)
		{
			if (verbs[i].word[j]!=ls_lower[elp->l_ch])
			{
				break;
			}
			j++;
			elp++;
		}
		if (verbs[i].word[j]==ls_lower[elp->l_ch] && verbs[i].word[j]==0)
		{
#ifdef NEW_LTS
			pLts_t->word_info[1].form_class = verbs[i].fc;
#else
			pLts_t->fc_struct[1] = verbs[i].fc;
#endif // NEW_LTS
			j=0;
			while (verbs[i].phone[j]!=SIL)
			{
				ls_util_send_phone(phTTS,verbs[i].phone[j]);
				j++;
			}		
			pLts_t->lbphone=WBOUND;
			pLts_t->rbphone=WBOUND;
			return(FINISHED_WORD);
		}
	}
	return(KEEP_SEARCHING);
}
 
#endif // ENGLISH (1)

/* ******************************************************************
 *  Function Name:
 *      ls_task_prelookup() 
 *
 *  Description:
 * 		The "word" is just an array of
 * 		LETTER structures, containing a word which
 * 		might just be special. Look it up in a table, and
 * 		return either the phoneme string, or NULL, which
 * 		indicates "no match". Case insensitive. This differ from
 *		wlookup in that it mathes for parts of words from left to right and
 *		ends on the match string ending now the word
 *
 *  Arguments:	PLTS_T pLts_t
 *				LETTER word[]
 *				char table[]
 *
 *  Return Value: char*
 *
 *  Comments:
 *
 * *****************************************************************/
#ifdef WORK_IN_PROGRESS
char  *ls_task_prelookup(PLTS_T pLts_t, LETTER word[], int *count, char table[])
{
	LETTER  *lp;
	/* GL 03/20/1998, BATS#633  use "unsigned char" instead of "char" */
	char  	*cp;
	char  	*tp;
	int   	c;
	int   	len;

	tp = &table[0];                 /* Start at the start.  */
	while ((len = *tp++) != 0) 
	{            					/* 0 => end of table.   */
		lp = &word[0];              
		*count=0;
		cp = tp;                    /* Start of text.       */
		for (;;) 
		{
			c = ls_lower[lp->l_ch]; /* Fold case.           */
		if (*cp == EOS || *cp < 0 )           /* Win.                 */
            {
			if(*cp != EOS)
			{
				//modify replacement count and move to EOS
				*count += *cp++;
			}
			//bump pointer past the EOS char
                 return (++cp);    	/* Return phonemes.     */
            }
			if (c != *cp++)         /* Lose.                */
			{
				break;
			}

			++lp;   
			*count +=1;
		}
		tp += len;                  /* Next.                */
	}
	return (NULL);
}

#endif
#ifdef NEW_LTS
/* ******************************************************************
 *  Function Name:
 *      ls_task_read_sentence() 
 *
 *  Description:
 *
 *  Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *
 *  Return Value: void
 *
 *  Comments:
 *
 * *****************************************************************/
void ls_task_read_sentence(LPTTS_HANDLE_T phTTS)
{
	//on the first pass {
	// read the characters up until the end of the clause
	// add commands to the command table
	// add phonemes to the word string, be sure they are aligned
	// add characters to the word string.

	// after every word, look it up in the dictionaries
	// if the word ends in '.' and it is an abbreviation, keep adding words.
	// if the word ends in a clause boundary, stop adding words.
	// for hits
	// add the dic_type, dict_index, fc, homograph to the structure

}
#endif


/* ******************************************************************
 *  Function Name: find_next_marker() 
 *
 *  Description:
 *
 *  Arguments:	PLTS_T pLts_t
 *				int pos
 *
 *  Return Value: int
 *
 *  Comments:
 *
 * *****************************************************************/
int find_next_marker(PLTS_T pLts_t,int pos)
{
	int i;
	int count=1;
	for (i=pos+1;i<pLts_t->fc_index;i++)
	{
		if (pLts_t->pro_markers[i]&0x00FFFFFF)
		{
			break;
		}
		count++;
	}
	return(count);
}

#ifndef ARM7
#include "proverbs.h"
#endif

#if defined ARM7 || defined __linux__ || defined SPARC_SOLARIS || defined __osf__
#define stricmp strcasecmp
#endif

#ifdef UNDER_CE
#define stricmp _stricmp
#endif

int ls_task_find_verb_particles(LPTTS_HANDLE_T phTTS,LETTER *word_start,LETTER *word_end)
{
#ifndef ARM7
	PLTS_T  pLts_t;
	unsigned char word[200];
	int high;
	int low;
	int mid;
	int value;

	int i=0;
	int found=0;

	pLts_t = phTTS->pLTSThreadData;	

	if (word_start>=word_end)
	{
		return(0);
	}
	while (word_start!=word_end)
	{
		word[i++]=(unsigned char)word_start->l_ch;
		word_start++;
	}
	word[i]='\0';

	low=1;
	high=sizeof(verb_pairs_index)/sizeof(verb_pairs_index[0]);

	
	while (high>=low)
	{
		mid=(high+low)>>1;
		value=stricmp(word,&(verb_pairs_words[verb_pairs_index[mid]]));
		if (value==0)
		{
			found=1;
			break;
		}
		if (value<0)
		{
			high=mid-1;
			continue;
		}
		if (value>0)
		{
			low=mid+1;
			continue;
		}
	}
	if (!found)
	{
		mid=high;
		value=stricmp(word,&(verb_pairs_words[verb_pairs_index[mid]]));
		if (value==0)
		{
			found=1;
		}
	}
	if (!found)
	{
		mid=low;
		value=stricmp(word,&(verb_pairs_words[verb_pairs_index[mid]]));
		if (value==0)
		{
			found=1;
		}
	}
	if (found)
	{
		return(mid);
	}
#endif
	return(0);
}


#ifndef ARM7
int ls_task_search_for_conj(PLTS_T pLts_t)
{
	int i,j;
	int num_conj=sizeof(conj_words)/(sizeof(char)*4);
	unsigned char value;
	unsigned char temp;
	int found_it=0;

	for (i=0;i<pLts_t->fc_index;i++)
	{
		if (pLts_t->pro_markers[i] & 0xFF000000)
		{
			found_it=0;
			value=(unsigned char)((pLts_t->pro_markers[i] & 0xFF000000)>>24);
			for (j=0;j<num_conj && value>=conj_words[j][0] && found_it==0;j++)
			{
				if (conj_words[j][0]==value)
				{
					if ((i+1)<pLts_t->fc_index)
					{
						temp=(unsigned char)((pLts_t->pro_markers[i+1] & 0xFF000000)>>24);
						if (temp!=conj_words[j][1])
						{
							continue;
						}
						if (conj_words[j][2]==0)
						{
							found_it=1;
							break;
						}
						if ((i+2)<pLts_t->fc_index)
						{
							temp=(unsigned char)((pLts_t->pro_markers[i+2] & 0xFF000000)>>24);
							if (temp!=conj_words[j][2])
							{
								continue;
							}
							if (conj_words[j][3]==0)
							{
								found_it=3;
								break;
							}
							if ((i+3)<pLts_t->fc_index)
							{
								temp=(unsigned char)((pLts_t->pro_markers[i+3] & 0xFF000000)>>24);
								if (temp==conj_words[j][3])
								{
									found_it=3;
								}
							}
						}
					}
				}
			}
			if (found_it)
			{
				switch (found_it)
				{
				case 3:
					pLts_t->pro_markers[i+3]=0xFF000000;
				case 2:
					pLts_t->pro_markers[i+2]=0xFF000000;
				case 1:
					pLts_t->pro_markers[i+1]=0xFF000000;
				case 0:
					pLts_t->pro_markers[i]|=PRO_MULTI_CONJ;
					break;
				}
				i+=found_it;
			}
		}
	}
	return(0);
}
#endif

/* ******************************************************************
 *  Function Name:ls_task_parse_sentence() 
 *
 *  Description:
 *
 *  Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *
 *  Return Value: void
 *
 *  Comments:
 *
 * *****************************************************************/
void ls_task_parse_sentence(LPTTS_HANDLE_T phTTS)
{
	PKSD_T  pKsd_t;
	PLTS_T  pLts_t;
	int i,j,k;
	int start;
#ifdef ENGLISH
	int last_marker=0;
#endif
	LETTER cur_word[200];
#ifdef ENGLISH
	int verb_num;
#endif
	
	pKsd_t = phTTS->pKernelShareData;
	pLts_t = phTTS->pLTSThreadData;	

	pLts_t->fc_index = 1;
	pLts_t->old_fc_index = -1;
	pLts_t->fc_struct[0] = 0;
	pLts_t->fc_struct[1] = 0;
	pLts_t->pro_markers[0]=0;
	pLts_t->pro_markers[1]=0;
	for (i=0;i<pLts_t->cur_input_pos;i++)
	{
		for (j=i;(j<pLts_t->cur_input_pos && 
			(char_types[pLts_t->input_array[j]]&MARK_space) ); j++,i++);

		k=0;
		for (j=i;(j<pLts_t->cur_input_pos && 
			(!(char_types[pLts_t->input_array[j]]&MARK_space)) && k<200);j++,k++,i++)
		{
			cur_word[k].l_ch=pLts_t->input_array[j];
		}
		start=0;
		cur_word[k].l_ch=0;
#ifdef ENGLISH
		switch(cur_word[0].l_ch)
		{
		case '(':
			pLts_t->pro_markers[pLts_t->fc_index]|=PRO_OPEN_PAREN;
			start++;
			break;
		case '"':
			pLts_t->pro_markers[pLts_t->fc_index]|=PRO_OPEN_QUOTE;
			start++;
			break;
		}
		if ((k-start)>=1)
		{
		switch(cur_word[k-1].l_ch)
		{
		case ')':
			pLts_t->pro_markers[pLts_t->fc_index]|=PRO_CLOSE_PAREN;
			k--;
			cur_word[k].l_ch=0;
			break;
		case '"':
			pLts_t->pro_markers[pLts_t->fc_index]|=PRO_CLOSE_QUOTE;
			k--;
			cur_word[k].l_ch=0;
		break;
		}
		}
		ls_dict_blook(phTTS,&cur_word[start],&cur_word[k],0);

		verb_num=ls_task_find_verb_particles(phTTS,&cur_word[start],&cur_word[k]);
		if (verb_num)
		{
			pLts_t->pro_markers[pLts_t->fc_index]|=(verb_num<<24);
		}
#endif
		
#ifdef ENGLISH
		if (k==1 && cur_word[0].l_ch=='-')
		{
			pLts_t->pro_markers[pLts_t->fc_index]|=PRO_DASH;
		}

		if ((pLts_t->fc_struct[pLts_t->fc_index]&FC_CONJ))
		{
			pLts_t->pro_markers[pLts_t->fc_index]|=PRO_CONJ;
		}

		if ((pLts_t->fc_struct[pLts_t->fc_index]&FC_FUNC))
		{
		//	pLts_t->pro_markers[pLts_t->fc_index]|=PRO_FUNC;
		}


		if ((pLts_t->fc_struct[pLts_t->fc_index]&FC_PREP) && 
			(pLts_t->fc_struct[pLts_t->fc_index]&FC_PART)==0)
			// to shouldn't be a category 
		if((pLts_t->fc_struct[pLts_t->fc_index]&FC_TO)==0)
		{
			//preposition but not a to
			pLts_t->pro_markers[pLts_t->fc_index]|=PRO_PREP;
		}
		

		if ((pLts_t->fc_struct[pLts_t->fc_index]&FC_THAT))
		{
			pLts_t->pro_markers[pLts_t->fc_index]|=PRO_THAT;
		}
#endif
		pLts_t->old_fc_index =pLts_t->fc_index;
		pLts_t->fc_index++;
		pLts_t->fc_struct[pLts_t->fc_index]=0;
		pLts_t->pro_markers[pLts_t->fc_index]=0;

	}


#ifndef ARM7
	ls_task_search_for_conj(pLts_t);
#endif

	// insert prosidic markers on ";" ":" " - " "?" """ "(" ")" 
	//    conjunctions, "that", prepositions that are not particles
#ifdef ENGLISH
	last_marker=0;
	pLts_t->length = pLts_t->fc_index-1;
	for (i=0;i<pLts_t->fc_index;i++)
	{
		if (pLts_t->pro_markers[i] == 0xFF000000)
		{
			pLts_t->pro_markers[i] |= PRO_CONJ;
			if (pLts_t->pro_markers[i+1] == 0xFF000000)
			{
				pLts_t->pro_markers[i+1] |= PRO_CONJ;
			}
			if (pLts_t->pro_markers[i+2] == 0xFF000000)
			{
				pLts_t->pro_markers[i+2] |= PRO_CONJ;
			}
			if (pLts_t->pro_markers[i+3] == 0xFF000000)
			{
				pLts_t->pro_markers[i+3] |= PRO_CONJ;
			}
		}
		if (pLts_t->pro_markers[i] & 0x00FFFFFF)
		{
			if (i-last_marker<=3)
			{
				last_marker=i;
				continue;
			}
			if (find_next_marker(pLts_t,i)==1)
			{
				last_marker=i;
				continue;
			}
			if (i-last_marker>=6)
			{
				pLts_t->pro_markers[i]|=PRO_REQ_BREAK;
				last_marker=i;
				continue;
			}
			if (find_next_marker(pLts_t,i)>=6)
			{
				pLts_t->pro_markers[i]|=PRO_REQ_BREAK;
				last_marker=i;
				continue;
			}
			//not sure what rule is supposse to do
			//but don't want to do it if near end and this isn't checked for anywhere
			if (i-last_marker>=4)
			{
				pLts_t->pro_markers[i]|=PRO_OPT_BREAK;
				last_marker=i;
				continue;
			}
			if (find_next_marker(pLts_t,i)>=2)
			{
				pLts_t->pro_markers[i]|=PRO_OPT_BREAK;
				last_marker=i;
				continue;
			}
			last_marker=i;
		}
	}

#endif
	// run the simple rules on the markers.

	//do parsing stuff here.....
#ifndef ARM7_NOSWI
	if (DT_DBG(VTM_DBG,0x002))
	{
		for (i=0;i<pLts_t->cur_input_pos;i++)
		{
			printf("%c",pLts_t->input_array[i]);
		}
		printf("\n");
		i=1;
		for (j=0;j<pLts_t->cur_input_pos;j++)
		{
			if ((char_types[pLts_t->input_array[j]]&MARK_space))
			{
				printf(" ");
			}
			else
			{
				printf("%c",pLts_t->input_array[j]);
			}
			if ((char_types[pLts_t->input_array[j]]&MARK_space) && 
				(char_types[pLts_t->input_array[j-1]]&MARK_space)==0)
			{
				printf("      ");
				if (pLts_t->pro_markers[i]& 0x00C00000)
				{
					printf("PB ");
				}
				if (pLts_t->pro_markers[i] & 0x000FFFFF)
				{
					printf("PM ");
				}
				printf("      ");
				start=1;
				for (k=0;k<32;k++)
				{
					if (pLts_t->fc_struct[i] & start)
					{
						printf("%s ",form_class_strings[k]);
					}
					start<<=1;
				}
				i++;
				printf("\n");
			}
		}
	}
#endif

	pLts_t->fc_index = 1;
	pLts_t->old_fc_index = -1;
	pLts_t->fc_struct[0] = 0;
	pLts_t->fc_struct[1] = 0;
}

/* ******************************************************************
 *  Function Name:
 *      ls_task_process_sentence() 
 *
 *  Description:
 *
 *  Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *
 *  Return Value: void
 *
 *  Comments:
 *
 * *****************************************************************/
void ls_task_process_sentence(LPTTS_HANDLE_T phTTS)
{
	//}
	// do the parsing stuff from here
	//on the second pass {
	// set the llp and rlp pointers correctly for each word
	// capture the phonemes
	// do any necessary allophonic/stress changing
	// send them on their way
	//}
}

/* ******************************************************************
 *  Function Name:
 *      ls_task__read_sentence() 
 *
 *  Description:
 *
 *  Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *				LETTER *llp
 *				LETTER *rlp
 *
 *  Return Value: void
 *
 *  Comments:
 *
 * *****************************************************************/
void ls_task_get_word_for_output(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp)
{
	// retrieve the next word from the structure and
	// set its start and end with llp and rlp respectively
}