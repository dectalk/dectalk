#ifndef NO_CMD
/************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	cmd_pars.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *
 *      marking of $ so that it was not treated as punc
 * 002 05/21/93 Now strips dashes in punc none. 
 * 003 02/08/95 cjl. Correct cbufcnt test in while loop
 * 004 07/05/95 tek	hack with block()s..
 * 005 09/07/95 cjl Cleaned up debug printfs.
 * 006 09/13/95 gl  Modify modechng to set earlier for date processing.
 * 007 09/15/95 cjl Shut off English pre-process for German too.
 * 008 09/15/95 cjl Revise non-English SAY_LETTER and bypass pre-proc text.
 * 009 09/27/95 cjl Control shut-off of punct processing with FIELD_TEST.
 * 010 10/17/95 jdb Remove french test condition from FIELD_TEST code.
 * 011 11/06/95 tek Fix CMD_flushing action in do_command().
 * 012 01/28/96 eab Added new clause parser and local language text rule
 *						parser. Abbrev lookup is done locally, only.
 *						Delete two code lines to return to old system.
 *						(see SAY_CLAUSE).
 * 013 02/05/96 cjl Move Span Abbrev[] and RULESET[] to cmd_tpre.h
 *					SPAN_TEXTPRE_BYPASS; bypass Spanish text pre-processing.
 * 014 02/08/96 gl  add the patch to allow 0xaa and 0xba to go through.
 * 015 02/08/96 cjl remove FIELD_TEST control of punct processing.
 * 016 02/15/96 gl  fix say_line problem.  Make sure CR/LF will not set to
 *                  space in the say_line mode.
 * 017 02/21/96 tek	merge dtex
 * 018 03/13/96 tek	add code to explicitly pass on ^K (vt, 0xb) to
 *			LTS (at the bottom of process_char). Somehow, edit 016
 *			caused these to not make it out of process_char and
 *			I'm not about to try to unwind this spaghetti to figure
 *			out why. Also removed an extraneous block() call.
 * 019 11/07/96 GL	fix the DTEX [:index reply xx]bug and DTPC [:say letter] extra space
 *                  problem
 */


#include        "cmd_def.h"
/*#include		"cmd_tpre.h"*/
/*#include        <stdlib.h>*/
                                          
/*#define SPAN_TEXTPRE_BYPASS */  /* By-pass Spanish text pre-processing.*/

extern short cmd_number;
extern short cmd_count;
extern struct icomm setv[];
extern short insertflag;
unsigned int lpchar;/*last punctuation mark processed*/

unsigned int c;

/* commented out as unused vars - 8/9/95  JDB  
unsigned int lpcnt; */  /* number of chars processed after a period*/


unsigned int dcnt;      /* number of dashs processed */
char cbuf[120];					
signed int cbufcnt=0;
unsigned int pcnt=0;
unsigned int prcnt=0;         

/* commented out as unused vars - 8/9/95  JDB 
int donit=0; */ /*flag to indicate that - has been processed so don't do it again.*/


int isdigit=1;
int sndtel=0;
int digcnt=0;
int postel=0;
int modechng=0; 

/* commented out as unused vars - 8/9/95  JDB
unsigned int delayc, done;
*/

char heldchar[2];
int posord;
char laschar;
/*set debug printing on*/
/*#define DEBUGPARS 1*/
/*#define DEBUGRULS	*/
/*#define DEBUGACT	1*/
/*#define DEBUGIND	*/
/*#define SHOWRULES*/

/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*#ifdef DTEX*/ 	/* was this fixed in another way for DTPC?? (tek 2/21/96) */
unsigned int bracket_space;	
/* tek 2/15/95 flag to keep the space that gets to
				 * process_char during a flush_numbers_on_[ from 
				 * actually getting into the LTS pipe.. serious hack.
				 * (merge 12/15) */
/*#endif*/ /*DTEX*/

int icommand(void)
{
	if(setv[cmd_number].cmd[cmd_count] == 0)
		{
		insertflag=0;
		return(1);
		}
	cmd_count++;
	return(setv[cmd_number].cmd[cmd_count-1]);
}


#ifdef SINGLE_THREADED
_far dtpc_cmd(unsigned char inchar)
#else
_far dtpc_cmd()
#endif
{
//	int     i,j;
	short pipe_value;

#ifdef DTEX
	putc(XON);
#endif /*DTEX*/
/* This has to be changed to get the character from an array */
#ifndef SINGLE_THREADED
	while(true)
#endif
	{
/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*#ifdef DTEX*/ /* see comment above at declaration of bracket_space.. */
		bracket_space=false;
/*#endif*/ /*DTEX*/
				

		last_char = c;
		if(insertflag == 2)  /*insertflag = 2 time to do it*/
			{
			c = icommand();
			}
		else
			{
			c = getseq(inchar); /* parsing internally stored string*/
			}

#ifdef DEBUGPARS
		printf("CMD_PARS: dtpc_cmd: First Char: char = %c %d insert= %d \n",c,c,insertflag);
#endif
		if(last_char == '.' && c ==',')/* rule to handle e.g.,*/
			{
			c=0xb;
			}
		switch(parse_state)
			{
			
			case    STATE_NORMAL    :
				cmd_index = 0xffff;
				if(c == '[')
					{
					if(laschar != ' '	)
						{
						c=' ';  

/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*#ifdef DTEX*/
						bracket_space=true;
/*#endif*/ /*DTEX*/


						process_char(c);/*eab put a space to flush things out5/94*/

/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*#ifdef DTEX*/
						bracket_space=false;
/*#endif*/ /*DTEX*/

						}
					if	( ( KS.lang_curr == LANG_french)|| 
						( KS.lang_curr == LANG_spanish)||
						( KS.lang_curr == LANG_german))
						{
						c=0xff;
						process_char(0xff);
						}
					sendat();/*eab 2/29/95 had to move sendat out of space
						test because space doesn't insure that numbers get flushed
						if cbufcnt is zero(everything sent ) it will simply
						return 0. */
					modechng=1;
					c='[';
					new_state(STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: dtpc_cmd: Parse State Switch: STATE_NORMAL->STATE_BRACKET\n");
#endif
					laschar=c;
					}
				else
					{
					process_char(c);
					}
					laschar=c;
				break;

/*
 *  this is the hard state, either enter command mode, phonemic mode,
 *  start tossing text or go back to the normal pass all state ...
 */
 

			case    STATE_BRACKET   :


				switch(c)       {

					case    ':'     :
						reset_command(STATE_COMMAND);
#ifdef DEBUGPARS
		printf("CMD_PARS: dtpc_cmd: Parse State Switch: STATE_BRACKET->STATE_COMMAND\n");
#endif
						break;

					case    ']'     :
						if(insertflag == 1)
						{
						insertflag=2;   /*time to insert*/
						}
						reset_command(STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: dtpc_cmd: Parse State Switch: STATE_BRACKET->STATE_NORMAL\n");
#endif
						break;

					case    '['     :

						process_char('[');
						break;

					case    '\t'    :
					case    ' '     :
					case    CR              :
					case    LF              :
#ifdef DEBUGPARS
		printf("CMD_PARS: dtpc_cmd: Dumping white space\n");
#endif
						break;

					default :
						if(KS.phoneme_mode & PHONEME_OFF)
							{
							if(cmd_index == 0xffff)
								{
								process_char('[');
								process_char(c);
								new_state(STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: dtpc_cmd: Parse State Switch: STATE_BRACKET->STATE_NORMAL\n");
#endif
								}
							else
								{
//								command_error(CMD_bad_command);
								new_state(STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: dtpc_cmd: Parse State Switch: STATE_BRACKET->STATE_TOSS\n");
#endif
								}
							}
						else
							{
							new_state(STATE_PHONEME);
#ifdef DEBUGPARS
		printf("CMD_PARS: dtpc_cmd: Parse State Switch: STATE_BRACKET->STATE_PHONEME\n");
#endif
							match_phoneme(c);
							}
					}
				break;

/*
 *  process a phoneme ...
 */
			case    STATE_PHONEME   :

				match_phoneme(c);
				break;
/*
 *  process a command ...
 */

			case    STATE_COMMAND   :
				match_command(c);
				if(c == ']') modechng=0; /* Fix flag for ] 09/13/95 gl */
				break;
/*
 *  get a parameter string ...
 */

			case    STATE_PARAM             :

				build_param(c);
				break;

/*
 *  toss out all further text until we see an end delimator ...
 */
			case    STATE_TOSS              :

				if(c == ']')
					if(insertflag == 1)
					{
					insertflag=2;   /*time to insert*/
					}

					reset_command(STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: dtpc_cmd: Parse State Switch: STATE_TOSS->STATE_NORMAL\n");
#endif
				break;

			} /* end switch(parse_state) */
		} /* end while(true) */
} /* end dtpc_cmd() */

/*
 *  process_char() is called when there is a character that needs to
 *  be potentially flushed to lts ...
 */
void process_char(unsigned int c)
/*unsigned int c;*/
{

	int     i,j,k;
	unsigned short pipe_value;
	if(KS.text_flush || (KS.cmd_flush == CMD_flush_toss))
		{
		isdigit=1; /*flushing so reiinit everything*/
		sndtel=0;
		digcnt=0;
		postel=0;
		last_punct=0;
		last_char=0;
		lpchar=0;
		pcnt=0;
		cbufcnt=0;
		cbuf[1]=0;
		cbuf[2]=0;
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: KS.text_flush or CMD_flush_toss\n");
#endif
		return;
		}
#ifdef NEVERDEFINED
		/* I don't believe this is needed; remove for now 3/13/96*/
		/* ...tek try to get rid of the dreaded pause.. */
                if(char_types[c] & (MARK_space | MARK_clause))
			block(NULL_FP); /* run a sched pass on spaces. */
#endif /*NEVERDEFINED*/

	switch(c)       {

/*
 *  ST acts as a left brace ...
 */

		  case  ST              :
					reset_command(STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: ST->STATE_NORMAL\n");
#endif
					return;

		  default               :

#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default case of switch(%c)\n",c);
#endif
					/*****HACK ALERT*** This is a hack for now
						with foreign languages to force punc pass until we re-architect
						the text pre-pro for multi-language*/
/*  09/15/95 cjl SAY_LETTER command test replaced for local_languages. */
/*	09/27/95 cjl FIELD_TEST defined also disables [:PUNCT command for */
/*					non_English languages in cmd_cmd.c. */
/*  02/08/96 cjl FIELD_TEST condition removed. */
#ifdef HACK_ALERT
					if (  ( KS.lang_curr == LANG_french)|| 
						( KS.lang_curr == LANG_spanish)||
						( KS.lang_curr == LANG_german))
						{

#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: French, Spanish, German.\n");
#endif

/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*				  only say_letter mode will throw away this extra space */
/*#ifdef DTEX*/
						//tek 2/15/95: OK, if we finally get here, and we're
						// trying to flush things out with bracket_space, and this 
						// is a space, just punt.
						if ((KS.sayflag == SAY_LETTER) && bracket_space && (c == ' ') )
							break; // don't send this 'flushing' space to lts!
/*#endif*/ /*DTEX*/

			/*Text preprocessing and getting clause boundary only done
				with say_clause assumption being that in say word etc you
				want all the gory details --nothing thrown away*/
						switch(KS.sayflag)
							{
							case    SAY_CLAUSE      :
	/*eab 1/95 delete next two lines and your back to the old cmd_pars*/
#ifndef SPAN_TEXTPRE_BYPASS
								getclause();
								return;
#endif
							case    SAY_SYLLABLE    :

							pipe_value = (PFASCII<<PSFONT)+c;
#ifdef SINGLE_THREADED
							lts_loop(&pipe_value);
#else
							write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
							break;

							case    SAY_WORD        :

/*
   allow 0xba and 0xaa to go through, since these characters may show up in Spanish
   dictionary.  Other language should be o.k.   GL  2/8/96
*/
                                                                if((char_types[c] & (MARK_vowel|MARK_cons|MARK_digit)) == false &&
                                                                    c != 0xaa && c != 0xba)
								{
								pipe_value = (PFASCII<<PSFONT)+0xb;
#ifdef SINGLE_THREADED
								lts_loop(&pipe_value);
#else
								write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
								}
							pipe_value = (PFASCII<<PSFONT)+c;
#ifdef SINGLE_THREADED
							lts_loop(&pipe_value);
#else
							write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
							break;
	
							case    SAY_LETTER      :
							type_out(c);
							break;

							case    SAY_LINE        :

							if(c == CR || c == LF)
								c = 0xb;
							pipe_value = (PFASCII<<PSFONT)+c;
#ifdef SINGLE_THREADED
							lts_loop(&pipe_value);
#else
							write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
							break;
							}
							
						return;
						}/* end of turn off PUNCT_* commands.*/
#endif // HACK_ALERT
/* #endif for removed FIELD_TEST #ifdef removed. */
/*
   allow 0xba and 0xaa to go through, since these characters may show up in Spanish and English
   dictionary.  Other language should be o.k.   GL  2/8/96
*/
                                if((char_types[c] & (MARK_vowel|MARK_cons|MARK_digit)) == 0 &&
                                          c != 0xb && c != 0xaa && c != 0xba && c != CR && c != LF)
					{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: MARK_vowel|cons|digit\n");
#endif
/*
 *  PUNCT_none, passes {.,?!'}, but folds multiples of them and turns all others
 *  into white space ...
 */


					switch(punct_mode)
						{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: switch(punct_mode): PUNCT_some or PUNCT_none\n");
#endif
						case PUNCT_some:
						case PUNCT_none:
						if(c =='.')
							{
							pcnt++; /* number of periods seen in this parse*/
							if(last_char == '.') /*assume xxx.....yyyyy and force pron*/
								pcnt=1000;
							}
						if(c == '-')
								dcnt++;
						if (c=='"' || (last_char == c && last_punct == c &&  ( (char_types[c] & MARK_space) == 0) ))
							return;
					   if( char_types[c] & MARK_clause )
							{
							lpchar=c;
							last_punct = c;
							}
						else      
							{
							last_punct = ' ';
							if( (c!='/' && (KS.modeflag & MODE_MATH) == 0) ||  ((c=='/') && (last_char < '0')) ||  ((c== '/') && (last_char > '9') )  )
								{
								c = ' ';                                                                  
								}
							}

						break;
						

/*
 *  this is PUNCT_all mode where we force each of the non character to be
 *  it's own word ... this overrides the say mode ...
 */
						case PUNCT_pass:
							if(KS.sayflag & SAY_LETTER)
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: switch(punct_mode): PUNCT_pass type_out(%c) \n",c);
#endif
								type_out(c);
								}
							else
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: switch(punct_mode): PUNCT_pass sending %c \n",c);
#endif
								pipe_value = (PFASCII<<PSFONT)+c;
#ifdef SINGLE_THREADED
								lts_loop(&pipe_value);
#else
								write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
								}
							return;

						case PUNCT_all:
						
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: switch(punct_mode): PUNC_all write_all\n");
#endif
						pipe_value = (PFASCII<<PSFONT)+' ';
#ifdef SINGLE_THREADED
						lts_loop(&pipe_value);
#else
						write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
						pipe_value = (PFASCII<<PSFONT)+c;
#ifdef SINGLE_THREADED
						lts_loop(&pipe_value);
#else
						write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
						if(char_types[c] & MARK_clause)
							{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: switch(punct_mode): PUNC_all sending MARK_clause %c\n",c);
#endif

							pipe_value = (PFASCII<<PSFONT)+0xb;
#ifdef SINGLE_THREADED
							lts_loop(&pipe_value);
#else
							write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
						}
						c = ' ';
						} /* end switch(punct_mode) */
					}
				else
					{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: NOT MARK_vowel|cons|digit\n");
#endif

					if(punct_mode ==PUNCT_pass)
						{
						if(KS.sayflag & SAY_LETTER)
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: PUNCT_pass type_out(%c) \n",c);
#endif
								type_out(c);
								}
							else
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: Not PUNCT_pass: sending(%c)\n",c);
#endif

								pipe_value = (PFASCII<<PSFONT)+c;
#ifdef SINGLE_THREADED
								lts_loop(&pipe_value);
#else
								write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
							}
						return;
						}


#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Default: PUNC_all into switch: c= %c  %d lpunct= %c last_char = %c \n",c,c,last_punct,last_char);
        printf("                                                                 %d\n",(char_types[c] & MARK_digit));
#endif
					prcnt++;
/*                                      if(prcnt >= 10)
						{
						prcnt=0;
						printf(" st= %d \n",_stackavail());
						}*/
					if(parse_state != STATE_NORMAL  || punct_mode == PUNCT_all )
						{
						goto skipit; /*Don't process periods etc if not normal*/
						}

					if( last_char == '-' && last_punct == '-' && isdigit == 2 && (KS.modeflag & MODE_MATH) == 0 )
						{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char STATE_NORMAL: in dash code\n");
#endif                          

						if ( c != ' ' || (dcnt == 1) )
							/* to send compound noun */
							{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: STATE_NORMAL: 6sending %c \n",last_punct);
#endif

							pipe_value = (PFASCII<<PSFONT)+last_punct;
#ifdef SINGLE_THREADED
							lts_loop(&pipe_value);
#else
							write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: STATE_NORMAL Case: sending dash from dash proc code\n");
#endif
							}
						else
							{
							pipe_value = (PFASCII<<PSFONT)+' ';
#ifdef SINGLE_THREADED
							lts_loop(&pipe_value);
#else
							write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: STATE_NORMAL: sending space for dash from dash code\n");
#endif


							}
						}
					} /* end else */
				/* EAB handle word.txt */
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: lpchar at point = %c %d \n",lpchar,lpchar);
		printf("                        c= %c last_char = %c %d isdi= %d\n",c,last_char,last_char,isdigit);
#endif
				
				if( !(KS.sayflag & SAY_LETTER) )
					{
					if(cbufcnt != 0 && isdigit == 1)
						{
						if((KS.modeflag & MODE_EUROPE) && (last_char == '.' || last_char == ',' ))
							{
							if(c >= '0' && c <= '9')
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: parse_char: switching period and comma mode Europe. \n");
#endif
								if (last_char==',')
									{
									lpchar='.';
									last_char ='.';
									cbuf[cbufcnt-1]='.';
									}
								else
									{
									lpchar=',';
									last_char = ',';
									cbuf[cbufcnt-1]=',';
									}
								}
							}
									
						if(posord == 0 && pcnt==0)
							{
							if(c == 'n' || c == 't' ||c == 'r'|| c == 's')
								{
								posord=1;
								heldchar[0]=c;
								goto ndone;
								}
							}
						}


/* If anything shows up that makes it not a digit then clear flag.*/                                    
					if(( isdigit == 1 && ((char_types[last_char] & (MARK_digit | MARK_space | MARK_clause)) == 0) ||
						(char_types[c] & (MARK_digit | MARK_space | MARK_clause) ) == 0 ) || (posord == 1 ) )
						{

						/*if chars has been proc they need to be sent*/                                         
						/* but we may need to wait if os ordinal */
						if(cbufcnt !=0 &&  isdigit == 1)
							{                                                                          
							if (posord == 1 )
								{
								heldchar[1]=c;
								if(c == 'd' ||c == 'h' ||c == 'd' || c == 't')
									{
									posord=2;
									}
								}
/*      xxxx in redundantly
	fixes some funny pronunciation problems chould be in v4.2b rel

	if (posord == 0)
								{
								if(c== 'n' || c == 't' || c == 'r' || c == 's')
									{
									posord=1;
									heldchar[0]=c;
									goto ndone;

									}
								}*/

		if (posord == 0 && (char_types[c] & (MARK_digit | MARK_space | MARK_clause))
								|| char_types[cbuf[cbufcnt-2]] && MARK_digit)
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: sending with sendit\n");
#endif


								sendit();
								}
						
							if(posord >0)
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: writing heldchar 0 %c\n",heldchar[0]);
#endif
								pipe_value = (PFASCII<<PSFONT)+heldchar[0];
#ifdef SINGLE_THREADED
								lts_loop(&pipe_value);
#else
								write_pipe(KS.lts_pipe,&pipe_value,1);
#endif


								if(posord == 2)
									{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: writing heldchar 1 %c \n",heldchar[1]);
#endif

									pipe_value = (PFASCII<<PSFONT)+heldchar[1];
#ifdef SINGLE_THREADED
									lts_loop(&pipe_value);
#else
									write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
								}
								}
							else
								{
								isdigit=0;
								}


							posord=0;
							cbufcnt=0;
							cbuf[0]=0;
							cbuf[1]=0;

							}
						/* if not a forcing set it to non-digit*/
						if(c!=(0xb || 0x11))
							{
							isdigit=2;
							}
						postel=0;
						sndtel=0;
						digcnt=0;
						}
					}
			/* If we get a digit in a text string break it out with a space*/

				if( isdigit == 2 && (nchar_types[c] & MARK_digit)
					&& (c != ')'&& c !='(' ) > 0
					&& (KS.modeflag & MODE_MATH) == 0)
					{
/* New code to process dash numbers 09/13/95 gl*/
					  if (laschar != '-')
					  {
					    isdigit=1;
					    pipe_value = (PFASCII<<PSFONT)+' ';
#ifdef SINGLE_THREADED
						lts_loop(&pipe_value);
#else
					    write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: Write_Pipe: Breaking out number with a space. \n");
#endif
					  }
					  else
					    isdigit=3;
					}
/**/

				if(!(KS.sayflag & SAY_LETTER))
					{
					if (lpchar == '.' || cbufcnt >= 115 || isdigit == 1 ||
                                           ((KS.sayflag == SAY_LINE) && c != CR && c != LF))
						{
						if (cbufcnt >=115)
							{
							sendat();
							}
						cbuf[cbufcnt++]=c;
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: INTO period and number processin\n");
		printf("CMD_PARS: process_char: cbufcnt= %d cbuf[cnt-1]=%c %d \n",cbufcnt,cbuf[cbufcnt-1],cbuf[cbufcnt-1]);
		printf("CMD_PARS: process_char: cbufcnt= %d cbuf[0]=%c %d \n",cbufcnt,cbuf[0],cbuf[0]);
		printf("CMD_PARS: process_char: isdig %d  char-t %d\n",isdigit,char_types[c]);
#endif  
					
						if (char_types[c] & MARK_clause  && postel == 1 && digcnt == 4)
								{       
								sndtel=1;
								}
						if( ( ( (char_types[c] & MARK_clause) == 0) || c=='-') && !(isdigit == 1 && last_char == ',' && c == ' ') &&  lpchar != '.' )
							{
							if(c==' ' || c=='-')
								{
								if(digcnt == 3)
									{
									c=' ';
									cbuf[cbufcnt-1]=c;
									postel=1; /* possible tel number coming*/
									sndtel=0;
									}
								if(postel == 1 && digcnt == 4 && sndtel != 1)
									{
									sndtel=1;
									postel=0;
									}
								/*else
									sndtel=0;*/
								digcnt=0;
								}
							if(c >= '0' && c <= '9')
								{
								/*CHange things for mode Europe
								if((KS.modeflag & MODE_EUROPE) && lastchar == '.' lastchar == ',' )
									{
									cbuf[cufcnt-1];
									}*/

									digcnt++;
									
								}
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: digcnt = %d sndtel = %d postel = %d \n",digcnt,sndtel,postel);
#endif

							goto ndone;
							}
						if(  ((char_types[c] & MARK_space) == 0) && (c != '-' && digcnt != 3) ||
							(c == '.'   && sndtel == 1) || ( digcnt >= 1 && (c == ','  || c== '.')))
							{
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: breaking \n");
#endif

							goto ndone; /*keep processkng tkl we get a space. char*/
							}
						sendat();
						isdigit=1; /*assume it's a digi unless we find otherwise*/
						sndtel=0;
						digcnt=0;
						postel=0;
						last_punct=0;
						lpchar=0;
						pcnt=0;
						cbufcnt=0;
						cbuf[1]=0;
						cbuf[0]=0;
						goto ndone;
						}
					}


				if( ((c == '.') || (c == '-') && (KS.modeflag & MODE_MATH) == 0) && (KS.sayflag != SAY_LETTER))
		ndone:                  break; /*handle period and dash later by code above*/
				postel=0;
				sndtel =0;
#ifdef DEBUGPARS
		printf("CMD_PARS: process_char: sending %c %d \n",c,c);
#endif
skipit:         sendat();


				cbufcnt=0;
				if(char_types[c] & MARK_space)
					{
					isdigit=1;
					}
				modechng=0;
				pcnt=0;
				cbuf[1]=0;  

/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*				  only say_letter mode will throw away this extra space */
/*#ifdef DTEX*/
				//tek 2/15/95: OK, if we finally get here, and we're
				// trying to flush things out with bracket_space, and this 
				// is a space, just punt.
				if ((KS.sayflag == SAY_LETTER) && bracket_space && (c == ' ') )
					break; // don't send this 'flushing' space to lts!
/*#endif*/ /*DTEX*/

					switch(KS.sayflag)
					{
					case    SAY_CLAUSE              :
					case    SAY_SYLLABLE    :

						pipe_value = (PFASCII<<PSFONT)+c;
#ifdef SINGLE_THREADED
						lts_loop(&pipe_value);
#else
						write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
						break;

					case    SAY_WORD        :

						if((char_types[c] & (MARK_vowel|MARK_cons|MARK_digit)) == false)
							{
							pipe_value = (PFASCII<<PSFONT)+0xb;
#ifdef SINGLE_THREADED
							lts_loop(&pipe_value);
#else
							write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
						}
						pipe_value = (PFASCII<<PSFONT)+c;
#ifdef SINGLE_THREADED
						lts_loop(&pipe_value);
#else
						write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
						break;
	
					case    SAY_LETTER      :
						type_out(c);
						break;

					case    SAY_LINE        :

						if(c == CR || c == LF)
							c = 0xb;
						pipe_value = (PFASCII<<PSFONT)+c;
#ifdef SINGLE_THREADED
						lts_loop(&pipe_value);
#else
						write_pipe(KS.lts_pipe,&pipe_value,1);
#endif						break;
					
					
					}

			   break;
#ifdef NEVERDEFINED 
 /* eab added a sil send  to flush indexs*/  
 	oops ofrgot to remove from earlier stuff   

#endif 	
				}
		/* tek 3/12 */
		/* as a last gasp, make sure that the single-char sync */
		/* really gets to LTS.. */
		if(c == 0xb)
			{
			pipe_value = SYNC;
#ifdef SINGLE_THREADED
			lts_loop(&pipe_value);
#else
			write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
		}

}
/*
 *  match_command() is used to isolate a single matching command that
 *  the user has entered with the command in the command table ... we
 *  either state in the command match state here, start looking for
 *  parameters, execute commands, or start the tossing characters ...
 */
void match_command(unsigned int c)
/*unsigned int c;*/
{
	int     i;
	int     save_matches,save_index;

#ifdef DEBUGPARS
		printf("CMD_PARS: match_command:\n");
#endif
	save_matches = total_matches;
	save_index = cmd_index;

/*
 *  space are either delimitors or are tossed ...
 */

		if(c == ' ' || c == '\t')
			{
			if(total_matches == 1)
				{
				new_state(STATE_PARAM);
				build_param(c);
#ifdef DEBUGPARS
		printf("CMD_PARS: match_command: Parse State Switch: STATE_COMMAND->STATE_PARAM\n");
#endif
				}
			else if(p_count != 0)
				{
//				command_error(CMD_bad_command);
				new_state(STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: match_command: Parse State Switch: STATE_COMMAND->STATE_TOSS\n");
#endif
				}
			return;
			}
		p_count += 1;

/*
 *  is this an exit to command mode ...
 */

		if(c == ']')
			{
			if(insertflag == 1)
					{
					insertflag=2;   /*time to insert*/
					}

			do_command(STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: match_command: Parse State Switch: STATE_COMMAND->STATE_NORMAL\n");
#endif
			return;
			}

/*
 *  if were trying to match up things here ...
 */

		for(i=0;i<total_commands;i++)
			if(cm[i] != 0xffff)                             
				{
				if(c >= 'A' && c<= 'Z')
					c |= 0x20;
				if(CT[i].c_name[cm[i]] == c)
					{
					cm[i] += 1;
					cmd_index = i;
					}
				else
					{
					total_matches -= 1;
					cm[i] = 0xffff;
					}
				}
		if(total_matches == 0)
			{
			if(save_matches != 1)
				{
//				command_error(CMD_bad_command);
				new_state(STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: match_command: Parse State Switch: STATE_COMMAND->STATE_TOSS\n");
#endif
				}
			else
				{
				total_matches = save_matches;
				cmd_index = save_index;
				new_state(STATE_PARAM);
				build_param(c);
#ifdef DEBUGPARS
		printf("CMD_PARS: match_command: Parse State Switch: STATE_COMMAND->STATE_PARAM\n");
#endif
				}
			}
}
/**********************************************************
 *  parameter conversion routines ...
 **********************************************************/
void build_param(unsigned int c)
/*unsigned int    c;*/
{

//	int     save_index;

/*
 *  first, if we get here and there are no more parameters needed ...
 */

	if(FORMAT_PARAM == 0)
		{
		do_command(STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_BRACKET\n");
#endif
             return;
		}

/*
 *  allow continuous execution of some commands  ...
 */

	if(FORMAT_PARAM == '*')
		{
		if(c == ':')
			{
			do_command(STATE_COMMAND);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_COMMAND\n");
#endif
			return;
			}
		if(c == ' ' || c == '\t')
			{
			do_command(STATE_KEEP);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_KEEP\n");
#endif
			return;
			}
		if(c == ']')
			{
			if(insertflag == 1)
					{
					insertflag=2;   /*time to insert*/
					}
			do_command(STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_NORMAL\n");
#endif
			return;
			}
		format_index = 0;
		}

/*
 *  on the first character for this paramater, init the value, or squeeze
 *  out leading spaces or ...
 */

	if(p_count == 0)
		{
		CURR_PARAM = 0;
		CURR_DEFAULT = true;
		if(q_flag == 0 || FORMAT_PARAM != 'a')
			{
			switch(c)       {

				case    ','     :

					param_index += 1;
					format_index += 1;
					return;

				case    ' '     :
				case    '\t'    :
					return;

				case    ']'     :
					if(insertflag == 1)
					{
					insertflag=2;   /*time to insert*/
					}

					do_command(STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_NORMAL\n");
#endif
					return;

				case    ':'     :
					do_command(STATE_COMMAND);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_COMMAND\n");
#endif
					return;

				case    '.'     :
					do_command(STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_BRACKET\n");
#endif
					return;
				};
			}

		if(q_flag == 0)
			{
			switch(c)       {

				case    '<'     :
					q_flag = '>';
					return;

				case    '\"'	:
					q_flag = '\"';
					return;
				};
			}
		}
/*
 *  now accept the first character and parse it into the param array ...
 */

	p_count += 1;
	CURR_DEFAULT = false;
	switch(FORMAT_PARAM) {

/*
 *  binary conversion ...
 */

		case    'b'     :

			if(c == '0' || c == '1')
				{
				CURR_PARAM = CURR_PARAM*2 + c - '0';
				return;
				}
			break;
/*
 *  octal conversion ...
 */

		case    'o'     :

			if(c >= '0' && c <= '7')
				{
				CURR_PARAM = CURR_PARAM*8 + c - '0';
				return;
				}
			break;
/*
 *  signed decimal conversion ...
 */

		case    'd'     :

			if(p_count == 1 && c == '-')
				p_flag = true;
			else if(c >= '0' &&  c <= '9')
				CURR_PARAM = CURR_PARAM*10 + c - '0';
			else
				break;
			return;
/*
 *  hex conversion ...
 */

		case    'h'     :

			if(c >= '0' && c <= '9')
				CURR_PARAM = CURR_PARAM*16 + c - '0';
			else if(c >= 'a' && c <= 'f')
				CURR_PARAM = CURR_PARAM*16 + c - 'a' + 10;
			else if(c >= 'A' && c <= 'F')
				CURR_PARAM = CURR_PARAM*16 + c - 'A' + 10;
			else
				break;
			return;
/*
 *  ascii strings ... the param value is an index into the string buffer.
 *  Delimitors are "" or <> or simple white space if no delimator is needed.
 */

		case    'a'     :

			if(p_count == 1)
				{
//				CURR_PARAM = (unsigned int)&string_buff[next_char];
				pString[param_index] = &(string_buff[next_char]);
				STRING_BYTE = 0;
				}
			if(q_flag && c != q_flag)
				{
				PUSH_BYTE = c;
				STRING_BYTE = 0;
				return;
				}
			if(q_flag == 0 && c != ' ' && c != '\t' && c != ']' && c != ',')
				{
				PUSH_BYTE = c;
				STRING_BYTE = 0;
				return;
				}
			if(q_flag)
				{
				q_flag = 0;
				return;
				}
			if(c != ']')
				c = ' ';
			next_char += 1;
			break;
		}

/*
 *  now, p_flag may be set to cause a negation, if so do it ...
 */

	if(p_flag == true)
		CURR_PARAM = -CURR_PARAM;

/*
 *  if we have taken in something, bump the indexes and reset the
 *  counts ...
 */

	if(q_flag && c == q_flag)
		{
		if(p_count != 1)
			param_index += 1;
		do_command(STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_BRACKET\n");
#endif
		return;
		}

	if(p_count != 1)
		{
		format_index += 1;
		param_index += 1;
		}
	p_count = 0;
	p_flag = 0;


/*
 *  legal seperators are white space and commas ... note that leading
 *  commas cause the defaults to be preselected ...  white space is
 *  allowed to start execution but comma implies another parameter ...
 */


	switch(c)       {

		case    ' '     :
		case    '\t'    :

			if(FORMAT_PARAM == '\0')
				{
				do_command(STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_BRACKET\n");
#endif
				}
			else if(FORMAT_PARAM == '*')
				{
				do_command(STATE_KEEP);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_KEEP\n");
#endif
				}
			break;

		case    ','     :

			if(FORMAT_PARAM == '\0' || FORMAT_PARAM == '*')
				{
//				command_error(CMD_bad_param);
				new_state(STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_TOSS\n");
#endif
				}
			break;

		case    ']'     :
			if(insertflag == 1)
					{
					insertflag=2;   /*time to insert*/
					}

			do_command(STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_NORMAL\n");
#endif
			break;

		default :

//			command_error(CMD_bad_param);
			new_state(STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: build_param: Parse State Switch: STATE_PARAM->STATE_TOSS\n");
#endif
			break;
		}
}

/* commented out as unused vars - 8/9/95  JDB
unsigned char *switches[] = {"on","true","off","false",0};
*/


/*
 *  string_match() searches the string array sa for a case insensitive
 *  match with s.  The index of the match is returned or -1 for failure.
 */
int string_match(unsigned char *sa[],unsigned char *s)
/*unsigned char *sa[],*s;*/
{
	unsigned char *t,*ta;
	int index,matches,match_index;

	matches = 0;
#ifdef DEBUGPARS
		printf("CMD_PARS: string_match:\n");
#endif
	for(index=0;sa[index];index+=1)
		{
		t = s;
		ta = sa[index];
		while(true)
			{
			if((*ta == *t) || (*t >= 'A' && *t <= 'Z' && *ta == (*t | 0x20)))
				{
				if(*ta == 0)
					return(index);
				ta += 1;
				t += 1;
				}
			else if(*t == 0)
				{
				matches += 1;
				match_index = index;
				break;
				}
			else
				break;
			}
		}
	if(matches == 1)
		return(match_index);
	return(NO_STRING_MATCH);
}
/*
 *  reset_command() resets the command parser so that the next character
 *  can be interpreted as the first, this allows interruption of esc, dcs,
 *  command parsing, and regular text input.
 */
void reset_command(unsigned int state)
/*unsigned int state;*/
{
	int     i;

#ifdef DEBUGPARS
		printf("CMD_PARS: reset_command:\n");
#endif
	if(state != STATE_KEEP)
		{
		for(i=0;i<NPARAM;i++)
			defaults[i] = TRUE;
		for(i=0;i<total_commands;i++)
			cm[i] = 0;
		total_matches = total_commands;
		new_state(state);
		format_index = 0;
		}
	next_char = 0;
	param_index = 0;
	p_flag = 0;
	q_flag = 0;
	p_count = 0;
	esc_command = false;
}
/*
 *  transition the parse state machine to whatever and reset the
 *  counts ..
 */
void new_state(int state)
/*int     state;*/
{

/*
 *  if we're accepting parameters and we're there now, bump and clear
 *  pointers ...
 */

	p_count = 0;
	p_flag = 0;

#ifdef DEBUGPARS
		printf("CMD_PARS: new_state:\n");
#endif
	if(state == STATE_PARAM && parse_state == STATE_PARAM)
		param_index += 1;

	if(state == STATE_TOSS && last_char == ']')
		{
		if(insertflag == 1)
					{
					insertflag=2;   /*time to insert*/
					}
		parse_state = STATE_NORMAL;
		}
	else
		parse_state = state;

}
/*
 *  execute a command ... fill in all the default parameters that were
 *  not supplied by the user ...        execute the command ... reset the parser
 */
void do_command(unsigned int new_state)
/*unsigned int new_state;*/
{
	int     err_value;

#ifdef DEBUGPARS
		printf("CMD_PARS: do_command:\n");
#endif
	if(total_matches == 1)
		{
		err_value  = CT[cmd_index].c_routine();
		if(err_value == CMD_success)
			{
			reset_command(new_state);
#ifdef DEBUGPARS
		printf("CMD_PARS: do_command: Parse State Switch: STATE_?->STATE_new?\n");
#endif
			return;
			}
		else if(err_value == CMD_flushing)
			{
			reset_command(STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: do_command: Parse State Switch: STATE_?->STATE_NORMAL\n");
#endif
//			SP.type = 0;
			/* ...tek 11/6 this needs a return statement. */
			return;
			}
		else
			{
//			command_error(err_value);
			reset_command(STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: do_command: Parse State Switch: STATE_?->STATE_TOSS\n");
#endif
			return;
			}
		}
//	command_error(CMD_bad_command);
	reset_command(STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: do_command: Parse State Switch: STATE_?->STATE_TOSS\n");
#endif
}

int load_defaults(unsigned int da[])
/*unsigned int da[];*/
{
	int     i,actual;

	actual = 0;
#ifdef DEBUGPARS
		printf("CMD_PARS: load_defaults: \n");
#endif
	for(i=0;i<param_index;i++)
		if(defaults[i] == true)
			params[i] = da[i];
		else
			actual += 1;
	return(actual);
}

void sendit(void)
{
	int k,pipe_value;
	int justone;
	
#ifdef DEBUGPARS
	printf("CMD_PARS: sendit: \n");
#endif
	justone=1;
	if(sndtel ==  0 && cbufcnt >0)    /*not a telphone number but a number*/
	{
		for(k=0;(cbufcnt)-k;k++)
								{
			if ( cbufcnt>0 && cbuf[k] != ')' && cbuf[k] !='(')
			{
				/*xxx EAB 9/94Doug GEO. complained that punc none speaks a lone punc mark*/
				
				if( !( (cbuf[k] == '.' || cbuf[k] == ',' || cbuf[k] == '?'
					|| cbuf[k] == '!') && punct_mode==PUNCT_none) 
					|| cbuf[k]=='.' && ((cbuf[k-1] >= '0'&& cbuf[k-1] <= '9') || ( cbuf[k+1] >= '0' && cbuf[k+1] <= '9')) )
				{
					pipe_value = (PFASCII << PSFONT) + cbuf[k];
#ifdef SINGLE_THREADED
					lts_loop(&pipe_value);
#else
					write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
#ifdef DEBUGPARS
					printf("CMD_PARS: sendit: sending3 %c %d\n",cbuf[k],cbuf[k]);
#endif
				
				}
			}
		}
		
#ifdef DEBUGPARS
		printf("CMD_PARS: sendit: laschar= %c ** posord=%d modechng %d, c= %c",laschar,posord,modechng,c);
#endif
		
		if ((posord != 2 && modechng !=1) &&
			(c != '/' && posord !=1)
			&& (KS.modeflag & MODE_MATH) == 0
			&& !(char_types[c] & MARK_digit)
			&& (laschar != '-'))
			/*==2 is an ordinal or fraction don't send space*/
		{
			
#ifdef DEBUGPARS
			printf("CMD_PARS: sendit: sending space in num proc  %d %c\n",c,c);
#endif
			
			pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
			lts_loop(&pipe_value);
#else
			write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
		}
	}
	else
	/*
	*	02/08/95 cjl fixed boundry test, was:
	*	for (k=0;(cbufcnt)-k;k++)
	*/
	{
		k=0;
		for(k=0;(cbufcnt-k)>0;k++)
								{
			if(cbuf[k] == '(')
			{
				k++;
			}
			if(cbuf[k] == ')')
			{
				k++;
			}
			if(cbuf[k] == '.' || cbuf[k] == ',' )
			{
				
				k++;
				pipe_value = (PFASCII << PSFONT) + '.';
#ifdef SINGLE_THREADED
				lts_loop(&pipe_value);
#else
				write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
				pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
				lts_loop(&pipe_value);
#else
				write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
			}
			else if(cbuf[k] == ' ')
			{
				if(justone==0)
				{
					justone=1;
					pipe_value = (PFASCII << PSFONT) + ',';
#ifdef SINGLE_THREADED
					lts_loop(&pipe_value);
#else
					write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
				}
				pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
				lts_loop(&pipe_value);
#else
				write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
			}
			else
			{
				pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
				lts_loop(&pipe_value);
#else
				write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
				pipe_value = (PFASCII << PSFONT) + cbuf[k];
#ifdef SINGLE_THREADED
				lts_loop(&pipe_value);
#else
				write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
				justone=0;
			}
#ifdef DEBUGPARS
			printf("CMD_PARS: sendit: sending 43 %c %d \n",cbuf[k],cbuf[k]);
#endif                                                                                  
		}
								
	}
	modechng=0;
}

	
int sendat(void)
{
int pipe_value,offset,k;

#ifdef DEBUGPARS
		printf("CMD_PARS: sendat:\n");
#endif                                                                                  
		if(cbufcnt==0)
			return(0);
		if( ( (char_types[c] & MARK_space) >= 0) &&
			((char_types[cbuf[1]] & MARK_space) == 0)
			&& ( (pcnt==1 && isdigit != 1 && last_char !=')')/* ||
			(pcnt >1 && isdigit == 1 && (last_char != '.' && pcnt ==2 ) )*/ )
			&& modechng == 0  )
		{
			pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
			lts_loop(&pipe_value);
#else
			write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
			pipe_value = (PFASCII << PSFONT) + 'd';
#ifdef SINGLE_THREADED
			lts_loop(&pipe_value);
#else
			write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
			pipe_value = (PFASCII << PSFONT) + 'o';
#ifdef SINGLE_THREADED
			lts_loop(&pipe_value);
#else
			write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
			pipe_value = (PFASCII << PSFONT) + 't';
#ifdef SINGLE_THREADED
			lts_loop(&pipe_value);
#else
			write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
			pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
			lts_loop(&pipe_value);
#else
			write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
			if(cbuf[cbufcnt-1] != ' ')
			{
				offset=0;
			}
			else
			{
				offset=1;
			}
			if(cbuf[0] == '.')
			{
				k=1;
			}
			else
				k=0;
#ifdef DEBUGPARS
			printf("CMD_PARS: sendat: offset=%d \n",offset);
			printf("                  cbufcnt%d \n",cbufcnt);
#endif
			while( (((cbufcnt-offset)-k) >= 0) )
			{
				if(cbuf[k] == '.' && ((cbufcnt-offset)-k) !=0)
				{
					pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
					lts_loop(&pipe_value);
#else
					write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
					pipe_value = (PFASCII << PSFONT) + 'd';
#ifdef SINGLE_THREADED
					lts_loop(&pipe_value);
#else
					write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
					pipe_value = (PFASCII << PSFONT) + 'o';
#ifdef SINGLE_THREADED
					lts_loop(&pipe_value);
#else
					write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
					pipe_value = (PFASCII << PSFONT) + 't';
#ifdef SINGLE_THREADED
					lts_loop(&pipe_value);
#else
					write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
					pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
					lts_loop(&pipe_value);
#else
					write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
					k++;
				}
				pipe_value = (PFASCII << PSFONT) + cbuf[k];
#ifdef SINGLE_THREADED
				lts_loop(&pipe_value);
#else
				write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
				k++;
#ifdef DEBUGPARS
				printf("CMD_PARS: sendat: sending1 %c %d \n",cbuf[k-1],c);
				printf("                           %d \n",k-1);
#endif                                  
				if(  ((cbufcnt-offset)-k) <=0 )
				{
					break;
				}
			}
			if(offset ==1)
			{
				pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
				lts_loop(&pipe_value);
#else
				write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
				/*              pipe_value = (PFASCII << PSFONT) + 0xb;
				write_pipe(KS.lts_pipe,&pipe_value,1);*/
			}
		}
		else if(pcnt>999 )
		{
			pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
			lts_loop(&pipe_value);
#else
			write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
			
			for(k=0;(cbufcnt)-k;k++)
			{
				if(cbuf[k] != '.')
				{
					pipe_value = (PFASCII << PSFONT) + cbuf[k];
#ifdef SINGLE_THREADED
					lts_loop(&pipe_value);
#else
					write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
				}
				
#ifdef DEBUGPARS
				printf("CMD_PARS: sendat: sending2 %c %d \n",cbuf[k],cbuf[k]);
#endif
				
			}
		}
		
		else if(isdigit == 1)
		{
			sendit();
		}
		else
		{
			for(k=0;(cbufcnt)-k;k++)
			{
				pipe_value = (PFASCII << PSFONT) + cbuf[k];
#ifdef SINGLE_THREADED
				lts_loop(&pipe_value);
#else
				write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
#ifdef DEBUGPARS
				printf("CMD_PARS: sendat: sending5 %c %d \n",cbuf[k],cbuf[k]);
#endif
			}
			pipe_value = (PFASCII << PSFONT) + ' ';
#ifdef SINGLE_THREADED
			lts_loop(&pipe_value);
#else
			write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
		}
		cbufcnt=0;
		
		return(1);
		
}

#endif