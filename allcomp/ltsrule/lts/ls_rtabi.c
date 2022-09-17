/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:	ls_rtabi.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    File to catch local language rule tables                                                                           
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001	MGS		03/18/1996		Added port.h include file    
 * 002	MGS		03/13/1996		Added include <windows.h> for WIN32		
 * 003 	DR		07/21/1997		UK BUILD: ENGLISH_US was changed to ENGLISH or added a copy as ENGLISH_UK       
 * 004  GL      10/13/1997      For BATS#486 remove English only ACNA setting 
 * 005	CHJ		07/20/2000		French added
 * 006 	CAB		10/18/2000		Changed copyright info
 */   
 
#include "port.h"

#ifdef ACNA
#include "lsa_rta.c"
#else

/* catch lang dependence */
#ifdef ENGLISH_US
#include "l_us_rta.c"
#endif
  
/* catch lang dependence */
#ifdef ENGLISH_UK
#include "l_uk_rta.c"
#endif

/* JDB: out for now      
#ifdef SPANISH
#include "l_sp_rta.c"
#endif             
*/

#ifdef GERMAN
#include "l_gr_rta.c"
#endif                

#ifdef FRENCH
#include "l_fr_rta.c"
#endif
  

#endif /* ACNA */    
