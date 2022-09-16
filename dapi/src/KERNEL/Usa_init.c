/*
 *  install usa character set tables ...
 * rev	who		date		description
 * ------------------------------------------------------------------
 * 00?	GL		12/12/1996	need to change the usa_init() for local language.
 * 001	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 * 002  DR		09/30/1997		UK BUILD: added UK STUFF
 * 003	MFG		06/19/1998	Made changed to include latin american 
 * 004  ETT		10/05/1998      Added Linux code.
 *
 */
#include "port.h"

#ifdef __linux__
#include <stdlib.h>
#endif

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
#include "usa_def.h"

/*
 *  include the tables here ... this allows me to determine
 *  the size and types without a lot of work ...
 */

#include        "usa_type.tab"
#include        "usa_phon.tab"
#include        "usa_err.tab"
#endif

#ifdef ENGLISH_UK
#include		"uk_def.h"
#include        "uk_type.tab"
#include        "uk_phon.tab"
#include        "uk_err.tab"
#endif

/* MVP : The below variable "nlt" is now made local to usa_init function and
 * dynamically allocated to support multiple instances of speech object.
 */
/*struct  dtpc_language_tables nlt;*/  

/* 
 * #define USADEBUG 1
 */

#ifdef __linux__
extern void default_lang( PKSD_T , unsigned int, unsigned int);
#endif

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
#ifdef WIN32
return (MMSYSERR_NOMEM);
#endif
/* GL 04/21/1997  add this for OSF build */
#if defined (__osf__) || defined (__linux__) 
return (0);
#endif
}

/*
*  fill structure ...
*/

#ifdef USADEBUG
f_fprintf("In usa init\n");
#endif


pnlt->link = NULL_LT;
#ifdef ENGLISH_US
	pnlt->lang_id = LANG_english;

	pnlt->lang_ascky = usa_ascky;
	pnlt->lang_ascky_size = sizeof(usa_ascky);
	pnlt->lang_reverse_ascky = usa_ascky_rev;
	pnlt->lang_arpabet = usa_arpa;
	pnlt->lang_arpa_size = sizeof(usa_arpa);
	pnlt->lang_arpa_case = FALSE;
	pnlt->lang_typing =       usa_type;
	pnlt->lang_error = usa_error;
#endif
#ifdef ENGLISH_UK
	pnlt->lang_id = LANG_british;

	pnlt->lang_ascky = uk_ascky;
	pnlt->lang_ascky_size = sizeof(uk_ascky);
	pnlt->lang_reverse_ascky = uk_ascky_rev;
	pnlt->lang_arpabet = uk_arpa;
	pnlt->lang_arpa_size = sizeof(uk_arpa);
	pnlt->lang_arpa_case = FALSE;
	pnlt->lang_typing =       uk_type;
	pnlt->lang_error = uk_error;
#endif
#ifdef SPANISH_LA
	pnlt->lang_id = LANG_latin_american;

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
	pnlt->lang_id = LANG_spanish;

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
	pnlt->lang_id = LANG_german;

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
	pnlt->lang_id = LANG_french;

	pnlt->lang_ascky = french_ascky;
	pnlt->lang_ascky_size = sizeof(french_ascky);
	pnlt->lang_reverse_ascky = french_ascky_rev;
	pnlt->lang_arpabet = french_arpa;
	pnlt->lang_arpa_size = sizeof(french_arpa);
	pnlt->lang_arpa_case = FALSE;
	pnlt->lang_typing =       french_type;
	pnlt->lang_error = french_error;
#endif

/* GL 12/12/1996  set the language table */
pKsd_t->ascky = pnlt->lang_ascky;
pKsd_t->ascky_size = pnlt->lang_ascky_size;
pKsd_t->reverse_ascky = pnlt->lang_reverse_ascky;
pKsd_t->arpabet = pnlt->lang_arpabet;
pKsd_t->arpa_size = pnlt->lang_arpa_size;
pKsd_t->arpa_case = pnlt->lang_arpa_case;
pKsd_t->typing_table = pnlt->lang_typing;
pKsd_t->error_table = pnlt->lang_error;

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

#ifdef ENGLISH_US
default_lang(pKsd_t,LANG_english,LANG_tables_ready);
#endif
#ifdef ENGLISH_UK
default_lang(pKsd_t,LANG_british,LANG_tables_ready);
#endif
#ifdef SPANISH_SP
default_lang(pKsd_t,LANG_spanish,LANG_tables_ready);
#endif
#ifdef SPANISH_LA
default_lang(pKsd_t,LANG_latin_american,LANG_tables_ready);
#endif
#ifdef GERMAN
default_lang(pKsd_t,LANG_german,LANG_tables_ready);
#endif
#ifdef FRENCH
default_lang(pKsd_t,LANG_french,LANG_tables_ready);
#endif
}
