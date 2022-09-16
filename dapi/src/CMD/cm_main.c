/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:        cm_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Main command driver entry point ... all data is initialized here then we
 *    spawn the command task ...
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev     Who     Date            Description
 * ---     -----   -----------     --------------------------------------------
 * 0001    tek     12/15/1995      merge dtex; this includes adding the 
 *                                 undocumented :vs command which only 
 *                                 worked before because there were no other
 *                                 :v commands. Note that the dtex version 
 *                                 command isn't enabled for the dtpc.
 * 0002    sik     3/22/1996       Re-structured and merged in the win95 code.
 * 0003	   SIK	   07/08/1996  	   Cleaning up and maintenance
 * 0004	   GL	   04/21/1997	   BATS#357  Add the code for __osf__ build 
 * 0005	   GL	   04/21/1997	   BATS#360  remove spaces before "#define" or "#if" 
 * 0006    NS      05/02/1997      Removed form-feed character.  Needed for stripper.
 * 0007    ETT     05oct98         added linux code
 */

/*
 *  Main command driver entry point ... all data is initialized here then we
 *  spawn the command task ...
 */

#include "cm_def.h"

#ifdef __linux__
#include <stdlib.h>
extern void FreeCMDThreadMemory(PCMD_T);
#endif

/*
 * The following #ifdef must be before includes to defeat extern declarations.
 */

#ifdef SEPARATE_PROCESSES
struct share_data *kernel_share;
#endif

#ifdef WIN32
int __stdcall cmd_main( LPTTS_HANDLE_T phTTS )  /* MVP was DWORD lparam */
#endif

#ifdef MSDOS
struct TTS_HANDLE_TAG   hTTS;
LPTTS_HANDLE_T  phTTS;
CMD_T                   Cmd_t;
INPUT_SEQ esc_seq;
main(unsigned int data_seg, unsigned int stack_start)
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined (__osf__) || defined (__linux__)
OP_THREAD_ROUTINE( cmd_main, LPTTS_HANDLE_T phTTS )
#endif

{
	PCMD_T pCmd_t = 0;
	PKSD_T pKsd_t;

#ifdef MSDOS
	phTTS = &hTTS;
	pCmd_t = &Cmd_t; 
	pCmd_t->cm = cm;
        pCmd_t->esc_seq = &esc_seq;
	phTTS->pKernelShareData = kernel_share;
	phTTS->pCMDThreadData = pCmd_t;
#endif
	pKsd_t = phTTS->pKernelShareData;    

/* GL 04/21/1997  add this for OSF build */
#if defined (__osf__) || defined (__linux__)
    /* Initialize thread error field to no error */
    phTTS->uiThreadError = MMSYSERR_NOERROR;
#endif

#ifdef SEPARATE_PROCESSES
	kernel_share = (struct share_data *)malloc(sizeof(struct share_data));
#endif
	
	/* Allocate a Thread specific instance data structure */
#ifdef WIN32 
	if((pCmd_t= (PCMD_T) malloc(sizeof(CMD_T))) == NULL)
	{
			return(MMSYSERR_NOMEM);
	}        
	/***************Thread specific structure initialization MVP ***************/
	if((pCmd_t->cm = (int*)malloc(sizeof(int)*total_commands))== NULL)
	{
			return(MMSYSERR_NOMEM);
    } 
    if((pCmd_t->esc_seq = (INPUT_SEQ *)malloc(sizeof(INPUT_SEQ)))== NULL)
	{
			return(MMSYSERR_NOMEM);
    } 
#endif
/* GL 04/21/1997  add this for OSF build */
#ifdef __osf__
	if((pCmd_t= (PCMD_T) calloc(1,sizeof(CMD_T))) == NULL)
	        phTTS->uiThreadError = MMSYSERR_NOMEM;
        else
		/***************Thread specific structure initialization MVP ***************/
			if((pCmd_t->cm = (int*)calloc(total_commands,sizeof(int) ))== NULL)
				phTTS->uiThreadError = MMSYSERR_NOMEM;
			else
				if((pCmd_t->esc_seq = (INPUT_SEQ *) calloc(1,sizeof(INPUT_SEQ)))== NULL)
					phTTS->uiThreadError = MMSYSERR_NOMEM;

#endif

#ifdef __linux__
	if((pCmd_t= (PCMD_T) calloc(1,sizeof(CMD_T))) == NULL)
	        phTTS->uiThreadError = MMSYSERR_NOMEM;
        else
		/***************Thread specific structure initialization MVP ***************/
			if((pCmd_t->cm = (int*)calloc(total_commands,sizeof(int) ))== NULL)
				phTTS->uiThreadError = MMSYSERR_NOMEM;
			else
				if((pCmd_t->esc_seq = (INPUT_SEQ *) calloc(1,sizeof(INPUT_SEQ)))== NULL)
					phTTS->uiThreadError = MMSYSERR_NOMEM;

#endif

#ifdef WIN32
	SetEvent(phTTS->hMallocSuccessEvent); /*MVP :Set the malloc success event after the last malloc */
#endif
	
/* GL 04/21/1997  add this for OSF build */
#ifdef __osf__
    /* 
	 * CP: Set the event, even if malloc eerror occurred. User
     * will look at uiThreadError for actual error code.
     */
	OP_SetEvent(phTTS->hMallocSuccessEvent);
        if (phTTS->uiThreadError != MMSYSERR_NOERROR)
	{
	    OP_ExitThread(phTTS->uiThreadError);
	    OP_THREAD_RETURN;
	}
#endif

#ifdef __linux__
    /* 
	 * CP: Set the event, even if malloc eerror occurred. User
     * will look at uiThreadError for actual error code.
     */
	OP_SetEvent(phTTS->hMallocSuccessEvent);
        if (phTTS->uiThreadError != MMSYSERR_NOERROR)
	{
	    OP_ExitThread(&phTTS->uiThreadError);
	    OP_THREAD_RETURN;
	}
#endif

	phTTS->pCMDThreadData = pCmd_t;       /* Associate thread specific instance data with corresponding speech object */
		
	cm_util_initialize(phTTS);      /* Initialization routine */
	
#ifdef MSDOS
	create_process(cm_pars_loop,2,data_seg,stack_start,0);
	
	/* 
	 *	2/18/94 eab to avoid unwind in a multiple phrase flush
	 *	problems this needs to be a higher priority than 3 
	 */
	 	
	return(1);
#else
	cm_pars_loop(phTTS);

	/* Free here all allocated memory */
	FreeCMDThreadMemory(pCmd_t);
	/* Reset pCMDThreadData element of TTS_HANDLE_T to null */
	phTTS->pCMDThreadData = NULL;	/* 
									 * Reset CMD thread specific instance data 
									 * with corresponding speech object 
									 */

/* GL 04/21/1997  add this for OSF build */
#ifdef WIN32
	return 0;
#endif
#ifdef __osf__
    OP_ExitThread(MMSYSERR_NOERROR);
	OP_THREAD_RETURN;
#endif

#ifdef __linux__
    OP_ExitThread(MMSYSERR_NOERROR);
	OP_THREAD_RETURN;
#endif

#endif
}

