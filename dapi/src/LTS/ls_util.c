/*
 ***********************************************************************
 *                                                                      
 *                           Copyright (c)                              
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.    
 *    © SMART Modular Technologies 1999. All rights reserved.    
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
 *    File Name:        ls_util.c
 *    Author:           Matthew Schnee                                         
 *    Creation Date:	02/06/96                                                   
 *                                                                             
 *    Functionality:
 *	  Collection of utility routines used in other mondule.                                                           
 *                                                                             
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	-----------		---------------------------------------
 *	001 DGC		04/05/1985		hanged some [|] to [x] as per DHK.
 *	002 DGC		04/08/1985		Changed the third argument to the
 *                          	ls_util_lookup routines to conditionally block
 *                          	the output of ")" and "(".
 *	003 DGC		04/16/1985		Changes for Tony. Add "-able" (2 pass).
 *                          	Add "-ness", "-ize" (dumb).
 *	004 DGC		05/10/1985		Undid 001, sounded bad.
 *	005 DGC		05/15/1985		Fixed insertion of [|] in plurals.
 *                          	Didn't insert [|] in words like "references".
 *	006 DGC		05/17/1985		"TT" is a pair more often than it is not.
 *                          	Removed it from the blocking list in the pair
 *                          	deletion routine.
 *	007 DGC		05/18/1985		Added "-ings", which works just like "-ing"
 *                          	except for the added [z]. Added "-ers", which
 *                          	is just like "-er" except for the added [z].
 *                          	These are conditional, in case Tony and/or
 *                          	Dennis change their minds.
 *	008 DGC		05/24/1985		Changed "lastlook" to the more general "lphone".
 *                          	Look in "ls1.c" for the reason.
 *	009 DGC		06/05/1985		Change 05 was not done quite right; Dennis
 *                          	nd I didn't understand one another.
 *	010 DGC		06/27/1985		Made "-ers" work right.
 *	011 DGC		07/18/1985		Added some conditional code to make the
 *                       		ss-es" and "sh-es" work the way that Tony
 *                       		thinks it should work.
 *	012 DGC		08/12/1985		"ment" used to be [m|nt], changed to [mxnt]
 *                          	to be the same as the dictionary.
 *	013 DGC		09/18/1985		Stylistic changes, suggested by "lint".
 *	-----------------     		First 23 class release, voided out by Engineering.
 *	014 DGC		12/03/1985		The two dictionary searches (ls_dict_blook, ulook)
 *                          	were in the wrong order. The user dictionary
 *                          	must be searched first. Thanks to WeatherBank.
 *	----------------        	Released as C5005 V1.0 firmware.
 *	015 DGC		10/21/1986		Changes for KRM.
 *	016 EAB		11/29/1989		Changes for NKR-It's OK as is becuase NKR has a user dictionary.
 *  017 MGS		02/07/1996		File created and functions move in    
 *	018	MGS		02/20/1996		Added functions ls_util_dump_cword and
 *								ls_util_dump_llp_rlp 
 *	019	MGS		02/26/1996		Fixed bossible bug in ls_util_lookup
 *	020	MGS		02/27/1996		Added function headers and reformated code
 *	021	MGS		03/05/1996		Added function ls_util_lts_init
 *	022	MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 *	023	GL		07/29/1996		add ls_util_write_pipe() function
 *	024	GL		09/11/1996		add dbgwins handler for WIN32
 *  025	GL		10/03/1996		add Spanish ls_util_is_ordinal() code
 *	026	GL		10/24/1996		remove the unused index mark code handling code.
 *  027 GL		12/02/1996		add code to pass the RESET to PH
 *  028 GL      12/05/1996      remove the DTEX language pipe hack
 *  029 GL		12/11/1996		remove the WIN32 language pipe hack
 *  030 GL		02/01/1996      add ls_util_is_aword() to indentify the legal word string
 *  031	GL		03/21/1997	    for BATS#308
 *							    add LTD 4200 debug switch for data dump.
 *  032 GL              04/21/1997              BATS#357  Add the code for __osf__ build 
 *  033 MGS             07/22/1997              BATS#412  fixed « and ¬ problem 
 *  034 GL              09/24/1997              BATS#470  Add LDS debug switch 
 *  035 DR              09/30/1997		UK BUILD: added some uk stoff 
 *  036 MGS				10/17/97		Edited to pass form class to ph
 *  037 GL      10/13/1997      For BATS#486 remove English only ACNA setting
 *  032	tek		13nov97			bats404: new index codes (originally aug97)
 *  033 MFG    04/12/1998 added phonme tranlation for debug 0x4200
 *  034 MFG    04/29/1998 added logging to dbglog.txt for debug commands 0x4040,0x4002,0x4008,0x4200
 *  035 MFG		05/19/98	excluded dbglog logging when build 16-bit code (MSDOS)	 
 *	036	MFG		06/09/98	cleaned up 4020 logging screened out eronenous spaces coming through 
 *  037	mfg		06/22/98	Added support for LANG_latin_american
 *  038	tek		08/20/98		support for ConvertToPhoneme
 *  039	GL		09/01/98	BATS#755 only send one word_class per word.
 *							BATS#758 use separated language tags for each language
 *									 also change PFD to PFGR, PFSPAIN to PFSP.
 *  040	GL		09/02/98	block away the new code in ls_util_write_pipe() from msdos.
 *  041 ETT		10/05/1998  Added Linux code.
 *  042	GL		10/19/1998		BATS#773 send one word_class for each word.
 *  043	GL		11/20/1998		BATS#828 use LTS_DEBUG to replace _DEBUG
 *  044	MGS		08/22/1999		Change #ifdef LTS_DEBUG to #if LTS_DEBUG because of VMS debugging code
 *								that was turned on by accident
 */   
#include "ls_def.h"
extern char *form_class_strings[];

 /*
 *      Function Name:  ls_util_dump_cword
 *
 *      Description:
 *          This function dumps the contents of the word array passed to it
 *          to the screen along with the message in message
 *
 *      Arguments:
 *          LETTER word[]   INPUT - An array of letter structures hat  holds a word
 *          char *message   INPUT - A text message to be printed with the word
 *
 *      Return Value:
 *          None
 *
 *      Comments:
 *              The word must be terminated by an EOS in the l_ch field of the letter
 */
void ls_util_dump_cword(LETTER word[],char *message)
{
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
	FILE *fp;
#endif
	LETTER *llp;
	llp=&word[0];

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
#ifdef PRINTFDEBUG
	printf ("%s -- ", message);
#endif
	fp=fopen("output.log","a");
	fprintf(fp,"%s -- ",message);
#else
    printf ("%s -- ", message);
#endif

	while (llp->l_ch!=EOS)
	{                          

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
#ifdef PRINTFDEBUG
		printf("%c(%02x)",llp->l_ch,llp->l_ch);
#endif
		fprintf(fp,"%c(%02x)",llp->l_ch,llp->l_ch);
#else
		printf("%c(%02x)",llp->l_ch,llp->l_ch);
#endif 
		++llp;
	}          
	

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
#ifdef PRINTFDEBUG
	printf ("\n");
#endif
	fprintf(fp,"\n");
	fclose(fp);
#else
    printf ("\n");
	printf ("\r");
#endif

}
/*
 *      Function Name:  ls_util_dump_llp_rlp
 *
 *      Description:
 *      	This function dumps the data between the llp and rlp pointers
 *          to the screen along with the message in message
 *
 *      Arguments:
 *          LETTER *llp     INPUT - pointer to the beginning of the word
 *          LETTER *rlp     INPUT - pointer to the EOS at the end of the word
 *          char *message   INPUT - A text message to be printed with the word
 *                                              
 *      Return Value:
 *          None
 *
 *      Comments:
 *          rlp must be greater than or equal to llp
 */

void ls_util_dump_llp_rlp(LETTER *llp, LETTER *rlp,char *message)
{       

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
	FILE *fp;
	fp=fopen("output.log","a");
	fprintf(fp,"%s -- ",message);
#ifdef PRINTFDEBUG
    printf ("%s -- ", message);
#endif
#else
    printf ("%s -- ", message);
#endif

	while (llp!=rlp)
	{
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
#ifdef PRINTFDEBUG
		printf("%c(%02x)",llp->l_ch,llp->l_ch);
#endif
		fprintf(fp,"%c(%02x)",llp->l_ch,llp->l_ch);
#else
		printf("%c(%02x)",llp->l_ch,llp->l_ch);
#endif          	    
		++llp;
	}      
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
#ifdef PRINTFDEBUG
	printf ("\n");
#endif
	fprintf(fp,"\n");
	fclose(fp);
#else
   printf ("\n");
   printf ("\r");
#endif
}       

/*
 *      Function Name:  ls_util_dump_lsp_endp
 *
 *      Description:
 *      	This function dumps the data between the lsp and endp pointers
 *          to the screen along with the message in message
 *
 *      Arguments:
 *			short type		0 - p_stress dump
 *							1 - p_sphone dump
 *							2 - p_uphone dump
 *          PHONE *lsp      INPUT - pointer to the beginning of the word
 *          PHONE *endp     INPUT - pointer to the EOS at the end of the word
 *          char *message   INPUT - A text message to be printed with the word
 *                                              
 *      Return Value:
 *          None
 *
 *      Comments:
 *          endp must be greater than or equal to lsp
 */

void ls_util_dump_lsp_endp(short type, PHONE *lsp, PHONE *endp,char *message)
{
PHONE *pp1;       

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
	FILE *fp;
	fp=fopen("output.log","a");
	fprintf(fp,"%s -- ",message);
#ifdef PRINTFDEBUG
    printf ("%s -- ", message);
#endif
#else
    printf ("%s -- ", message);
#endif

    pp1 = lsp;
	while (pp1 != endp)
	{
		switch(type)
		{
		  case 0:
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
#ifdef PRINTFDEBUG
				printf("(%d)",pp1->p_stress);
#endif
				fprintf(fp,"(%d)",pp1->p_stress);
#else
				printf("(%d)",pp1->p_stress);
#endif
				break;          	    
		  case 1:
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
#ifdef PRINTFDEBUG
				printf("(%d)",pp1->p_sphone);
#endif
				fprintf(fp,"(%d)",pp1->p_sphone);
#else
				printf("(%d)",pp1->p_sphone);
#endif
				break;          	    
        }
        
		pp1 = pp1->p_fp;
	}      
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
#ifdef PRINTFDEBUG
	printf ("\n");
#endif
	fprintf(fp,"\n");
	fclose(fp);
#else
   printf ("\n");
   printf ("\r");
#endif
}       

    
/*
 *      Function Name:
 *              ls_util_is_dot  
 *
 *      Description:      
 *      		checks to see if the character in the current item is as dot '.'
 * 				Return TRUE if the character in the
 * 				current item is an ASCII ".". Return FALSE if it
 * 				is anything else. This is used in  few places to decide
 * 				if we are in an abbreviation context.
 *
 *      Arguments:                                         
 *              PLTS_T pLts_t
 *
 *      Return Value:
 *              TRUE if the current iten is a dot '.'
 *              False otherwise
 *
 *      Comments:          
 *              this function uses the global citem variable
 *              this function is used in a few places to decide if this is 
 *              an abbreviation context
 *
 */
int ls_util_is_dot(PLTS_T pLts_t)
{
	if (pLts_t->citem.i_word[0] == ((PFASCII<<PSFONT)|'.'))
	{
		return (TRUE);
	}
	return (FALSE);
}
/*
 *      Function Name:             
 *              ls_util_is_name
 *
 *      Description:       
 *              this function decides weather or not the word is a name
 *
 *      Arguments:                                                 
 *              LETTER *llp		The left bounding pointer to the word
 *              LETTER *rlp     The right bounding pointer to the word
 *
 *      Return Value:                                             
 *              TRUE if the word is a name
 *              FALSE otherwise
 *
 *      Comments:          
 *              this function returns FALSE for non acna
 *
 */
/* for non acna, everything is not a name */    
int ls_util_is_name(LPTTS_HANDLE_T phTTS, LETTER *llp,LETTER *rlp)
{
#ifdef ACNA
	PLTS_T  pLts_t;
	PKSD_T  pKsd_t;

	pLts_t = phTTS->pLTSThreadData;
	pKsd_t = phTTS->pKernelShareData;   
	if(pKsd_t->pronflag & PRON_ACNA_NAME)
		return(TRUE);
	if((pKsd_t->modeflag & MODE_NAME) == 0)
		return(TRUE);
	if(pLts_t->fc_index == 0)
		return(FALSE);
	if((*llp).l_ch < 64 || (*llp).l_ch > 97 )/*first character upper??*/
		return(FALSE);
	for(llp++;llp<rlp;llp++)
		if( (*llp).l_ch  >122 ||  (*llp).l_ch <97) /*the rest lower*/
			return(FALSE);
	pKsd_t->pronflag |= PRON_ACNA_NAME;
		return(TRUE);
#else
	return(FALSE);
#endif
}
/* JDB: this function must be different for Spanish! Push it outside of core code... ? 
 *      Function Name:  
 *              ls_util_is_ordinal
 *
 *      Description:          
 *              checks to see if the number looks like an ordinal
 *
 *      Arguments:                                           
 *              NUM *np         The number
 *
 *      Return Value:             
 *              TRUE if it looks like a number
 *              FALSE otherwise
 *
 *      Comments:
 *              The caller has already checked that
 *              there is no sign, and that there are exactly 2 characters
 *              after the characters scanned off by "parsenumber".
 *              Return TRUE if all looks good. The details for speaking
 *              ordinals is all in "ls_proc_do_number". The number has all been
 *              zapped to lower case, so you can look at the extra
 *              bytes in a case insensitive fashion.
 *
 */ 
int ls_util_is_ordinal(LPTTS_HANDLE_T phTTS, NUM *np)
{
	  PLTS_T  pLts_t;
	  LETTER        *lp;
	  int   ud;

	  pLts_t = phTTS->pLTSThreadData;

	if (np->n_ilp==NULL || np->n_flp!=NULL || np->n_elp!=NULL)
		return (FALSE);
	lp = np->n_irp;                         /* Just past right.     */
	ud = (lp-1)->l_ch;                      /* Unit digit.          */
	if (ud==0xBC || ud==0xBD)               /* Things like "1 1/2". */
		return (FALSE);
	if (lp>np->n_ilp+1 && (lp-2)->l_ch=='1')
		ud = '0';
#ifdef ENGLISH
	switch (ud) 
	{
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
#endif /* #ifdef ENGLISH */ 
#ifdef SPANISH
	if (lp->l_ch==186)
	{
			pLts_t->ord = 1;
			return(TRUE);
	}
	if (lp->l_ch==170)
	{
			pLts_t->ord = 2;
			return(TRUE);
	}

#endif /* #ifdef SPANISH */
	return (FALSE);
}                

/*
 *      Function Name:  
 *          ls_util_is_year()
 *      Description:
 *
 *		 	Check to see if the digit group
 * 			enclosed by "llp" and "rlp" looks enough
 * 			like a year to be spoken by "ls_proc_do_4_digits". Years
 * 			are 4 characters long, all digits. The first character
 * 			must not be a zero ("0100" isn't a year). The middle two
 * 			digits must not both be zero ("2000" is best read as a
 * 			number, and "2002" sounds stupid as "twenty zero two").
 * 			Return TRUE or FALSE.
 *
 *      Arguments:
 *          LETTER *llp      	INPUT - pointer to the beginning of the word
 *          LETTER *rlp        	INPUT - pointer to the EOS at the end of the word
 *
 *      Return Value:
 			int
 *
 *      Comments:
 *
 */
int ls_util_is_year(LETTER *llp, LETTER *rlp)
{
	LETTER        *tlp1;
	int   ndig;

	ndig = 0;                               /* Count digits, check. */
	tlp1 = llp;                             /* for all digits.      */
	while (tlp1 != rlp) 
	{
		if (!IS_DIGIT(tlp1->l_ch))
			return (FALSE);
		++ndig;
		++tlp1;
	}
	/* MGS 07/22/97 BATS #412 */
	if ((rlp-1)->l_ch==0xBC || (rlp-1)->l_ch==0xBD) /* don't let years have 1/2 or 1/4 in them */
		return (FALSE);
	if (ndig != 4)                          /* Must be 4 digits.    */
		return (FALSE);
	if (llp->l_ch == '0')                   /* No initial "0", no   */
		return (FALSE);                 /* imbedded "00" pair.  */
	if ((llp+1)->l_ch=='0' && (llp+2)->l_ch=='0')
		return (FALSE);
	return (TRUE);
}
/*
 *      Function Name:  
 *			ls_util_copyword
 *
 *      Description:
 * 			This routine copies a word,
 * 			starting at the beginning and ending at the
 * 			EOS at the end of the word. It is used when lookahead
 * 			has required that the next word in the input stream be
 * 			considered, before a decision can be made on how
 * 			a chunk of text is spoken.
 *
 *      Arguments:
 *			LETTER        *tlp
 * 			LETTER        *flp
 *
 *      Return Value:    
 *
 *      Comments:
 *
 */
void ls_util_copyword(LETTER *tlp, LETTER *flp)
{
	while (flp->l_ch != EOS) 
	{
		tlp->l_ch = flp->l_ch;
/* GL 10/23/1996, remove unused index handling code */
#if 0
		tlp->l_ip = flp->l_ip;
#endif
		++tlp;
		++flp;
	}
	tlp->l_ch = EOS;
	tlp->l_ip = NULL;
}
 
/*
 *      Function Name:  
 *			ls_util_send_phone_list
 *
 *      Description:
 * 			Send out a SIL terminated
 * 			list of phonemes in the USA phonemic
 * 			set. Just a loop that calls the general
 * 			"sendphone" routine.
 *
 *      Arguments:
 *
 *      Return Value:
 *
 *      Comments:
 *
 */
void ls_util_send_phone_list(LPTTS_HANDLE_T phTTS,char *pp)
{
	  int   ph;

	while ((ph = *pp++) != SIL)
		ls_util_send_phone(phTTS,ph);
}

/*
 *      Function Name:  
 *			ls_util_send_phone()
 *
 *      Description:
 * 			Send a phoneme, which is always in the
 * 			USA font, to the synthesizer task via an interprocess
 * 			pipe. The phoneme is saved in the external variable "lphone".
 * 			Since this is used by everybody (except the dictionary code;
 * 			they are special) to put out phonemes, this arranges that
 * 			the last phoneme put out by anyone is in the external
 * 			for future examination.
 *
 *      Arguments:
 *			LPTTS_HANDLE_T phTTS
 *			int ph				phoneme code
 *
 *      Return Value:
 *
 *      Comments:
 *
 */
void ls_util_send_phone(LPTTS_HANDLE_T phTTS,int ph)
{
#ifdef __linux__
	short buf[1];
#else
	DT_PIPE_T   buf[1];
#endif
	PLTS_T  pLts_t;
	PKSD_T  pKsd_t;

#ifdef __linux__
	short buf2[4];
#else
	DT_PIPE_T buf2[4];
#endif

/* GL 09/24/1997  add LDS_BUILD flag for LDS run */
#if defined (VMS) || defined (LDS_BUILD)
	lds_sendphone(ph);
	return;
#endif

	pLts_t = phTTS->pLTSThreadData;
	pKsd_t = phTTS->pKernelShareData;
	pLts_t->lphone = ph;

#ifdef ENGLISH_US
	buf[0] = (PFUSA<<PSFONT) + ph;
#endif                 

#ifdef ENGLISH_UK
	buf[0] = (PFUK<<PSFONT) + ph;
#endif                 

#ifdef GERMAN
		buf[0] = (PFGR << PSFONT) + ph;
#endif
        
#ifdef SPANISH_SP
	buf[0] = (PFSP <<PSFONT) + ph;
#endif	

#ifdef SPANISH_LA
	buf[0] = (PFLA <<PSFONT) + ph;
#endif	

	/* debug switch */
	if (DT_DBG(LTS_DBG,0x040))
	{
#ifndef MSDOS
		if (pKsd_t->dbglog)			/*mfg 04/28/98 added debug support*/
		fprintf(pKsd_t->dbglog,"\nFC(%d)(%08x)",pLts_t->fc_index,pLts_t->fc_struct[pLts_t->fc_index]);
#endif
		printf("\nFC(%d)(%08x)",pLts_t->fc_index,pLts_t->fc_struct[pLts_t->fc_index]);
	}
	/* MGS 10/17/1997, send word class */
	/* GL 09/01/1998, BATS#755 only send out one word_class per word */
	/* GL 10/19/1998, BATS#773 don't send formclass if index == 0 */
	if ((pLts_t->fc_index != pLts_t->old_fc_index) && (pLts_t->fc_index != 0))
	{
		pLts_t->old_fc_index=pLts_t->fc_index;
		buf2[0]=WORD_CLASS + (2 << PSNEXTRA);
		buf2[1]=((pLts_t->fc_struct[pLts_t->fc_index])>>16);
		buf2[2]=((pLts_t->fc_struct[pLts_t->fc_index]) & 0x0000FFFF);
	//	printf("\nin lts FC(%d)(%08x)\n",pLts_t->fc_index,pLts_t->fc_struct[pLts_t->fc_index]);
		ls_util_write_pipe(pKsd_t,&buf2[0],3);
	}
	ls_util_write_pipe(pKsd_t,&buf[0],1);
}

/*
 *      Function Name:  ls_util_is_might
 *
 *      Description:
 * 			Look ahead, to see if a character, which
 * 			always has type "MIGHT", should be kept. Peek at
 * 			the next character. If it is a backspace, an ordinary
 * 			character, or a MIGHT character, return TRUE (keep).
 * 			Else return FALSE (stop). I changed the rules to
 * 			make MIGHT a keep flag so that "???" would be two
 * 			question marks and a question mark delimiter.
 *
 *      Arguments:
 *			LPTTS_HANDLE_T phTTS
 *                                              
 *      Return Value:
 *          int
 *
 *      Comments:
 *          
 */
int ls_util_is_might(LPTTS_HANDLE_T phTTS)
{
	int   t;
	PLTS_T pLts_t;
	pLts_t=phTTS->pLTSThreadData;

	ls_util_next_item(phTTS);
	if ((pLts_t->nitem.i_word[0]&PFONT) == (PFASCII<<PSFONT)) 
	{
		t = lsctype[pLts_t->nitem.i_word[0]&PVALUE] & TYPE;
		if (t==BACKUP || t==ALWAYS || t==MIGHT)
			return (TRUE);
	}
	return (FALSE);
}

/*
 *      Function Name:  ls_util_is_index
 *
 *      Description:
 * 			Return TRUE if the item pointed
 * 			to by "ip" is some kind of index mark.
 * 			This means index or index reply.
 *
 *      Arguments:
 *                                              
 *      Return Value:
 *          int
 *
 *      Comments:
 *          
 */
int ls_util_is_index(ITEM *ip)
{
	if (   ip->i_word[0]==INDEX 
		|| ip->i_word[0]==INDEX_REPLY //tek 01aug97 bats 404 added index types
#ifdef _WIN32
		|| ip->i_word[0]==INDEX_BOOKMARK
		|| ip->i_word[0]==INDEX_WORDPOS
		|| ip->i_word[0]==INDEX_START
		|| ip->i_word[0]==INDEX_STOP
#endif //_WIN32
	   )
	{
		return (TRUE);
	}
	return (FALSE);
}

/*
 *      Function Name:  ls_util_is_white
 *
 *      Description:
 * 			Return TRUE if the ITEM pointed to
 * 			by "ip" is some kind of white space. Yes,
 * 			this probably should be done with a bit
 * 			in the type. The HT and the VT
 * 			are not considered to be white space,
 * 			because they become "," and flush
 * 			phonemes. Essentially "white" means
 * 			"ls_task_do_right_punct would send a WBOUND".
 *
 *      Arguments:
 *                                              
 *      Return Value:
 *          int
 *
 *      Comments:
 *           
 */
int ls_util_is_white(ITEM *ip)
{
	  int   c;

	if ((ip->i_word[0]&PFONT) == (PFASCII<<PSFONT)) 
	{
		c = ip->i_word[0] & PVALUE;
		if (c==' ' || c==0xA0 || c==LF || c==CR || c==FF)
			return (TRUE);
	}
	return (FALSE);
}

/*
 *      Function Name:  ls_util_read_item
 *
 *      Description:
 * 			Arrange that the "citem" external
 * 			variable contains the next item of input
 * 			from the front end. Understandshow
 * 			lookahead works.
 *
 *      Arguments:
 *			LPTTS_HANDLE_T phTTS
 *                                              
 *      Return Value:
 *          None
 *
 *      Comments:
 *              
 */
void ls_util_read_item(LPTTS_HANDLE_T phTTS)
{
	int   i;    
	PLTS_T  pLts_t;
	pLts_t = phTTS->pLTSThreadData;

	if (pLts_t->nitem.i_nword == 0)
		ls_util_next_item(phTTS);
	pLts_t->citem.i_nword =pLts_t->nitem.i_nword;
	pLts_t->nitem.i_nword = 0;
	for (i=0; i<4; ++i)
		pLts_t->citem.i_word[i] = pLts_t->nitem.i_word[i];
}

/*
 *      Function Name:  ls_util_next_item
 *
 *      Description:
 * 			Read an item from the input stream,   and store it into the "nitem"
 * 			external variable. Used to peek ahead at the input, and called by
 * 			"ls_util_read_item" to actually do reading.
 *
 * 			Now we also handle the lts flushes and synchronous lts command here ...
 *
 *      Arguments:
 *			LPTTS_HANDLE_T phTTS
 *                                              
 *      Return Value:
 *          None
 *
 *      Comments:
 *             
 */

void ls_util_next_item(LPTTS_HANDLE_T phTTS)
{
	int     nextra,i; 
	DT_PIPE_T       lts_sync[2];
	P_PIPE linp;
	PLTS_T  pLts_t;
	PKSD_T  pKsd_t;
	
	short local_buf[4];
	
	pKsd_t = phTTS->pKernelShareData;
	pLts_t=phTTS->pLTSThreadData;

#ifdef ENGLISH_US                 
	linp = pKsd_t->lang_lts[LANG_english];
#endif
#ifdef ENGLISH_UK                 
	linp = pKsd_t->lang_lts[LANG_british];
#endif
#ifdef GERMAN
	linp = pKsd_t->lang_lts[LANG_german];
#endif
#ifdef SPANISH_SP
	linp = pKsd_t->lang_lts[LANG_spanish];
#endif
#ifdef SPANISH_LA
	linp = pKsd_t->lang_lts[LANG_latin_american];
#endif
#ifdef FRENCH
	linp = pKsd_t->lang_lts[LANG_french];
#endif

/*
 *  peek at the pipe words, handle ...
 */
	while(TRUE)
	{
		read_pipe(linp,&local_buf[0],READ_WORD_PIPE_PACKET);
//		read_pipe(linp,&(pLts_t->nitem.i_word[0]), 1);
		// fake the read_pipe
		pLts_t->nitem.i_word[0]=local_buf[0];

		/* debug switch */
		if (DT_DBG(LTS_DBG,0x001))
		{
			printf("\nLTS input:%c(%x)",pLts_t->nitem.i_word[0],pLts_t->nitem.i_word[0]);
		}

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
		/* GL 12/02/1996, pass RESET to PH pipe */
		if(((pLts_t->nitem.i_word[0]) & (PFONT|PVALUE)) == RESET)
		{
			ls_util_write_pipe(pKsd_t,&(pLts_t->nitem.i_word[0]),1);
			continue;		
        }
#endif        
        
#ifdef SPANISH
   		if(pLts_t->got_quote && pLts_t->nitem.i_word[0] == ((PFASCII<<PSFONT)+','))
		{
			
			/*eab 9/95got quote followed by comma*/
			/*treat next phrase differently if special word set.*/
			ls_util_send_phone(phTTS, S3);
		}
		if(pLts_t->nitem.i_word[0] == ((PFASCII<<PSFONT)+'"'))
		{
			pLts_t->got_quote=1;	
		}
		else
			pLts_t->got_quote=0;
#endif


		nextra = ((pLts_t->nitem.i_word[0])&PNEXTRA) >> PSNEXTRA;

/*
 *  commands synchronous to lts ...
 */

		if(((pLts_t->nitem.i_word[0]) & (PFONT|PVALUE)) == LTS_SYNC)
		{
			for(i=0;i<nextra;i++)
			{
				//read_pipe(linp,&lts_sync[i],1);
				// fake the read_pipe
				lts_sync[i]=local_buf[i+1];

		        /* debug switch */
		        if (DT_DBG(LTS_DBG,0x001))
		        {
			       printf("\nLTS input:%c[%x]",lts_sync[i],lts_sync[i]);
		        }
				if(pKsd_t->halting)
				{
					if(lts_sync[i] == SYNC)
					{
						pLts_t->nitem.i_nword = 1;
						pLts_t->nitem.i_word[0] = SYNC;
						return;
					}
					else if(lts_sync[i] == ((PFASCII<<PSFONT)+0xb))
					{
						pLts_t->nitem.i_nword = 1;
						pLts_t->nitem.i_word[0] = (PFASCII<<PSFONT)+0xb;

						return;
					} 
					break;
				}
			}
			if(pKsd_t->halting == FALSE)
			{
				switch(lts_sync[0])
				{
					case    LTS_MODE_SET    :
						pKsd_t->modeflag |= lts_sync[1];
						break;
					case    LTS_MODE_CLEAR  :
						pKsd_t->modeflag &= (~lts_sync[1]);
						break;
					case    LTS_MODE_ABS    :
						pKsd_t->modeflag = lts_sync[1];
						break;
					case    LTS_DIC_ALTERNATE       :
						pKsd_t->pronflag |= PRON_DIC_ALTERNATE;
						break;
					case    LTS_DIC_PRIMARY :
						pKsd_t->pronflag |= PRON_DIC_PRIMARY;
						break;
					case    LTS_ACNA_NAME   :
						pKsd_t->pronflag |=  PRON_ACNA_NAME;
						break;
				};
			}       
			continue;       /* read the next character in the pipe */
						/* go to while (TRUE) */
		}

		pLts_t->nitem.i_nword = nextra+1;
		pLts_t->nitem.i_word[0] &= ~PNEXTRA;
		for(i=1;i<=nextra;i++)
		{
			//read_pipe(linp,&(pLts_t->nitem.i_word[i]), 1);
			// fake the read_pipe
			pLts_t->nitem.i_word[i]=local_buf[i];

		    /* debug switch */
		    if (DT_DBG(LTS_DBG,0x001))
		    {
			       printf("\nLTS input:*%c[%x]",pLts_t->nitem.i_word[i],pLts_t->nitem.i_word[i]);
		    }
			if(pKsd_t->halting)
			{
				if(pLts_t->nitem.i_word[i] == SYNC)
				{
					pLts_t->nitem.i_word[0] = SYNC;
					pLts_t->nitem.i_nword = 1;

					return;
				}
				else if(pLts_t->nitem.i_word[i] == ((PFASCII<<PSFONT)+0xb))
				{
					pLts_t->nitem.i_nword = 1;
					pLts_t->nitem.i_word[0] = (PFASCII<<PSFONT)+0xb;

					return;
				} 
			}
		}
		if(pKsd_t->halting == FALSE ||
		  pLts_t->nitem.i_word[0] == SYNC ||
		    pLts_t->nitem.i_word[0] == ((PFASCII<<PSFONT)+0xb))
		{
			break;
		}

	}
}

/*
 *      Function Name:  ls_util_write_item
 *
 *      Description:
 * 			Write the item in the "citem"
 * 			external out to the synthesizer. This is
 * 			used when "ls_task_readword" decides that it wants
 * 			to simply copy an item through to the
 * 			output.
 *
 *      Arguments:
 *			LPTTS_HANDLE_T phTTS
 *                                              
 *      Return Value:
 *              None
 *
 *      Comments:
 *              rlp must be greater than or equal to llp
 */
void ls_util_write_item(LPTTS_HANDLE_T phTTS)
{                                           
	PLTS_T  pLts_t;
	PKSD_T  pKsd_t;

	pLts_t = phTTS->pLTSThreadData;
	pKsd_t = phTTS->pKernelShareData;

	pLts_t->citem.i_word[0] |= (pLts_t->citem.i_nword-1) << PSNEXTRA;
	ls_util_write_pipe(pKsd_t,&(pLts_t->citem.i_word[0]),pLts_t->citem.i_nword);
}

/*
 *      Function Name:  ls_util_lookup
 *
 *      Description:
 * 			Look up a word. The word is stored
 * 			in an array of LETTER structures, bracketed by
 * 			the "llp" and "rlp" pointers. The "context" is drawn
 * 			from the set in "lsdef.h". Return a standard lookup
 * 			status code. Output index marks on success.
 *
 *      Arguments:
 *			LPTTS_HANDLE_T phTTS
 *          LETTER *llp     INPUT - pointer to the beginning of the word
 *          LETTER *rlp     INPUT - pointer to the EOS at the end of the word
 *          int context     INPUT - context code.
 *                                              
 *      Return Value:
 *          int
 *
 *      Comments:
 *              rlp must be greater than or equal to llp
 */

int ls_util_lookup(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp, int context)
{
	int     flag;
	PKSD_T  pKsd_t;

	static  int fileflag =0;
	static  int fileflag2 =0;

	pKsd_t = phTTS->pKernelShareData;
	
	flag=ls_dict_blook(phTTS,llp,rlp,context);
	/* debug switch */
	
	if (DT_DBG(LTS_DBG,0x002))
	{
#ifndef MSDOS
		if (pKsd_t->dbglog)			/*mfg 04/24/98 added debug support*/
		fprintf(pKsd_t->dbglog,"\n(%d)",flag);
#endif
	printf("\n(%d)",flag);
	}

	/* debug switch */

	if (DT_DBG(LTS_DBG,0x008))
	  {
	    if (flag == 0)
	      {
		if (context == FABBREV)
		  {				
		    ls_util_dump_llp_rlp(llp,rlp,"\nAbbr Miss-hit:");
		    
#ifndef MSDOS
		    if (pKsd_t->dbglog)		/*see if dbglog.txt is open*/
		      {
			fprintf(pKsd_t->dbglog,"\nAbbr Miss-hit:",NULL);		/*mfg 04/16/1998 dttest logging*/
			/*mfg 04/16/1998 dttest logging*/
			while (llp != rlp)
			  {
			    fprintf(pKsd_t->dbglog,"%c(%02x)",llp->l_ch,llp->l_ch);
			    ++llp;
			  }
		      }
#endif
		  }
		else
		  {
		    ls_util_dump_llp_rlp(llp,rlp,"\nWord Miss-hit:");
		    
#ifndef MSDOS
				if (pKsd_t->dbglog)		/*see if dbglog.txt is open*/
				{	
				fprintf(pKsd_t->dbglog,"\nWord Miss-hit:");		/*mfg 04/16/1998 dttest logging*/	
					while (llp != rlp)
					{
					fprintf(pKsd_t->dbglog,"%c(%02x)",llp->l_ch,llp->l_ch);
					++llp;
					}
				}
#endif
			}
		}
	}
	return(flag);
}

/*
 */
 /*
 *      Function Name:  ls_util_pluralize
 *
 *      Description:
 * 			Put out the phonemes necessary to ls_util_pluralize
 * 			the last word. Based on the last phoneme, it puts out
 * 			[s], [z], [|s], or [|z]. The last phoneme put out by
 * 			anyone is in the external "lphone". This is used here,
 * 			and also by the "60s" code in "ls_task.c".
 *
 *      Arguments:
 *			LPTTS_HANDLE_T phTTS
 *                                              
 *      Return Value:
 *          None
 *
 *      Comments:
 *              rlp must be greater than or equal to llp
 */

/* JDB: this is all English specific */
void ls_util_pluralize(LPTTS_HANDLE_T phTTS)
{
#ifdef ENGLISH
	int     feats=0;
    PLTS_T pLts_t;
    pLts_t = phTTS->pLTSThreadData;
    
	if (pLts_t->lphone < TOT_ALLOPHONES)
		feats = pfeat[pLts_t->lphone];
	if ((feats&(PCONS|PSIB)) == (PCONS|PSIB)) 
	{
		ls_util_send_phone(phTTS,IX);
		ls_util_send_phone(phTTS,Z);
	} 
	else
	{ 
		if ((feats&(PCONS|PVOICE)) == PCONS)
		{
			ls_util_send_phone(phTTS,S);
		}
		else
		{
			ls_util_send_phone(phTTS,Z);
		}
	}
#endif
}


/*
 *      Function Name:  ls_util_is_vowel
 *
 *      Description:
 * 			This routine tests if the grapheme
 * 			"g" is a vowel. The grapheme "y" is always a
 * 			vowel in this case. Used by the "gu" and "qu"
 * 			testing in "ls_rule_add_graph" only.
 *
 *      Arguments:
 *  		int g		integer code for vowel
 *                                              
 *      Return Value:
 *          int
 *
 *      Comments:
 *              rlp must be greater than or equal to llp
 */

int ls_util_is_vowel(int g)
{           
#ifdef ENGLISH
	if (g==GA || g==GE || g==GI || g==GO || g==GU || g==GY)
#endif
#ifdef GERMAN
	if (g==GGA || g==GGE || g==GGI || g==GGO || g==GGUu || g==GGAx|| g==GGOx || g==GGUx)
#endif    	
		return (TRUE);
	return (FALSE);
}                                 

/*
 *      Function Name: ls_util_lts_init      
 *
 *  	Description: This function initializes the LTS thread task.
 *
 *      Arguments: PLTS_T pLts_t, PKSD_T pKsd_t
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void ls_util_lts_init( PLTS_T pLts_t, PKSD_T pKsd_t)
{
  pLts_t->wstate = UNK_WH;
  pLts_t->lphone = WBOUND;
  pLts_t->fc_index = 0;
  pLts_t->old_fc_index = -1;

}

/*
 *      Function Name: f_fprintf      
 *
 *  	Description: 
 *
 *      Arguments: char *str
 *
 *      Return Value: void 
 *
 *      Comments:
 *
 */
#ifdef MSDOS
void f_fprintf(char *str)
{
	printf("%s",str);
}
#else
void f_fprintf(char *str)
{
   FILE *dbgfp;

   dbgfp = fopen("debug.log", "a");
   fprintf(dbgfp, str);
   fclose(dbgfp);
}
#endif


/*
 *      Function Name:  ls_util_write_pipe
 *
 *      Description:
 *          This function will write pipe data to PH pipe.
 *
 *      Arguments:
 *          PKSD_T pKsd_t
 *          short *phone            phone code to send to PH
 *          short count             number of bytes
 *
 *      Return Value:
 *          None
 *
 *      Comments:
 *
 */
void ls_util_write_pipe(PKSD_T pKsd_t, short *phone, short count)
{
		
        P_PIPE  kinp;
		int i;
		short wcbyte0,wcbyte1;
		//tek 20aug98 we need phTTS to get at the phoneme-logging stuff
#ifndef MSDOS
		LPTTS_HANDLE_T phTTS = pKsd_t->phTTS;
#else
		LPTTS_HANDLE_T phTTS; 
#endif //MSDOS

		//gl  02sep98 these API codes for non-msdos only
#if !defined MSDOS && !defined __linux__
#if LTS_DEBUG
		{
			char szTemp[256]="l_u_w_p: ";
			int i;
			for (i=0;i<count;i++)
			{
				sprintf(szTemp,"%s %04hx ",szTemp,phone[i]);
			}
			strcat(szTemp,"\n");
			OutputDebugString(szTemp);
		}
#endif //LTS_DEBUG
		// tek 20aug98 decide if we need to log and act accordingly
		// the pointer isn't null, we're logging.
		if (phTTS->szPhonemeBuffer)
		{
			// loop and possibly log each..
			int iI;
			for (iI=0;iI<count;iI++)
			{
				short sIPhone = phone[iI]; // the whole (input) phone..
				short sMPhone = phone[iI]&0xFF; // the masked-off phone..
				// see if it's a phoneme.. (always PFUSA??)
				/* GL 09/01/1998 BATS#758 use different language tags for each language */
#ifdef ENGLISH_US
				if ( ((sIPhone>>PSFONT)&0xFF) == PFUSA)
#endif                 

#ifdef ENGLISH_UK
				if ( ((sIPhone>>PSFONT)&0xFF) == PFUK)
#endif                 

#ifdef GERMAN
				if ( ((sIPhone>>PSFONT)&0xFF) == PFGR)
#endif
        
#ifdef SPANISH_SP
				if ( ((sIPhone>>PSFONT)&0xFF) == PFSP)
#endif	

#ifdef SPANISH_LA
				if ( ((sIPhone>>PSFONT)&0xFF) == PFLA)
#endif	
				{
					// we only return the "phonemes" that are legal in 
					// a dictionary; this would be everything < TOT_ALLOPHONES
					// plus things between BLOCK_RULES and SBOUND
					if (  (sMPhone >= SBOUND)
						||((sMPhone <= BLOCK_RULES) && (sMPhone >= TOT_ALLOPHONES))
						)
						continue; // not one we're interested in.
					
					// if we have room
					if (phTTS->dwPhonemeBufferPtr < (phTTS->dwPhonemeBufferSize-4))
					{
						// index into the arpabet table..
						int iIndex = sMPhone*2;
						phTTS->szPhonemeBuffer[phTTS->dwPhonemeBufferPtr++] 
							= pKsd_t->arpabet[iIndex];
						phTTS->szPhonemeBuffer[phTTS->dwPhonemeBufferPtr++] 
							= pKsd_t->arpabet[iIndex+1];
					}

				}
			}
		}

#endif  /* #ifndef MSDOS && __linux__ */

#ifdef ENGLISH_US
        kinp = pKsd_t->lang_ph[LANG_english];
#endif

#ifdef ENGLISH_UK
	kinp = pKsd_t->lang_ph[LANG_british];
#endif

#ifdef SPANISH_SP
        kinp = pKsd_t->lang_ph[LANG_spanish];
#endif

#ifdef SPANISH_LA
        kinp = pKsd_t->lang_ph[LANG_latin_american];
#endif

#ifdef GERMAN
        kinp = pKsd_t->lang_ph[LANG_german];
#endif

#ifdef FRENCH
        kinp = pKsd_t->lang_ph[LANG_french];
#endif
		/* debug switch */
		/* GL 03/21/1997  dump the data before write_pipe */
		/* MFG 04/12/1998 added phonme tranlation for debug 0x4200 */
		if (DT_DBG(LTS_DBG,0x200) & ((*phone & 0xff) < PHO_SYM_TOT))
		{


			if (pKsd_t->phoneme_mode & PHONEME_ASCKY) 
               printf("%c",pKsd_t->ascky[(*phone & 0xff)]);
			else
			{

				switch(*phone & 0x1fff)
				{
				case BREATH_BREAK:
#ifndef MSDOS
					 if (pKsd_t->dbglog)
					 fprintf(pKsd_t->dbglog,"\n[breath_break]");
#endif
					 printf("[breath_break]");
					 break;

				case SYNC:
#ifndef MSDOS
					 if (pKsd_t->dbglog)
					 fprintf(pKsd_t->dbglog,"\n[sync]");
#endif
					 printf("[sync]");
					 break;

				case WORD_CLASS:
#ifndef MSDOS
				//	 if (pKsd_t->dbglog)
				//mfg_debug	 fprintf(pKsd_t->dbglog,"\n");
#endif
					wcbyte0 = phone[2];
					wcbyte1 = phone[1];
					for(i=0;i<32;i++)		
					{
						if (i < 16)
						{	
							if (wcbyte0 & 0001 == 1)	//check byte 0 in word class		
							{
#ifndef MSDOS
							if (pKsd_t->dbglog)
							fprintf(pKsd_t->dbglog,"[%s]",form_class_strings[i]);
#endif
							printf("[%s]",form_class_strings[i]);
							}
							wcbyte0 = wcbyte0 >> 1;
						}
						else
						{
							if (wcbyte1 & 0001 == 1)	//check byte 1 in word class		
							{
#ifndef MSDOS
							if (pKsd_t->dbglog)
							fprintf(pKsd_t->dbglog,"[%s]",form_class_strings[i]);
#endif
							printf("[%s]",form_class_strings[i]);
							}
							wcbyte1 = wcbyte1 >> 1;
						}
					}
						
									break;


				case RATE:			printf("[rate]");

#ifndef MSDOS
				  if (pKsd_t->dbglog)
				    fprintf(pKsd_t->dbglog,"\n[rate]");
#endif
									break;

				case CPAUSE:		printf("[cpause]");
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[cpause]");
#endif
									break;

				case PPAUSE:		printf("[ppause]");			
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[ppause]");
#endif
									break;

				case LAST_VOICE:	printf("[last_voice]");		
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[last_voice]");
#endif
									break;

				case LTS_SYNC:		printf("[lts_sync]");		
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[lts_sync]");
#endif
									break;

				case NEW_SPEAKER:	printf("[new_speaker]");	
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[new_speaker]");
#endif
									break;

				case NEW_PARAM:		printf("[new_param]");		
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[new_param]");
#endif
									break;

				case SAVE:			printf("[save]");			
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[save]");
#endif
									break;

				case INDEX:			printf("[index]");			
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[index]");
#endif
									break;

				case INDEX_REPLY:	printf("[index_reply]");	
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[index_reply]");
#endif
									break;

				case KILL_TASK:		printf("[kill_task]");		
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[kill_task]");
#endif
									break;

				case FLUSH_SYNC:	printf("[flush_sync]");		
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[flush_sync]");
#endif
									break;

				case PITCH_CHANGE:	printf("[pitch_change]");	
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[pitch_change]");
#endif
									break;

				case LATIN:			printf("[latin]");			
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[latin]");
#endif
									break;

				case PAPAUSE:		printf("[papause]");		
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[papause]");
#endif
									break;

				case CNTRLK:		printf("[cntrlk]");			
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[cntrlk]");
#endif
									break;

				case RESET:			printf("[reset]");			
					
#ifndef MSDOS
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[reset]");
#endif
									break;
#ifdef _WIN32
				case INDEX_BOOKMARK:printf("[index_bookmark]");	
					
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[index_bookmark]");
									break;

				case INDEX_WORDPOS:	printf("[index_wordpos]");	
					
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[index_wordpos]");
									break;

				case INDEX_START:	printf("[index_start]");	
					
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[index_start]");
									break;

				case INDEX_STOP:	printf("[index_stop]");		
					
									if (pKsd_t->dbglog)
									fprintf(pKsd_t->dbglog,"\n[index_stop]");
									break;
#endif
				default:
					
#ifndef MSDOS
				if (pKsd_t->dbglog)
				{
					if ((int)(pKsd_t->arpabet[(*phone & 0xff)*2]) != 32) /// filter out spaces
					{
					fprintf(pKsd_t->dbglog,"%c%c",pKsd_t->arpabet[(*phone & 0xff)*2],pKsd_t->arpabet[(*phone & 0xff)*2 + 1]);
					}
				}
#endif

				printf("%c%c",pKsd_t->arpabet[(*phone & 0xff)*2],pKsd_t->arpabet[(*phone & 0xff)*2 + 1]);			
				}
			}
			if ((*phone & 0xff) == 111)
			   printf("\n"); 

		}
		/* debug switch */  
		if (DT_DBG(LTS_DBG,0x800))
		{			
			/*mfg 04/27/98 when pipe is drained let the following pass through*/ 
			if ((*phone != SYNC) && (*phone != BREATH_BREAK) 
				&& (*phone != KILL_TASK) && (*phone != FLUSH_SYNC))
			return;
		}

        write_pipe(kinp,phone,count);

        return;
}
/*
 *      Function Name:  ls_util_is_aword
 *
 *      Description:
 *      	This function check the data between the llp and rlp pointers
 *          for a legal word string with only alphabet
 *
 *      Arguments:
 *          LETTER *llp     INPUT - pointer to the beginning of the word
 *          LETTER *rlp     INPUT - pointer to the EOS at the end of the word
 *                                              
 *      Return Value:
 *          TRUE   is an alphabet word with vowel
 *          FALSE  not an alphabet word or word without vowel
 *
 *      Comments:
 *          rlp must be greater than or equal to llp
 */
int ls_util_is_aword(LETTER *llp, LETTER *rlp)
{
	int flag=FALSE;
	       
	if (llp >= rlp) return(FALSE);
	while (llp!=rlp)
	{
		if (!(IS_ALPHA(llp->l_ch))) return(FALSE);
		if (IS_VOWEL(llp->l_ch)) flag=TRUE;
		++llp;
	}
	return(flag);      
}
       

