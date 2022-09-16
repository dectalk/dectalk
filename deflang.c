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
 *    File Name:	deflang.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * Kernel services ... this is a shared file of common routines that
 * can be included with other processes.  It uses only kernel data
 * structures (KS.xxx) and stack, both of which will resolve at link
 * time.
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include	"defs.h"
#include	"dectalk.h"
#include	"kernel.h"
#include "cmd.h"
#include "esc.h"
#include	"eng_phon.h"
#include "pcport.h"
#include	"186.h"

/*void kernel_enable(unsigned int);*/
/*unsigned int kernel_disable();*/

/*
 *  become the default language ...	the first language to have both
 *  ph and lts loaded and running become the default ...
 */

default_lang(lang_code,ready_code)
unsigned int lang_code,ready_code;
{
//	unsigned int flags;
#ifdef FULL_LANGUAGE_SUPPORT
	volatile struct dtpc_language_tables _far *cp;
#endif
	if(KS.lang_ready[lang_code] == 0)
		{
		//KS.lang_lts[lang_code] = create_pipe(LTS_PIPE+lang_code,60);
		//KS.lang_ph[lang_code] = create_pipe(PH_PIPE+lang_code,60);
		}
	
	KS.lang_ready[lang_code] |= ready_code;
//	flags=kernel_disable();
#ifdef SIMULATOR
	if (ready_code==LANG_both_ready)
	{
		KS.lang_curr = lang_code;
#ifndef SINGLE_THREADED
		KS.lts_pipe = KS.lang_lts[lang_code];
		KS.ph_pipe = KS.lang_ph[lang_code];
#endif

#ifdef FULL_LANGUAGE_SUPPORT
		cp = KS.loaded_languages;
		while(cp != NULL_LT)
		{
			if((*cp).lang_id == lang_code)
			{
				KS.ascky = (*cp).lang_ascky;
				KS.ascky_size = (*cp).lang_ascky_size;
				KS.reverse_ascky = (*cp).lang_reverse_ascky;
				KS.arpabet = (*cp).lang_arpabet;
				KS.arpa_size = (*cp).lang_arpa_size;
				KS.arpa_case = (*cp).lang_arpa_case;
				KS.typing_table = (*cp).lang_typing;
				KS.error_table = (*cp).lang_error;
			}
			cp = (*cp).link;
		}
#endif
		
	}
#endif

#ifdef FULL_LANGUAGE_SUPPORT
	if(KS.lang_ready[lang_code] == LANG_both_ready && (KS.lang_curr == LANG_none || ready_code == 0))
		{
		KS.lang_curr = lang_code;
#ifndef SINGLE_THREADED
		KS.lts_pipe = KS.lang_lts[lang_code];
		KS.ph_pipe = KS.lang_ph[lang_code];
#endif
		cp = KS.loaded_languages;
		while(cp != NULL_LT)
			{
			if((*cp).lang_id == lang_code)
				{
				KS.ascky = (*cp).lang_ascky;
				KS.ascky_size = (*cp).lang_ascky_size;
				KS.reverse_ascky = (*cp).lang_reverse_ascky;
				KS.arpabet = (*cp).lang_arpabet;
				KS.arpa_size = (*cp).lang_arpa_size;
				KS.arpa_case = (*cp).lang_arpa_case;
				KS.typing_table = (*cp).lang_typing;
				KS.error_table = (*cp).lang_error;
				}
			cp = (*cp).link;
			}
		}
//	kernel_enable(flags);  
#endif
	return (1);
}

