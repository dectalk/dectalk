/* ********************************************************************
 *								Copyright ©
 *    Copyright © 2000 Force Computers Inc., a Solectron company. All rights reserved.
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
 * ************************************************************************* */
 * Comments
 * install usa character set tables ...
 * 001	MFG		06/19/1998	Mede changed to include latin american 
 * 002	CHJ		07/20/2000	French added
 * 003 	CAB		10/16/00	Changed copyright info
 */
#include "port.h"


#ifdef SPANISH_SP
#include "spa_def.h"
#include "spa_type.tab"
#include "spa_phon.tab"
#include "spa_err.tab"

#endif


#ifdef SPANISH_LA
#include "la_def.h"
#include "la_type.tab"
#include "la_phon.tab"
#include "la_err.tab"

#endif



#ifdef GERMAN
#include "ger_def.h"
#include "ger_type.tab"
#include "ger_phon.tab"
#include "ger_err.tab"
#endif

#ifdef ENGLISH_US
#include        "usa_def.h"

/*
 *  include the tables here ... this allows me to determine
 *  the size and types without a lot of work ...
 */

#include        "usa_type.tab"
#include        "usa_phon.tab"
#include        "usa_err.tab"
#endif

#ifdef FRENCH
#include        "fr_def.h"

/*
 *  include the tables here ... this allows me to determine
 *  the size and types without a lot of work ...
 */

#include "fr_type.tab"
#include "fr_phon.tab"
#include "fr_err.tab"
#endif
/* MVP : The below variable "nlt" is now made local to usa_init function and
 * dynamically allocated to support multiple instances of speech object.
 */
/*struct  dtpc_language_tables nlt;*/  

/* 
 * #define USADEBUG 1
 */

void usa_init(PKSD_T pKsd_t)
{
	volatile struct dtpc_language_tables _far *lt;

	struct  dtpc_language_tables *pnlt;
	/* nlt is allocated here ,It will be made free in DeleteTextToSpeechObject routine
	 * in API sub-system.
	 */
	if( (pnlt = (struct dtpc_language_tables*) 
		malloc(sizeof(struct dtpc_language_tables)))== NULL)
	{
		//MessageBox(NULL,"Error allocating dtpc_language_tables structure",
		//      Error",MB_OK);
		return (MMSYSERR_NOMEM);
	}
/*
 *  fill structure ...
 */

#ifdef USADEBUG
f_fprintf("In usa init\n");
#endif


	pnlt->link = NULL_LT;
	pnlt->lang_id = LANG_english;
#ifdef ENGLISH_US
	pnlt->lang_ascky = usa_ascky;
	pnlt->lang_ascky_size = sizeof(usa_ascky);
	pnlt->lang_reverse_ascky = usa_ascky_rev;
	pnlt->lang_arpabet = usa_arpa;
	pnlt->lang_arpa_size = sizeof(usa_arpa);
	pnlt->lang_arpa_case = FALSE;
	pnlt->lang_typing =       usa_type;
	pnlt->lang_error = usa_error;
#endif
#ifdef SPANISH_LA
	pnlt->lang_ascky = la_ascky;
	pnlt->lang_ascky_size = sizeof(la_ascky);
	pnlt->lang_reverse_ascky = la_ascky_rev;
	pnlt->lang_arpabet = la_arpa;
	pnlt->lang_arpa_size = sizeof(la_arpa);
	pnlt->lang_arpa_case = FALSE;
	pnlt->lang_typing =       la_type;
	pnlt->lang_error = la_error;
#endif
#ifdef SPANISH_SP
	pnlt->lang_ascky = spanish_ascky;
	pnlt->lang_ascky_size = sizeof(spanish_ascky);
	pnlt->lang_reverse_ascky = spanish_ascky_rev;
	pnlt->lang_arpabet = spanish_arpa;
	pnlt->lang_arpa_size = sizeof(spanish_arpa);
	pnlt->lang_arpa_case = FALSE;
	pnlt->lang_typing =       spanish_type;
	pnlt->lang_error = spanish_error;
#endif



#ifdef GERMAN
	pnlt->lang_ascky = german_ascky;
	pnlt->lang_ascky_size = sizeof(german_ascky);
	pnlt->lang_reverse_ascky = german_ascky_rev;
	pnlt->lang_arpabet = german_arpa;
	pnlt->lang_arpa_size = sizeof(german_arpa);
	pnlt->lang_arpa_case = FALSE;
	pnlt->lang_typing =       german_type;
	pnlt->lang_error = german_error;
#endif
#ifdef FRENCH
	pnlt->lang_ascky = french_ascky;
	pnlt->lang_ascky_size = sizeof(french_ascky);
	pnlt->lang_reverse_ascky = french_ascky_rev;
	pnlt->lang_arpabet = french_arpa;
	pnlt->lang_arpa_size = sizeof(french_arpa);
	pnlt->lang_arpa_case = FALSE;
	pnlt->lang_typing =       french_type;
	pnlt->lang_error = french_error;
#endif
/*
 *  thread on chain ...
 */
	
	lt = pKsd_t->loaded_languages;
	if(lt == NULL_LT)
		pKsd_t->loaded_languages = pnlt;
	else
		{
		while((*lt).link != NULL_LT)
			lt = (*lt).link;
		(*lt).link = pnlt;
		}
/*
 *  Install the language bit flag ...
 */

	default_lang(pKsd_t,LANG_english,LANG_tables_ready);
}
