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
 *      
 */

#ifndef LSACONSH
#define LSACONSH  

extern unsigned char far english[];
extern unsigned char far irish[];
extern unsigned char far japan[];
extern unsigned char far french[];
extern unsigned char far german[];
extern unsigned char far slavic[];
extern unsigned char far italian[];
extern unsigned char far spanish[];

extern char name[];
extern int name_size;
extern struct langs lp[];
extern unsigned char *name_types[];
extern unsigned char *elim_rules[];  


#endif

          
