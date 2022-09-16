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
 *    File Name:    ls_suffi.c
 *    Author:       Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *                                                                             
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who     Date			Description                    
 * --- 	-----   ----------- 	---------------------------------------
 * 001	MGS		03/15/1996		Added port.h include file for win32 compatiblilty    
 * 002	DR	    07/21/1997		UK BUILD: ENGLISH_US was changed to ENGLISH or 
 *                              added a copy as ENGLISH_UK 
 * 003	CAB		10/18/2000		Changed copyright info
 */
#include "port.h" 

#ifdef ENGLISH_US
#include "l_us_suf.c"
#endif
       
#ifdef ENGLISH_UK
#include "l_uk_suf.c"
#endif
      
/* JDB: out for now              
#ifdef SPANISH
#include "l_sp_suf.c"
#endif              
*/

#ifdef GERMAN
#include "l_gr_suf.c"
#endif

/*
#ifdef FRENCH
#include "l_fr_suf.c"
#endif
*/