/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * Copyright	1984				by Dennis H. Klatt
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
 *    File Name:	phsettar.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Reset Targets and Transition Specification for next phone
 *		This routine is called by PHCLAUSE
 *    Order of control params in tables: (F0 preceeds these in param[])
 *		F1,F2,F3,FZ,B1,B2,B3,AV,AP,A2,A3,A4,A5,A6,AB,TILT
 *    This is really only the order in "param". The output order is
 *    independent of this. Look at the "OUT_" stuff in "phdefs.h".
 *
 ***********************************************************************
 *    Revision History:
 * 0001  3-Dec-84 DK	Initial creation
 * 0002 27-Dec-84 DGC	Modified for the 80186.
 * 0003 02-Jan-85 DGC	Use call to "mstofr" to prevent 16-bit overflow
 * 0004  9-Jan-85 DK	Change VOT rule
 * 0005 13-Feb-85 DK	Add rules changing vowel targets as f(context)
 *			 and extend rules to TILT parameter
 * 0006 28-Feb-85 DK	Increase coartic and reduce AV for unstressed
 * 0007 20-Mar-85 DK	BW widening for voiced next to -voiced by explicit rule
 * 0008 25-Mar-85 DK	Comment out rule to add voicebar for [b,d,g]
 * 0009  6-May-85 DK	Make ends of clauses/phrases breathy, esp. for females
 * 0010 17-May-85 DK	No breathy onset from sil ("raider" heard as "greater")
 * 0011 20-Jun-85 DK	Nasal before silence too stong
 * 0012 29-Jul-85 DK	Adjust tilt targets, make transitions smooth sometimes
 * 0013 24-Aug-85 DK	Reinstate voicebar for [b,d,g] followed by -voiced
 * 0014 06-MAR-96 EAB The stress amplitude for stessed unstressed syllables
 *						was only 1db the minimal perceptable level not enough
 *						to be functional for stressed vs unstressed to 3db
 * 0015	07/13/1996	EAB  Fixed typo with silence for single vowel phrases 
 *
 */


#include   "phdefs.h"

 #define DEBUG_TARGETS   0     /* Print Debug stuff.		*/

/*    INPUT arrays */
extern char allophons[];   /* Input phonetic array		*/
extern short allofeats[];   /* Struc features of inputphones */
extern short allodurs[];   /* Durations in frames of input */
extern short durfon;      /* Dur in frames of curr phone	*/
extern short nallotot;      /* Total number of input phones	*/
extern char nphone;      /* Pointer to cur phone in imput */
extern short malfem;      /* Def of current speaker sex   */

extern   const short   maleloc[];      /* Male tables*/
extern   short   femloc[];      /* Female tables.		*/


/*    OUTPUT arrays: */
extern PARAMETER param[];   /* Struc of tar,tran specs each par */
extern short parstochip[];   /* Values sent to chip in prev. frame */

/*    Variables for vowel-vowel coarticulation across a conson, F2 only */
extern short fvvtran,bvvtran,tvvbacktr,dfvvtran,dbvvtran;
extern short dipspec[];   /* Dipthong targets will be put here */
extern short phcur;   /* Make variable available to PHDRAW.C for */
/* computing TILT (SHIFT THIS CALC HERE) */

/*    From PHROM.C: */
extern short featb[],place[];
extern char begtyp[];
extern char endtyp[];
extern unsigned char inhdr[];   /* Used with durfon to shrink tran durs */
extern unsigned char burdr[];   /* List of burst durs in msec for plosives */
extern short ptram[];   /* Pointer into array parallel amps for frics */
extern short plocu[];   /* Pointer into above table */
extern short *p_locus;   /* Usually pointing to maleloc[]: (locus  */
/*  freq, percent, and tran dur table)	   */
extern short *p_diph;   /* Usually pointing to maldip[]:	   */
/*  (diphthonization info for segments)	   */
extern short *p_tar;   /* Usually pointing to maltar[]: (arrays  */
extern short maltar[];
extern short femtar[];
extern short maldip[];
extern short femdip[];
extern short malamp[];
extern short femamp[];
/*  of phoneme target values)		   */
extern short *p_amp;   /* Usually pointing to malamp[]: (array   */
/*  of parallel amp targets for frics)	   */
extern short parini[];   /* Initial or default values for pars */
extern char  partyp[];   /* Type of table to use to get tar val */
extern short divtab[];   /* Use multiply for divide-by-small-# */
/*    End of arrays in PHROM.C */

extern short arg1,arg2,arg3;   /* Arguments for muldv, mlsh1 */

extern short printsw;      /* Debugging printout only */
extern char *parname[];      /* Debugging printout only */

extern short breathysw;      /* Add asp & tilt down spect if == 1 */
/* Protype to work around a MSVC preprocessor problem */                                
short special_coartic(short nfon,short diphpos);
                             
/*    Temporary boundary value and duration of transition */
static short bouval=0,vvbouval=0;
static short durtran=0,vvdurtran=0;

/*    Variables based on ratio of durfon to inhdr[], used for -OBST only */
static short inhdr_frames=0;
static short shrink=0;   /* Shrink or lengthen diph trans nonlinearly */
static short shrif=0;   /* Shrink forward transitions in -OBST	*/
static short shrib=0;   /* Shrink backward transitions in -OBST	*/

static short pholm2=0,pholas=0,phonex=0;
#ifndef MINIMAL_SYNTH
static short phonp2=0;
#endif
static short fealas=0,feacur=0,feanex=0,struclm2=0,struclas=0,struccur=0,strucnex=0;
static short bdur=0,vot=0,dipsw=0,gencoartic=0;
static short oldvalue=0,newvalue=0,oldtime=0,newtime=0,initsw=0;
                     
/* commented out as unused var - 8/9/95  JDB                     
static short ptemp;                     
*/

static PARAMETER   *np;   /* points to current parameter	  */
static short        *ndips;   /* pointer in dipspec[]		  */
static char      par_type;   /* Identifies type of current par */
static short   closure_dur,nasvowel;
static short temp6;

phsettar()
{
   /* Initialize program at beginning of each clause */

   init_variables();

   /* Turn off breathyness switch at end of a phrase */
   if ((phcur == SIL) || ((struccur & FHAT_BEGINS) IS_PLUS))
   {
      breathysw = 0;
   }
   /* Turn on breathyness switch during last syllable of clause */
   /* (generally restricted to female voices via spdef LX) */
   if ((struccur & FSENTENDS) IS_PLUS)
   {
      breathysw = 1;
   }
   /* Main loop: For each parameter, set target and transition specs	*/

   for (np = &PF1; np <= &PTILT; np+=1)
   {
      par_type = partyp[np-&PF1];      /* formfreq, ampl, etc. */

      /* 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 */
      /* Set target value associated with end time of last phone	 */
      /* 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 */

      np->tarlas = np->tarend;

      /* 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 */
      /* Set target value associated with onset of next phone		 */
      /* and compute any shift due to coartic with adjacent phones	 */
      /* 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 */
      np->tarnex = getbegtar(nphone+1);      /* Calls gettar() */

      /* 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 */
      /* Set target value(s) associated with current phone		 */
      /* tarcur is target at phone beginning				 */
      /* tarend is target at phone ending				 */
      /* if diphthongized, also set sequence of time,value commands &	 */
      /* add special coartic such as change in [ih] due to postvoc [l] */
      /* 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 */

      np->tarcur = gettar(nphone); /* Target or -pointer to target     */
      np->dipcum = 0;       /* Diph time since phone begin      */
      if (np->tarcur < -1)
      {    /* -pointer: diphthongized vowel    */
         make_dip(-np->tarcur);   /* Cur seg diphthongized, generate  */
         /* several straight lines (this    */
      }
      /* routine also sets np->tarend)   */
      else
      {
         np->deldip = 0;      /* Set dipthong increment to zero    */
         np->durlin = durfon;   /* and dipth dur to phone duration   */

         /* 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 */
         /* General coartic rule for curr sonor cons: prev. & next phones      */
         /* modify formant freqs: 5% tarlas, 5% tarnex, 90% tarcur	     */
         /* (only effective for -diph -obst because of p_ locus[] tables)	     */
         /* 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 */
         if (par_type IS_FORM_FREQ)
         {

            gencoartic = N10PRCNT;
            if ((struccur & FSTRESS) IS_MINUS)
            {
               /* Increased coarticulation, especially F2, if unstressed */
               gencoartic = N15PRCNT;
               if (np == &PF2)
               {
                  gencoartic = N25PRCNT;
               }
            }
            arg1 = ((np->tarlas + np->tarnex) >> 1) - np->tarcur;
            arg2 = gencoartic;
            np->tarcur += mlsh1();
         }
         np->tarend = np->tarcur;   /* Tar at end of cur phone */

      }
      /* 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 */
      /* Compute (approx.) general coartic of tarnex with tarend	 */
      /* THIS IS BAD, FIX IT IF POSSIBLE				 */
      /* 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 */
      if (par_type IS_FORM_FREQ)
      {
         arg1 = np->tarend - np->tarnex;
         arg2 = N10PRCNT;
         np->tarnex += mlsh1();
      }
      debug1();      /* Print stuff if DEBUG_TARGETS == TRUE */

      /* 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 */
      /* Smooth forward from beginning of current phone		   */
      /* Default bouval is halfway, half of transition duration is 30 ms */
      /* 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 */

      bouval = (np->tarlas + np->tarcur) >> 1;
      durtran = NF30MS;

      forw_smooth_rules();   /* This routine contains all the "smarts" */


      /* Convert bouval and durtran into params used directly by phdraw() */
      np->ftran = 0;
      if (durtran > 0)
      {

         /* Incremental change per frame				*/
         /* (shift left 3 bits to avoid roundoff accumulation)	*/
         np->ftran = (bouval - np->tarcur) << 3;
         if (np->ftran != 0)
         {
            arg1 = np->ftran;
            arg2 = divtab[durtran];
            np->dftran = mlsh1();
            np->ftran = np->dftran * durtran;
         }
      }
//      debugforward(" Unknown rule must have been executed",np);

      /* Slowish vowel-vowel formant motions across consonant modeled by   */
      /* a separate transition increment and duration, so far only for F2 */
      /* (vvbouval and vvdurtran set in routine forw_smooth_rules() which */
      /* calls setloc() which calls vv_coartic_across_c())		    */
      if (np == &PF2)
      {
         fvvtran = 0;
         dfvvtran = 0;
         /* Truncate tran dur if exceeds duration of current phone */
         if (vvdurtran > durfon)    vvdurtran = durfon;
         if ((vvdurtran > 0) && (vvbouval != 0))
         {
            /* Shift left 3 bits to avoid roundoff accumulation */
            arg1 = vvbouval << 3;
            arg2 = divtab[vvdurtran];
            dfvvtran = mlsh1();      /* vvbouval*8 / vvdurtran */
            fvvtran = dfvvtran * vvdurtran;
         }
         vvdurtran = 0;
         vvbouval = 0;
      }
      /* 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 */
      /* Smooth backward from end of current phone			   */
      /* Default bouval is halfway, half of transition duration is 30 ms */
      /* 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 */

      bouval = (np->tarend + np->tarnex) >> 1;
      durtran = NF25MS;

      back_smooth_rules();   /* This routine contains all the "smarts" */

      /* Convert bouval and durtran into params used directly by phdraw() */
      np->btran = 0;
      np->dbtran = 0;
      if (durtran > 0)
      {
         /* Shift left 3 bits to avoid roundoff accumulation */
         temp6 = (bouval - np->tarend) << 3;
         if (temp6 != 0)
         {
            arg1 = temp6;
            arg2 = divtab[durtran];
            np->dbtran = mlsh1();
         }
      }
      //debugbackward(" Unknown rule must have been executed",np);

      /* Slowish vowel-vowel formant motions across consonant modeled by   */
      /* a separate transition increment and duration, so far only for F2 */
      /* (vvbouval and vvdurtran set in routine back_smooth_rules() which */
      /* calls setloc() which calls vv_coartic_across_c())		    */
      if (np == &PF2)
      {
         bvvtran = 0;      /* Default if no vv-coartic */
         dbvvtran = 0;      /* Default if no vv-coartic */
         tvvbacktr = durfon;   /* Default if no vv-coartic */
         /* Truncate tran dur if exceeds duration of current phone */
         if (vvdurtran > durfon)    vvdurtran = durfon;
         if ((vvdurtran > 0) && (vvbouval != 0))
         {
            tvvbacktr = durfon - vvdurtran;
            /* Shift left 3 bits to avoid roundoff accumulation */
            arg1 = vvbouval << 3;
            arg2 = divtab[vvdurtran];
            dbvvtran = mlsh1();      /* vvbouval*8 / vvdurtran */
         }
         vvdurtran = 0;
         vvbouval = 0;
      }
   }
   /* 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 */
   /* Special rules that override values computed in regular way.	   */
   /* From the beginning of the current phone to a time "tspesh",	   */
   /* place the constant value "pspesh" in the given parameter track.	   */
   /* (Used to generate bursts, aspiration for [ptk], voicebar for [bdg]) */
   /* 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 */

   special_rules();
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	A.		   G E T B E G T A R				 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Get target value at beginning of phone, compute all coarticulatory */
/*  influences of adjacent phones				      */

short getbegtar(short nfone)
{
   short temp,temp1;

   temp = gettar(nfone);
   if (temp < -1)
   {         /* If next seg diphthong, */
#ifdef NO_FEMALE
      temp = maldip[-temp];      /* use diph first value  */
#else

	 if (malfem == MALE)
		temp = maldip[-temp];
	else	   
		temp = femdip[-temp];
#endif

      /* Special coarticulation rules to change (vowel) target */
      if (par_type IS_FORM_FREQ)
      {
         temp1 = special_coartic(nfone,0);
         temp += temp1;
      }
   }
   return(temp);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	B.		   G E T E N D T A R				 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Get target value at end of phone, compute all coarticulatory */
/*  influences of adjacent phones				*/

short getendtar(short nfone) 
{
   short temp,temp1;

   temp = gettar(nfone);
   if (temp < -1)
   {
      temp = -temp;       /* Vowel tar is diphth */
#ifdef NO_FEMALE
      while (maldip[temp] != -1)
#else
	if (malfem == MALE)
      while (maldip[temp] != -1)
      {
         temp++;
      }

	else	   
      while (femdip[temp] != -1)
      {
         temp++;
      }
#endif



#ifdef NO_FEMALE
      temp = maldip[temp-1];    /* Last val of diph */
#else
    if (malfem == MALE)
      temp = maldip[temp-1];  /* Last val of diph */
	else
      temp = femdip[temp-1];  /* Last val of diph */


#endif
      /* Special coarticulation rules to change (vowel) target */
      if (par_type IS_FORM_FREQ)
      {
         temp1 = special_coartic(nfone,1);
         temp += temp1;
      }
   }
   return(temp);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	C.			G E T T A R				 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Get target value (or a pointer to first value of diphthong specification */
/* (do not compute any coarticulatory influences of adjacent phones)	    */

short gettar(short nphone_temp)
{
   short phone_temp,phlas_temp,phnex_temp,tartemp,pphotr,begtypnex,npar;

   npar = np - &PF1;
   if (np < &PFZ)    pphotr = (npar) * TOT_ALLOPHONES;
   else          pphotr = (npar-1) * TOT_ALLOPHONES;
   /* No table entries for PAP parameter */

   phlas_temp = get_phone(nphone_temp-1);
   phone_temp = get_phone(nphone_temp);
   phnex_temp = get_phone(nphone_temp+1);
   /* GETTAR:  F1, F2, F3, B1, B2, B3 */

/////////////////////
if ((par_type=partyp[npar]) IS_FORM_FREQ_OR_BW)
{

if (malfem == MALE)
{
    
	  if ((tartemp = maltar[phone_temp + pphotr]) < -1)
      {
		//printf("tartem1 %d of %d \n",*tartemp,phone_temp);
         return(tartemp);   /* Pointer to diph info in p_diph[] */
      }

      else if (tartemp == -1)
      {

         /* Tar undefined, use tarval of next segment */

         if ((tartemp = maltar[phnex_temp + pphotr]) == -1)
         {

            /* Tar still undefined, use tarval of second-next segment */
            if ((tartemp=maltar[get_phone(nphone_temp+2)+pphotr])==-1)
            {

               /* Tar still undefined, use previous phone */
               if ((tartemp = maltar[phlas_temp + pphotr]) < -1)
               {
				
                  /* Diphthonized seg, use last target value */
                  while (maldip[-tartemp] != -1)
                  {
                     tartemp--;
                  }
                  tartemp = maldip[-tartemp-1];


				  /* If this doesn't work, use default value */
				  if (tartemp == -1)
				  {
				  tartemp = parini[npar];
				  }

			   }
			}
		 } 
	  }
	
}else /*malfem == FEMALE*/

{   
	  if ((tartemp = femtar[phone_temp + pphotr]) < -1)
      {
		//printf("tartem1 %d of %d \n",*tartemp,phone_temp);
         return(tartemp);   /* Pointer to diph info in p_diph[] */
      }

      else if (tartemp == -1)
      {

         /* Tar undefined, use tarval of next segment */

         if ((tartemp = femtar[phnex_temp + pphotr]) == -1)
         {

            /* Tar still undefined, use tarval of second-next segment */
            if ((tartemp=femtar[get_phone(nphone_temp+2)+pphotr])==-1)
            {

               /* Tar still undefined, use previous phone */
               if ((tartemp = femtar[phlas_temp + pphotr]) < -1)
               {
				
                  /* Diphthonized seg, use last target value */
                  while (femdip[-tartemp] != -1)
                  {
                     tartemp--;
                  }
                  tartemp = femdip[-tartemp-1];


				  /* If this doesn't work, use default value */
				  if (tartemp == -1)
				  {
				  tartemp = parini[npar];
				  }

			   }
			}
		 } 
	  }


} /*malfem == FEMALE*/




      if (tartemp < -1)
      {
		if (malfem == MALE)
         tartemp = maldip[-tartemp];
		else
         tartemp = femdip[-tartemp];		
      }
      /* Fricatives have higher F1 if preceeded by a vowel */
      if ( (npar == F1-1)
         && ((featb[phone_temp] & FOBST) IS_PLUS)
         && ((featb[phone_temp] & FSTOP) IS_MINUS)
         && ((featb[phlas_temp] & FSYLL) IS_PLUS) )
      {
         tartemp += 40;
      }
      /* Special rule for B2 of /n/ before non-front vowels */
      if (((phone_temp == N) || (phone_temp == EN))
         && (npar == B2-1))
      {
         if (begtyp[phnex_temp] != 1)
         {
            tartemp += 60;
         }
      }
      /* Special rule for B3 of /n/ adjacent to high-front vowels */
      if (((phone_temp == N) || (phone_temp == EN) || (phone_temp == NX))
         && (npar == B3-1))
      {
         if (((place[phnex_temp] & F2BACKI) IS_PLUS)
            || ((place[phlas_temp] & F2BACKF) IS_PLUS))
         {
            tartemp = 1600;
         }
      }
   }
		/*eab do nasals differently by nasalizing vowel before
		it and then reduce dur on n not vowel in rule 22 context.
		The code actually nasalizes anything in front of it */
   /* GETTAR:  FZ */
   else if (par_type IS_NASAL_ZERO_FREQ)
   {
      tartemp = 290;   /* Default for non-nasalized, cancel FP=280 */
      if ((featb[phone_temp] & FNASAL) IS_PLUS )
      {
         tartemp = 400;   /* Value dur nasal murmur (527=max) */
      }
	nasvowel=0;
/*	if ((phonex == N  || phonex == M) && (phone_temp != R ))
		{
			tartemp = 300;
			nasvowel=1;
		}	 */
   }
   /* GETTAR:  AV, AP */
   else if (par_type IS_AV_OR_AH)
   {
      /* Rules for voicing amplitude */
      if (npar == AV-1)
      {
		  /* Ellen we breakpoint on this if and it is getting the proper
		  values with the different syntax, the wrong values with the original*/
   
	if (malfem == MALE)
	{
		 tartemp = maltar[phone_temp + pphotr];
		 if(tartemp != maltar[phone_temp + pphotr])
			tartemp = maltar[phone_temp + pphotr];
	}
	else
	{
		 tartemp = femtar[phone_temp + pphotr];
		 if(tartemp != femtar[phone_temp + pphotr])
			tartemp = femtar[phone_temp + pphotr];
	}
         /* Dummy vowel has less intensity */
         if ((allofeats[nphone_temp] & FDUMMY_VOWEL) IS_PLUS)
         {
            tartemp -= 7;
         }
         /* Voiced stop devoiced if preceding seg voiceless */
         if ( ((featb[phone_temp] & FPLOSV) IS_PLUS)
            && ((featb[phlas_temp] & FVOICD) IS_MINUS) )
         {
            tartemp = 0;
         }
         /* Voice [h] if unstressed and preceeded by voiced seg */
         if ( (phone_temp == HX)
            && ((featb[phlas_temp] & FVOICD) IS_PLUS)
            && ((allofeats[nphone_temp] & FSTRESS_1) IS_MINUS) )
         {
            tartemp = 54;
         }
      }
      /* Rules for aspiration amplitude */
      else
      {
         if (phone_temp == HX)
         {
            tartemp = 53;
            if (begtyp[phnex_temp] != 1)
            {
               tartemp = 60;      /* Stronger asp before +back */
            }
         }
         else
         {
            tartemp = 0;
         }
      }
      /* Reduce amplitudes if unstressed
			eab 2/96 This only handles stressted unstress and doesn't
			accomadate other stress levels today*/
      if ((allofeats[nphone_temp] & FSTRESS) IS_MINUS)
      {
         tartemp -= 4;
         if (tartemp < 0) tartemp = 0;
      }
   }
   /* GETTAR:  A2, A3, A4, A5, A6, AB */
   else if (par_type IS_PARALLEL_FORM_AMP)
   {
      /* If ptram >0, it is a pointer in obstruent array taram */
      if ((np != &PTILT) && ((tartemp = ptram[phone_temp]) > 0))
      {
         begtypnex = begtyp[phnex_temp] - 1;
         if (phnex_temp == SIL)    begtypnex = endtyp[phlas_temp] - 1;
         if (begtypnex == 4)       begtypnex = 2;

         tartemp += (npar - A2 + 1 + (6 * begtypnex));
   
		 if (malfem == MALE)
         tartemp = malamp[tartemp];
		 else
         tartemp = femamp[tartemp];
			 
		/* Burst has less intensity if dummy vowel next */
         if ((allofeats[nphone_temp+1] & FDUMMY_VOWEL) IS_PLUS)
         {
            if (tartemp >= 4)
            {
               tartemp -= 4;
            }
         }
      }
      /* GETTAR:  TLT */

      /* Source spectral tilt: highly tilted for obstruents */
      /* (Voiced obstruents are special case, set F1=0 to signal voicebar) */
      if (np == &PTILT)
      {
         tartemp = 0;
         if (phone_temp == SIL)
         {
            tartemp = 0;
         }
		/*eab hx energy too high at high frequency try controling with tilt*/
			if (phone_temp == HX)
         	{
            	tartemp = 20;
         	}

         else if ((allofeats[nphone_temp] & FDUMMY_VOWEL) IS_PLUS)
         {
            tartemp = 20;
         }
         else if ((featb[phone_temp] & FOBST) IS_PLUS)
         {
            tartemp = 7;
            if ( ((featb[phone_temp] & FVOICD) IS_PLUS)
               && (((featb[phone_temp] & FPLOSV) IS_PLUS)
               || (phcur == JH)) )
            {
               tartemp = 40;   /* Max tilt for [b,d,g] */
            }
         }
         else if ((featb[phone_temp] & FNASAL) IS_PLUS)
         {
            tartemp = 6;   /* Tilt down nasal murmurs */
			}

         /* Female front vowels should be tilted down slightly */
         else if ((begtyp[phone_temp] == 1) || (endtyp[phone_temp] == 1))
				{
				if(malfem == FEMALE)
					{
            	tartemp += 6;
					}
				else
					{
            	tartemp += 3;
					}
				}
			
      }
   }
   return(tartemp);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	D.			M A K E - D I P				 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void make_dip(short pdip)
//short pdip;   /* Pointer to diphthongization info */
{
   short temp,dip_pos;
   short checkdip;

   np->ndip = ndips;   /* Start of diph info for this par in dipspec[] */
		
	if (malfem == MALE)
		oldvalue = maldip[pdip];    /*cccc Initial value of first straight line */
	else
		oldvalue = femdip[pdip];    /*cccc Initial value of first straight line */
		

   /* Formant frequency coarticulation rules */
   if (par_type IS_FORM_FREQ)
   {
      /* General rule: prev. phone changes init. vowel tar toward phlas */
      gencoartic = N10PRCNT;
      if ((struccur & FSTRESS) IS_MINUS)
      {
         /* Increased coarticulation, especially F2, if unstressed */
         /* OUT		gencoartic = N15PRCNT;
          if (np == &PF2) {
          gencoartic = N25PRCNT;
          }
          END OUT */
      }
      arg1 = np->tarlas - oldvalue;
      arg2 = gencoartic;
      oldvalue += mlsh1();
      /* Special rule: (see subroutine) */
      dip_pos = 0;
      oldvalue += special_coartic(nphone,dip_pos);
#if DEBUG_TARGETS
      printf(" tarbeg=%4d  (from 10%% tarlas=%4d, 90%% tarbeg=%d)\n",oldvalue, np->tarlas,
	if (malfem == MALE)	  
	  maldip[pdip]);
	else
	  femdip[pdip]);
#endif


   }
   np->tarcur = oldvalue;

   /* Current value of time */
   oldtime = 0;

   /* Process each <value,time> of diph definition */
   dipsw = 0;
   do
   {
      if (dipsw == 0)
      {
         newvalue = oldvalue;
         dipsw++;
         pdip++;
      }
      else
      {
	if (malfem == MALE)	  
         newvalue = maldip[pdip++];
	else
         newvalue = femdip[pdip++];


         /* Formant frequency coarticulation rules */
         if (par_type IS_FORM_FREQ)
         {
            /* General rule: next phone changes vowel tar toward phnex */
            if (np->tarnex > 0)
            {
               arg1 = np->tarnex - newvalue;
               arg2 = gencoartic;
               newvalue += mlsh1();
            }
            /* Special rule: (see subroutine) */
            newvalue += special_coartic(nphone,++dip_pos);

#if DEBUG_TARGETS
            printf(
            "%d diph tarend=%4d   (from 10%% tarnex=%4d, 90%% tarend=%d)\n",
            (np-&PF1), newvalue, np->tarnex, p_diph[pdip-1]);
#endif
         }
      }

if (NSAMP_FRAME == 128)
	if (malfem == MALE)	  
      newtime = maldip[pdip]>>1;/*eab ccc for 1/2 samp*/
	else
	  newtime = femdip[pdip]>>1;/*eab ccc for 1/2 samp*/

else
	if (malfem == MALE)	  
      newtime = maldip[pdip];
	else
	  newtime = femdip[pdip];

      if (newtime != -1)
      {
         /* Adjust newtime as f(shrink), i.e. make tran dur semi-invariant */
         newtime = shrdur(newtime);
      }
      else
      {
         /* Desired time is end of segment */
         newtime = durfon;
      }
      *ndips = newtime;
      ndips+=1;

      /* Compute increment/frame during transition */
      temp = newtime - oldtime;
      if (temp == 0)
      {
         *ndips = 0;
      }
      else
      {
         /* No divide if possible (for speed) */
         arg2 = (newvalue - oldvalue) << 3;
         if (temp < 50)
         {
            arg1 = divtab[temp];
            *ndips = mlsh1();
         }
         else
         {
            *ndips = arg2 / temp;
         }
         oldvalue = newvalue;
         oldtime = newtime;
      }
      ndips+=1;


	if (malfem == MALE)	  
         checkdip = maldip[pdip++];
	else
         checkdip = femdip[pdip++];

   } while ( checkdip != -1);

//////   if (malfem == MALE)	  
 
   /* Set final value of diph tran, first increment and duration in frames */
   np->tarend = newvalue;      /* Code more transparent: use getendtar() */
   np->durlin = *np->ndip;
   np->ndip+=1;
   np->deldip = *np->ndip;
   np->ndip+=1;
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	E.		S P E C I A L - C O A R T I C			 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

short special_coartic(short nfon,short diphpos)
/*short nfon,diphpos;*/
{
   /* Note: Gen coartic of 5% with adjacent segs elsewhere, so stuff here is big */
   /* This routine is only called if the current segment is diph (i.e. a vowel) */

   short temp,fonnex,foncur,fonlas;

   temp = 0;
   foncur = get_phone(nfon);
   fonnex = get_phone(nfon+1);
   fonlas = get_phone(nfon-1);

   /* F3 target of selected vowels */
   if (np == &PF3)
   {
      if (((featb[foncur] & FVOWEL) IS_PLUS) && (foncur != RR))
      {
         if (((fonlas == W) || (fonlas == R) || (fonlas == RX))
            || ((fonnex == W) || (fonnex == R) || (fonnex == RX)))
         {
            temp = -150;
         }
      }
   }
   /* F2 target of selected vowels */
   if (np == &PF2)
   {
      /* Front vowel F2 target lowered before [LX] */
      if (fonnex == LX)
      {
         if ( ((foncur >= IY) && (foncur <= AE)) || (foncur == IX) )
         {
            temp = -150;
         }
         if (((foncur == AY) || (foncur == OY))
            && (diphpos == 1))
         {
            temp = -250;
				}
			if (((foncur == AY) || (foncur == OY))
            && (diphpos > 1))
         {
            temp = -350;

         }
      }
      /* Front vowel F2 target lowered after [W], [L] (DO ALSO FOR F3 of [W] */
      if ((fonlas == W) || (fonlas == LL) || (fonlas == LX))
      {
         if ( ((foncur >= IY) && (foncur <= AE)) || (foncur == IX) )
         {
            temp = -150;   /* las and nex effects not cumulative */
         }
      }
      /* [UW] F2 target raised adjacent to an alveolar */
      if (foncur == UW)
      {
         if ((place[fonlas] & FALVEL) IS_PLUS)
         {
            temp = 200;
         }
      }
      if ((foncur == UW)
         || ((foncur == YU) && (diphpos > 0)))
      {
         if ((place[fonnex] & FALVEL) IS_PLUS)
         {
            temp += 200;
         }
      }
      /* Effects are greater for unstressed vowels */
      if ((allofeats[nfon] & FSTRESS) IS_MINUS)
      {
         temp += (temp>>1);

         /* Unstressed YU has a fronted U part */
         if ((foncur == YU) && (diphpos > 0))
         {
            temp = 400;
         }
      }
      /* Reduce effects for phrase-final stressed vowels */
      else if ((allofeats[nfon] & FBOUNDARY) >= FVPNEXT)
      {
         temp = temp>>1;
      }
      /* Maximum change should not be excessive */
      if (temp > 400)    temp = 400;
      if (temp < -400)   temp = -400;
   }


   return(temp);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	F.			S E T L O C				 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/*    Set formant freq bouval and durtran between obstruent and sonorant */

#define FRONT_VOWEL      1
#define BACK_UNROUNDED_VOWEL   2
#define BACK_ROUNDED_VOWEL   3
#define OBSTRUENT      4
#define ROUNDED_SONOR_CONS   5

short setloc(short nfonobst, short nfonsonor, char initfinso, short nfonvowel)
//short nfonobst;      /* Segment thought to be an obstruent	*/
//short nfonsonor;   /* Segment thought to be a sonorant	*/
//char initfinso;      /* Set to 'i' if use init part of sonor */
//short nfonvowel;   /* Segment (vowel?) on other side of obst */


{
   /* Automatic variables */
   short fonobst,fonsonor,fonvowel,typob,typso,f2backaffil,curvl,tarvowel;
   short sontyx,ploc,locus,prcnt,delta_freq;

   /* Convert phoneme pointers into phoneme names */
   fonobst = get_phone(nfonobst);
   fonsonor = get_phone(nfonsonor);
   fonvowel = get_phone(nfonvowel);
   /* Use values at beginning of the sonorant */
   if (initfinso == 'i')
   {
      typob = endtyp[fonobst];
      typso = begtyp[fonsonor];
   }
   else
   {            /* Or at the end of the sonorant */
      typob = begtyp[fonobst];
      typso = endtyp[fonsonor];
   }
/*	printf("typob = %d ",typob);*/

   if ( (np > &PF3) || (typob != OBSTRUENT) || (typso == OBSTRUENT) )
   {
      return(0);      /* Not obstruent-sonorant tran, as assumed */
   }
   if (initfinso == 'i')
   {
      f2backaffil = place[fonsonor] & F2BACKI;
      curvl = getbegtar(nfonsonor);
   }
   else
   {            /* Or at the end of the sonorant */
      f2backaffil = place[fonsonor] & F2BACKF;
      curvl = getendtar(nfonsonor);
   }
   sontyx = typso;
   if (typso == ROUNDED_SONOR_CONS)  /* If sonorant is rounded conson, */
      sontyx = BACK_ROUNDED_VOWEL;  /* use C locus for rounded vowel */

   /* Pointer into locus data comes from one of 3 tables for front, back, */
   /* and rounded vowels, sontyx now equals 1,2, or 3 */
   ploc = plocu[(fonobst + (SIZTARTAB * (sontyx - 1)))];
/*printf("fon= %d ploc = %d sonytx= %d index %d\n",fonobst, ploc,sontyx,(fonobst + (SIZTARTAB * (sontyx - 1)))-1);*/
   if (ploc == 0)           /* Pointer to locus, zero means */
      return(0);           /* no locus, use default calc  */
   ploc = ploc + (3 * (np - &PF1));  /* Table has 3 entries/formant  */
 
   if (malfem==MALE)
   {
	locus = maleloc[ploc];        /* First entry is locus freq   */
     prcnt = maleloc[ ploc + 1];     /* Second entry is % toward V	 */
    durtran = mstofr(maleloc[ploc+2]);/* 3rd is tran dur in msec	 */
   }
   else
   {
	locus = femloc[ploc];        /* First entry is locus freq   */
     prcnt = femloc[ ploc + 1];     /* Second entry is % toward V	 */
    durtran = mstofr(femloc[ploc+2]);/* 3rd is tran dur in msec	 */
   }
 

/*printf("locus %d prcnt %d \n",locus,prcnt);*/
   /* Reduce F2 and F3 transition in a sonor conson adj to nonpalatal obst */
   if ( (typso == ROUNDED_SONOR_CONS) && (np > &PF1)
      && ((place[fonobst] & (FPALATL | FDENTAL)) IS_MINUS))
   {
      prcnt = (prcnt >> 1) + 50;
   }
   /* Ditto for vowel/sonor with F2 assoc with back cavity, e.g. [iy] */
   if ((f2backaffil IS_PLUS) && (np == &PF2))
   {
      prcnt += (25 - (prcnt >> 2));  /* Reduce trans extent by 1/4 */
      durtran = (durtran>>1) + 2;      /* And shorten tran dur */
   }
   /* Let bouval = locus + ((prcnt * (curvl-locus)) / 100); */
   /* Old approximation (no divides):			    */
   /* delta_freq = (prcnt * (curvl-locus)) >> 7;	    */
   /* bouval = locus + delta_freq + (delta_freq >> 2);    */
   /* End of old approximation				    */
   arg1 = prcnt;
   arg2 = curvl - locus;
   arg3 = 100;
   delta_freq = muldv();
   bouval = locus + delta_freq;

#if   DEBUG_TARGETS
	printf("locus %d delta_freq %d \n",locus,delta_freq);
	printf("bouval %d \n",bouval);
#endif
   /* V-V coarticulation across an obst consonant: */
   if ( ((featb[fonsonor] & FVOWEL) IS_PLUS)
      && ((featb[fonvowel] & FVOWEL) IS_PLUS)
      && (np == &PF2) )
   {
      /* Find target values for both vowels */
      if (initfinso == 'i')
      {
         tarvowel = getendtar(nfonvowel);
      }
      else
      {
         tarvowel = getbegtar(nfonvowel);
      }
      /* Set vvbouval, the offset to boundary value due to the remote vowel */
      vv_coartic_across_c(fonvowel,tarvowel,fonsonor,curvl,
      fonobst,allodurs[nfonobst]);
      /* Now recompute boundary value taking into account this offset */
      curvl += vvbouval;
      arg1 = prcnt;
      arg2 = curvl - locus;
      arg3 = 100;
      delta_freq = muldv();
      bouval = locus + delta_freq;
      bouval -= vvbouval;      /* vvbouval will be added in phdraw */
   }

#if DEBUG_TARGETS
   printf("\t\t\t      (vtar = %4d  locus[%d] = %4d Hz  prcnt = %3d)\n",
   curvl, ploc, locus, p_locus[ploc+1]);
#endif

   return(1);      /* Indicate success */
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	G.	V V - C O A R T I C - A C R O S S - C			 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

vv_coartic_across_c(short remoteV,short remotetar,short currentV,short currenttar,short middleC,short dur_cons)
//short remoteV,remotetar,currentV,currenttar,middleC, dur_cons;
{


   if (dur_cons > NF100MS)
   {
      vvbouval = 0;
      vvdurtran = 0;
   }
   else
   {
      arg1 = (remotetar - currenttar) * (NF100MS - dur_cons);
      arg2 = 460;      /* 45% of arg1, also divided by 16 frames */
      vvbouval = mlsh1();
      vvdurtran = NF80MS - (dur_cons >> 2);
   }

#if DEBUG_TARGETS
   printf("\t -> BV=%d TC=%d\n", vvbouval, vvdurtran);
#endif
}
/*  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
/*      H. Determine parameters of forward smoothing  f(pholas,phcur)   */
/*  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

forw_smooth_rules()
{
//   debugforward("Set default",np);
   /* FORWARD SMOOTH: F1, F2, F3 */
   if (par_type IS_FORM_FREQ)
   {
      /* 0. Use default values for obst-obst transition */
      if ((feacur & FSONOR) IS_PLUS)
      {
         if ((feacur & FSONCON) IS_MINUS)
         {
            durtran = NF45MS;
            if ((fealas & FSONCON) IS_PLUS)
            {
               /* 1. Soncon-vowel transition, use 25-75% rule */
               bouval = (bouval + np->tarlas) >> 1;
               /* Make F1 discontinuous for light /l/ */
               if ((pholas == LL) && (np == &PF1))
               {
                  bouval += 80;
               }
               /* Make F3 & F2 transitions slower out of /r/ */
               if ((pholas == R) && (np != &PF1))
               {
                  durtran = NF70MS;
               }
            }
            else
            {
               /* 2. Vowel-[vowel/h] transition */
               /* Preceeding seg has strong influence on [h] init val */
               if (phcur == HX)
               {
                  bouval = (bouval + np->tarlas) >> 1;
               }
            }
         }
         else
         {
            /* Phcur is a sonorant conson */
            if ((fealas & FSONCON) IS_MINUS)
            {
               /* 3. Vowel-soncon trans, use 75-25% rule */
               bouval = (bouval + np->tarcur) >> 1;
               durtran = NF30MS;
            }
            else
            {
               /* 4. Soncon-soncon transition */
               durtran = NF30MS;
            }
         }
      }
      /* Bound value = previous target if current phone is sil */
	/*eab not if it's the first sil EAB 4/apr/95
		I've fixed this once before*/
      if (phcur == SIL  )
      {
			/*Eab 7/31/96 changed > 2 to >1 for ending sil*/
			if(nphone>1)
				{
				bouval = np->tarlas;
				durtran = durfon;
				}
			else
				{
				bouval = np->tarnex;
				durtran = durfon;
				}

      }
      else
      {
         /* 5. pholas=obst, phcur=sonor transition */
         if (setloc(nphone-1, nphone, 'i', nphone-2))
         {
//            debugforward(" Use locus,percent",np);
         }
         /* 6. pholas=sonor, phcur=obst transition */
         if (setloc(nphone, nphone-1, 'f', nphone+1))
         {
//            debugforward(" Use locus,percent",np);
         }
         /* Dummy vowel for final plosive release into silence is too */
         /* short for an extensive formant transition, make tran less */
         if ((struccur & FDUMMY_VOWEL) IS_PLUS)
         {
            /* OUT			xx += ((bouval - np->tarend) >> 1);
             np->tarend += xx;   (DOESN'T WORK) END OUT */
         }
         /* F1 raised at onset of voiceless plosive release */
         if (((fealas & FPLOSV) IS_PLUS)
            && ((fealas & FVOICD) IS_MINUS))
         {
            if (np == &PF1)    bouval += 100;
         }
         /* Transitions modified inside obstruents */
         if ((feacur & FOBST) IS_PLUS)
         {
            durtran = NF30MS;
            if (np == &PF1)    durtran = NF20MS;
            /* Transitions take all of plosive duration */
            if ((feacur & FPLOSV) IS_PLUS)
            {
               durtran = durfon;
            }
         }
         /* Higher formant transitions slow inside a nasal */
         if ((feacur & FNASAL) IS_PLUS)
         {
            durtran = durfon;
            /* Except F1, which jumps to value above FNZRO */
            if (np == &PF1)
            {
               durtran = 0;
            }
            /* Lower F2 & F3 of [n] nasal murmur after front vowels */
            else if (((phcur == N) || (phcur == EN))
               && (endtyp[pholas] == 1))
            {
               if (np == &PF2)
               {
                  bouval -= 100;
                  if ((place[pholas] & F2BACKF) IS_PLUS)
                  {
                     bouval -= 100;
                  }
               }
               if (np == &PF3)    bouval -= 100;;
            }
            /* Lower F2 of [m] nasal murmur near [i,e] */
            else if ((np == &PF2) && (phcur == M)
               && ((place[pholas] & F2BACKF) IS_PLUS))
            {
               bouval -= 150;
            }
         }
      }
      /* Shrink transition dur inside sonor if sonor short */
      if (((feacur & FOBST) IS_MINUS)
         && (endtyp[pholas] != 4)   /* Unless prev seg is obst */
         && (durtran > 0))
      {
         arg1 = durtran;
         arg2 = shrif;
         durtran = mlsh1() + 1;
      }
   }
   /* FORWARD SMOOTH:  FN */
   else if (par_type IS_NASAL_ZERO_FREQ)
   {
      durtran = 0;
      if ( ((fealas & FNASAL) IS_PLUS)
         && ((feacur & FNASAL) IS_MINUS) )
      {
         bouval = 400;
         durtran = NF80MS;
      }
   }
   /* FORWARD SMOOTH:  B1, B2, B3 */
   else if (par_type IS_FORM_BW)
   {
      /* Default transition duration is 40 ms */
      durtran = NF40MS;
      /* Widen first formant bw if preceeding seg voiceless */
      if ((feacur & FVOICD) IS_PLUS)
      {
         if ((np == &PB1)
            && ((fealas & FVOICD) IS_MINUS))
         {
            durtran = NF50MS;
            /* More increase for low vowels (F1 high) */
            bouval = np->tarcur + (PF1.tarcur>>3);
         }
      }
      else
      {
         durtran = NF20MS;
      }
      /* Treat boundary with silence */
      if (pholas == SIL)
      {
         bouval = np->tarcur + ((&PB3 - np) * 50);
         durtran = NF50MS;
      }
      else if (phcur == SIL)
      {
         bouval = np->tarlas + ((&PB3 - np) * 50);
         if (((featb[allophons[nphone-2]] & FVOICD) IS_MINUS)
            && ((struclas & FDUMMY_VOWEL) IS_PLUS)
            && (np == &PB1))
         {
            bouval = 260;   /* Kluge to avoid discontinutiy */
         }
         durtran = NF50MS;
      }
	/* eab narrow b2 somewhat to compensate for volume drop in
		nasalizing vowel klugy way for now. */

		if(nasvowel)
			{
	 		bouval-=20;
			}


      /* BW1 widen, to nasalize transition out of previous nasal */
      if ((fealas & FNASAL) IS_PLUS)
      {
         bouval = np->tarcur;   /* B2,B3 not influ by nasal */
         /* Except F2 of [n], which is wider in a non-front vowel */
         if ((np == &PB2) && ((pholas == N) || (pholas == EN))
            && (begtyp[phcur] != 1))
         {
            bouval += 60;
            durtran = NF60MS;
         }
         if (np == &PB1)
         {
            durtran = NF100MS;
            bouval += 70;
         }
      }
      /* Nasals have constant bandwidths at target values */
      if ((feacur & FNASAL) IS_PLUS)
      {
         durtran = 0;
//         debugforward(" Nasal has const par val", np);
      }
   }
   /* FORWARD SMOOTH:  AV, AP, A2, A3, A4, A5, A6, AB */

   /* Default bouval is average of tarcur & tarend, default tc is 30 ms */
   else if ((par_type IS_PARALLEL_FORM_AMP)
      || (par_type IS_AV_OR_AH))
   {
      /* See if onset, i.e. plosive or large source intensity increase */
      temp6 = np->tarcur - 10;
      if ((bouval  < temp6) || ((fealas & FPLOSV) IS_PLUS)
         || (pholas == JH))
      {
         bouval = temp6;
         if ((feacur & FOBST) IS_MINUS)    durtran = NF20MS;
         /* Voicing is special */
         if (np == &PAV)
         {
            /* Gradual buildup of voicing */
            if (pholas == SIL)
            {
               if ((feacur & FVOICD) IS_PLUS)
               {
                  durtran = NF45MS;
                  bouval -= 8;
               }
            }
            /* Obstruent voicing onset is abrupt */
            if ((fealas & FOBST) IS_PLUS)
            {
               bouval = temp6 + 6;
            }
            /* Plosive onset is abrupt (used mainly for [bdg]) */
            if ((fealas & FPLOSV) IS_PLUS)
            {
               bouval = np->tarcur - 5;
            }
         }
//         debugforward(" Onset",np);
      }
      /* If last nasal, and source amp increased, abrupt onset */
      if (((fealas & FNASAL) IS_PLUS)
         && ((feacur & FVOICD) IS_PLUS))
      {
         durtran = 0;
         //debugforward(" Onset from nasal",np);
      }
      /* Voicing source amp const in intervocalic nasal */
      if ((feacur & FNASAL) IS_PLUS)
      {
         if ((fealas & FVOICD) IS_PLUS)
         {
            if (np == &PAV)    durtran = 0;
         }
      }
      /* See if offset, i.e. source intensity decreasing */
      temp6 = np->tarlas - 10;
      if (bouval < temp6)
      {
         /* Reduce bounval by 3 dB because bval time is onset */
         /* of next phoneme */
         bouval = temp6 - 3;
         /* Source amplitudes fall gradually into silence */
         if (phcur == SIL)
            durtran = NF70MS;
         /* Except voicing offset is abrupt */
         if (np == &PAV)   durtran = 0;
         //debugforward(" Offset",np);
      }
      /* Buildup A3 gradually in [C, J] */
      if (np == &PA3)
      {
         if ((phcur == CH) || (phcur == JH))
         {
            durtran = durfon - NF15MS;
            bouval = np->tarcur - 30;
            //debugforward(" CH/JH rule",np);
         }
      }
      /* Offset of a vowel into voiceless open vocal tract is breathy */
      if (np == &PAP)
      {
         if ((phcur == SIL) || (phcur == F) || (phcur == TH)
            || (phcur == S) || (phcur == SH))
         {
            if (((fealas & FVOICD) IS_PLUS)
               && ((fealas & FOBST) IS_MINUS))
            {
               if (phcur == SIL)
               {
                  bouval = 52;
                  durtran = NF80MS;
               }
               else
               {
                  bouval = 48;
                  durtran = NF45MS;
               }
            }
         }
      }
      /* FORWARD SMOOTH:  TLT */

      /* Tilt parameter jumps to target values near stops and silence */
      if (np == &PTILT)
      {
         durtran = NF25MS;
         if (pholas == SIL)
         {
            bouval = np->tarcur;
         }
         if (phcur == SIL)
         {
            /* Reach into par buffer to get actual previous value */
            bouval = parstochip[OUT_TLT];
         }
         if ( ((fealas & FSTOP) IS_PLUS)
            || ((feacur & FSTOP) IS_PLUS) )
         {
            durtran = 0;
         }
      }
   }
   /* Truncate tran dur if exceeds duration of current phone */
   if (durtran > durfon)
      durtran = durfon;
   /* Or duration of 20 frames */
   if (durtran > NF130MS)
      durtran = NF130MS;
   /* Do not allow amplitude value to go below zero */
   if (bouval < 0)
      bouval = 0;
}
/*  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
/*      I. Determine parameters of backward smoothing  f(phcur,phonex) */
/*  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

back_smooth_rules()
{
   //debugbackward("Set default",np);

   /* BACKWARD SMOOTH:  F1, F2, F3 */
   if (par_type IS_FORM_FREQ)
   {
      /* 0. Use default values for obst-obst transition */
      if ((feacur & FSONOR) IS_PLUS)
      {
         durtran = NF45MS;
         if ((feacur & FSONCON) IS_MINUS)
         {
            if ((feanex & FSONCON) IS_PLUS)
            {
               /* 1. Vowel-soncon trans, use 75-25% rule */
               bouval = (bouval + np->tarnex) >> 1;
               /* F3 transitions slower esp for [r,l] */
               if (np == &PF3)
               {
                  durtran = NF64MS;
               }
               /* First formant jumps down 80 Hz in /l/ */
               if ((phonex == LL) && (np == &PF1))
               {
                  bouval += 80;
               }
            }
            else
            {
               /* 2. Vowel-[vowel/h] transition */
               /* Following [h] has little influence on bouval */
               if (phonex == HX)
               {
                  bouval = (bouval + np->tarend) >> 1;
               }
            }
         }
         else
         {
            durtran = NF40MS;
            if ((feanex & FSONCON) IS_MINUS)
            {
               /* 3. Soncon-vowel trans, use 25-75% rule */
               bouval = (bouval + np->tarend) >> 1;
               durtran = NF20MS;
            }
            else
            {
               /* 4. Soncon-soncon transition */
               /* Use defaults */
            }
         }
      }
      /* No backward smoothing if next phone is silence */
      if (phonex == SIL)
      {
         durtran = 0;
      }
      else
      {
         /* 5. phcur=sonor, phonex=obst transition */
         if (setloc(nphone+1, nphone, 'f', nphone+2))
         {
            //debugbackward(" Use locus,percent",np);
         }
         /* 6. phcur=obst, phonex=sonor transition */
         if (setloc(nphone, nphone+1, 'i', nphone-1))
         {
            //debugbackward(" Use locus,percent",np);
         }
         /* Transitions slow inside obstruents */
         if ((feacur & FOBST) IS_PLUS)
         {
            durtran = NF30MS;
            if (np == &PF1)    durtran = NF20MS;
            /* Transitions take all of plosive duration */
            if ((feacur & FPLOSV) IS_PLUS)
            {
               durtran = durfon;
               if ((np == &PF1) && ((feacur & FVOICD) IS_MINUS))
               {
                  bouval += 100;
               }
            }
         }
         /* Higher formant transitions slow inside a nasal */
         if ((feacur & FNASAL) IS_PLUS)
         {
            durtran = durfon;
            /* Except F1, which jumps to value below FNZRO */
            if (np == &PF1)
            {
               durtran = 0;
            }
            /* Lower F2 & F3 of [n] nasal murmur before front vowels */
            else if (((phcur == N) || (phcur == EN))
               && (begtyp[phonex] == 1))
            {
               if (np == &PF2)
               {
                  bouval -= 100;
                  if ((place[phonex] & F2BACKI) IS_PLUS)
                  {
                     bouval -= 100;
                  }
               }
               if (np == &PF3)    bouval -= 100;
            }
            /* Lower F2 of [m] murmur near [i,y,yu,ir] */
            else if ((np == &PF2) && (phcur == M)
               && ((place[phonex] & F2BACKI) IS_PLUS))
            {
               bouval -= 150;
            }
         }
      }
      /* Shrink tran dur inside sonorant if sonorant short */
      if (((feacur & FOBST) IS_MINUS)
         && (begtyp[phonex] != 4)   /* Unless next seg is obst */
         && (durtran > 0))
      {
         arg1 = durtran;
         arg2 = shrib;
         durtran = mlsh1() + 1;
      }
   }
   /* BACKWARD SMOOTH:  FN */
   else if (par_type IS_NASAL_ZERO_FREQ)
   {
      durtran = 0;
      /* Nasalization cue: place zero between F1 and FP */
      if ( ((feanex & FNASAL) IS_PLUS)
         && ((feacur & FNASAL) IS_MINUS) )
      {
         bouval = 400;
         durtran = NF80MS;
         if (phonex == EN)    durtran = NF130MS;
      }
   }
   /* BACKWARD SMOOTH:  B1, B2, B3 */
   else if (par_type IS_FORM_BW)
   {
      durtran = NF40MS;
      if ((feacur & FVOICD) IS_PLUS)
      {
         /* Glottis opens early before -voice C, widen B1 */
         if (np == &PB1)
         {
            if ((feanex & FVOICD) IS_MINUS)
            {
               durtran = NF50MS;
               /* More increase for low vowels (F1 high) */
               bouval = np->tarend + (PF1.tarcur>>3);
               /* Effect is greater for a female voice */
               if (malfem == FEMALE)
               {
                  durtran = NF100MS;
               }
            }
         }
      }
      else
      {
         durtran = NF20MS;
      }
      /* Treat boundary with silence */
      /* OUT ??? */
   if (phonex == SIL)
      {
         bouval = np->tarend + ((&PB3 - np) * 50);
         durtran = NF50MS;
      }
      else if (phcur == SIL)
      {
         bouval = np->tarnex + ((&PB3 - np) * 50);
         durtran = NF50MS;
      }
      /* BW1 widen, to nasalize transition into next nasal */
      if ((feanex & FNASAL) IS_PLUS)
      {
         bouval = np->tarend;
         /* Except F2 of [n], which is wider before a non-front vowel */
         if ((np == &PB2) && ((phonex == N) || (phonex == EN))
            && (endtyp[phcur] != 1))
         {
            bouval += 60;
            durtran = NF60MS;
         }
         if (np == &PB1)
         {
            durtran = NF100MS;
            bouval += 100;
         }
      }
      /* Nasals have constant bandwidths at target values */
      if ((feacur & FNASAL) IS_PLUS)
      {
         durtran = 0;
//         debugbackward(" Nasal has const. par val", np);
      }
   }
   /* BACKWARD SMOOTH:  AV, AP, A2, A3, A4, A5, A6, AB */
   else if ((par_type IS_PARALLEL_FORM_AMP)
      || (par_type IS_AV_OR_AH))
   {
      /* See if onset, i.e. source intensity increasing */
      temp6 = np->tarnex - 10;
      if (bouval < temp6)
      {
         bouval = temp6;
         /* Onset of an init fricative or /h/ is very gradual */
         if (phcur == SIL)
         {
            durtran = NF70MS;
         }
//         debugbackward(" Onset",np);
      }
      /* Voicing is special:  onset is abrupt, except if a voiced fric */
      if ((np == &PAV) && (bouval < np->tarnex)
         && (phcur != V) && (phcur != DH)
         && (phcur != JH) && (phcur != ZH) && (phcur != Z))
      {
         durtran = 0;
//         debugbackward(" Make next onset abrupt",np);
         /* Voicebar dies out in a voiced plosive */
         if ( ((feacur & FPLOSV) IS_PLUS) || (phcur == CH) )
         {
            if ((feacur & FVOICD) IS_PLUS)
            {
               bouval = np->tarend - 3;
               durtran = NF45MS;
//               debugbackward(" Voicebar dies out",np);
            }
            /* Do not allow prevoicing in a voiceless plosive */
            else
            {
               bouval = 0;
            }
            goto endbsmo;
         }
      }
      /* If next nasal, & curr phone is voiced, set AV const */
      if (((feanex & FNASAL) IS_PLUS)
         && ((feacur & FVOICD) IS_PLUS))
      {
         durtran = 0;
         //debugforward(" AV const in voiced to  nasal",np);
      }
      /* If curr phone nasal, and next is voiced non-obst, AV const */
      if ((feacur & FNASAL) IS_PLUS)
      {
         if (((feanex & FVOICD) IS_PLUS)
            && ((feanex & FOBST) IS_MINUS)
            && ((strucnex & FDUMMY_VOWEL) IS_MINUS))
         {
            durtran = 0;
//            debugbackward(" Make murmur const AV",np);
         }
         else
         {
            durtran = NF40MS;
         }
      }
      /* See if offset, i.e. source intensity decreasing */
      temp6 = np->tarend - 10;
      /* Plosive burst does not get attenuated during offset */
      if (phcur >= P)
      {
         durtran = NF15MS;
         if (phcur < CH)
         {
            temp6 = np->tarend;
         }
      }
      if (bouval < temp6)
      {      /* Or does it ??? */
         bouval = temp6 - 3;
         durtran = NF20MS;
      }
      /* Voicing amp falls gradually at end of phrase */
      /* (Source sudden offset, or next seg is a dummy vowel) */
      if (np == &PAV)
      {
         if ((bouval < temp6) || ((temp6 > 0)
            && (np == &PAV) && ((strucnex & FDUMMY_VOWEL) IS_PLUS)))
         {
            bouval = temp6 + 3;
            if ((phonex == SIL)
               || ((strucnex & FDUMMY_VOWEL) IS_PLUS))
            {
               durtran = NF75MS;
            }
         }
         else if (np == &PAP)   bouval = PAP.tarend - 6;
//         debugbackward(" Offset to noise",np);
      }
      /* No smoothing of source amps if next segment has burst */
      if ((phonex >= P)
         && (((feacur & FNASAL) IS_MINUS) || (np != &PAV)))
      {
         durtran = 0;
//         debugbackward(" Stop closure next",np);
      }
      /* Onset of a vowel from voiceless open vocal tract is breathy */
      if (np == &PAP)
      {
         if (
            /* OUT		      (phcur == SIL) ||				END OUT */
            (phcur == F) || (phcur == TH)
            || (phcur == S) || (phcur == SH))
         {
            if (((feanex & FVOICD) IS_PLUS)
               && ((feanex & FOBST) IS_MINUS))
            {
               bouval = 52;
               durtran = NF40MS;
            }
         }
         /* Offset of a vowel into silence is breathy */
         if (((feacur & FSYLL) IS_PLUS)
            && (phonex == SIL))
         {
            bouval = 52;
            durtran = NF130MS;
         }
      }
      /* BACKWARD SMOOTH:  TLT */

      /* Tilt parameter jumps to target values near stops and silence */
      if (np == &PTILT)
      {
         durtran = NF25MS;
         if (phonex == SIL)
         {
            bouval = np->tarend;
         }
         if (phcur == SIL)
         {
            bouval = np->tarnex;
         }
         if ( ((feanex & FSTOP) IS_PLUS)
            || ((feacur & FSTOP) IS_PLUS) )
         {
            durtran = 0;
         }
         /* Long breathy offset into silence */
         if (((feacur & FVOICD) IS_PLUS)
            && ((feacur & FNASAL) IS_MINUS))
         {
            if (phonex == SIL)
            {
               bouval = 15;
               durtran = NF130MS;
            }
         }
      }
   }
   /* Truncate back transition so as not to exceed 20 frames */
   endbsmo:
   if (durtran > NF130MS)
      durtran = NF130MS;
   /* Truncate backward tran so as not to exceed dur of phone */
   if (durtran > durfon)
      durtran = durfon;
   np->tbacktr = durfon - durtran;
   /* No parameter can take on negative values */
   if (bouval < 0)
      bouval = 0;
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	J.		S P E C I A L - R U L E S			 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

special_rules()
{
   /* SPECIAL RULE 1: Burst duration for plosives and affricates	     */

   bdur = burdr[phcur];   /* Look up inher. burst dur in msec in table */
   if ((feacur & FBURST) IS_PLUS)
   {
      bdur = mstofr(bdur);      /* Convert to frames	     */

      /* Don't release burst in homorganic plosiv-nasal & plos-plos sequence */
      if ((feanex & (FNASAL | FPLOSV)) IS_PLUS)
      {
         if (place[phcur] == place[phonex])
         {   /* Was >= */
            bdur = 0;
         }
      }
      if (bdur > 1)
      {
         if ( ((feacur & FPLOSV) IS_PLUS)
            && ((feanex & FOBST) IS_PLUS) )
         {
            bdur--;   /* Shorten burst before obst by 6 ms */
         }
         else if (durfon < NF50MS)
         {
            bdur--;   /* Shorten burst if closure short */
         }
      }
      closure_dur = durfon - bdur;

      if ((phcur == CH) || (phcur == JH))
      {
         if (closure_dur > NF80MS)    closure_dur = NF80MS;
      }
      for (np = &PA2; np <= &PAB; np+=1)
      {      /* All fric gains to */
         np->tspesh = closure_dur;      /* zero during closur */
         np->pspesh = 0;
      }
   }
   /* SPECIAL RULE 2: Voice onset time for aspirated plosives */

   vot = 0;
   if ((((fealas & FPLOSV) IS_PLUS)
      && ((fealas & FVOICD) IS_MINUS)
      && ((feacur & FSONOR) IS_PLUS)))
   {
      PAP.pspesh = 57;      /* Amplitude of aspiration in dB     */
      if (begtyp[phonex] != 1)
      {
         PAP.pspesh = 61;   /* Stronger asp before +back */
      }
      PAV.pspesh = 0;      /* Amplitude of voicing during aspir */

      vot = NF40MS;   /* Asp dur for /p,t,k/ before stressed sonor */
      if ((struccur & FSTRESS_1) IS_MINUS)
      {
         vot = NF25MS;      /* Vot shorter if vowel not stressed */
         PAP.pspesh -= 3;
      }
      if (((feacur & FSONCON) IS_PLUS) || (phcur == RR))
      {
         PAP.pspesh += 3;   /* Aspiration stronger in sonor cons */
      }
      if (pholm2 == S)
      {
         if ((struclm2 & FBOUNDARY) IS_MINUS)
         {
            vot = NF15MS;   /* Plosive is in an [s] cluster */
         }
      }
      else if (((feacur & FSYLL) IS_MINUS))
      {
         vot += NF20MS;      /* Vot longer in a sonorant consonant */
      }
      if (vot >= durfon)
      {
         vot = durfon - 1;
      }
      /* Vot cannot exceed 1/2 duration of a stressed vowel */
      if ((vot > (durfon >> 1))
         && ((feacur & FSYLL) IS_PLUS)
         && ((struccur & FSTRESS_1) IS_PLUS))
      {
         vot = durfon >> 1;
      }
      /* A dummy vowel is used to release a voiceless plosive into silence */
      if ((struccur & FDUMMY_VOWEL) IS_PLUS)
      {
         vot = durfon;
         PAP.pspesh -= 3;
      }
      PAV.tspesh = vot;
      PAP.tspesh = vot;

      /* Widen 1st and 2nd formant bws when glottis open for aspir */
      PB1.tspesh = vot;
      PB2.tspesh = vot;
      PB1.pspesh = PB1.tarcur + 250;
      PB2.pspesh = PB2.tarcur + 70;
   }
   /* SPECIAL RULE 3: Create realistic voicebar, avoid pops and clicks */
   /* Amp of voicebar set here, AV target in table invalid */
   /* Set AV=0 for last 12.8 ms, let AV die out, thus avoid click */
   /* Set to under 250 to signal voicebar */

   /* Problem: spectrum has too much F4 if f2,3 are high, as in [i] */
   if ( ((feacur & FBURST) IS_PLUS)
      && ((feacur & FVOICD) IS_PLUS)
      && ((fealas & FVOICD) IS_PLUS)
      && ((feanex & FVOICD) IS_MINUS)   /* Voicebar only if next -V */
      && (phcur != TX) )
   {
      PAV.tspesh = durfon - NF15MS;
      PB1.tspesh = durfon;
      PB2.tspesh = durfon;
      PB3.tspesh = durfon;
      PAV.pspesh = 63;   /* Large since low-pass TILT attenuates it */
      PB1.pspesh = 1000;
      PB2.pspesh = 1000;
      PB3.pspesh = 1500;
   }
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*				G E T - P H O N E			 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

get_phone(pointer) short pointer;
{
   if ((pointer >= 0) && (pointer < nallotot))
   {
#if	DEBUG_TARGETS
	printf("getp phone=%d \n",allophons[pointer]);
#endif
      return(allophons[pointer]);

   }
   else
   {
      return(SIL);
   }
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*				S H R D U R				 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/*  SHRINK OR EXPAND DURIN NONLINEARLY IN A DIPHTHONG TO PRESERVE */
/*  TENDENCY TOWARD CONSTANT DURATION OF TRANSITION PORTION */
/*  WITH CHANGES IN VOWEL DURATION */

shrdur(durin) short durin;
{
   short halfinhdr,halfmaxdur,foldswitch,localinhdr;

   /* Convert from ms to number of frames * 64 */
   durin = (durin*10)+5;
   localinhdr = inhdr_frames * NSAMP_FRAME;
   halfinhdr = inhdr_frames * NSAMP_FRAME>>1;
   arg1 = halfinhdr;
   arg2 = shrink;
   halfmaxdur = mlsh1();

   /* Fold durin over about halfinhdr */
   foldswitch = 0;
   if (durin > halfinhdr)
   {
      durin = localinhdr - durin;
      foldswitch = 1;
   }
   /* Turn time around (measure from middle of inhdur */
   durin = halfinhdr - durin;

   /* Shrink this time by less than full requested shrinkage */
   arg2 = ((unsigned) shrink + FRAC_ONE) >> 1;
   arg1 = durin;
   durin = mlsh1();

   /* See that this time does not exceed halfmaxdur */
   if (durin > halfmaxdur)    durin = halfmaxdur;

   /* Convert back to true time */
   durin = halfmaxdur - durin;
   if (foldswitch == 1)    durin = halfmaxdur + halfmaxdur - durin;

   /* Minimum value is one */
   if (durin < NSAMP_FRAME)
		durin = NSAMP_FRAME;

   return(durin>>6);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*			D E B U G - F O W A R D				 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#ifdef NEVER
debugforward(message,nparameter) char *message; PARAMETER *nparameter;
{

#if DEBUG_TARGETS
   short temp1;
   static PARAMETER *nparlast;
   static short savbvf,savtcf;

   temp1 = (durtran * NSAMP_FRAME) / 10;
   if (nparameter != nparlast)
   {
      printf("bvbeg=%4d tcforw=%3d %s  \n",
      bouval, temp1, message);
   }
   else
   {
      if ((bouval != savbvf) || (temp1 != savtcf))
      {
         printf("          %4d        %3d    %s.\n",
         bouval, temp1, message);
      }
   }
   nparlast = nparameter;
   savbvf = bouval;
   savtcf = temp1;
#endif
}
#endif
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*			D E B U G - B A C K W A R D			 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#ifdef NEVER
debugbackward(message,nparameter) char *message; PARAMETER *nparameter;
{

#if DEBUG_TARGETS
   short temp1;
   static PARAMETER *nparlast;
   static short savbvb,savtcb;

   temp1 = (durtran * NSAMP_FRAME) / 10;
   if (nparameter != nparlast)
   {
      printf("bvend=%4d tcback=%3d  %s \n",
      bouval, temp1, message);
   }
   else
   {
      if ((bouval != savbvb) || (temp1 != savtcb))
      {
         printf("          %4d        %3d    %s.\n",
         bouval, temp1, message);
      }
   }
   nparlast = nparameter;
   savbvb = bouval;
   savtcb = temp1;
#endif
}
#endif
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*			I N I T _ V A R I A B L E S			 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/*    Initialize program at beginning of each clause */

init_variables()
{
   if (nphone == 0)
   {
      pholm2 = SIL;
      struclm2 = 0;
      pholas = SIL;
      if (initsw == 0)
      {
         initsw++;
         for (np= &PF1; np <= &PTILT; np+=1)
         {
            np->tarend = getbegtar(0);
         }
      }
   }
   else
   {
      pholm2 = pholas;
      if (nphone > 1)
         struclm2 = allofeats[nphone - 2];
      pholas = phcur;
      struclas = allofeats[nphone - 1];
   }
   /* Begin normal initialization of variables for new phoneme */

   phcur = allophons[nphone];
   struccur = allofeats[nphone];

   if (nphone < (nallotot - 1))
   {
      phonex = allophons[nphone + 1];
      strucnex = allofeats[nphone + 1];
   }
   else
   {
      phonex = SIL;
      strucnex = 0;
   }
#ifndef MINIMAL_SYNTH
   if (nphone < (nallotot - 2))
   {
      phonp2 = allophons[nphone + 2];
   }
   else
   {
      phonp2 = SIL;
   }
#endif
   ndips = &dipspec[1];   /* Initialize pointer to diph info for phone */

   /* Precompute often-used variables */

   fealas = featb[pholas];
   feacur = featb[phcur];
   feanex = featb[phonex];

   inhdr_frames = mstofr(inhdr[phcur]);   /* Inherent dur in frames */

   /* Transition durs are shorter if phone dur is short rel to inherent dur */
   /* Compute change in duration rel. to inherent dur if a sonorant */
   if (((feacur & FOBST) IS_MINUS) && (phcur != SIL))
   {
      /* Shrink,shrif,shrib only apply to sonorants */
      if (durfon < (inhdr_frames<<1))
      {   /* durfon can't exceed 2*inhd */
         arg1 = FRAC_ONE;
         arg2 = durfon;
         arg3 = inhdr_frames;
         shrink = muldv();   /* = FRAC_ONE, i.e. 16384 if no */
      }
      else
      {
         shrink = FRAC_ONE + (FRAC_ONE - 1);  /* IS THIS AN ERROR ??? */
      }
      /* Shrinkage factor for formant transitions inside sonorants */
      shrif = (shrink >> 1) + FRAC_HALF;
      /* Ditto for backward transition, which is slightly (15%) faster */
      shrib = shrif - 1600;
   }
   PAV.tspesh = 0;      /* Default case: set 'end time' of special  */
   PAP.tspesh = 0;      /* constant override of computed parameter */
   PF1.tspesh = 0;
   PB1.tspesh = 0;      /* value to zero, i.e. no special override */
   PB2.tspesh = 0;      /* for this phone.			    */
   PB3.tspesh = 0;
   PA2.tspesh = 0;
   PA3.tspesh = 0;      /* If rules below set to non-zero, substitute */
   PA4.tspesh = 0;      /* pspesh for computed value over time	     */
   PA5.tspesh = 0;      /* interval from beginning of phone (done   */
   PA6.tspesh = 0;      /* in JPHDRAW.C			     */
   PAB.tspesh = 0;
}
debug1()
{
 //	printf("pholas=%d  phcur=%d  phonex=%d \n",pholas, phcur, phonex); /*debug eab*/


}
