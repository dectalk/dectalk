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
 *    File Name:    lsa_util.c
 *    Author:       Matthew Schnee                                         
 *    Creation Date:02/13/96                                                   
 *                                                                             
 *    Functionality:                                                           
 * This module contains the language specific stress analyzers.
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *  Rev Who     Date        	Description                    
 *  --- -----   ----------- 	---------------------------------------
 *  001 MGS     02/13/1996 		Moved functions fron ACNA code tree to lsa_util.c
 *	002 MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 *	003	MGS		03/27/1996		Added ACNA compile switch and ls_util.c as an 
 * 								include file a tthe bottom
 *  004 TQL     02/05/1997      Moved #include "ls_def.h" to follow #define ACNA 
 *  005 GL      10/13/1997      For BATS#486 remove English_us only ACNA setting 
 */

#ifdef ACNA
/*
#ifdef ENGLISH_US
#ifndef ACNA        
#define ACNA        
#endif
*/
#include "ls_def.h"

/* PROTOTPYES */
int lsa_util_force_english(void);


 
 
/*
 *      Function Name:       
 *
 *  	Description: To compare an array of phonemes against a list
 *          of PHONE for equality.
 *
 *      Arguments:  fpp - pointer to the first phoneme in the PHONE list.
 *
 *          lpp - pointer to the last phoneme in the PHONE list.
 *
 *          p - pointer to the phoneme array.
 *
 *          p_len - length of the phoneme array.
 *
 *      Return Value: int; TRUE
 *						   FALSE
 *
 *      Comments:
 *
 */


int lsa_util_pcmp(PHONE *fpp, PHONE *lpp, char *p, unsigned short p_len)
{
   PHONE *pp;           /* PHONE list scanner */
   int i;               /* loop counter */

   pp = fpp;
   for (i=0; i<p_len; i++)
   {
	  if (pp == lpp || pp->p_sphone != p[i])
	 break;
	  pp = pp->p_fp;
   }

   if (i != p_len) return (FALSE);
   return (TRUE);
}

 
/*
 *      Function Name: lsa_util_stress_fr()      
 *
 *  	Description: To analyze the stress placement in a word which
 *          		has been classified in the French language group
 *          		and adjust according to rules specified in the 
 *          		routine.
 *
 *      Arguments:  fpp - pointer to the first phoneme in the word
 *              	being analyzed.
 *
 *          		lpp - pointer to the last phoneme in the word
 *              	being analyzed.
 *
 *          		pstype - the type of stress being placed.
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void lsa_util_stress_fr(PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype)
{
   fpp = NULL;
   lpp = NULL;

   /*
	* French stress is ultimate if there are only two syllables; otherwise,
	* the stress is initial.
	*/

   if (pLts_t->nsyl == 2)
	  pLts_t->psyl = pLts_t->nsyl;
   else
	  pLts_t->psyl = 1;

   if (pLts_t->psyl < 1) pLts_t->psyl = 1;
   pLts_t->sylp[pLts_t->psyl-1]->p_stress = pstype;
}
 
 
/*
 *      Function Name: lsa_util_stress_gr()      
 *
 *  	Description: To analyze the stress placement in a word which
 *          		 has been classified in the Germanic language group
 *          		 and adjust according to rules specified in the 
 *          		 routine.
 *
 *      Arguments: 	fpp - pointer to the first phoneme in the word
 *              	being analyzed.
 *
 *          		lpp - pointer to the last phoneme in the word
 *              	being analyzed.
 *
 *          		pstype - the type of stress being placed.
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void lsa_util_stress_gr(PLTS_T pLts_t,PHONE *fpp, PHONE *lpp,int pstype)
{
   char excep_1[7] = {6, V, AE, N, D, AX, N};
   char excep_2[6] = {5, V, AE, N, D, RR};
   char excep_3[6] = {5, V, AE, N, D, AX};
   char excep_4[4] = {3, V, AE, N};

   /*
	* Germanic stress is initial, unless the first syllable is [v][@][n], in
	* which case the stress is placed on the following syllable (VAN is a
	* Germanic-specific stress refusing prefix).  HOWEVER, this stress 
	* refuser does NOT refuse the stress if followed by a [d][x][n], [d][R],
	* or [d][x].
	*/

   if (lsa_util_pcmp (fpp, lpp, &excep_1[1], excep_1[0])
   ||  lsa_util_pcmp (fpp, lpp, &excep_2[1], excep_2[0])
   ||  lsa_util_pcmp (fpp, lpp, &excep_3[1], excep_3[0]))
	  pLts_t->psyl = 1;
   else if (lsa_util_pcmp (fpp, lpp, &excep_4[1], excep_4[0]))
	  pLts_t->psyl = 2;
   else
	  pLts_t->psyl = 1;

   if (pLts_t->psyl < 1) pLts_t->psyl = 1;
   pLts_t->sylp[pLts_t->psyl-1]->p_stress = pstype;
}

 
/*
 *      Function Name: lsa_util_stress_it()      
 *
 *  	Description: To analyze the stress placement in a word which
 *          		 has been classified in the Italian language group
 *          		 and adjust according to rules specified in the 
 *          		 routine.
 *
 *      Arguments:  fpp - pointer to the first phoneme in the word
 *             		being analyzed.
 *
 *          		lpp - pointer to the last phoneme in the word
 *              	being analyzed.
 *
 *          		pstype - the type of stress being placed.
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void lsa_util_stress_it(PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype)
{
   char excep_1[3] = {2, IY, OW};
   char excep_2[3] = {2, IY, AX};

   fpp = NULL;

   /*
	* Italian is penultimate stress except when the word has a [i][o]
	* or [i][x] suffix, in which case antepenultimate stress is used.
	*/

   if (lsa_util_pcmp (lpp->p_bp->p_bp, lpp, &excep_1[1], excep_1[0])
   ||  lsa_util_pcmp (lpp->p_bp->p_bp, lpp, &excep_2[1], excep_2[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else
	  pLts_t->psyl = pLts_t->nsyl - 1;

   if (pLts_t->psyl < 1) pLts_t->psyl = 1;
   pLts_t->sylp[pLts_t->psyl-1]->p_stress = pstype;
}

 
/*
 *      Function Name: lsa_util_stress_ja()      
 *
 *  	Description: To analyze the stress placement in a word which
 *         			 has been classified in the Japanese language group
 *         			 and adjust according to rules specified in the 
 *         			 routine.
 *
 *      Arguments: 	fpp - pointer to the first phoneme in the word
 *              	being analyzed.
 *
 *          		lpp - pointer to the last phoneme in the word
 *              	being analyzed.
 *
 *          		pstype - the type of stress being placed.
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void lsa_util_stress_ja(PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype)
{
   fpp = NULL;
   lpp = NULL;

   /*
	* Japanese is always penultimate stress.
	*/

   pLts_t->psyl = pLts_t->nsyl - 1;
   if (pLts_t->psyl < 1) pLts_t->psyl = 1;
   pLts_t->sylp[pLts_t->psyl-1]->p_stress = pstype;
}


 
/*
 *      Function Name: lsa_util_stress_sl()       
 *
 *  	Description: To analyze the stress placement in a word which
 *          		 has been classified in the Slavic language group
 *          		 and adjust according to rules specified in the 
 *          		 routine.
 *
 *      Arguments:	fpp - pointer to the first phoneme in the word
 *              	being analyzed.
 *
 *          		lpp - pointer to the last phoneme in the word
 *              	being analyzed.
 *
 *          		pstype - the type of stress being placed. 
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void lsa_util_stress_sl(PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype)
{
   PHONE *pp;               /* pointer to 3rd to last phoneme */
   char excep_1[4]  = {3, V , IH, CH};
   char excep_2[4]  = {3, W , IH, CH};
   char excep_3[5]  = {4, V , IH, T , S};
   char excep_4[4]  = {3, CH, AE, K};
   char excep_5[4]  = {3, CH, EH, K};
   char excep_6[4]  = {3, CH, UH, K};
   char excep_7[4]  = {3, CH, IH, K};
   char excep_8[3]  = {2, AO, F};
   char excep_9[5]  = {4, W,  IH, T, S};
   char excep_10[4] = {3, IY, AE, K};

   fpp = NULL;

   /*
	* Slavic is penultimate stress except when the word has one of the
	* following suffixes, in which case antepenultimate stress is used:
	*
	* [v][I][C]     -VITCH, -VICH
	* [w][I][C]     -WITCH
	* [v][I][t][s]  -VITZ
	* [C][@][k]     -CZAK
	* [C][E][k]     -CZEK
	* [C][U][k]     -CZUK
	* [C][I][k]     -CYK
	* [c][f]        -OW
	* [w][I][t][s]  -WITZ
	* [i][@][k]     -IAC
	*/

   pp = lpp->p_bp->p_bp->p_bp;
   if (lsa_util_pcmp (pp      , lpp, &excep_1[1], excep_1[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else if (lsa_util_pcmp (pp      , lpp, &excep_2[1], excep_2[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else if (lsa_util_pcmp (pp->p_bp, lpp, &excep_3[1], excep_3[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else if (lsa_util_pcmp (pp      , lpp, &excep_4[1], excep_4[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else if (lsa_util_pcmp (pp      , lpp, &excep_5[1], excep_5[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else if (lsa_util_pcmp (pp      , lpp, &excep_6[1], excep_6[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else if (lsa_util_pcmp (pp      , lpp, &excep_7[1], excep_7[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else if (lsa_util_pcmp (pp->p_fp, lpp, &excep_8[1], excep_8[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else if (lsa_util_pcmp (pp->p_bp, lpp, &excep_9[1], excep_9[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else if (lsa_util_pcmp (pp      , lpp, &excep_10[1], excep_10[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else
	  pLts_t->psyl = pLts_t->nsyl - 1;

   if (pLts_t->psyl < 1) pLts_t->psyl = 1;
   pLts_t->sylp[pLts_t->psyl-1]->p_stress = pstype;
}


 
/*
 *      Function Name: lsa_util_stress_sp()      
 *
 *  	Description: To analyze the stress placement in a word which
 *          		 has been classified in the Spanish language group
 *          		 and adjust according to rules specified in the 
 *          		 routine.
 *
 *      Arguments:	fpp - pointer to the first phoneme in the word
 *              	being analyzed.
 *
 *          		lpp - pointer to the last phoneme in the word
 *              	being analyzed.
 *
 *          		pstype - the type of stress being placed. 
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void lsa_util_stress_sp(PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype)
{
   PHONE *pp;               /* temporary pointer */
   char excep_1[2] = {1, R};
   char excep_2[2] = {1, LL};
   char excep_3[2] = {1, N};
   char excep_4[2] = {1, D};
   char excep_5[3] = {2, EH, Z};
   char excep_6[3] = {2, IY, OW};
   char excep_7[3] = {2, IY, AX};

   fpp = NULL;

   /*
	* Spanish is penultimate; however, the following exceptions apply:
	*
	* 1)  Use ultimate stress if the word ends in [r], [n], [l], or [d];
	*
	* 2)  Use ultimate stress if the word is exactly two syllables and
	*     ends in [E][z];
	*
	* 3)  Use antepenultimate stress if the word ends in [i][o] or [i][x].
	*/

   pp = lpp->p_bp;
   if (lsa_util_pcmp (pp, lpp, &excep_1[1], excep_1[0])
   ||  lsa_util_pcmp (pp, lpp, &excep_2[1], excep_2[0])
   ||  lsa_util_pcmp (pp, lpp, &excep_3[1], excep_3[0])
   ||  lsa_util_pcmp (pp, lpp, &excep_4[1], excep_4[0]))
	  pLts_t->psyl = pLts_t->nsyl;
   else if (pLts_t->nsyl == 2 && lsa_util_pcmp (pp->p_bp, lpp, &excep_5[1], excep_5[0]))
	  pLts_t->psyl = pLts_t->nsyl;
   else if (lsa_util_pcmp (pp->p_bp, lpp, &excep_6[1], excep_6[0])
   ||       lsa_util_pcmp (pp->p_bp, lpp, &excep_7[1], excep_7[0]))
	  pLts_t->psyl = pLts_t->nsyl - 2;
   else
	  pLts_t->psyl = pLts_t->nsyl - 1;

   if (pLts_t->psyl < 1) pLts_t->psyl = 1;
   pLts_t->sylp[pLts_t->psyl-1]->p_stress = pstype;
}

 
/*
 *      Function Name: lsa_util_init_lang()      
 *
 *  	Description: runtime init of table ...
 *
 *      Arguments: void
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void lsa_util_init_lang(void)
{
	lp[0].tri_grams = spanish;
	lp[0].name_type = NAME_SPANISH;
	lp[1].tri_grams = english;
	lp[1].name_type = NAME_ENGLISH;
	lp[2].tri_grams = irish;
	lp[2].name_type = NAME_IRISH;
	lp[3].tri_grams = japan;
	lp[3].name_type = NAME_JAPANESE;
	lp[4].tri_grams = french;
	lp[4].name_type = NAME_FRENCH;
	lp[5].tri_grams = german;
	lp[5].name_type = NAME_GERMANIC;
	lp[6].tri_grams = slavic;
	lp[6].name_type = NAME_SLAVIC;
	lp[7].tri_grams = italian;
	lp[7].name_type = NAME_ITALIAN;
}

int lsa_util_id_name(LETTER *llp,LETTER *rlp)
{
	char    tri[64];
	unsigned char tri_prob,tri_mask;
	int weight,step,i,j,size,index;
	S32    highest_prob;
	int most_trigrams;

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
	if(lsa_util_force_english())
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
				if(tri_prob = lp[j].tri_grams[index])
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


 
/*
 *      Function Name: lsa_util_print_ntype()      
 *
 *  	Description: 
 *
 *      Arguments: int type
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void lsa_util_print_ntype(int type)
{
	printf("\n[Name: %s type : %s]",name,name_types[type]);
}


 
/*
 *      Function Name: lsa_util_force_english()      
 *
 *  	Description: 
 *
 *      Arguments: void
 *
 *      Return Value:  void
 *
 *      Comments:
 *
 */

int lsa_util_force_english(void)
{

	unsigned char *er;
	int off,nm,miss,i,j;

	for(j=0;er=elim_rules[j];j++)
		{
		nm = off = 0;
		miss = false;
		for(i=name_size-1;i>=0;i--)
			{
			switch(er[off]) {

				case    'C' :

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

				case    'N' :

					if(ls_char_feat[name[i]] & CFEAT_cons)
						break;
					i += 1;
					off += 1;
					break;

				case    'V' :

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

				case    '$' :

					off += 1;
					break;

				case    '*' :
					return(true);

				case    '#' :
					miss = true;
					break;

				default     :

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

#endif

#include "ls_util.c"
