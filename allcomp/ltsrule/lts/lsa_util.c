/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000, 2001 Force Computers, a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.        
 *                                                                      
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.    
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.                                
 *                                                                      
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.
 *                                                                       
 *********************************************************************** 
 *    File Name:    lsa_util.c
 *    Author:       Matthew Schnee                                         
 *    Creation Date:02/13/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    This module contains the language specific stress analyzers.
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
 *  006	MGS		04/13/2000		Changes for integrated phoneme set 
 *  007 NAL		06/12/2000		Warning removal
 *  008	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 *  009 cab		10/18/2000 		Added copyright info
 *  010	MFG		05/29/2001		Included dectalkf.h
 *  011	CAB		06/01/2001		Updated copyright info
 *  012	MGS		02/26/2002		ACNA updates
 *  013	MGS		04/11/2002		ARM7 port
 *	014	CAB		04/25/2002		Removed warnings by typecast
 */

#include "dectalkf.h"
#ifdef ACNA

#include "ls_def.h"

/* PROTOTPYES */
int lsa_util_force_english(PLTS_T pLts_t);
int find_tri_gram(PLTS_T pLts_t, char *tri,int j);

/* ******************************************************************
 *      Function Name:	lsa_util_pcmp()    
 *
 *  	Description: To compare an array of phonemes against a list
 *          of PHONE for equality.
 *
 *      Arguments:  PHONE *fpp - pointer to the first phoneme in the PHONE list.
 *					PHONE lpp - pointer to the last phoneme in the PHONE list.
 *					char p - pointer to the phoneme array.
 *					unsigned short p_len - length of the phoneme array.
 *
 *      Return Value: int; TRUE
 *						   FALSE
 *
 *      Comments:
 *
 * *****************************************************************/
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

/* ******************************************************************
 *      Function Name: lsa_util_stress_fr()      
 *
 *  	Description: To analyze the stress placement in a word which
 *          		has been classified in the French language group
 *          		and adjust according to rules specified in the 
 *          		routine.
 *
 *      Arguments:  PLTS_T pLts_t
 *					PHONE *fpp		pointer to the first phoneme in the word
 *              					being analyzed.
 *
 *          		PHONE *lpp		pointer to the last phoneme in the word
 *              					being analyzed.
 *
 *          		int pstype		the type of stress being placed.
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void lsa_util_stress_fr(PLTS_T pLts_t, PHONE *fpp, PHONE *lpp, int pstype)
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
 
/* ******************************************************************
 *      Function Name: lsa_util_stress_gr()      
 *
 *  	Description: To analyze the stress placement in a word which
 *          		 has been classified in the Germanic language group
 *          		 and adjust according to rules specified in the 
 *          		 routine.
 *
 *      Arguments: 	PLTS_T pLts_t
 *					PHONE *fpp		pointer to the first phoneme in the word
 *              					being analyzed.
 *
 *          		PHONE *lpp		pointer to the last phoneme in the word
 *              					being analyzed.
 *
 *          		int pstype		the type of stress being placed.
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void lsa_util_stress_gr(PLTS_T pLts_t, PHONE *fpp, PHONE *lpp, int pstype)
{
   char excep_1[7] = {6, US_V, US_AE, US_N, US_D, US_AX, US_N};
   char excep_2[6] = {5, US_V, US_AE, US_N, US_D, US_RR};
   char excep_3[6] = {5, US_V, US_AE, US_N, US_D, US_AX};
   char excep_4[4] = {3, US_V, US_AE, US_N};

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
 
/* ******************************************************************
 *      Function Name: lsa_util_stress_it()      
 *
 *  	Description: To analyze the stress placement in a word which
 *          		 has been classified in the Italian language group
 *          		 and adjust according to rules specified in the 
 *          		 routine.
 *
 *      Arguments:	PLTS_T pLts_t
 *					PHONE *fpp		pointer to the first phoneme in the word
 *             						being analyzed.
 *
 *          		PHONE *lpp		pointer to the last phoneme in the word
 *              					being analyzed.
 *
 *          		int pstype		the type of stress being placed.
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void lsa_util_stress_it(PLTS_T pLts_t, PHONE *fpp, PHONE *lpp, int pstype)
{
   char excep_1[3] = {2, US_IY, US_OW};
   char excep_2[3] = {2, US_IY, US_AX};

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
 
/* ******************************************************************
 *      Function Name: lsa_util_stress_ja()      
 *
 *  	Description: To analyze the stress placement in a word which
 *         			 has been classified in the Japanese language group
 *         			 and adjust according to rules specified in the 
 *         			 routine.
 *
 *      Arguments: 	PLTS_T pLts_t	
 *					PHONE *fpp		pointer to the first phoneme in the word
 *              					being analyzed.
 *
 *          		PHONE *lpp 		pointer to the last phoneme in the word
 *              					being analyzed.
 *
 *          		int pstype		the type of stress being placed.
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void lsa_util_stress_ja(PLTS_T pLts_t, PHONE *fpp, PHONE *lpp, int pstype)
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
 
/* ******************************************************************
 *      Function Name: lsa_util_stress_sl()       
 *
 *  	Description: To analyze the stress placement in a word which
 *          		 has been classified in the Slavic language group
 *          		 and adjust according to rules specified in the 
 *          		 routine.
 *
 *      Arguments:	PLTS_T pLts_t
 *					PHONE *fpp		pointer to the first phoneme in the word
 *              					being analyzed.
 *
 *          		PHONE *lpp		pointer to the last phoneme in the word
 *              					being analyzed.
 *
 *          		int pstype		the type of stress being placed. 
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void lsa_util_stress_sl(PLTS_T pLts_t, PHONE *fpp, PHONE *lpp, int pstype)
{
   PHONE *pp;               /* pointer to 3rd to last phoneme */
   char excep_1[4]  = {3, US_V , US_IH, US_CH};
   char excep_2[4]  = {3, US_W , US_IH, US_CH};
   char excep_3[5]  = {4, US_V , US_IH, US_T, US_S};
   char excep_4[4]  = {3, US_CH, US_AE, US_K};
   char excep_5[4]  = {3, US_CH, US_EH, US_K};
   char excep_6[4]  = {3, US_CH, US_UH, US_K};
   char excep_7[4]  = {3, US_CH, US_IH, US_K};
   char excep_8[3]  = {2, US_AO, US_F};
   char excep_9[5]  = {4, US_W,  US_IH, US_T, US_S};
   char excep_10[4] = {3, US_IY, US_AE, US_K};

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
 
/* ******************************************************************
 *      Function Name: lsa_util_stress_sp()      
 *
 *  	Description: To analyze the stress placement in a word which
 *          		 has been classified in the Spanish language group
 *          		 and adjust according to rules specified in the 
 *          		 routine.
 *
 *      Arguments:	PLTS_T pLts_t
 *					PHONE *fpp		pointer to the first phoneme in the word
 *              					being analyzed.
 *
 *          		PHONE *lpp		pointer to the last phoneme in the word
 *              					being analyzed.
 *
 *          		int pstype		the type of stress being placed. 
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void lsa_util_stress_sp(PLTS_T pLts_t, PHONE *fpp, PHONE *lpp, int pstype)
{
   PHONE *pp;               /* temporary pointer */
   char excep_1[2] = {1, US_R};
   char excep_2[2] = {1, US_LL};
   char excep_3[2] = {1, US_N};
   char excep_4[2] = {1, US_D};
   char excep_5[3] = {2, US_EH, US_Z};
   char excep_6[3] = {2, US_IY, US_OW};
   char excep_7[3] = {2, US_IY, US_AX};

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

 
/* ******************************************************************
 *      Function Name: lsa_util_init_lang()      
 *
 *  	Description: runtime init of table ...
 *
 *      Arguments: PLTS_T pLts_t
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void lsa_util_init_lang(PLTS_T pLts_t)
{
	// CAB Removed warnings by typecast
	pLts_t->lp[0].tri_grams = (unsigned char*)spanish;
	pLts_t->lp[0].entries = spanish_entries;
	pLts_t->lp[0].name_type = NAME_SPANISH;
	pLts_t->lp[1].tri_grams = (unsigned char*)english;
	pLts_t->lp[1].entries = english_entries;
	pLts_t->lp[1].name_type = NAME_ENGLISH;
	pLts_t->lp[2].tri_grams = (unsigned char*)irish;
	pLts_t->lp[2].entries = irish_entries;
	pLts_t->lp[2].name_type = NAME_IRISH;
	pLts_t->lp[3].tri_grams = (unsigned char*)japan;
	pLts_t->lp[3].entries = japan_entries;
	pLts_t->lp[3].name_type = NAME_JAPANESE;
	pLts_t->lp[4].tri_grams = (unsigned char*)french;
	pLts_t->lp[4].entries = french_entries;
	pLts_t->lp[4].name_type = NAME_FRENCH;
	pLts_t->lp[5].tri_grams = (unsigned char*)german;
	pLts_t->lp[5].entries = german_entries;
	pLts_t->lp[5].name_type = NAME_GERMANIC;
	pLts_t->lp[6].tri_grams = (unsigned char*)slavic;
	pLts_t->lp[6].entries = slavic_entries;
	pLts_t->lp[6].name_type = NAME_SLAVIC;
	pLts_t->lp[7].tri_grams = (unsigned char*)italian;
	pLts_t->lp[7].entries = italian_entries;
	pLts_t->lp[7].name_type = NAME_ITALIAN;
}

/* ******************************************************************
 *      Function Name: lsa_util_id_name()      
 *
 *  	Description: 
 *
 *      Arguments:	PLTS_T pLts_t
 *					LETTER *llp
 *					LETTER *rlp
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int lsa_util_id_name(PLTS_T pLts_t, LETTER *llp, LETTER *rlp)
{
	char    tri[64];
	unsigned char tri_prob,tri_mask;
	int weight,step,i,j,size,index;
	S32    highest_prob;
	int most_trigrams;

	for(i=0;llp < rlp;i++)
		{
		pLts_t->name[i] = (char)(*llp).l_ch; // NAL warning removal
		if((ls_char_feat[(int)pLts_t->name[i]] & (CFEAT_vowel|CFEAT_cons)) == 0)
			 return(NAME_ENGLISH);
		llp++;
		}
	pLts_t->name_size = i;
	pLts_t->name[i] = 0;
	if(pLts_t->name_size <= 4)
		return(NAME_ENGLISH);
	if(lsa_util_force_english(pLts_t))
		return(NAME_ENGLISH);

	index = 0;
	tri[index++] = 0;
	for(i=0;i<pLts_t->name_size;i++)
		tri[index++] = pLts_t->name[i]-'a'+1;
	tri[index++] = 0;

	for(i=0;i<NO_LANGS;i++)
			{
			pLts_t->lp[i].prob = 0;
			pLts_t->lp[i].hits = 0;
			pLts_t->lp[i].last_prob = 0;
			pLts_t->lp[i].eliminate = '*';
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
#ifdef NEW_ACNA
				if((tri_prob = find_tri_gram(pLts_t,&tri[i],j)))
#else
				if((tri_prob = pLts_t->lp[j].tri_grams[index]))
#endif
					{
					pLts_t->lp[j].hits += 1;
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
					pLts_t->lp[j].last_prob = (pLts_t->lp[j].last_prob/2)+tri_prob;
					pLts_t->lp[j].prob += weight*pLts_t->lp[j].last_prob;
					}
				else
					pLts_t->lp[j].last_prob = 0;
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
		if(most_trigrams < pLts_t->lp[i].hits)
			most_trigrams = pLts_t->lp[i].hits;
	for(i=0;i<NO_LANGS;i++)
		if(pLts_t->lp[i].hits <= (most_trigrams-2))
			pLts_t->lp[i].eliminate = ' ';

	highest_prob = 0;
	for(i=0;i<NO_LANGS;i++)
		if(highest_prob < pLts_t->lp[i].prob && pLts_t->lp[i].eliminate == '*')
			highest_prob = pLts_t->lp[i].prob;
	for(i=0;i<NO_LANGS;i++)
		if(highest_prob > pLts_t->lp[i].prob)
			pLts_t->lp[i].eliminate = ' ';

	for(i=0;i<NO_LANGS;i++)
			if(pLts_t->lp[i].eliminate == '*')
				return(pLts_t->lp[i].name_type);
	return(NAME_ENGLISH);
}


 
/* ******************************************************************
 *      Function Name: lsa_util_print_ntype()      
 *
 *  	Description: 
 *
 *      Arguments:	PLTS_T pLts_t
 *					int type
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void lsa_util_print_ntype(PLTS_T pLts_t, int type)
{
#ifndef ARM7_NOSWI
	printf("\n[Name: %s type : %s \n]",pLts_t->name,name_types[type]);
#endif
}

/* ******************************************************************
 *      Function Name: lsa_util_force_english()      
 *
 *  	Description: 
 *
 *      Arguments: PLTS_T pLts_t
 *
 *      Return Value:  int
 *
 *      Comments:
 *
 * *****************************************************************/
int lsa_util_force_english(PLTS_T pLts_t)
{
	unsigned char *er;
	int off,nm,miss,i,j;
	
	// CAB Removed warnings by typecast
	for(j=0;(er = (unsigned char *)elim_rules[j]);j++)
	{
		nm = off = 0;
		miss = false;
		for(i=pLts_t->name_size-1;i>=0;i--)
		{
			switch(er[off])
			{
				case 'C':
					if(ls_char_feat[(int)pLts_t->name[i]] & CFEAT_cons)
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
				case 'N':
					if(ls_char_feat[(int)pLts_t->name[i]] & CFEAT_cons)
						break;
					i += 1;
					off += 1;
					break;
				case 'V':
					if(ls_char_feat[(int)pLts_t->name[i]] & CFEAT_vowel)
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
				case '$':
					off += 1;
					break;
				case '*':
					return(true);
				case '#':
					miss = true;
					break;
				default:
					if(pLts_t->name[i] != er[off])
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

/* ******************************************************************
 *      Function Name: find_tri_gram()      
 *
 *  	Description:
 *
 *      Arguments:	PLTS_T pLts_t
 *					char *tri
 *					int j
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int find_tri_gram(PLTS_T pLts_t, char *tri, int j)
{
	int entries;
	int high;
	int low;
	int base;
	int base1;
//	int tri_gram=0;
	int search;
	int compare;

	entries=pLts_t->lp[j].entries;
	search=((((int)tri[0])&0x1F)<<10) |((((int)tri[1])&0x1F)<<5) |((((int)tri[2])&0x1F));

	high=entries;
	low=0;
	
	while (high>=low)
	{
		base=(high+low)>>1;
		base1=base*3;
		compare=((int)(pLts_t->lp[j].tri_grams[base1]))<<8|pLts_t->lp[j].tri_grams[base1+1];
		if (search==compare)
		{
			return(pLts_t->lp[j].tri_grams[base1+2]);
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
		return(pLts_t->lp[j].tri_grams[base1+2]);
	}
	else
	{
		return(0);
	}
	return(0);
}

#endif // #ifdef ACNA

#ifndef NO_INCLUDED_C_FILES
#include "ls_util.c"
#endif
