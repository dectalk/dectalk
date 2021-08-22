/* 
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000, 2001 Force Computers, Inc., a Solectron company. All rights reserved.
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
 *    File Name:	ls_rule.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    The functions in this file
 *    make up the heart of the letter to
 *    sound system. They handle all of
 *    the rule matching.
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001 	DGC		02/21/1985		Added some new code to deal with
 *								compound words. Look at the loop in "lts"
 *								that calls "allo1", "stress", "sylables".
 *								See how it breaks on boundries.
 * 002 	DGC		02/26/1985	 	Fixed a bug in the above new code. When
 *								you do a [*] or something like that, you
 *								have to clear the stress set flag.
 * 003 	DGC		04/08/1985		Display the new reduction block flag.
 * 004 	DGC		05/29/1985		Added "WATCH" code, to deal with the dreaded
 *								"assume" => [x'Sum] bug.
 * 005 	DGC		09/18/1985		Stylistic changes suggested by "lint".
 * 007 	GL		07/13/1995		change code to be same as ACNA code
 *								search 7/13/95 for inline comment
 *								add  S3 place holder in wpname[] 
 * 008	MGS		02/07/1996		Moved code from ls4.c to ls_rule.c
 * 009	MGS		02/26/1996		Added function headers
 * 010	MGS		02/27/1996		Reformated code removing 2 big else if chains and
 *								replacing them with switch
 * 011	MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 * 012	GL		07/31/1996		Make sure ACNA only work with ENGLISH_US
 * 013	GL		09/18/1996		Add debug switch 080
 * 014	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 015  GL      06/11/1997      BATS#386 only set formclass to NOUN if don't have
 *	                            the formclass info.
 * 016	DR		07/21/1997		UK BUILD: ENGLISH_US was changed to ENGLISH or added a copy as ENGLISH_UK 
 * 017  GL      09/24/1997      BATS#470  Add LDS debug switch
 *                              fix the LDS rule table handling
 * 018  GL      10/13/1997      For BATS#486 remove English only ACNA setting
 * 019  GL      07/08/1998      For BATS#705 don't set formclass to noun for words with unknown
 *                              formclass
 * 020  ETT		10/05/1998      Added Linux code.
 * 021 	CAB		10/18/2000		Changed copyright info
 * 022	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 023	CAB		05/14/2001		Updated copyright
 * 024	MGS		06/19/2001		Solaris Port BATS#972
 * 025	MGS		02/25/2002		ACNA fixes, LTS parsing
 * 026	CAB		08/08/2002		Updated copyright info
 */

#include "ls_def.h"


/*
 * Each entry in the rule dictionary
 * is (at least) 4 words long. Entry 0 is the
 * index to the grapheme part. Entry 1 is the
 * index to the replacement. Entry 2 is the left
 * environment. Entry 3 is the right environment. If
 * this code is running on the VAX, then there are
 * two extra words. Entry 4 is the line number in
 * the rule file of the rule. Entry 5 is the count
 * of rule usage. The table builder (lsmktab)
 * puts out the words if asked to generate MACRO,
 * which is a good hint this is the VAX.
 */

/* GL 09/24/1997 for BATS#470 change the LDS rule table handling */
#if defined (VMS) || defined (LDS_BUILD)
	extern unsigned char     lsbtab[];              /* Byte array.*/
	extern unsigned short   lswtab[];               /* Word array.*/                 

#define wtab(n)         ((unsigned short)lswtab[(n)]&0xFFFF)
#define btabb(n)        ((unsigned char)lsbtab[(n)]&0xFF)
#define btabw(n)        ((((unsigned char)lsbtab[(n)+1]&0xFF)<<8) |((unsigned char)lsbtab[(n)]&0xFF))

#ifdef ACNA
#define	LSBUMP	7				/* 7 word entries		*/
#else
#define	LSBUMP	6				/* 6 word entries		*/
#endif
	short	rline;						/* Rule: line			*/

#else
#if defined (ENGLISH) || defined (GERMAN)
#ifdef ACNA
#define	LSBUMP	5				/* 6 word entries		*/
#define	wtab(n)		((U16)acna_lswtab[(n)]&0xFFFF)
#define	btabb(n)	((U16)acna_lsbtab[(n)]&0xFF)
#define	btabw(n)	(((U16)(acna_lsbtab[(n)+1]&0xFF)<<8)|((U16)acna_lsbtab[(n)]&0xFF))

#else
#define	wtab(n)		((U16)lswtab[(n)]&0xFFFF)

#define	btabb(n)	((U16)lsbtab[(n)]&0xFF)
	
#define	btabw(n)	(((U16)lsbtab[(n)+1])<<8) |((U16)(lsbtab[(n)]))
#define	LSBUMP	4				/* 4 word entries		*/
#endif
#endif
#endif

#if defined (VMS) || defined (LDS_BUILD)
	short	rline;					/* Rule: line			*/
	extern  int dflag;
	extern  char pname[];
#endif

#include "ls_rule1.c"
#ifdef GERMAN
#include "bachus.h"
#include "walker.c"
#include "allorules.c"
//#include "hyphenate.c"
#endif
/*
 *	Function Name:
 *	ls_rule_do_lts	
 *
 *	Description:      
 *	this function calls ls_rule_lts and ls_rule_ltsout to actually
 *	pronounce the word
 *
 *	Arguments:            
 *	LPTTS_HANDLE_T phTTS
 *	LETTER *lp2 	The left bounding ppinter to the word
 *	LETTER *lp1		The right boundiong pointer to the word
 *
 *	Return Value:
 *	None
 *
 *	Comments:
 *	For acna call the acna lts rules.  for compatibility in non acna
 *	there are two extra fields passed to ls_rule_lts
 *
 */
void ls_rule_do_lts(LPTTS_HANDLE_T phTTS,LETTER *lp2,LETTER *lp1)
{ 
#ifdef GERMAN
	// modified for bachus REWT 
	LETTER *p;
//	GERLETTER *pp;             // German letters are different (!?)
	int i;
	BOOL retval;
	GERLETTER wordin[MAX_BACHUSLETTERS];     // input to bachus
	GERLETTER wordout[MAX_BACHUSLETTERS];    // output of bachus' morphemizer
	GERLETTER outphonemes[MAX_BACHUSLETTERS];  
	//LETTER wordback[MAX_BACHUSLETTERS];      // going back to Dectalk
#endif
	PLTS_T pLts_t;
#ifdef ACNA
	short	sel_lang;
	PKSD_T pKsd_t;
#endif

	pLts_t = phTTS->pLTSThreadData;
#ifdef GERMAN
	/* The BACHUS stuff is below  REWT */
 
	/* First: prie a word out of Dectalk's claws:*/

	for (i=0, p=lp2; (i<MAX_BACHUSLETTERS)&&(p!=lp1); i++,p++) wordin[i]=(GERLETTER) p->l_ch;
	wordin[i]='\0';

	/* 2nd: hand it over to bachus: */

	retval=morphemize_word(wordin, 
		wordout, 
		outphonemes, 
		pLts_t->bachus_wordgrammarinfo);
// eab updated for bts10187 new junk node
//		pLts_t->bachus_trennung);

	
//		printf("reval %d <Bachus> %s -> %s ->/%s/\n",retval,wordin,wordout,outphonemes);    // appears in debug windo
//	else printf("no clue: %s\n",wordin);
	/* 3rd: smuggle it back into Dectalk: */
	if (retval==1)
	{	
      ls_util_send_asky_phone_list(phTTS, outphonemes);
	  return;
	}
	//lp1=wordback;    // becomes again right bound pointer
	//lp2=wordback;    // becomes again left bound pointer
//	pp = wordout;
	/*
	for (i=0; (i<MAX_BACHUSLETTERS)&& ((*pp)!=0); i++, p++)
		{	
			lp1->l_ch = *pp++;  // make LETTER's of bachus' output
			lp1++;
		}*/
//	lp1->l_ch = 0;
	

	/* lp1 and lp2 are now pointing to a local buffer,
	   which is generated in this function */
#endif
#ifdef ACNA
	pKsd_t = phTTS->pKernelShareData;

	if(pKsd_t->pronflag & PRON_ACNA_NAME)
	{
		sel_lang = lsa_util_id_name(pLts_t,lp2,lp1);
		/* debug switch */
		if((pKsd_t->logflag & LOG_NAME_TYPES) || DT_DBG(LTS_DBG,0x080))
			lsa_util_print_ntype(pLts_t,sel_lang);
		ls_rule_lts(phTTS,lp2,lp1,NAME_ENGLISH,sel_lang);
		/*  namef = 0; */
		pKsd_t->pronflag &= (~PRON_ACNA_NAME);
	}	
	else
	{
		ls_rule_lts(phTTS,lp2, lp1,0,0);
		/* namef=0; */
	}
#else
#ifndef FRENCH
	ls_rule_lts(phTTS,lp2, lp1,0,0);
#endif	// FRENCH
#endif

	/* set defaulted form class to noun */
    /*
	   GL 06/11/1997 BATS#386 only set formclass to NOUN if don't have
	   the formclass info.
	*/
    /*
	   GL 07/08/1998 BATS#705 remove this line of code for PH
	*/
    /*if (pLts_t->fc_struct[pLts_t->fc_index] == 0)
         pLts_t->fc_struct[pLts_t->fc_index] = 0x400; */
                                   
#if (defined ENGLISH) || (defined GERMAN)
	ls_rule_lts_out(phTTS);
#endif
}

/*
 *	Function Name:
 *	ls_rule_show_phone
 *
 *	Description:
 * 	Display the phoneme chain,
 * 	along with a little title and the flags.
 * 	This is just a big nop if the "dflag" isn't set.
 * 	The calls to this in the "lts" mainline are just a
 * 	null body macro on the board.
 *
 *	Arguments:            
 *	PHONE	*pp1
 *	PHONE	*pp2
 *	char	*title
 *
 *	Return Value:
 *
 *	Comments:
 *
 */

int ls_rule_show_phone(PHONE *pp1,PHONE *pp2,char *title)
{
#if defined (VMS) || defined (LDS_BUILD)
	if (dflag == FALSE)			/* Not debugging.	*/
		return(1);
	printf("After %s:\n", title);
	while (pp1 != pp2) {			/* For the whole chain.	*/
		printf("%08X ", pp1);
		putchar('"');
		putchar(pname[pp1->p_sphone]);
		putchar(pname[pp1->p_uphone]);	/* pnames[SIL] = " "	*/
		putchar('"');
		if (pp1->p_flag!=0 || pp1->p_stress!=SNONE) 
		{
			putchar(' ');
			if ((pp1->p_flag&PFDASH) != 0)
			{
				putchar('-');
			}
			else
			{
				putchar(' ');
			}
			if ((pp1->p_flag&PFSTAR) != 0)
			{
				putchar('*');
			}
			else
			{
				putchar(' ');
			}
			if ((pp1->p_flag&PFHASH) != 0)
			{
				putchar('#');
			}
			else
			{
				putchar(' ');
			}
			if ((pp1->p_flag&PFPLUS) != 0)
			{
				putchar('+');
			}
			else
			{
				putchar(' ');
			}
			if ((pp1->p_flag&PFSYLAB) != 0)
			{
				putchar('S');
			}
			else
			{
				putchar(' ');
			}
			if ((pp1->p_flag&PFRFUSE) != 0)
			{
				putchar('R');
			}
			else
			{
				putchar(' ');
			}
			if ((pp1->p_flag&PFLEFTC) != 0)
			{
				putchar('L');
			}
			else
			{
				putchar(' ');
			}
			if ((pp1->p_flag&PFBLOCK) != 0)
			{
				putchar('B');
			}
			else
			{
				putchar(' ');
			}
			if (pp1->p_stress == SUN)
			{
				printf(" SUN");
			}
			if (pp1->p_stress == SPRI)
			{
				printf(" SPRI");
			}
			if (pp1->p_stress == SSEC)
			{
				printf(" SSEC");
			}
			if (pp1->p_stress == S1LEFT)
			{
				printf(" S1LEFT");
			}
			if (pp1->p_stress == S2LEFT)
			{
				printf(" S2LEFT");
			}   
		}	/*	if (pp1->p_flag!=0 || pp1->p_stress!=SNONE) */

		putchar('\n');
		pp1 = pp1->p_fp;		/* Follow chain along	*/
	}

#endif /* #ifdef VMS */
    return(0);
} 


 
 
/*
 *	Function Name:
 *	ls_rule_phone_alloc
 *
 *	Description:
 * 	Allocate a new
 * 	phoneme from the list of
 * 	free phoneme nodes. Return a
 * 	pointer to the new node,
 * 	or NULL if there are no nodes
 * 	left in the free list.
 *
 *	Arguments:            
 *		PLTS_T 	pLts_t
 *
 *	Return Value:
 *
 *	Comments:
 *
 */
PHONE *ls_rule_phone_alloc(PLTS_T pLts_t)
{
	 PHONE	*pp;

	if ((pp=pLts_t->pflp) != NULL)
	{
		pLts_t->pflp = pp->p_fp;
//		pp->p_ip = NULL;
                pp->p_fp = pp->p_bp = NULL;
	}
	return (pp);
}

/*
 *	Function Name:
 *	ls_rule_phone_free
 *
 *	Description:
 * 	Put a phoneme node back
 * 	onto the list of free phoneme
 * 	nodes, for use by "ls_rule_phone_alloc".
 *
 *	Arguments:            
 *		PLTS_T 	pLts_t
 *		PHONE *pp
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 */
void ls_rule_phone_free(PLTS_T pLts_t,PHONE *pp)
{
	pp->p_fp = pLts_t->pflp;
	pLts_t->pflp = pp;
}                               

      
