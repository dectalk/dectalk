/*
 *  install usa character set tables ...
 */
#include "port.h"


#ifdef SPANISH
#include "spa_def.h"
#include "spa_type.tab"
#include "spa_phon.tab"
#include "spa_err.tab"

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

/* MVP : The below variable "nlt" is now made local to usa_init function and
 * dynamically allocated to support multiple instances of speech object.
 */
/*struct  dtpc_language_tables nlt;*/  

/* 
 * #define USADEBUG 1
 */

int usa_init(PKSD_T pKsd_t)
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
#ifdef SPANISH
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
