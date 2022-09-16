/* 
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997,1998,  1999 All rights reserved.
 *
	  U.S. Government Rights: Consistent with FAR 12.211 and 12.212, 
      Commercial Computer Software, Computer Software Documentation, 
      and Technical Data for Commercial Items are licensed to the U.S. 
      Government under vendor's standard commercial license.

 
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    ph_draw.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * 	  Realize each 6.4 ms time frame as a set of 16 control parameters
 *    (plus the fundamental period T0, which is set by PHDRAWT0.C)
 *    1. Set target values for this time frame.
 *    2. Add diphthongization increment if apropriate
 *    3. Smooth tran at boundary with previous segment.
 *    4. Smooth tran at boundary with next segment.
 *    5. Execute exception rules: e.g. set init part of phone to const
 *
 * 	  Ordering of control parameters in param[] structured array:
 *    F0,F1,F2,F3,FZ,B1,B2,B3,AV,AP,A2,A3,A4,A5,A6,AB,TILT
 * 	  Note that this isn't cast in concrete anymore, because of the
 * 	  "OUT_" stuff.
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 DK 		08/03/1984	    Initial creation
 * 0002 DK		08/12/1984	    Add vowel-vowel coartic across conson
 * 0003 DGC		12/27/1984	    Modified for the 80186.
 * 0004 DK		01/17/1985      Reverse tilt dependence on f0, initialize *outp
 * 0005 DK 		01/29/1985	    Reduce AV during glottal stop
 * 0006 DK		02/19/1985	    Tilt calc now standard, move spdef Tilt offset to chip
#ifdef ENGLISH_US               From phdraw.c
 * 0007 DK 		05/06/1985	    Add code to make breathy offset if breathysw == 1
 * 0008 DK		05/28/1985	    Make breathy offset code spdef via LX -> spdeflaxprcnt
 * 0009 DK		07/12/1985	    Clean up f0_dep_tlt code
 * 0010 DK		07/16/1985	    Use spdef offset here instead of SPC
 * 0011 DK		07/24/1985	    Rename chip stuff, make outpar structure into array
 * 0012 DK 		07/29/1985	    Breathy voices have wider first formant bandwidth
 * 0013 EAB		03/03/1996	    Modified the way an adjust was added to compensate
 *                      		for tilt, the old METHOD SIMPLY WAS NOT DOING ENOUGH.
 * 0014 CJL		03/18/1996	    Removing volume/tilt change; causes English overs.
 * 0015 MGS 	03/25/1996	    Merged WIN 95 code with 42c
#endif
#ifdef SPANISH                  From sphdraw.c
 * 0007 MM		04/02/1985	    68000
 * 0008 MM		07/19/1985	    Added trill modulator (from German DECtalk)
 * 0009 MM		04/10/1986	    Allow Tilt to be specified by special rules.
 * 0010 MM		04/23/1986	    Changed [r] timing per suggestion from Dr. Quilis.
 * 0011 DF		06/03/1986	    DT3 updates: replace outpar by parstochip
#endif   
#ifdef GERMAN                   from gphdraw.c
 * 0013 BNK		08/06/1986	    Add german uvular R
 * 0014 BNK		06/20/1986	    Treatment of german affricates and plosives
 * 0015 CJL		03/30/1995	    File was phdraw.c. Is now gphdraw.c. Changed
 *                              phdefs.h->gphdefs.h
 * 0016 EAB 	03/03/1996		Modified the way an adjust was added to compensate for tilt, 
 *                    			the old METHOD SIMPLY WAS NOT DOING ENOUGH.
 * 0017 EAB		04/07/1996		Had to reduce effect and added check so that we don't ever set
 *                      		anything negative
#endif
 * 0016	MGS		06/03/1996 		Merged spanish with english		
 * 0017 MGS		06/06/1996 		hanged file name from phdraw.c to ph_draw.c
 * 0018	MGS		06/17/1996		Merged German with english/spanish
 * 0019 SIK		07/09/1996  	Cleaning up and maintenance
 * 0020 EDB 	12/10/1996		Many code change, also include debug window.
 * 0021 EDB		01/10/1997		Add some Spanish code and debug code.
 * 0022 GL		01/16/1997		fix the bug to correctly separate the code for
 *								German and Spanish in "compensate the loudness decrease..." code
 * 0023 EAB		02/14/97		Improve distinction of trilled r by adding a voicing component to rr
 * 0024 GL		03/05/97		Move r_modulation() from l_gr_dr1.c to here.
 * 0024 GL		03/05/97		Move r_modulation() from l_gr_dr1.c to here.
 * 0024	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 0025 NCS     07/29/1997      Merged in OCTEL changes
 * 0026 EAB		10/12/97		Removed old garbage that was ifdefed out
 * 0027 MGS     10/14/97        BATS #470 Fixed, Reset/Crash
 * 0028 EAB/CJL 11/07/97        Add Special Swap development code.
 * 0028 EAB		11/18/97		Rmove double burst for UK English
 * 0029 EAB		5/11/98			Added new VTM control parameters enabled in dectalkf.h with NEW_VTM
 * 0030 EAB     3/20/98			Found that the using pointer nphone instead of np_drawto caused some
 *								lack of synchronization of several frames at times problem really 
								surfaced with control of German trills.c
 * 0031 EAB		4/29/98			Many changes for German plus new intnation parameter as well as 
								new handle for R-mod for better debug and tune r_mod
 * 0032 eab		5/27/98			bats 690 lateral at end of phrase
 * 0033 EAB		7/13/98			BATS 711 Especially the tilt stuff I'm not sure backward compatibilty
								The tilt stuff will forever
 * 0034 EAB 		7/20/98		Continued work on Spanish with Juan 
 * 0035 EAB		9/24/98			Increased the glotal speed of nasal's per request from ginger
 * 0036 EAB		9/29/98 Correct typo and raise elvelar level slightly
 * 0037 eab 10/13/98 Tuned Spanish and improved debug code
 * 0038 EAB 10/15/98 Modified out_gs for Spanish nasals
 * 0039	GL		11/20/1998		BATS#828 use PH_DEBUG to replace _DEBUG
 * 0040	mfg		01/08/1999		WINprint not supported under Windows CE #ifdef out 
 * 0042 EAB		1/26/99 EAB     0014 17-Sep-86 DK	Add code to control open quotient
             0015 19-Mar-87 DK	Female voice AV down and OQ up at low f0
								Also added in more code for Evan Ballaban ouput of VTM parameers
 00 43 EAB 2/23/99 updated copright and gov reg notice, added comment, and improved swapdata

 */



 

#include "dectalkf.h"


#include "ph_def.h"  

#ifdef SPANISH

#ifdef THETRILLISNOTGONEBUTITSGOING

#define   TRILL_CLOSED (NF15MS)	   /* Trill closed phase */
#define TRILL_OPEN (NF20MS)		   /* Trill open phase   */
#define   TRILL_CYCLE( TRILL_CLOSED + TRILL_OPEN )

#endif

#endif

/* This is defined to add the code to be used to perform a regression test. */
  

//#define PH_REGRESSION_TEST
/* swap _data is for development work only */
//#define PH_SWAPDATA

#ifdef PH_SWAPDATA   
FILE *PHSwapIn = NULL;
FILE *PHSwapOut = NULL;
#endif

extern short featb[];


/***************************************************************************/
/* MVP : The following variables are never used ,commented out             */
/* extern short dipspec[40];     Contains dipthong specs                   */
/* extern short durfon;          Duration of current phone, in frames      */
/***************************************************************************/


/***************************************************************************/
/* MVP : The following extern variables are now become elements of instance*/
/* specific PH thread data structure DPH_T.                                */
/* Input arrays (set by call to PHSETTAR.C whenever time for new phone)    */
/* extern PARAMETER param[];       Struc of input vars for each par        */
/* extern short fvvtran,bvvtran,tvvbacktr,dfvvtran,dbvvtran;  F2 V-V       */
/* extern short breathysw;          Set to one if breathy offset           */
/* extern short spdefb1off;         Scale factor for B1 if breathy         */
/* extern short spdeflaxprcnt;      Set to 0 - 4096, percent breathy       */
/* For computation of TILT only                                            */
/* extern short    spdeftltoff;     Tilt offset spdef constant             */
/* extern short    f0_dep_tilt;     Sp def %-f0-effect                     */
/* extern short    f0;              Unscaled current f0                    */
/* Output arrays: All parameter values stored here                         */
/* extern short parstochip[];    Array incl state and par[TILT]            */
/* extern short tcum;       Time relative to phoneme begin, in frames      */
/* extern short avglstop;   Used to reduce AV during glstop                */
/***************************************************************************/


/* Variables initialized elsewhere   */



#if defined PH_DEBUG || defined PH_SWAPDATA
int ii;			   /* for regression testing eab */

#endif                                           

#include "ph_draw1.c" /* pick up the language dependent code */
#if defined (WIN32) && defined (PRINTFDEBUG)
#include "dbgwins.h"
#endif
	//EAB		7/13/98			BATS 711 
void r_modulation (LPTTS_HANDLE_T phTTS,short *formpointer, short percent, short temp);

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* D R A W P A R S                                  					 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 *      Function Name: phdraw()      
 *
 *  	Description: Smooths curves between points.
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */


void phdraw (LPTTS_HANDLE_T phTTS)
{

	register PARAMETER     *np;		   /* Pointer to control values    */
	register short         *parp;	   /* Pointer to output buffer     */
	register short          value;                           
#ifdef PH_SWAPDATA
	char outbuf[20];
	short j;
#endif
	short			pholas = SIL;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
#ifndef MSDOS
	/* MGS 10/14/1997 BATS #470 Fixed crashed due to reset */
	volatile BOOL		*bInReset;
#endif	
	/* register short          del_av; */
	/* static short drawinitsw; *//* MVP made instance specific added to PHSETTAR struct */
	/* static short breathyah,breathytilt; *//* Used to make breathyness  */
	short                   temptilt;
//	EAB		7/13/98			BATS 711 removed vadjust
#ifndef MSDOS
	/* MGS 10/14/1997 BATS #470 Fixed crashed due to reset */
	bInReset=&(pDph_t->phTTS->bInReset);
#endif
/* Loop across all parameters but T0. I changed this so that it    */
/* pulls the value of "parp" from the "outp" field of the struct.  */
/* This lets these loops be written nicely, but makes it possible  */
/* to reorder things in the output.                                */

#ifndef MSDOS
	if (pDphsettar->drawinitsw == 0)
	{
		pDphsettar->drawinitsw = 1;

		pDph_t->param[F0].outp = &(pDph_t->parstochip[OUT_T0]);
		pDph_t->param[F1].outp = &(pDph_t->parstochip[OUT_F1]);
		pDph_t->param[F2].outp = &(pDph_t->parstochip[OUT_F2]);
		pDph_t->param[F3].outp = &(pDph_t->parstochip[OUT_F3]);
		pDph_t->param[FZ].outp = &(pDph_t->parstochip[OUT_FZ]);
		pDph_t->param[B1].outp = &(pDph_t->parstochip[OUT_B1]);
		pDph_t->param[B2].outp = &(pDph_t->parstochip[OUT_B2]);
		pDph_t->param[B3].outp = &(pDph_t->parstochip[OUT_B3]);
		pDph_t->param[AV].outp = &(pDph_t->parstochip[OUT_AV]);
		pDph_t->param[AP].outp = &(pDph_t->parstochip[OUT_AP]);
		pDph_t->param[A2].outp = &(pDph_t->parstochip[OUT_A2]);
		pDph_t->param[A3].outp = &(pDph_t->parstochip[OUT_A3]);
		pDph_t->param[A4].outp = &(pDph_t->parstochip[OUT_A4]);
		pDph_t->param[A5].outp = &(pDph_t->parstochip[OUT_A5]);
		pDph_t->param[A6].outp = &(pDph_t->parstochip[OUT_A6]);
		pDph_t->param[AB].outp = &(pDph_t->parstochip[OUT_AB]);
		pDph_t->param[TILT].outp = &(pDph_t->parstochip[OUT_TLT]);
	}
#endif

	if (pDph_t->nphone>=1)
	{
		pholas = pDph_t->allophons[pDphsettar->np_drawt0 - 1];
	}
	else
		pholas=0;


		
	for (np = &PF1; np <= &PB3; ++np)
	{
		parp = np->outp;			   /* Where it goes.       */

		/* If diphthongized seg, see if new straight line called for.   */
#ifndef MSDOS
		/* MGS 10/14/1997 BATS #470 Fixed crashed due to reset */
		if (*bInReset)	return;
#endif
	    /* crashing if adjust != 0 eab 11/96 need to fix correctly eab */
		if (pDph_t->tcum > np->durlin && pDph_t->tcum > 0 && np->durlin >=0)
		{
			np->durlin = *np->ndip++;
			np->deldip = *np->ndip++;
			np->tarcur += (np->dipcum DIV_BY8);
			np->dipcum = 0;
/* printf("deldipindraw %d %d\n",np->deldip,np->ndip); */
		}

		/* Set target value and smooth forward. The delta-dipth and the */
		/* delta-trans are *8 to avoid roundoff propogation.            */
		np->dipcum += np->deldip;
		value = np->dipcum + np->ftran;

		/* Then shrink transition magnitude by appropriate increment.   */
		if (np->ftran != 0)
			np->ftran -= np->dftran;

		/* Smooth backwards. Delta-transition is *8 to avoid roundoff   */
		/* propogation. Transition magnitude is then changed by the     */
		/* appropriate increment.                                       */
		if (pDph_t->tcum >= np->tbacktr)
		{
			value += np->btran;
			np->btran += np->dbtran;
		}

		/* Vowel-vowel coartic across a consonant, for F2 only.         */
		if (np == &PF2)
		{
			value += pDph_t->fvvtran;
			if (pDph_t->fvvtran != 0)
				pDph_t->fvvtran -= pDph_t->dfvvtran;
			if (pDph_t->tcum >= pDph_t->tvvbacktr)
			{
				value += pDph_t->bvvtran;
				pDph_t->bvvtran += pDph_t->dbvvtran;
			}
		}

		/* 
		 * Store the computed paramter into the right spot in the block 
		 * of data about to be sent to the TMS320.                      
		 */
		*parp = (value DIV_BY8) + np->tarcur;
	

			/* Special rules (I.e. BW windening for aspir)                  */
			if (np->tspesh > 0)
			{
				if (pDph_t->tcum < np->tspesh)
				{
					*parp = np->pspesh;
				}
			}
		/* eab 6/24/98 ifdef removed because this is pysiological*/
			//EAB		7/13/98			BATS 711 
			/* Breathy voices have wider first formant bandwidth */
			else if (np == &PB1)
			{
				*parp = frac4mul (*parp, pDph_t->spdefb1off);
			}

	}

	/* 
	 * End of loop for F[1,2,3], FZ, B[1,2,3].                         
	 * Begin loop for amplitude parameters AV, AP, A[2,3,4,5,6], AB.   
 	 */

	for (; np <= &PTILT; np++)
	{
	
		parp = np->outp;			   /* Where it goes.       */

		/* Smooth forward, use shift to avoid roundoff propogation.     */
		value = np->tarcur + (np->ftran DIV_BY8);
		/* Then shrink transition magnitude by appropriate increment.   */
		if (np->ftran != 0)
			np->ftran -= np->dftran;

		/* 
		 * Smooth backward, using shift to avoid roundoff propogation.  
		 * Modify transition magnitude by the appropriate increment.   
		 */
		if (pDph_t->tcum >= np->tbacktr)
		{
			*parp = value + (np->btran DIV_BY8);
			np->btran += np->dbtran;
		}
		else
		{
			*parp = value;
		}

		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
		/* Special rules (I.e. vot, aspir, and burst dur for plos).     */
		if (np->tspesh > 0)
		{
			if (pDph_t->tcum < np->tspesh)
			{
				*parp = np->pspesh;
			}
			else
			{

#ifdef GERMAN	
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
				/* change first part of parallele amplitudes of                     	 */
				/* german affricate KS                                             	 */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
				if ((pDph_t->allophons[pDphsettar->np_drawt0] == KSX) &&
					(pDph_t->tcum < (np->tspesh + 3)))
				{
					if (np == &PA2)
					{
						*parp = 42;
					}
					else if (np == &PA3)
					{
						*parp = 0;
					}
					else if (np == &PA4)
					{
						*parp = 31;
					}
					else if (np == &PA5)
					{
						*parp = 35;
					}
					else if (np == &PA6)
					{
						*parp = 0;
					}
					else if (np == &PAB)
					{
						*parp = 0;
					}

#ifdef DBGBUR
					fprintf (stderr,
							 "(phdraw)altering /KS/ to %d\n",
							 *parp);
#endif
				}
				/* if */
#endif /* #ifdef GERMAN */
  	   /* Double burst for /k,g,ch,jh/                         */
				/*per caroline double burst is wrong for UK*/
#ifndef ENGLISH_UK
				
				if ((np > &PAP)
	
#ifdef SPANISH
					&& (np < &PTILT)
#endif
					&& (pDph_t->tcum == (np->tspesh + 1))
					&& (*parp >= 10))
				{
#ifdef GERMAN
					if (pDph_t->allophons[pDphsettar->np_drawt0] == KSX)
					{
						*parp = 0;
					}
					else
#endif
					*parp -= 10;
				}
#endif
			}
		}
	}

#ifdef SPANISH_obsolete
	/* * * * * * * * * * * * * * */
	/* Trill /r/ in Spanish:  */
	/* * * * * * * * * * * * * * */
	/* 
	 * Dr. Quilis suggests "closed phase" 15 msec, "open phase" 18 msec.
	 * Since we work on a 6.4 msec. interval, we choose 2 frames closed,
	 * and 3 frame open.
	 */
	if (pDph_t->istrill)
	{
/* printf("%d %d %d \n",tcum,trillend,trillcount); */

		if (pDph_t->tcum >= pDph_t->trillend)
			pDph_t->istrill = FALSE;		   /* The trill is gone  */
		else
		{
			if (pDph_t->trillcount <= TRILL_CLOSED)
			{
				pDph_t->trillclosed = 1;
				pDph_t->arg1 = pDph_t->parstochip[OUT_AV];	/* Closed phase                */
				pDph_t->arg2 = N70PRCNT;
				if (pholas == SIL)	   /* onset in initial pos too fast */
				{
					pDph_t->arg1 = pDph_t->arg1 >> 1;
				}
#if 0
				pDph_t->parstochip[OUT_AV] = mlsh1 (pDph_t->arg1,pDph_t->arg2);
				pDph_t->parstochip[OUT_A2] >>= 2;	/* Lower parallel       */
				pDph_t->parstochip[OUT_A3] >>= 2;	/* amplitudes           */
				pDph_t->parstochip[OUT_AB] >>= 2;	/* too.  8-Jul-86       */
#endif
				pDph_t->parstochip[OUT_AV] = mlsh1 (pDph_t->arg1,pDph_t->arg2);
				pDph_t->parstochip[OUT_A2] = 0;		/* Lower parallel */
				pDph_t->parstochip[OUT_A3] = 0;		/* amplitudes             */
				pDph_t->parstochip[OUT_AP] = 0;		/* amplitudes             */
				pDph_t->parstochip[OUT_AB] = 0;		/* too.  8-Jul-86 */

			}
			pDph_t->trillclosed = 0;
			if (++(pDph_t->trillcount) > TRILL_CYCLE)
				pDph_t->trillcount = 0;
		}
	}
#endif	/* #ifdef SPANISH */

	/* * * * * * * * * * * * * * */
	/* Reduce AV if glstop:   	 */
	/* * * * * * * * * * * * * * */

	if (pDph_t->parstochip[OUT_AV] > 6)
	{
		pDph_t->parstochip[OUT_AV] -= pDph_t->avglstop;
#ifdef NEW_INTONATION
		pDph_t->parstochip[OUT_AV] += pDph_t->avcreek;
#endif
	}

	/* * * * * * * * * * * * * * */
	/* Source spectral tilt:  	 */
	/* * * * * * * * * * * * * * */

	/* The source spectrum becomes less smooth as F0 decreases if */
	/* F0 is less than 1400 Hz*10                                 */
	/* E.g.:  F0    Tilt (Assumes FT = 100 for Paul)              */
	/* 600       0                                                */
	/* 800       0                                                */
	/* 1000       2                                               */
	/* 1200       8                                               */
	/* 1400      12                                               */
	/* 1600      12                                               */
	/* (don't count glstop, i.e. do after this code)              */
	// eab Note aboive table is for old tilt filter 2/12/99

	parp = &(pDph_t->parstochip[OUT_TLT]);	/* Where it goes.       */

/* Spdef par FT -> 0 < f0_dep_tilt < 100, temptilt = 1/40 (max) of 1400-f0 */
	/* This code is not good put in a temp improvement til tom's stuff done
	EAB		7/13/98			BATS 711 */
	if (pDph_t->malfem == MALE)
	{
		temptilt = frac4mul ((pDph_t->f0-900), pDph_t->f0_dep_tilt);
	}
	else
	{
		temptilt = frac4mul (( pDph_t->f0 -1850), pDph_t->f0_dep_tilt);
	}
		
if (temptilt < 0)
		temptilt = 0;
	//EAB		7/13/98			BATS 711 
	//temptilt = 12 - temptilt;		   /* Reverse sign of this effect */
	if (temptilt < 0)
		temptilt = 0;
	temptilt = temptilt>>1; /* reduce effect until we do the new tilt stuff*/
#ifdef GERMAN
		if(pDph_t->allophons[pDphsettar->np_drawt0] == IH)
	{
	temptilt +=3;	
	}
#endif

	*parp += temptilt;
	//EAB		7/13/98			BATS 711 
#ifdef AD_BASE
	*parp += pDph_t->spdeftltoff;
#else
	*parp += pDph_t->spdeftltoff-6;
#endif
	/* Use -6 to allow higher tilts eab TILT IS A MESSS FULL OF UNKNOWN FUDGE FACTORS LIKE THIS -6
	AND IN GENERAL TOO STRONG, TOM HAS FOUND THE TILT FILTER TO HAVE TERRIBLE CHARACTERISTICS SO
	I'M DOING A QUICK FIX FOR NOE WHICH WILL BE MUCH REFINED WHEN TO CAN IMPLEMENT THE NEW FILTER TO ALL THE PLATFORMS*/

	/* eab tilt down for an RR eab 3/5/98 Not seen in oliver's data 
	so I removed rr tilt*/


	/* Breathy offset special code */
	if (pDph_t->breathysw == 1)
	{								   /* Set in ph_setar.c */
		if (pDph_t->parstochip[OUT_AV] > 40)
		{							   /* Do only if AV on  */
			/* Add aspiration to voicing */
			if (pDphsettar->breathyah < 27)
			{
				pDphsettar->breathyah += 2;		/* asp increase 32 db/100 ms */
			}
			value = frac4mul (pDph_t->spdeflaxprcnt, (pDphsettar->breathyah ));
	
#ifndef UPGRADE1999
			if (pDph_t->parstochip[OUT_AP] < value)
			{
#if defined (ENGLISH_US) || defined (GERMAN)
				/* This code overidres the tspesh code causes aspiration to die 
				at voicing onset the old assumption that you didn't have aspiration during voicing */
				pDph_t->parstochip[OUT_AP] += value;
#endif
#ifdef SPANISH
				pDph_t->parstochip[OUT_AP] =  value; 
#endif //SPANISH
			}
#endif
#ifdef DEL_AV
	pDph_t->del_av = 0;
	if (pDph_t->malfem == FEMALE) {
	    if ((pDph_t->parstochip[OUT_AV] > 40) && (pDph_t->parstochip[OUT_T0] > 225)) {
	        pDph_t->del_av = (pDph_t->parstochip[OUT_T0] - 225)>>3;
	    }
	}
	else {
	    if ((pDph_t->parstochip[OUT_AV] > 40) && (pDph_t->parstochip[OUT_T0] > 370)) {
		pDph_t->del_av = (pDph_t->parstochip[OUT_T0] - 370)>>3;
	    }
	}
	if (pDph_t->del_av > 0) {
	    if (pDph_t->del_av > 8)    pDph_t->del_av = 8;
	    pDph_t->parstochip[OUT_AV] -= pDph_t->del_av;
	    if (pDph_t->parstochip[OUT_AP] >= pDph_t->del_av) {
		pDph_t->parstochip[OUT_AP] -= pDph_t->del_av;
	    }
	}
#endif //DEL_AVs


				
			/* Tilt down voicing spectrum */
			if (pDphsettar->breathytilt < 16)
			{
				pDphsettar->breathytilt += 1;	/* tilt decrease 16 dB/100 ms */
			}
			*parp += frac4mul (pDph_t->spdeflaxprcnt, pDphsettar->breathytilt);
#ifdef DEBUGPHT
#if defined (WIN32) && defined (PRINTFDEBUG)
				WINprintf("til2=%d \n",*parp);
#endif
#endif
		}
	}
	else
	{
		/* Zero or initialize all breathyness variables */
		pDphsettar->breathyah = 0;
		pDphsettar->breathytilt = 0;
	}

	/* Source tilt can't be more than 31 dB */
	if (*parp > 31)
	{
		*parp = 31;
	}
	if (*parp < 0)
	{
		*parp = 0;
	}
	if(*parp > 18)
#ifdef DEBUGPHT
#if defined (WIN32) && defined (PRINTFDEBUG)
	WINprintf("til3=%d \n",*parp);
#endif
#endif
#ifdef OPENQ

/*  OPEN QUOTIENT (pDph_t->oqtarget is set in PHCLAUSE.C from alloopenq[] */
/*    which is an array set in PHINTON.C) */
/*    Move toward target, rate of change is 2 percent every 6.4 msec */

	if (pDph_t->openquo < pDph_t->oqtarget) 
	{
	         pDph_t->openquo++;
	    if (pDph_t->openquo < pDph_t->oqtarget) {
		     pDph_t->openquo++;
	    }
	}
	else if (pDph_t->openquo > pDph_t->oqtarget) 
	{
			pDph_t->openquo--;
	    if (pDph_t->openquo > pDph_t->oqtarget) 
		{
			pDph_t->openquo--;
	    }
	}
#endif //OPENQ
#ifdef NEW_VTM
	pDph_t->parstochip[OUT_OQ] = pDph_t->openquo;  /* Add speaker dependent offset */
#endif




	/* I think this should be in verify with oliver*/
#if defined (ENGLISH_US) || defined (SPANISH) || defined (GERMAN)
	/* Compensate for loudness decrease when strongly tilted */
	if (pDph_t->parstochip[OUT_AV] > 3)
	{
		temptilt = (*parp >> 2) - 4;
		if (temptilt < 0)
			temptilt = 0;			   /* tilt must be 20 or more */
		pDph_t->parstochip[OUT_AV] += temptilt;

		
	}
#endif


#ifdef GERMAN

	/* eab 6/25/98 cleanup*/
	//EAB		7/13/98			BATS 711 
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* if current phone is uvular /RR/, modulate several parameters      */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* EAB boolean true false in r_mod simply defines whether we're done and it's
	 time to increment the counter*/


	if (pDph_t->allophons[pDphsettar->np_drawt0] == KH)
	{
	
		r_modulation (phTTS,pDph_t->param[A2].outp, N10PRCNT, FALSE);
		r_modulation (phTTS,pDph_t->param[A3].outp, N20PRCNT, FALSE);
		r_modulation (phTTS,pDph_t->param[AV].outp, N8PRCNT, TRUE);
	}

	else if (pDph_t->allophons[pDphsettar->np_drawt0] == RR)
	{
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
		{

			r_modulation (phTTS,pDph_t->param[AB].outp, 0, FALSE);
			r_modulation (phTTS,pDph_t->param[AV].outp, N5PRCNT-300, FALSE);
			r_modulation (phTTS,pDph_t->param[A2].outp, N20PRCNT, FALSE);
			r_modulation (phTTS,pDph_t->param[A3].outp, N20PRCNT, TRUE);
		}
		else
		{
			r_modulation (phTTS,pDph_t->param[AB].outp, 0, FALSE);
			r_modulation (phTTS,pDph_t->param[AV].outp, N5PRCNT, FALSE);
			r_modulation (phTTS,pDph_t->param[A2].outp, N10PRCNT, FALSE);
			r_modulation (phTTS,pDph_t->param[A3].outp, N10PRCNT, TRUE);
		}

	}
	else
		/* Initialiatize the modulation counter eab 2/6/98*/
 		pDph_t->modulcount =0;


#endif



#ifdef SPANISH
		
/* eab 6/25/98 cleanup in AD and RND Old code that helps nothing */
	 
	if (pDph_t->allophons[pDphsettar->np_drawt0] == E_R)
	{
		// NEW_SPANISH  EAB		7/13/98			BATS 711
		if(pDph_t->modulcount <=2)
		{
		r_modulation (phTTS,pDph_t->param[A2].outp, N10PRCNT, FALSE);
		r_modulation (phTTS,pDph_t->param[A3].outp, N20PRCNT, FALSE);
		r_modulation (phTTS,pDph_t->param[AV].outp, N10PRCNT, TRUE);
		}
	}
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
	/* if current phone is uvular /RR/, modulate several parameters      */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
	/* eab 2/14/97 Improve perception of rr by adding an av component*/
	else if (pDph_t->allophons[pDphsettar->np_drawt0] == E_RR)
	{
	
		// NEW_SPANISH  EAB		7/13/98			BATS 711
	
#ifdef SPANISH_LA
		r_modulation (phTTS,pDph_t->param[AV].outp, N10PRCNT, FALSE);
		r_modulation (phTTS,pDph_t->param[A2].outp, N20PRCNT, FALSE);
		r_modulation (phTTS,pDph_t->param[A3].outp, N20PRCNT, TRUE);
#endif
#ifdef SPANISH_SP
		r_modulation (phTTS,pDph_t->param[AV].outp, N20PRCNT, FALSE);
		r_modulation (phTTS,pDph_t->param[A2].outp, N20PRCNT, FALSE);
		r_modulation (phTTS,pDph_t->param[A3].outp, N20PRCNT, TRUE);
#endif

	
	}
	else
		/* Initialiatize the modulation counter eab 2/6/98*/
		pDph_t->modulcount =0;


#endif

	/* eab 12/12/96 Special code to allow for a burst + frication which occurs in the
	german sound TS the present code does not allow for this. This is a quick hack for 44
	until we're able to rewrite the burst/frication code in general This is not
	elegant but will work fine*/
#ifdef GERMAN
	/* eab 3/25/98 warning at high speeds this breaks*/
	if(pDphsettar->phcur == TS )
	{
		pDphsettar->delay_cnt++;
		if(pDphsettar->delay_cnt <5)
		{
				pDph_t->parstochip[OUT_A6]=0;
				pDph_t->parstochip[OUT_A5]=0;
				pDph_t->parstochip[OUT_A4]=0;
				pDph_t->parstochip[OUT_A3]=0;
				pDph_t->parstochip[OUT_A2]=0;
				pDph_t->parstochip[OUT_AB]=0;
		}

		else if(pDphsettar->delay_cnt ==5)
		{
				pDph_t->parstochip[OUT_A6]=0;
				pDph_t->parstochip[OUT_A5]=0;
				pDph_t->parstochip[OUT_A4]=0;
				pDph_t->parstochip[OUT_A3]=0;
				pDph_t->parstochip[OUT_A2]=0;
			//  CHANGES EAB		7/13/98			BATS 711 Way too hot!
				pDph_t->parstochip[OUT_AB]=53;
		}
	}
	else if( pDphsettar->phcur == TJ)
	{
		pDphsettar->delay_cnt++;
		if(pDphsettar->delay_cnt <5)
		{
				pDph_t->parstochip[OUT_A6]=0;
				pDph_t->parstochip[OUT_A5]=0;
				pDph_t->parstochip[OUT_A4]=0;
				pDph_t->parstochip[OUT_A3]=0;
				pDph_t->parstochip[OUT_A2]=0;
				pDph_t->parstochip[OUT_AB]=0;
		}

		else if(pDphsettar->delay_cnt ==5)
		{
				pDph_t->parstochip[OUT_A6]=55;
				pDph_t->parstochip[OUT_A5]=0;
				pDph_t->parstochip[OUT_A4]=50;
				pDph_t->parstochip[OUT_A3]=50;
				pDph_t->parstochip[OUT_A2]=0;
				pDph_t->parstochip[OUT_AB]=40;
		}
		else if(pDphsettar->delay_cnt ==6 )
		{
				pDph_t->parstochip[OUT_A6]=0;
				pDph_t->parstochip[OUT_A5]=40;
				pDph_t->parstochip[OUT_A4]=30;
				pDph_t->parstochip[OUT_A3]=30;
				pDph_t->parstochip[OUT_A2]=0;
				pDph_t->parstochip[OUT_AB]=0;
		}
		else if(pDphsettar->delay_cnt ==7 )
		{
				pDph_t->parstochip[OUT_A6]=0;
				pDph_t->parstochip[OUT_A5]=43;
				pDph_t->parstochip[OUT_A4]=33;
				pDph_t->parstochip[OUT_A3]=33;
				pDph_t->parstochip[OUT_A2]=0;
				pDph_t->parstochip[OUT_AB]=0;
		}
		else if(pDphsettar->delay_cnt ==8 )
		{
				pDph_t->parstochip[OUT_A6]=0;
				pDph_t->parstochip[OUT_A5]=46;
				pDph_t->parstochip[OUT_A4]=36;
				pDph_t->parstochip[OUT_A3]=36;
				pDph_t->parstochip[OUT_A2]=0;
				pDph_t->parstochip[OUT_AB]=0;
		}
		else if(pDphsettar->delay_cnt >= 9 && pDphsettar->delay_cnt <= 11 )
		{
				pDph_t->parstochip[OUT_A6]=0;
				pDph_t->parstochip[OUT_A5]=49;
				pDph_t->parstochip[OUT_A4]=39;
				pDph_t->parstochip[OUT_A3]=39;
				pDph_t->parstochip[OUT_A2]=0;
				pDph_t->parstochip[OUT_AB]=0;
		}
		else if(pDphsettar->delay_cnt >11)
		{
				pDph_t->parstochip[OUT_A6]=0;
				pDph_t->parstochip[OUT_A5]=50;
				pDph_t->parstochip[OUT_A4]=50;
				pDph_t->parstochip[OUT_A3]=45;
				pDph_t->parstochip[OUT_A2]=0;
				pDph_t->parstochip[OUT_AB]=0;
		}

	}
	else
			/* if phcur !=ts then reset count*/
		pDphsettar->delay_cnt =0;

	


	
#endif
#ifdef PH_DEBUG

/* DEBUG Code  verifies variables that should never hit 
	ceratin values  EAB 6/24/98*/

	if (pDph_t->parstochip[OUT_F1] < 200)
	{
		pDph_t->parstochip[OUT_F1] = 200;
	}
		
	if ((pDph_t->parstochip[OUT_T0] < 0)  ||
		   (pDph_t->parstochip[OUT_F1] < 0)  ||
		   (pDph_t->parstochip[OUT_F2] < 0)  ||
		   (pDph_t->parstochip[OUT_F3] < 0)  ||
		   (pDph_t->parstochip[OUT_FZ] < 0)  ||
		   (pDph_t->parstochip[OUT_B1] < 0)  ||
		   (pDph_t->parstochip[OUT_B2] < 0)  ||
		   (pDph_t->parstochip[OUT_B3] < 0)  ||
		   (pDph_t->parstochip[OUT_AV] < 0)  ||
		   (pDph_t->parstochip[OUT_AP] < 0)  ||
		   (pDph_t->parstochip[OUT_A2] < 0)  ||
		   (pDph_t->parstochip[OUT_A3] < 0)  ||
		   (pDph_t->parstochip[OUT_A4] < 0)  ||
		   (pDph_t->parstochip[OUT_A5] < 0)  ||
		   (pDph_t->parstochip[OUT_A6] < 0)  ||
		   (pDph_t->parstochip[OUT_AB] < 0)  ||
		   (pDph_t->parstochip[OUT_TLT] < 0 ))
		{
#ifndef UNDER_CE
		WINprint(" ERROR Negative value \n");
#endif
		}

	
#endif


#ifdef NEW_VTM

	/* eab 3/4/98 */
	/* eab same as before except new added parameters*/

		pDph_t->parstochip[OUT_GS] = pDph_t->spdefglspeed ;
#ifdef NEW_VOCAL_TRACT_NASAL
		if(pDph_t->parstochip[OUT_FZ] == 1050)
		{
			pDph_t->parstochip[OUT_FNP]=850; //labial nasal consonant
		}
		else if(pDph_t->parstochip[OUT_FZ] == 1800)
		{
			pDph_t->parstochip[OUT_FNP]=1025; //alevelar nasal consonant
		}
		else
		{
			pDph_t->parstochip[OUT_FNP] = 500; 
		}
#else
			pDph_t->parstochip[OUT_FNP] = 290; 
#endif
		
#ifdef GERMAN
	if(pDph_t->allophons[pDphsettar->np_drawt0] == RR)
	{
			pDph_t->parstochip[OUT_GS] += 1200;
	}



	if((featb[ pDph_t->allophons[pDphsettar->np_drawt0]] & FNASAL) IS_PLUS)
	{
		if(pDph_t->malfem == MALE)
		{
			/* eab 4/23/98 If phoneme is less than M then it's a nasalized french vowel*/
			if(pDph_t->allophons[pDphsettar->np_drawt0] <	M)
			{
				pDph_t->parstochip[OUT_GS] = 1400;
			}
			// 9/24/98 Increased gs from nasal to reduce "nasality per ginger"
			//request
			else
			{
				//  EAB		7/13/98			BATS 711
				pDph_t->parstochip[OUT_GS] = 1100;
			}
			
		}
		else
		{
				/* eab 4/23/98 If phoneme is less than M then it's a nasalized french vowel*/
			if(pDph_t->allophons[pDphsettar->np_drawt0] <	M)
			{
				pDph_t->parstochip[OUT_GS] = 1500;
			}
			else
			{
				pDph_t->parstochip[OUT_GS] = 1200;
			}
			
		}

	}
	if(pDph_t->allophons[pDphsettar->np_drawt0 ] == Z)
	{
		if (pDph_t->malfem == MALE)
		{
			pDph_t->parstochip[OUT_GS] = 700;
			pDph_t->parstochip[OUT_AP] = 20;
		}
		else
		{
			pDph_t->parstochip[OUT_GS] = 600;
			pDph_t->parstochip[OUT_AP] = 20;
		}

	}

		/* In a lateral like l av jumps whem mouth and tongue open tract*/
	if(pDph_t->allophons[pDphsettar->np_drawt0] == L )
	{
		pDph_t->parstochip[OUT_AV] -=6;
			/* BATS 690 There is evidently a slight discrepancy between where ph_draw
		thinks it is and where other parts of the code think they are, but this is too big
		to ponder now- this boiler plate will solve the problem*/
		if(pDph_t->parstochip[OUT_AV] <0)
			pDph_t->parstochip[OUT_AV]=0;
	}
	/* eab 4/23/98 Reduce av when a release schwa this code had the undesireable effect
	of reducing al occurrances of ex in  final position but it may be OKAY*/
	if ((pDph_t->allophons[pDphsettar->np_drawt0+1] == SIL)
		&& (pDph_t->allophons[pDphsettar->np_drawt0] == EX))

		pDph_t->parstochip[OUT_AV] -=3;


#endif	/* GERMAN*/
			// CHANGES EAB		7/13/98			BATS 711 All of this stuff
		    // needs to go into rnd code

#ifdef SPANISH

	
	if((featb[ pDph_t->allophons[pDphsettar->np_drawt0]] & FNASAL) IS_PLUS)
	{
		if(pDph_t->malfem == MALE)
		{				
			pDph_t->parstochip[OUT_GS] = 1500;

		}
		else
		{
			
			pDph_t->parstochip[OUT_GS] = 2500;
			
		}

	}

	


	if(pDph_t->allophons[pDphsettar->np_drawt0] == E_RR)
	{
			pDph_t->parstochip[OUT_GS] += 2200;
	}



	
	if(pDph_t->allophons[pDphsettar->np_drawt0 ] == E_Z)
	{
		if (pDph_t->malfem == MALE)
		{
			pDph_t->parstochip[OUT_GS] = 700;
			pDph_t->parstochip[OUT_AP] = 20;
		}
		else
		{
			pDph_t->parstochip[OUT_GS] = 600;
			pDph_t->parstochip[OUT_AP] = 20;
		}

	}

		
	if(pDph_t->allophons[pDphsettar->np_drawt0] == E_L )
		{
		
		pDph_t->parstochip[OUT_AV] -=3;
			/* BATS 690 There is evidently a slight discrepancy between where ph_draw
		thinks it is and where other parts of the code think they are, but this is too big
		to ponder now- this boiler plate will solve the problem*/
		if(pDph_t->parstochip[OUT_AV] <0)
			pDph_t->parstochip[OUT_AV]=0;
		}


	/* eab 4/23/98 Reduce av when a release schwa this code had the undesireable effect
	of reducing al occurrances of ex in  final position but it may be OKAY*/
	if ((pDph_t->allophons[pDphsettar->np_drawt0+1] == SIL)
		&& (pDph_t->allophons[pDphsettar->np_drawt0] == E_IX))
		pDph_t->parstochip[OUT_AV] -=3;

	if(pDph_t->allophons[pDphsettar->np_drawt0] == E_BH )
	{
		
		if (pDph_t->malfem == MALE)
		{
			pDph_t->parstochip[OUT_GS] = 1200;
		}
		else
		{
			pDph_t->parstochip[OUT_GS] = 1800;
			
		} 
	}




#endif	/* spanish*/
#endif /*NEW_VTM*/
#if (defined NOAA || defined ENGLISH_UK)
		/* eab 4/5/98 For 5.0 all languages should do this */
		/* In a lateral like l av jumps whem mouth and tongue open tract*/
			if(pDph_t->allophons[pDphsettar->np_drawt0] == LL)

				pDph_t->parstochip[OUT_AV] -=6;
				/* BATS 690 There is evidently a slight discrepancy between where ph_draw
		thinks it is and where other parts of the code think they are, but this is too big
		to ponder now- this boiler plate will solve hte problem */
		if(pDph_t->parstochip[OUT_AV] <0)
			pDph_t->parstochip[OUT_AV]=0;
	
#endif


#if (defined  AD_BASE) && !(defined NWS_LA ) && !(defined NWS_US )


		//temp test code eab 2/18/99 Under development
	if((featb[ pDph_t->allophons[pDphsettar->np_drawt0]] & FVOWEL) IS_PLUS)
		if(pDph_t->parstochip[OUT_BR] <= 40 )
			pDph_t->parstochip[OUT_BR] += 2;
		else
			if(pDph_t->parstochip[OUT_BR] >0)
				pDph_t->parstochip[OUT_BR] -=10;
			if(pDph_t->parstochip[OUT_BR] <0)
				pDph_t->parstochip[OUT_BR] = 0;
#endif




#ifdef PH_SWAPDATA
	
		j=sprintf(outbuf,"phdata%d",pDph_t->PHSwapCnt);
		j=sprintf(outbuf+j,".out");


        if (pDph_t->PHSwapIn == NULL && pDph_t->PHSwapOut == NULL)
        {
                pDph_t->PHSwapIn = fopen("phdata.in","rb");
				if(pDph_t->PHSwapIn == NULL)
				{
					pDph_t->PHSwapOut = fopen(outbuf,"wb");
					fprintf(pDph_t->PHSwapOut," AP   F1   A2   A3   A4   A5   A6   AB  TILT  T0   AV   F2   F3    FZ   B1   B2   B3       \r\n");
				}
                if (pDph_t->PHSwapIn != NULL)   fscanf(pDph_t->PHSwapIn," AP   F1   A2   A3   A4   A5   A6   AB  TILT  T0   AV   F2   F3   FZ   B1   B2   B3\r\n");
        }
        if (pDph_t->PHSwapOut != NULL) {
                for (ii = 0; ii < 24; ii++) {
                        fprintf(pDph_t->PHSwapOut,"%4d ",pDph_t->parstochip[ii]);
                }
                fprintf(pDph_t->PHSwapOut,"\r\n");
        }
        if (pDph_t->PHSwapIn != NULL) {
                for (ii = 0; ii < 24; ii++) {
                        fscanf(pDph_t->PHSwapIn,"%4d ",&pDph_t->parstochip[ii]);
                }
                fscanf(pDph_t->PHSwapIn,"\r\n");
                if (feof(pDph_t->PHSwapIn)) {
                        fclose(pDph_t->PHSwapIn);
                        pDph_t->PHSwapIn = fopen("phdata.in","rb");
                        fscanf(pDph_t->PHSwapIn," AP   F1   A2   A3   A4   A5   A6   AB  TILT  T0   AV   F2   F3   F4   FZ   B1   B2   B3   B4   PH   DU   DP  OPENQ FNP  FNF  GNF GSPD\r\n");
                }
        }

#endif
		
#ifdef PH_DEBUG
	if(DT_DBG(PH_DBG,0x020))
	{
	if( pDphsettar->phcur != 0)
	{
#ifdef DEBUGPHT
#if defined (WIN32) && defined (PRINTFDEBUG)
		WINprintf ("*phcur= %d \n", pDphsettar->phcur);
#else
		printf ("*phcur= %d \n", pDphsettar->phcur);
#endif
#endif
#ifndef UNDER_CE
		WINprintf ("phon= %d  ", (pDph_t->allophons[pDphsettar->np_drawt0]));
#endif
		for (ii = 0; ii<=24; ii++)			   /* EAB FOR REGRESSION TESTING */
		{
			WAIT_PRINT;
#if defined (WIN32) && defined (PRINTFDEBUG)
			WINprintf("%d ", pDph_t->parstochip[ii]);
#else
			printf("%d ", pDph_t->parstochip[ii]);
#endif
			SIGNAL_PRINT;
		}
		WAIT_PRINT;

#if defined (WIN32) && defined (PRINTFDEBUG)
		WINprintf ("\n");
#else
		printf ("\n");
#endif

		SIGNAL_PRINT;
	}
	}
#endif
	

}


#ifdef SPANISHone
/*
 *      Function Name: r_modulation()     
 *
 *  	Description: Sets parameters for the German r phoneme
 *
 *      Arguments: PDPH_T pDph_t,
 *				   short *formpointer, 
 *				   short percent, 
 *				   short bool
 *
 *      Return Value: void
 *
 *      Comments: Seems to be about the same as k_modulation; is used in phdraw()
 *					but k_modulation is not (don't know why).
 *
 */

void r_modulation (LPTTS_HANDLE_T phTTS,short *formpointer, short percent, short bool)
{
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
	short            arg1, arg2;		/* arguments for mlsh1 */

	arg1 = *formpointer;

#ifdef DBGRMO
	fprintf (stderr,
			 "\n(phdraw)modulating /RR/, modulcount:%d, percent:%d, old:%d\n",
			 modulcount, percent, *formpointer);
#endif

	switch ((bool == TRUE) ? pDph_t->modulcount++ : pDph_t->modulcount)
	{
	case 0:
		arg2 = percent >> 1;
		break;
	case 1:
		arg2 = percent;
		break;
	case 2:
		arg2 = percent >> 1;
		break;
	case 3:
		arg2 = -(percent >> 1);
		break;
	case 4:
		arg2 = -(percent >> 1);
		break;
	default:
		arg2 = -(percent >> 1);
		if (bool == TRUE)
		{
			pDph_t->modulcount = 0;
		}
	}
	/* switch */
	*formpointer += mlsh1 (arg1,arg2);

#ifdef DBGRMO
	fprintf (stderr, "\tnew value: %d\n", *formpointer);
#endif
}
/* r_modulation */
#endif

#ifdef SPANISH 
	// R_MOD CHANGES EAB		7/13/98			BATS 711
/*
 *      Function Name: r_modulation()     
 *
 *  	Description: Sets parameters for the Spanish r phoneme
 *
 *      Arguments: PDPH_T pDph_t,
 *				   short *formpointer, 
 *				   short percent, 
 *				   short bool
 *
 *      Return Value: void
 *
 *      Comments: Seems to be about the same as k_modulation; is used in phdraw()
 *					but k_modulation is not (don't know why).
 *
 */

void r_modulation (LPTTS_HANDLE_T phTTS,short *formpointer, short percent, short temp)
{
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
	short  arg1, arg2;		/* arguments for mlsh1 */

	arg1 = *formpointer;
	/* EAB I SEE TOO KINDS OR R ONE TAPPED THE OTHER SIMPLE S DEVOIED REGION BOTH SEE IN THE SAME 
	ENVIROMENTS--WHAT TO DO???? WAITING FOR JUAN'S RETURN*/

	
	switch (pDph_t->modulcount)
	{
	case 0:
		arg2 = -(percent);
		break;
	case 1:
		arg2 = -(percent);
		break;
	case 2:
		arg2 = -(percent);
		break;
	case 3:
		arg2 = 0; //percent;
	
		break;
	case 4:
		arg2 = 0;//percent ;
	
		break;
	case 5:
		arg2 =  0;//percent;
		break;
	case 6:
		arg2 = 0;//percent;
		break;
	case 7:
		arg2 = -(percent);
	
		break;
	case 8:
		arg2 = -(percent);
		break;
	case 9:
		arg2 = -(percent);
		break;
	case 10:
		arg2 = 0;//(percent);
		break;
	case 11:
		arg2 = 0;//(percent);
		break;
	case 13:
		arg2 =  0;//percent;
		break;
	case 14:
		arg2 = 0;//-(percent);
		
		break;
	case 15:
		arg2 = -(percent);
		break;
	case 16:
		arg2 = -(percent);
		break;
	default:
		arg2 = -(percent);
		if (temp == TRUE)
		{
			pDph_t->modulcount=-1;
		}
	}

	*formpointer += mlsh1 (arg1,arg2);
	//ph_t->parstochip[OUT_AV] += 3;
	if (temp == TRUE)
	{
		pDph_t->modulcount++;
	}
}
/* r_modulation */
#endif /*SPANISH*/


#ifdef SPANISHunvoiced
/*
 *      Function Name: r_modulation()     
 *
 *  	Description: Sets parameters for the Spanish r phoneme
 *
 *      Arguments: PDPH_T pDph_t,
 *				   short *formpointer, 
 *				   short percent, 
 *				   short bool
 *
 *      Return Value: void
 *
 *      Comments: Seems to be about the same as k_modulation; is used in phdraw()
 *					but k_modulation is not (don't know why).
 *
 */

void r_modulation (LPTTS_HANDLE_T phTTS,short *formpointer, short percent, short temp)
{
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
	short            arg1, arg2;		/* arguments for mlsh1 */

	arg1 = *formpointer;

	switch (pDph_t->modulcount)
	{
	case 0:
		arg2 = -(percent);
		break;
	case 1:
		arg2 = -(percent);
		break;
	case 2:
		arg2 = -(percent);
		break;
	case 3:
		arg2 = percent;
		pDph_t->parstochip[OUT_AP] = 30;
		pDph_t->parstochip[OUT_AB] = 60;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 4:
		arg2 = -(percent) ;
		pDph_t->parstochip[OUT_AP] =20;
		pDph_t->parstochip[OUT_AB] =40;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 5:
		arg2 =  -(percent);
		break;
	case 6:
		arg2 = -(percent);
		break;
	case 7:
		arg2 = percent>>1;
		pDph_t->parstochip[OUT_AP] =15;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 8:
		arg2 = -(percent);
		pDph_t->parstochip[OUT_AP] =10;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 9:
		arg2 = -( percent);
		break;
	case 10:
		arg2 = -(percent);
		break;
	case 11:
		arg2 = -(percent);
		break;
	case 13:
		arg2 =  percent>>1;
		pDph_t->parstochip[OUT_AP] =25;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 14:
		arg2 = -(percent);
		pDph_t->parstochip[OUT_AP] = 10;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 15:
		arg2 = -(percent);
		break;
	case 16:
		arg2 = -(percent);
		break;
	default:
		arg2 = -(percent);
		if (temp == TRUE)
		{
			pDph_t->modulcount=-1;
		}


	}
	
	*formpointer += mlsh1 (arg1,arg2);
	if(pDph_t->modulcount <= 6)
	{
		pDph_t->parstochip[OUT_AV]=0;
	}
	
	if (temp == TRUE)
	{
		pDph_t->modulcount++;
	}
}
/* r_modulation */
#endif /*SPANISH*/


#ifdef GERMAN
/*
 *      Function Name: r_modulation()     
 *
 *  	Description: Sets parameters for the German r phoneme
 *
 *      Arguments: PDPH_T pDph_t,
 *				   short *formpointer, 
 *				   short percent, 
 *				   short bool
 *
 *      Return Value: void
 *
 *      Comments: Seems to be about the same as k_modulation; is used in phdraw()
 *					but k_modulation is not (don't know why).
 *
 */
 			// R_MOD CHANGES EAB		7/13/98			BATS 711

void r_modulation (LPTTS_HANDLE_T phTTS,short *formpointer, short percent, short temp)
{
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	short            arg1, arg2;		/* arguments for mlsh1 */

	arg1 = *formpointer;

#ifdef DBGRMO
	fprintf (stderr,
			 "\n(phdraw)modulating /RR/, modulcount:%d, percent:%d, old:%d\n",
			 modulcount, percent, *formpointer);
#endif

	switch (pDph_t->modulcount)
	{
	case 0:
		arg2 = -(percent);
		break;
	case 1:
		arg2 = -(percent);
		break;
	case 2:
		arg2 = -(percent);
		break;
	case 3:
		arg2 = percent;
		pDph_t->parstochip[OUT_AP] = 35;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 4:
		arg2 = -(percent) ;
		pDph_t->parstochip[OUT_AP] =25;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 5:
		arg2 =  -(percent);
		break;
	case 6:
		arg2 = -(percent);
		break;
	case 7:
		arg2 = percent>>1;
		pDph_t->parstochip[OUT_AP] =30;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 8:
		arg2 = -(percent);
		pDph_t->parstochip[OUT_AP] =25;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 9:
		arg2 = -( percent);
		break;
	case 10:
		arg2 = -(percent);
		break;
	case 11:
		arg2 = -(percent);
		break;
	case 13:
		arg2 =  percent>>1;
		pDph_t->parstochip[OUT_AP] =25;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 14:
		arg2 = -(percent);
		pDph_t->parstochip[OUT_AP] = 20;
		if ((featb[ pDph_t->allophons[(pDphsettar->np_drawt0-1)]] & FVOWEL) IS_PLUS)
			pDph_t->parstochip[OUT_AP] -=5;
		break;
	case 15:
		arg2 = -(percent);
		break;
	case 16:
		arg2 = -(percent);
		break;
	default:
		arg2 = -(percent);
		if (temp == TRUE)
		{
			pDph_t->modulcount=-1;
		}
	}
		if (temp == TRUE)
		{
			pDph_t->modulcount++;
		}

	/* switch */
	*formpointer += mlsh1(arg1,arg2);



#ifdef DBGRMO
	fprintf (stdeo, "\tnew value: %d\n", *formpointer);
#endif
}
/* r_modulation */
#endif



/***********************************end of ph_draw.c********************************************/
