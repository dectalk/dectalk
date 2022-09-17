/*
 ***********************************************************************
 *                                                                      
 *                           Coryright (c)                              
 *    © Digital Equipment Corporation 1996. All rights reserved.        
 * Copyright (c) 1985, Digital Equipment Corporation, Maynard, Mass.    
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
 *    File Name:	l_us_cha.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    DECtalk-pc character folding and conversion tables ...  the following
 *    sets of tables are used to accept, type, and translate input characters.  
 *    This looks like a big waste of space until you realize the baggage you
 *    would have to carry around with each character otherwise ...
 *
 *	  This file for now is used by all the languages.  Except for ls_fold.tab.
 *
 *
 *  Basically ...
 *
 *    lower case conversion is now  ls_lower[c]
 *    upper case conversion is now  ls_upper[c]
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date		Description                    
 * ---	-----	-----------	---------------------------------------
 * 001  CJL     11/09/1995      Add GL's new char set for English
 * 002  MGS     02/07/1996      Moved code from lschar.c
 * 003  MGS     03/10/1996      ifdef'd out ls_fold, it is unused
 * 004  GL      07/29/1996      use shared tab.
 * 005	GL		11/01/1996		rollback ls_fold[] to handle multi-national
 *								character.
 * 006	DR/GL	07/21/1997		UK BUILD: Use the ls_fold.tab for both UK and US
 * 007	MGS		04/11/2002		ARM7 port
 */

#include "ls_def.h"
#include "ls_char.h"

/*
 *  multi-national chanaracter folding table ... upper case 8 and 7 bit characters are
 *  folded to their lower-case 7 bit equivalents, multi-national character fold to
 *  something close to it.
 */
 
#ifdef OS_PALM
#pragma pcrelconstdata off
#endif //OS_PALM

#ifdef ENGLISH
const unsigned char ls_fold[] = {

#include "ls_fold.tab"
};
#endif

/*
 *  lower-case folding table ... upper case 8 and 7 bit characters are
 *  folded to their lower-case 8 and 7 bit equivalents ...
 */

const unsigned char ls_lower[] = {

#include "ls_lower.tab"
};

/*
 *  Upper case folding table ...  sort of like above but only the 
 *  lower case ascii is folded to upper and the full eight bits are
 *  kept.
 */

const unsigned char ls_upper[] = {
#include "ls_upper.tab"
};

/*
 *  Each letter that is read in has certain characteristics associated with
 *  it.
 */
const unsigned char ls_char_feat[]= {
#include "ls_feat.tab"
};

#ifdef OS_PALM
#pragma pcrelconstdata on
#endif //OS_PALM
