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
 *    File Name:	ls_rule1.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *                                                                             
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who	    Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001  JDB     05/30/1996 		Add conditional switches for languages   
 * 002	DR		07/21/1997		UK BUILD: ENGLISH_US was changed to ENGLISH or added a copy as ENGLISH_UK 
 * 003  GL      09/24/1997      BATS#470  Add LDS debug switch 
 * 004	MFG		06/18/1998		SPANISH_SP & SPANISH_LA support added
 * 005  CJH		07/20/2000		FRENCH support
 * 006 	CAB		10/18/2000		Changed copyright info
 */

#if defined (VMS) || defined (LDS_BUILD)
extern int rflag;
extern int tflag;
extern int xflag;
extern char gname[];
extern char *get_rule_data(unsigned int line_number);
#endif

#ifdef ENGLISH_US
#include "l_us_ru1.c"
#include "ls_rule2.c"
#endif

#ifdef ENGLISH_UK
#include "l_uk_ru1.c"
#include "ls_rule2.c"
#endif

#ifdef SPANISH_SP
#include "l_sp_ru1.c"         
#endif

#ifdef SPANISH_LA
#include "l_la_ru1.c"         
#endif
#ifdef ITALIAN
#include "l_it_ru1.c"         
#endif
#ifdef GERMAN
#include "l_gr_ru1.c"
#include "ls_rule2.c"
#endif

#ifdef FRENCH
#include "l_fr_ru1.c"
#include "ls_rule2.c"
#endif