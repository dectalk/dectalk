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
 *    File Name:	ls_adju1.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    File to catch language dependent stress, sylablification, 
 *	  and allophone code                                                                           
 *                                                                             
 ***********************************************************************       
 *
 *    Revision History:
 *
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 01	DR	    07/21/1997		UK BUILD:Added ENGLISH_UK line to add the l_uk_ad1.c file     
 * 02   GL      09/24/1997      BATS#470  Add LDS debug switch 
 *      
 * 
 */
#if defined (VMS) || defined (LDS_BUILD)
	extern int bflag;
	extern int rflag;
#endif

#ifdef ENGLISH_US
#include "l_us_ad1.c"
#endif

#ifdef ENGLISH_UK
#include "l_uk_ad1.c"
#endif

#ifdef SPANISH
#include "l_sp_ad1.c"
#endif

#ifdef GERMAN
#include "l_gr_ad1.c"
#endif
 