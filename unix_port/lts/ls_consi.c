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
 *    File Name:    ls_consi.c
 *    Author:       Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    File for including the language dependent lts constants                                                                             
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *  Rev Who     Date        	Description                    
 *  --- -----   ----------- 	---------------------------------------
 *  001 MGS     02/07/1996 
 *	002 MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 *	003 MGS		03/27/1996		Changed ls_prot.h to ls_protp.h for automatic
 *								prototype generation
 *	004	MGS		05/28/1996		undid 003
 *  005 JDB     05/30/1996 		Add switches for language code inclusion    
 *  006	GL		04/21/1997		BATS#357  Add the code for __osf__ build
 *	007 NS		05/02/1997		Removed form-feed characters and fixed a comment for ACI
 * 	008	DR/GL	07/21/1997		UK BUILD: Changed ENGLISH_US to ENGLISH and ENGLISH_UK 
 *    							Depending on if it looked dependant or not.
 *  009 GL      10/13/1997      For BATS#486 remove English only ACNA setting
 * 
 */

#ifdef WIN32
#include        "tts.h"    /* For the declarartion of LPTTS_HANDLE_T */
#include <windows.h>
#include <stdio.h>
#include <string.h>
#endif

/* GL 04/21/1997  add this for OSF build */
#ifdef __osf__
#include        "tts.h"    /* For the declarartion of LPTTS_HANDLE_T */
#include <stdio.h>
#include <string.h>
#endif

#include "port.h"  
#include "kernel.h"
#include "ls_char.h"
#include "ls_dict.h"
#include "ls_defs.h"
#include "ls_data.h"

#include "ls_prot.h"

#ifdef ACNA
#include "ls_acna.h"
#include "l_ac_con.c"
#endif

/* Include the correct language dependent code */  
#ifdef ENGLISH_US  
#include "l_us_con.c"   /* include the english tables for linking */
#endif

#ifdef ENGLISH_UK
#include "l_uk_con.c" /* include the snappy British tables for linking */
#endif	

#ifdef SPANISH
#include "l_sp_con.c"
#endif

#ifdef GERMAN
#include "l_gr_con.c"
#endif

