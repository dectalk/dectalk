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
 *    File Name:    l_gr_sp1.c
 *    Author:       JDB
 *    Creation Date:06/05/96
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History: 
 *
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 *
 */
#include "ls_def.h"
 
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
//    int spec_vowel =0;

	/*
 	 *  first, make sure the thing is all upper and 4 or fewer characters
  	 */
	size = 0;

	all_vowels = true;
	for(tlp = llp; tlp < rlp ; tlp++)
	{
		size += 1;
		if(TC!='a' && TC!='e' && TC!='i' && TC!='o' &&
			TC!='u' && TC!='y' && TC!=132 &&
			TC!=148 && TC!=129)
			all_vowels = false;

		/* for German, don't stop at Z... allow special chars! */
		if ( ((TC < 'A' || TC > 154) && TC!= 225)
			 && (all_vowels == false))
			return TRUE;
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
 
	/* JDB: for now, no valid table for German! */
	return(TRUE);
}
