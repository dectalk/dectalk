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
 *    File Name:	ls_cons.h
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    DECtalk-pc include file for constants ...
 *
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-------			---------------------------------------
 * 001	MGS		02/07/1996		Moved data from lsconst.h to ls_cons.h
 * 002	MGS		02/26/2002		ACNA changes and threading fixes
 * 003	MGS		04/11/2002		ARM7 port
 *      
 */

#ifndef LSACONSH
#define LSACONSH  

extern const unsigned char far english[];
extern const unsigned char far irish[];
extern const unsigned char far japan[];
extern const unsigned char far french[];
extern const unsigned char far german[];
extern const unsigned char far slavic[];
extern const unsigned char far italian[];
extern const unsigned char far spanish[];

extern const unsigned int english_entries;
extern const unsigned int irish_entries;
extern const unsigned int japan_entries;
extern const unsigned int french_entries;
extern const unsigned int german_entries;
extern const unsigned int slavic_entries;
extern const unsigned int italian_entries;
extern const unsigned int spanish_entries;

/*extern char name[];
extern int name_size;
extern struct langs lp[];
*/
#ifdef OS_PALM
extern const unsigned char * name_types[];
extern const unsigned char * elim_rules[];  
#else
extern const unsigned char *const name_types[];
extern const unsigned char *const elim_rules[];  
#endif

#endif

          
