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
 *    File Name:	uk_main.c
 *    Author:
 *    Creation Date: 1/19/98
 *
 *    Functionality:
 *  install usa character set tables ...
 *
 ***********************************************************************
 *    Revision History:
 *  19-JAN-98   jl      BAT#553 this file created, copied from us_main, altered
 *                      for uk
 *
 */

#include	"uk_def.h"

/*
 *  include the tables here ... this allows me to determine
 *  the size and types without a lot of work ...
 */

#include	"uk_type.tab"
#include	"uk_phon.tab"
#include	"uk_err.tab"

struct	dtpc_language_tables nlt;

main(data_seg,stack_start)
unsigned int data_seg;
unsigned int stack_start;
{
	volatile struct dtpc_language_tables _far *lt;

/*
 *  fill structure ...
 */

	nlt.link = NULL_LT;
        nlt.lang_id = LANG_british;
	nlt.lang_ascky = uk_ascky;
	nlt.lang_ascky_size = sizeof(uk_ascky);
	nlt.lang_reverse_ascky = uk_ascky_rev;
	nlt.lang_arpabet = uk_arpa;
	nlt.lang_arpa_size = sizeof(uk_arpa);
	nlt.lang_arpa_case = FALSE;
	nlt.lang_typing =	uk_type;
	nlt.lang_error = uk_error;

/*
 *  thread on chain ...
 */

	lt = KS.loaded_languages;
	if(lt == NULL_LT)
		KS.loaded_languages = &nlt;
	else
		{
		while((*lt).link != NULL_LT)
			lt = (*lt).link;
		(*lt).link = &nlt;
		}
/*
 *  Install the language bit flag ...
 */

        default_lang(LANG_british,LANG_tables_ready);
}
