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
 *    File Name:	ls_char.h
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    macros that used the character map tables ...
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	---------		---------------------------------------
 *	001	MGS		02/05/1996		Fixed problem with IS_LOWER and IS_UPPER macros
 *								to support the entire character set
 *	002 MGS		02/08/1996		Moved lschar.h to ls_char.h
 *	003 MGS		02/27/1996		Added IS_ALPHA macro 
 *	004 MGS 	02/27/1996		Added IS_DIGIT macro
 */

#ifndef LS_CHARH
#define LS_CHARH

#define	CFEAT_null			0x00			/* place holder */
#define	CFEAT_lower			0x01			/* lower-case a to z */
#define	CFEAT_upper			0x02			/* upper-case A to Z */
#define	CFEAT_punct			0x04			/* punctuation marks */
#define	CFEAT_non_alpha		0x08			/* printable non-alpha */
#define	CFEAT_digit			0x10			/* is a numeric */
#define	CFEAT_cons			0x20			/* consonant */
#define	CFEAT_vowel			0x40			/* vowel */

/*
 *  case is already folded to upper/lower ...
 */
#define	IS_LOWER(c)				(ls_char_feat[c&0xff] & CFEAT_lower)
#define	IS_UPPER(c)				(ls_char_feat[c&0xff] & CFEAT_upper)

/*
 * special marks ...
 */

#define	IS_LOWER_ALPHA(c)		(ls_char_feat[c] & CFEAT_lower)
#define	IS_UPPER_ALPHA(c)		(ls_char_feat[c] & CFEAT_upper)
#define IS_ALPHA(c)				(ls_char_feat[c] & (CFEAT_lower|CFEAT_upper))
#define	IS_VOWEL(c)				(ls_char_feat[c] & CFEAT_vowel)
#define	IS_CONST(c)				(ls_char_feat[c] & CFEAT_const)
#define	IS_PUNCT(c)				(ls_char_feat[c] & CFEAT_punct)
#define IS_DIGIT(c)				(ls_char_feat[c] & CFEAT_digit)

#endif
