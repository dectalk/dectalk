/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incoporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    p_la_sy1.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  language specific syllabification and output 
 *
 ***********************************************************************
 *
 *  Rev Who	    Date        	Description
 *  --- -----   ----------- 	--------------------------------------------
 *  001 MGS     03/25/1996  	Moved spanish dependent code from sphsyl.c to here
 *  002 SIK		07/12/1996  	Cleaning up and maintenance
 *  003	MFG		06/17/1998		Copied from p_la_sy1.c
 *  004 CAB		10/18/2000		Changed copyright info
 */

const unsigned char           ascky_check[] =
{

	/* allophones */

	'0', 'a', 'e', 'i', 'o', 'u', 'W', 'Y',
	'R', 'l', 'L', 'm', 'n', '1', 'f', 's',
	'j', 'T', 'B', 'D', 'G', '2', 'p', 'b',
	't', 'd', 'k', 'g', 'C', 'y', 'r', 'q',
	'z', 'w', 'N', 'V', 'I', 'M', 'P',

	/* place holders for null range and control */

	0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0,

};

const unsigned char          *common_affixes[] =
{
	"mi'ento",
	0
};

const unsigned char           syl_vowels[] = "aeiouI";

const unsigned char          *syl_cons[] =
{
	"pry", "ply", "bry", "bly", "bry", "fry",
	"fly", "try", "Dry", "dry", "kry", "kly", "Gry", "Gly", "gry", "gly",
	"prw", "plw", "brw", "blw", "brw", "frw",
	"flw", "trw", "Drw", "drw", "krw", "klw", "grw", "glw", "Grw", "Glw",
	"pr", "pl", "br", "bl", "br", "fr",
	"fl", "tr", "Dr", "dr", "kr", "kl", "gr", "Gr",
	"W", "Y",
	"R", "l", "L", "m", "n", "1", "f", "s",
	"j", "T", "B", "D", "G", "2", "p", "b",
	"t", "d", "k", "g", "C", "y", "r", "q",
	"z", "w", "N", "V", "M", "P", 0,

};

void saysyllable (LPTTS_HANDLE_T phTTS) /* changed name from nsaysyllable MGS */
{
	int                     i;
	int                     last, old_tot;
	short                   temp_symbols[NPHON_MAX + SAFETY + 2];
	short                   temp_user_durs[NPHON_MAX + SAFETY + 2];
	short                   temp_user_f0[NPHON_MAX + SAFETY + 2];

	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	/* 
	 *  then, save the clause ...
	 */

	for (i = 0; i <= pDph_t->nsymbtot; i++)
	{
		temp_symbols[i] = pDph_t->symbols[i];
		temp_user_durs[i] = pDph_t->user_durs[i];
		temp_user_f0[i] = pDph_t->user_f0[i];
	}
	old_tot = pDph_t->nsymbtot;
	pDph_t->nsymbtot = 0;
	last = 0;
	i = 0;
	pDph_t->symbols[0] = WBOUND;
	last++;
	i++;

	while (last <= old_tot)
	{
		if (temp_symbols[last] != SBOUND && last != old_tot)
		{
			pDph_t->symbols[i] = temp_symbols[last];
			pDph_t->user_durs[i] = temp_user_durs[last];
			pDph_t->user_f0[i] = temp_user_f0[last];
			i++;
			last++;
		}
		else
		{
			pDph_t->symbols[i] = COMMA;
			pDph_t->user_durs[i] = temp_user_durs[i];
			pDph_t->user_f0[i] = temp_user_f0[i];
			i++;
			pDph_t->nsymbtot = i;
			pDph_t->symbols[i] = 0;
			pDph_t->user_durs[i] = 0;
			pDph_t->user_f0[i] = 0;
			speak_syllable (phTTS);
			i = 1;
			pDph_t->symbols[0] = WBOUND;
			last++;
		}
	}
}

