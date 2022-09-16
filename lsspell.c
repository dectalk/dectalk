/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	lsspell.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  say_it() returns true if we should pass this string through letter to
 *  sound ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */
 
#include	"lsdef.h"
#include	"lsconst.h"

extern unsigned char spell_it[26][26];


#define	TC		(tlp->l_ch)
#define	NON_VOWEL(C)	(C != 'A' && C != 'E' && C != 'I' && C != 'O' && C != 'U')

#define	BC1	((llp->l_ch)-'A')
#define	BC2	(((llp+1)->l_ch)-'A')
#define	EC1	(((rlp-1)->l_ch)-'A')
#define	EC2	(((rlp-2)->l_ch)-'A')

#define	SPELL_END		0x01	/* spell if end pair */
#define	SPELL_BEGIN		0x02	/* spell if begin pair */

int say_it(llp,rlp)
LETTER *llp;
LETTER *rlp;
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
		if(TC < 'A' || TC > 'Z')
			return(TRUE);
		size += 1;
		if(all_vowels && NON_VOWEL(TC))
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


