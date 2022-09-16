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
 *    File Name:	spa_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  install usa character set tables ...
 *
 ***********************************************************************
 *    Revision History:
 *	---	-----	-----------		---------------------------------------
 *	001 GL		12/05/1996		remove the language pipe hack.
 */

#include	"spa_def.h"

/*
 *  include the tables here ... this allows me to determine
 *  the size and types without a lot of work ...
 */

#include	"spa_type.tab"
#include	"spa_phon.tab"
#include	"spa_err.tab"

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
	nlt.lang_id = LANG_spanish;
	nlt.lang_ascky = spanish_ascky;
	nlt.lang_ascky_size = sizeof(spanish_ascky);
	nlt.lang_reverse_ascky = spanish_ascky_rev;
	nlt.lang_arpabet = spanish_arpa;
	nlt.lang_arpa_size = sizeof(spanish_arpa);
	nlt.lang_arpa_case = FALSE;
	nlt.lang_typing =	spanish_type;
	nlt.lang_error = spanish_error;

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

	default_lang(LANG_spanish,LANG_tables_ready);
}
