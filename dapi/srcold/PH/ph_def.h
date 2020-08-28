/* 
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2000, 2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996. All rights reserved.        
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
 *    File Name:    ph_def.h
 *    Author:       Matthew Schnee                                         
 *    Creation Date:03/21/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *  Data structure definitions for LTS
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *  Rev Who     Date        	Description                    
 *  --- -----   ----------- 	--------------------------------------- 
 *	001	MGS		05/31/1996		Merged Spanish with English
 *	002	MGS		06/19/1996		Merged German with English/Spanish
 *  003 SIK		07/12/1996  	Cleaning up and maintenance
 *  004	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 *  005	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 *  006	GL		05/04/1998		support dt_abort macro
 *  007 ETT		10/05/1998		Added Linux code.
 *  008	CAB		10/18/2000		Fixed copyright info.
 *  009	MGS		05/09/2001		Some VxWorks porting BATS#972
 *  010 CAB		05/14/2001		Updated copyright
 *  011	MGS		06/19/2001		Solaris Port BATS#972
 */

#ifndef PHDEFH
#define PHDEFH
#ifdef WIN32
#include <stdio.h>
#include <windows.h>
#endif


#include "port.h"
#include "ph_defs.h"
#include "dt_abort.h"

#include "tts.h"

#include "ph_data.h"				   /* MVP : New header file ,defines  instance specific data structure for PH thread */
#include "ph_prot.h"

#ifdef ARM7
#define printf error_func_printf
#define WINprintf error_func_WINprintf
#endif

/* GL 04/21/1997  add this for OSF build */
#ifdef PRINTFDEBUG

#ifdef WIN32
#define printf WINprintf
#endif

#if defined (MSDOS) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#define WINprintf printf
#endif /* defined (MSDOS) || defined (__osf__) || defined (__linux__) */

#endif /* PRINTFDEBUG */

#endif /* PHDEFH */




