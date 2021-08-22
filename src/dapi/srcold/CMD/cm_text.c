#ifndef VOCAL
/************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000-2001 Force Computers Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
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
 *    File Name:    cm_text.c
 *    Author:       Ed Bruckert
 *    Creation Date:05-FEB-1996
 *
 *    Functionality:
 *    Rule and Clause based parser routines.
 *
 ***********************************************************************
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001  MGS 	03/21/1996	Added this revision history header.
 * 002	MGS		05/15/1996	Removed Ed's parser and added the call to the new parser
 * 003	MGS		05/20/1996	Added ginger's dictinonary search routine to getclause
 * 004	MGS		05/20/1996	Added cm_text_get_word to pick up the word from the input 
 *							so the dictionary search fgets a properly formatted word 
 * 005	MGS		05/21/1996	Added code for SAY_LINE mode in getclause so clause boundry 
 *							characters dont trigger it
 * 006	MGS		05/21/1996	removed cm_text_ablook and #include cm_text.h
 * 007  SIK		07/12/1996  Cleaning up and maintenance
 * 008	MGS		07/16/1996	Removed par_lookup_asc and added comments
 * 009	MGS		08/01/1996	Added code for the new indexing
 * 010  GL		08/22/1996	Fix the problem of screen reader with input_counter<3
 *                          need to handle index mark as well
 * 011	GL		08/30/1996	add cmd_flushing init code
 * 012  GL		09/04/1996	restore the input_counter<3 checking.
 * 013	GL		09/06/1996	add space to fix the rolling text problem.
 * 014  GL		09/25/1996  add checking 0x0fff for clause boundary
 * 015	GL		09/27/1996  change XON(0x11) to a space.
 * 016	GL		09/30/1996  add "-" as part of word in get_word()
 * 017  GL		10/10/1996  add code to handle the illegal cluster.
 * 018  SIK		10/10/1996	Add VOCAL #ifndef switch to support the VOCAL build 
 * 019	GL		10/25/1996  Fix SARAW hanging problem.
 * 020  GL		10/29/1996	move the mode_table processing code to getclause()
 * 021	GL		11/11/1996	Add US_AND_SP build flag to set par_lang_code to lang_curr.
 * 022	GL		11/22/1996  Fix the 0x0fff breaking problem
 * 023	GL		11/27/1996	Add switch to allow WIN32 pick up right language setting
 * 024  GL		12/11/1996	Use pKsd_t->lang_curr for WIN32.  Language flag
 *							will be set in ttsapi.c
 * 025	GL		12/13/1996	call cm_util_flush_init() for text flush
 * 026  GL		01/10/1997  remove the leading space add at 013(09/06/1996)
 *                          this will fix the ["]<text string> problem
 * 027  GL		01/22/1997	add roll_text in pCmd to fix both rolling text and
 *							["]problem
 * 028  GL		02/01/1997  checking ". " instead of ".0x0fff" for clause boundary.
 * 029  GL		02/03/1997  don't stop at ",", ":", ";" and '-' for clause boundary to
 *                          all pre-processor to process the e-mail record.
 * 030  GL		02/06/1997	add optional email processing step
 * 031	GL		02/07/1997	don't remove ")" if it is part of smiling face
 *							in mode_email
 * 032	GL		02/07/1997	get_word() should not catch 0x82
 * 033  GL		02/08/1997  catch record line by line in email mode. 
 * 034  GL		02/11/1997  fix the e-mail high-light mode problem. 
 * 035  GL		02/18/1997  add crying face's mouth support "("
 * 036  GL		02/27/1997  need to continue after replacing type_quot with space.
 *                          so this space can be place into clause buffer
 * 037  GL		03/03/1997  use last_punct to store the orignal character of type_quot
 * 038  GL		03/11/1997  for BATS#286
 *							don't change the right TYPE_quot character ")}>]" to space
 *							we need to use the rule to handle "(test)," and "(test)test"
 *                          differently.
 * 039  GL		04/02/1997  for BATS#331
 *                          add " in the TYPE_quot handling code 
 * 040  GL		04/03/1997  for BATS#334
 *                          fix DM mode problem in high light mode 
 * 041	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 * 042	GL		04/21/1997	BATS#360  remove spaces before "#define" or "#if" 
 * 043	GL		05/14/1997	BATS#373-376  fix the parser problem 
 * 044	MGS		08/22/1997	Added timing for parser debug switch 8100
 * 045	MGS		09/24/1997	BATS#469 Fix for NWS parserr problem
 * 046	GL		09/30/1997	BATS#475 Fix the e-mail header detection problem
 *                          by redesigning the detection code.
 *                          also remove the dummy language depended code.
 * 047	MGS		01/08/1998	BATS #446 fix c:\access32
 * 048	MGS		03/12/1998	Added code for the new binary parser
 * 049  CJL     03/18/1998  Removed specific path for dectalkf.h.
 * 050	GL		03/20/1998	BATS #631 to support the German abbreviation hit and
 *                          also support DM, DH 
 * 051	MFG		04/28/1998	added dbglog.txt logging for debug 
 *							switch 0x8008,0x8100,0x8004,0x8080,0x8040
 * 052	GL		05/15/1998	BATS #676 fix get_word routine to fix "test,test"
 * 053  MFG		05/19/1998	excluded dbglog logging when build 16-bit code (MSDOS)	 
 * 054	GL		06/16/1998	BATS #697 fix "Chrysler" spelling problem.  It is a logical error
 *                          in #676 fix
 * 055  ETT     10/05/1998  added linux code
 * 056	GL		11/20/1998	BATS#828 use CMD_DEBUG to replace _DEBUG
 * 057  MFG		01/08/1998	WINprintf not supported under Windows CE
 * 058  GL		03/03/1999	BATS#676,697 and 744 fix the coding error
 * 059	MGS		10/14/1999	BATS#900 Fixed indexing in spanish phone numbers
 * 060	MGS		10/14/1999	BATS#876 fix for UK phone numbers (part of it) 
 * 061  NAL		05/23/2000	Fixed a bunch of warnings
 * 062  CAB		05/23/2000	Added comment for sh4 debug fix
 * 063	MGS		07/14/2000	indexing fix found by sapi 5 work
 * 064	MGS		10/05/2000	Redhat 6.2 and linux warning removal
 * 065	MGS		11/10/2000	fix for another lucent/octel/avaya crash
 * 066	MGS		12/13/2000	added protection code to the parser buffers so they are null terminated.
 * 067	MGS		12/13/2000	Added code to change ae oe ue to umlated in german
 * 068	MGS		12/18/2000	add for german ae oe ue processing to umlated vowels after dic search
 * 069	MGS		01/04/2000	Made the german vowels thing recogmize case of the first letter
 * 070	CAB		01/19/2001	Fixed copyright info
 * 071	EAB		03/08/2001 	Added fix for german neue problem
 * 072	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 073	MGS		06/19/2001	Solaris Port BATS#972
 * 074	MGS		06/25/2001	Fixed spaces before clause punctuation.
 * 075	MGS		02/22/2002	Fixed e-mail mode
 * 076	MGS		04/03/2002	Single threaded lts
 * 077	MGS		04/11/2002	ARM7 port
 * 078	CAB		07/30/2002	Condensed repeated __osf__ code
 * 079	CAB		08/08/2002	Removed warnings
 */

/* #define DEBUG_PARSER  */ 
/* #define SKIP_PARSER */

#include "dectalkf.h"

#include "cm_def.h"
#ifdef ARM7
#include "string.h"
#endif

/* 12/11/1996 GL, use pKsd_t->lang_curr for all environment */
#define PAR_LANG_CODE pKsd_t->lang_curr

extern const unsigned short parser_char_types[];
extern const unsigned char *par_illegal_cluster[];
extern const unsigned char par_lower[];

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
// MGS		10/14/1999		BATS#876 fix for UK phone numbers (part of it) 
extern int _far par_dict_lookup(PKSD_T, char *, int);
#endif

//#ifdef WIN32
#ifndef __linux__
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
#ifdef NEW_BINARY_PARSER
#ifndef DEBUG
__inline void par_copy_index_list(pindex_data_t dest_index,
								  int		    dest_pos,
								  pindex_data_t src_index,
								  int		    src_pos,
								  int		    length)
{
	memcpy(dest_index[dest_pos].index,src_index[src_pos].index,length*sizeof(index_data_t));
}
__inline void par_copy_index(pindex_data_t dest_index,
							 int		   dest_pos,
							 pindex_data_t src_index,
							 int		   src_pos)
{
	memcpy(dest_index[dest_pos].index,src_index[src_pos].index,sizeof(index_data_t));
}
__inline int par_is_index_set(pindex_data_t indexes,
								int pos)
{
	if (indexes[pos].index[0]!=0 || indexes[pos].index[1]!=0 || indexes[pos].index[2]!=0)
	{
		return(1);
	}
	return(0);
}
#endif
#endif
#endif
#endif
//#endif

#ifdef EPSON_ARM7
void lts_loop(LPTTS_HANDLE_T phTTS,unsigned short *input)
{
	phTTS->main_lts_loop(phTTS,input);
}

#endif


/*
 *  Function Name: cm_text_get_word()  
 *
 *  Description:
 *		this function gets the next word from clausebuf and copies it to buf
 *
 *  Arguments: 
 *		INPUT	unsigned char *clausebuf	the input buffer 
 *		OUTPUT	unsigned char *buf			the output buffer
 *		INPUT	int			   which		0 process the word without the clause boundry
 *											1 leave the period on the word
 *
 *  Return Value:
 *		unsigned char *		a pointer to buf
 *
 *  Comments:
 *		Which == 1 is only used for the abbreviation lookup in the dictionary
 */
unsigned char *cm_text_get_word(unsigned char *clausebuf,unsigned char *buf,int which)
{
	int i=0,j=0;
	
	while ((char_types[clausebuf[i]] & MARK_space)!=0)
		i++;
	if (which==0)
	{
		/* GL 03/20/1998 BATS#631  include "." at mode 0 */
		/* GL 05/15/1998 BATS#676  "test,test"  should be treated as a one word for word catch */
		/* GL 06/16/1998 BATS#697   check "\0" to fix "chrysler" spelling problem */
		/* GL 03/03/1999 BATS#676,697,744   fix the coding error */
		while ((((char_types[clausebuf[i]] & (MARK_space | MARK_clause))==0) && (clausebuf[i]!='\0')) ||
			     (clausebuf[i] == '-') || (clausebuf[i] == '.') ||
			     (((char_types[clausebuf[i]] & MARK_punct) != 0) && (clausebuf[i+1]!='\0') && ((char_types[clausebuf[i+1]] & (MARK_space | MARK_clause))==0)) )
		{
//printf("#%c\n",clausebuf[i]);
			/* GL 02/07/1997  don't save control key */
			if (clausebuf[i] != 0x82)
			{
				buf[j]=clausebuf[i];
				j++;
			}
			i++;
		}
	}
	else
	{
		while ((((char_types[clausebuf[i]] & (MARK_space))==0) && (clausebuf[i]!='\0')) || (clausebuf[i] == '-'))
		{
//printf("*%c\n",clausebuf[i]);
			/* GL 02/07/1997  don't save control key */
			if (clausebuf[i] != 0x82)
			{
				buf[j]=clausebuf[i];
				j++;
			}
			i++;
		}
	}
	
	buf[j]='\0';
	return(buf);
}

/*
 *  Function Name: cm_text_getclause()  
 *
 *  Description:
 *		This function does the clause based rule processing.  
 *
 *  Arguments: LPTTS_HANDLE_T phTTS
 *
 *  Return Value:
 *
 *  Comments:
 *		The input to the clause buffer is attained from the instance pointer variable
 *		ParseChar
 *		
 *		pCmd_t->done is a flag that tells when to rin the preprocessor on the clause
 *		values and their meanings
 *			0		Add more charcters to the clause
 *			1		process the entire clause
 *			2		process 2/3 of the clause
 *
 *		phonemic mode
 *			any text between 0x80 and 0x81 in the output string is sent out usinf asck phonemes
 *			to LTS
 */
void cm_text_getclause(LPTTS_HANDLE_T phTTS)
{
	unsigned short int pipe_value;
	PCMD_T pCmd_t;
	PKSD_T  pKsd_t; 
	int i,j, mode,didit;
#ifdef SIMPLE_UMLAUT_CONVERSIONS
	int relook;
#endif
#ifndef EPSON_ARM7
	unsigned int k;	// NAL warning removal
#endif
	U32 temp_mode=0;
	U16 parser_flag;

#ifdef CMD_DEBUG // NAL warning removal
        U32 ulStartTime,ulEndTime;
#endif

	pCmd_t=phTTS->pCMDThreadData;
	pKsd_t=phTTS->pKernelShareData;
	/* save the current parser_flag */
	parser_flag = pCmd_t->ret_value.parser_flag;	
	

	/* checking cmd_flushing */
	if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
	{
		cm_util_flush_init(phTTS);
		return;
	}              
#ifdef SKIP_PARSER
		if (pCmd_t->ParseChar=='\0')
		{
			pCmd_t->ParseChar=' ';
		}
		if (pCmd_t->ParseChar== 0x0fff)
		{
			pCmd_t->ParseChar=' ';
		}			                                     
		if(pCmd_t->ParseChar == 0x11)
		{
			pCmd_t->ParseChar=' ';
		}			
		pipe_value = (PFASCII<<PSFONT)+pCmd_t->ParseChar;
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		return;
#endif /* end of skip_parser */ 

	/* 
	   GL 05/14/1997 BATS# 374-376 fix the e-mail parsing problem, need to
	   disable the <tab> function in the e-mail mode, to handle the e-mail
	   header like "From: <tab>....
	*/
	if ((pKsd_t->modeflag & MODE_EMAIL) != 0 &&
		(pCmd_t->email_header == 1) &&
		(pCmd_t->ParseChar == 0x9))
		pCmd_t->ParseChar = ' ';

	/* try to flush data for TAB, GL. 9/13/1996	*/
	/* hack for the table reading				*/
	/* it should take care of regular text with leading TAB */
	/* GL. 10/29/1996,  implement the mode_table to force HT, CR and LF to become
	   a contol-k.  Move the code to cm_text.c getclause() */
	if ((pKsd_t->modeflag & MODE_TABLE) == 0)
	{
		if (pCmd_t->ParseChar == 0x9)
		{
//			if (pCmd_t->last_char != 0xd && pCmd_t->last_char != 0x9)
			/* GL 03/03/1997  also check last_punct for issuing 0xb */
			if ((char_types[pCmd_t->last_char] & MARK_space) == 0 ||
			    pCmd_t->last_punct != 0)
				pCmd_t->ParseChar = 0xb;
			else
				pCmd_t->ParseChar = ' ';
		}
	}
	else
	{
		if (pCmd_t->ParseChar == 0x9 || pCmd_t->ParseChar == 0xa || pCmd_t->ParseChar == 0xd)
		{
			pCmd_t->ParseChar = 0xb;
		}		
	}		

	if (pCmd_t->punct_mode==PUNCT_pass || pCmd_t->skip_mode==SKIP_all)
	{
		if (pCmd_t->ParseChar=='\0')
		{
			pCmd_t->ParseChar=' ';
		}
		if (pCmd_t->ParseChar== 0x0fff)
		{
			pCmd_t->ParseChar=' ';
		}			
		if(pCmd_t->ParseChar == 0x11)
		{
			pCmd_t->ParseChar=' ';
		}			
		pipe_value = (PFASCII<<PSFONT)+pCmd_t->ParseChar;
#ifdef SINGLE_THREADED
		lts_loop(phTTS,&pipe_value);
#else
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif
		return;
	}	
	// add for double line breaking MGS
	// add fix for email mode BATS#985
	if (!(pKsd_t->modeflag & MODE_EMAIL) && pCmd_t->email_header != 1)
	if(	(pCmd_t->last_char == 0x0a && pCmd_t->ParseChar == 0x0a )|| 
		(pCmd_t->last_char == 0x0d && pCmd_t->ParseChar == 0x0d )|| 
		(pCmd_t->last_char == 0x0a && pCmd_t->ParseChar == 0x0d ))
	{
		pCmd_t->done=1;
		pCmd_t->ParseChar= 0xb;
	}
    /* GL 9/30/96  remove all TYPE_quot character for PUNCT_some mode */
	/* GL 11/22/96 can not check 0x0fff */
	if (pCmd_t->ParseChar <= 0xff && (parser_char_types[pCmd_t->ParseChar] & TYPE_quot) && (pCmd_t->punct_mode == PUNCT_some))
	{
		/* GL 02/18/1997  add smiling and crying face support */
		/* let these symbol go through */
	    if ((pKsd_t->modeflag & MODE_EMAIL) != 0 &&
		   ((pCmd_t->last_char == '^' && (pCmd_t->ParseChar == ')' || pCmd_t->ParseChar == '(')) ||
		    (pCmd_t->last_char == '-' && (pCmd_t->ParseChar == ')' || pCmd_t->ParseChar == '(')) ||
		    (pCmd_t->last_char == ':' && (pCmd_t->ParseChar == ')' || pCmd_t->ParseChar == '('))))
			pCmd_t->ParseChar=pCmd_t->ParseChar;
		else
		{
			/* GL 03/03/1997 save the orignal character before change it to space */
			pCmd_t->last_punct=pCmd_t->ParseChar;
			/* GL 03/11/1997, don't change these right TYPE_quot character to space */
			/* GL 04/02/1997, BATS#331 add " */
			/* MGS 01/08/1998 BATS #446 add \ */
			if (pCmd_t->ParseChar != ')' &&
			    pCmd_t->ParseChar != ']' &&
			    pCmd_t->ParseChar != '}' &&
			    pCmd_t->ParseChar != '"' &&
			    pCmd_t->ParseChar != '\\' &&
			    pCmd_t->ParseChar != '>')
			pCmd_t->ParseChar=' ';

		    /* GL 05/14/1997 BATS# 374-376 fix the e-mail parsing problem */
			/* force all " to space in the header section */
		    if ((pKsd_t->modeflag & MODE_EMAIL) != 0 &&
				(pCmd_t->email_header == 1) &&
				(pCmd_t->ParseChar == '"'))
				pCmd_t->ParseChar=' ';

			/* GL 02/27/1997 need to continue from here */
		    /* return; */
		}
	}
	else
	{
		/* GL 03/03/1997 set last_punct to zero if ParseChar is not a TYPE_quot */
		pCmd_t->last_punct=0;
	}
    
    /* GL 9/27/96  change XON(0x11) to a space */
	if (pCmd_t->ParseChar=='\0' || pCmd_t->ParseChar == 0x11)
	{
		pCmd_t->ParseChar=' ';
	}
	if( pCmd_t->ParseChar== 0x0fff)
	/* 
	 * by definition command or phonemes following
 	 * don't do text proceesing any further
	 */
	{
//printf("*A %x\n",pCmd_t->ParseChar);
		pCmd_t->done=1;
		pCmd_t->ParseChar=' ';
	}
	else
	{
		if (pCmd_t->ParseChar == 0x0b)
		{
//printf("*B %x\n",pCmd_t->ParseChar);
			pCmd_t->done=1;
			//pCmd_t->clausebuf[pCmd_t->input_counter++] = ' ';
		}
	}
	pCmd_t->clausebuf[pCmd_t->input_counter++] = (unsigned char)pCmd_t->ParseChar; // NAL warning removal
#ifdef DEBUG_PARSER2
    	printf("at getc ,%c,%d\n",pCmd_t->ParseChar,pCmd_t->ParseChar);
#endif
	if(pCmd_t->ParseChar == 0x11)
	/* 
	 * this char comes at firsxt why??
	 * but I use it to know when to insert the 
	 * first word boundary at start of clause
	 */
	{
		pCmd_t->clausebuf[pCmd_t->input_counter++] = ' ';
	}

//printf("current value is %d\n",pCmd_t->ret_value.parser_flag);
	/* 
	 * now check to see if possible end of clause
	 * by looking for white space character preceeded by a punc
	 */
	if ((pKsd_t->modeflag & MODE_EMAIL) == 0)
	{
		if (((char_types[pCmd_t->clausebuf[pCmd_t->input_counter-1]] & MARK_space) || (pCmd_t->clausebuf[pCmd_t->input_counter-1] == 0x82))
		&& (char_types[pCmd_t->clausebuf[pCmd_t->input_counter-2]] & MARK_clause))
		{
//printf("*C %x\n",pCmd_t->ParseChar);
			pCmd_t->done=1;
			// fix for another lucent/octel/avaya crash
			pCmd_t->clausebuf[pCmd_t->input_counter]='\0';
			/* GL 02/01/1997, check for space instead of 0x0fff */
		// MGS		10/14/1999		BATS#876 fix for UK phone numbers (part of it) 

			if (pCmd_t->prevword==NULL)
			{
				pCmd_t->prevword=pCmd_t->clausebuf;
			}
//			if ((pCmd_t->clausebuf[pCmd_t->input_counter-2] == '.') && (pCmd_t->ParseChar== 0x0fff) &&
			if ((pCmd_t->clausebuf[pCmd_t->input_counter-2] == '.') && ((char_types[pCmd_t->ParseChar] & MARK_space) || (pCmd_t->ParseChar==0x82)) &&
		    (par_dict_lookup(pKsd_t,(char *)cm_text_get_word(pCmd_t->prevword,pCmd_t->wordbuf,1),0)))
			{
//printf("*D %x\n",pCmd_t->ParseChar);
				pCmd_t->done=0;
			}
		}
		/* GL 05/14/1997 BATS#374-376 make sure to reset email header */ 
      	pCmd_t->email_header = 0;
	}
	else
	{
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
		/* GL 09/30/1997 BATS# 475 redesign the header detection code */
		unsigned char header1[]={"From"};
		unsigned char header2[]={"Return-Path:"};
		unsigned char header3[]={"%======Internet"};
		unsigned char header4[]={"Message-ID:"};
		unsigned char header_buff[36]="";

		/* GL 09/30/1997 BATS#475 remove all the spaces and 0x82 */
		for (i=0,j=0;i<=34;++i)
		{
			if (pCmd_t->clausebuf[i] != ' ' &&
				pCmd_t->clausebuf[i] != 0x82)
				header_buff[j++] = pCmd_t->clausebuf[i];
		}
		header_buff[j] = '\0'; // NAL warning removal

		/* catch the empty line as 0xd 0xa or 0xa for OSF */
		/* this empty line will mark the end of header section */
#if defined (WIN32) || defined (MSDOS)
		if ((pCmd_t->email_header == 1) &&
			// Add fix for email mode BATS#985
      	   ((header_buff[0] == 0xd && header_buff[1] == 0xa) || (header_buff[0] == 0xa)))
#endif
/* GL 04/21/1997  add this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
		if ((pCmd_t->email_header == 1) && (header_buff[0] == 0xa))
#endif
		{   
      		/* leave the email header section */
      	 	pCmd_t->email_header = 0;
      	}
		/* GL 09/30/1997 BATS#475 */ 
		/* now we can check the header_buff for all the possible e-mail header */
		if ((pCmd_t->email_header == 0) &&
      	    (!strncmp(header_buff,header1,4)  ||
      	     !strncmp(header_buff,header2,12) ||
      	     !strncmp(header_buff,header3,15) ||
      	     !strncmp(header_buff,header4,11)))
      	{   
      		/* enter the email header section */
      	 	pCmd_t->email_header = 1;
      	}
#endif
		/* GL 02/08/1997,  catch record line by line if in email mode */
      	/* GL 02/11/1997   fix the hight-light mode by catching 0xd, 0x20 as new-line*/
#if defined (WIN32) || defined (MSDOS)
		if ((pCmd_t->clausebuf[pCmd_t->input_counter-1] == 0xa ||
		     pCmd_t->clausebuf[pCmd_t->input_counter-1] == 0x20)
		&& (pCmd_t->clausebuf[pCmd_t->input_counter-2] == 0xd))
#endif
/* GL 04/21/1997  add this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
		if (pCmd_t->clausebuf[pCmd_t->input_counter-1] == 0xa)
#endif
		{
			pCmd_t->done=1;
		}
	}
	/* Remember ptr to beginning of word boundary */
	// MGS		10/14/1999		BATS#876 fix for UK phone numbers (part of it) 
	if(((char_types[pCmd_t->clausebuf[pCmd_t->input_counter-2]] & MARK_space) || pCmd_t->clausebuf[pCmd_t->input_counter-2] == 0x82 )&&  
		!((char_types[pCmd_t->clausebuf[pCmd_t->input_counter-1]] & MARK_space) || pCmd_t->clausebuf[pCmd_t->input_counter-1] == 0x82  ))
	{
		pCmd_t->prevword = &pCmd_t->clausebuf[pCmd_t->input_counter-1];
	}
	/* 
	 * a clause boundry doesn't have to be inserted here because cluasebuf is now a 
	 * rolling input buffer, so the clause length can be infinite
	 */
	if(pCmd_t->done == 0)
	{
		if (pCmd_t->input_counter>PAR_ROLLING_STOP_VALUE)
		{
			pCmd_t->done=2;
		}
	}
	if(pCmd_t->done)
	{
#ifdef EPSON_ARM7
		if (pCmd_t->done==1)
			phTTS->TTP_return=1;
#endif
		/* timing here */
#ifdef CMD_DEBUG
		if (DT_DBG(CMD_DBG,0x100))
		{
			ulStartTime=timeGetTime();
//			WINprintf("get_clause_parse at %ld.\n", ulStartTime);
		}
#endif //CMD_DEBUG
		
		/* here we do clause base rule processing */
		/* set the end of the clausebuf to NULL */
			pCmd_t->clausebuf[pCmd_t->input_counter]='\0';

		/* here we do clause base rule processing */
		/*
		   08/22/96, GL,  This code will crash screen reader. Need to handle possible
		   index mark as well.  I remove this code since a short clause will not consume
		   too much time anyway.
		   09/04/96, GL.  fix the index bug. restore this function.
		   10/25/96, GL.  still hang the SARAW if encount [:np][:i m 88][:sync] string
		   since it is a 2 counts buffer, skip the following code the [:i m 88] will never
		   get sent, So SARAW will wait forever. We need to check the counter for index
		   buffer as well.   If any index mark has been stored then we need to process
		   the them even the input_counter is very small
		*/ 

		if ((pCmd_t->index_counter == 0) && (pCmd_t->input_counter < PAR_MIN_INPUT_SIZE) && (pCmd_t->punct_mode != PUNCT_all))
		{
			/* short clauses bypass text pre-processing*/
			strcpy(pCmd_t->output_buf,pCmd_t->clausebuf);
			pCmd_t->ret_value.output_offset=pCmd_t->input_counter;
		}
		else
		{
		  /* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
		  if ((pCmd_t->skip_mode != SKIP_email) &&
		      ((pKsd_t->modeflag & MODE_EMAIL) != 0))
		    {
				/* cm_text_preproc(pCmd_t); */             
#ifdef DEBUG_PARSER
		      printf("The input to Email.%s.\n",pCmd_t->clausebuf);		
#endif
		      
		      temp_mode = temp_mode | 0x20;
		      temp_mode = temp_mode | parser_flag;
		      if (pCmd_t->email_header == 1) temp_mode = temp_mode | 0x10;
		      
				/* debug switch */
		      if (DT_DBG(CMD_DBG,0x040))
			{
#ifndef ARM7_NOSWI
			  printf("\nInput to Email:(%d)(%x)",pCmd_t->input_counter,temp_mode);
#ifndef MSDOS
			  if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
			    fprintf((FILE *)pKsd_t->dbglog,"\nInput to Email:(%d)(%x)",pCmd_t->input_counter,temp_mode);
#endif
			  
			  printf("\nInput to Email:(%d)(%x)",pCmd_t->input_counter,temp_mode);
#endif
			  for (k=0; k < strlen(pCmd_t->clausebuf); k++)
			    {
#ifndef ARM7_NOSWI
#ifndef MSDOS
					if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
						fprintf((FILE *)pKsd_t->dbglog,"\n%c(%x)",pCmd_t->clausebuf[k],pCmd_t->clausebuf[k]);
#endif
					printf("\n%c(%x)",pCmd_t->clausebuf[k],pCmd_t->clausebuf[k]);
#endif
			  }
				}
				/* process email mode */
#ifdef NEW_BINARY_PARSER
				par_process_input(phTTS,pCmd_t->clausebuf,pCmd_t->new_input,pCmd_t->output_buf,
							  pCmd_t->dict_hit_buf,pCmd_t->input_indexes,pCmd_t->new_input_indexes,
							  pCmd_t->output_indexes,(0x00000001 << PAR_LANG_CODE),
							  temp_mode,0,0,&(pCmd_t->match_array),&(pCmd_t->ret_value));
#else
				par_process_input(phTTS,pCmd_t->clausebuf,pCmd_t->new_input,pCmd_t->output_buf,
							  pCmd_t->dict_hit_buf,pCmd_t->input_indexes,pCmd_t->new_input_indexes,
							  pCmd_t->output_indexes,(0x00000001 << PAR_LANG_CODE),
							  temp_mode,0,0,&(pCmd_t->ret_value));
#endif

				/* cmd_flush return */
				if (pCmd_t->input_counter == 0) return;
				/* checking cmd_flushing */
				if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
				{
					cm_util_flush_init(phTTS);
					return;
				}              
				/* debug switch */
				if (DT_DBG(CMD_DBG,0x080))
				{   
#ifndef ARM7_NOSWI
#ifndef MSDOS
				if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
					fprintf((FILE *)pKsd_t->dbglog,"\nEmail output:");
#endif

				printf("\nEmail output:");
#endif

					for (k=0; k < strlen(pCmd_t->output_buf); k++)
					{
#ifndef ARM7_NOSWI
#ifndef MSDOS
					if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
						fprintf((FILE *)pKsd_t->dbglog,"\n%c(%x)",pCmd_t->output_buf[k],pCmd_t->output_buf[k]);
#endif
					printf("\n%c(%x)",pCmd_t->output_buf[k],pCmd_t->output_buf[k]);
#endif
					}				
				}
			
				/* put the output back into the input */
				strcpy(pCmd_t->clausebuf,pCmd_t->output_buf);
#ifdef NEW_INDEXING
				/* put the indexes from the output into the input */
				par_copy_index_list(pCmd_t->input_indexes,0,pCmd_t->output_indexes,0,PAR_MAX_INPUT_ARRAY);
#endif
                /* save parser_flag */
				parser_flag = pCmd_t->ret_value.parser_flag;	
				/* reset ret_value */
				memset(&(pCmd_t->ret_value),0,sizeof(return_value_t));
        		/* restore parser_flag */
				pCmd_t->ret_value.parser_flag = parser_flag;	
				/* reinit the new_input buffer */
				memset(pCmd_t->new_input,0,PAR_MAX_INPUT_ARRAY);
#ifdef NEW_INDEXING
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
				memset(pCmd_t->new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
				memset(pCmd_t->output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
#endif
#endif
        	} /* if skip_mode != SKIP_email */
#endif
			if (pCmd_t->skip_mode != SKIP_punct)
			{
				/* cm_text_preproc(pCmd_t); */             
#ifdef DEBUG_PARSER
				printf("the input to punct.%s.\n",pCmd_t->clausebuf);		
#endif
				// add protection code for buffer overflows MGS
				pCmd_t->clausebuf[PAR_MAX_INPUT_ARRAY-1]='\0';
				/* GL 03/20/1998 BATS#631  add hit/miss setting before puncturation processing */
				/* do the dictionary search here for the entire input */
	        	pCmd_t->input_counter=strlen(pCmd_t->clausebuf);
				didit=0;
				for (i=0;i<pCmd_t->input_counter;i++)
				{
					/* GL 04/03/1997 for BATS#334 fix the DM mode problem in high light mode */
					if (pCmd_t->clausebuf[i] == 0x82) continue;
					if (((i==0) || (char_types[pCmd_t->clausebuf[i-1]] & MARK_space) || (pCmd_t->clausebuf[i-1] == 0x82))
						&& !(char_types[pCmd_t->clausebuf[i]] & MARK_space))
					{
						// MGS		10/14/1999		BATS#876 fix for UK phone numbers (part of it) 
						pCmd_t->dict_hit_buf[i]=par_dict_lookup(pKsd_t,(char *)cm_text_get_word(&(pCmd_t->clausebuf[i]),pCmd_t->wordbuf,0),1);
						// MGS add this for german ae oe ue processing to umlated vowels
						// MGS added code for qu exception to ue rulw and eab added neue 
						if (pCmd_t->dict_hit_buf[i]==0)
						{

#ifdef SIMPLE_UMLAUT_CONVERSIONS  /* BACHUS REWT: I don't want to use Umlaut conversion before the 
							         splitting into morphs or syllables is done on the grapheme level
							      */
							          
							if (pKsd_t->lang_curr==LANG_german)
							{
								relook=0;
								for (j=i;!(char_types[pCmd_t->clausebuf[j]] & MARK_space);j++)
								{
									if (par_lower[pCmd_t->clausebuf[j]] == 'q' && par_lower[pCmd_t->clausebuf[j+1]]=='u')
									{
										j++;
										continue;
									}
									if (par_lower[pCmd_t->clausebuf[j]] == 'e' && par_lower[pCmd_t->clausebuf[j+1]]=='u')
									{
										j++;
										continue;
									}
									if (par_lower[pCmd_t->clausebuf[j+1]]=='e')
									{
										switch(pCmd_t->clausebuf[j])
										{
										case 'a':
											pCmd_t->clausebuf[j]=(unsigned char)'ä';
											didit=1;
											break;
										case 'A':
											pCmd_t->clausebuf[j]=(unsigned char)'Ä';
											didit=1;
											break;
										case 'o':
											pCmd_t->clausebuf[j]=(unsigned char)'ö';
											didit=1;
											break;
										case 'O':
											pCmd_t->clausebuf[j]=(unsigned char)'Ö';
											didit=1;
											break;
										case 'u':
											pCmd_t->clausebuf[j]=(unsigned char)'ü';
											didit=1;
											break;
										case 'U':
											pCmd_t->clausebuf[j]=(unsigned char)'Ü';
											didit=1;
											break;
										}
										if (didit)
										{
											for (k=j+1;!(char_types[pCmd_t->clausebuf[k]] & MARK_space);k++)
											{
												pCmd_t->clausebuf[k]=pCmd_t->clausebuf[k+1];
											}
											didit=0;
											relook=1;
										}
									}
								}
								if (relook)
								{
									pCmd_t->dict_hit_buf[i]=par_dict_lookup(pKsd_t,(char *)cm_text_get_word(&(pCmd_t->clausebuf[i]),pCmd_t->wordbuf,0),1);
								}
							}
							}  /* German Umlaut transformation taken out for BACHUS REWT */
#endif                         /* BACHUS */
						}
						i+=strlen(pCmd_t->wordbuf);
					}
				}
		

				temp_mode = 0x00000001 << pCmd_t->punct_mode;
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_

				if ((pKsd_t->modeflag & MODE_EMAIL) != 0)
				{
			   		temp_mode = temp_mode | 0x20;
			   		if (pCmd_t->email_header == 1) temp_mode = temp_mode | 0x10;
				}
#endif
				/* debug switch */
				if (DT_DBG(CMD_DBG,0x002))
				{
#ifndef ARM7_NOSWI
#ifndef MSDOS
#ifndef ARM7
					if (pKsd_t->dbglog)		/* mfg added for debuglog.txt suport*/
						fprintf((FILE *)pKsd_t->dbglog,"\nInput to Punct:(%d)(%x)",pCmd_t->input_counter,temp_mode);
#endif		
#endif			
					printf("\nInput to Punct:(%d)(%x)",pCmd_t->input_counter,temp_mode);
					for (k=0; k < strlen(pCmd_t->clausebuf); k++)
					printf("\n%c(%x)",pCmd_t->clausebuf[k],pCmd_t->clausebuf[k]);
					{
#ifndef MSDOS
#ifndef ARM7
						if (pKsd_t->dbglog)		/* mfg added for debuglog.txt suport*/
							fprintf((FILE *)pKsd_t->dbglog,"\n%c(%x)",pCmd_t->clausebuf[k],pCmd_t->clausebuf[k]);
#endif
#endif
						printf("\n%c(%x)",pCmd_t->clausebuf[k],pCmd_t->clausebuf[k]);
					}
#endif
				}
				/* process punctuation mode */
#ifdef NEW_BINARY_PARSER
				par_process_input(phTTS,pCmd_t->clausebuf,pCmd_t->new_input,pCmd_t->output_buf,
							  pCmd_t->dict_hit_buf,pCmd_t->input_indexes,pCmd_t->new_input_indexes,
							  pCmd_t->output_indexes,(0x00000001 << PAR_LANG_CODE),
							  temp_mode,1,0,&(pCmd_t->match_array),&(pCmd_t->ret_value));
#else
				par_process_input(phTTS,pCmd_t->clausebuf,pCmd_t->new_input,pCmd_t->output_buf,
							  pCmd_t->dict_hit_buf,pCmd_t->input_indexes,pCmd_t->new_input_indexes,
							  pCmd_t->output_indexes,(0x00000001 << PAR_LANG_CODE),
							  temp_mode,1,0,&(pCmd_t->ret_value));
#endif

				/* cmd_flush return */
				if (pCmd_t->input_counter == 0) return;
				/* checking cmd_flushing */
				if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
				{
					cm_util_flush_init(phTTS);
					return;
				}              
				/* debug switch */
				if (DT_DBG(CMD_DBG,0x004))
				{   
#ifndef ARM7_NOSWI
#ifndef MSDOS
					if (pKsd_t->dbglog)		/* mfg added for debuglog.txt suport*/
						fprintf((FILE *)pKsd_t->dbglog,"\nPunct output:");
#endif
					printf("\nPunct output:");
					for (k=0; k < strlen(pCmd_t->output_buf); k++)
					{
#ifndef MSDOS
					if (pKsd_t->dbglog)		/* mfg added for debuglog.txt suport*/
						fprintf(pKsd_t->dbglog,"\n%c(%x)",pCmd_t->output_buf[k],pCmd_t->output_buf[k]);
#endif					
					printf("\n%c(%x)",pCmd_t->output_buf[k],pCmd_t->output_buf[k]);
					}			
#endif
				}
			
				/* put the output back into the input */
				strcpy(pCmd_t->clausebuf,pCmd_t->output_buf);
#ifdef NEW_INDEXING
				/* put the indexes from the output into the input */
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
				par_copy_index_list(pCmd_t->input_indexes,0,pCmd_t->output_indexes,0,PAR_MAX_INPUT_ARRAY);
#endif
#endif
        	} /* if skip_mode != SKIP_punct */
			if (pCmd_t->skip_mode != SKIP_rule)
			{
                /* save parser_flag */
				parser_flag = pCmd_t->ret_value.parser_flag;	
				/* reset ret_value */
				memset(&(pCmd_t->ret_value),0,sizeof(return_value_t));
        		/* restore parser_flag */
				pCmd_t->ret_value.parser_flag = parser_flag;	
				/* reinit the new_input buffer */
				memset(pCmd_t->new_input,0,PAR_MAX_INPUT_ARRAY);
#ifdef NEW_INDEXING
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
				memset(pCmd_t->new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
				memset(pCmd_t->output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
#endif
#endif
				/* checking cmd_flushing */
				if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
				{
					cm_util_flush_init(phTTS);
					return;
				}
				// add protection code for buffer overflows MGS
				pCmd_t->clausebuf[PAR_MAX_INPUT_ARRAY-1]='\0';			              
				/* GL 03/20/1998 BATS#631  initialize hit/miss arrary */
				/* do the dictionary search here for the entire input */
				memset(pCmd_t->dict_hit_buf,0,PAR_MAX_INPUT_ARRAY);
	        	pCmd_t->input_counter=strlen(pCmd_t->clausebuf);
				for (i=0;i<pCmd_t->input_counter;i++)
				{
					/* GL 04/03/1997 for BATS#334 fix the DM mode problem in high light mode */
					if (pCmd_t->clausebuf[i] == 0x82) continue;
					if (((i==0) || (char_types[pCmd_t->clausebuf[i-1]] & MARK_space) || (pCmd_t->clausebuf[i-1] == 0x82))
						&& !(char_types[pCmd_t->clausebuf[i]] & MARK_space))
					{
						//	MGS		10/14/1999		BATS#876 fix for UK phone numbers (part of it) 
						pCmd_t->dict_hit_buf[i]=par_dict_lookup(pKsd_t,(char *)cm_text_get_word(&(pCmd_t->clausebuf[i]),pCmd_t->wordbuf,0),1);
						i+=strlen(pCmd_t->wordbuf);
					}
				}
			
#ifdef DEBUG_PARSER
				printf("the input to normal .%s.\n",pCmd_t->clausebuf);		
				printf("the dict hit buf is  ");
				for (i=0;i<pCmd_t->input_counter;i++)
				{
					putc(pCmd_t->dict_hit_buf[i]+'0');
				}
				printf("\n");
#endif

				/* 044	MGS		09/24/1997	BATS#469 Fix for NWS parser problem */
				/*				force mode_flag always set to non-zero          */ 
#ifdef NEW_BINARY_PARSER
				if (pCmd_t->done==2)
				{
					par_process_input(phTTS,pCmd_t->clausebuf,pCmd_t->new_input,pCmd_t->output_buf,
								  pCmd_t->dict_hit_buf,pCmd_t->input_indexes,pCmd_t->new_input_indexes,
								  pCmd_t->output_indexes,(0x00000001 << PAR_LANG_CODE),
								  pKsd_t->modeflag | MODE_CITATION,2,1,&(pCmd_t->match_array),&(pCmd_t->ret_value));
   				}
				else
				{
					par_process_input(phTTS,pCmd_t->clausebuf,pCmd_t->new_input,pCmd_t->output_buf,
								  pCmd_t->dict_hit_buf,pCmd_t->input_indexes,pCmd_t->new_input_indexes,
								  pCmd_t->output_indexes,(0x00000001 << PAR_LANG_CODE),
								  pKsd_t->modeflag | MODE_CITATION,2,0,&(pCmd_t->match_array),&(pCmd_t->ret_value));
				}
#else
				if (pCmd_t->done==2)
				{
					par_process_input(phTTS,pCmd_t->clausebuf,pCmd_t->new_input,pCmd_t->output_buf,
								  pCmd_t->dict_hit_buf,pCmd_t->input_indexes,pCmd_t->new_input_indexes,
								  pCmd_t->output_indexes,(0x00000001 << PAR_LANG_CODE),
								  pKsd_t->modeflag | MODE_CITATION,2,1,&(pCmd_t->ret_value));
   				}
				else
				{
					par_process_input(phTTS,pCmd_t->clausebuf,pCmd_t->new_input,pCmd_t->output_buf,
								  pCmd_t->dict_hit_buf,pCmd_t->input_indexes,pCmd_t->new_input_indexes,
								  pCmd_t->output_indexes,(0x00000001 << PAR_LANG_CODE),
								  pKsd_t->modeflag | MODE_CITATION,2,0,&(pCmd_t->ret_value));
				}
#endif
				/* cmd_flush return */
				if (pCmd_t->input_counter == 0) return;
				/* checking cmd_flushing */
				if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
				{
					cm_util_flush_init(phTTS);
					return;
				}              
			} /* skip_mode != SKIP_rule  */
		
		} /* if (pCmd_t->input_counter<PAR_MIN_INPUT_SIZE) */

#ifdef DEBUG_PARSER
			printf("the output .");
#endif
/* put timing here */
#ifdef CMD_DEBUG
		if (DT_DBG(CMD_DBG,0x100))
		{
#ifndef ARM7_NOSWI
			ulEndTime=timeGetTime();
#ifndef UNDER_CE  //mfg 01/08/98 WINprintf not supported under Windows CE
			WINprintf("\nget_clause_parse at %ld. ms %s\n", ulEndTime-ulStartTime,pCmd_t->output_buf);
#endif

#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
				fprintf((FILE *)pKsd_t->dbglog,"\nget_clause_parse at %ld. ms %s\n", ulEndTime-ulStartTime,pCmd_t->output_buf);
#endif
#endif
		}
#endif //CMD_DEBUG

		mode = PAR_OUTPUT_CHARS;
		
		for (i=0;((i<pCmd_t->ret_value.output_offset) && (char_types[pCmd_t->output_buf[i]] & MARK_space));i++);
		
		/* debug switch */
		if (DT_DBG(CMD_DBG,0x008))
		{
#ifndef ARM7_NOSWI
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
				fprintf(pKsd_t->dbglog,"\nNormal output:");
#endif
			printf("\nNormal output:");
#endif
		}
		/*
		   GL 09/06/1996, always send a space first, make sure we have space
		   while handling rolling text
		*/
		/*
		   GL 01/10/1997, remove the space to fix the ["]<string> problem 
		   GL 01/22/1997, use roll_text to indicate the rolling text state
		   the extra space will be fired if we are in rolling text state
		*/
		if (pCmd_t->roll_text != 0)
		{
			pipe_value = (PFASCII<<PSFONT) + ' ';
#ifdef SINGLE_THREADED
			lts_loop(phTTS,&pipe_value);
#else
			cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif
		}
		
		for(;i<pCmd_t->ret_value.output_offset;i++)
		{
			if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
			{
				cm_util_flush_init(phTTS);
				return;
			}              
			if (pCmd_t->output_buf[i] != PAR_INDEX_DUMMY_CHAR)
			{
				if (mode==PAR_OUTPUT_CHARS)
				{
					if (pCmd_t->output_buf[i]==PAR_PHONES_ON_D)
					{
						mode = PAR_OUTPUT_PHONES;
						continue;
					}				
					/* debug switch */
					if (DT_DBG(CMD_DBG,0x008))
					{
#ifndef ARM7_NOSWI
#ifndef MSDOS
						if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
							fprintf((FILE *)pKsd_t->dbglog,"\n%c(%x)",pCmd_t->output_buf[i],pCmd_t->output_buf[i]);
#endif						
						printf("\n%c(%x)",pCmd_t->output_buf[i],pCmd_t->output_buf[i]);
#endif
					}
#ifdef DEBUG_PARSER
					putc(pCmd_t->output_buf[i]);
#endif
					pipe_value = (PFASCII<<PSFONT)+pCmd_t->output_buf[i];
#ifdef SINGLE_THREADED
					lts_loop(phTTS,&pipe_value);
#else
					cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif
				}
				if (mode==PAR_OUTPUT_PHONES)
				{
					if (pCmd_t->output_buf[i]==PAR_PHONES_OFF_D)
					{
						mode=PAR_OUTPUT_CHARS;
						continue;
					}				
					/* debug switch */
					if (DT_DBG(CMD_DBG,0x008))
					{
#ifndef ARM7_NOSWI
#ifndef MSDOS
						if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
							fprintf((FILE *)pKsd_t->dbglog,"\n%c[%x]",pCmd_t->output_buf[i],pCmd_t->output_buf[i]);
#endif
						printf("\n%c[%x]",pCmd_t->output_buf[i],pCmd_t->output_buf[i]);
#endif
					}
#ifdef DEBUG_PARSER
						putc(pCmd_t->output_buf[i]);
#endif
					pipe_value = pKsd_t->reverse_ascky[pCmd_t->output_buf[i]];
#ifdef SINGLE_THREADED
					lts_loop(phTTS,&pipe_value);
#else
					cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif
				}
			}
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
			if (par_is_index_set(pCmd_t->output_indexes,i))
			  {
			    /* debug switch */
			    if (DT_DBG(CMD_DBG,0x008))
			      {
#ifndef ARM7_NOSWI
					// * 059	MGS		10/14/1999	BATS#900 Fixed indexing in spanish phone numbers
					if (i>0 && pCmd_t->output_buf[i-1] != ' ' && 
						(i+2)<pCmd_t->ret_value.output_offset && 
						!(char_types[pCmd_t->output_buf[i+1]] & MARK_clause) && 
						!(char_types[pCmd_t->output_buf[i+2]] & MARK_space))
					{
#ifndef MSDOS
						if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
							fprintf((FILE *)pKsd_t->dbglog,"\n%c(%x)",' ',' ');
#endif						
						printf("\n%c(%x)",' ',' ');
					}
#ifndef MSDOS
				if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
				  fprintf(pKsd_t->dbglog,"\n%c[%x]",pCmd_t->output_buf[i],pCmd_t->output_buf[i]);
#endif
				printf("\n*%c[%x]",pCmd_t->output_indexes[i].index[1],pCmd_t->output_indexes[i].index[1]);
#endif // ARM7_NOSWI
			      }
				// MGS 10/14/1999 BATS#900 fixed indexing with spanish phone nubmer rules
				if (i > 0 && pCmd_t->output_buf[i-1] !=' ' && !par_is_index_set(pCmd_t->output_indexes,i-1))
				{
					if ((i+2)<pCmd_t->ret_value.output_offset && 
						!(char_types[pCmd_t->output_buf[i+1]] & MARK_clause) && 
						!(char_types[pCmd_t->output_buf[i+2]] & MARK_space))
					{
						pipe_value = (PFASCII<<PSFONT)+' ';
#ifdef SINGLE_THREADED
						lts_loop(phTTS,&pipe_value);
#else
						cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif
					}
				}

#ifdef SINGLE_THREADED
				lts_loop(phTTS,pCmd_t->output_indexes[i].index);
#else
				cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pCmd_t->output_indexes[i].index,3);
#endif
			}
#endif // ARM7
		}                                               
#ifdef DEBUG_PARSER
		printf(".\n output offset=%d\n",pCmd_t->ret_value.output_offset);
#endif
		/* 
		 * fix for typing space ctrl-k 
		 * ctrl-k is a clause and a space to the parser 
		 * and is therefore removed, because only the first 
		 * whitespace is kept in the output buffer 
		 */
//		if (pCmd_t->ParseChar == 0xb)   
		if ((pCmd_t->ParseChar == 0xb || pCmd_t->ParseChar == 0x9)   &&
			(pCmd_t->clausebuf[pCmd_t->ret_value.output_offset-1]!=0xb))
		{
			/* debug switch */
			if (DT_DBG(CMD_DBG,0x008))
			{
#ifndef ARM7_NOSWI
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
					fprintf((FILE *)pKsd_t->dbglog,"\n%c(*%x)",pCmd_t->ParseChar,pCmd_t->ParseChar);
#endif
				printf("\n%c(*%x)",pCmd_t->ParseChar,pCmd_t->ParseChar);
#endif
			}
			pipe_value = (PFASCII<<PSFONT)+pCmd_t->ParseChar;
#ifdef SINGLE_THREADED
			lts_loop(phTTS,&pipe_value);
#else
			cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif
		}                                               
		/* debug switch */
		if (DT_DBG(CMD_DBG,0x008))
		{
#ifndef ARM7_NOSWI
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt support*/
					fprintf((FILE *)pKsd_t->dbglog,"\n");
#endif
			printf("\n");
#endif
		}
			
		/* checking cmd_flushing */
		if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
		{
			cm_util_flush_init(phTTS);
			return;
		}              
		/* shift the buffers here for the rolling input buffer */
		if (pCmd_t->done==2)
		{
			for (i=pCmd_t->ret_value.input_offset+pCmd_t->ret_value.input_pos,j=0;pCmd_t->clausebuf[i];i++,j++)
			{
				pCmd_t->clausebuf[j]=pCmd_t->clausebuf[i];
#ifdef NEW_INDEXING
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
				/* move the indexes too */
				par_copy_index(pCmd_t->input_indexes,j,pCmd_t->input_indexes,i);
#endif
#endif
			}
			pCmd_t->roll_text=1;
			pCmd_t->input_counter=j;
			pCmd_t->prev_word_index-=pCmd_t->ret_value.input_offset+pCmd_t->ret_value.input_pos;
			pCmd_t->prevword-=(pCmd_t->ret_value.input_offset+pCmd_t->ret_value.input_pos); 
			memset(pCmd_t->clausebuf+j,0,PAR_MAX_INPUT_ARRAY-j-1);
#ifdef NEW_INDEXING
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
			memset(&(pCmd_t->input_indexes[j].index[0]),0,(PAR_MAX_INPUT_ARRAY-j-1)*sizeof(index_data_t));
#endif
#endif
		}
		else
		{
			memset(pCmd_t->clausebuf,0,PAR_MAX_INPUT_ARRAY);
			pCmd_t->roll_text=0;
			pCmd_t->input_counter=0;  
			pCmd_t->index_counter=0;  
			pCmd_t->clausebuf[0]=' ';
            pCmd_t->prev_word_index=0;
#ifdef NEW_INDEXING
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
			memset(pCmd_t->input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
			memset(pCmd_t->new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
#endif
#endif
			pCmd_t->prevword=&(pCmd_t->clausebuf[0]);
		}
		/*re-init*/
		memset(pCmd_t->dict_hit_buf,0,PAR_MAX_INPUT_ARRAY);
        /* save parser_flag */
		parser_flag = pCmd_t->ret_value.parser_flag;	
		memset(&(pCmd_t->ret_value),0,sizeof(return_value_t));
        /* restore parser_flag */
		pCmd_t->ret_value.parser_flag = parser_flag;	
		memset(pCmd_t->output_buf,0,PAR_MAX_OUTPUT_ARRAY);
		memset(pCmd_t->new_input,0,PAR_MAX_INPUT_ARRAY);
#ifdef NEW_INDEXING
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
		memset(pCmd_t->new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
		memset(pCmd_t->output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
#endif
#endif
		pCmd_t->done=0;

	}
}

#endif /* end #ifndef VOCAL */
