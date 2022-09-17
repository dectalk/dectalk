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
 *    File Name:	l_uk_sp1.c
 *    Author:		Doug Robinson/Ginger Lin                                      
 *    Creation Date:07/21/97                                                 
 *                                                                             
 *    Functionality:                                                           
 *    The language dependent spell vs. speak include file for UK english                                                                           
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 *  001 DR/GL	07/21/1997		Copied from l_us_sp1.c
 * 
 */

#include "ls_def.h"

                    
extern unsigned char spell_it[26][26];


/*
 *	Function Name:	
 *		ls_spel_say_it
 *
 *	Description:      
 *		decide weather or not to speak the word
 *		words get spelled if they have no vowels
 *		if they are all uppercase, 4 lettters or less, and are in the
 *			spell_it table as illegal beginnings or endings
 *
 *	Arguments:                                             
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp		The right bounding pointer the word
 *
 *	Return Value:                                          
 *		TRUE of the wird is going to be spoken
 *		FALSE if the word is going to be spelled
 *
 *	Comments:
 *
 */
int ls_spel_say_it(LETTER *llp,LETTER *rlp)
{

	LETTER	*tlp;
	unsigned int	size;
	int	all_vowels;

	/*
	 *  first, make sure the thing is all upper and 4 or fewer characters
	 */
	size = 0;
	all_vowels = true;
	for(tlp = llp; tlp < rlp ; tlp++)
	{
		if (TC < 'A' || TC > 'Z')
			return (TRUE);
		size += 1;
		if(all_vowels && !IS_VOWEL(TC))
			all_vowels = false;
	}
	if(size <= 1)
		return(TRUE);
	/*
	 * spell if all vowels or say size is greater than 4 ..
	 */

	if(all_vowels)
		return(FALSE);
	if(size > 4)
		return(TRUE);

	/*
	 *  4 or less and there is a non-vowel in the string ...
	 */ 
 
	if(spell_it[BC1][BC2] & SPELL_BEGIN)
		return(FALSE);
	if(spell_it[EC1][EC2] &	SPELL_END)
		return(FALSE);
	return(TRUE);
}



