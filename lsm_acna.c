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
 *    File Name:	lsm_acna.c
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

#include	"lsacna.h"
#ifndef ACNA
extern int namef;
#endif

#ifndef SINGLE_THREADED
P_PIPE	linp;
P_PIPE	kinp;
#endif

main(data_seg,stack_start)
unsigned int data_seg;
unsigned int stack_start;
{
	extern far lstask();
	init_lang();

	default_lang(LANG_english,LANG_lts_ready);
	linp = KS.lang_lts[LANG_english];
	kinp = KS.lang_ph[LANG_english];
	create_process(lstask,4,data_seg,stack_start,0);
}	

do_lts(lp2,lp1)
LETTER *lp2;
LETTER *lp1;
{
	short	sel_lang;

	if(KS.pronflag & PRON_ACNA_NAME)
		{
		sel_lang = id_name(lp2,lp1);
		if(KS.logflag & LOG_NAME_TYPES)
			print_ntype(sel_lang);
		acna_lts(lp2,lp1,NAME_ENGLISH,sel_lang);
		namef=0;
		KS.pronflag &= (~PRON_ACNA_NAME);
		}	
	else
		{
		lts(lp2,lp1);
		}
	ltsout();
}
	
extern int fc_index;

is_name(llp,rlp)
LETTER *llp;
LETTER *rlp;
{
	if(KS.pronflag & PRON_ACNA_NAME)
		return(true);
	if((KS.modeflag & MODE_NAME) == 0)
		return(true);
	if(fc_index == 0)
		return(false);
	if((*llp).l_ch < 64 || (*llp).l_ch > 97 )/*first character upper??*/
		return(false);
	for(llp++;llp<rlp;llp+=1)
		if( (*llp).l_ch  >122 ||  (*llp).l_ch <97) /*the rest lower*/
			return(false);
	KS.pronflag |= PRON_ACNA_NAME;
		return(true);
}
