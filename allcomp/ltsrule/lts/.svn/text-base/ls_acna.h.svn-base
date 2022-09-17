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
 *    File Name:    ls_acna.h
 *    Author:       Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    grab stuff from the lts directorys ...
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *  Rev Who     Date        	Description
 *  --- -----   -------     	---------------------------------------
 *  001	CJL		06-JAN-1995		corrected include for ltsr.h.
 *  002 MGS		13-Feb-1996		Moved file to ls_acna.h    
 *	003 MGS		27-Mar-1996		Changed lsa_prot.h to lsa_prop.h for automatic
 *								prototype generation
 *	004 MGS		02/25/2002		CHanges for smaller ACNA.
 * 
 */
#ifndef LS_ACNAH
#define LS_ACNAH


#define TG_start    0x80
#define TG_end  	0x40
#define TG_freq 	0x3f


struct  langs   
{
	unsigned char _far      *tri_grams;
	int                     entries;
	int                     hits;
	int                     last_prob;
	char                    eliminate;
	S32                     prob;
	int                     name_type;
};

#define NO_LANGS                        8

#define PLENGTH 0x0F                    /* Length, in phonemes.         */
#define PCONT   0x10                    /* Continue.                    */
#define PRCON   0x20                    /* Require a consonant.         */
#define PRVOC   0x40                    /* Require a vowel.             */
#define P2SYL   0x80                    /* Destress two sylables.       */

/*
 * Language group identifiers.
 */

#define NAME_ENGLISH                    0
#define NAME_FRENCH                     1
#define NAME_GERMANIC                   2
#define NAME_IRISH                      3
#define NAME_ITALIAN                    4
#define NAME_JAPANESE                   5
#define NAME_SLAVIC                     6
#define NAME_SPANISH                    7

/*
 * The following masks are used in performing rule matching.
 */

#define M_R_LANG        0x7FFF          /* rule's language tag field */
#define M_R_SPECIFIC    0x8000          /* rule's specificity field */

//#include "lsa_prot.h"

#endif
  
