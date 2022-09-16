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
 *    File Name:	lssuff.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  suffix_find() is used to attempt a suffix strip from a word that
 *  hasn't been found in the dictionary ..
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

#ifndef CALLER_ID //mfgdebug

#include	"lsdef.h"
#include	"lsconst.h"


extern unsigned char suffix_table[];
extern unsigned short suffix_index[];
extern unsigned char dic_last_feat;
extern short lphone;
extern unsigned char comp_str[];
extern unsigned char upper_comp_str[];
extern unsigned char *str_vowel;
extern P_PIPE	kinp;

extern unsigned long fc_struct[];
extern int fc_index;

#define	US	upper_comp_str
#define	CS	comp_str
#define	SS	save_str


#define get_short(ptr) ((unsigned short)\
                       ((((unsigned char *)(ptr))[1] << 8)  | \
                        (((unsigned char *)(ptr))[0])))


#define get_long(ptr) ((unsigned int)\
                       ((((unsigned char *)(ptr))[3] << 24)  | \
                        (((unsigned char *)(ptr))[2] << 16)  | \
                        (((unsigned char *)(ptr))[1] << 8)  | \
                        (((unsigned char *)(ptr))[0])))

#ifdef WIN32
#pragma pack(2)
#endif
struct	suff_rule	{
	short				next;
	long				fc;
	unsigned char		rule[256];
};
#ifdef WIN32
#pragma pack ()
#endif

/*
 *  tokens used in the parse table (must match the suffix dictionary
 *  compiler ...
 */

#define	SF_END				0xff			/* End of rule */
#define	SF_STRIP				0xfe			/* Strip type  - */
#define	SF_FC					0xfd			/* Form class tag only  + */
#define	SF_REPLACE			0xfc			/* Start of replacement rule / */
#define	SF_REPLACE_WITH	0xfb			/* Substitute on replacement rule : */
#define	SF_REPLACE_END		0xfa			/* End of substitute rule */
#define	SF_RECURSE			0xf9			/* Retry rules again # */ 
#define	SF_PHONES			0xf8			/* Start of phonemene field  % */
#define	SF_PHONES_END		0xf7			/* End of phonemene field */	


#ifndef CALLER_ID
suffix_find(unsigned char	__far *str_end,short which_dic)
{
	unsigned char	*bp;				/* base text string seach */
	unsigned char	*sp;				/* suffix string seach */
	unsigned char	*np;				/* replacement string save */
	unsigned char	*sbp;				/* saved base pointer to recurse */

	short	i,si,stat;

	struct	suff_rule	*stp;
	unsigned char	save_str[128];

	if(IS_LOWER_ALPHA(ls_lower[*str_end]) == false)
		si = suffix_index[26];
	else
		si = suffix_index[ls_lower[*str_end] - 'a'];

	while(si != (-1))
		{
		stp = (struct suff_rule *)&suffix_table[si];
		bp = str_end; 
		sp =((unsigned char *)(stp)+6); //test mfg
		//If my memeory is right matt changed this to  
		// (unsigned int) (stp + 6) to fix some other problem but it broke suffix stripping
		// HELP
		while(*sp != SF_STRIP && *sp != SF_FC)
			{
			if(ls_lower[*bp] != *sp || bp == str_vowel)
				break;
			bp -= 1;
	      sp += 1;
			}

/*
 *  for form class hits, just set the fc field ...
 */			


#ifdef FULL_LTS		
		if(which_dic && (*sp == SF_FC))
			{
			fc_struct[fc_index] = get_long((unsigned long)stp+2);
			return(MISS);
			}
#endif
/*
 *  if the suffix can be stripped, look for a striping rule starting
 *  with / and see if it can be applied ...
 */
		if(*sp++ == SF_STRIP)
			{
			for(i=0;SS[i] = CS[i];i++);
			sbp = bp;
			while(*sp != SF_END)
				{
				if(*sp++ == SF_REPLACE)

					{
					while(*sp == ls_lower[*bp])
						{
						sp += 1;
						bp -= 1;
						}
					if(*sp++ == SF_REPLACE_WITH)
						{

						np = bp+1;

						while(*sp != SF_REPLACE_END)
							{

							*np++ = *sp++;
							}
						*np++ = 0;
						sp += 1;
						if(*sp == SF_RECURSE)
							{
							sp += 1;
							stat = suffix_find(np-1,which_dic);
							}
						else
							{
#ifdef FULL_LTS
							fc_struct[fc_index] = get_long(((unsigned char *)stp)+2);
#endif
							if(KS.udic_entries != 0)
								{
								stat=ufind_word();
								}
							if(KS.fdic_entries !=0 && stat != HIT)
								{
								stat = find_word();
								}
							}
						if(stat == HIT)
							{
							append_pron(sp);
							return(HIT);
							}
						else
#ifdef FULL_LTS
							fc_struct[fc_index] = 0;
#endif
						for(i=0;CS[i] = SS[i];i++);
						}

					bp = sbp;

					}
				}
			}
		si = get_short(stp);
		}	
	return(MISS);
}
#endif

append_pron(pb)
unsigned char *pb;
{
		  int temp;

	while(*pb != SF_END)
	  if(*pb++ == SF_PHONES)
	    {
		  temp=(*pb++ & pfeat[lphone]);
	    if( temp == *pb++)
	      {
	      while(*pb != SF_PHONES_END)
				sendphone(*pb++);
	      break;
	      }
	    }
	    return (0);
}
#ifdef PRINT_OUTPUT
char *form_class_strings[] = {
	" adj",
	" adv",
	" art",
	" aux",
	" be",
	" bev",
	" conj",
	" ed",
	" have",
	" ing",
	" noun",
	" pos",
	" prep",
	" pron",
	" subj",
	" that",
	" to",
	" verb",
	" who",
	" neg",
	" intr",
	" ref",
	" part",
	" func",
	" conj",
	" char",
	" refr",
	" unused",
	" unused",
	" mark",
	" cont",
	" homo",
};
	
print_fc()
{
	int	i,j;
	long	fc_mask;

	WAIT_PRINT;
	printf("\n[:form");
	for(j=1;j<=fc_index;j++)
		{
		if(fc_struct[j])
			{
			printf("\n  %d :",j);
			fc_mask = 1;
			for(i=0;i<32;i++)
				{
				if(fc_struct[j] & fc_mask)
					printf("%s fc ",form_class_strings[i]);
				fc_mask = fc_mask*2;
				}
			}
		else
			printf("\n  %d : unknown. \n",j);
		}
	printf("]\n");
	SIGNAL_PRINT;
	return (0);
}
#endif

#endif 
