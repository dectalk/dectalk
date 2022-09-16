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
 *    File Name:    ls_def.h
 *    Author:       Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *                                                                             
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *  Rev Who     Date        Description                    
 *  --- -----   -------     ---------------------------------------
 *  001	DGC     02/21/1985   Compound word stress.
 *  002	DGC     04/08/1985   First/Second status on lookups.
 *  003	DGC     05/29/1985   Added "TTYPUTC".
 *  004	DGC     09/18/1985   FIRST was multiply defined to be 0. Made
 *                      	 the one in the "wh" code be UNK_WH.
 *  005	GL      05/10/1995   Get the order right. lsdefs.h should be before ltsp.h
 *  006	MGS     02/02/1996   Moved old lsdef.h to ls_def.h   
 *	007 MGS		03/18/1996	 Finished WIN32 code merge, function headers need updating
 *	008 MGS		03/27/1996	 Changed ls_prot.h to ls_protp.h for automatic
 *							 prototype generation
 *  009	GL		04/21/1997	 BATS#357  Add the code for __osf__ build 
 *  010	GL		04/21/1997	 BATS#360  remove spaces before "#define" or "#if" 
 *  011 DR		07/21/1997	 UK BUILD: Changed ENGLISH_US to ENGLISH or added ENGLISH_UK
 *  012	MFG		06/18/1998	 SPANISH_SP & SPANISH_LA support added
 *  013 ETT		10/05/1998   Added Linux code.
 */

#ifndef LS_DEFH
#define LS_DEFH   

#ifdef WIN32
#include "tts.h"    /* For the declarartion of LPTTS_HANDLE_T */
#include "dbgwins.h"
#include <windows.h>
#include <stdio.h>
#include <string.h>
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined (__osf__) || defined (__linux__)
#include "tts.h"    /* For the declarartion of LPTTS_HANDLE_T */
#include <stdio.h>
#include <string.h>
#endif
		
#include "port.h"
#include "kernel.h"
#include "ls_char.h"
#include "ls_cons.h"
#include "ls_dict.h"
#include "ls_defs.h"
#include "ls_data.h"

#ifdef ENGLISH_US                 
#include "l_us_ph.h"   /* english language phonemes */
#endif

#ifdef ENGLISH_UK                 
#include "l_uk_ph.h"   /* english language phonemes */
#endif

#ifdef SPANISH_SP
#include "l_sp_ph.h"
#endif

#ifdef SPANISH_LA
#include "l_la_ph.h"
#endif

#ifdef GERMAN
#include "l_gr_ph.h"
#endif

#include "ls_prot.h"

#ifdef ENGLISH
#ifdef ACNA 
#include "ls_acna.h"
#include "lsa_cons.h"
#include "lsa_prot.h"
#endif
#endif

/* GL 04/21/1997  add this for OSF build */
#ifdef PRINTFDEBUG
#ifdef WIN32
#define printf WINprintf
#endif
#if defined (MSDOS) || defined (__osf__) || defined (__linux__)
#define WINprintf printf
#endif
#endif

#endif /* #ifndef LS_DEFH */
