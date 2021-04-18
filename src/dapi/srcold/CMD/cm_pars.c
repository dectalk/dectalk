/************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000, 2001 Force Computers, Inc., a Solectron Company. All rights reserved.
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
 *    File Name:        cm_pars.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *   
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------
 * 001                          marking of $ so that it was not treated as punc
 * 002          05/21/1993      Now strips dashes in punc none. 
 * 003  cjl.    02/08/1995      Correct cbufcnt test in while loop
 * 004  tek     07/15/1995      hack with block()s..
 * 005  cjl     09/07/1995      Cleaned up debug printfs.
 * 006  gl      09/13/1995      Modify modechng to set earlier for date processing.
 * 007  cjl     09/15/1995      Shut off English pre-process for German too.
 * 008  cjl     09/15/1995      Revise non-English SAY_LETTER and bypass pre-proc text.
 * 009  cjl     09/27/1995      Control shut-off of punct processing with FIELD_TEST.
 * 010  jdb     10/17/1995      Remove french test condition from FIELD_TEST code.
 * 011  eab     01/28/1996      Added new clause parser and local language text rule
 *                                    parser. Abbrev lookup is done locally, only.
 *                                    Delete two code lines to return to old system.
 *                                    (see SAY_CLAUSE).
 * 012  cjl     02/05/1996      Move Span Abbrev[] and RULESET[] to cmd_tpre.h
 *                                    SPAN_TEXTPRE_BYPASS; bypass Spanish text pre-processing.
 * 013  gl      02/08/1996      add the patch to allow 0xaa and 0xba to go through.
 * 014  cjl     02/08/1996      remove FIELD_TEST control of punct processing.
 * 015  gl      02/15/1996      fix say_line problem.  Make sure CR/LF will not set to
 *                              space in the say_line mode.
 * 016  tek     02/21/1996      merge dtex
 * 017  tek     05/30/1995      remove flush interlock. 
 * 018  tek     05/30/1995      fix sleep in sync_char  
 * 019  tek     01/03/1996      merge with dtex. remove the eab 8/94
 *                              ^k -> [:sync] hack(s).
 * 020  sik     03/22/1996      Merge with win95 code.
 * 021  gl      04/03/1996      handle cmd_number same as cmd_count to fix the problem of setv command.
 * 022  MGS     04/23/1996      Added MSDOS #ifdefs for things forgotten by SIK
 * 023  MGS     05/16/1996      removed 2 if(lang_curr==LANG_spanish ||
 * 024  MGS     05/21/1996      SAY_WORD and SAY_LINE now both go through the preprocessor
 * 025  MGS     05/21/1996      Removed all the old text pre-processing rules
 * 026  SIK		07/16/1996      Cleaning up and maintenance 
 * 027  GL      07/30/1996      look for "]" for setting STATE_TOSS
 * 028  GL      08/01/1996      rollback some of escape sequence code int get_seq()
 * 029  MGS     08/02/1996      Added code for the new indexing in #ifdef NEW_INDEXING
 * 030  GL      08/22/1996      rollback to support the white space between "[" and ":" for state_brckert
 * 031  GL      08/30/1996      add PAR_INIT/PAR_INDEX_INIT for cmd_flushing
 * 032  GL      09/11/1996      add start_thread for debug window in WIN95
 * 033  GL      09/13/1996      change 0x9 to 0xb if the previous character is not
 *                                                              return(0xd) and 0x9
 * 034  SIK     09/23/1996      Add old CMD_PARS code to support the VOCAL build
 * 035  GL      10/25/1996      initialize the index_counter
 * 036  GL      10/29/1996      move the mode_table processing code to getclause()
 * 037  GL      11/07/1996      fix the DTEX [:index reply xx] and DTPC [:say letter] extra space
 *                                                              bug.
 * 038  GL      11/22/1996      fix the text logging problem
 * 039  GL      12/04/1996      add [:skip cpg] support to skip code page translation.
 * 040  GL      12/13/1996      call cm_util_flush_init() for text flush
 * 041  GL      02/06/1997      add email help entry in debug mode help menu
 * 042  GL      03/18/1997      For BATS#301
 *                              add #ifdef to block away the bolck() call for WIN32/VOCAL build
 * 043  GL      03/25/1997      For BATS#314
 *                              force SYNC after each control-K(oxb)
 * 044  GL      04/21/1997      BATS#357  Add the code for __osf__ build 
 * 045  GL      04/21/1997      BATS#360  remove spaces before "#define" or "#if" 
 * 046  GL      06/04/1997      BATS#382  posord need to initialized to zero in VOCAL mode 
 * 047  GL      06/04/1997      BATS#383  fix want2go problem in VOCAL mode 
 * 048  MGS     06/27/1997      BATS#397  increase consecutive whitespace check to 40
 *                              also move 001 debug switch to the right place.
 * 049  CL      06/25/1997      Move "#include <tts.h>" into WIN32 and _osf_ code block
 *                              to fix the process problem.
 * 050  GL      08/22/1997      For BATS#449, fix the Xerox Cash problem
 *                              skip the 0x80, 0x81, 0x82 and 0xff for WIN32 build.  This character will be
 *                              ignored in LTS but maintain in typing table.  The typing mode will
 *                              bypass CMD. So it should not be harmful to remove them here.
 * 051	MGS		08/22/1997		Added timing for parser debug switch 8100
 * 052	MFG		04/28/98		added dbglog.txt logging for debug switch[:debug 8001]
 * 053  MFG		05/19/98		exclude dbglog logging when build 16-bit code (MSDOS)	
 * 054	mfg		06/29/98		added LANG_latin_american and LANG_british conditional feedback
 * 055  ETT     05oct98         added linux code 
 * 056	MGS		11/09/1998		Added new debug code for tested rules
 * 057	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces 
 * 058	GL		12/17/1998		BATS#846 add say_fletter mode to skip control character 
 * 059	GL		01/13/1999		remove the dummy "if" in VOCAL area for 16 bits build
 * 060	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 * 061  CAB		10/13/2000		Fixed copyright
 * 062	MGS		02/08/2001		Fixed linux compiler/envrionment issue
 * 063	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 064	CAB		05/14/2001		Updated copyright info
 * 065	MFG		05/29/2001		Included dectalkf.h
 * 066	MGS		06/19/2001		Solaris Port BATS#972
 * 067	MGS		03/21/2002		Single threaded ph
 * 068	MGS		04/03/2002		Single threaded lts
 * 069	MGS		04/11/2002		ARM7 port
 * 070	CAB		07/30/2002		Condense __osf__ repeated code
 */

#include		"dectalkf.h"

#if defined (WIN32) && defined (PRINTFDEBUG)
#include                "dbgwins.h"
#endif 
#include        "cm_def.h"
#include        "pcport.h"
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined ARM7
extern void flush_done(PKSD_T);
#endif

/******************************** Old Code ********************************************/
#ifdef VOCAL

/*
 *      Function Name: cm_pars_loop()   
 *
 *      Description: Implements the command parser state machine; switches between text, command and phonemic data
 *      modes.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*                                move this variable to CMD_TAG area.  */
/* this should be OK since DTEX is a single thread application */
/*#ifdef DTEX*/     /* was this fixed in another way for DTPC?? (tek 2/21/96) */
/* unsigned int bracket_space;*/        /* tek 2/15/95 flag to keep the space that gets to
				 * process_char during a flush_numbers_on_[ from 
				 * actually getting into the LTS pipe.. serious hack.
				 * (merge 12/15) */
/*#endif*/ /*DTEX*/

#ifdef MSDOS
extern LPTTS_HANDLE_T phTTS;
void _far cm_pars_loop(void)
#else
void _far cm_pars_loop(LPTTS_HANDLE_T phTTS)
#endif
{
	/*
	int       i,j;                                     MVP Unreference variables
	DT_PIPE_T pipe_value;
 */
	short windbg_flag=0;
/****************************MVP MI New ***************************************/
	PCMD_T pCmd_t = NULL;
	PKSD_T pKsd_t = NULL; 
	char laschar=' ';        
	char cbuf[120];
	signed int cbufcnt=0;
	unsigned int pcnt=0;
	int isAdigit=1; 
	int sndtel=0;
	int modechng =0;
	/* GL 06/04/1997 BATS#382 need to initialized to zero */
	int posord = 0;
 /******************************************************************************/
	/* MVP : Add a variable for kernel share data and initialize it */
	pCmd_t = phTTS->pCMDThreadData;
	pKsd_t = phTTS->pKernelShareData;       

	pCmd_t->ParseChar =0;   /*MVP :Initialize here */ 
	
    cm_util_init_type(pKsd_t);
    
#ifdef DTEX
	OutputCharacter(XON);
#endif /*DTEX*/

	while (true)
	{

#if defined (WIN32) && defined (PRINTFDEBUG)
		/* open debug window for window environement */
		if ((windbg_flag == 0) && (pKsd_t->debug_switch != 0 || pKsd_t->logflag != 0))
		{
			WINstart_thread();
			windbg_flag = 1;
		}
#endif
		/* display debug switch manual once */
#ifndef ARM7_NOSWI
		if (pKsd_t->debug_switch == 0x8fff)
		{
			printf("CMD debug switch description:\n");
			printf("8001 -- Incoming data string  8002 -- Input to punct. rule engine\n");
			printf("8004 -- Punct. engine output  8008 -- Normal engine output\n");
			printf("8010 -- DTparser rule hit no  8020 -- DTparser dictionary HIT/MISS\n");
			printf("8040 -- Input to email engine 8080 -- Email engine output\n");
			printf("8100 -- Parser timing         8200 -- Dtparser rules tested\n");
			printf("8400 -- not used              8800 -- drain data before write_pipe\n");
						
			/* reset to 0 again */
			pKsd_t->debug_switch = 0;
		}
#endif

/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*#ifdef DTEX*/ /* see comment above at declaration of bracket_space.. */
		pCmd_t->bracket_space = FALSE;
/*#endif*/ /*DTEX*/
		
		pCmd_t->last_char = pCmd_t->ParseChar;
		if (pCmd_t->insertflag == 2)  /*pCmd_t->insertflag = 2 time to do it*/
		{
			pCmd_t->ParseChar = cm_pars_icommand(pCmd_t);
		}
		else
		{
			pCmd_t->ParseChar = cm_pars_getseq(phTTS); /* parsing internally stored string*/
		}

		/* debug switch */
		if (DT_DBG(CMD_DBG,0x001))
		{
#ifndef ARM7_NOSWI
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt suport*/
			fprintf(pKsd_t->dbglog,"\nCMD input:%c(%x)",pCmd_t->ParseChar,pCmd_t->ParseChar);
#endif
			printf("\nCMD input:%c(%x)",pCmd_t->ParseChar,pCmd_t->ParseChar);
#endif
		}

#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: First Char: char = %c %d insert= %d \n",pCmd_t->ParseChar,pCmd_t->ParseChar,pCmd_t->insertflag);
#endif
		if ((pCmd_t->last_char == '.') && (pCmd_t->ParseChar ==','))/* rule to handle e.g.,*/
		{
			pCmd_t->ParseChar=0xb;
		}
		switch (pCmd_t->parse_state)
		{
			case STATE_NORMAL:
				pCmd_t->cmd_index = 0xffff;
				if (pCmd_t->ParseChar == '[')
				{
					if (laschar != ' ')
					{   
						
						pCmd_t->ParseChar=' ';  
/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*#ifdef DTEX*/
						pCmd_t->bracket_space = TRUE;
/*#endif*/ /*DTEX*/
						cm_pars_proc_char(phTTS, pCmd_t->ParseChar, cbuf,
									&cbufcnt,&pcnt,&isAdigit,
									&sndtel,&modechng,&posord,laschar);/*eab put a space to flush things out5/94*/

/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*#ifdef DTEX*/
						pCmd_t->bracket_space = FALSE;
/*#endif*/ /*DTEX*/                                             

					}
					if ((pKsd_t->lang_curr == LANG_french) || 
						(pKsd_t->lang_curr == LANG_spanish) ||
						(pKsd_t->lang_curr == LANG_latin_american) ||
						(pKsd_t->lang_curr == LANG_german))
					{
						pCmd_t->ParseChar=0xff;
						cm_pars_proc_char(phTTS, pCmd_t->ParseChar, cbuf,
									&cbufcnt,&pcnt,&isAdigit,
									&sndtel,&modechng,&posord,laschar);
					}

					cm_util_sendat(phTTS, cbuf, &cbufcnt,
						&pcnt, &isAdigit, &sndtel,
						&modechng, posord,laschar);     
					/*      
								 *      eab 2/29/95 had to move cm_util_sendat out of space
								 *      test because space doesn't insure that numbers get flushed
								 *      if cbufcnt is zero(everything sent ) it will simply
								 *      return 0. 
								 */
					modechng=1;
					pCmd_t->ParseChar = '[';
					cm_pars_new_state(pCmd_t, STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_NORMAL->STATE_BRACKET\n");
#endif
					laschar=pCmd_t->ParseChar;
				}
				else
				{
					cm_pars_proc_char(phTTS, pCmd_t->ParseChar, cbuf,
									&cbufcnt,&pcnt,&isAdigit,
									&sndtel,&modechng,&posord,laschar);
				}
					laschar = pCmd_t->ParseChar;
				break;

/*
 *  this is the hard state, either enter command mode, phonemic mode,
 *  start tossing text or go back to the normal pass all state ...
 */
 

			case STATE_BRACKET:
				switch (pCmd_t->ParseChar) 
				{
					case ':':
						cm_cmd_reset_comm(pCmd_t, STATE_COMMAND);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_BRACKET->STATE_COMMAND\n");
#endif
						break;

					case ']':
						if (pCmd_t->insertflag == 1)
						{
							pCmd_t->insertflag=2;   /*time to insert*/
						}

						cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_BRACKET->STATE_NORMAL\n");
#endif
						break;

					case'[':
						cm_pars_proc_char(phTTS, '[', cbuf,
									&cbufcnt,&pcnt,&isAdigit,
									&sndtel,&modechng,&posord,laschar);
						break;

					case '\t':
					case ' ':
					case CR:
					case LF:
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Dumping white space\n");
#endif
						break;

					default :

						if (pKsd_t->phoneme_mode & PHONEME_OFF)
						{
							if (pCmd_t->cmd_index == 0xffff)
							{
								cm_pars_proc_char(phTTS, '[', cbuf,
											&cbufcnt,&pcnt,&isAdigit,
											&sndtel,&modechng,&posord,laschar);
								cm_pars_proc_char(phTTS, pCmd_t->ParseChar, cbuf,
											&cbufcnt,&pcnt,&isAdigit,
											&sndtel,&modechng,&posord,laschar);
								cm_pars_new_state(pCmd_t, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_BRACKET->STATE_NORMAL\n");
#endif
							}
							else
							{
								cm_cmd_error_comm(phTTS, CMD_bad_command);
								cm_pars_new_state(pCmd_t, STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_BRACKET->STATE_TOSS\n");
#endif
							}
						}
						else
						{
							cm_pars_new_state(pCmd_t, STATE_PHONEME);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_BRACKET->STATE_PHONEME\n");
#endif
							cm_phon_match(phTTS, pCmd_t->ParseChar);
						}
				}       /* switch (c) */
				break;  /* case STATE_BRACKET: */

/*
 *  process a phoneme ...
 */

			case STATE_PHONEME:
				cm_phon_match(phTTS, pCmd_t->ParseChar);
				break;

/*
 *  process a command ...
 */

			case STATE_COMMAND:
				cm_cmd_match_comm(phTTS, pCmd_t->ParseChar);
				if(pCmd_t->ParseChar == ']') 
				{
					modechng=0; /* Fix flag for ] 09/13/95 gl */
				}
				break;
/*
 *  get a parameter string ...
 */

			case STATE_PARAM:

				cm_cmd_build_param(phTTS, pCmd_t->ParseChar);
				break;

/*
 *  toss out all further text until we see an end delimator ...
 */
			case STATE_TOSS:

				if(pCmd_t->ParseChar == ']')
				{
					if(pCmd_t->insertflag == 1)
					{
						pCmd_t->insertflag=2;   /*time to insert*/
					}
		}
				cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_TOSS->STATE_NORMAL\n");
#endif
				break;

		} /* end switch(pCmd_t->parse_state) */
	} /* end while(true) */
} /* end cm_pars_loop() */

/*
 *      Function Name: cm_pars_proc_char()      
 *
 *      Description: is called when there is a character that needs to
 *  be potentially flushed to lts ...
 *
 *      Arguments:  LPTTS_HANDLE_T phTTS,unsigned int c, 
 *                                              char *cbuf,int *cbufcnt,
 *                                              int *pcnt,int *isAdigit,
 *                                              int *sndtel,int *modechng,
 *                                              int *posord, char laschar
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
static void cm_pars_proc_char(LPTTS_HANDLE_T phTTS,unsigned int c, 
						char *cbuf,int *cbufcnt,
						int *pcnt,int *isAdigit,
						int *sndtel,int *modechng,
						int *posord, char laschar)
/*unsigned int c;*/
{
	/* int i, j, k;  */           /* MVP :Unreferenced variables */
	DT_PIPE_T pipe_value;
	/********************MVP MI New***************************************************/
	/*static unsigned int pCmd_t->lpchar =0;*/      /*last punctuation mark processed*/       
	/*static unsigned int pCmd_t->dcnt = 0;*/       /* number of dashs processed */
	/*static int pCmd_t->digcnt=0;*/
	/*static int pCmd_t->postel=0;*/
    /*static char pCmd_t->heldchar[2]; */
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	/*********************************************************************************/
	if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
	{
		*isAdigit=1; /*flushing so reiinit everything*/
		*sndtel=0;
		pCmd_t->digcnt=0;
		pCmd_t->postel=0;
		pCmd_t->last_punct=0;
		pCmd_t->last_char=0;
		pCmd_t->lpchar=0;
		*pcnt=0;
		*cbufcnt=0;
		cbuf[1]=0;
		cbuf[2]=0;
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: pKsd_t->text_flush or CMD_flush_toss\n");
#endif
		return;
	}
		/* ...tek try to get rid of the dreaded pause.. */
	if(char_types[c] & (MARK_space | MARK_clause))
	{
	/* GL 03/18/1997 BATS#301 to allow DECtalk software build the VOCAL mode */
#ifdef MSDOS
		block(NULL_FP); /* run a sched pass on spaces. */
#endif
	}
	switch(c)       
	{

/*
 *  ST acts as a left brace ...
 */

		case ST:
			cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: ST->STATE_NORMAL\n");
#endif
			return;

		default:

#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default case of switch(%c)\n",c);
#endif
					/*****HACK ALERT*** This is a hack for now
						with foreign languages to force punc pass until we re-architect
						the text pre-pro for multi-language*/
/*  09/15/95 cjl SAY_LETTER command test replaced for local_languages. */
/*      09/27/95 cjl FIELD_TEST defined also disables [:PUNCT command for */
/*                                      non_English languages in cmd_cmd.c. */
/*  02/08/96 cjl FIELD_TEST condition removed. */

					if (( pKsd_t->lang_curr == LANG_french)|| 
						(pKsd_t->lang_curr == LANG_spanish)||
						(pKsd_t->lang_curr == LANG_latin_american)||
						(pKsd_t->lang_curr == LANG_german))
					{

#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: French, Spanish, German.\n");
#endif
/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*#ifdef DTEX*/
						//tek 2/15/95: OK, if we finally get here, and we're
						// trying to flush things out with bracket_space, and this 
						// is a space, just punt.
						/* GL 12/17/1998 BATS#846 say_fletter to skip control character */
						if (((pKsd_t->sayflag == SAY_LETTER) || (pKsd_t->sayflag == SAY_FLETTER)) &&
							pCmd_t->bracket_space && (c == ' ') )
						{
							break; /* don't send this 'flushing' space to lts! */
						}
/*#endif*/ /*DTEX*/
			/*Text preprocessing and getting clause boundary only done
				with say_clause assumption being that in say word etc you
				want all the gory details --nothing thrown away*/
						switch(pKsd_t->sayflag)
						{
							case SAY_CLAUSE:
	/*eab 1/95 delete next two lines and your back to the old cmd_pars*/
#ifndef SPAN_TEXTPRE_BYPASS
								cm_text_getclause(pCmd_t);
							/* GL 03/25/1997 BATS#314 change to break to force the SYNC */
								break;
#endif
							case SAY_SYLLABLE:
							
							    /* GL 10/8/1996, don;t send 0xff through pipe */
							    if (c == 0xff) c = ' ';
							    
								pipe_value = (PFASCII<<PSFONT)+c;
								cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
								break;

							case SAY_WORD:

/*
   allow 0xba and 0xaa to go through, since these characters may show up in Spanish
   dictionary.  Other language should be o.k.   GL  2/8/96
*/
								if(((char_types[c] & (MARK_vowel|MARK_cons|MARK_digit)) == false) &&
				  (c != 0xaa && c != 0xba))
								{
									pipe_value = (PFASCII<<PSFONT)+0xb;
									cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
								}
								pipe_value = (PFASCII<<PSFONT)+c;
								cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
								break;
	
							case SAY_LETTER:
								cm_util_type_out(phTTS, c);
								break;

							/* GL 12/17/1998 BATS#846 say_fletter to skip control character */
							case SAY_FLETTER:
								if (c >= 32) cm_util_type_out(phTTS, c);
								break;

							case SAY_LINE:
								if (c == CR || c == LF)
								{
									c = 0xb;
								}
								pipe_value = (PFASCII<<PSFONT)+c;
								cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
								break;
							}
					/* GL 03/25/1997 BATS#314 force SYNC after 0xb */
							if(c == 0xb)
							{
								pipe_value = SYNC;
								cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
							}
							return;
					}       /*  
						 *      End of turn off PUNCT_* commands.
						 *      if (( pKsd_t->lang_curr == LANG_french)|| 
						 *      (pKsd_t->lang_curr == LANG_spanish)||
						 *      (pKsd_t->lang_curr == LANG_german))
						 */
/* #endif for removed FIELD_TEST #ifdef removed. */
/*
   allow 0xba and 0xaa to go through, since these characters may show up in Spanish and English
   dictionary.  Other language should be o.k.   GL  2/8/96
*/
		    if (((char_types[c] & (MARK_vowel|MARK_cons|MARK_digit)) == 0) &&
			(c != 0xb) && (c != 0xaa) && (c != 0xba) && (c != CR) && (c != LF))
					{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: MARK_vowel|cons|digit\n");
#endif
/*
 *  PUNCT_none, passes {.,?!'}, but folds multiples of them and turns all others
 *  into white space ...
 */


						switch(pCmd_t->punct_mode)
						{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: switch(pCmd_t->punct_mode): PUNCT_some or PUNCT_none\n");
#endif
							case PUNCT_some:
							case PUNCT_none:
								if (c =='.')
								{
									(*pcnt)++;                              /* number of periods seen in this parse */
									if(pCmd_t->last_char == '.')    /* assume xxx.....yyyyy and force pron */
									{
										(*pcnt)=1000;
									}
								}
								if(c == '-')
								{
									pCmd_t->dcnt++;
								}
								if ((c == '"') || 
									((pCmd_t->last_char == c) && (pCmd_t->last_punct == c) &&  ((char_types[c] & MARK_space) == 0)))
								{
									return;
								}
								
								
								if (char_types[c] & MARK_clause)
								{
									pCmd_t->lpchar=c;
									pCmd_t->last_punct = c;
								}
								else      
								{      
									
									pCmd_t->last_punct = ' ';
									if( (c!='/' && (pKsd_t->modeflag & MODE_MATH) == 0) ||  ((c=='/') && (pCmd_t->last_char < '0')) ||  ((c== '/') && (pCmd_t->last_char > '9') )  )
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
								if(pKsd_t->sayflag & SAY_LETTER)
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: switch(pCmd_t->punct_mode): PUNCT_pass cm_util_type_out(pKsd_t, %c) \n",c);
#endif
									cm_util_type_out(phTTS, c);
								}
								else
								{
									/* GL 12/17/1998 BATS#846 say_fletter to skip control character */
								    if(pKsd_t->sayflag & SAY_FLETTER)
									{
										if (c >= 32) cm_util_type_out(phTTS, c);
									}
									else
									{
#ifdef DEBUGPARS			
		printf("CMD_PARS: cm_pars_proc_char: Default: switch(pCmd_t->punct_mode): PUNCT_pass sending %c \n",c);
#endif
									pipe_value = (PFASCII<<PSFONT)+c;
									cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
								
									}
								}
								return;

							case PUNCT_all:
						
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: switch(pCmd_t->punct_mode): PUNC_all write_all\n");
#endif
								pipe_value = (PFASCII<<PSFONT)+' ';
								cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
								pipe_value = (PFASCII<<PSFONT)+c;
								cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
								if(char_types[c] & MARK_clause)
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: switch(pCmd_t->punct_mode): PUNC_all sending MARK_clause %c\n",c);
#endif

									pipe_value = (PFASCII<<PSFONT)+0xb;
									cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
								}
								
								c = ' ';
						} /* end switch(pCmd_t->punct_mode) */  

					}       /* 
						 *      if (((char_types[c] & (MARK_vowel|MARK_cons|MARK_digit)) == 0) &&
			     *          (c != 0xb) && (c != 0xaa) && (c != 0xba) && (c != CR) && (c != LF))
			     */
					else
					{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: NOT MARK_vowel|cons|digit\n");
#endif

						if (pCmd_t->punct_mode ==PUNCT_pass)
						{
							if (pKsd_t->sayflag & SAY_LETTER)
							{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: PUNCT_pass cm_util_type_out(%c) \n",c);
#endif
								cm_util_type_out(phTTS, c);
							}
							else
							{

								/* GL 12/17/1998 BATS#846 say_fletter to skip control character */
								if (pKsd_t->sayflag & SAY_FLETTER)
								{
									if (c >= 32) cm_util_type_out(pnTTS_t, c);
								}
								else
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: Not PUNCT_pass: sending(%c)\n",c);
#endif

								pipe_value = (PFASCII<<PSFONT)+c;
								cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
							
								}
							}
							return;
						}


#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: PUNC_all into switch: c= %c  %d lpunct= %c pCmd_t->last_char = %c \n",c,c,pCmd_t->last_punct,pCmd_t->last_char);
	printf("                                                                 %d\n",(char_types[c] & MARK_digit));
#endif
						/*      prcnt++; */      /* MVP not used anywhere commented out */
						
						if(pCmd_t->parse_state != STATE_NORMAL  || pCmd_t->punct_mode == PUNCT_all )
						{
							goto skipit; /*Don't process periods etc if not normal*/
						}

						if( pCmd_t->last_char == '-' && pCmd_t->last_punct == '-' && *isAdigit == 2 && (pKsd_t->modeflag & MODE_MATH) == 0 )
						{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char STATE_NORMAL: in dash code\n");
#endif                          

							if ( c != ' ' || (pCmd_t->dcnt == 1) )          /* to send compound noun */
							{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: STATE_NORMAL: 6sending %c \n",pCmd_t->last_punct);
#endif

								pipe_value = (PFASCII<<PSFONT)+pCmd_t->last_punct;
								cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: STATE_NORMAL Case: sending dash from dash proc code\n");
#endif
							}
							else
							{   
							
								pipe_value = (PFASCII<<PSFONT)+' ';
								cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: STATE_NORMAL: sending space for dash from dash code\n");
#endif


							}
						}
					} /* end else */
				/* EAB handle word.txt */
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: pCmd_t->lpchar at point = %c %d \n",pCmd_t->lpchar,pCmd_t->lpchar);
		printf("                        c= %c pCmd_t->last_char = %c %d isdi= %d\n",c,pCmd_t->last_char,pCmd_t->last_char,isAdigit);
#endif
				
					/* GL 12/17/1998 BATS#846 say_fletter to skip control character */
					if (!(pKsd_t->sayflag & SAY_LETTER) && !(pKsd_t->sayflag & SAY_FLETTER))
					{
						if((*cbufcnt) != 0 && (*isAdigit) == 1)
						{
							if((pKsd_t->modeflag & MODE_EUROPE) && 
								((pCmd_t->last_char == '.') || 
								 (pCmd_t->last_char == ',')))
							{
								if(c >= '0' && c <= '9')
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: parse_char: switching period and comma mode Europe. \n");
#endif
									if (pCmd_t->last_char==',')
									{
										pCmd_t->lpchar='.';
										pCmd_t->last_char ='.';
										cbuf[(*cbufcnt)-1]='.';
									}
									else
									{
										pCmd_t->lpchar=',';
										pCmd_t->last_char == ',';
										cbuf[(*cbufcnt)-1]=',';
									}
								}
							}
									
							if((*posord == 0) && (*pcnt == 0))
							{
								if(c == 'n' || c == 't' ||c == 'r'|| c == 's')
								{
									*posord=1;
									pCmd_t->heldchar[0]=c;
									goto ndone;
								}
							}
						}


/* If anything shows up that makes it not a digit then clear flag.*/                                    
						if(( *isAdigit == 1 && ((char_types[pCmd_t->last_char] & (MARK_digit | MARK_space | MARK_clause)) == 0) ||
							(char_types[c] & (MARK_digit | MARK_space | MARK_clause) ) == 0 ) || (*posord == 1 ) )
						{

							/*
							 * if chars has been proc they need to be sent                                        
							 * but we may need to wait if os ordinal
							 */
							if((*cbufcnt) !=0 &&  (*isAdigit) == 1)
							{                                                                          
								if (*posord == 1 )
								{
									pCmd_t->heldchar[1]==c;  
									
									if(c == 'd' ||c == 'h' ||c == 'd' || c == 't')
									{
										*posord=2;
									}
								}
							/*  
							 * xxxx in redundantly
							 * fixes some funny pronunciation problems chould be in v4.2b rel
			     */
							/* GL 06/04/1997 for BATS#383 fix want2go problem */
							/* by change cbuf[(*cbufcnt)-2] to cbuf[(*cbufcnt)-1] */
								if ((*posord == 0) && (char_types[c] & (MARK_digit | MARK_space | MARK_clause)) || 
									(char_types[cbuf[(*cbufcnt)-1]] && MARK_digit))
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: sending with cm_util_sendit\n");
#endif


									cm_util_sendit(phTTS,cbuf,cbufcnt,sndtel,modechng,*posord,laschar);
								}
						
								if(*posord > 0)
								{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: writing pCmd_t->heldchar 0 %c\n",pCmd_t->heldchar[0]);
#endif
									pipe_value = (PFASCII<<PSFONT)+pCmd_t->heldchar[0];
									cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);


									if(*posord == 2)
									{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: writing pCmd_t->heldchar 1 %c \n",pCmd_t->heldchar[1]);
#endif

										pipe_value = (PFASCII<<PSFONT)+pCmd_t->heldchar[1];
										cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
									}
								}
								else
								{
									*isAdigit=0;
								}


								*posord=0;
								*cbufcnt=0;
								cbuf[0]=0;
								cbuf[1]=0;

							}       /* if(cbufcnt !=0 &&  isAdigit == 1) */
							if(c!=(0xb || 0x11))    /* if not a forcing set it to non-digit*/
							{
								*isAdigit=2;
							}
							pCmd_t->postel=0;
							*sndtel=0;
							pCmd_t->digcnt=0;
							
						}       /* 
							 * End of if(( isAdigit == 1 && ((char_types[pCmd_t->last_char] & (MARK_digit | MARK_space | MARK_clause)) == 0) ||
							 *      (char_types[c] & (MARK_digit | MARK_space | MARK_clause) ) == 0 ) || (posord == 1 ) )
			     */
			     
					}               /* End of if (!(pKsd_t->sayflag & SAY_LETTER)) */
					
			/* If we get a digit in a text string break it out with a space*/
			   
					if ((*isAdigit == 2) && 
						(nchar_types[c] & MARK_digit)
						&& (c != ')'&& c !='(' ) > 0 
						&& (pKsd_t->modeflag & MODE_MATH) == 0)
					{
/* New code to process dash numbers 09/13/95 gl*/
					  if (laschar != '-')
					  { 
						
					    *isAdigit=1;
					    pipe_value = (PFASCII<<PSFONT)+' ';
					    cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Write_Pipe: Breaking out number with a space. \n");
#endif
					  }
					  else
					  {
					    *isAdigit = 3;
					  }
					}
/**/

					/* GL 12/17/1998 BATS#846 say_fletter to skip control character */
					if(!(pKsd_t->sayflag & SAY_LETTER) && !(pKsd_t->sayflag & SAY_FLETTER))
					{
						if ((pCmd_t->lpchar == '.') || ((*cbufcnt) >= 115) || (*isAdigit == 1) ||
			    ((pKsd_t->sayflag == SAY_LINE) && (c != CR) && (c != LF)))
						{
							if ((*cbufcnt) >=115)
							{
								cm_util_sendat(phTTS,cbuf,cbufcnt,pcnt,isAdigit,sndtel,modechng,*posord,laschar);
							}
							cbuf[(*cbufcnt)++] = c;
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: INTO period and number processin\n");
		printf("CMD_PARS: cm_pars_proc_char: cbufcnt= %d cbuf[cnt-1]=%c %d \n",*cbufcnt,cbuf[(*cbufcnt)-1],cbuf[(*cbufcnt)-1]);
		printf("CMD_PARS: cm_pars_proc_char: cbufcnt= %d cbuf[0]=%c %d \n",cbufcnt,cbuf[0],cbuf[0]);
		printf("CMD_PARS: cm_pars_proc_char: isdig %d  char-t %d\n",isAdigit,char_types[c]);
#endif  
					
							if (char_types[c] & MARK_clause  && pCmd_t->postel == 1 && pCmd_t->digcnt == 4)
							{       
								*sndtel=1;
							}
							if ((((char_types[c] & MARK_clause) == 0) || (c=='-')) && 
								!((*isAdigit == 1) && (pCmd_t->last_char == ',') && (c == ' ')) &&  
								(pCmd_t->lpchar != '.'))
							{
								if((c == ' ') || (c == '-'))
								{
									if(pCmd_t->digcnt == 3)
									{   
										
										c=' ';
										cbuf[(*cbufcnt)-1]=c;
										pCmd_t->postel=1; /* possible tel number coming*/
										*sndtel=0;
									}
									if(pCmd_t->postel == 1 && pCmd_t->digcnt == 4 && *sndtel != 1)
									{
										*sndtel=1;
										pCmd_t->postel=0;
									}
									pCmd_t->digcnt=0;
								}
								if(c >= '0' && c <= '9')
								{
									pCmd_t->digcnt++;
								}
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: pCmd_t->digcnt = %d sndtel = %d pCmd_t->postel = %d \n",pCmd_t->digcnt,sndtel,pCmd_t->postel);
#endif

								goto ndone;
							}
							if (((char_types[c] & MARK_space) == 0) && 
								(c != '-' && pCmd_t->digcnt != 3) ||
								((c == '.') && (*sndtel == 1)) || ((pCmd_t->digcnt >= 1) && ((c == ',')  ||
								 (c== '.'))))
							{
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: breaking \n");
#endif

								goto ndone; /*keep processkng tkl we get a space. char*/
							}
							cm_util_sendat(phTTS,cbuf,cbufcnt,pcnt,isAdigit,sndtel,modechng,*posord,laschar);
							*isAdigit=1; /*assume it's a digit unless we find otherwise*/
							*sndtel=0;
							pCmd_t->digcnt=0;
							pCmd_t->postel=0;
							pCmd_t->last_punct=0;
							pCmd_t->lpchar=0;
							*pcnt=0;
							*cbufcnt=0;
							cbuf[1]=0;
							cbuf[0]=0;
							goto ndone;
						} /*
						   * End of if ((pCmd_t->lpchar == '.') || (cbufcnt >= 115) || (isAdigit == 1) ||
			   *                    ((pKsd_t->sayflag == SAY_LINE) && (c != CR) && (c != LF)))
						   */
					}       /* End of if(!(pKsd_t->sayflag & SAY_LETTER)) */


					/* GL 12/17/1998 BATS#846 say_fletter to skip control character */
					if (((c == '.') || (c == '-') && (pKsd_t->modeflag & MODE_MATH) == 0) && 
						(pKsd_t->sayflag != SAY_LETTER) && (pKsd_t->sayflag != SAY_FLETTER))
					{
						ndone: break; /*handle period and dash later by code above*/
					}
					pCmd_t->postel=0;
					*sndtel =0;
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: sending %c %d \n",c,c);
#endif
skipit:                 cm_util_sendat(phTTS,cbuf,cbufcnt,pcnt,isAdigit,sndtel,modechng,*posord,laschar);


					*cbufcnt=0;
					if (char_types[c] & MARK_space)
					{
						*isAdigit=1;
					}
					*modechng=0;
					*pcnt=0;
					cbuf[1]=0;  


/* GL 11/07/1996, fix the DTEX [:index reply xx] DTPC [:say letter] bug */
/*#ifdef DTEX*/
				//tek 2/15/95: OK, if we finally get here, and we're
				// trying to flush things out with bracket_space, and this 
				// is a space, just punt.
					/* GL 12/17/1998 BATS#846 say_fletter to skip control character */
					if (((pKsd_t->sayflag == SAY_LETTER) || (pKsd_t->sayflag == SAY_FLETTER)) &&
						pCmd_t->bracket_space && (c == ' ') )
					{
						break; /* don't send this 'flushing' space to lts! */
					}
/*#endif*/ /*DTEX*/
					switch(pKsd_t->sayflag)
					{
						case SAY_CLAUSE:
						case SAY_SYLLABLE:
							pipe_value = (PFASCII<<PSFONT)+c;
							cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
							break;

						case SAY_WORD:

							if((char_types[c] & (MARK_vowel|MARK_cons|MARK_digit)) == false)
							{
								pipe_value = (PFASCII<<PSFONT)+0xb;
								cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
							}
							pipe_value = (PFASCII<<PSFONT)+c;
							cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
							break;
	
						case SAY_LETTER:
							cm_util_type_out(phTTS, c);
							break;
						/* GL 12/17/1998 BATS#846 say_fletter to skip control character */
						case SAY_FLETTER:
							if (c >= 32) cm_util_type_out(phTTS, c);
							break;

						case SAY_LINE:

							if(c == CR || c == LF)
							{
								c = 0xb;
							}
							pipe_value = (PFASCII<<PSFONT)+c;
							cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
							break;
					}
					break;
#ifdef NEVERDEFINED
/* eab added a sil send  to flush indexs*/
	oops ofrgot to remove from earlier stuff
#endif
	}       /* End of switch (c) */

    /* GL 03/25/1997 BATS#314 force SYNC after 0xb */
	/* tek 3/12 */
	/* as a last gasp, make sure that the single-char sync */
	/* really gets to LTS.. */
	if(c == 0xb)
	{
		pipe_value = SYNC;
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
	}
}

/*
 *      Function Name: cm_pars_new_state()      
 *
 *      Description: Transition the parse state machine to either STATE_NORMAL,                              
 * STATE_BRACKET, STATE_COMMAND, STATE_PHONEME, STATE_PARAM,
 * STATE_TOSS, or STATE_KEEP and reset the parameter
 * counts.
 *
 *      Arguments: PCMD_T pCmd_t, int state
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void cm_pars_new_state(PCMD_T pCmd_t, int state)
{

/*
 *  if we're accepting parameters and we're there now, bump and clear
 *  pointers ...
 */

	pCmd_t->p_count = 0;
	pCmd_t->cmd_p_flag = 0;

#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_new_state:\n");
#endif
	if(state == STATE_PARAM && pCmd_t->parse_state == STATE_PARAM)
	{
		(pCmd_t->param_index) += 1;
    }
	if(state == STATE_TOSS && pCmd_t->last_char == ']')
	{
		if(pCmd_t->insertflag == 1)
		{
			pCmd_t->insertflag=2;   /*time to insert*/
		}

		pCmd_t->parse_state = STATE_NORMAL;
	}
	else
	{
		pCmd_t->parse_state = state;
    }
}


/******************************** End Old Code ****************************************/

#else  /* Use new DTParser */

#if defined (WIN32) && defined (PRINTFDEBUG) && defined _DEBUG
extern int Thread_Alive;
extern int in_winmain;
#endif

/*set debug printing on */
/*#define DEBUGPARS 1   */
/*#define DEBUGRULS     */
/*#define DEBUGACT     1*/
/*#define DEBUGIND      */
/*#define SHOWRULES     */

/*
 *      Function Name: cm_pars_loop()   
 *
 *      Description: Implements the command parser state machine; switches between 
 *                                       text, command and phonemic data modes.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
#ifdef MSDOS
extern LPTTS_HANDLE_T phTTS;
void _far cm_pars_loop(void)
#else
void _far cm_pars_loop(LPTTS_HANDLE_T phTTS)
#endif
{
	PCMD_T pCmd_t = 0;
	PKSD_T pKsd_t = 0; 
#ifndef ARM7
	short   ws_count=0;             /* consecutive count for white space */
	unsigned short temp;
#endif
#if defined (WIN32) && defined (PRINTFDEBUG)
	short windbg_flag=0;
#endif

	/* MVP : Add a variable for kernel share data and initialize it */
	pCmd_t = phTTS->pCMDThreadData;
	pKsd_t = phTTS->pKernelShareData;       

	pCmd_t->ParseChar =0;   /*MVP :Initialize here */ 
	
	cm_util_init_type(pKsd_t);
	
#ifdef DTEX
	OutputCharacter(XON);
#endif /*DTEX*/

#ifdef ARM7
}

int cmd_loop(LPTTS_HANDLE_T phTTS, unsigned char input)
{
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	PKSD_T pKsd_t = phTTS->pKernelShareData;       
	short   ws_count=0;             /* consecutive count for white space */
	unsigned short temp;
#endif

#ifndef ARM7
	while (TRUE)
#endif
	{

#if defined (WIN32) && defined (PRINTFDEBUG)
		/* open debug window for window environement */
		if ((Thread_Alive == 0) && (in_winmain==0) && (pKsd_t->debug_switch != 0 || pKsd_t->logflag != 0))
		{
			WINstart_thread();
		}
#endif
#ifndef ARM7_NOSWI
		/* display debug switch manual once */
		if (pKsd_t->debug_switch == 0x8fff)
		{
			printf("CMD debug switch description:\n");
			printf("8001 -- Incoming data string  8002 -- Input to punct. rule engine\n");
			printf("8004 -- Punct. engine output  8008 -- Normal engine output\n");
			printf("8010 -- DTparser rule hit no  8020 -- DTparser dictionary HIT/MISS\n");
			printf("8040 -- Input to email engine 8080 -- Email engine output\n");
			printf("8100 -- Parser timing         8200 -- not used\n");
			printf("8400 -- not used              8800 -- drain data before write_pipe\n");
						
			/* reset to 0 again */
			pKsd_t->debug_switch = 0;
		}
#endif
		pCmd_t->last_char = pCmd_t->ParseChar;
		if (pCmd_t->insertflag == 1)  /* Time to process internally stored command string */
		{
			pCmd_t->ParseChar = cm_pars_icommand(pCmd_t); /* parsing internally stored string */
		}
		else
		{
#ifdef ARM7
      if (input == 0xff ||
	  input == PAR_PHONES_ON_D ||
	  input == PAR_PHONES_OFF_D ||
	  input == PAR_INDEX_DUMMY_CHAR)
		return 0;
			pCmd_t->ParseChar = input;
			//cm_pars_getseq(phTTS); 
#else
			pCmd_t->ParseChar = cm_pars_getseq(phTTS);
#endif
		}
		
		/* debug switch */
	  	if (DT_DBG(CMD_DBG,0x001))
		{
#ifndef ARM7_NOSWI
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt suport*/
			fprintf((FILE *)pKsd_t->dbglog,"\nCMD input:%c(%x)",pCmd_t->ParseChar,pCmd_t->ParseChar);
#endif
			printf("\nCMD input:%c(%x)",pCmd_t->ParseChar,pCmd_t->ParseChar);
#endif
		}

		/* try to flush data for TAB, GL. 9/13/1996     */
		/* hack for the table reading                           */
		/* it should take care of regular text with leading TAB */
		/* MGS 06/27/1997  BATS#397 increase the number to 40 */
		/* force to flush if see too many consecutive whitespace */
		if ((char_types[pCmd_t->ParseChar] & MARK_space)!=0 && (char_types[pCmd_t->last_char] & MARK_space)!=0)
		{
			ws_count++;
			if (ws_count > 40)
			{
				pCmd_t->ParseChar = 0xb;
				ws_count = 0;
			}
		}
		else
			ws_count = 0;
					

#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: First Char: char = %c %d insert= %d \n",pCmd_t->ParseChar,pCmd_t->ParseChar,pCmd_t->insertflag);
#endif
		switch (pCmd_t->parse_state)
		{
			case STATE_NORMAL:
				pCmd_t->cmd_index = 0xffff;
				if (pCmd_t->ParseChar == '[')
				{
#ifndef NEW_INDEXING    
						/* dont do this now for the new indexing */                             
						pCmd_t->ParseChar=0x0fff;
						cm_pars_proc_char(phTTS, ' ');
						pCmd_t->ParseChar = '[';
#endif
     
					cm_pars_new_state(pCmd_t, STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_NORMAL->STATE_BRACKET\n");
#endif
				}
				else
				{
					cm_pars_proc_char(phTTS, pCmd_t->ParseChar);
				}
				break;

			/*
			 *  this is the hard state, either enter command mode, phonemic mode,
			 *  start tossing text or go back to the normal pass all state ...
			 */
 

			case STATE_BRACKET:
				switch (pCmd_t->ParseChar) 
				{
					case ':':
// 
// 8/22/96, GL, rollback to support the white space between "[" and ":"
//                      since some of screen reader use the illegal format
//                                              if (pCmd_t->last_char == '[')
							cm_cmd_reset_comm(pCmd_t, STATE_COMMAND);
//                                              else
//                                              {
//                                                      temp = pCmd_t->ParseChar;
//                                                      pCmd_t->ParseChar = '[';
//                                                      cm_pars_proc_char(phTTS, '[');
//                                                      pCmd_t->ParseChar = ' ';
//                                                      cm_pars_proc_char(phTTS, ' ');
//                                                      pCmd_t->ParseChar = temp;
//                                                      cm_pars_proc_char(phTTS, pCmd_t->ParseChar);
//                                                      cm_pars_new_state(pCmd_t, STATE_NORMAL);
//                                              }
						
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_BRACKET->STATE_COMMAND\n");
#endif
						break;

					case ']':
						
						cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_BRACKET->STATE_NORMAL\n");
#endif
						break;

					case'[':
						cm_pars_proc_char(phTTS, '[');
						break;

					case '\t':
					case ' ':
					case CR:
					case LF:
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Dumping white space\n");
#endif
						break;

					default :

						if (pKsd_t->phoneme_mode & PHONEME_OFF)
						{
							if (pCmd_t->cmd_index == 0xffff)
							{    
								/* Parse State Switch: STATE_BRACKET->STATE_NORMAL */
								temp = pCmd_t->ParseChar;
								pCmd_t->ParseChar = '[';
								cm_pars_proc_char(phTTS, '[');
								pCmd_t->ParseChar = temp;
								cm_pars_proc_char(phTTS, pCmd_t->ParseChar);
								cm_pars_new_state(pCmd_t, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_BRACKET->STATE_NORMAL\n");
#endif
							}
							else
							{   
								/* Parse State Switch: STATE_BRACKET->STATE_TOSS */ 
								cm_cmd_error_comm(phTTS, CMD_bad_command);
								cm_pars_new_state(pCmd_t, STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_BRACKET->STATE_TOSS\n");
#endif
							}
						}
						else
						{                                                         

							/* tell pre-processor we are going into state phoneme */
#ifdef NEW_INDEXING
				temp=pCmd_t->ParseChar;         /* save the charcter */          
				/* force the parser to run */
				pCmd_t->ParseChar = 0x0fff;             /* comment of phoneme following */
				cm_pars_proc_char(phTTS,' ');
				pCmd_t->ParseChar=temp;                 /* restore the character */
#endif                                  
							
							/* Parse State Switch: STATE_BRACKET->STATE_PHONEME */                                                  
							cm_pars_new_state(pCmd_t, STATE_PHONEME);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_BRACKET->STATE_PHONEME\n");
#endif
							cm_phon_match(phTTS, pCmd_t->ParseChar);
						}
				}       /* switch (c) */
				break;  /* case STATE_BRACKET: */

			/*
			 *  process a phoneme ...
			 */

			case STATE_PHONEME:
				cm_phon_match(phTTS, pCmd_t->ParseChar);
				break;

			/*
			 *  process a command ...
			 */

			case STATE_COMMAND:
				cm_cmd_match_comm(phTTS, pCmd_t->ParseChar);
				break;
			/*
			 *  get a parameter string ...
			 */

			case STATE_PARAM:

				cm_cmd_build_param(phTTS, pCmd_t->ParseChar);
				break;

			/*
			 *  toss out all further text until we see an end delimator ...
			 */
			case STATE_TOSS:
			    /* 07/30/96 GL.  check the current character to set the STATE_TOSS at right place */
				if (pCmd_t->ParseChar == ']') cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_loop: Parse State Switch: STATE_TOSS->STATE_NORMAL\n");
#endif
				break;

		} /* end switch(pCmd_t->parse_state) */
	} /* end while(TRUE) */
#ifdef ARM7
	return 0;
#endif
} /* end cm_pars_loop() */ 


/*
 *      Function Name: cm_pars_proc_char()      
 *
 *      Description:This function is called when there is a character that needs to
 *                      be potentially flushed to lts ...
 *
 *      Arguments:  LPTTS_HANDLE_T phTTS
 *                      unsigned short c,   The character which needs to be 
 *                                                                                      potentially flushed to LTS
 *      Return Value: void
 *
 *      Comments: 
 *
 */
void cm_pars_proc_char(LPTTS_HANDLE_T phTTS,
							  unsigned short c) 
{
	/* int i, j, k;  */           /* MVP :Unreferenced variables */
	DT_PIPE_T pipe_value;
	
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	/*********************************************************************************/
	
	if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
	{
		cm_util_flush_init(phTTS);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: pKsd_t->text_flush or CMD_flush_toss\n");
#endif
		return;
	}              
	/* ...tek try to get rid of the dreaded pause.. */
	if(char_types[c] & (MARK_space | MARK_clause))
	{
#ifdef MSDOS
		block(NULL_FP); /* run a sched pass on spaces. */
#endif
	}

#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default case of switch(%c)\n",c);
#endif

#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_proc_char: Default: French, Spanish, German.\n");
#endif

	/*
	 * Text preprocessing and getting clause boundary only done
	 * with say_clause, say_word, say_line; not done on say syllable 
	 * or say_letter.
	 */
	switch(pKsd_t->sayflag)
	{
		case SAY_CLAUSE:
			/* 
			 * eab 1/95 delete next two lines and your back 
			 * to the old cmd_pars 
			 */
		    cm_text_getclause(phTTS);
			/* GL 03/25/1997 BATS#314 change to break to force SYNC */
				break;
			case SAY_SYLLABLE:
				/* MGS make say syllable work like all the other say commands. */
			    cm_text_getclause(phTTS);
				break;
		case SAY_WORD:
				if ((char_types[c] & MARK_space) !=0)
				{
					pCmd_t->ParseChar= c = 0xb;
				}
				cm_text_getclause(phTTS);
				break;
			case SAY_LETTER:
/* 057	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces */
				if (pCmd_t->letter_mode_flag)
				{
					break;
				}
				cm_util_type_out(phTTS, c);
#ifdef EPSON_ARM7
				phTTS->TTP_return=1;
#endif
				break;
				
				/* GL 12/17/1998 BATS#846 say_fletter to skip control character */
			case SAY_FLETTER:
/* 057	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces */
				if (pCmd_t->letter_mode_flag)
				{
					break;
				}
				if (c >= 32) 
				{
					cm_util_type_out(phTTS, c);
#ifdef EPSON_ARM7
					phTTS->TTP_return=1;
#endif
				}
				break;

			case SAY_LINE:
				if (c == CR || c == LF)
				{
					pCmd_t->ParseChar= c = 0xb;
				}
				cm_text_getclause(phTTS);
				break;
	}
	/* GL 03/25/1997 BATS#314 force SYNC after 0xb */
	if(c == 0xb)
	{
		pipe_value = SYNC;
#ifdef SINGLE_THREADED
		lts_loop(phTTS,&pipe_value);
#else
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif
	}
	return;
}


/*
 *      Function Name: cm_pars_new_state()      
 *
 *      Description: Transition the parse state machine to either STATE_NORMAL,                              
 *              STATE_BRACKET, STATE_COMMAND, STATE_PHONEME, STATE_PARAM,
 *              STATE_TOSS, or STATE_KEEP and reset the parameter
 *              counts.
 *
 *      Arguments: PCMD_T pCmd_t, int state
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void cm_pars_new_state(PCMD_T pCmd_t, int state)
{

	/*
	 *  if we're accepting parameters and we're there now, bump and clear
	 *  pointers ...
	 */

	pCmd_t->p_count = 0;
	pCmd_t->cmd_p_flag = 0;

#ifdef DEBUGPARS
		printf("CMD_PARS: cm_pars_new_state:\n");
#endif
	if(state == STATE_PARAM && pCmd_t->parse_state == STATE_PARAM)
	{
		(pCmd_t->param_index) += 1;
		}
	if(state == STATE_TOSS && pCmd_t->last_char == ']')
	{
		pCmd_t->parse_state = STATE_NORMAL;
	}
	else
	{
		pCmd_t->parse_state = state;
	}
}

#endif /* #else Use new DTParser !VOCAL */

/*
 *      Function Name: cm_pars_icommand()       
 *
 *      Description: Inserts the command from the pCmd_t->setv array into the input stream. This 
 *         occurs when the setv() function is called; pCmd_t->insertflag is set equal to 1,
 *         which signals cm_pars_loop() to call this function.
 *
 *      Arguments: PCMD_T pCmd_t
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */
int cm_pars_icommand(PCMD_T pCmd_t)
{
  if (pCmd_t->setv[pCmd_t->cmd_number].cmd[pCmd_t->cmd_count] == 0)
    {   
      /* 
       * insertflag is set to 1 to signal cm_pars_loop() to call this function.
       * Reset to 0 to signal that internal command string is finished being processed.
       */
      pCmd_t->insertflag=0;
      return(1);
    }
  pCmd_t->cmd_count++;
  return(pCmd_t->setv[pCmd_t->cmd_number].cmd[pCmd_t->cmd_count-1]);
}

#ifndef ARM7
/*
 *      Function Name: cm_pars_getseq() 
 *
 *      Description: Used to parse incoming strings from the host, the
 *      sequences are new type command sequences.  A sequence structure 
 *              is returned to the main command parser, with either a character,
 *              or a command introducer.  A bad sequence now stays here until a valid
 *      sequence is entered.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: unsigned int
 *
 *      Comments:
 *
 */
unsigned int cm_pars_getseq(LPTTS_HANDLE_T phTTS)
{
  register int    c;
  register int    ac=0;

#ifndef MSDOS
  unsigned char inchar;
#endif
  /* DT_PIPE_T pipe_value; Commented out as unreferenced var. SIK 3/18/96 */
  PCMD_T pCmd_t = phTTS->pCMDThreadData;
  PKSD_T pKsd_t = phTTS->pKernelShareData;

  while(TRUE)
    {
      /* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#ifdef CUP28PROJECT 
	  //special temp hack for mit to read kjhkj,kjlkj as two phrases--no comma pronounced 
      if(pCmd_t->lastchar == ',')
	  {
	  c = ' ';
	  }
	  else
	  {
#endif

      read_pipe( pKsd_t->cmd_pipe, &inchar, 1 );
      
      c = (int)inchar;
#ifdef CUP28PROJECT
	  }
      pCmd_t->lastchar = c;
#endif
      /* GL 08/21/1997 for BATS#449 fix the Xeorx Crash problem */
      /* 0xff will be threw away in LTS even go through here */
      /*
	also throw away 
	PAR_PHONES_ON_D                 0x80
	PAR_PHONES_OFF_D                0x81
	PAR_INDEX_DUMMY_CHAR    0x82
      */
      /* it will jam the parser in the text form of MS word .doc file*/
      /* then create then unnecessary computation */
      /* 0xff will be still in typing table to support typing mode */
      if (c == 0xff ||
	  c == PAR_PHONES_ON_D ||
	  c == PAR_PHONES_OFF_D ||
	  c == PAR_INDEX_DUMMY_CHAR)
	continue;
#endif
      
#ifdef MSDOS
      ac = getc() & 0xff;
      /* GL 12/04/1996  allow to skip code page translation */ 
      if (pCmd_t->skip_mode != SKIP_cpg) 
	c = pKsd_t->code_page[ac];
      else
	c = ac;
#endif

		 /* 
		   GL 10/22/1996,
		   force the 0xb to perform the same action exactly as [:sync]
		   command.  comment out at this moment.
		 */
		
/*
#ifdef VOCAL
	if (c == 0xb)
	{
		cm_cmd_sync(phTTS);
	    continue;
	}
#endif
*/
	if (pKsd_t->halting)
	{
	    // tek 6/16/94:
	    // in a heavy-handed way. just blow everything
	    // away if we're doing a command-register flush.
	    cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
#ifdef ESCAPE_SEQ
	    pCmd_t->esc_seq->type=0;
#endif
	    return(0xb);
	}
		/* 
		 * ...tek 1/3/96 There was a lot of stuff in here from ~8/94
		 * having to do with munging around with ^k syncs. As far as 
		 * I can tell, that is no longer needed because cmd_pars should
		 * do the right thing if you just pass the ^k (0xb) back - that's
		 * the way dtex implements sync. Most of this was already commented
		 * out anyway, so I deleted it.
		 */
 
		if(c != 0xb || c !=' ')/*eab 8/94 don't arm on internal stuff*/
		{    
			pKsd_t->input_timeout = pCmd_t->timeout;/*got a character so arm timeout*/
		}


		if(pKsd_t->cmd_flush)
		{
			if(pKsd_t->cmd_flush == CMD_flush_toss)
			{
				/* cm_util_flush_init(phTTS); */
      
				/* always pass a sync on through! */
				if (ac == 0xb)  /* VT */
					return(ac);                             
				continue;
			}
			else if(pKsd_t->cmd_flush == CMD_flush_sync)
			{
				if(ac == CMD_sync_out)
				{
					/* 
					 * this is the flush_char path, which isn't 
					 * used anymore but exists for backward
					 * compatibility .. Hm, DTEX may still use
					 * this path.. tek 1/3/95 
					 */
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
					read_pipe( pKsd_t->cmd_pipe, &inchar, 1 );
					c = (int)inchar;
					cm_util_type_out(phTTS, c);
#endif

#ifdef MSDOS
					ac = getc() & 0xff;
					/* GL 12/04/1996  allow to skip code page translation */ 
					if (pCmd_t->skip_mode != SKIP_cpg) 
						c = pKsd_t->code_page[ac];
					else
						c = ac;
					cm_util_type_out(phTTS, c);
#endif  
#ifdef MSDOS
#ifdef DTEX
					block(NULL_FP); /* that's enough */
#else /* not dtex*/
					sleep(0); /* let it flow through. */
#endif /*dtex*/
#endif                
				}
				else if(ac != CMD_sync_char)
					continue;
			}
#ifdef MSDOS            
			flush_done();
#else
			flush_done(pKsd_t);
#endif
#ifdef MSDOS            
			while(pKsd_t->spc_flush_reset != 0)
			{
				sleep(0);
			}
#endif
			cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
#ifdef MSDOS            
			status_clear_update(STAT_flushing);
#endif
			/* ...tek 30may95 get rid of this FLUSH_DONE  */
			/* status_set_update(FLUSH_DONE); xxx eab needed to full interlock flush */
#ifdef ESCAPE_SEQ
			pCmd_t->esc_seq->type = 0;    
#endif
#ifdef MSDOS
#ifdef DTEX
			/* this probably only makes sense on a serial line.. */
			OutputCharacter(XON);                                             
#endif /*dtex*/ 
#endif /* MSDOS */
			
			continue;
		}

		
/*
 *  first, look for escape codes ... note that these do no nest if you
 *  screw up an escape sequence it just gets tossed ...
 */

#ifdef ESCAPE_SEQ
		if (c==ESC || c==DCS || c==CSI || c==OSC || c==PM || c==APC)
		{
			if(c != ESC)
				pKsd_t->eight_bit = TRUE;
			pCmd_t->esc_seq->type   = c;
			pCmd_t->esc_seq->pintro = 0;
			pCmd_t->esc_seq->ninter = 0;
			pCmd_t->esc_seq->nparam = 0;
			pCmd_t->esc_seq->badf   = FALSE;
			continue;
		}
#endif
/*
 *  if we are not in an escaped sequence just pass this along ...
 */
#ifdef ESCAPE_SEQ
		if (pCmd_t->esc_seq->type == 0)
#endif
		{
			if(pKsd_t->logflag & LOG_TEXT)
			{   
#ifdef MSDOS
				OutputCharacter((unsigned char)ac);
#else
				OutputCharacter(phTTS, (unsigned char)(c & 0xff));
#endif
				
			}
			return (c);
		}
/*
 *  if we are make sure this is valid for later processing ... if not
 *  toss everything and pass this along ...
 */
		if ((c>=0x80 && c<=0x9F) || c==CAN || c==SUB)
		{
#ifdef ESCAPE_SEQ
			pCmd_t->esc_seq->type = 0;
#endif
			if(pKsd_t->logflag & LOG_TEXT)
#ifdef MSDOS
				OutputCharacter((unsigned char)ac);
#else
				OutputCharacter(phTTS, (unsigned char)(c & 0xff));
#endif
			return (c);
		}
/*
 *  Imbedded C0 controls ...  these are passed on to the parser then we
 *  resume escape processing from here...
 */
		if (c<0x20 || c==DEL || c==RDEL)
		{
			if(pKsd_t->logflag & LOG_TEXT)
#ifdef MSDOS
				OutputCharacter((unsigned char)ac);
#else
				OutputCharacter(phTTS, (unsigned char)(c & 0xff));
#endif
			return (c);
		}

#ifdef ESCAPE_SEQ
		if (c>=0x20 && c<=0x2F)
		{
			if (pCmd_t->esc_seq->ninter < NUM_INTER)
			{
				pCmd_t->esc_seq->inter[pCmd_t->esc_seq->ninter++] = c;
			}
			else
			{
				pCmd_t->esc_seq->badf = TRUE;
			}
			continue;
		}
#endif
/*
 *  the following loop reads parameters into the sequence fields ...
 */
#ifdef ESCAPE_SEQ

		if (pCmd_t->esc_seq->type!=ESC && c>=0x30 && c<=0x3F)
		{
			if (pCmd_t->esc_seq->ninter != 0)
			{
				pCmd_t->esc_seq->badf = TRUE;
			}
			switch (c)
			{

/*
 *  Build a decimal number in the param array ...
 */
				case    0x30    :
				case    0x31    :
				case    0x32    :
				case    0x33    :
				case    0x34    :
				case    0x35    :
				case    0x36    :
				case    0x37    :
				case    0x38    :
				case    0x39    :
					if(pCmd_t->esc_seq->nparam == 0)
					{
						pCmd_t->esc_seq->param[0] = 0;
						pCmd_t->esc_seq->nparam += 1;
					}
					pCmd_t->esc_seq->dflag[pCmd_t->esc_seq->nparam-1] = FALSE;
					pCmd_t->esc_seq->param[pCmd_t->esc_seq->nparam-1] *= 10;
					pCmd_t->esc_seq->param[pCmd_t->esc_seq->nparam-1] += c - 0x30;
					break;
/*
 *  semi-colons seperate the arguments ...
 */
				case    0x3a    :

					pCmd_t->esc_seq->badf = TRUE;

				case    0x3b    :

					if(pCmd_t->esc_seq->nparam < NUM_PARAM)
					{
						pCmd_t->esc_seq->dflag[pCmd_t->esc_seq->nparam] = TRUE;
						pCmd_t->esc_seq->param[pCmd_t->esc_seq->nparam] = 0;
						pCmd_t->esc_seq->nparam += 1;
					}
					else
					{
						pCmd_t->esc_seq->badf = TRUE;
					}
					break;

				case    0x3c    :
				case    0x3d    :
					pCmd_t->esc_seq->badf = TRUE;
					break;

				case    0x3e    :
				case    0x3f    :
					if(pCmd_t->esc_seq->pintro || pCmd_t->esc_seq->nparam)
					{
						pCmd_t->esc_seq->badf = TRUE;
					}
					pCmd_t->esc_seq->pintro = c;
					break;
			};
			continue;
		}
#endif
/*
 *  escape processing ... escapes are turned into DCS (ESC P),
 *  CSI (ESC [), OSC(ESC ]), PM(ESC ^) or APC (ESC _) all others
 *  include ST (ESC \) are converted and returned ...
 */
#ifdef ESCAPE_SEQ

		if(pCmd_t->esc_seq->type == ESC && pCmd_t->esc_seq->ninter == 0 && c>= 0x40 && c<= 0x5f)
		{
			c += 0x40;
			if (c!=DCS && c!=CSI && c!=OSC && c!=PM && c!=APC)
			{
				pKsd_t->eight_bit = FALSE;
				pCmd_t->esc_seq->type = 0;
				if(pKsd_t->logflag & LOG_TEXT)
#ifdef MSDOS
					OutputCharacter((unsigned char)ac);
#else
					OutputCharacter(phTTS, (unsigned char)(c & 0xff));
#endif
				return (c);
			}
			pCmd_t->esc_seq->type   = c;          /* Begin new sequence   */
			pCmd_t->esc_seq->pintro = 0;
			pCmd_t->esc_seq->ninter = 0;
			pCmd_t->esc_seq->nparam = 0;
			pCmd_t->esc_seq->badf   = FALSE;
			continue;
		}
#endif
#ifdef ESCAPE_SEQ
		pCmd_t->esc_seq->final = c;                   /* Final                */
		c  = pCmd_t->esc_seq->type;
		pCmd_t->esc_seq->type  = 0;
		if(pCmd_t->esc_seq->badf)
		{
			continue;
		}
#endif
		return (c);
	}       /* End while(TRUE) */
}
#endif

#ifdef MSDOS 
/*
 *      Function Name: OutputCharacter()        
 *
 *      Description:
 *
 *      Arguments: unsigned char c
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */
int OutputCharacter( unsigned char c )
{
  putc(c);
  return 0;
}

#else

#ifdef WIN32
#include <windows.h>
#include <mmsystem.h>
#include "tts.h"
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
/*#include "dtmmedefs.h"*/
#include "opthread.h"
#include "tts.h"
#endif

/*LPTTS_HANDLE_T TextToSpeechGetHandle(void);*/                 /* MVP MI */

//void TextToSpeechErrorHandler( LPTTS_HANDLE_T, UINT, MMRESULT );

/*
 *      Function Name: OutputCharacter()        
 *
 *      Description:
 *
 *      Arguments: LPTTS_HANDLE_T phTTS,unsigned char c 
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void OutputCharacter( LPTTS_HANDLE_T phTTS,unsigned char c )
{
#ifndef ARM7
  /*
    LPTTS_HANDLE_T phTTS;                                   MVP MI
    phTTS = TextToSpeechGetHandle();
  */
#ifdef WIN32
  EnterCriticalSection( phTTS->pcsLogFile );
#endif
  
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
  /* GL 04/21/1997  add this for OSF build */
  /* ToggleLogfileMutex( MUTEX_RESERVE ); */
  OP_LockMutex( phTTS->pcsLogFile );
#endif
  
  if ( fprintf( phTTS->pLogFile, "%c",c ) < 0 )
  {
	TextToSpeechErrorHandler( phTTS,
				  ERROR_WRITING_FILE,
				  0L );
  }

#ifdef WIN32
  LeaveCriticalSection( phTTS->pcsLogFile );
#endif

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
  /* GL 04/21/1997  change this for OSF build */
  /* ToggleLogfileMutex( MUTEX_RELEASE );*/
  OP_UnlockMutex( phTTS->pcsLogFile );
#endif

/*  return;*/
#endif
}
#endif /* #else !MSDOS */