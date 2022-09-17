/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved. 
 *    © Digital Equipment Corporation 1996. All rights reserved.
 *
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
 *
 ***********************************************************************
 *    File Name:	ls_main.c
 *    Author:       Matthew Schnee
 *    Creation Date:02/06/96
 *
 *    Functionality:
 *    lts entry point stub ...
 *
 ***********************************************************************
 * Revision History:                    
 *
 * Rev	Who		Date			Description
 * ---	-----	-----------		---------------------------------------
 * 001	MGS		02/27/1996		Added function header
 * 002  MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 * 003  JDB 	05/30/1996 		Mods for local language code merge               		
 * 004  GL      07/31/1996      move ACNA code into ENGLISH block
 * 005  GL		12/05/1996		remove DTEX language pipe hack.
 * 006	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 007 	DR		07/21/1997		UK BUILD: ENGLISH_US was changed to ENGLISH or added a copy as ENGLISH_UK 
 * 008	mfg		06/22/1998		Added support for LANG_latin_american
 * 009	GL		11/12/1998		BATS#800  need to initialize some Spanish variables 
 * 010	GL		11/30/1998		BATS#800  use the right symbol 
 * 011  CHJ		07/20/2000		FRENCH added
 * 012 	CAB		10/18/2000		Changed copyright info
 */

#include "ls_def.h"

/* this global is here to make it available to ls_task_main */

struct TTS_HANDLE_TAG hTTS;
LPTTS_HANDLE_T	phTTS; 
LTS_T   Lts_t;
/*
 *	Function Name:
 *		main	
 *
 *	Description:
 *		this main function serves as a calling stub for ls_task
 *		it creates the process ls_task_main
 *
 *	Arguments:                             
 *		unsigned int data_seg		The data segment for use
 *		unsigned int stack_start	The bottom of the stack
 *
 *	Return Value: int                                         
 *		just here for comaptibility
 *
 *	Comments:
 *
 */
int main(unsigned int data_seg,unsigned int stack_start)
{

  	phTTS=&hTTS;
  	
  	
  	/* MVP :Associate LTS thread specific data handle to the current speech object*/
  	phTTS->pLTSThreadData = &Lts_t;
  	phTTS->pKernelShareData = kernel_share;	/* set a pointer to the KS structure */

	ls_util_lts_init(phTTS->pLTSThreadData, phTTS->pKernelShareData);	



/* JDB: language dependent... */                            
#ifdef ENGLISH	
#ifdef ACNA
		lsa_util_init_lang(phTTS->pLTSThreadData);
#endif	
#ifdef ENGLISH_US
	default_lang(LANG_english,LANG_lts_ready);
#endif
#ifdef ENGLISH_UK
	default_lang(LANG_british,LANG_lts_ready);
#endif
#endif

#ifdef SPANISH
#ifdef SPANISH_SP
   	default_lang (LANG_spanish, LANG_lts_ready);  
#endif
#ifdef SPANISH_LA 
   	default_lang (LANG_latin_american, LANG_lts_ready);  
#endif
#ifdef ITALIAN 
   	default_lang (LANG_italian, LANG_lts_ready);  
#endif

/* GL 11/12/1998, BATS#800 need to initialize these variables for Spanish */
	phTTS->pLTSThreadData->ord = 0;
   	phTTS->pLTSThreadData->dic_offset = 0;
   	phTTS->pLTSThreadData->flag =0;
#endif


/*#endif*/

#ifdef GERMAN               
		default_lang (LANG_german, LANG_lts_ready);
#endif

#ifdef FRENCH               
		default_lang (LANG_french, LANG_lts_ready);
#endif

	create_process(ls_task_main,4,data_seg,stack_start,0);
	return (0);
}	
    
    
