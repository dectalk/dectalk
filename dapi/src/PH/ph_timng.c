/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997 All rights reserved.
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
 *    File Name:    ph_timng.c
 *    Author:       Dennis Klatt
 *    Creation Date:01-SEP-1984
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------
 * 0001 DK		09/01/1984     	Initial creation
 * 0002 DGC		12/27/1984      Modified for the 80186.
 * 0003 DGC		06/02/1985		Added some conditional calls to the "mstofr"
 *          					routine. Some of the conversions from MS to
 *          					frames caused overflow on 16 bit machines.
 * 0004 DK		02/26/1985      [nt] cluster too long
 * 0005 DK		03/18/1985      period pause and comma pause code had a bug
 * 0006 DK		03/25/1985      Let phrase-final lengthening apply to word before prep
 * 0007 DK		04/17/1985      Reduce compound shortening and short-word lengthening
 * 0008 DK		04/23/1985      Word-final fricatives longer
 * 0009 DK		04/25/1985      Final lengthing before preposition only at slow sprate
 * 0010 DK		05/15/1985      Fix [nt] cluster reduction to happen only at word end
 * 0011 DK		05/17/1985      Make word-init stressed vowels longer, final ptk shorter
 * 0012 DK		05/23/1985	    Word-initial vowels not quite so short, less vowel
 *           					lengthening induced by postvoc voiced fric
 * 0013 DK		06/20/1985      Fix nasal durs for "pense,pen,pend"
 * 0014 EAB		01/16/1990      Allow speaking rate to 550 word per min. (from 350)
 * 0015 EAB		07/25/1990	    ADDED CHANGE TO ALLOW VARIABLE SETTING OF COMMA PAUSE
 *          					FOR NANCY JARRELL OF CHB TO GET IT TO ZERO. NOTE
 *          					-300 SETTING OF COMPAUSE ALLOWS SETTING TO ZERO BUT
 *          					THE CODE HAS NOT BEEN CHECKED FOR ERRORS.
 *
 *              DURATION RULES
 * 0016 EAB		05/03/1993      ADDED NEW PHONE DF TO DIFFERENTIATE T FROM D FLAP
 *                             	and added rules to make use of it.
 * 0017 EAB		05/02/1993      restrucutred a bunch of stuff-reduced
 *
 * 0018 EAB 	05/02/1993      ADDED PETROCELLI'S NEW DURATION RULES.
 * 0019 MGS		03/26/1996     	Merged win 95 code to 42c
 * 0020 MGS 	04/01/1996     	Added MSDBG statements for debugging
 * 0021 MGS		04/02/1996     	made sure all local variable are initialized
 * 0022 MGS		06/06/1996		moved phtiming to p_us_tim.c
 * 0023 MGS		06/06/1996		Changed file name from phtiming.c to ph_timng.c
 * 0024 SIK		07/08/1996  	Cleaning up and maintenance
 * 0025 EDB		01/10/1997		Set sprat0 to 100 for German
 * 0025 EAB		02/10/1997		Adjust the timing section of the code to make it more of a common code base
 * 0026 EAB		02/11/1997		Adjust the timing based on Barabara's perception it was slightly fast
 * 0027	MGS		08/26/1997		Merged in fasttalk
 * 0028 EAB     10/7/97         Modified to improve slow speaking rates(< 75 wpm)
 * 0029	EAB		10/13/97		Removed redundant checks and obsolete code
 *								also comment the dummy rate check code.(checked in deadstop() call in ph_task.c)						
 * 0030	EAB		12/12/97		adjust speak rate for UK_English
 * 0031 EAB		2/3/97			Needed to re-adjust speaking rate after tuning BATS 589
 * 0032 EAB		3/20/98         German speedup no longer needed after tuning eab 3/20/98 
								Rate will be calibrated later
 * 0033 EAB     2/3/99			EAB First pass at tuning refernece rate for x timed rythm
 * 0034 EAB		2/10/99			EAB slow down slighlty for release later check durations......
 */
/* #define MSDBG4 */
/* #define MSDBG5 */
/* #define EABDEBUG  */
/* #define  MSDEBUG */

#include "ph_def.h"

/***************************************************************************/
/* MVP: The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                */
/* extern short allophons[];   Integer rep of phonetic string              */
/* extern short allofeats[];   Structural features                         */
/* extern short allodurs[];    Duration in frames for each phone           */
/* extern short nallotot;      Number of phones in phonetic string         */
/* Arguments for fractional multiply instruction                           */
/* 		mlsh1(pDph_t->arg1,pDph_t->arg2) and                               */
/* 		muldv(pDph_t->arg1,pDph_t->arg2,pDph_t->arg3)       			   */	
/* extern short arg1,arg2,arg3;                                            */
/* extern short *user_durs;    User-specified durations (optional)         */
/* extern FLAG  newparagsw;    If 1, pause before this clause long         */
/* extern short f0mode ;                                                   */
/* extern short compause;      Extra pause at comma, user set by :dv       */
/* extern short perpause;      Extra pause at period,   "                  */
/* extern S32 longcumdur;     For waveform simulation printout             */
/* extern int asperation;                                                  */
/***************************************************************************/

/* Output variables */

/*
 * Tables located in language specific files
 * P_US_ROM.C, P_SP_ROM.C, P_GR_ROM.C
 */
extern short inhdr[];	   /* Inherent duration for each phone */
extern short mindur[];	   /* Minimum duration for each phone  */
extern short featb[];	   /* Phonetic features                */


#define   BASE_ASP			500
#define   MAX_ASP_COMMA     (8)
#define   MIN_ASP_COMMA     (-4)
#define   MAX_ASP_PERIOD    (20)
#define   MIN_ASP_PERIOD    (-10)


/* MVP : static function prototypes */
static void init_timing (LPTTS_HANDLE_T phTTS);

/* static short sprlast; *//* Sprate during last clause        */
/* static short sprat1; *//* Sprate factor for pauses and deldur   */
/* static short sprat2; *//* Sprate factor for segments        */
/* static short emphasissw; */
/* static short prcnt,durinh,durmin,deldur,nphon; */
/* static short pholas,struclas,fealas; */
/* static short phocur,feacur,feasyllabiccur; */
/* static short struccur,strucboucur,strucstresscur,strucstressprev; */
/* static short phonex,strucnex,feanex; */
/* static short dpause,sprat0,durxx,posvoc,nrises_sofar; */

/* commented out as unused var - 8/9/95  JDB static short durmax; */

/*
 *  Asperation is used to dynamically adjust the comma and period
 *  pauses based on what has come before it.
 */

#include "ph_time1.c"	/* file to catch the language dependent code for phtiming */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* I N I T - T I M I N G                */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/*
 *      Function Name: init_timing()
 *
 *  	Description:
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
static void init_timing (LPTTS_HANDLE_T phTTS)
{
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
	
	if (pKsd_t->sprate != pDphsettar->sprlast)
	{
	/* eab 2/10/97 These are older limits no need noit to have all have same limits
	the US and Spanish used to be 120 and 550*/
		// 033 EAB     2/3/99			EAB First pass at tuning refernece rate for x timed rythm
#ifdef ENGLISH 
	pDph_t->timeref=13000/pKsd_t->sprate; //stressed timed language
#endif
#ifdef GERMAN
	pDph_t->timeref=12000/pKsd_t->sprate; //stressed timed language
#endif
#ifdef SPANISH
		pDph_t->timeref=6000/pKsd_t->sprate; //syllable timed language
#endif


/* EAB/GL  10/19/1997,  dummy checking, rate have been checked in deadstop() call in ph_task.c
		if (pKsd_t->sprate < 75)
			pKsd_t->sprate = 75;
		else if (pKsd_t->sprate > 600)
			pKsd_t->sprate = 600;
*/
		pDphsettar->sprlast = pKsd_t->sprate;

		/* Linearize (calibrate) high speaking rates by a fudge */
		/* Tuned to perform on 300 word standard passage published on p. 114 of G. Fairbanks ^^Voice and Articulation Drill Book^^ */
		if (pKsd_t->sprate > 250)
		{
			pDphsettar->sprat0 = 250 + ((pKsd_t->sprate - 250) >> 1);
		}
		else
		{
			pDphsettar->sprat0 = pKsd_t->sprate;
        }
#ifdef SPANISH
		pDphsettar->sprat0 = pKsd_t->sprate-12; //slow down slightly per CHRIS
#endif
#ifdef ENGLISH_UK
		/*eab 12/12/97 adjust so that 200 is "normal speaking
		rate as measured with real speakers 2/3/98 further adjustment needed this
		this breaks slowtalk for UK the problem is with the definition of inherent duration
		which I believe I understand how dennis obtained the better fix later is to increase inherent durations
		I believe BATS 589*/
			
		pDphsettar->sprat0 -= 40;
		if(pDphsettar->sprat0 <= 65)
			pDphsettar->sprat0=65;
#endif
/* German speedup no longer needed after tuning eab 3/20/98 Rate will be calibrated later*/
/* still slightly too slow so I will speed up here eab 2/14/900 */
#ifdef GERMAN
	pDphsettar->sprat0 += 30;
#endif
	
#ifdef SLOWTALK
		/*EAB 9/97 AT slower speeds unvoice glotal stops should be added rather than
		sounding like a retard rate goes below 100 sprat0 doesn't*/
		if (pDphsettar->sprat0 < 75)
			pDphsettar->sprat0 = 75;
#endif
		/* For pDphsettar->sprat0 = 300, sprat1 = 0.4, sprat2 = 0.56 */
		/* For pDphsettar->sprat0 = 240, sprat1 = 0.7, sprat2 = 0.8  */
		/* For pDphsettar->sprat0 = 180, sprat1 = 1.0, sprat2 = 1.0  */
		/* For pDphsettar->sprat0 = 120, sprat1 = 1.5, sprat2 = 1.25 */

		/* Effect of speaking rate on additive pauses (sprat1) */
		if (pDphsettar->sprat0 >= 180)
		{
			pDph_t->arg3 = 220;
	

		pDph_t->arg2 = 425 - pDphsettar->sprat0;


		}
		else
		{
			pDph_t->arg3 = 120;
			pDph_t->arg2 = 300 - pDphsettar->sprat0;

		}
		pDph_t->arg1 = FRAC_ONE;
		if (pDph_t->arg2 < 0)
			pDph_t->arg2 = 1;
		pDphsettar->sprat1 = muldv (pDph_t->arg1, pDph_t->arg2, pDph_t->arg3);

		/* Effect of sp. rate on compressible part of seg dur (sprat2) */
		if (pDphsettar->sprat0 > 180)
		{
			pDph_t->arg2 = 460 - pDphsettar->sprat0;
			pDph_t->arg3 = 280;
			if (pDph_t->arg2 <= 0)
				pDph_t->arg2 = 1;
			pDphsettar->sprat2 = muldv (pDph_t->arg1, pDph_t->arg2, pDph_t->arg3);
		}
		else
		{
			pDphsettar->sprat2 = ((unsigned) pDphsettar->sprat1 + FRAC_ONE) >> 1;
		}
	}
	/* Zero counters */

	/* nrises_sofar = 0; *//* Number of accent rises in clause sofar  */
	pDph_t->longcumdur = 0;
	/* pholas = SIL; *//* Moved to phtiming() */
	/* fealas = featb[SIL]; *//* Moved to phtiming() */
	/* struclas = 0; *//* Moved to phtiming() */
	/* emphasissw = FALSE;  *//* Moved to phtiming() */
}

/*
 *      Function Name: prdurs()
 *
 *  	Description:
 *
 *      Arguments: PDPH_T pDph_t,
 *				   short phocur,
 * 				   short durinh,
 *				   short durmin,
 *				   short deldur,
 *			       short prcnt,
 *				   int n)
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void prdurs (PDPH_T pDph_t, short phocur, short durinh,
			 short durmin, short deldur, short prcnt, int n)
{

#ifdef EABDEBUG
	if (n == 0)
	{
		printf ("phocur %d\n", phocur);
		printf (
				   "Init:inhdur=%3d durmin=%3d prcnt=%3d deldur=%3d\n",
				   ((durinh * NSAMP_FRAME) + 5) / 10, ((durmin * NSAMP_FRAME) + 5) / 10,
				   (prcnt * 100) / 128, ((deldur * NSAMP_FRAME) + 5) / 10);
	}
	else
	{
		printf ("phocur ");
		dologphoneme(phocur,0,0);
		printf("\n");
		printf (
				   "Rule %2d:       %3d        %3d       %3d        %3d\n",
				   n, ((durinh * NSAMP_FRAME) + 5) / 10, ((durmin * NSAMP_FRAME) + 5) / 10,
				   (prcnt * 100) / 128, ((deldur * NSAMP_FRAME) + 5) / 10);
	}
#endif
}

/*
 *      Function Name: prphdurs()
 *
 *  	Description:
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value:
 *
 *      Comments:
 *
 */
void prphdurs (PDPH_T pDph_t)
{

#ifdef   EABDEBUG
#ifdef   VERBOSE
	/* extern short *user_f0; *//* Moved to DPH_T structure MVP */
	short                   n, prf0;

    /*
	 * printf (
	 *		   "\nPHTIMING: Output %d allophones and associated durations in msec \n",
	 *		   pDph_t->nallotot);
	 */
	if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED)
	{
		printf (
				   "\n    User-specified f0 commands are present (see PHSORT output)");
	}
	/* printf("\nPhone     Dur    F0tar    Struc    Struc-names"); */
	for (n = 0; n < pDph_t->nallotot; n++)
	{
		prf0 = pDph_t->user_f0[n];
		/* if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED) prf0 = 0; printf("\n\t%s\  4d  %4d ", */
		printf ("allo=%d allodur %d\n", pDph_t->allophons[n], (((pDph_t->allodurs[n] * NSAMP_FRAME) + 5) / 10));
		/* feprint(pDph_t->allofeats[n]); */

		printf ("\n");
	}
#endif /* EABDEBUG */
#endif /* VERBOSE */
}
/***************************end of ph_timng.c*********************************/

