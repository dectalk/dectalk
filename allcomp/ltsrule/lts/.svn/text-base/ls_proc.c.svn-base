/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                             
 *	  Copyright © 2000, 2001 Force Computers, Inc., a Solectron company. All rights reserved.
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
 *    File Name:	ls_proc.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    Catch language dependent includes.
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who  	Date		    Description                    
 * ---	-----	------------	---------------------------------------
 * 001  JDB     05/31/1996      Add conditional switches for langs
 * 002  GL      11/15/1996      Remove ls_proc2.c
 * 003	DR	    07/21/1997	    UK BUILD:added a copy as ENGLISH_UK 
 * 002	MFG		06/18/1998		SPANISH_SP & SPANISH_LA support added
 * 003	CHJ		07/20/2000		FRENCH support
 * 004 	CAB		10/18/2000		Changed copyright info
 * 005	MFG		05/29/2001		Included dectalkf.h
 * 006 	CAB		06/01/2001		Updated copyright info
 */

#include "dectalkf.h"
#include "ls_def.h"

#ifdef ENGLISH_US
#include "l_us_pr1.c"
#endif

#ifdef ENGLISH_UK
#include "l_uk_pr1.c"
#endif

#ifdef SPANISH_SP
#include "l_sp_pr1.c"
#endif

#ifdef SPANISH_LA
#include "l_la_pr1.c"
#endif
#ifdef ITALIAN
#include "l_it_pr1.c"
#endif

#ifdef GERMAN
#include "l_gr_pr1.c"
#endif

#ifdef FRENCH
#include "l_fr_pr1.c"
#endif