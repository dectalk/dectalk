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
 *    File Name:	usa_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  install usa character set tables ...
 *
 ***********************************************************************
 *    Revision History:
 */

#include	"usa_def.h"

/*
 *  include the tables here ... this allows me to determine
 *  the size and types without a lot of work ...
 */

//#ifdef FULL_LANGUAGE_SUPPORT
#ifdef FULL_LTS   // Changed to allow say letter as per Ed Bruckert
#include	"usa_type.tab"
#endif

#include	"usa_phon.tab"
#ifdef FULL_LANGUAGE_SUPPORT
#include	"usa_err.tab"
#endif

struct	dtpc_language_tables nlt;

void usa_main(void)
{
	volatile struct dtpc_language_tables _far *lt;
/*
 *  fill structure ...
 */

#ifdef FULL_LANGUAGE_SUPPORT
				KS.ascky = usa_ascky;
				KS.ascky_size = sizeof(usa_ascky);
				KS.reverse_ascky = usa_ascky_rev;
				KS.arpabet = usa_arpa;
				KS.arpa_size = sizeof(usa_arpa);
				KS.arpa_case = FALSE;
				KS.typing_table = usa_type;
				KS.error_table = usa_error;
#endif
#ifdef FULL_LTS   // Changed to allow say letter as per Ed Bruckert
				KS.typing_table = usa_type;
				KS.reverse_ascky = usa_ascky_rev;
#endif

#ifdef FULL_LANGUAGE_SUPPORT
	nlt.link = NULL_LT;
	nlt.lang_id = LANG_english;
	nlt.lang_ascky = usa_ascky;
	nlt.lang_ascky_size = sizeof(usa_ascky);
	nlt.lang_reverse_ascky = usa_ascky_rev;
	nlt.lang_arpabet = usa_arpa;
	nlt.lang_arpa_size = sizeof(usa_arpa);
	nlt.lang_arpa_case = FALSE;
	nlt.lang_typing =	usa_type;
	nlt.lang_error = usa_error;
#endif
/*
 *  thread on chain ...
 */
#ifdef FULL_LANGUAGE_SUPPORT
	lt = KS.loaded_languages;
	if(lt == NULL_LT)
		KS.loaded_languages = &nlt;
	else
		{
		while((*lt).link != NULL_LT)
			lt = (*lt).link;
		(*lt).link = &nlt;
		}
#endif
/*
 *  Install the language bit flag ...
 */
	default_lang(LANG_english,LANG_tables_ready);
}
