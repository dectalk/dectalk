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
 *    File Name:	ls_ntype.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  acna name trigram name identifier ...  
 *
 ***********************************************************************
 *    Revision History:
 *
 */
#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#endif
#include	"lsacna.h"

#define	TG_start	0x80
#define	TG_end	0x40
#define	TG_freq	0x3f

extern int fc_index;

extern unsigned char far english[];
extern unsigned char far irish[];
extern unsigned char far japan[];
extern unsigned char far french[];
extern unsigned char far german[];
extern unsigned char far slavic[];
extern unsigned char far italian[];
extern unsigned char far spanish[];

extern unsigned int far english_entries;
extern unsigned int far irish_entries;
extern unsigned int far japan_entries;
extern unsigned int far french_entries;
extern unsigned int far german_entries;
extern unsigned int far slavic_entries;
extern unsigned int far italian_entries;
extern unsigned int far spanish_entries;


struct	langs	{
	unsigned char _far 	*tri_grams;
	unsigned short			entries;
	int						hits;
	int						last_prob;
	char						eliminate;
	long						prob;
	int						name_type;
};

#define	NO_LANGS			8

struct	langs	lp[NO_LANGS] = {

		{spanish, 0, 0, 0, ' ', 0L, NAME_SPANISH},
		{english, 0, 0, 0, ' ', 0L, NAME_ENGLISH},
		{irish, 0, 0, 0, ' ', 0L, NAME_IRISH},
		{japan, 0, 0, 0, ' ', 0L, NAME_JAPANESE},
		{french, 0, 0, 0, ' ', 0L, NAME_FRENCH},
		{german, 0, 0, 0, ' ', 0L, NAME_GERMANIC},
		{slavic, 0, 0, 0, ' ', 0L, NAME_SLAVIC},
		{italian, 0, 0, 0, ' ', 0L, NAME_ITALIAN}
};

/*
 *  used by acna code, set via the is_name() routine for later use...
 */
#ifdef CALLER_ID
unsigned char name[18];
#else
static unsigned char name[64];
#endif
static unsigned char	name_size;   

int find_tri_gram(char *tri,int j);

/* commented out as unused var - 8/9/95  JDB
short first_word;                           
*/


/*
 *  runtime init of table ...
 */

void init_lang(void)
{
	lp[0].tri_grams = spanish;
	lp[0].entries = spanish_entries;
	lp[0].name_type = NAME_SPANISH;
	lp[1].tri_grams = english;
	lp[1].entries = english_entries;
	lp[1].name_type = NAME_ENGLISH;
	lp[2].tri_grams = irish;
	lp[2].entries = irish_entries;
	lp[2].name_type = NAME_IRISH;
	lp[3].tri_grams = japan;
	lp[3].entries = japan_entries;
	lp[3].name_type = NAME_JAPANESE;
	lp[4].tri_grams = french;
	lp[4].entries = french_entries;
	lp[4].name_type = NAME_FRENCH;
	lp[5].tri_grams = german;
	lp[5].entries = german_entries;
	lp[5].name_type = NAME_GERMANIC;
	lp[6].tri_grams = slavic;
	lp[6].entries = slavic_entries;
	lp[6].name_type = NAME_SLAVIC;
	lp[7].tri_grams = italian;
	lp[7].entries = italian_entries;
	lp[7].name_type = NAME_ITALIAN;
}

id_name(llp,rlp)
LETTER *llp;
LETTER *rlp;
{
	char	tri[64];
	unsigned char tri_prob,tri_mask;
	int	weight,step,i,j,size,index;
	long	highest_prob;
	int	most_trigrams;

	for(i=0;llp < rlp;i++)
		{
		name[i] = (*llp).l_ch;
		if((ls_char_feat[name[i]] & (CFEAT_vowel|CFEAT_cons)) == 0)
			 return(NAME_ENGLISH);
		llp++;
		}
	name_size = i;
	name[i] = 0;

	if(name_size < 3)
		return(NAME_ENGLISH);
	if(force_english())
		return(NAME_ENGLISH);

	index = 0;
	tri[index++] = 0;
	for(i=0;i<name_size;i++)
		tri[index++] = name[i]-'a'+1;
	tri[index++] = 0;

	for(i=0;i<NO_LANGS;i++)
			{
			lp[i].prob = 0;
			lp[i].hits = 0;
			lp[i].last_prob = 0;
			lp[i].eliminate = '*';
			}
		size = index - 2;
		weight = (size > 2) ? size/2 : 1;
		step = -1;
		for(i=0;i<size;i++)
			{
			index = (tri[i]*27*27)+(tri[i+1]*27)+tri[i+2];
			tri_mask = 0;
			if(i > size-3)
				tri_mask = TG_end;
			else if(i < 3)
				tri_mask = TG_start;
	
			for(j=0;j<NO_LANGS;j++)
				{
#ifdef COMPRESSED_ACNA
				if((tri_prob = find_tri_gram(&tri[i],j)))
#else
				if(tri_prob = lp[j].tri_grams[index])
#endif
					{
					lp[j].hits += 1;
					if(tri_prob & tri_mask)
						tri_prob = 5*(tri_prob & TG_freq);
					else if(tri_prob & (TG_start | TG_end))
						{
						tri_prob = (tri_prob & TG_freq)/5;
						if(tri_prob == 0)
							tri_prob = 1;
						}
					else
						tri_prob = (tri_prob & TG_freq);
					lp[j].last_prob = (lp[j].last_prob/2)+tri_prob;
					lp[j].prob += weight*lp[j].last_prob;
					}
				else
					lp[j].last_prob = 0;
				}
			if(weight == 1)
				step = 1;
			weight += step;
			}
/*
 *  decide which to choose, for now, take the highest trigram hits, then
 *  the highest probability ...
 */

	most_trigrams = 0;
	for(i=0;i<NO_LANGS;i++)
		if(most_trigrams < lp[i].hits)
			most_trigrams = lp[i].hits;
	for(i=0;i<NO_LANGS;i++)
		if(lp[i].hits != most_trigrams)
			lp[i].eliminate = ' ';

	highest_prob = 0;
	for(i=0;i<NO_LANGS;i++)
		if(highest_prob < lp[i].prob && lp[i].eliminate == '*')
			highest_prob = lp[i].prob;
	for(i=0;i<NO_LANGS;i++)
		if(highest_prob > lp[i].prob)
			lp[i].eliminate = ' ';

	for(i=0;i<NO_LANGS;i++)
			if(lp[i].eliminate == '*')
				return(lp[i].name_type);
	return(NAME_ENGLISH);
}

#ifdef PRINT_OUTPUT
unsigned char *name_types[] =  {

	"English",
	"French",
	"Germanic",
	"Irish",
	"Italian",
	"Japanese",
	"Slavic",
	"Spanish"

};

print_ntype(type)
int type;
{
	printf("\n[Name: %s type : %s]",name,name_types[type]);
}
#endif
/*
 *  elimination rules force the language to english, since they are
 *  so small, they are hand entered ... briefly, the format is ...
 *  
 *		{ type, min, max }
 *
 *     where type is seg		(any single character)  		($)
 *		               voc<1-2>	(1 or 2 vowels)					(V)
 *                   con<1-n> (atleast one consonant)			(C)
 *                   con<0-n> (atleast one consonant)			(N)
 *                   bound 	(begin or end of word) 			(#)
 *                   any 		(anything goes)				 	(*)
 *
 *     Note that when we start the scan, the name is all lower case, so
 *     we can use upper chars for our tokens.
 */

unsigned char *elim_rules[] = {

	"eiC*",
	"CVN#",
	"eCVN#",
	"yCVN#",
	0
};

force_english()
{

	unsigned char *er;
	int	off,nm,miss,i,j;

	for(j=0;er=elim_rules[j];j++)
		{
		nm = off = 0;
		miss = false;
		for(i=name_size-1;i>=0;i--)
			{
			switch(er[off])	{

				case	'C'	:

					if(ls_char_feat[name[i]] & CFEAT_cons)
						nm += 1;
					else if(nm)
						{
						i += 1;
						off += 1;
						nm = 0;
						}
					else
						miss = true;
					break;

				case	'N'	:

					if(ls_char_feat[name[i]] & CFEAT_cons)
						break;
					i += 1;
					off += 1;
					break;

				case	'V'	:

					if(ls_char_feat[name[i]] & CFEAT_vowel)
						nm += 1;
					else if(nm > 0 && nm <=2)
						{
						i += 1;
						off += 1;
						nm = 0;
						}
					else
						miss = true;
					break;

				case	'$'	:

					off += 1;
					break;

				case	'*'	:
					return(true);

				case	'#'	:
					miss = true;
					break;

				default		:

					if(name[i] != er[off])
						miss = true;
					else
						off += 1;
					break;
				};
			if(miss)
				break;
			}
		if(i < 0 && er[off+1] == '#')
			return(true);
		}
	return(false);
}

int find_tri_gram(char *tri,int j)
{
	int high;
	int low;
	int base;
	int base1;
//	int tri_gram=0;
	int search;
	int compare;

	search=((((int)tri[0])&0x1F)<<10) |((((int)tri[1])&0x1F)<<5) |((((int)tri[2])&0x1F));

	high=lp[j].entries;
	low=0;
	
	while (high>=low)
	{
		base=(high+low)>>1;
		base1=base*3;
		compare=((int)(lp[j].tri_grams[base1]))<<8|lp[j].tri_grams[base1+1];
		if (search==compare)
		{
			return(lp[j].tri_grams[base1+2]);
		}
		if (search<compare)
		{
			high=base-1;
		}
		else
		{
			low=base+1;
		}
	}
	if (search==compare)
	{
		return(lp[j].tri_grams[base1+2]);
	}
	else
	{
		return(0);
	}
//	return(0);
}


