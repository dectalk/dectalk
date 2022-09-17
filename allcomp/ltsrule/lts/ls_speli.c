/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2000, 2001 Force Computers, Inc., a Solectron company. All rights reserved.
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
 *    File Name:	ls_speli.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    File for catchong the language dependent spelling table                                                                              
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 * 002	DR		07/21/1997		UK BUILD: ENGLISH_US was changed to ENGLISH or added a copy as ENGLISH_UK      
 * 003 	CAB		10/18/2000		Changed copyright info
 * 004	MFG		05/29/2001		Included dectalkf.h
 * 005	CAB		06/01/2001		Updated copyright info
 * 006	MGS		06/19/2001		Added dectalkf.h
 * 
 */

#include "dectalkf.h"
#include "ls_def.h"

#ifdef ENGLISH_US
#include "l_us_spe.c"
#endif

#ifdef ENGLISH_UK
#include "l_uk_spe.c"
#endif

/* JDB: we don't have Spanish spelling info right now,
#ifdef SPANISH
#include "l_sp_spe.c"
#endif
*/

/* JDB: same thing for German
#ifdef GERMAN
#include "l_gr_spe.c"
#endif                       
*/

/*
#ifdef FRENCH
#include "l_fr_spe.c"
#endif
*/