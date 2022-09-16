/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                             
 *	  Copyright © 2000 Force Computers, a Solectron Company. All rights reserved.
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
 *    File Name:    ls_suff.c
 *    Author:       Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    ls_suff_suffix_find(pLts_t,) is used to attempt a suffix strip from a word that
 *    hasn't been found in the dictionary ..
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001	MGS		02/27/1996 		Reformatted code and added function headers    
 * 002	MGS		03/18/1996		Added LSSUFFDEBUG tag
 * 003  MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 * 004	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 * 005	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 006  GL      07/16/1997      for BATS#402 fix the "documents" problem
 * 007  GL      07/25/1997      for BATS#416 fix the international character crash problem
 * 008	GL		09/25/1997		add one more argument for ls_dict_ufind_word() 
 *								UK BUILD: ENGLISH_US was changed to ENGLISH or added a copy as ENGLISH_UK 
 * 009	GL		11/05/1997		for BATS#510 use udic_entries[pKsd_t->lang_curr] 
 * 010	GL		11/06/1997		add form class debug window dump.  Open print_fc() function
 *                              for all other langauge
 * 011	GL		12/18/1997		put "tts.h" include statement into osf and win32 section
 *                              this should fix 16 bits ls_suff.dep problem
 * 012	GL		04/28/1998		BATS#659 fix -ig to -ige, -iger, -igen, iges  conversion problem
 *                              
 * 013	MFG		04/10/1998		removed spaces from form_class_strings[] members
 * 014  MFG     04/29/1998      added logging to dbglog.txt for debug commands 0x4100,0x4004
 * 015  MFG		05/19/1998		excluded dbglog logging when build 16-bit code (MSDOS)	 
 * 016  GL		09/29/1998		clean up the formclass display in non-MSDOS section	 
 * 017  ETT		10/05/1998      Added Linux code.
 * 018	MGS		04/13/2000		Changes for integrated phoneme set 
 * 019  NAL     06/12/2000      cast params (warning removal)
 * 020	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 * 021 	CAB		10/16/00		Added copyright info
 *
 */

#include "ls_def.h"

#if defined (ENGLISH) || defined (GERMAN)

/* GL 04/21/1997  add this for OSF build */
#if defined (__osf__) || defined (__linux__)
#include "opthread.h"
#endif
	
/* #define LSSUFFDEBUG */

void ls_suff_append_pron(LPTTS_HANDLE_T phTTS,unsigned char __far *pb);
extern unsigned char suffix_table[];

/* GL 04/21/1997  change this for OSF build */
extern U32 suffix_index[];

/*
 *  tokens used in the parse table (must match the suffix dictionary
 *  compiler ...
 */

#define SF_END                  0xff  /* End of rule */
#define SF_STRIP                0xfe  /* Strip type  - */
#define SF_FC                   0xfd  /* Form class tag only  + */
#define SF_REPLACE              0xfc  /* Start of replacement rule / */
#define SF_REPLACE_WITH         0xfb  /* Substitute on replacement rule : */
#define SF_REPLACE_END 			0xfa  /* End of substitute rule */
#define SF_RECURSE              0xf9  /* Retry rules again # */ 
#define SF_PHONES               0xf8  /* Start of phonemene field  % */
#define SF_PHONES_END           0xf7  /* End of phonemene field */    

 /*
 *      Function Name:
 *              ls_suff_suffix_find     
 *
 *      Description:           
 *              This function looks for suffixes
 *
 *      Arguments:                          
 *              unsigned char __far *str_end    The string to match
 *              short which_dic                 The dictionary to search through
 *
 *      Return Value:                                                       
 *              HIT             The word was found in the dictionary
 *              MISS    The wourd was not fouind inthe dictionary
 *
 *      Comments:
 *
 */
int ls_suff_suffix_find(LPTTS_HANDLE_T phTTS,unsigned char      __far *str_end,short which_dic)
{
	unsigned char   _far *bp;                       /* base text string seach */
	unsigned char   _far *sp;                       /* suffix string seach */
	unsigned char   _far *np;                       /* replacement string save */
	unsigned char   _far *sbp;                      /* saved base pointer to recurse */
	/* GL 04/21/1997  add this for OSF build */
	U32     i,stat=0;
	U32		si;

	struct  suff_rule       *stp;
	unsigned char   save_str[128];
#ifdef GERMAN
	short hit_tail=0;
	short hit_suff=0;
#endif

	PLTS_T  pLts_t;
	PKSD_T  pKsd_t;
	pKsd_t = phTTS->pKernelShareData;
	pLts_t = phTTS->pLTSThreadData;
	
#ifdef LSSUFFDEBUG
		printf("ls_suff_suffix_find; comp_str = %s str_end = %s\n",pLts_t->comp_str,str_end);
#endif

    /* GL 07/25/1997 For BATS#416  pick up the right index for international character */
	/* this change will match to suffix compiler character grouping */
	/* if(IS_LOWER_ALPHA(ls_lower[*str_end]) == false)*/
	if (ls_lower[*str_end] < 'a' || ls_lower[*str_end] > 'z')
		si = suffix_index[26];
	else
		si = suffix_index[ls_lower[*str_end] - 'a'];
#ifdef LSSUFFDEBUG
		printf("suffix_find si = %04X\n",si); 
#endif

	while(si != 0xffff)
	{
		stp = (struct suff_rule *)&suffix_table[si];
		bp = str_end;
		sp = &stp->rule[0];
		while(*sp != SF_STRIP && *sp != SF_FC)
		{
			if(ls_lower[*bp] != *sp || bp == pLts_t->str_vowel)
				break;
			bp--;
			sp++;
		}

		/*
		 *  for form class hits, just set the fc field ...
		 */
		
		if(which_dic && (*sp == SF_FC))
		{
			pLts_t->fc_struct[pLts_t->fc_index] = stp->fc;
			return(MISS);
		}
		/*
		 *  if the suffix can be stripped, look for a striping rule starting
		 *  with / and see if it can be applied ...
		 */
		if(*sp++ == SF_STRIP)
		{
			for(i=0;(save_str[i] = pLts_t->comp_str[i]);i++);
			sbp = bp;

			while(*sp != SF_END)
			{
				if(*sp++ == SF_REPLACE)
				{
					while(*sp == ls_lower[*bp])
					{
						sp++;
						bp--;
					}
					if(*sp++ == SF_REPLACE_WITH)
					{
						np = bp+1;
#ifdef GERMAN
						if ((*np == 'e' && *(np+1) == 0) ||
						    (*np == 'e' && *(np+1) == 'r' && *(np+2) == 0)  ||
						    (*np == 'e' && *(np+1) == 'n' && *(np+2) == 0)  ||
						    (*np == 'e' && *(np+1) == 's' && *(np+2) == 0))
							hit_suff = 1;
#endif
						while(*sp != SF_REPLACE_END)
						{
							*np++ = *sp++;
						}
						*np++ = 0;
						sp++;
						if(*sp == SF_RECURSE)
						{
							sp++;
#ifdef LSSUFFDEBUG
								printf("suffix_find recursion bp = %s np = %s save_str = %s\n",bp,np,save_str);
#endif
							stat = ls_suff_suffix_find(phTTS,np-1,which_dic);
#ifdef LSSUFFDEBUG
								printf("out of recursion\n");
#endif
						}
						else
						{
#ifdef GERMAN
							/* GL 04/28/98, BATS#659  set up the offset for dictionary send_phone() call */
							hit_tail=0;
							for(i=0;pLts_t->comp_str[i];i++)
							{
								if (pLts_t->comp_str[i] == 'i' &&
								    pLts_t->comp_str[i+1] == 'g' &&
								    pLts_t->comp_str[i+2] == 0)
									hit_tail = 1;
								if (pLts_t->comp_str[i] == 'i' &&
								    pLts_t->comp_str[i+1] == 'v' &&
								    pLts_t->comp_str[i+2] == 0)
									hit_tail = 3;
							}
#endif
							pLts_t->fc_struct[pLts_t->fc_index] = stp->fc;
							/* GL 11/05/1997 BATS#510 */
							if(pKsd_t->udic_entries[pKsd_t->lang_curr] != 0)
							{
								/* GL 06/19/1997  add one more argument */
#ifdef GERMAN
								stat=ls_dict_ufind_word(phTTS,0,(short)(hit_tail & hit_suff)); // NAL warning removal
#else
								stat=ls_dict_ufind_word(phTTS,0);
#endif
							}

							if(DICT_ENTRY !=0 && stat != HIT)
							{
#ifdef GERMAN
								stat = ls_dict_find_word(phTTS,(short)(hit_tail & hit_suff)); // NAL warning removal
#else
								stat = ls_dict_find_word(phTTS);
#endif
							}
						}
						if(stat == HIT)
						{
							/* debug switch */
							if (DT_DBG(LTS_DBG,0x004))
							{
#ifndef MSDOS
                           	if(pKsd_t->dbglog)
							fprintf((FILE *)pKsd_t->dbglog,"\nHITS(%s)",pLts_t->comp_str); /*mfg 04/24/98 added debug log support*/
#endif
							printf("\nHITS(%s)",pLts_t->comp_str);
							}
#ifdef GERMAN
							/* GL 04/28/98, send "g" for -en, -er, -es, -e */
							if ((hit_tail & hit_suff) != 0 && hit_tail == 1)
							{
								ls_util_send_phone(phTTS,GR_G);
							}
							/* GL 04/28/98, send "v" for -en, -er, -es, -e */
							if ((hit_tail & hit_suff) != 0 && hit_tail == 3)
							{
								ls_util_send_phone(phTTS,GR_V);
							}
#endif
							ls_suff_append_pron(phTTS,sp);
							return(HIT);
						}
						else 
						{
							pLts_t->fc_struct[pLts_t->fc_index] = 0;
						}
						for(i=0;(pLts_t->comp_str[i] = save_str[i]);i++);
					} /* if(*sp++ == SF_REPLACE_WITH) */
					bp = sbp;
				} /* if(*sp++ == SF_REPLACE) */
			} /* while(*sp != SF_END) */
		} /* if(*sp++ == SF_STRIP) */
		si = stp->next;
#ifdef LSSUFFDEBUG
			printf("suffix_find new si = %04X\n",si); 
#endif
	}/*     while(si != 0xffff)*/
	return(MISS);
}

 /*
 *      Function Name:                                       
 *              ls_suff_append_pron
 *
 *      Description:           
 *              
 *
 *      Arguments: LPTTS_HANDLE_T phTTS,unsigned char __far *pb
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void ls_suff_append_pron(LPTTS_HANDLE_T phTTS,unsigned char __far *pb)
{
	PLTS_T  pLts_t;

	pLts_t = phTTS->pLTSThreadData;

	while(*pb != SF_END)
	{
		if(*pb++ == SF_PHONES)
	    {
			/* GL 07/16/1997 for BATS#402 fix the documents problem */
			/* break two *pb++ to two different statements */
			int temp;
			temp = *pb++ & pfeat[pLts_t->lphone];
			if(temp == *pb++)
			{
				while(*pb != SF_PHONES_END)
					ls_util_send_phone(phTTS,*pb++);
				break;
			}
		}
	}
}
#endif /* if deifned (ENGLISH) || defined (GERMAN) */

char *form_class_strings[] = {
	"adj",
	"adv",
	"art",
	"aux",
	"be",
	"bev",
	"conj",
	"ed",
	"have",
	"ing",
	"noun",
	"pos",
	"prep",
	"pron",
	"subj",
	"that",
	"to",
	"verb",
	"who",
	"neg",
	"intr",
	"ref",
	"part",
	"func",
	"conj",
	"char",
	"refr",
	"unused",
	"unused",
	"mark",
	"cont",
	"homo",
};
/*
 *      Function Name:  
 *              ls_suff_printf_fc
 *
 *      Description:
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
#ifdef MSDOS
void ls_suff_print_fc(LPTTS_HANDLE_T phTTS)
{
	int     i,j;
	S32    fc_mask;
	PLTS_T pLts_t;
	pLts_t= phTTS->pLTSThreadData;

	WAIT_PRINT;
	printf("\n[:form");
	for(j=1;j<=pLts_t->fc_index;j++)
	{
		if(pLts_t->fc_struct[j])
		{
			printf("\n  %d :",j);
			fc_mask = 1;
			for(i=0;i<32;i++)
			{
				if(pLts_t->fc_struct[j] & fc_mask)
					printf("%s fc ",form_class_strings[i]);
				fc_mask = fc_mask*2;
			}
		}
		else
		{
			printf("\n  %d : unknown. \n",j);
		}
	}
	printf("]\n");
	SIGNAL_PRINT;
}
            
            
#else

#ifdef WIN32
#include <windows.h>
#include <mmsystem.h>
#include "tts.h"
#endif

#if defined (__osf__) || defined (__linux__)
/* GL 04/21/1997  change this as the latest OSF code */
/*#include "dtmmedefs.h"*/
#ifndef __linux__
#include <mmsystem.h>
#endif
#include "tts.h"
#endif

/*LPTTS_HANDLE_T TextToSpeechGetHandle(void);*/

#ifndef LDS_BUILD
void TextToSpeechErrorHandler( LPTTS_HANDLE_T, UINT, MMRESULT );
#endif

/*
 *      Function Name: ls_suff_print_fc()      
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void ls_suff_print_fc(LPTTS_HANDLE_T phTTS)
{
  int i,j;
  S32 fc_mask;
  PLTS_T  pLts_t;
  PKSD_T  pKsd_t;
  pKsd_t = phTTS->pKernelShareData;
  pLts_t = phTTS->pLTSThreadData;

  /* GL 09/29/98  don't display while there is no data */
  if (pLts_t->fc_index == 0) return;

#ifdef WIN32
  EnterCriticalSection( phTTS->pcsLogFile );
#endif
#if defined (__osf__) || defined (__linux__)
  /* GL 04/21/1997  change this as the latest OSF code */
  /* ToggleLogfileMutex( MUTEX_RESERVE ); */
  OP_LockMutex( phTTS->pcsLogFile );
#endif
	
  
#ifndef MSDOS
  if (pKsd_t->dbglog)	/*mfg 04/28/98 added debug support*/
		fprintf((FILE *)pKsd_t->dbglog,"\n[:form ");
#endif

#ifdef PRINTFDEBUG
  printf("\n[:form ");
#endif
  if (pKsd_t->logflag & LOG_FORM_TYPES)
  {
	if ( fprintf( phTTS->pLogFile, "\n[:form ") < 0 )
	{
#ifndef LDS_BUILD
		TextToSpeechErrorHandler( phTTS,
			      ERROR_WRITING_FILE,
			      0L );
#endif
	}
  }
  for( j = 1; j <= pLts_t->fc_index; j++ )
  {
    if( pLts_t->fc_struct[j] )
    {
      fc_mask = 1;

      for( i = 0; i < 32; i++ )
      {
		if( pLts_t->fc_struct[j] & fc_mask )
		{
#ifdef PRINTFDEBUG
			printf("%s fc ",form_class_strings[i] );
#endif
#ifndef MSDOS
			if (pKsd_t->dbglog)	/*mfg 04/28/98 added debug support*/
				fprintf((FILE *)pKsd_t->dbglog," %s fc ",form_class_strings[i] );
#endif

			if (pKsd_t->logflag & LOG_FORM_TYPES)
			{
				if ( fprintf( phTTS->pLogFile, "%s fc ",form_class_strings[i] ) < 0 )
				{
#ifndef LDS_BUILD
					TextToSpeechErrorHandler( phTTS,
				      ERROR_WRITING_FILE,
				      0L );
#endif
				}
			}
		}
		fc_mask = fc_mask << 1;
      }
    }
    else
    {
#ifdef PRINTFDEBUG
      printf("\n  %d : unknown. \n",j);
#endif
#ifndef MSDOS
	  if (pKsd_t->dbglog)	/*mfg 04/28/98 added debug support*/
		fprintf((FILE *)pKsd_t->dbglog,"\n  %d : unknown. \n",j);
#endif
	  if (pKsd_t->logflag & LOG_FORM_TYPES)
	  {
		if ( fprintf( phTTS->pLogFile, "\n  %d : unknown. \n",j) < 0 )
		{
#ifndef LDS_BUILD
			TextToSpeechErrorHandler( phTTS,
				  ERROR_WRITING_FILE,
				  0L );
#endif
		}
	  }
    }
	if (j < pLts_t->fc_index)
	{
#ifdef PRINTFDEBUG
		printf("/ ");
#endif
#ifndef MSDOS
		if (pKsd_t->dbglog)	/*mfg 04/28/98 added debug support*/
			fprintf((FILE *)pKsd_t->dbglog,"/ ");
#endif
	}

  }

#ifdef PRINTFDEBUG
  printf("]\n");
#endif
#ifndef MSDOS
	if (pKsd_t->dbglog)	/*mfg 04/28/98 added debug support*/
		fprintf((FILE *)pKsd_t->dbglog,"]\n");
#endif

  if (pKsd_t->logflag & LOG_FORM_TYPES)
  {
	if ( fprintf( phTTS->pLogFile, "]\n") < 0 )
	{
#ifndef LDS_BUILD
		TextToSpeechErrorHandler( phTTS,
			      ERROR_WRITING_FILE,
			      0L );
#endif
	}
  }

#ifdef WIN32
  LeaveCriticalSection( phTTS->pcsLogFile );
#endif
#if defined (__osf__) || defined (__linux__)
  /* GL 04/21/1997  change this as the latest OSF code */
  /*ToggleLogfileMutex( MUTEX_RELEASE );*/
  OP_UnlockMutex( phTTS->pcsLogFile );
#endif

}
#endif          
