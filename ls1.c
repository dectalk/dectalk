/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * Copyright (c) 1985, Digital Equipment Corporation, Maynard, Mass.
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
 *    File Name:	ls1.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * This file contains the words by
 * word driving loop of letter to sound.
 * Blocks out words in the input stream, applies
 * a number of heuristics to the words, and if all
 * else fails, speaks the word using letter to sound.
 * To do the job, it calls a number of secondary
 * routines in "ls2.c", and uses tables of phomemes
 * from "ls3.c".
 *
 ***********************************************************************
 *    Revision History:
 * 01 01-Mar-85 DGC     Added user dictionary lookup.
 * 02 05-Mar-85 DGC     Main dictionary now understands case.
 * 03 25-Mar-85 DGC     Organized the flags. Massively changed the
 *                      comments in the "lstask".
 * 04 01-Apr-85 DGC     The "lookup" code is smarter, and is in
 *                      "ls7.c".
 * 05 05-Apr-85 DGC     The code at "gok" now puts out a comma
 *                      at the end in some situations.
 * 06 08-Apr-85 DGC     Do the "degree" symbol correctly. Changed
 *                      arguments to dictionary lookup.
 * 07 02-May-85 DGC     Make "st." and "dr." independent of case.
 * 08 13-May-85 DGC     Fix abbreviation bug; "Abb.," didn't match.
 * 09 15-May-85 DGC     (Gov. Smith)
 * 10 16-May-85 DGC     Make "yyy" work right, even though it is
 *                      probably not worth it!
 * 11 21-May-85 DGC     Heuristic changes. Changed the "if" in the
 *                      parenthesis stripper to a "while" (again).
 *                      Made stuff like "Gov." and "Jesse." (the quotes
 *                      are part of the text) work.
 * 12 23-May-85 DGC     Improved the handling of words like "I.B.M.".
 *                      The final period is now eaten.
 * 13 24-May-85 DGC     The last phoneme output by anybody is saved
 *                      in "lphone". This is used by code that puts
 *                      extra stuff on the end of a word. This is a
 *                      generalization of the old "lastlook" code.
 *                      Added plural numbers.
 * 14 14-Jun-85 DGC     Redid the support for the "single letter word"
 *                      multinationals. The old scheme was just too
 *                      naive.
 * 15 20-Jun-85 DGC     Added "secs." to the number abbreviation table,
 *                      as per the manual.
 * 16 27-Jun-85 DGC     Added a COMMA in front of slow spelling.
 * 17 21-Aug-85 DGC     A new rule. Single upper case character words
 *                      followed by a period are spelled, and the
 *                      period is eaten. This is to make stuff like
 *                      "David G. Conroy" work better. We understand
 *                      that "The King and I." will screw up.
 * 18 28-Aug-85 DGC     Adjusted the phonetics on "hectares". The stress
 *                      was bad, and the last phoneme was "funny".
 *                      Changed the [x] in "nanoseconds" to [o].
 * 19 18-Sep-85 DGC     Stylistic changes suggested by "lint".
 * 20 29-Oct-85 DGC     Almost too late! Although is is correct to put
 *                      a pause in front of blocks of spelled words,
 *                      doing it in front of single letter words is an
 *                      incompatability with DECtalk I, and makes the
 *                      old "to spell fast, put blanks between the
 *                      letters" rule false.
 * ----------------     Released as C5005 V1.0 firmware.
 * 21 21-Oct-86 DGC     Changes for KRM.
 * 22 17-Nov-86 DGC     More changes for KRM.
 * 23 11-APR-87 EAB     Added change for Kurzweil to make negative numbers
 *                      spell out for small negative as well as positive no.
 * 24 25-may-93 eab 	made many changes how dash was pronounced etc.
 * 25 6-2-93 	EAB 	Changed "wh" question rule to acutally look for the words it
 *               		should. It used to not fire when it should and fire when it
 *						houldn't.
 * 26 2-17-96 	EAB 	When I put on debug found that one sendinex had not been
 *                		removed and the routine was still there--removed both!
 * 27 2-16-96 	GL  	Fix the problem while processing xxxx-yyyy string.
 *                		The ending pointer of xxxx is incorrectly offset by 1.
 *                		So in the dictionary search we are looking for "xxx"
 *                		instead of "xxxx".  It will also messup the suffix stripping.
 * 28 2-19-96 	CJL 	Removed KRM code.
 * 29 02-22-1996 MGS	Replace code that was removed in error in 28
 * 30 04-30-1996 GL     set up the form class of "to","and" and "for" in wlookup()
 *                      to pick up the correct homograph after these special words.
 * 31 10-23-1996 GL     remove unused index mark handling code.
 * 32 11-06-1996 GL		use ls_lower[] to perform the case change.
 *						use IS_UPPER() to check the upper case alphabet.
 *						use IS_ALPHA() to check the alphabet
 * 33 06-19-2002		made modifications for the epsonC33 port
 */

#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#endif

#ifdef SIMULATOR
#include <stdio.h>
#endif


#include "lsdef.h"
#include "lsconst.h"

#include "epsonapi.h"
#if CALLER_ID
char cinput_array[20]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
#else
//char cinput_array[64]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
char cinput_array[128]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
#endif

#ifndef NO_CMD
int input_array_pos=0;
#endif

#ifdef SINGLE_THREADED
ph_loop(short *input_phone);
#endif
//#define ARRAY_INPUT
/*#define LS1DEBUG 1 define for debug printout */

/*
 * Flags (lflag).
 */
#define LSTRIP  0x0001                  /* Left  stripping was done.    */
#define RSTRIP  0x0002                  /* Right stripping was done.    */
#define DIGSLSH 0x0004                  /* Word has digit or slash.     */
#define SQUOTE  0x0008                  /* Word has a single quote.     */
#define HVOWEL  0x0010                  /* Has a vowel.                 */
#define HCONS   0x0020                  /* Has a consonant.             */
#define HHYPHEN 0x0040                  /* Has a hyphen; compound.      */
#define HNONY   0x0080                  /* Has a non-y.                 */
#ifndef CALLER_ID
int lflag;
int tlflag;
#endif

int incommand=0;
int cmdcount=0;

static int checkloop = true;
/*
 * Used by number reading.
 */

typedef struct  NUM_struct {
	LETTER  *n_ilp;                 /* Integer part: left           */
	LETTER  *n_irp;                 /* Integer part: right          */
	LETTER  *n_flp;                 /* Fractional part: left        */
	LETTER  *n_frp;                 /* Fractional part: right       */
	LETTER  *n_elp;                 /* Exponent: left               */
	LETTER  *n_erp;                 /* Exponent: right              */
}       NUM;

LETTER  cword[NGWORD];                  /* Current word.                */
LETTER  nword[NGWORD];                  /* Next word, for lookahead.    */
PHONE   pnode[NPNODE];                  /* Phoneme pool.                */
PHONE   phead;                          /* Used by letter to sound.     */
ITEM    citem;                          /* Current item.                */
ITEM    nitem;                          /* Next item, for lookahead.    */
short   wstate;                         /* "Which" state.               */
short   lphone;                         /* Last phoneme (from anybody). */
#ifndef CALLER_ID
short   fchar;                          /* Delimiter in fractions.      */
short   schar;
extern short last_voice;
#else
short   schar;                          /* Delimiter between groups.    */
#endif
short lp1temp[40];
int lp1count;
#ifdef DIRECT_LTS_INPUT
int last_was_ctrlk;
#endif
extern PHONE	*pflp;
/*
 *  form classes are set by the dictionary manager and suffix stripper
 *  and are used by name, homograph, and stress routines ...
 */ 


#ifdef FULL_LTS
// unsigned long   fc_struct[4]; /*xxx eab needs to be bigger to prevent
//		a disaster*/
unsigned long   fc_struct[256]; /*xxx eab needs to be bigger to prevent*/
int     fc_index;

#endif


//int     fc_index;
/*
 *  ascii dictionary externals used to replace lts ascii grapheme strings
 *  with other grapheme strings ...
 */

//int     adic_lookaside;

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
#define TYPE    0x000F                  /* Character type.              */
#define I       0x0010                  /* 1 if invisable               */
#define U       0x0020                  /* 1 if upper case character.   */
#define LS      0x0040                  /* 1 if left  side stripable.   */
#define RS      0x0080                  /* 1 if right side stripable.   */
#define FB      0x0100                  /* 1 if forced clause break.    */
#define O       0x0200                  /* 1 if a vowel (kludge name)   */
#define C       0x0400                  /* 1 if a consonant.            */
#define PR      0x0800                  /* 1 if printing character.     */

#define IGNORE  0                       /* Always discarded.            */
#define BACKUP  1                       /* Backup the word cursor.      */
#define NEVER   2                       /* Never in a word.             */
#define MIGHT   3                       /* Goes in word if imbedded.    */
#define ALWAYS  4                       /* Always kept.                 */
#define PHONEME 5                       /* An out of band signal.       */
//int noun_cnt;
#ifndef SINGLE_THREADED
extern  P_PIPE  linp;
extern  P_PIPE  kinp;
#endif
#ifdef ACNA2
extern int namef;
#endif

/* This extern area was added as a work around to a pre-processor problem */

LETTER *parsenumber(LETTER *llp, LETTER *rlp, NUM *np);

void lookahead(void);
void dorpunct(int flag);
void nextitem(void);
void spell(LETTER *lp1, LETTER *lp2);

#ifndef CALLER_ID
	/* table of special words.*/
	const unsigned char sdic[] = {
	9,'f','o','r',EOS,SPECIALWORD,PPSTART,F,RR,SIL,
	10,'a','n','d',EOS,SPECIALWORD,PPSTART,EH,N,D,SIL,
	8,'t','o',EOS,SPECIALWORD,PPSTART,T,UH,SIL,
	0
	};
#endif
#ifndef CALLER_ID
const unsigned char whdic[] = {
	6,'w','h','a','t',EOS,SIL,
	6,'w','h','e','n',EOS,SIL,
	7,'w','h','e','r','e',EOS,SIL,
	5,'w','h','y',EOS,SIL,
	5,'w','h','o',EOS,SIL,
	5,'h','o','w',EOS,SIL,
	7,'w','h','i','c','h',EOS,SIL,
	7,'w','h','o','s','e',EOS,SIL,
	6,'w','h','o','m',EOS,SIL,
	0
	};
#endif

/*
 * Letter to sound task. A long and
 * rather involved driving routine, with lots
 * of friends. Not as bad as it looks!
 * (Or so he says).
 */
#ifndef NO_CMD
int nextitem_new(short *local_buf);


extern const unsigned char char_types[];

#define MARK_clause            0x40                    /* punctuation used as clause terminator */
#define MARK_space             0x80                    /* white space character */


void lts_loop(unsigned short *input)
{
	int temp;

	if ((input[0]&PFONT)==(PFASCII<<PSFONT))
	{
		temp=input_array_pos;
		cinput_array[input_array_pos]=(input[0]&PVALUE);
		input_array_pos++;
		if (  ((char_types[cinput_array[temp]]&MARK_space) &&
               (char_types[cinput_array[temp-1]]&MARK_clause)) ||
			  (temp>110 && (char_types[cinput_array[temp]]&MARK_space)) ||
			  (temp>126))
		{
			cinput_array[input_array_pos]='\0';
			lstask();
			input_array_pos=0;
		}
		else
		{
			return;
		}
	}
	else
	{
		if (input_array_pos!=0)
		{
			cinput_array[input_array_pos]='\0';
			lstask();
			input_array_pos=0;
		}
		if (nextitem_new(input))
		{
			ph_loop(input);
		}
		nitem.i_nword = 0;
	}
}

#endif


far lstask()
{

	int isnumabr=0;
volatile        int firsttim;
	  LETTER        *llp;
	  LETTER        *rlp;
	  LETTER        *elp;
	  LETTER        *lp1;
#ifndef CALLER_ID
	  LETTER        *templp1;
	  LETTER        *ttlp1;
	  LETTER        *tlp1;
#endif
	  LETTER        *lp2;
	  PHONE *pp;
#ifndef CALLER_ID
	  char  *cp;
#endif
	  int   flag;
	  int   context;
#ifndef CALLER_ID
	  int   type;
	  int   c;
#endif

	  int   lbphone=0;
	  int   rbphone=0;
	  int   lflag=0;

#ifndef CALLER_ID
	  int   sign;

	  int   pflag;
	  int   speed;
	  int   c1;
	int     c2,d;
	int count;

#endif
	NUM             num;


#ifdef DIRECT_LTS_INPUT
	  last_was_ctrlk=0;
#endif
	  if (checkloop == false)
	  checkloop = true; //set the system loop
	  // MGS add for initializing
	  pflp=NULL;
	pp = &pnode[0];                         /* Pool of PHONE nodes. */
	while (pp < &pnode[NPNODE]) {
		pfree(pp);
		pp+=1;
	}
	wstate = UNK_WH;                        /* Start of sentence.   */
	lphone = WBOUND;                        /* Out of band.         */
	readitem();
	readword(&cword[0]);

	/*
	 * Top of the word processing main loop.
	 * Called with a word in "cword" and the delimiter in
	 * "citem". Look at the word, and update the "which" state
	 * if this is the first word in a sentence. Allow the
	 * "W" to be in either case. Don't get fooled by
	 * strippable punctuation.
	 */

loop:     
	
	if(checkloop == false)
		return 0;

/* ...tek block here to make sure PH has something to do and that
		we don't hog the CPU.. */
#ifdef OS_IN_SYSTEM
	block(NULL_FP);
#endif

	/* xxxx eab WE added code to allow for double abreviations such as
		4 sq. ft. but we need to block these abbreviations in normal
		contexts so things like in and ha don't come out as hectors
		and inches. so The 2nd abrreviation checker (nabtab)
		is blocked unless the first time after a look ahead from
		a number hit in the first case using the isnumabr being
		set*/


#ifndef CALLER_ID

	if(isnumabr)
		isnumabr--;

#ifdef ACNA2
	if( (KS.pronflag & PRON_ACNA_NAME) !=0)
		{
	if(namef == 1)
			{
			namef=0;
			/*clear pron name even if we did it with the dic*/
			KS.pronflag &= (~PRON_ACNA_NAME);
			}
		else
			{
			namef++;
			}
		}
	else
		namef=0;
#endif


	if (wstate==UNK_WH && cword[0].l_ch!=EOS)
			{

#ifdef FULL_LTS
			fc_index = 1;
			fc_struct[0] = 0;
			fc_struct[1] = 0;
#endif
			wstate = NOT_WH;
			llp = &cword[0];
			while ((lsctype[llp->l_ch]&LS) != 0)
				++llp;
			if ( (wlookup(llp,&whdic[0])) != NULL)
				{
				wstate = IS_WH;
				}

			}
#ifdef FULL_LTS
		else
			{

			if((cword[0].l_ch!=SIL ) && fc_index != sizeof(fc_struct)/4)
				{
				fc_index += 1;
				fc_struct[fc_index] = 0;
				}
			}
#endif
#endif

	/*
	 * Bow out quickly on null words.
	 * These happen when you type something like
	 * "[ax] there.". The schwa gets copied right into
	 * the output, and the current word is null.
	 */

	llp = &cword[0];
	elp = llp;
	while (elp->l_ch != EOS)
		{
		++elp;
		}
	rlp = elp;
	if (llp == rlp) {
		dorpunct(MISS);
		readword(&cword[0]);

		if (cword->l_ch == 0)
			goto outlstask;
			
		else
			goto loop;

	}                         

	/*
	 * Word spelling.
	 * A new feature for AT&T - IS.
	 * Spell the word using the fast spelling speed.
	 * These is some special code in "dorpunct" that
	 * helps out word spelling, by speaking " "
	 * (between words) as COMMA.
	 */

#ifdef FULL_LTS
	if ((KS.modeflag&MODE_SPELL)!=0) {

#ifdef LS1DEBUG
			printf(" mode spell spell\n");
#endif

		spell(llp, rlp);
		dorpunct(MISS);
		readword(&cword[0]);

		goto loop;
	}
#endif
#ifndef CALLER_ID
	if ( (cp = (char *)wlookup(llp,&sdic[0])) != NULL)
			{       /*eab mini dictionary lookup */
		   sendlist(cp);
			lbphone=WBOUND;
			rbphone=WBOUND;
		   goto out;
			}
#endif
/*              if(llp->l_ch == '1'&& (llp+1)->l_ch == 0 )
				{
				pflag = FALSE;
				goto skipdic;           
				}*/
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

	/* The dictionary uses the fact that it never gets passed a word
		with a space at the bigging to store items that are to be spelled
		in the spell routine but don't want to hit here such as numbers.
		with numbers it does a lookahead to see if the next item is in
		nabtab*/


	if (rlp>=llp+2 && (rlp-1)->l_ch=='.')
		{
		if ((flag=lookup(llp, rlp-1, FABBREV)) != MISS)
			{
			dorpunct(flag);

			readword(&cword[0]);

			goto loop;
			}
		}
	else
		{
		context = FIRST;
		if (isdot() != FALSE)
			{
			context = FABBREV;
			}
		/* xxxx eab 9/94 added to take care of 5 sq. ft. double
			abbrev in context*/
#ifndef CALLER_ID
		if(isnumabr && context == FABBREV &&
			(cp=(char *)wlookup (&cword[0], &nabtab[0])) != NULL)
			{
			if(pflag != FALSE)      /* Pick right form.     */
				{
				while (*cp++ != SIL);
				}
			sendlist(cp);  /* Send abbreviation.    */
			readitem();             /* Eat up the ".".      */
			dorpunct(MISS);
			readword(&cword[0]);    /* Advance, continue.   */
			goto loop;
			}
#endif
		
		if ((flag=lookup(llp, rlp, context)) != MISS)
			{
			if (flag == ABBREV)     /* Need to gobble up    */
				readitem();                     /* the "." here.        */
			dorpunct(flag);

			readword(&cword[0]);

			goto loop;
			}
		}

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
skipdic: 


	lbphone = WBOUND;
	rbphone = WBOUND;

	/* Change this "while" to an "if" to strip only 1 layer.        */
	while ((lsctype[llp->l_ch]&LS) != 0)
		{
		lflag |= LSTRIP;
		if ((lsctype[llp->l_ch]&FB) != 0)
			{
			lbphone = COMMA;
			}
		++llp;
		}

	/* Change this "while" to an "if" to strip only 1 layer.        */
	while (rlp!=llp && (lsctype[(rlp-1)->l_ch]&RS)!=0) {
		lflag |= RSTRIP;
		--rlp;
		if ((lsctype[rlp->l_ch]&FB) != 0)
			{
			rbphone = COMMA;
			}
		if (rlp > llp+1) {
			switch ((rlp-1)->l_ch) {
			case '?':


				rbphone = QUEST;
				--rlp;
				break;

			case '!':
				rbphone = EXCLAIM;
				--rlp;
				break;

			case ',':
			case ':':
			case ';':
				rbphone = COMMA;
				--rlp;
				break;
			}
		}
	}

	if (llp == rlp) {                       /* Null word            */
		spell(&cword[0], elp);  /* Always slowly.       */
#ifdef LS1DEBUG
			printf("null word spell\n");
#endif

		dorpunct(MISS);
		readword(&cword[0]);

		goto loop;
	}

	/*
	 * Deal with any side effects of the
	 * stripped left hand end punctuation marks.
	 * They will never be looked at again.
	 */

	if (lbphone != WBOUND)
		sendphone(lbphone);

#ifndef CALLER_ID
	/*
	 * If the above code stripped off a
	 * punctuation mark, give the dictionary another try
	 * at it. Duck out through the common exit if we get a
	 * hit at this level. We also understand how to deal
	 * with an abbreviation contexts that are hidden
	 * by right end strippable punctuation.
	 */

	context = FIRST;
	if ((lflag&RSTRIP) != 0) {
		lp1 = rlp-1;
		if (llp!=lp1 && lp1->l_ch=='.') {
			if ((flag=lookup(llp, lp1, FABBREV)) != MISS) {
				if (flag != ABBREV)
					rbphone = PERIOD;
				goto out;
			}
			rbphone = PERIOD;       /* Very strong.         */
			--rlp;
		}
	} else if (isdot() != FALSE)            /* "(Gov. Smith)"       */
		context = FABBREV;
	if ((lflag&(LSTRIP|RSTRIP)) != 0
	&& (flag=lookup(llp, rlp, context)) != MISS) {
		if (flag == ABBREV)             /* Eat the "."          */
			readitem();
		goto out;
	}
#endif
/*
 *  run through the new speak/spell rule tables ...
 */
#ifndef CALLER_ID
	if(say_it(llp,rlp) == FALSE)
		{
#ifdef LS1DEBUG
			printf("say_it spell\n");
#endif

		spell(llp,rlp);
		goto out;
		}
#endif


#ifndef CALLER_ID
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

		/* GL 11/06/1996, use IS_ALPHA(c) to check for alphabet */
		/* if (c>='A' && c<='Z'*/
		if (IS_UPPER(c)
		&& (lflag&(LSTRIP|RSTRIP))==0 && isdot()!=FALSE)
			{
			readitem();
#ifdef LS1DEBUG
			printf(" spell cap letter \n");
#endif

			goto gok;
			}                                         

		/*
		 * I    => [`A].        Note stress.
		 * "I"  => ['A].        This is consistant with
		 * (I)  => ['A].        the spelling entry.
		 */

		if (c=='i' || c=='I')
			{
			if ((lflag&(LSTRIP|RSTRIP)) != 0)
				sendphone(S1);
			else
				sendphone(S2);
			sendphone(AY);
			goto out;
			}

		/*
		 * The single character word "a" has two
		 * different pronounciations. The default one, from
		 * the spelling entry in the dictionary, is ['e]. The
		 * exception (actually the most common case) is [x].
		 * Use [x] if no stripping, and the "a" is not sitting
		 * against a punctuation mark ("a box." vs "box a.").
		 */

		if ((c=='a' || c=='A')
		&& (lflag&(LSTRIP|RSTRIP))==0 && iswhite(&citem)==TRUE)
			{
#ifdef FULL_LTS
			fc_struct[fc_index] = FC_ART;
#endif
			sendphone(SPECIALWORD);
			sendphone(AX);
#ifdef LS1DEBUG
			printf(" a to ah code \n");
#endif
			goto out;
			}
		
		/*
		 * Most other single letter words get
		 * spelled. Watch out for single character numbers
		 * (the digits, and the 1/4 and 1/2 DEC supplimental
		 * characters) which must go through the number
		 * processing heuristics.
		 */
		if (c!=0xBC && c!=0xBD && digit(llp)==FALSE)
			{
#ifdef LS1DEBUG
			printf("single letter spell\n");
#endif

			goto gok;
			}
		}
	else
		{
		flag = FALSE;                   /* Start validation.    */
		lp1  = llp;
		while (lp1 != rlp) {
			if (flag == FALSE) {    /* FALSE => even.       */

				/*
				 * On a standard DECtalk all of
				 * the characters in an "I.B.M." thing
				 * must be in upper case. On the special
				 * Kurzweil DECtalk any letter will do.
				 * A letter is defined here as vowel
				 * or consonant.
				 */

				/* GL 11/06/1996, use IS_ALPHA(c) to check for alphabet */
				if (!(IS_UPPER(lp1->l_ch)))
				/* if (lp1->l_ch<'A' || lp1->l_ch>'Z')*/
					break;
				flag = TRUE;
			} else {                /* TRUE => odd.         */
				if (lp1->l_ch != '.')
					break;
				flag = FALSE;
			}
			++lp1;
		}
		if (lp1 == rlp) {               /* Ate it all.          */
			lp1 = llp;
			while (lp1 != rlp) {
#ifdef LS1DEBUG
			printf("ate it all spell\n");
#endif

				spell(lp1, lp1+1);
				++lp1;
				if (lp1 != rlp) {
					++lp1;
				}
				if (lp1 != rlp)
					sendphone(WBOUND);
			}
			if (flag != FALSE       /* Last a letter.       */
			&& (lflag&RSTRIP) == 0  /* and no right strip   */
			&& isdot() != FALSE)    /* and sitting on "."   */
				readitem();     /* eat up the ".".      */
			goto out;
		}
	}
#endif
	/*
	 * We are getting ready to feed this
	 * thing to the default processing rules. The
	 * first step is to fold out case distinctions and
	 * diacritical marks. We used to rescan the dictionary
	 * if anything changed; we don't do it anymore because
	 * the dictionary lookup was made more clever, and
	 * understands case distinctions.
	 */

	is_name(llp,rlp);

	lp1 = llp;
	while (lp1 != rlp) {
		/* GL 12/06/96, use ls_lower[] to map to lower case. keep all the
		   character above 0x7f here.  We will fold these characters to
		   closest 7 bits equivlence in ls4.c
		 */
		lp1->l_ch = ls_fold[lp1->l_ch];  
/*
		if ((c=lscrush[lp1->l_ch]) != NOMAP)
			lp1->l_ch = c;
*/
		++lp1;
	}
#ifndef CALLER_ID
	/*
	 * Watch for "Dr." and "St.". Look ahead to
	 * determine the correct pronounciation, then move
	 * the lookahead into the working word. The two line
	 * "if" at the start implements rules similar in spirit
	 * to the code in the first dictionary scan, that has
	 * do decide if this is an abbreviation context.
	 */

	if ((llp+3==rlp && (llp+2)->l_ch=='.')
	||  (llp+2==rlp && (lflag&RSTRIP)==0 && isdot()!=FALSE)) {
		c1 = (llp+0)->l_ch;
		c2 = (llp+1)->l_ch;
		if ((c1=='s' && c2=='t') || (c1=='d' && c2=='r')) {
			if (llp+2 == rlp)       /* Gobble up the "."    */
				readitem();     /* after abbreviation.  */
			lookahead();
			if (iswhite(&citem) != FALSE) {
				readword(&nword[0]);
				if ((lsctype[nword[0].l_ch]&UU) != 0)
					sendlist(c1=='s' ? psaint : pdoctor);
				else
					sendlist(c1=='s' ? pstreet : pdrive);

				sendphone(rbphone);
				copyword(&cword[0], &nword[0]);

				goto loop;
			}
			sendlist(c1=='s' ? pstreet : pdrive);

			goto out;
		}
	}

#endif

#ifdef CALLER_ID

	lp1  = llp;
	
	if (lp1->l_ch == '.'                    /* As in ".5".          */
	||  lp1->l_ch == 0xBC                   /* 1/4                  */
	||  lp1->l_ch == 0xBD                   /* 1/2                  */
	||  digit != FALSE)
		lp2 = parsenumber(lp1, rlp, &num);

		/*telephone numbers*/
		if(lp2->l_ch=='-')
		{

			sendphone(COMMA);
	/* call out the number as single digits*/
		
				while (lp1 != rlp)
				{
					if(lp1->l_ch != '-')
						donumber(lp1, lp1+1, FALSE);
					else
						sendphone(COMMA);

					lp1++;
				}
				lp1=llp;
				
			
			goto out;
		}

#else 
	/*
	 * This is the top of number processing. The first
	 * step is to decide how "." and "," will be interpreted.
	 * This is controlled by a mode flag (MODE_EUROPE) if
	 * the unit is running at level 2. Then pull off any signs,
	 * and revert to spelling if this makes the whole word
	 * go away.
	 */
/*      fc_struct[fc_index] = FC_ADJ;xxx marks more than numbers here*/

	/*eab 8/94 numbers form class needs to be marked*/
	fchar = '.';                            /* Pick the right one.  */
	schar = ',';
  /*    if ((KS.modeflag&MODE_EUROPE)!=0) {
		fchar = ',';
		schar = '.';
	}*/
	sign = 0;
	lp1  = llp;
	if (lp1->l_ch == '-'                    /* Signs.               */
	||  lp1->l_ch == '+'
	||  lp1->l_ch == 0xA7                   /* Section mark.        */
	||  lp1->l_ch == 0xB1                   /* Plus-minus.          */
	||  lp1->l_ch == 0xB6)          /* Item.                */
		{               
		sign = lp1->l_ch;
		++lp1;
#ifdef LS1DEBUG
		printf("num processing sign found\n");
#endif
		if (lp1 == rlp)
			{
#ifdef LS1DEBUG
			printf(" spell from num processing\n");
#endif
			goto gok;
			}
		}

	/*
	 * If the first character in the remaining string
	 * is a currency symbol (both the USA/Canada and the
	 * United Kingdom versions are accepted) this is a signal
	 * to begin running the money rules.
	 */

	if (lp1->l_ch=='$' || lp1->l_ch==0xA3) {
		type = lp1->l_ch;
		if (++lp1 == rlp)               /* Lone currency mark.  */
			{
#ifdef LS1DEBUG
			printf("currency mark spell \n");
#endif

			goto gok;
			}
		if (lp1->l_ch == '-'            /* Signs.               */
		||  lp1->l_ch == '+'
		||  lp1->l_ch == 0xB1) {        /* Plus-minus.          */

			if (sign != 0)
				{
#ifdef LS1DEBUG
			printf("sign spell \n");
#endif

				goto gok;
				}

			sign = lp1->l_ch;
			if (++lp1 == rlp)       /* "$+"                 */
				{
#ifdef LS1DEBUG
			printf(" spell from num sign proc \n");
#endif

				goto gok;
				}
		}

		lp2 = parsenumber(lp1, rlp, &num);
		if (num.n_elp!=NULL || lp2!=rlp)
			{
#ifdef LS1DEBUG
			printf("parsenumber spell \n");
#endif

			goto gok;
			}

		/*
		 * You need to look ahead to see if the
		 * next word is one of the special words like
		 * "million" that alters where the word "dollar" or
		 * or "pound" is spoken.
		 */

		flag = FALSE;                   /* No lookahead.        */
		lookahead();
		if (iswhite(&citem) != FALSE) {
			flag = TRUE;            /* Did lookahead.       */
			readword(&nword[0]); /* mfgdebug was  sreadword  */
			cp = wlookup(&nword[0], &nwdtab[0]);
			if (cp != FALSE) {
				dosign(sign);
				pflag=donumber(lp1, rlp, FALSE);
				sendphone(rbphone);
				sendlist(cp);
				lp1 = &nword[0];
				while (lp1->l_ch != EOS)
					++lp1;

				sendlist(type=='$' ? pdollar : ppound);
				sendphone(Z);
				goto out;
			}
		}

		/*
		 * $3      Three dollars.
		 * $3.00   Three dollars.
		 * $3.24   Three dollars and twenty four cents.
		 * $3.240  Three point two four zero dollars.
		 */

		dosign(sign);

		if (num.n_flp==NULL || (num.n_frp-num.n_flp)==3) {
			if (num.n_ilp != NULL) {

				pflag = donumber(num.n_ilp, num.n_irp, FALSE);

				sendlist(type=='$' ? pdollar : ppound);

				if (pflag != FALSE)
					sendphone(Z);
				if (num.n_flp == NULL) {
					if (flag == FALSE)
						goto out;
					sendphone(rbphone);

					copyword(&cword[0], &nword[0]);

					goto loop;
				}
			if ((num.n_flp+1)->l_ch == '0'
				&&  (num.n_flp+2)->l_ch == '0') {

					if (flag == FALSE)
						goto out;
					sendphone(rbphone);

					copyword(&cword[0], &nword[0]);
					goto loop;
				}
				sendlist(pand);
			}
			lp2 = num.n_flp + 1;    /* Just after the "."   */
			if (lp2->l_ch == '0')
				++lp2;

			pflag = donumber(lp2, num.n_frp, FALSE);
			sendphone(WBOUND);
			if (type == '$') {
				sendlist(pcent);
				if (pflag != FALSE)
					sendphone(S);
			} else
				sendlist(ppence);
			if (flag != FALSE) {
				sendphone(rbphone);

				copyword(&cword[0], &nword[0]);
				goto loop;
			}
			goto out;
		}
		pflag = donumber(lp1, rlp, FALSE);
		sendlist(type=='$' ? pdollar : ppound);
		if (pflag != FALSE)
			sendphone(Z);
		if (flag != FALSE) {
			sendphone(rbphone);

			copyword(&cword[0], &nword[0]);
			goto loop;
		}
		goto out;
	}

	/*
	 * Dates and times are handled by special
	 * validation and speaking routines. Times are a little
	 * bit special, because of "AM" and "PM" processing.
	 * Fractions are special too, but less special then a
	 * date or a time, because signs are legal.
	 */

	if (sign == 0) {
		if (isdate(llp, rlp) != FALSE) {
			dodate(llp, rlp);
			goto out;
		}
		if (istime(llp, rlp) != FALSE) {
			dotime(llp, rlp);
			lookahead();
			if (iswhite(&citem) == FALSE)
				goto out;
			sendphone(rbphone);

			readword(&nword[0]);

			lp1 = &nword[0];
			while (lp1->l_ch != EOS)
				++lp1;
			if (isampm(&nword[0], lp1) != FALSE)
				{
#ifdef LS1DEBUG
			printf("isampm spell\n");
#endif

				spell(&nword[0], lp1);
				dorpunct(MISS);
				readword(&cword[0]);

				goto loop;
			}
			copyword(&cword[0], &nword[0]);
			goto loop;
		}
	}
	if (isfrac(lp1, rlp) != FALSE) {
		dosign(sign);

		dofrac(lp1, rlp);
		goto out;
	}

	/*
	 * Plain numbers. Just digits, digits followed
	 * by the "%" symbol and the "cent" sign at (10,2) in
	 * the Multinational set, and ordinal numbers with
	 * "st", "nd", "rd", and "th" on the end. There is special
	 * stuff to deal with years (1984 is best spoken as
	 * 19 84) and abbreviations like "ft." that have two
	 * different pronounciations, based on the value of the
	 * number in front of it.
	 *
	 * Number processing is a little less sophisticated
	 * on the Kurzweil. Any integer that is greater than 4
	 * digits (9999) is spelled. The rationale is that large
	 * numbers are rare, and stuff like zip codes is
	 * common. I'll accept their judgement on this one.
	 */
	 /* Kurz. now wants it to be symetrical with negative numbers
	 EAB-4-11-89*/
	
	if (lp1->l_ch == '.'                    /* As in ".5".          */
	||  lp1->l_ch == 0xBC                   /* 1/4                  */
	||  lp1->l_ch == 0xBD                   /* 1/2                  */
	||  digit != FALSE)
		{
		lp2 = parsenumber(lp1, rlp, &num);
		if (lp2 == rlp)
			{               /* All digits.          */
	//fc_struct[fc_index] = FC_ADJ;

	/*eab 8/94 numbers form class needs to be marked xxx*/


			if (sign==0 && isyear(llp, rlp)!=FALSE)
				{
				do4digits(llp);
				pflag = TRUE;   /* 1984 is plural.      */
				}
			else
				{
				dosign(sign);

				pflag = donumber(lp1, rlp, FALSE);
				}
			lookahead();            /* Watch for "ft."      */

			if (iswhite(&citem) == FALSE)
				{
				goto out;       /* Not a chance!        */
				}
			sendphone(rbphone);

			readword(&nword[0]);    /* Read next word.      */

			lp1 = &nword[0];
			while (lp1->l_ch != EOS)
				++lp1;
			if (isampm(&nword[0], lp1) != FALSE) {
#ifdef LS1DEBUG
			printf("iasmpm spell\n");
#endif

				spell(&nword[0], lp1);
				dorpunct(MISS);
				readword(&cword[0]);

				goto loop;
			}
			if (isdot() == FALSE    /* Check if special.    */
			|| (cp=wlookup (&nword[0], &nabtab[0]) ) == NULL)
				{
				copyword(&cword[0], &nword[0]);
				goto loop;
				}
				isnumabr=2;

			if (pflag != FALSE) {   /* Pick right form.     */
				while (*cp++ != SIL)
					;
			}
			sendlist(cp);           /* Send abbreviation.   */

			readitem();             /* Eat up the ".".      */
			dorpunct(MISS);
			readword(&cword[0]);    /* Advance, continue.   */

			goto loop;
		}
/*added to do telephone numbers mfg 06/05/02*/
		
		if(lp2->l_ch=='-')
		{

			sendphone(COMMA);
	/* call out the number as single digits*/
			
				while (lp1 != rlp)
				{
					if(lp1->l_ch != '-')
						donumber(lp1, lp1+1, FALSE);
					else
						sendphone(COMMA);

					lp1++;
				}
				lp1=llp;
				
			
			goto out;
		}

		/*
		 * Deal with plural numbers, like
		 * "60s" and "60's". The last phoneme of
		 * the number is hidden in "lphone", which is
		 * looked at by the standard pluralizing
		 * code in "ls7.c". Also deal with cents,
		 * percents, and degrees.
		 */

		else if (lp2+2 == rlp) {             /* 2 after the digits.  */
			/* Plurals, like "60's".                        */
			if (lp2->l_ch=='\'' && (lp2+1)->l_ch=='s') {
				dosign(sign);

				pflag=donumber(lp1, lp2, FALSE);
				pluralize();
				goto out;
			}
			/* Ordinals, like "1st", "2nd", "3rd".          */
			if (sign==0 && isordinal(&num)!=FALSE) {
				pflag=donumber(llp, lp2, TRUE);
				goto out;
			}
		} else if (lp2+1 == rlp) {      /* 1 after the digits.  */
			/* Plurals, like "60s".                         */
			if ((c=lp2->l_ch) == 's') {
				dosign(sign);
				pflag=donumber(lp1, lp2, FALSE);
				pluralize();
				goto out;
			}
			/* "10%", "10 cents", "10 degrees".             */
			if (c=='%' || c==0xA2 || c==0xB0) {
				dosign(sign);
				pflag = donumber(lp1, lp2, FALSE);
				if (c == '%')
					sendlist(ppercent);
				else {
					sendphone(WBOUND);
					if (c == 0xA2) {
						sendlist(pcent);        
						if (pflag != FALSE)
							sendphone(S);
					} else {
						sendlist(pdegree);
						if (pflag != FALSE)
							sendphone(Z);
					}
				}
				goto out;
			}
		}
	}
#endif
/* #ifndef CALLER_ID this code is not working properly mfg 06/19/02 */
#ifdef FULL_LTS
	/*
	 * Well, all of the fancy heuristics have
	 * failed. Either this is just an ordinary word, or it
	 * is garbage. This first scan looks for things that might
	 * actually be part numbers, and runs the standard part
	 * number rules.
	 */

	lp1 = llp;
	while (lp1 != rlp) {
		c = lp1->l_ch;
		if (c=='/' || (c>='0' && c<='9'))
			{
			lflag |= DIGSLSH;
			}
		else if (c == '\'')
			{
			lflag |= SQUOTE;
			}
		/* GL 11/06/1996, use IS_ALPHA(c) to check for alphabet */
		else if (/*(c!=',') && */(c!='-') && !(IS_ALPHA(c)))
		/* else if (c!='-' && (c<'a' || c>'z')) */
			{
#ifdef LS1DEBUG
			printf(" drop through spell %c  \n",c);
#endif

			goto gok;
			}
		++lp1;
	}
	if ((lflag&DIGSLSH) != 0) {             /* Parts have digits or */
//		if ((lflag&SQUOTE) != 0)        /* slashes, and do not  */
//			{
#ifdef LS1DEBUG
			printf(" punt spell \n");
#endif

//			goto gok;               /* have quotes.         */
//			}
		dopartnumber(llp, rlp);
		goto out;
	}
#endif
	/*
	 * The second scan checks that each
	 * chunk of of the word (which may be the whole word,
	 * or a bit of a compound word) contains a vowel, and a
	 * consonant except for some special cases. If you get
	 * to the end without a fail, run the thing through
	 * the letter to sound rules.
	 */

/* #ifndef CALLER_ID this code is not working properly mfg 06/19/02 */
#if FULL_LTS
	lp1 = llp;
   firsttim=1;

	while (lp1 != rlp) {
tryagn:         lp2 = lp1;
		lflag &= ~(HNONY|HCONS|HVOWEL);
		while (lp1!=rlp && (c=lp1->l_ch)!='-') {
			type = lsctype[c];
			if ((type&C) != 0)
				lflag |= HNONY|HCONS;
			else if ((type&O) != 0)
				lflag |= HNONY|HVOWEL;
			else if (c == 'y') {
				if (lp1 == lp2)
					lflag |= HCONS;
				else
					lflag |= HVOWEL;
			}
			++lp1;
		}
                                                              
			tlflag=lflag;
#ifdef LS1DEBUG


#endif


/*              if (TRUE)
			{                                                               */
#ifdef LS1DEBUG
			printf("b2a %c %c %d\n",lp2->l_ch,lp1->l_ch, lp1->l_ch);

			printf("looking \n");

#endif
                        ttlp1=lp1;

                        /* this statement set the ttlp1 to wrong spot */
                        /*
			if(lp1->l_ch == '-')
				ttlp1--;
                        */

			if (lookup(lp2, ttlp1, FIRST) != MISS)
				{
#ifdef LS1DEBUG

				printf("got a hit");
#endif
				if(firsttim == 1)
					{
					lp1++;
#ifdef LS1DEBUG
printf("sending hypen");
#endif
					sendphone( HYPHEN );
					lp2=lp1;
					lp2=lp1;
					llp=lp1;
					firsttim=0;
					goto tryagn;
					}
				lp2=lp1;
				llp=lp1;
				
				}


			else if( (tlflag&HVOWEL) != 0 )
				{
#ifdef LS1DEBUG

				printf("doing lts1 ");
#endif
				do_lts(lp2, lp1);
finish:                         if (lp1 != rlp)
					{               /* Inter-chunk gap.     */
					lp2 = lp1;
					while (lp2!=rlp && lp1->l_ch=='-')
						++lp1;
					llp=lp1;
					sendphone(lp2+1==lp1 ? HYPHEN : COMMA);
					}
				else
					{
					llp=lp1;
					}

				}

		 /*     }*/

		firsttim=0;
		if ((lflag&HNONY) == 0)         /* Spell if all "y".    */
			{
#ifdef LS1DEBUG
			printf(" spell all y \n");
#endif

			goto gok;
			}


		if ((lflag&HVOWEL) == 0)        /* Spell if no vowels.  */
			{
#ifdef LS1DEBUG
			printf("spell no vowel  \n");
#endif


			goto gok;
			}
		if ((lflag&HCONS) == 0)
			{       /* If no consonant, the */
			if (lp2+1 != lp1)
				{
#ifdef LS1DEBUG
			printf(" spell no cons. \n");
#endif

				goto gok;       /* are legal.*/         
				}
			/* words "a", "i", "o"  */

/*                      if (lp2->l_ch!='a' && lp2->l_ch!='i' && lp2->l_ch!='o' && lp2->l_ch!='u')
				{
#ifdef LS1DEBUG
			printf("spell a i o \n");
#endif

				goto gok;
				}out---          eab can't see the need*/
			}
		if (lp1 != rlp) {               /* Hit "-", allow long  */
			lflag |= HHYPHEN;       /* blocks of "---".     */
			while (lp1!=rlp && lp1->l_ch=='-')
				++lp1;
		}
	}
#endif

	lp1 = llp;
	while (lp1 != rlp) {
		lp2 = lp1;
		while (lp1!=rlp && lp1->l_ch!='-')
			lp1+=1;
#ifdef CALLER_ID
		if (lookup(lp2, lp1, FIRST) == MISS)
#else
		if ((lflag&HHYPHEN) == 0 || lookup(lp2, lp1, FIRST) == MISS)
#endif
			{
			do_lts(lp2, lp1);
			}
		if (lp1 != rlp) {               /* Inter-chunk gap.     */
			lp2 = lp1;
			while (lp2!=rlp && lp1->l_ch=='-')
				++lp1;
			sendphone(lp2+1==lp1 ? HYPHEN : COMMA);
		}
	}
	goto out;

	/*
	 * A "goto gok" gets things spelled.
	 * A "goto out" means the word was handled. Process
	 * any right hand punctuation that stripped and
	 * loop around for another word. 
	 */

gok:
#ifdef LS1DEBUG
			printf(" gok spell\n");
#endif
#ifndef CALLER_ID
	speed = SLOW;/* always fast now spellspeed(llp, rlp);*/
	spell(llp, rlp);
	if (speed!=FAST && rlp!=llp+1 && rbphone==WBOUND)
		rbphone = COMMA;
#endif
out:
	 
	if (rbphone!=WBOUND && iswhite(&citem)!=FALSE) {
		sendphone(rbphone);
		while (iswhite(&citem) != FALSE) {
			readitem();
#ifndef NO_INDEXES
			while (isindex(&citem) != FALSE) {
				writeitem();
				readitem();
			}
#endif
		}
	}


	dorpunct(MISS);
	readword(&cword[0]);


	goto loop;

outlstask:;

}


/*
 * Return TRUE if the character in the
 * current item is an ASCII ".". Return FALSE if it
 * is anything else. This is used in  few places to decide
 * if we are in an abbreviation context.
 */
isdot()
{
	if (citem.i_word[0] == ((PFASCII<<PSFONT)|'.'))
		{
		return (TRUE);
		}
	return (FALSE);
}

#ifdef CALLER_ID
/*code for callid only to process telephone numbers*/
LETTER  *parsenumber(LETTER *llp, LETTER *rlp, NUM *np)
{
	  LETTER        *tlp1;

	np->n_ilp = NULL;                       /* Null scan.           */
	np->n_flp = NULL;
	np->n_elp = NULL;
	tlp1 = llp;
	if (tlp1 != rlp
	&& (tlp1->l_ch == 0xBC                  /* 1/4                  */
	||  tlp1->l_ch == 0xBD                  /* 1/2                  */
	||  digit(tlp1) != FALSE)) {
		np->n_ilp = tlp1;

		while (tlp1 != rlp) {
			/* 1/2 and 1/4.                                 */


			if (digit(tlp1) != FALSE) {
				++tlp1;
				continue;
			}
			break;
		}
	out:
		np->n_irp = tlp1;
	}
	return (tlp1);
}
#else
/*
 * Scan a number. The "llp" is where
 * you start. The "rlp" is as far as you can go.
 * The "np" points to a NUM structure that gets filled
 * in. Return the right hand end of the scanned off
 * characters. This routine understands about the two
 * multinational characters "1/2" and "1/4". They are
 * part of the integer part of the number, and
 * block the scanning of additional stuff.
 */
LETTER  *parsenumber(LETTER *llp, LETTER *rlp, NUM *np)
/*LETTER          *llp;*/
/*LETTER          *rlp;*/
/*  NUM   *np;*/
{
	  LETTER        *tlp1;
	  LETTER        *tlp2;
	  int   ncbs;

	np->n_ilp = NULL;                       /* Null scan.           */
	np->n_flp = NULL;
	np->n_elp = NULL;
	tlp1 = llp;
	if (tlp1 != rlp
	&& (tlp1->l_ch == 0xBC                  /* 1/4                  */
	||  tlp1->l_ch == 0xBD                  /* 1/2                  */
	||  digit(tlp1) != FALSE)) {
		np->n_ilp = tlp1;
		while (tlp1 != rlp) {
			/* 1/2 and 1/4.                                 */
			if (tlp1->l_ch==0xBC || tlp1->l_ch==0xBD) {
				++tlp1;
				np->n_irp = tlp1;
				return (tlp1);
			}
			/* Comma (period if this is MODE_EUROPE).       */
			if (tlp1->l_ch == schar) {
				tlp2 = tlp1;
				ncbs = 3;
				while (ncbs-- && tlp2!=llp) {
					--tlp2;
					if (tlp2->l_ch == schar)
						goto out;
				}
				if (tlp2!=llp && (tlp2-1)->l_ch!=schar)
					goto out;
				tlp2 = tlp1+1;
				ncbs = 3;
				while (ncbs--) {
					if (tlp2==rlp || digit(tlp2)==FALSE)
						goto out;
					++tlp2;
				}
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

				if (tlp2!=rlp && digit(tlp2)!=FALSE)
					goto out;
				++tlp1;
				continue;
			}
			

			if (digit(tlp1) != FALSE) {
				++tlp1;
				continue;
			}
			break;
		}
	out:
		np->n_irp = tlp1;
	}
	if (tlp1!=rlp && tlp1->l_ch==fchar) {   /* Fraction             */
		np->n_flp = tlp1;
		++tlp1;
		while (tlp1!=rlp && digit(tlp1)!=FALSE)
			++tlp1;
		np->n_frp = tlp1;
	}
	if (tlp1!=rlp && tlp1->l_ch=='e' && (KS.modeflag & MODE_MATH)) {        /* Exponant.            */
		tlp2 = tlp1;
		++tlp1;
		if (tlp1!=rlp && tlp1->l_ch=='+' || tlp1->l_ch=='-')
			++tlp1;
		if (tlp1!=rlp && digit(tlp1)!=FALSE) {
			np->n_elp = tlp2;
			++tlp1;
			while (tlp1!=rlp && digit(tlp1)!=FALSE)
				++tlp1;
			np->n_erp = tlp1;
		}
	}
	return (tlp1);
}
#endif
#ifndef CALLER_ID
/*
 * Check if a number looks like an
 * ordinal. The caller has already checked that
 * there is no sign, and that there are exactly 2 characters
 * after the characters scanned off by "parsenumber".
 * Return TRUE if all looks good. The details for speaking
 * ordinals is all in "donumber". The number has all been
 * zapped to lower case, so you can look at the extra
 * bytes in a case insensitive fashion.
 */
isordinal(np)
  NUM   *np;
{
	  LETTER        *lp;
	  int   ud;

	if (np->n_ilp==NULL || np->n_flp!=NULL || np->n_elp!=NULL)
		return (FALSE);
	lp = np->n_irp;                         /* Just past right.     */
	ud = (lp-1)->l_ch;                      /* Unit digit.          */
	if (ud==0xBC || ud==0xBD)               /* Things like "1 1/2". */
		return (FALSE);
	if (lp>np->n_ilp+1 && (lp-2)->l_ch=='1')
		ud = '0';
	switch (ud) {
	case '1':                               /* "st"                 */
		if (lp->l_ch=='s' && (lp+1)->l_ch=='t')
			return (TRUE);
		break;

	case '2':                               /* "nd"                 */
		if (lp->l_ch=='n' && (lp+1)->l_ch=='d')
			return (TRUE);
		break;

	case '3':                               /* "rd"                 */
		if (lp->l_ch=='r' && (lp+1)->l_ch=='d')
			return (TRUE);
		break;

	default:                                /* "th"                 */
		if (lp->l_ch=='t' && (lp+1)->l_ch=='h')
			return (TRUE);
		break;
	}
	return (FALSE);
}
#endif
#ifndef CALLER_ID
/*
 * The "word" is just an array of
 * LETTER structures, containing a word which
 * might just be special. Look it up in a table, and
 * return either the phoneme string, or NULL, which
 * indicates "no match". Case insensitive. Each
 * table entry consists of a size, a text string
 * with an EOS on the end, and a bunch of bytes
 * that are usually phonemes.
 */
char    *wlookup(LETTER word[], char table[])
/*LETTER  word[];*/
/*char    table[];*/
{
	  LETTER        *lp;
	  char  *cp;
	  int   c;      
	  char  *tp;
	  int   len;

	tp = &table[0];                         /* Start at the start.  */
	while ((len = *tp++) != 0) {            /* 0 => end of table.   */
		lp = &word[0];
		cp = tp;                        /* Start of text.       */
		for (;;) {
			/* GL 11/06/1996, use ls_lower[] to map to lower case */
			c = ls_lower[lp->l_ch];           /* Fold case.           */
/*
			if (c>='A' && c<='Z')
				c += 'a'-'A';
*/
			if (c != *cp++)         /* Lose.                */
				break;
			if (c == EOS)           /* Win.                 */
			{
#ifdef FULL_LTS
                                /* set form class for "to" */
                                if (ls_lower[(&word[0])->l_ch] == 't') fc_struct[fc_index] = FC_TO | FC_PREP | FC_FUNC;
                                /* set form class for "and" */
                                if (ls_lower[(&word[0])->l_ch] == 'a') fc_struct[fc_index] = FC_CONJ | FC_VERB | FC_FUNC;
                                /* set form class for "for" */
                                if (ls_lower[(&word[0])->l_ch] == 'f') fc_struct[fc_index] = FC_ADV | FC_PREP | FC_NEG;
#endif

				return (cp);    /* Return phonemes.     */
			}
			++lp;
		}
		tp += len;                      /* Next.                */
	}
	return (NULL);
}
#endif
#ifndef CALLER_ID
/*
 * Check to see if the digit group
 * enclosed by "llp" and "rlp" looks enough
 * like a year to be spoken by "do4digits". Years
 * are 4 characters long, all digits. The first character
 * must not be a zero ("0100" isn't a year). The middle two
 * digits must not both be zero ("2000" is best read as a
 * number, and "2002" sounds stupid as "twenty zero two").
 * Return TRUE or FALSE.
 */
int isyear(LETTER *llp, LETTER *rlp)
/*LETTER  *llp;*/
/*LETTER  *rlp;*/
{
	  LETTER        *tlp1;
	  int   ndig;

	ndig = 0;                               /* Count digits, check. */
	tlp1 = llp;                             /* for all digits.      */
	while (tlp1 != rlp) {
		if (digit(tlp1) == FALSE)
			return (FALSE);
		++ndig;
		++tlp1;
	}
	if (ndig != 4)                          /* Must be 4 digits.    */
		return (FALSE);
	if (llp->l_ch == '0')                   /* No initial "0", no   */
		return (FALSE);                 /* imbedded "00" pair.  */
	if ((llp+1)->l_ch=='0' && (llp+2)->l_ch=='0')
		return (FALSE);
	return (TRUE);
}
#endif
/*
 * Advance the current item, in anticipation 
 * of a lookahead. The only tricky stuff has to do with
 * index marks, which have to be appended to the current
 * word. The index nodes are linked together via the
 * "p_ip" field. The current word must not be empty
 * or this routine will die a horrible death.
 */
void lookahead()
{
	  LETTER        *elp;
//	  PHONE *pp1;
//	  PHONE *pp2;
#ifndef NO_INDEXES
	if (isindex(&citem) == FALSE)           /* Duck if no index     */
		return;
#endif
	elp = &cword[0];                        /* Find end of word,    */
	while ((elp+1)->l_ch != EOS)
		++elp;
#if 0
/*      do {
		pp1 = palloc();                 /* Append index PHONE   
		if (pp1 != NULL) {
			pp1->p_itype = citem.i_word[0];
			pp1->p_value = citem.i_word[1];
			pp1->p_iret = citem.i_word[2];
			pp2 = elp->l_ip;
			if (pp2 == NULL)
				elp->l_ip = pp1;
			else {
				while (pp2->p_ip != NULL)
					pp2 = pp2->p_ip;
				pp2->p_ip = pp1;
			}
			pp1->p_ip = NULL;
		}
		readitem();
	} while (isindex(&citem) != FALSE);*/
#endif
}

#ifndef CALLER_ID
/*
 * This routine copies a word,
 * starting at the beginning and ending at the
 * EOS at the end of the word. It is used when lookahead
 * has required that the next word in the input stream be
 * considered, before a decision can be made on how
 * a chunk of text is spoken.
 */
void copyword(LETTER *tlp, LETTER *flp)
  /*LETTER        *tlp;*/
  /*LETTER        *flp;*/
{
	while (flp->l_ch != EOS) {
		tlp->l_ch = flp->l_ch;

		++tlp;
		++flp;
	}
	tlp->l_ch = EOS;
}
#endif
#ifdef CALLER_ID
/*
 * Spell a word. The "lp1" and
 * "lp2" pointers enclose the word in the
 * standard way. The dictionary entries for the
 * letters are of the form " a". Handcraft the block
 * in an array of LETTER, and hand it to the common
 * lookup code. The "-" is special because of the
 * MODE_MATH stuff.
 */
void spell(LETTER *lp1, LETTER *lp2)
{
//	int i;
//	i=2;

}

#else

void spell(LETTER *lp1, LETTER *lp2)
  /*LETTER        *lp1;*/
  /*LETTER        *lp2;*/
	{
	LETTER  lbuf[2];
	unsigned char _far *tp;
	unsigned int phone;

#ifndef FULL_LTS

			lbuf[0].l_ch = (lp1->l_ch);
			lbuf[1].l_ch = (lp1+1)->l_ch;



		if (lbuf[0].l_ch>='a' && lbuf[0].l_ch<='z')
				{
				sendlist(pspell[((lbuf[0].l_ch)-'a')]);
				sendphone(SIL);
				}

		else if(lbuf[0].l_ch>='A' && lbuf[0].l_ch<='Z')
				{
				sendlist(pspell[(((lbuf[0].l_ch)+('a'-'A'))-'a')]);
				sendphone(SIL);
				}

		/*say am and pm corectly*/
		if((lbuf[1].l_ch == 'm') ||(lbuf[1].l_ch == 'M') )
			{
				sendphone(EH);
				sendphone(M);
				sendphone(S1);
				sendphone(SIL);
			}

	/*put in to say 2:08 coreectly*/
		
		if (lbuf[0].l_ch>='0' && lbuf[0].l_ch<='9')
				{
				sendlist(punits[(lbuf[0].l_ch-'0')]);
				sendphone(SIL);
				}

		if (lbuf[1].l_ch>='0' && lbuf[1].l_ch<='9')
				{
				sendlist(punits[(lbuf[1].l_ch-'0')]);
				sendphone(SIL);
				}



		return;
#endif

	while (lp1 < lp2)
		{
/*               eab kludge becuase at this level we don't presently know
			what punc is on so dash will normally not be spelled except
			if it occurs in the enviroment space-dash-space in which
			case it comes from gok: with dashnfast on
			where it should be pronounced   
			if(lp1->l_ch == '-' )
				{
			lp1->l_ch=' ';
				}                         eab-out-now handled in cmd_pars*/
							
#ifdef MATH_MODE
		if(do_math((unsigned char)lp1->l_ch) == false)
#endif
		{

			lbuf[0].l_ch = lp1->l_ch;
								
			/*
			 * All upper case letters are mapped to
			 * lower case. This makes it unnecessary to have
			 * the letters in the dictionary twice. The funny
			 * letters in the multinational set are in the
			 * dictionary twice, because it (effectively) puts
			 * a case folding table into the dictionary.
			 */
			/* GL 11/06/1996, us ls_lower[] to map to lower case */
			lbuf[0].l_ch = ls_lower[lbuf[0].l_ch];
/*
			if (lbuf[0].l_ch>='A' && lbuf[0].l_ch<='Z')
				lbuf[0].l_ch += 0x20;
*/

			if(lbuf[0].l_ch == 'a')
				{
				sendphone(S1);
				sendphone(EY);
				}
			else
				{
				if (lbuf[0].l_ch>='0' && lbuf[0].l_ch<='9')
					{
					sendlist(punits[(lbuf[0].l_ch-'0')]);
					sendphone(SIL);
					}
				else
					{

#ifdef FULL_LTS
					for(tp = (unsigned char _far *)KS.typing_table[lbuf[0].l_ch];*tp;tp++)
						{
						phone = KS.reverse_ascky[*tp]&0x00ff;
						sendphone(phone);
						}
#endif
				 /*     if (blook(&lbuf[0], &lbuf[1], SINGLE_CHAR) == MISS)
						sendphone(EY);*/
					}
				}
			}
		++lp1;
		if (lp1 != lp2)
			{
			sendphone(WBOUND);
			}
		}
	}
	
#endif
#ifndef CALLER_ID
/*
 * Determine spelling speed.
 * One letter words are always spelled quickly, for
 * compatability with DECtalk I (I almost missed this before
 * the 23 class release). Things 2 or 3 letters long that are
 * all alphabetic are spelled fast (CBS). Things 2, 3, or 4
 * long that are all alphabetic except for 1 "&" character
 * are spelled fast (AT&T, FA&T, R&B). The rest are done
 * slowly.
 */
int spellspeed(LETTER *llp, LETTER *rlp)
  /*LETTER        *llp;*/
  /*LETTER        *rlp;*/
{
	  int   c;
	  int   nchar;
	  int   namper;

	if (llp+1 == rlp)                       /* 1 letter words are   */
		return (FAST);                  /* always fast.         */
	nchar  = 0;
	namper = 0;
	while (llp != rlp) 
	{
		c = (llp++)->l_ch;
		++nchar;
		if (c == '&')                   /* Count "&"            */
			++namper;
		else {
			/* GL 11/06/1996, use ls_lower[] to map to lower case */
			/* also use IS_ALPHA(c) to check for alphabet */
            c = ls_lower[c];
            if (!IS_ALPHA(c))
            	return(SLOW);
#if 0
			if (c>='A' && c<='Z')   /* Fold case.           */
				c += 'a'-'A';
			if (c<'a' || c>'z')     /* Slow if not alpha.   */
				return (SLOW);
#endif
		}
	}
	if (nchar < 4)                          /* Short word.          */
		return (FAST);
	if (nchar==4 && namper==1)              /* "FA&T"               */
		return (FAST);
	return (SLOW);
}
		
#endif
/*
 * After a word is spoken, this
 * routine is called to process its right
 * (delimiter) punctuation. A phoneme is usually
 * sent to the synthesizer. This routine is also
 * responsible for updating the "wstate" when
 * the end of a clause is reached. The "flag" tells
 * the state of the last dictionary search. The 
 * only interesting case is "ABBREV", because a
 * "." may be a clause terminator too.
 */
void dorpunct(int flag)
/* int flag */
{
	  int   c;
	short           buf[1];

	if ((citem.i_word[0]&PFONT) != (PFASCII<<PSFONT))
		return;
	c = citem.i_word[0] & PVALUE;
	if (flag==ABBREV && (c==CR || c==LF)) {
		sendphone(PERIOD);
//		wstate = UNK_WH;
#ifdef PRINT_OUTPUT
	 if(KS.logflag & LOG_FORM_TYPES)
		print_fc();
#endif
	 return;
	}
	switch (c) {
	case '.':
		sendphone(PERIOD);
#ifdef PRINT_OUTPUT
	if(KS.logflag & LOG_FORM_TYPES)
			print_fc();
#endif
		readitem();
//		wstate = UNK_WH;
		break;

	case '?':
#ifndef CALLER_ID
		if (wstate == IS_WH)            /* Ignore the "?" if at */
			{
#ifdef LS1DEBUG
			printf("Changing question mark to period! \n");
#endif
			sendphone(PERIOD);      /* the end of a "Wh..." */
			}
		else                            /* style sentence.      */
#endif 
		{
			sendphone(QUEST);
			}

#ifdef PRINT_OUTPUT
		if(KS.logflag & LOG_FORM_TYPES)
			print_fc();
#endif

		readitem();
//		wstate = UNK_WH;
		break;

	case '!':
		sendphone(EXCLAIM);

		readitem();
#ifdef PRINT_OUTPUT
		if(KS.logflag & LOG_FORM_TYPES)
			print_fc();
#endif		
		wstate = UNK_WH;
		break;

	case VT:                                /* Vertical tab, flush  */
		sendphone(SIL);
		buf[0] = BREATH_BREAK;
		ph_loop(buf);
		//write_pipe(kinp,&buf[0],1);
#ifdef PRINT_OUTPUT
		if(KS.logflag & LOG_FORM_TYPES)
			print_fc();
#endif
		readitem();
		break;

	case ',':
	case ':':
	case ';':
	case HT:                                /* Tab, longish pause   */

//		fc_index = 1;
//		fc_struct[0] = 0;
//		fc_struct[1] = 0;
		sendphone(COMMA);
		readitem();
		break;

	case ' ':                               /* ASCII SP             */
	case 0xA0:                              /* Multinational SP     */
	case LF:                                /* Linefeed             */
	case FF:                                /* Formfeed             */
	case CR:                                /* Carriage return.     */
		if ((KS.modeflag&MODE_SPELL)!=0)
			sendphone(COMMA);       /* Make longer pause if */
		else                            /* forced spelling.     */
			sendphone(WBOUND);
		readitem();
		break;
	}
}

/*
 * Send out a SIL terminated
 * list of phonemes in the USA phonemic
 * set. Just a loop that calls the general
 * "sendphone" routine.
 */
void sendlist(char *pp)
{
	  int   ph;

	while ((ph = *pp++) != SIL)
		sendphone(ph);
}

/*
 * Send a phoneme, which is always in the
 * USA font, to the synthesizer task via an interprocess
 * pipe. The phoneme is saved in the external variable "lphone".
 * Since this is used by everybody (except the dictionary code;
 * they are special) to put out phonemes, this arranges that
 * the last phoneme put out by anyone is in the external
 * for future examination.
 */
void sendphone(short ph)
{

	short   buf[1];
	lphone = ph;
	if ((ph&0xFF00)==0)
	{
		buf[0] = (PFUSA<<PSFONT) + ph;
	}
	else
	{
		buf[0]=ph;
	}
#if defined PRINT_OUTPUT || defined SIMULATOR
	printf("lts output 0x%04X %d\n",buf[0],ph);
#endif
	ph_loop(buf);

}

/*
 * Read in a word. Store the letters, and the
 * associated index marks, into the array of LETTER
 * nodes passed as an argument. Any index marks found
 * during the read are packed into PHONE nodes and
 * attached to the LETTER nodes. This may not be very
 * easy to understand if you don't have the big
 * state machine flow in the DECtalk III notebook.
 */
//#ifdef CALLER_ID1
#ifndef FULL_LTS
readword(word)
  LETTER        word[];
{
	  LETTER        *lp1;
	  LETTER        *lp2;
#ifndef CALLER_ID
	  int   ksf=0;
	  int   t;
	  PHONE *pp1;
	  PHONE *pp2;
#endif
	  int   c;
/*
 *  start with no flags for this word ...
 */
//restart:

	while (iswhite(&citem) != FALSE) {      /* Skip spaces.         */
		readitem();
	}
	lp1 = &word[0];                         /* Current location     */
	lp2 = &word[0];                         /* Rightmost location   */
//	ksf = FALSE;                                    /* Nothing kept         */

loop:

	if(checkloop == false)
		return 0;

/*      if(KS.halting)
		{
		if(citem.i_word[0] == SYNC)
			{
			writeitem();
				}
		goto restart;
		}
			*/


//	t = PHONEME;                            /* Classify next byte.  */
	if ((citem.i_word[0]&PFONT) == (PFASCII<<PSFONT)) {
		c = citem.i_word[0] & PVALUE;
		if (c>' ' && c < '~')
		{
			lp1->l_ch = c;
			++lp1;
			++lp2;
			if (c=='.' || c=='?' || c== '!' || c==':' || c==',' || c==':')
			{
				nextitem();
				if ((nitem.i_word[0] & PVALUE)==' ')
				{
					if (c=='?' || c== '!' || c==':' || c==',' || c==':')
					{
						lp1--;
						lp2--;
					}
				goto out;
				}
			}
			readitem();

			goto loop;
		}
		else
		{
//			t=NEVER;
		}
	}
	else
	{
		//if (t == PHONEME) 
		{
			//eab not sure of flow but don't send this
		//	writeitem();
			readitem();
			//ksf = TRUE;             /* Kept something       */
			goto loop;
			}
	}

out:
	lp1->l_ch = EOS;
}
#else
readword(word)
  LETTER        word[];
{
	  LETTER        *lp1;
	  LETTER        *lp2;
	  int   ksf=0;
	  int   t;
	  int   c;
//	  PHONE *pp1;
//	  PHONE *pp2;
/*
 *  start with no flags for this word ...
 */
//restart:

	while (iswhite(&citem) != FALSE) {      /* Skip spaces.         */
		readitem();
#ifdef FULL_LTS
		while (isindex(&citem) != FALSE) {
			writeitem();
			readitem();
		}
#endif
	}
	lp1 = &word[0];                         /* Current location     */
	lp2 = &word[0];                         /* Rightmost location   */
	ksf = FALSE;                                    /* Nothing kept         */

loop:

/*      if(KS.halting)
		{
		if(citem.i_word[0] == SYNC)
			{
			writeitem();
				}
		goto restart;
		}
			*/
#ifdef FULL_LTS
	if (isindex(&citem) != FALSE) {         /* Index markers.       */
		if (lp1 == &word[0])            /* Flush through if at  */
			{
			writeitem();            /* left edge of word.   */
				

		readitem();
		if (checkloop)
		goto loop;
		}
	}
#endif
	t = PHONEME;                            /* Classify next byte.  */
	if ((citem.i_word[0]&PFONT) == (PFASCII<<PSFONT)) {
		c = citem.i_word[0] & PVALUE;
		t = lsctype[c] & TYPE;
		if (t == IGNORE) {              /* These two are easy.  */
			readitem();
		if (checkloop)
			goto loop;
		}
		if (t == BACKUP) {
			if (lp1 != &word[0])
				--lp1;
			readitem();
		if (checkloop)
			goto loop;
		}
	}                          

	if (lp1 < lp2) {                        /* Overstrike.          */
		if (t==MIGHT || t==ALWAYS) {
			if ((lsctype[c]&II) == 0)
				lp1->l_ch = c;
			++lp1;
			readitem();
		if (checkloop)
			goto loop;
		}
	} else if (lp1 == &word[0]) {           /* Initial position.    */
		if (t == PHONEME) {
			writeitem();
			readitem();
			ksf = TRUE;             /* Kept something       */
		if (checkloop)
			goto loop;
			}

		if (t==ALWAYS || (t==MIGHT && ksf==FALSE)) {

			lp1->l_ch = c;
			++lp1;
			++lp2;
			readitem();
			ksf = TRUE;             /* Kept something.      */
		if (checkloop)
			goto loop;
		}
	}else if (t==ALWAYS || (t==MIGHT && ismight()!=FALSE)) {
		if (lp1 < &word[NGWORD-1]) {

			lp1->l_ch = c;
			++lp1;
			++lp2;
		}
		readitem();
		if (checkloop)
		goto loop;
	}

	lp1->l_ch = EOS;
}
#endif
#ifndef CALLER_ID
/*
 * Look ahead, to see if a character, which
 * always has type "MIGHT", should be kept. Peek at
 * the next character. If it is a backspace, an ordinary
 * character, or a MIGHT character, return TRUE (keep).
 * Else return FALSE (stop). I changed the rules to
 * make MIGHT a keep flag so that "???" would be two
 * question marks and a question mark delimiter.
 */
ismight()
{
	  int   t;

	nextitem();
	if ((nitem.i_word[0]&PFONT) == (PFASCII<<PSFONT)) {
		t = lsctype[nitem.i_word[0]&PVALUE] & TYPE;
		if (t==BACKUP || t==ALWAYS || t==MIGHT)
			return (TRUE);
	}
	return (FALSE);
}
#endif

/*
 * Return TRUE if the item pointed
 * to by "ip" is some kind of index mark.
 * This means index or index reply.
 */
#ifdef FULL_LTS
isindex(ip)
  ITEM  *ip;
{
	if (ip->i_word[0]==INDEX || ip->i_word[0]==INDEX_REPLY)
		{
		return (TRUE);
		}
	return (FALSE);
}
#endif
/*
 * Return TRUE if the ITEM pointed to
 * by "ip" is some kind of white space. Yes,
 * this probably should be done with a bit
 * in the type table. The HT and the VT
 * are not considered to be white space,
 * because they become "," and flush
 * phonemes. Essentially "white" means
 * "dorpunct would send a WBOUND".
 */
iswhite(ip)
  ITEM  *ip;
{
	  int   c;

short  a=ip->i_word[0];
short  b=ip->i_word[1];
short  d=ip->i_word[2];
short  e=ip->i_word[3];



	if ((ip->i_word[0]&PFONT) == (PFASCII<<PSFONT)) {
		c = ip->i_word[0] & PVALUE;
		if (c==' ' || c==0xA0 || c==LF || c==CR || c==FF)
			return (TRUE);
	}
	return (FALSE);
}

/*
 * Arrange that the "citem" external
 * variable contains the next item of input
 * from the front end. Understandshow
 * lookahead works.
 */
readitem()
{
	  int   i;

	if (nitem.i_nword == 0)
		nextitem();

	if(checkloop == true)
	{
	citem.i_nword = nitem.i_nword;
	nitem.i_nword = 0;
	for (i=0; i<1+3; ++i)
		citem.i_word[i] = nitem.i_word[i];
/*      printf("^^ %c %d \n",(citem.i_word[0] & 0xff),(citem.i_word[0] & 0xff));
  */
	}
	else
	{
		citem.i_nword = 0;
		citem.i_word[0]=0;
	}

}

/*
 * Read an item from the input stream,   and store it into the "nitem"
 * external variable. Used to peek ahead at the input, and called by
 * "readitem" to actually do reading.
 *
 * Now we also handle the lts flushes and synchronous lts command here ...
 *
 */


#ifndef NO_CMD
int nextitem_new(short *local_buf)
{
	int     nextra,i;
	unsigned int lts_sync[2];
	//eab for debug only
//int in_array[20]={'W','A','L','L','A','W','A','L','L','A','.','.',' ','#','n'};
//int in_array[30]={'S','E','E',' ','T','H','A','T',' ','B','R','O','W','N ',' ',' ','B','E','A','R','.','#','\n',0};
//int in_array[6]={'A','.',' ','#','\n',0};
//int in_array[6]={'H','I',' ','#','\n',0};
//int in_array[15]={'J','O','H','N',' ','E','D','W','A','R','D','S','#','\n',0};

	static int countc=0;
	static int loopflag=0;
	
/*
 *  peek at the pipe words, handle ...
 */


	while(true)
	{
		nitem.i_word[0]=local_buf[0];
		nextra = (nitem.i_word[0]&PNEXTRA) >> PSNEXTRA;

/*      printf("^^ %c %d \n",(nitem.i_word[0] & 0xff),(nitem.i_word[0] & 0xff));*/

/*
 *  commands synchronous to lts ...
 */

		if((nitem.i_word[0] & (PFONT|PVALUE)) == LTS_SYNC)
			{
			for(i=0;i<nextra;i++)
				{
				lts_sync[i]=local_buf[i+1];
				if(KS.halting)
					{
					if(lts_sync[i] == SYNC)
						{
						nitem.i_nword = 1;
						nitem.i_word[0] = SYNC;
						return 1;
						}
					else if(lts_sync[i] == ((PFASCII<<PSFONT)+0xb))
						{
						nitem.i_nword = 1;
						nitem.i_word[0] = (PFASCII<<PSFONT)+0xb;
						return 1;
						} 
					break;
					}
				}
			if(KS.halting == false)
				{
				switch(lts_sync[0])
					{
					case    LTS_MODE_SET    :
						KS.modeflag |= lts_sync[1];
						break;
					case    LTS_MODE_CLEAR  :
						KS.modeflag &= (~lts_sync[1]);
						break;
					case    LTS_MODE_ABS    :
						KS.modeflag = lts_sync[1];
						break;
					case    LTS_DIC_ALTERNATE       :
						KS.pronflag |= PRON_DIC_ALTERNATE;
						break;
					case    LTS_DIC_PRIMARY :
						KS.pronflag |= PRON_DIC_PRIMARY;
						break;
					case    LTS_ACNA_NAME   :
						KS.pronflag |=  PRON_ACNA_NAME;
						break;
					};
				}
			return 0;
			}
		nitem.i_nword = nextra+1;
		nitem.i_word[0] &= ~PNEXTRA;
		for(i=1;i<=nextra;i++)
			{
			nitem.i_word[i]=local_buf[i];
			if(KS.halting)
				{
				if(nitem.i_word[i] == SYNC)
					{
					nitem.i_word[0] = SYNC;
					nitem.i_nword = 1;
					return 1;
					}
				else if(nitem.i_word[i] == ((PFASCII<<PSFONT)+0xb))
					{
					nitem.i_nword = 1;
					nitem.i_word[0] = (PFASCII<<PSFONT)+0xb;
					return 1;
					} 
				}
			}
		if(KS.halting == false ||
			  nitem.i_word[0] == SYNC ||
			    nitem.i_word[0] == ((PFASCII<<PSFONT)+0xb))
				{

			return 1;
				}

	}//while

}
#endif
void nextitem(void)
{
	int     nextra,i;
	unsigned int lts_sync[2];
	//eab for debug only
//int in_array[20]={'W','A','L','L','A','W','A','L','L','A','.','.',' ','#','n'};
//int in_array[30]={'S','E','E',' ','T','H','A','T',' ','B','R','O','W','N ',' ',' ','B','E','A','R','.','#','\n',0};
//int in_array[6]={'A','.',' ','#','\n',0};
//int in_array[6]={'H','I',' ','#','\n',0};
//int in_array[15]={'J','O','H','N',' ','E','D','W','A','R','D','S','#','\n',0};

	static int countc=0;
	static int loopflag=0;
	
/*
 *  peek at the pipe words, handle ...
 */


	while(checkloop == true)
		{
#ifdef DIRECT_LTS_INPUT
#ifdef ARRAY_INPUT
			if(cinput_array[countc] != 0)
			{
				i = cinput_array[countc];
				countc++;
				nitem.i_nword=1;
			}
			else
			{
			checkloop = false;
			countc=0;
			}
#else
			i=getc(stdin);
#endif


	if(checkloop == true)
	{
#ifdef DIRECT_LTS_INPUT
#ifdef NO_CMD
			if (i==35)
				i=11;
			if (i==10)
				continue;
#endif
			i&=0x00ff;

#endif
			nitem.i_word[0]=i + (PFASCII<<PSFONT);
			nitem.i_nword = 1;
#ifdef DIRECT_LTS_INPUT

			if (i==0x0b)
			{
				//sendphone(SIL);
				last_was_ctrlk=1;
			}
#endif
		nextra=0;
		nitem.i_word[0] &= ~PNEXTRA;
#else
		read_pipe(linp,&nitem.i_word[0], 1);
		nextra = (nitem.i_word[0]&PNEXTRA) >> PSNEXTRA;
#endif
/*      printf("^^ %c %d \n",(nitem.i_word[0] & 0xff),(nitem.i_word[0] & 0xff));*/

/*
 *  commands synchronous to lts ...
 */
#ifndef DIRECT_LTS_INPUT

		if((nitem.i_word[0] & (PFONT|PVALUE)) == LTS_SYNC)
			{
			for(i=0;i<nextra;i++)
				{
				read_pipe(linp,&lts_sync[i],1);
				if(KS.halting)
					{
					if(lts_sync[i] == SYNC)
						{
						nitem.i_nword = 1;
						nitem.i_word[0] = SYNC;
						return;
						}
					else if(lts_sync[i] == ((PFASCII<<PSFONT)+0xb))
						{
						nitem.i_nword = 1;
						nitem.i_word[0] = (PFASCII<<PSFONT)+0xb;
						return;
						} 
					break;
					}
				}
			if(KS.halting == false)
				{
				switch(lts_sync[0])
					{
					case    LTS_MODE_SET    :
						KS.modeflag |= lts_sync[1];
						break;
					case    LTS_MODE_CLEAR  :
						KS.modeflag &= (~lts_sync[1]);
						break;
					case    LTS_MODE_ABS    :
						KS.modeflag = lts_sync[1];
						break;
					case    LTS_DIC_ALTERNATE       :
						KS.pronflag |= PRON_DIC_ALTERNATE;
						break;
					case    LTS_DIC_PRIMARY :
						KS.pronflag |= PRON_DIC_PRIMARY;
						break;
					case    LTS_ACNA_NAME   :
						KS.pronflag |=  PRON_ACNA_NAME;
						break;
					};
				}
			continue;
			}
		nitem.i_nword = nextra+1;
		nitem.i_word[0] &= ~PNEXTRA;
		for(i=1;i<=nextra;i++)
			{
			read_pipe(linp,&nitem.i_word[i], 1);
			if(KS.halting)
				{
				if(nitem.i_word[i] == SYNC)
					{
					nitem.i_word[0] = SYNC;
					nitem.i_nword = 1;
					return;
					}
				else if(nitem.i_word[i] == ((PFASCII<<PSFONT)+0xb))
					{
					nitem.i_nword = 1;
					nitem.i_word[0] = (PFASCII<<PSFONT)+0xb;
					return;
					} 
				}
			}
#endif
		if(KS.halting == false ||
			  nitem.i_word[0] == SYNC ||
			    nitem.i_word[0] == ((PFASCII<<PSFONT)+0xb))
				{

			break;
						}

		} 
	}//while

}
/*
 * Write the item in the "citem"
 * external out to the synthesizer. This is
 * used when "readword" decides that it wants
 * to simply copy an item through to the
 * output.
 */
writeitem()
{
	int tmp;
	//tmp = (citem.i_nword-1);
	//tmp = tmp<< PSNEXTRA;
	//citem.i_word[0] |= tmp;
	citem.i_word[0] |= ((citem.i_nword-1) << PSNEXTRA);
	ph_loop(citem.i_word);
	//write_pipe(kinp,&citem.i_word[0],citem.i_nword);
}
#ifdef PRINT_OUTPUT
void dump_list(char *message, LETTER  *llp,LETTER  *rlp)
{
LETTER *lp1;
LETTER *lp2;

        lp1=llp;
        lp2=rlp;

        printf("%s : ",message);
        while (lp1 != lp2)
        {
           printf("%c(%x)",lp1->l_ch,lp1->l_ch);
           ++lp1;
        }
        putc('\n',stdout);
        return;
}
#endif























