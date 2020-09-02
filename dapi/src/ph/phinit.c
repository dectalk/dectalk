/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000, 2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:	phinit.c
 *    Author: Bill Hallahan 
 *    Creation Date: 09/19/1993
 *
 *    Functionality:  Abstract:
 * 	  This function initializes the PH thread task.                   
 *
 * 	  Input:                                                            
 *
 * 	  bResetAll  A boolean which indicates whether to reset all of    
 * 	  PH parameters or to leave the speaker voice, the     
 * 	  speaking rate, and other parameters the same.        
 *
 * 	  Output:                                                          
 *
 * 	  None.
 *
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 * 002  ETT		10/05/1998		Added Linux code.
 * 003  EAB		09/20/2000		Chris found Product and AD different in two place.
 *								Removal of redundant usevoice and unused variable dcflag
 * 004	CAB		10/18/2000		Changed copyright info and formatted comments
 * 005	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 006  CAB		05/14/2001		Updated copyright info
 * 007	MFG		05/29/2001		Included dectalkf.h
 * 008	MGS		06/19/2001		Solaris Port BATS#972
 */
/**********************************************************************/
/**********************************************************************/

#include "dectalkf.h"
#ifdef WIN32
#include <windows.h>
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#include "opthread.h"
#endif

#include "ph_def.h"

/* #include "phdefs.h" */
							/* #include "phinst.h" *//* MVP : instance header file */
/* #include "l_us_ph.h" #include "ttsapi.h" */

/***************************************************************************/
/* MVP : The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                */
/* Input arrays (set by call to PHSETTAR.C whenever time for new phone)    */
/* extern PARAMETER param[];       Struc of input vars for each par        */
/* extern short parstochip[];   Array of paramters to TMS.                 */
/* extern short symbols[];      Where input symbols go.                    */
/* extern short nsymbtot;       Length of above.                           */
/* extern short curspdef[];     current speaker definition                 */
/* extern FLAG loadspdef;       Flag: need to load TMS320.                 */
/* extern short compause;       Comma pause, frames                        */
/* extern short perpause;       Period pause, frames                       */
/* extern unsigned int asperation;                                         */
/* extern int reset_pitch;                                                 */
/* extern int bound;                                                       */
/* extern int nphone;                                                      */
/* extern int lastoffs;                                                    */
/***************************************************************************/

/* extern int default_pitch; *//* MVP : NOT USED */
/* extern short sprate; *//* Speaking rate */
/* extern short last_voice; *//* MVP MI Not used *//* Voice for tone reloads */
/* extern short curspdef[]; *//* current speaker definition    */
/* extern dwLastPhoneme; *//* MVP : moved to Kernel_share_data */
 
/*
 *      Function Name: phinit()      
 *
 *  	Description:Initializes vars. in the PDPH_T data structure. 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS, 
 *				   BOOL bResetAll
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void phinit (LPTTS_HANDLE_T phTTS, BOOL bResetAll)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PDPH_T pDph_t = phTTS->pPHThreadData;

	init_phclause (pDph_t);




	if (bResetAll)
	{
		pKsd_t->sprate = 180;
		pDph_t->perpause = 0;
		pDph_t->compause = 0;

		pDph_t->param[F0].outp = &(pDph_t->parstochip[OUT_T0]);
		pDph_t->param[F1].outp = &(pDph_t->parstochip[OUT_F1]);
		pDph_t->param[F2].outp = &(pDph_t->parstochip[OUT_F2]);
		pDph_t->param[F3].outp = &(pDph_t->parstochip[OUT_F3]);
		pDph_t->param[FZ].outp = &(pDph_t->parstochip[OUT_FZ]);
		pDph_t->param[B1].outp = &(pDph_t->parstochip[OUT_B1]);
		pDph_t->param[B2].outp = &(pDph_t->parstochip[OUT_B2]);
		pDph_t->param[B3].outp = &(pDph_t->parstochip[OUT_B3]);
		pDph_t->param[AV].outp = &(pDph_t->parstochip[OUT_AV]);
		pDph_t->param[AP].outp = &(pDph_t->parstochip[OUT_AP]);
		pDph_t->param[A2].outp = &(pDph_t->parstochip[OUT_A2]);
		pDph_t->param[A3].outp = &(pDph_t->parstochip[OUT_A3]);
		pDph_t->param[A4].outp = &(pDph_t->parstochip[OUT_A4]);
		pDph_t->param[A5].outp = &(pDph_t->parstochip[OUT_A5]);
		pDph_t->param[A6].outp = &(pDph_t->parstochip[OUT_A6]);
		pDph_t->param[AB].outp = &(pDph_t->parstochip[OUT_AB]);
		pDph_t->param[TILT].outp = &(pDph_t->parstochip[OUT_TLT]);

		pDph_t->param[AREAB			].outp = &(pDph_t->parstochip[OUT_ABLADE]);
		pDph_t->param[AREAL			].outp = &(pDph_t->parstochip[OUT_AL]);
		pDph_t->param[AREAG			].outp = &(pDph_t->parstochip[OUT_AG]);
		pDph_t->param[AREAN			].outp = &(pDph_t->parstochip[OUT_AN]);
		pDph_t->param[PRESS			].outp = &(pDph_t->parstochip[OUT_PS]);
		pDph_t->param[TONGUEBODY	].outp = &(pDph_t->parstochip[OUT_ATB]);
		pDph_t->param[CHINK			].outp = &(pDph_t->parstochip[OUT_CNK]);
		pDph_t->param[UEL			].outp = &(pDph_t->parstochip[OUT_UE]);
		pDph_t->param[DC			].outp = &(pDph_t->parstochip[OUT_DC]);
		pDph_t->param[OQU			].outp = &(pDph_t->parstochip[OUT_OQ]);
		pDph_t->param[BRST			].outp = &(pDph_t->parstochip[OUT_BRST]);



		pKsd_t->speaker = (int *) &(pDph_t->curspdef[0]);

#ifdef SPANISH
	usevoice (phTTS, HUGE_HARRY);
#else
	usevoice (phTTS, PERFECT_PAUL);
#endif

		saveval (pDph_t);
	}

	/* new_phone is not a gloabl variable. new_phone = TRUE; */
	pDph_t->reset_pitch = FALSE;
	pDph_t->symbols[0] = COMMA;
	pDph_t->bound = COMMA;
	pDph_t->lastoffs = 0;
	pDph_t->nsymbtot = 1;
	pDph_t->nphone = 0;
	pDph_t->asperation = 0;
	pKsd_t->dwLastPhoneme = 0xFFFFFFFF;

	return;
}
/****************************************end of phinit.c***************************************/
