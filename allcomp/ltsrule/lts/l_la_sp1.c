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
 *    File Name:     l_la_sp1.c
 *    Author:        JDB
 *    Creation Date: 06/05/96
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 *
 * 001	MFG		06/17/1998		Copied from l_la_sp1.c
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
    int spec_vowel =0;

	/*
	 *  first, make sure the thing is all upper and 4 or fewer characters
	 */
	size = 0;

	all_vowels = true;
	for(tlp = llp; tlp < rlp ; tlp++)
	{

		/*  add a special check for Spanish: if it's just a string of
	 	 *  vowels, spell it...
	 	 */
		if ((tlp->l_ch != 'a') && 
			(tlp->l_ch != 'e') &&
			(tlp->l_ch != 'o'))
		   spec_vowel = 1;

        if ((TC < 'A' || TC > 'Z') && spec_vowel)
			return TRUE;

		size += 1;
		if(all_vowels && !IS_VOWEL(TC))
			all_vowels = false;
	}
	if(size <= 1)
		return(TRUE);
	/*
	 * spell if all vowels or say size is greater than 4 ..
	 */

	if(all_vowels || (spec_vowel == 0))
		return(FALSE);
	if(size > 4)
		return(TRUE);

	/*
	 *  4 or less and there is a non-vowel in the string ...
	 */ 
 
	return(TRUE);
}
