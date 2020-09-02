/************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000, 2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computer Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    cmd_init.c
 *    Author:       Bill Hallahan
 *    Creation Date:Sep 19, 1993
 *
 *    Functionality:
 *    This function initializes the CMD thread task.
 *    Input:                                                     
 *    bResetAll  A boolean which indicates whether to reset all of    
 *               CMD parameters or just to flush the input text.      
 *    Output:                                                    
 *    None.                                                           
 *    this file is only used for the windows 32 code
 *
 ***********************************************************************
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 * 002  ETT     10/05/1998  added linux code
 * 003	CAB		10/18/2000	Changed copyright info and formatted comments
 * 004	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 005  CAB		05/14/2001	Updated copyright info
 * 006	MFG		05/29/2001	Included dectalkf.h
 * 007	MGS		06/19/2001	Solaris Port BATS#972
 * 008	MGS		04/11/2002	ARM7 port
 */

#include "dectalkf.h"
#ifdef WIN32
#include <windows.h>
#endif

#ifdef ARM7
#include "stdlib.h"
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
/*#include "dtmmedefs.h"*/
#include "opthread.h"
#include <stdlib.h>
#endif 


#include "cm_def.h"
/* #include "defs.h"
#include "esc.h"
#include "kernel.h"                                 
#include "cm_def.h" */

/*extern int phoneme_mode;*/  /* MVP MI */
/*extern int error_mode;  */  /* MVP MI */
/*extern int punct_mode;  */  /* MVP MI */
/*extern unsigned int last_punct;*/ /* MVP MI */

/*extern int timeout;  MVP MI */

void cmd_init( LPTTS_HANDLE_T phTTS, BOOL bResetAll )
{
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	PKSD_T pKsd_t = phTTS->pKernelShareData;

	cm_cmd_reset_comm( pCmd_t, STATE_NORMAL );

	if ( bResetAll )
	{
		/*esc_seq->type = 0;  */           /* MVP MI */
		pKsd_t->phoneme_mode = PHONEME_OFF | PHONEME_SPEAK;
		pCmd_t->error_mode = ERROR_speak;
		pCmd_t->punct_mode = PUNCT_some;
		pCmd_t->last_punct = 0;
		/* timeout = 0;    MVP MI */
		pKsd_t->pitch_delta = 35;
	}
  /*    return;*/
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: FreeCMDThreadMemory                                     */
/*  Author: Murthy Parakala                                           */
/*  Date: September 27, 1995                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function frees all allocated memory inside CMD thread      */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pCmd_t     A pointer to CMD thread specific instance data       */
/*               structure.(PCMD_T :defined in cmdinst.h)             */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void FreeCMDThreadMemory(PCMD_T pCmd_t)
{
	/* Free the esc_seq pointer */
#ifdef ESCAPE_SEQ
	if(pCmd_t->esc_seq)
		free(pCmd_t->esc_seq);
	pCmd_t->esc_seq = NULL;
#endif

	/* Free the cm pointer */
#ifndef ARM7
	if(pCmd_t->cm)
		free(pCmd_t->cm);
	pCmd_t->cm = NULL;
#endif

	/* Free the structure pointer */
	if(pCmd_t)
		free(pCmd_t);
	pCmd_t = NULL;

}


