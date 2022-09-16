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
 *    File Name:	ls_stres.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * This module contains the language specific stress analyzers.
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include "lsacna.h"

extern PHONE *sylp[NSYL];		/* syllable table */
extern short nsyl;			/* # of syllables */
extern short rsyl;			/* # of syllables in root form */
extern short psyl;			/* primary stress syllable */

/*
 * ROUTINE TITLE:	Phoneme Compare
 *
 * HISTORY:		PRG	23-NOV-1988
 *			Routine created.
 *
 * PURPOSE:		To compare an array of phonemes against a list
 *			of PHONE for equality.
 *
 * INPUT:		fpp - pointer to the first phoneme in the PHONE list.
 *
 *			lpp - pointer to the last phoneme in the PHONE list.
 *
 *			p - pointer to the phoneme array.
 *
 *			p_len - length of the phoneme array.
 *
 * OUTPUT:		returns TRUE if the two match; otherwise, FALSE.
 */

int pcmp (fpp, lpp, p, p_len)
PHONE *fpp, *lpp;
char *p;
unsigned short p_len;
   {
   PHONE *pp;				/* PHONE list scanner */
   int i;				/* loop counter */

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
 * ROUTINE TITLE:	Analyze Stress - French Language Group
 *
 * HISTORY:		PRG	23-NOV-1988
 *			Created routine.
 *
 * PURPOSE:		To analyze the stress placement in a word which
 *			has been classified in the French language group
 *			and adjust according to rules specified in the 
 *			routine.
 *
 * INPUT:		fpp - pointer to the first phoneme in the word
 *				being analyzed.
 *
 *			lpp - pointer to the last phoneme in the word
 *				being analyzed.
 *
 *			pstype - the type of stress being placed.
 *
 * OUTPUT:		function done.		
 */

void stress_fr (fpp, lpp, pstype)
PHONE *fpp, *lpp;
short pstype;
   {
   fpp = NULL;
   lpp = NULL;

   /*
    * French stress is ultimate if there are only two syllables; otherwise,
    * the stress is initial.
    */

   if (nsyl == 2)
      psyl = nsyl;
   else
      psyl = 1;

   if (psyl < 1) psyl = 1;
   sylp[psyl-1]->p_stress = pstype;
   }

/*
 * ROUTINE TITLE:	Analyze Stress - Germanic Language Group
 *
 * HISTORY:		PRG	23-NOV-1988
 *			Created routine.
 *
 * PURPOSE:		To analyze the stress placement in a word which
 *			has been classified in the Germanic language group
 *			and adjust according to rules specified in the 
 *			routine.
 *
 * INPUT:		fpp - pointer to the first phoneme in the word
 *				being analyzed.
 *
 *			lpp - pointer to the last phoneme in the word
 *				being analyzed.
 *
 *			pstype - the type of stress being placed.
 *
 * OUTPUT:		function done.		
 */

void stress_ge (fpp, lpp, pstype)
PHONE *fpp, *lpp;
short pstype;
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

   if (pcmp (fpp, lpp, &excep_1[1], excep_1[0])
   ||  pcmp (fpp, lpp, &excep_2[1], excep_2[0])
   ||  pcmp (fpp, lpp, &excep_3[1], excep_3[0]))
      psyl = 1;
   else if (pcmp (fpp, lpp, &excep_4[1], excep_4[0]))
      psyl = 2;
   else
      psyl = 1;

   if (psyl < 1) psyl = 1;
   sylp[psyl-1]->p_stress = pstype;
   }

/*
 * ROUTINE TITLE:	Analyze Stress - Italian Language Group
 *
 * HISTORY:		PRG	23-NOV-1988
 *			Created routine.
 *
 * PURPOSE:		To analyze the stress placement in a word which
 *			has been classified in the Italian language group
 *			and adjust according to rules specified in the 
 *			routine.
 *
 * INPUT:		fpp - pointer to the first phoneme in the word
 *				being analyzed.
 *
 *			lpp - pointer to the last phoneme in the word
 *				being analyzed.
 *
 *			pstype - the type of stress being placed.
 *
 * OUTPUT:		function done.		
 */

void stress_it (fpp, lpp, pstype)
PHONE *fpp, *lpp;
short pstype;
   {
   char excep_1[3] = {2, IY, OW};
   char excep_2[3] = {2, IY, AX};

   fpp = NULL;

   /*
    * Italian is penultimate stress except when the word has a [i][o]
    * or [i][x] suffix, in which case antepenultimate stress is used.
    */

   if (pcmp (lpp->p_bp->p_bp, lpp, &excep_1[1], excep_1[0])
   ||  pcmp (lpp->p_bp->p_bp, lpp, &excep_2[1], excep_2[0]))
      psyl = nsyl - 2;
   else
      psyl = nsyl - 1;

   if (psyl < 1) psyl = 1;
   sylp[psyl-1]->p_stress = pstype;
   }

/*
 * ROUTINE TITLE:	Analyze Stress - Japanese Language Group
 *
 * HISTORY:		PRG	23-NOV-1988
 *			Created routine.
 *
 * PURPOSE:		To analyze the stress placement in a word which
 *			has been classified in the Japanese language group
 *			and adjust according to rules specified in the 
 *			routine.
 *
 * INPUT:		fpp - pointer to the first phoneme in the word
 *				being analyzed.
 *
 *			lpp - pointer to the last phoneme in the word
 *				being analyzed.
 *
 *			pstype - the type of stress being placed.
 *
 * OUTPUT:		function done.		
 */

void stress_ja (fpp, lpp, pstype)
PHONE *fpp, *lpp;
short pstype;
   {
   fpp = NULL;
   lpp = NULL;

   /*
    * Japanese is always penultimate stress.
    */

   psyl = nsyl - 1;
   if (psyl < 1) psyl = 1;
   sylp[psyl-1]->p_stress = pstype;
   }

/*
 * ROUTINE TITLE:	Analyze Stress - Slavic Language Group
 *
 * HISTORY:		PRG	23-NOV-1988
 *			Created routine.
 *
 * PURPOSE:		To analyze the stress placement in a word which
 *			has been classified in the Slavic language group
 *			and adjust according to rules specified in the 
 *			routine.
 *
 * INPUT:		fpp - pointer to the first phoneme in the word
 *				being analyzed.
 *
 *			lpp - pointer to the last phoneme in the word
 *				being analyzed.
 *
 *			pstype - the type of stress being placed.
 *
 * OUTPUT:		function done.		
 */

void stress_sl (fpp, lpp, pstype)
PHONE *fpp, *lpp;
short pstype;
   {
   PHONE *pp;				/* pointer to 3rd to last phoneme */
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
    * [v][I][C]		-VITCH, -VICH
    * [w][I][C]		-WITCH
    * [v][I][t][s]	-VITZ
    * [C][@][k]		-CZAK
    * [C][E][k]		-CZEK
    * [C][U][k]		-CZUK
    * [C][I][k]		-CYK
    * [c][f]		-OW
    * [w][I][t][s]	-WITZ
    * [i][@][k]		-IAC
    */

   pp = lpp->p_bp->p_bp->p_bp;
   if (pcmp (pp      , lpp, &excep_1[1], excep_1[0]))
      psyl = nsyl - 2;
   else if (pcmp (pp      , lpp, &excep_2[1], excep_2[0]))
      psyl = nsyl - 2;
   else if (pcmp (pp->p_bp, lpp, &excep_3[1], excep_3[0]))
      psyl = nsyl - 2;
   else if (pcmp (pp      , lpp, &excep_4[1], excep_4[0]))
      psyl = nsyl - 2;
   else if (pcmp (pp      , lpp, &excep_5[1], excep_5[0]))
      psyl = nsyl - 2;
   else if (pcmp (pp      , lpp, &excep_6[1], excep_6[0]))
      psyl = nsyl - 2;
   else if (pcmp (pp      , lpp, &excep_7[1], excep_7[0]))
      psyl = nsyl - 2;
   else if (pcmp (pp->p_fp, lpp, &excep_8[1], excep_8[0]))
      psyl = nsyl - 2;
   else if (pcmp (pp->p_bp, lpp, &excep_9[1], excep_9[0]))
      psyl = nsyl - 2;
   else if (pcmp (pp      , lpp, &excep_10[1], excep_10[0]))
      psyl = nsyl - 2;
   else
      psyl = nsyl - 1;

   if (psyl < 1) psyl = 1;
   sylp[psyl-1]->p_stress = pstype;
   }

/*
 * ROUTINE TITLE:	Analyze Stress - Spanish Language Group
 *
 * HISTORY:		PRG	23-NOV-1988
 *			Created routine.
 *
 * PURPOSE:		To analyze the stress placement in a word which
 *			has been classified in the Spanish language group
 *			and adjust according to rules specified in the 
 *			routine.
 *
 * INPUT:		fpp - pointer to the first phoneme in the word
 *				being analyzed.
 *
 *			lpp - pointer to the last phoneme in the word
 *				being analyzed.
 *
 *			pstype - the type of stress being placed.
 *
 * OUTPUT:		function done.		
 */

void stress_sp (fpp, lpp, pstype)
PHONE *fpp, *lpp;
short pstype;
   {
   PHONE *pp;				/* temporary pointer */
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
   if (pcmp (pp, lpp, &excep_1[1], excep_1[0])
   ||  pcmp (pp, lpp, &excep_2[1], excep_2[0])
   ||  pcmp (pp, lpp, &excep_3[1], excep_3[0])
   ||  pcmp (pp, lpp, &excep_4[1], excep_4[0]))
      psyl = nsyl;
   else if (nsyl == 2 && pcmp (pp->p_bp, lpp, &excep_5[1], excep_5[0]))
      psyl = nsyl;
   else if (pcmp (pp->p_bp, lpp, &excep_6[1], excep_6[0])
   ||       pcmp (pp->p_bp, lpp, &excep_7[1], excep_7[0]))
      psyl = nsyl - 2;
   else
      psyl = nsyl - 1;

   if (psyl < 1) psyl = 1;
   sylp[psyl-1]->p_stress = pstype;
   }
