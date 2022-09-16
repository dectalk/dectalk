/*
 ***********************************************************************
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
 *    File Name:	lsmain.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * lts entry point stub ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#include <stdio.h>
#endif


#ifdef	WIN32
#include "windows.h"
#endif
#include	"lsacna.h"
#include	"lsdef.h"
#include	"lsconst.h"
#ifdef ACNA
extern int namef;
#endif

extern int fc_index;

extern void init_lang(void);


#ifndef SINGLE_THREADED
P_PIPE	linp;
P_PIPE	kinp;
#endif

lsmain(data_seg,stack_start)
unsigned int data_seg;
unsigned int stack_start;
{
//	extern far lstask();
#ifdef	SIMULATOR
//	printf ("lsmain: enter\n");
#endif 
	init_lang();
	default_lang(LANG_english,LANG_lts_ready);
	default_lang(LANG_english,LANG_both_ready);
#ifndef SINGLE_THREADED
	linp = KS.lang_lts[LANG_english];
	kinp = KS.lang_ph[LANG_english];
#endif



#ifdef NO_CMD
	lstask();
#endif
//	create_process(lstask,4,data_seg,stack_start,0);
#ifdef	SIMULATOR
//	printf ("lsmain: exit\n");
#endif
	return (0);
}	

do_lts(lp2,lp1)
LETTER *lp2;
LETTER *lp1;
{

	short	sel_lang;
#ifdef CALLER_ID
	if(1)
#else
	if(KS.pronflag & PRON_ACNA_NAME)
#endif
		{
		sel_lang = id_name(lp2,lp1);
#ifdef PRINT_OUTPUT
		if(KS.logflag & LOG_NAME_TYPES)
			print_ntype(sel_lang);
		namef=0;
#endif
		lts(lp2,lp1,NAME_ENGLISH,sel_lang);

		KS.pronflag &= (~PRON_ACNA_NAME);
		}	
	else

		{
		lts(lp2,lp1,0,0);
		}
	ltsout();
	return (0);
}
	
is_name(lp2,lp1)
LETTER *lp2;
LETTER *lp1;
{
	if(KS.pronflag & PRON_ACNA_NAME)
		return(true);
	if((KS.modeflag & MODE_NAME) == 0)
		return(true);
	if((KS.modeflag & MODE_NAME) == 0)
		return(TRUE);
	if(fc_index == 0)
		return(FALSE);
	if((*lp1).l_ch < 64 || (*lp1).l_ch > 97 )/*first character upper??*/
		return(FALSE);
	for(lp1++;lp1<lp2;lp1++)
		if( (*lp1).l_ch  >122 ||  (*lp1).l_ch <97) /*the rest lower*/
			return(FALSE);

	return(FALSE);
}
