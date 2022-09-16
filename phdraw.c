/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * Copyright	Aug 1, 1984			by Dennis H. Klatt
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
 *    File Name:	phdraw.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * Realize each 6.4 ms time frame as a set of 16 control parameters
 *  (plus the fundamental period T0, which is set by PHDRAWT0.C)
 *      1. Set target values for this time frame.
 *      2. Add diphthongization increment if apropriate
 *      3. Smooth tran at boundary with previous segment.
 *      4. Smooth tran at boundary with next segment.
 *      5. Execute exception rules: e.g. set init part of phone to const
 *
 * Ordering of control parameters in param[] structured array:
 *      F0,F1,F2,F3,FZ,B1,B2,B3,AV,AP,A2,A3,A4,A5,A6,AB,TILT
 * Note that this isn't cast in concrete anymore, because of the
 * "OUT_" stuff.
 *
 ***********************************************************************
 *    Revision History:
 * 0001  3-Aug-84 DK	Initial creation
 * 0002 12-Oct-84 DK	Add vowel-vowel coartic across conson
 * 0003 27-Dec-84 DGC	Modified for the 80186.
 * 0004 17-Jan-85 DK	Reverse tilt dependence on f0, initialize *outp
 * 0005 29-Jan-85 DK	Reduce AV during glottal stop
 * 0006 19-Feb-85 DK	Tilt calc now standard, move spdef Tilt offset to chip
 * 0007  6-May-85 DK	Add code to make breathy offset if breathysw == 1
 * 0008 28-May-85 DK	Make breathy offset code spdef via LX -> spdeflaxprcnt
 * 0009 12-Jul-85 DK	Clean up f0_dep_tlt code
 * 0010 16-Jul-85 DK	Use spdef offset here instead of SPC
 * 0011 24-Jul-85 DK	Rename chip stuff, make outpar structure into array
 * 0012 29-Jul-85 DK	Breathy voices have wider first formant bandwidth
 * 0013  3-MAR-96 EAB	Modified the way an adjust was added to compensate
 *						for tilt, the old METHOD SIMPLY WAS NOT DOING ENOUGH.
 * 0014 18-MAR-96 CJL	Removing volume/tilt change; causes English overs.
 *
 *
 */

#include   "phdefs.h"

/* This is defined to add the code to be used to perform a regession test. */
/* #define PH_REGRESSION_TEST */

/*    Input arrays (set by call to PHSETTAR.C whenever time for new phone)  */
extern PARAMETER param[];   /* Struc of input vars for each par */
extern short dipspec[30];   /* Contains dipthong specs	    */
extern short fvvtran,bvvtran,tvvbacktr,dfvvtran,dbvvtran; /* F2 V-V */
extern short breathysw;      /* Set to one if breathy offset     */
extern short spdefb1off;   /* Scale factor for B1 if breathy   */
extern short spdeflaxprcnt;   /* Set to 0 - 4096, percent breathy */
/*    For computation of TILT only					*/
extern short   spdeftltoff;   /* Tilt offset spdef constant	*/
extern short   f0_dep_tilt;   /* Sp def %-f0-effect		*/
extern short   f0;      /* Unscaled current f0		*/

/*    Output arrays: All parameter values stored here */
extern short parstochip[];    /* Array incl state and par[TILT] */

/*    Variables initialized elsewhere					     */
extern short tcum;   /* Time relative to phoneme begin, in frames */
extern short durfon;   /* Dur of current phone, in frames	     */
extern short avglstop;   /* Used to reduce AV during glstop	     */

#ifdef   vax
extern short printsw;   /* For Vax version, print options	     */
#endif

#ifdef PH_REGRESSION_TEST
int ii; /*for regression testing eab */
#endif

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*			D R A W P A R S					 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

phdraw()
{
   PARAMETER   *np;   /* Pointer to control values	*/
   short      *parp;   /* Pointer to output buffer	*/
   short      value;
//   register PARAMETER   *np;   /* Pointer to control values	*/
//   register short      *parp;   /* Pointer to output buffer	*/
//   register short      value;
#ifndef MINIMAL_SYNTH
   register short      del_av;
   static short drawinitsw;
#endif
   static short breathyah,breathytilt;   /* Used to make breathyness  */
   short temptilt;


   /* Loop across all parameters but T0. I changed this so that it	*/
   /* pulls the value of "parp" from the "outp" field of the struct.	*/
   /* This lets these loops be written nicely, but makes it possible	*/
   /* to reorder things in the output.				*/

#ifdef vax
   if (drawinitsw == 0)
   {
      drawinitsw = 1;
      param[F0].outp = &parstochip[OUT_T0];
      param[F1].outp = &parstochip[OUT_F1];
      param[F2].outp = &parstochip[OUT_F2];
      param[F3].outp = &parstochip[OUT_F3];
      param[FZ].outp = &parstochip[OUT_FZ];
      param[B1].outp = &parstochip[OUT_B1];
      param[B2].outp = &parstochip[OUT_B2];
      param[B3].outp = &parstochip[OUT_B3];
      param[AV].outp = &parstochip[OUT_AV];
      param[AP].outp = &parstochip[OUT_AP];
      param[A2].outp = &parstochip[OUT_A2];
      param[A3].outp = &parstochip[OUT_A3];
      param[A4].outp = &parstochip[OUT_A4];
      param[A5].outp = &parstochip[OUT_A5];
      param[A6].outp = &parstochip[OUT_A6];
      param[AB].outp = &parstochip[OUT_AB];
      param[TILT].outp = &parstochip[OUT_TLT];
   }
#endif				 

   for (np = &PF1; np <= &PB3; ++np)
   {
      parp = np->outp;         /* Where it goes.	*/

      /* If diphthongized seg, see if new straight line called for.	*/
      if (tcum > np->durlin)
      {
         np->durlin = *np->ndip;
         np->ndip+=1;
         np->deldip = *np->ndip;
         np->ndip+=1;
         np->tarcur += (np->dipcum DIV_BY8);
         np->dipcum = 0;
/*			printf("deldipindraw %d %d\n",np->deldip,np->ndip);*/
      }
      /* Set target value and smooth forward. The delta-dipth and the	*/
      /* delta-trans are *8 to avoid roundoff propogation.		*/
      np->dipcum += np->deldip;
      value = np->dipcum  +  np->ftran;

      /* Then shrink transition magnitude by appropriate increment.	*/
      if (np->ftran != 0)
         np->ftran -= np->dftran;

      /* Smooth backwards. Delta-transition is *8 to avoid roundoff	*/
      /* propogation. Transition magnitude is then changed by the	*/
      /* appropriate increment.					*/
      if (tcum >= np->tbacktr)
      {
         value += np->btran;
         np->btran += np->dbtran;
      }
      /* Vowel-vowel coartic across a consonant, for F2 only.		*/
      if (np == &PF2)
      {
         value += fvvtran;
         if (fvvtran != 0)
            fvvtran -= dfvvtran;
         if (tcum >= tvvbacktr)
         {
            value += bvvtran;
            bvvtran += dbvvtran;
         }
      }
      /* Store the computed paramter into the right spot in the block	*/
      /* of data about to be sent to the TMS320.			*/
      *parp = (value DIV_BY8)  +  np->tarcur;

      /* Special rules (I.e. BW windening for aspir)			*/
      if (np->tspesh > 0)
      {
         if (tcum < np->tspesh)
         {
            *parp = np->pspesh;
         }
      }
      /* Breathy voices have wider first formant bandwidth */
      else if (np == &PB1)
      {
         *parp = frac4mul(*parp,spdefb1off);
      }
   }
   /* End of loop for F[1,2,3], FZ, B[1,2,3].				*/
   /* Begin loop for amplitude parameters AV, AP, A[2,3,4,5,6], AB.	*/

   for (; np <= &PTILT; np+=1)
   {
      parp = np->outp;         /* Where it goes.	*/

      /* Smooth forward, use shift to avoid roundoff propogation.	*/
      value = np->tarcur + (np->ftran DIV_BY8);

      /* Then shrink transition magnitude by appropriate increment.	*/
      if (np->ftran != 0)
         np->ftran -= np->dftran;

      /* Smooth backward, using shift to avoid roundoff propogation.	 */
      /* Modify transition magnitude by the appropriate increment.	*/
      if (tcum >= np->tbacktr)
      {
         *parp = value + (np->btran DIV_BY8);
         np->btran += np->dbtran;
      }
      else
      {
         *parp = value;
      }
      /* Special rules (I.e. vot, aspir, and burst dur for plos).	*/
      if (np->tspesh > 0)
      {
         if (tcum < np->tspesh)
         {
            *parp = np->pspesh;
         }
         else
         {
            /* Double burst for /k,g,ch,jh/				*/
            if ((np > &PAP)
               && (tcum == (np->tspesh + 1))
               && (*parp >= 10))
            {
               *parp -= 10;
            }
         }
      }
   }
   /* * * * * * * * * * * * * * */
   /* Reduce AV if glstop:   */
   /* * * * * * * * * * * * * * */
   if (parstochip[OUT_AV] > 6)    parstochip[OUT_AV] -= avglstop;

   /* * * * * * * * * * * * * * */
   /* Source spectral tilt:  */
   /* * * * * * * * * * * * * * */

   /* The source spectrum becomes less smooth as F0 decreases if	*/
   /* F0 is less than 1400 Hz*10					*/
   /* E.g.:  F0    Tilt (Assumes FT = 100 for Paul)			*/
   /* 600       0						*/
   /* 800       0						*/
   /* 1000       2						*/
   /* 1200       8						*/
   /* 1400      12						*/
   /* 1600      12						*/
   /* (don't count glstop, i.e. do after this code)			*/

   parp = &parstochip[OUT_TLT];      /* Where it goes.	*/
   /* Spdef par FT -> 0 < f0_dep_tilt < 100, temptilt = 1/40 (max) of 1400-f0 */
   temptilt = frac4mul((1400 - f0),f0_dep_tilt);
   if (temptilt < 0)
      temptilt = 0;
   temptilt = 12 - temptilt;   /* Reverse sign of this effect */
   if (temptilt < 0)
      temptilt = 0;
   *parp += temptilt;

   *parp += (spdeftltoff - 6);   /* Add in spdef offset */

   /* Use -6 to allow higher tilts */
   /* Breathy offset special code */
   if (breathysw == 1)
   {         /* Set in phsettar.c */
      if (parstochip[OUT_AV] > 40)
      {   /* Do only if AV on  */
         /* Add aspiration to voicing */
         if (breathyah < 27)
         {
            breathyah += 2;      /* asp increase 32 db/100 ms */
         }
         value = frac4mul(spdeflaxprcnt,(breathyah+30));
         if (parstochip[OUT_AP] < value)
         {
            parstochip[OUT_AP] = value;
         }
         /* Tilt down voicing spectrum */
         if (breathytilt < 16)
         {
            breathytilt += 1;      /* tilt decrease 16 dB/100 ms */
         }
         *parp += frac4mul(spdeflaxprcnt,breathytilt);
      }
   }
   else
   {
      /* Zero or initialize all breathyness variables */
      breathyah = 0;
      breathytilt = 0;
   }
   /* Source tilt can't be more than 31 dB */
   if (*parp > 31)
   {
      *parp =31;
   }
   if (*parp < 0)
   {
      *parp = 0;
   }
   /* Compensate for loudness decrease when strongly tilted
		3/96 EAB Modified to do its job better*/
   /* 3/18/96 CJL Remove changes for release... overloading in English.*/
   if (parstochip[OUT_AV] > 3)
   {
      temptilt = (*parp>>2) - 4;
      if (temptilt < 0)    temptilt = 0;   /* tilt must be 20 or more */
      parstochip[OUT_AV] += temptilt;

   }
#ifdef PH_REGRESSION_TEST
   for (ii=16;ii>=0;ii--) /* EAB FOR REGRESSION TESTING */
   {
      WAIT_PRINT;
      printf("%d ",parstochip[ii]);
      SIGNAL_PRINT;
   }
   WAIT_PRINT;
   printf("\n");
   SIGNAL_PRINT;
#endif

}
