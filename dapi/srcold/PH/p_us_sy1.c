/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved. 
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    p_us_sy1.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  English syllabification and output 
 *
 ***********************************************************************
 *
 *  Rev Who	    Date        	Description
 *  --- -----   ----------- 	--------------------------------------------
 *  001 MGS     03/25/1996		Moved language dependent code from phsyl.c to here
 *  002 SIK		07/09/1996  	Cleaning up and maintenance
 *  004	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 *  005 CAB		10/18/2000		Changed copyright info
 */

const char ascky_check[] =
{
	0, 'i', 'I', 'e', 'E', '@', 'a', 'A', 'W', '^',
	'c', 'o', 'O', 'U', 'u', 'R', 'Y', 'x', '|', 0,
	0, 0, 0, 0, 'w', 'y', 'r', 'l', 'h', 0,
	0, 'm', 'n', 'G', 'L', 0, 'N', 'f', 'v', 'T',
	'D', 's', 'z', 'S', 'Z', 'p', 'b', 't', 'd', 'k',
	'g', '&', 'Q', 'q', 'C', 'J', 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, ' ', 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0,
};

const unsigned char *common_affixes[] =
{
	"sElvz",
	"kwIst",
	"flEks",
	"sfir",
	"stAn",
	"gr@f",
	"ples",
	"plen",
	"skop",
	"baks",
	"ston",
	"wRT",
	"lxnd",
	"l@nd",
	"k@st",
	"fI|S",
	"h@nd",
	"yard",
	"kcpf",
	"mxnt",
	"mEnt",
	"sElf",
	"st@t",
	"SI|p",
	"sAt",
	"vIl",
	"b@k",
	"bot",
	"lAf",
	"lAk",
	"pAp",
	"wck",
	"wcS",
	"wUd",
	"wRk",
	"kek",
	"bcl",
	"bEl",
	"del",
	"hIl",
	"hol",
	"hUd",
	"l|s",
	"m@n",
	"mxn",
	"mor",
	"nEk",
	"n|s",
	"Sap",
	"Z|n",
	"S|n",
	"tel",
	"tin",
	"tAm",
	"wRd",
	"wer",
	"wIl",
	"wAz",
	"b@g",
	"k@p",
	"kar",
	"k@t",
	"dxm",
	"flA",
	"mxn",
	"m@n",
	"mEn",
	"n^t",
	"pad",
	"ek",
	"bO",
	"de",
	"fL",
	"|J",
	"sc",
	"we",
	0
};

const char syl_vowels[] = "a@AeEiIoOuU^WRc|xLN";

const char *syl_cons[] =
{
	"spl", "spr", "str", "skw", "skl", "skr",
	" Sm", " SL",
	"pl", "pr",
	"bl", "br",
	"fl", "fr",
	"tw", "tr",
	"dw", "dr",
	"Tw", "Tr",
	"kw", "kl", "kr",
	"gw", "gl", "gr",
	"sw", "sl", "sp", "st", "sk", "sm", "sn",
	"Sw", "Sl", "Sr",
	" Y",
	"y",
	"f",
	"t",
	"d",
	"T",
	"k",
	"g",
	"s",
	"S",
	"p",
	"w",
	"l",
	"r",
	"h",
	"D",
	"z",
	"Z",
	"C",
	"J",
	"n",
	"m",
	"v",
	"b",
	0
};

/*
 *      Function Name: saysyllable()      
 *
 *  	Description: used to break the symbol array up into syllable chunks
 *  				 and pass that on ...
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void saysyllable (LPTTS_HANDLE_T phTTS)
{

	int i, j, k;   /* MVP int m; was unreferenced varaible */
	int last, old_tot;
	short temp_symbols[NPHON_MAX + SAFETY + 2];
	short temp_user_durs[NPHON_MAX + SAFETY + 2];
	short temp_user_f0[NPHON_MAX + SAFETY + 2];

	//PKSD_T pKsd_t = phTTS->pKernelShareData;
	PDPH_T pDph_t = phTTS->pPHThreadData;

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
	pDph_t->nsymbtot=1;
	last = 0;
	while (last <= old_tot)
	{
		pDph_t->phone_struct[0] = WBOUND;
		last += 1;
		for (j = 0; (temp_symbols[j + last] != WBOUND) && 
			(temp_symbols[j + last] != COMMA) && 
			(temp_symbols[j + last] != PERIOD) && 
			(temp_symbols[j + last] != EXCLAIM) && 
			(temp_symbols[j + last] != QUEST) && 
			(j + last < old_tot) && (j < 256); j++)
			pDph_t->phone_struct[j + 1] = temp_symbols[j + last];
		pDph_t->phone_struct[j + 1] = 0;
		/* 
		 *  syllabify it, and return the length of syllable_struct ...
		 */
		k = ph_syllab (pDph_t, j);
		pDph_t->syllable_struct[k] = WBOUND;
		/* 
		 *  now, after the comma, start breaking the word up ....
		 */
		syl_clause_init (pDph_t);
		while (--k >= 0)
		{
			/* 
			 *  count up the sounded phones ...
			 */
			if (ascky_check[temp_symbols[last]])
				pDph_t->nphone++;
			if (pDph_t->syllable_struct[k] == SBOUND)
				speak_syllable (phTTS);
			else
			{
				pDph_t->symbols[pDph_t->nsymbtot] = temp_symbols[last];
				pDph_t->user_durs[pDph_t->nsymbtot] = temp_user_durs[last];
				pDph_t->user_f0[pDph_t->nsymbtot++] = temp_user_f0[last++];
			}
		}
		/* 
		 *  take care of the last accumulated syllable ...
		 */
		if (pDph_t->nsymbtot > 1)
			speak_syllable (phTTS);
	}
}
