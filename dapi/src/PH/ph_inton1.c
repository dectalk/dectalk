/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997 All rights reserved.
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
 *    File Name:    ph_inton.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    FUNDAMENTAL FREQUENCY RULES
 *
 ***********************************************************************
 *    Revision History:
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 DK 		12/16/1984	    Initial creation
 * 0002 DGC		12/27/1984	    Version for 80186, use mstofr()
 * 0003 DK		01/09/1985	    Fix handling of user inputted f0 commands
 * 0004 DK		01/21/1985	    Fix bug causing f0 to drift down in long sentences
 * 0005 DK 		03/01/1985	    Reduce pitch gestures in a clause ended by "?"
 * 0006 DK		04/18/1985	    Try releasing final nasals into silence for intellig.
 * 0007 DK		04/25/1985	    Fix continuation rise so not too early
 * 0008 DK		05/17/1985    	F0 fall cannot occur too early in a long vowel
 * 0009 DK		06/14/1985     	Fix f0 fall for f0mode=HAT_LOCATIONS_SPECIFIED
 * 0010 DK		06/19/1985     	Fix insertion of dummy-vowel phoneme
 * 0011 MGS		03/25/1996    	Merged WIN 95 code to 42c 
 * 0012 MGS		04/01/1996    	Added MSDBG blocks
 * 0013 MGS		06/04/1996 		Merged Spanish with English 
 * 0014	MGS		06/06/1996 		Changed file name from phinton.c ph_inton.c
 * 0015 EDB		01/10/1997		Fix many data.
 * 0016 EAB     02/22/1997      Copied rule 3 was checked to make it work with new doitlater code in ph_aloph
 *								It has to be in twice so that the rules fire in the proper order i.e. otherwise
 *								rule 4 will fire before rule three in a normal ordering. Time eprmitting later
 *								thus may be able to be simplified.
 * 0017 EAB     04/9/1997		Fixed hat_rise fall phonemic markings see note below
 *                              Fixes BAT 346
 * 0018 EAB		04/18/1997		Completed mergte with 5.0 and French plus fixed a problem where somehow and extra line of code
 *								erroneuosly snuck in.
 * 0019 EAB     05/15/1997		Found that hat_rise hat_fall still didn't work and traced problem back to rewrite in1984
 *								I also removed uneeded restriction that a hat_rise couldn't operate if someone had already
 *								put in a hat rise. Let people do whatever they want aldo this removed the variable hatpos
 *								The code now assigns the hat rise or fall to the next phoneme that is FSYLL perhaps later
 *								we might want to open it up to FSONOR. Also night want to defferiate final fall effects from
 *								final hat fall and not have it automatic.
 *
 * 0020 KSB     05/20/1997      Moved f0 and place to gl_phones
 * 0021 EAB		06/02/1997		Fixed redundant line of code (looks like editing mistake) no no note at delete
 * 0022 EAB		09/08/1997		EAB Don't you DARE try to diff this with a previous version major surgery
 *								and this is only the beginning also this re-write removed the need for even odd 
 *								enforcement on commands so I removed the unnecessary code
 * 0023 EAB		12/12/1997		Modify code for UK_English
 * 0024 EAB		01/10/1997		Added length parameter to Make_f0_command glide will be the first command to use this.
 * 0025 EAB		01/22/1998		Modified UK English intonation rules per Caroline
 * 0026 EAB		01/22/1998		Put in a bit of a kludge so that last syllable gesture
 *								(rule 23) occurs on the last syllable as desired for UK English
 *								and not on last STRESSED syllable as in American English bats 575
 * 0027 EAB		02/10/1998      Submitted wrong version with a bug causing last gesture to be incorrect BATS 600
 * 0028	gl		03/25/1998		Added DBGV command for PH debug variable passing
 *								also add dectalkf.h to catch the defined symbol
 *								For BATS#639 to change phinton() to use argument phTTS instead of pDph_t
 * 0029 EAB		04/06/1998		#endif in wrong place at dummy_v_dur
 *`0030 EAB		06/28/1998		Modified intonation per input from  Michael needs to be verified
								upon his return
 * 0031 EAB		07/14/1998		BATS 713
 * 0032 EAB 	02/03/1999		Added in changes for multi lang NWS_NOAA
 * 0033 EAb		06/07/1999		BATS 897
 * 0034 NAL		04/14/2000		Fixed extern featb, begtyp, f0_phrase_position,
 *								f0_stress_level to match ph_rom.c files
 * 0035	CAB		10/18/2000		Fixed copyright info and formatted comments
 */
/* #define MSDBG4 */

#if (defined NWS_US) || defined ENGLISH_UK
#include "ph_def.h"

#define BEFORE_HAT_RISE		0
#define ON_TOP_OF_HAT		1
#define AFTER_FINAL_FALL	2
#define AFTER_NONFINAL_FALL	3
#define DONTKNOW 0
#define QUESTCLAUSE 1
#define VERBPHRASE	2
#define PERIODCLAUSE 3




/* 
 * Duration of the "dummy vowel" inserted after a clause-final stop.
 */
/* #define  DUMMY_V_DUR NF25MS      -- seems a bit long */
#define   DUMMY_V_DUR   NF15MS



/***************************************************************************/
/* MVP : The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                */
/* extern short allophons[];    Integer rep of phonetic string             */
/* extern short allofeats[];    Structural features                        */
/* extern short allodurs[];     Duration in frames for each phone          */
/* extern short nallotot;       Number of phones in phonetic string        */
/* extern short arg1,arg2,arg3; Used for muldv(pDph_t->arg1,pDph_t->arg2,pDph_t->arg3) */
/* extern short *user_f0;       User-specified f0 commands, optional       */
/* extern short *user_offset;   User-specified f0 command time offset      */
/* extern FLAG  newparagsw;    Make f0 higher initially if =1              */
/* Set to 0 here after raising f0              							   */
/* extern short f0mode;        State variable determine if rules used      */
/* extern short cbsymbol;      Equals QUEST if clause ends in ?            */
/* extern short assertiveness; Speaker def parameter                       */
/* extern short size_hat_rise; Speaker def parameter                       */
/* extern short scale_str_rise;Speaker def parameter                       */
/* extern short f0tar[];       F0 target commands, in Hz*10                */
/* extern short f0tim[];       Times between commands, in frames           */
/* extern short nf0tot;        Number of commands for cur clause           */
/***************************************************************************/

/* Input variables:                                                    */

/* Output variables:                                                   */

/* TABLES located in PH_ROM.C                                          */

//extern short *f0_stress_level;			/* F0 rise as f(stress-level)  	 */
//extern short *f0_phrase_position;		/* F0 rise as f(phrase-position) */
//extern short *featb;	   /* Phonetic features            */
//extern short *begtyp;
/* MVP : Static function declarations */
static void make_f0_command (PDPH_T pDph_t,short type, short rulenumber, short tar, short delay,
					  		 short length,short *psCumdur);
	

#ifdef GERMAN


/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent
 *  in a phrase */
//BATS 776 EAB 10/22/98 add values to arrays
//eab 2/26/00 -20 to compensate for increase in strength of stress_1 due to 
//misordering stress_2 was bigger than stress_1
//EAB ALSO ADJUST FOR FACT THAT KIEL IS 94 PERCENT OF TOTAL OR MPHRASE_STRESSLEVEL
short f0_phrase_position[] = {   91,  83, 76, 69,  63, 59, 55, 51, 49 };
/* Was: 210,  90, 40, 20 */

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */
/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
/*	change to new stress features in german DECtalk			*/
/*	order is changed to:						*/
/*	unstressed, STRESS_4, STRESS_2, STRESS_3, STRESS_1,		*/
/*		NOT USED, EMPHASIS, NOT USED				*/
/*	USED TO BE: readonly short f0_stress_level[] = {0, 71, 0, 281};	*/
/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
//short f0_mstress_level[] = {1, 11, 31, 21, 1, 1, 90, 1};
//EAB 2/27/00 Wow found that stress numbering was wrong...
short f0_stress_level[] = {0, 31, 11, 71, 0, 0, 0, 1};

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent
 *  in a phrase */
//EEAB REDO RICH DIDNOT ADJUST THIS TABLE TO KIEL 94 PERCENT RULE
short f0_fphrase_position[] = {   140, 112, 88, 71, 67, 54, 48 };
/* Was: 210,  90, 40, 20 */

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */
/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
/*	change to new stress features in german DECtalk			*/
/*	order is changed to: 0 ,1,2 */
/*	USED TO BE: readonly short f0_stress_level[] = {0, 71, 0, 281};	*/
/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
short f0_fstress_level[] = {0, 31, 11, 71, 0, 0, 0, 1};

#endif
 
#ifdef SPANISH_SP
 
/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */

short f0_mphrase_position[] =
{
	  /* First clause    Second clause  */
/* 300, 275, 250, 200, 175, 150, 50,50 last pos=0 causes bad problems */
	//300,275, 250, 200, 175, 150, 50, 50	   /* last pos=0 causes bad problems */
	120,85, 70, 50, 40, 30, 30, 30
};

/* 
 * F0 rise as f(stress-level); Order is
 *      FNOSTRESS       unstressed
 *      FSTRESS_1       primary stress
 *      FSTRESS_2       secondary stress
 *      FEMPHASIS       emphatic stress
 */


/* 0,       71,     31,    261 eab original stress */

short f0_mstress_level[] =
{
/* 'stress `stress "stress                      */
  /* 0,       51-10,     31-10,    161-50 */   /*eab  */
	0, 71, 41, 241					   /* eab original stress */
};
/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */
short f0_fphrase_position[] =
{
	  /* First clause    Second clause  */
/* 300, 275, 250, 200, 175, 150, 50,50 last pos=0 causes bad problems */
	300, 100+175, 200, 175, 150, 50, 50	   /* last pos=0 causes bad problems */
	//140,105, 90, 70, 60, 50, 50, 50
};
/* 
 * F0 rise as f(stress-level); Order is
 *      FNOSTRESS       unstressed
 *      FSTRESS_1       primary stress
 *      FSTRESS_2       secondary stress
 *      FEMPHASIS       emphatic stress
 */
/* 0,       71,     31,    261 eab original stress */
short f0_fstress_level[] =
{
/* 'stress `stress "stress                      */
  /* 0,       51-10,     31-10,    161-50 */  /*eab  */
	0, 121, 71, 261					   /* eab original stress */

};

#endif
 
#ifdef SPANISH_LA
 
/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */

short f0_mphrase_position[] =
{
	
	  /* First clause    Second clause  */
/* 300, 275, 250, 200, 175, 150, 50,50 last pos=0 causes bad problems */
	
	 110, 90, 60, 40, 20, 20 , 20, 20  

};

/* 
 * F0 rise as f(stress-level); Order is
 *      FNOSTRESS       unstressed
 *      FSTRESS_1       primary stress
 *      FSTRESS_2       secondary stress
 *      FEMPHASIS       emphatic stress
 */


/* 0,       71,     31,    261 eab original stress */

short f0_mstress_level[] =
{
/* 'stress `stress "stress                      */
	0, 51+20, 31+10, 261					   /* eab original stress */

};
/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */

short f0_fphrase_position[] =
{
	  /* First clause    Second clause  */
	300, 100+175, 200, 175, 150, 50, 50	   /* last pos=0 causes bad problems */

};

/* 
 * F0 rise as f(stress-level); Order is
 *      FNOSTRESS       unstressed
 *      FSTRESS_1       primary stress
 *      FSTRESS_2       secondary stress
 *      FEMPHASIS       emphatic stress
 */
short f0_fstress_level[] =
{
/* 'stress `stress "stress                      */
  	0, 121, 71, 261	
	

};

#endif


#ifdef ENGLISH_US


/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

//BATS 776 EAB 10/22/98 add values to arrays

short f0_mphrase_position[] =
{160, 90, 80, 70, 60, 50, 40,30};

/* Was: 210, 90, 40, 20 */

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired impulse
 * function */

short f0_mstress_level[] =
{1, 71, 31, 281 };

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

short f0_fphrase_position[] =
{ 100, 94, 88, 82, 77, 73, 64, 60 };

/* Was: 210,  90, 40, 20 */

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired impulse
 * function */

short f0_fstress_level[] =
{1, 71, 41, 311};


#endif


#ifdef ENGLISH_UK


short f0_mphrase_position[] = {
 100,  90,  80,  60,  40,  20,  0,  0 };

short f0_mstress_level[] = {
 1,  85,  51,  190,  0,  0,  0,  0 };

short f0_fphrase_position[] = {
 100,  90,  80,  60,  40,  20,  0,  0 };

short f0_fstress_level[] = {
 1,  90,  68,  210,  0,  0,  0,  0 };



#endif

#ifdef FRENCH


/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

//BATS 776 EAB 10/22/98 add values to arrays

short f0_mphrase_position[] =
{30, 40,  65, 60, 50, 45};

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired impulse
 * function */

short f0_mstress_level[] =
{1, 81, 51, 191 };

short f0_fstress_level[] =
{1, 91, 61, 221 };

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

short f0_fphrase_position[] =
{40, 50,  70, 70, 60, 55 };


/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired impulse
 * function */

short f0_stress_level [] = { 01, 71, 51, 281 };


#endif



/*
 *      Function Name: phinton()      
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
/* GL 03/25/1998,  BATS#639 use phTTS argument instead of pDph_t */
void phinton (LPTTS_HANDLE_T phTTS)
{

	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	short                   n;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;


	/* Automatic variables */
	short nphon = 0,nphontmp, mf0 = 0;
	short pholas = 0, struclas = 0, fealas = 0;
	short struccur = 0, feacur = 0, stresscur = 0;
	short phonex = 0, strucnex = 0, feanex = 0;
	short targf0 = 0, delayf0 = 0;
	short f0fall = 0;		/* Extra fall below baseline at end of clause */
	short nphonx = 0;		/* short temp is never used MVP */
	short cumdur = 0, phocur = 0;		/* MVP : made local */
	short inputscrewup = 0;	/* MVP : was of type FLAG */
	short lowrisesw;	
	short nextsylbou =0 ,nextwrdbou =0 ,nextphrbou =0;
	short issubclause = 0;   /* TRUE signals subordinate clause */
	short numvowels = 0;
	short NotQuest = 1;
	
	pDph_t->delta_special=0;
	pDphsettar->nrises_sofar = 0;
	pDphsettar->hatsize = 0;
	pDphsettar->hat_loc_re_baseline = 0;

	/* Beginning of initialization */
	inputscrewup = FALSE;
	cumdur = 0;
	pDph_t->had_hatbegin=0;
	pDph_t->had_hatend=0;
	pDph_t->nf0tot = 0;
	pholas = SIL;
	fealas = phone_feature( pDph_t,GEN_SIL);;
	struclas = 0;
	mf0 = 0;
#ifdef ENGLISH_UK
	pDph_t->prevtargf0 = -1; /* EAB 1/13/98 Want first target to end up plus
							also initalize completion flag */
	pDph_t->done =0;
#endif
	

	/* Should set nrises_sofar to zero after a ph_init=0 hard reset */
	/* End of initialization */

	/* MAIN LOOP, for each output phoneme */
#ifdef ENGLISH_UK
	/* Find last syllable nucleus*/
	/* EAB Part of BATS 600 nphon->nphontmp*/
		for(nphontmp=pDph_t->nallotot;nphontmp > 1;nphontmp--)
			{
			if ((phone_feature( pDph_t,pDph_t->allophons[nphontmp]] & FSYLL) IS_PLUS)
				break;
			}
#endif


	for (nphon = 0; nphon < pDph_t->nallotot; nphon++)
	{

		if (nphon > 0)
		{
			pholas = pDph_t->allophons[nphon - 1];
			struclas = pDph_t->allofeats[nphon - 1];
			fealas = phone_feature( pDph_t,pholas);
		}
		phocur = pDph_t->allophons[nphon];
		struccur = pDph_t->allofeats[nphon];

		stresscur = struccur & FSTRESS;
		feacur = phone_feature( pDph_t,phocur);
		if (nphon < (pDph_t->nallotot - 1))
		{
			phonex = pDph_t->allophons[nphon + 1];
			strucnex = pDph_t->allofeats[nphon + 1];
			feanex = phone_feature( pDph_t,phonex);
		}

		

		pDph_t->hatstatel = pDph_t->hatstate;	/* Remember previous state */
	    if (phocur == SIL) {
		pDph_t->hatstate = BEFORE_HAT_RISE;
		}
		if (feacur & (FVOWEL | WBOUND))
		{
			numvowels++;
		}
		        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

	/* These rules often want to know the type of boundary after the
	 *  current syllable, and the type of boundary after the current
	 *  word, and the type of boundary after the current phrase/clause.
	 */

/*	  Step 1, skip over word-initial consonants of this syllable */
	    nphonx = nphon;
	    while ((pDph_t->allofeats[nphonx] & FWINITC) IS_PLUS) {
		nphonx++;
	    }
/*	  Step 2, Look up boundary immediately after current syll */
	    nextsylbou = pDph_t->allofeats[nphonx] & FBOUNDARY;
/*	  Step 3, Try to make direct assignment of boundary after current word */
	    if (nextsylbou >= FWBNEXT) {
		nextwrdbou = nextsylbou;
	    }
/*	  Step 4, Look ahead if this is not a word-final syllable */
	    else {
		for (phonex=phonex+1;nphonx<pDph_t->nallotot; nphonx++) {
		    if ((nextwrdbou=pDph_t->allofeats[nphonx]&FBOUNDARY)>=FWBNEXT) {
			goto wbfound;
		    }
		}
            }
wbfound:
/*	  Step 5, Try to make direct assignment of boundary after curr phrase */
	    if (nextsylbou > FWBNEXT) {
		nextphrbou = nextwrdbou;
	    }
/*	  Step 6, Look ahead if this is not a phrase-final syllable */
	    else {
		for (phonex=phonex+1;nphonx<pDph_t->nallotot; nphonx++) {
		    if ((nextphrbou=pDph_t->allofeats[nphonx]&FBOUNDARY)>FWBNEXT) {
			goto fbfound;
		    }
		}
            }
fbfound:


        /* 
         *printf("special_phrase %d, stresscur %d, numvowels %d, NotQuest %d\n",
         * pDph_t->special_phrase,stresscur,numvowels,NotQuest); 
         */
        /* 
         * printf("phocur %d feacur %d struccur %d feanex %d phonex %d strucnex %d\n",
         * phocur,feacur,struccur,feanex,phonex,strucnex);  
         */
		/* Rule 0: User-specified commands for phoneme f0 targets or singing */

		if ((pDph_t->f0mode == PHONE_TARGETS_SPECIFIED)
			|| (pDph_t->f0mode == SINGING))
		{

			if (pDph_t->user_f0[nphon] != 0)
			{
				make_f0_command (pDph_t, USER,0, (2000 + pDph_t->user_f0[nphon]), 0, 0, &cumdur);
			}
			goto skiprules;
		}

		/* Rule 1: If at bottom of hat, goto top on +HAT_RISE +syllabic */
		
				/* EAB 4/9/97 Found a basic flaw whose error cause was generated a long time ago
		manual placed f0hat get ignores if the next thing isn't plus syllabic.Looking at
		the code it's hard to believe it ever worked all correctly. Looking at the tuning example I can
		not figure out how it could have ever wroked correctly. The first hat rise in the example 
		would have been seen but only becuase the next word started with a vowel.What it should do is
		remember that it has a hat_rise or hat_fall pending. and execute it at the next syllabic*/
		/* eab 9/7/97 If were in a real short phrase don;t doit*/

		if((struccur & FHAT_BEGINS) IS_PLUS && pDph_t->number_words > 2 )
			pDph_t->had_hatbegin= 1;
		if((struccur & FHAT_ENDS) IS_PLUS && pDph_t->number_words > 2)
			pDph_t->had_hatend= 1;

		if ((pDph_t->f0mode == NORMAL) || (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED))
		{


			if ((feacur & FSYLL) IS_PLUS)
			{
#ifdef ENGLISH_UK

			/*Code now works correcctly for UK placing gesture on last syllable
			not on last stresssed syllable as american english does*/

					
					if( pDph_t->number_words > 2  )
					{
						/* nphontmp is at the last vowel i.e. last syl nucleus*/
						if((pDph_t->nallotot -nphon) <6)
						{
							if (nphon == nphontmp)
							{
							//	make_f0_command (pDph_t,GLIDE, 23,-200, -(pDph_t->allodurs[nphon-1]), pDph_t->allodurs[nphon-1], &cumdur);
							//	make_f0_command (pDph_t,GLIDE, 23, +250, 0, pDph_t->allodurs[nphon], &cumdur);
								/*eab 6/5/98 chnage it to a rise fall which is more consistant with observed data*/
								make_f0_command (pDph_t,IMPULSE, 23,+280, -(pDph_t->allodurs[nphon-1]), pDph_t->allodurs[nphon-1], &cumdur);
								make_f0_command (pDph_t,GLIDE, 23, -200, 0, pDph_t->allodurs[nphon], &cumdur);
								pDph_t->done =1;
							}
						}
					}



			if(pDph_t->prevtargf0 >10  && pDph_t->prevnphon < nphon && !pDph_t->done) 
			/* eab 1/19/98 previous target was upglide so now we
										want to do a downglide */
				{
					pDph_t->prevtargf0 = -pDph_t->prevtargf0; 
					 targf0=(pDph_t->prevtargf0- (pDph_t->prevtargf0>>3));
					make_f0_command (pDph_t,GLIDE, 20,targf0 , -6,pDph_t->allodurs[nphon], &cumdur);
					make_f0_command (pDph_t,GLIDE, 21, pDph_t->prevtargf0>>3, pDph_t->allodurs[nphon],pDph_t->allodurs[nphon+1], &cumdur);
					goto skiprules;
				}
			

		
#endif				

				/* eab 4/9/97 BATS#346  use had_hatbegin instead of FHAT_BEGINS*/
				if (pDph_t->had_hatbegin)
	
				{

#if defined (ENGLISH) || defined (GERMAN) || defined (FRENCH)
					if (pDph_t->f0mode == NORMAL)
#endif
#ifdef SPANISH
					if (pDph_t->f0mode == NORMAL && !pDph_t->special_phrase)
#endif	
					

					{
						pDph_t->had_hatbegin=0;
						pDphsettar->hatsize = pDph_t->size_hat_rise;	/* speaker-def param */
						/* 
						 * PUT IN CODE TO REDUCE HATSIZE IN SHORTER OF 
						 * TWO HAT PATTERNS OF A SENTENCE 
						 */
						if (pDph_t->cbsymbol  || pDph_t->number_words <3 )
						{

							pDphsettar->hatsize >>= 2;		/* All gest reduced */

						}
					
	

						/* Begin gesture toward the end of the vowel if long */
#if defined ENGLISH || defined GERMAN || defined FRENCH
						/*	delayf0=0; EAB 2/21/97 Delayf0 = 0 deos not match comment and preliminary
						test suggest that comment is more correct than present code, but
						goes back to at least 1985, the Spanish code probably reflects what it originally
						was so this now it gets classified as new stuff to be evaluated. I have no clue
						when or who changed it */
						delayf0 = 0;
#endif
#ifdef SPANISH
						delayf0 = (pDph_t->allodurs[nphon] >> 1) - NF30MS;
#endif
						
						
					

						/* Begin gesture earlier if also hat fall on same vowel */
						if ((struccur & FHAT_ENDS) IS_PLUS)
						{
							delayf0 = -NF80MS;
						}


				make_f0_command (pDph_t,STEP, 1, pDphsettar->hatsize, delayf0,0, &cumdur);
			
					}
					else if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED)
					{
						pDphsettar->hatsize = ((pDph_t->user_f0[mf0] - 200) * 10) + 2;
						if ((pDphsettar->hatsize >= 2000) || (pDphsettar->hatsize <= 0)
							|| (inputscrewup == TRUE))
						{
							/* this is abort code for a goof*/
							pDphsettar->hatsize = 2;	/* Must be even, greater than 0 */
							logscrewup (phocur, &inputscrewup);
						}
						delayf0 = mstofr (pDph_t->user_offset[mf0]);
						mf0++;

						/* Make hat rise occur at user_dur ms re vowel onset */

						make_f0_command (pDph_t,STEP, 1, pDphsettar->hatsize, delayf0, 0, &cumdur);
						

					}

					pDphsettar->hat_loc_re_baseline += pDphsettar->hatsize;
						pDph_t->hatpos = AT_TOP_OF_HAT;
						pDph_t->hatstate = ON_TOP_OF_HAT;
				}

				if (pDph_t->special_phrase)
				{
					pDphsettar->nrises_sofar = 5;
				}

				if (issubclause)
				{
					pDphsettar->nrises_sofar = 3;
					issubclause = FALSE;
				}

				/* Rule 2: Add stress pulse to every stressed vowel, smaller pulse at end */
                targf0=0;



				if (!pDph_t->special_phrase && (stresscur & FSTRESS) IS_PLUS  )

				{					   /* Primary or emph */
					/* Make stress impulse prop. to degree of stress */
					/* and stress position relative to clause onset */
#ifdef NWS_US
				/* eab 11/19/97 emphatic stress in first position goes overboard due to
				stron first position value*/
				if(pDphsettar->nrises_sofar ==0 && stresscur ==3)
				{
					targf0 = f0_stress_level[stresscur]-200;
				}
				else
				{
					targf0 = f0_stress_level[stresscur];
				}
#else
				targf0 = f0_stress_level[stresscur];

#endif /*NWS_US*/

				targf0 += f0_phrase_position[pDphsettar->nrises_sofar];
#ifdef NWS_US /*maybe in all cases*/
				if (pDph_t->clausenumber == 0  && pDphsettar->lastbound==1) /*one == comma*/
					targf0 = targf0>>1;
				
				
#endif

					if (pDph_t->cbsymbol )
					{

						targf0 >>= 2;	/* All gestures reduced in ? */
					}
/* eab 2/21/97 EAB remove emphasisflag and associated stuff pulled see note in phsort.c */

					/* Begin gesture 1/4 of way into the vowel */

					delayf0 = (pDph_t->allodurs[nphon] >> 2) +4;

					/* Begin impulse much earlier when last stress of phrase */
					if (((struccur & FHAT_ENDS) IS_PLUS)
						|| ((struccur & FPERNEXT) IS_PLUS))
					{
						
						delayf0 = -NF20MS;
						

						targf0 = targf0 - Reduce_last; /*reduce last stres per anna */

						if (targf0 < 0)
							targf0 = 30;		/* don't hurt yourself */

					}
					/* Except when syllable is emphasized */
					if (stresscur == FEMPHASIS)
					{
						delayf0 = NF7MS;

					}

					if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED)
					{
						targf0 = ((pDph_t->user_f0[mf0] - 1000) * 10) + 1;	/* Odd */
						if ((targf0 >= 2000) || (targf0 <= 0)
							|| (inputscrewup == TRUE))
						{

							targf0 = 1;		/* Must be odd, gre ater than 0 */

							logscrewup (phocur, &inputscrewup);	
						}
						delayf0 = mstofr (pDph_t->user_offset[mf0]);
						mf0++;
					}

					/* Scale by speaker def paramter SR, unless emphasized */
					pDph_t->arg1 = pDph_t->scale_str_rise;
					if ((stresscur == FEMPHASIS) && (pDph_t->arg1 < 16))
					{
						pDph_t->arg1 = 16;
					}
					pDph_t->arg2 = targf0;
					pDph_t->arg3 = 32;
					targf0 = muldv (pDph_t->arg1, pDph_t->arg2, pDph_t->arg3);

					
#ifdef ENGLISH_UK
	
					/* 1/13/98 Rise on stressed syllable */
			
					if( pDph_t->number_words > 2 )
					{
						if (((struccur & FHAT_ENDS) IS_PLUS)
						|| ((struccur & FPERNEXT) IS_PLUS) ) /* last stressed syl of phrase*/
						{
							/* BATS 600 other coding bug */
						goto skiprules; /* For UK english code change to hit last syllable this hits
							   last stressed syllable EAB 1/22/98 */
						}
						else
						{
							/* eab I6/3/98 I think soemthing going on glide up needs to be stropnger than 20 21 combo*/
							make_f0_command (pDph_t,IMPULSE, 22, (targf0>>1), -20,(pDph_t->allodurs[nphon]>>2), &cumdur);
							make_f0_command (pDph_t,GLIDE, 22, targf0+10, 0,pDph_t->allodurs[nphon], &cumdur);
							 
							pDph_t->prevnphon= nphon;
							pDph_t->prevtargf0 = targf0;
						}

					}	

#else
					/* Save stress impulse in command string */
					make_f0_command (pDph_t,IMPULSE, 2, targf0, delayf0,0, &cumdur);
#endif

				

					/* Increment stressed syllable counter */
					if (pDphsettar->nrises_sofar < MAX_NRISES)
						pDphsettar->nrises_sofar++;
						//if (pDphsettar->nrises_sofar == MAX_NRISES)
						//	pDphsettar->nrises_sofar=1;
				}

			/* EAB 2/27/97 Fhat_fall on last stressed syl is not always appropriate because there aare times when there
is still too many phonemes left to go to end of clause and we need to delay the fall. Need to check it in two places
FSYL test which is not needed because we must assume the fhat was put in the coreect place to begin with, but the 
duplication is so that the rules fire in the correct order also*/

				/* Rule 3: Execute hat fall */

				/* If presently at top of hat, return to base shortly after */
				/* vowel onset if this is last stressed syllable in phrase */
		
				if ( 	pDph_t->had_hatend )
				{
					pDph_t->had_hatend=0;

				

					if (pDph_t->f0mode == NORMAL)
					{
						/* EAB The code is badly broken we didn't know it because limit code in PHDRwt0
						was preventing it from jumping off the cliff it's being totally re-written
						It's too broken to try and comment on why I cahnged what I'm simply trying 
						to make it work the way it was intended to  Note f0 is a delta value rlative to a hopeful
						return to baseline offset by f0delta In further investigation it was really
						not so awfule but values were */

						/* Default assumptions: */
						/* Make fall try to go below baseline by 21 Hz in a 
						declarative sentence with stressed final syllable */
						f0fall = F0_FINAL_FALL;
						 pDph_t->hatstate = AFTER_FINAL_FALL;
						/* Make fall start 180 ms from end of this vowel */
						delayf0 = (pDph_t->allodurs[nphon]>>1) - NF30MS;
						/* But not too early */
						if (delayf0 < NF25MS)
							delayf0 = NF25MS;

						/* Non-final clause, don't go too far below baseline */
						if ((struccur & FBOUNDARY) == FCBNEXT)
						{
							
							f0fall = F0_NON_FINAL_FALL;
							pDph_t->hatstate = AFTER_NONFINAL_FALL;
						}
						/* Non-final phrase, don't go below baseline at all */
						if ((struccur & FBOUNDARY) == FVPNEXT)
						{
						
							f0fall = 0;
						}
						/* Non-final syllable, see what boundary is next */
						if ((struccur & FBOUNDARY) < FVPNEXT )
					
					/* EAB The above code assumes that there isn't a word boundary after the final
					thing - there always is so we need to mask it out*/
							//WINprintf("allofeat of phon number %d is %o \n",nphon,struccur);
					/*	if (pDph_t->allofeats[nphon+1] < FVPNEXT)*/
								
						{
							

							/* LEFT SHIFT 4 x 4 SPACES SO FITS ON LINE */
							for (nphonx = nphon + 1; nphonx < pDph_t->nallotot; nphonx++)
							{
								if ((pDph_t->allofeats[nphonx] & FHAT_BEGINS) IS_PLUS)
								{
									/* Don't go below baseline if another hatrise in phrase */
									f0fall = 0;
									goto bfound;
								}
								if ((phone_feature( pDph_t,pDph_t->allophons[nphonx]) & FSYLL) IS_PLUS)
								{
								
									if ((pDph_t->allofeats[nphonx] & FSTRESS) IS_MINUS)
									{
										/* Delay fall if next syll unstressed */
										/* MINOR BUG:             (should only depend on first syllabic encountered) */
										delayf0 = pDph_t->allodurs[nphon] - NF50MS;
									}
									if ((pDph_t->allofeats[nphonx] & FBOUNDARY) == FVPNEXT)
									{
										/* This syll is last of a phrase */
										f0fall = 0;		/* More of clause coming */
										goto bfound;
									}
									/* eab 4/24/97 I think this may be redundundant*/
									if ((pDph_t->allofeats[nphonx] & FBOUNDARY) > FVPNEXT)
									{
										/* This syll is last of a clause */
										f0fall = F0_NON_FINAL_FALL;	
										pDph_t->hatstate = AFTER_NONFINAL_FALL;
										/* Go slightly below baseline */
										goto bfound;
									}
									/* Else continue looking for last syll of this phrase */
								}
							}
						}
						/* END OF LEFT SHIFT */

						/* Or because question rise on same syllable */
					  bfound:if ((struccur & FBOUNDARY) == FQUENEXT)
						{
							f0fall = F0_QSYLL_FALL;
						}


/*			  Delay fall if more (unstressed) sylls in phrase */
			    if (nextsylbou != nextphrbou) {
				delayf0 = pDph_t->allodurs[nphon] - NF20MS;
/*			      But not too much delay if also continuation rise */
/*			      i.e. readjust timing so get fall-rise, not r-f-r */
				if ((nextphrbou == FCBNEXT)
				  || (nextphrbou == FQUENEXT)) {
				    if (lowrisesw == 0) {  /* Limit=1/sent. */
					lowrisesw++;
					delayf0 = -NF20MS;
					f0fall = 140;
				    }
				}
			    }

/*			  Make fall very early if also contin. rise on same syl */
/*			  i.e. readjust timing so get fall-rise, not r-f-r */
			    else if ((nextphrbou == FCBNEXT)
			      || (nextphrbou == FQUENEXT)) {
				lowrisesw++;
				delayf0 = -NF20MS;
				f0fall = 140;
			    }
			    if (pDph_t->hatstate == AFTER_FINAL_FALL) {
				lowrisesw = 0;
			    }



						/* Pitch falls are less pronounced for some speakers 
						 * to reduce impression of assertive personality */
						f0fall = frac4mul (f0fall, pDph_t->assertiveness);

						if (pDph_t->cbsymbol)
						{
							f0fall = f0fall >> 1;	/* Gest reduced in ? */
						}
					

						/* Total fall is hatsize + f0fall below baseline */
						/* eab combining hatfall with the end creek is BAD
						let phdrawt0 handle the enddrop so the let this be the begiining
						of the ptich fall then followed by enddrop so it's size is much 
						reduced from the past.*/
						f0fall=f0fall>>2;

	
						f0fall += pDphsettar->hatsize;
					}
	

					/* Unless user->specified fall */
					else if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED )
					{
						f0fall = ((pDph_t->user_f0[mf0] - 400) * 10) + 2;	/* Even */
						if ((f0fall >= 2000) || (f0fall <= 0)
							|| (inputscrewup == TRUE))
							{
							f0fall = 2;		
							/* Must be even greater than 0 */
							logscrewup (phocur, &inputscrewup);
							}

						delayf0 = mstofr(pDph_t->user_offset[mf0]);

						mf0++;

					}

					make_f0_command (pDph_t,STEP, 3, -f0fall, delayf0, 0, &cumdur);
					pDphsettar->hat_loc_re_baseline -= f0fall;
					
				}

				/* 
				 * Rule 4: Add positive pulse to approximate nonterminal fall-rise          
				 * in stressed clause-final but non-sentence-final syllable, 
				 * or in sentence ending in a question mark 
				 */

				if ((struccur & FBOUNDARY) == FQUENEXT)
					NotQuest = 0;	   /* it is a question allow early stress */
				if ((struccur & FBOUNDARY) == (FPERNEXT | FEXCLNEXT | FSENTENDS))
				{
					NotQuest = 1;
				}
				if (((struccur & FBOUNDARY) == FCBNEXT)
					|| ((struccur & FBOUNDARY) == FQUENEXT))
				{
					/* Time rise to begin near end of vowel */
					delayf0 = pDph_t->allodurs[nphon] - NF80MS;

					pDph_t->delta_special = 0;


					if ((struccur & FBOUNDARY) == FQUENEXT)
					{
						/* Sent.-final stressed vowel followed by q-mark */

 /* EAB We want the hardcoded gestures to be defined in a language specific 
 or speaker specific way file they ultimately want to be setable perhaps so for now I'm going
 to move all of these kinds of things to the speaker def files. 2/26/97 */


						make_f0_command (pDph_t,IMPULSE, 4,F0_QGesture1, delayf0,0, &cumdur);
						make_f0_command (pDph_t, IMPULSE, 4,F0_QGesture2, pDph_t->allodurs[nphon],0, &cumdur);
					}
					else
					{
						/* Phrase-final stressed vowel followed by comma */
						/* 2/26/97 See comment above*/


						pDph_t->delta_special = -50;


						delayf0 += NF20MS;
						make_f0_command (pDph_t, IMPULSE,4, F0_CGesture1, delayf0,0, &cumdur);
						make_f0_command (pDph_t, IMPULSE, 4, F0_CGesture2, pDph_t->allodurs[nphon],0, &cumdur);


					}
				}
			}

/* EAB 2/27/97 Fhat_fall on last stressed syl is not always appropriate because there aare times when there
is still too many phonemes left to go to end of clause and we need to delay the fall. In previous 
position it did and FSYL test which is not need because we must assume the fhat was put in the
coreect place to begin with sorry it put in the right place it turns out this code hasn't
work since I believe 1984*/


				/* Rule 31: Execute hat fall */

				/* If presently at top of hat, return to base shortly after */
				/* vowel onset of the next syllabic */
				if (pDph_t->had_hatend && (feacur & FSYLL) IS_PLUS)
				{


					if (pDph_t->f0mode == NORMAL)
					{

						/* Default assumptions: */
						/* Make fall try to go below baseline by 21 Hz in a 
						declarative sentence with stressed final syllable */
						/* EAB 4/29/97 reduce all values to 1/2 for now at least*/
						f0fall = F0_FINAL_FALL;
						/* Make fall start 160 ms from end of this vowel */
						delayf0 = pDph_t->allodurs[nphon] - NF160MS;
						/* But not too early */
						if (delayf0 < NF25MS)
							delayf0 = NF25MS;

						/* Non-final clause, don't go too far below baseline */
						if ((struccur & FBOUNDARY) == FCBNEXT)
						{
							
							f0fall = 120;
						}
						/* Non-final phrase, don't go below baseline at all */
						if ((struccur & FBOUNDARY) == FVPNEXT)
						{
							
							f0fall = 0;
						}
						/* Non-final syllable, see what boundary is next */

						if ((struccur & FBOUNDARY) < FVPNEXT)
						{

						
							for (nphonx = nphon + 1; nphonx < pDph_t->nallotot; nphonx++)
							{
								/* eab DENiis broke the code with this line in 1984
								if ((featb[pDph_t->allophons[nphonx]] & FSYLL) IS_PLUS)
								This may not be the best fix either the hats have to be */
								if ((pDph_t->allofeats[nphonx] & FHAT_BEGINS) IS_PLUS)
								{
									/* Don't go below baseline if another hatrise in phrase */
									f0fall = 0;
									goto bbfound;
								}
								if ((phone_feature( pDph_t,pDph_t->allophons[nphonx]) & FSYLL) IS_PLUS)
								{
								/*Move so it can be seen*/
#ifdef NOTWORKING
									if ((pDph_t->allofeats[nphonx] & FHAT_BEGINS) IS_PLUS)
									{
										/* Don't go below baseline if another hatrise in phrase */
										f0fall = 0;
										goto bbfound;
									}
#endif
									if ((pDph_t->allofeats[nphonx] & FSTRESS) IS_MINUS)
									{
										/* Delay fall if next syll unstressed */
										/* MINOR BUG:             (should only depend on first syllabic encountered) */
										delayf0 = pDph_t->allodurs[nphon] - NF50MS;
									}
									if ((pDph_t->allofeats[nphonx] & FBOUNDARY) == FVPNEXT)
									{
										/* This syll is last of a phrase */
										f0fall = 0;		/* More of clause coming */
										goto bbfound;
									}
									if ((pDph_t->allofeats[nphonx] & FBOUNDARY) > FVPNEXT)
									{
										/* This syll is last of a clause */
										f0fall = F0_NON_FINAL_FALL;	/* Go slightly below baseline */
										goto bbfound;
									}
									/* Else continue looking for last syll of this phrase */
								}
							}
						}
						/* END OF LEFT SHIFT */

						/* Or because question rise on same syllable */
					  bbfound:if ((struccur & FBOUNDARY) == FQUENEXT)
						{
							
							f0fall = F0_QSYLL_FALL;
						}

						/* Pitch falls are less pronounced for some speakers 
						 * to reduce impression of assertive personality */
						f0fall = frac4mul (f0fall, pDph_t->assertiveness);

						if (pDph_t->cbsymbol)
						{
							f0fall = f0fall >> 1;	/* Gest reduced in ? */
						}

						/* Total fall is hatsize + f0fall below baseline */
						f0fall += pDphsettar->hatsize;
					}

					/* Unless user-specified fall */
					else if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED)
					{
						f0fall = ((pDph_t->user_f0[mf0] - 400) * 10) + 2;	/* Even */
						if ((f0fall >= 2000) || (f0fall <= 0)
							|| (inputscrewup == TRUE))
						{
							f0fall = 2;		/* Must be even, greaterthan 0 */
							logscrewup (phocur, &inputscrewup);
						}
						delayf0 = mstofr (pDph_t->user_offset[mf0]);
						mf0++;
					}
					

					make_f0_command (pDph_t,STEP, 31, -f0fall, delayf0,0, &cumdur);
					pDphsettar->hat_loc_re_baseline -= f0fall;
					
				}
			}

			/* 
			 * Rule 5: Final fall on unstress clause-final syl, or on stressed 
			 * clause-final syll that didn't have hat fall due to earlier emphasis 
			 */

			
			if ((feacur & FSYLL) IS_PLUS)
			{
				if (((stresscur & FSTRESS_1) IS_MINUS)	/* 2-str or 0-str */
					|| ((struccur & FHAT_ENDS) IS_MINUS))
				{					   /* or 1-str nofall */


#ifdef SPANISH
					if ((struccur & FTYPESYL) >= FBISYL
						&& ((struccur & FBOUNDARY) > FWBNEXT
							|| (phone_feature( pDph_t,phonex) & FCONSON) IS_PLUS))
					{
#endif
		
						/* Pitch falls (glottalize) at end of declar. sent. */
						if (((struccur & FBOUNDARY) == FPERNEXT)
							|| ((struccur & FBOUNDARY) == FEXCLNEXT))
						{
							targf0 = F0_GLOTTALIZE;
							/* 
							 * Pitch falls are less pronounced for some speakers 
							 * to reduce impression of assertive personality 
							 */
							targf0 = frac4mul (targf0, pDph_t->assertiveness);
							
							targf0 |= 01;  /* Must be odd */

							/* Sent.-final unstressed vowel followed by a period */
							/* EAB with addition of new code to glotalize in phdrwt0 this
							needs to grt alot weaker*/
							
							make_f0_command (pDph_t,GLOTTAL, 5, targf0, pDph_t->allodurs[nphon] - NF100MS, 0, &cumdur);
						}


						/* Rule 6: Continuation rise on unstress clause-final syll before  comma or ? */
	
						/* Rise occurs just before end of vowel */ 

						delayf0 = pDph_t->allodurs[nphon] - NF80MS;
						if ((struccur & FBOUNDARY) == FQUENEXT)
						{
							
							/* Unstressed vowel followed by a question mark */
							make_f0_command (pDph_t,IMPULSE, 6, F0_QGesture1, delayf0, 0, &cumdur);
							make_f0_command (pDph_t,IMPULSE, 6, F0_QGesture2, pDph_t->allodurs[nphon], 0, &cumdur);

						}
						if ((struccur & FBOUNDARY) == FCBNEXT)
						{
							/* Unstressed vowel followed by a comma */
							
							delayf0 += NF20MS;
							make_f0_command (pDph_t,IMPULSE, 6, F0_CGesture1, delayf0, 0, &cumdur);
							make_f0_command (pDph_t,IMPULSE, 6, F0_CGesture2, pDph_t->allodurs[nphon], 0, &cumdur);
						}


#ifdef SPANISH
					}
#endif
				}
				
	else if (((struccur & FBOUNDARY) == FPERNEXT))
						{
							targf0 = F0_GLOTTALIZE;
							/* 
							 * Pitch falls are less pronounced for some speakers 
							 * to reduce impression of assertive personality 
							 */
							targf0 = frac4mul (targf0, pDph_t->assertiveness);
							
							/* Sent.-final unstressed vowel followed by a period */
							
							make_f0_command (pDph_t,GLOTTAL, 5, targf0, pDph_t->allodurs[nphon] - NF100MS, 0, &cumdur);
						}

			}

			/* Rule 7: Reset baseline at end of sentence */

			if (phocur == SIL)
			{

				/* Reset f0 to hat bottom from sub-hat-bottom */
				if ((pDphsettar->hat_loc_re_baseline != 0) && (pDph_t->nf0tot > 0))
				{
/* eab german code is bull it's too late to do this stuff I think eab 2/26/97 
GERMAN
					if (pDph_t->cbsymbol)
						make_f0_command (pDph_t, 7, +180, 0, &cumdur);
					else
#endif  */
					make_f0_command (pDph_t,STEP, 7, -(pDphsettar->hat_loc_re_baseline), 0, 0, &cumdur);

					pDphsettar->hat_loc_re_baseline = 0;
				}

				if (nphon > 0)
					pDphsettar->nrises_sofar = 1;	/* Soft reset */

				if ((pDph_t->allofeats[nphon - 1] & FBOUNDARY) == FCBNEXT
					&& pDph_t->nf0tot > 0
					&& (pDph_t->allophons[nphon - 1] != SIL))
				{
					make_f0_command (pDph_t,F0_RESET, 7, 0, 0, 0, &cumdur); /* RESET! */
					issubclause = TRUE;
				}

				/* Rule 8: Reset baseline and hat position to brim if end of a sentence */
				/*** Add condition to reset if long clause followed by comma and long clause */

				if ((struclas & FSENTENDS) IS_PLUS)
				{
					make_f0_command (pDph_t,F0_RESET, 8, 0, 0, 0, &cumdur);
					pDphsettar->hat_loc_re_baseline = 0;
					/* Hard reset counter of stressed sylls in clause */
					pDphsettar->nrises_sofar = 0;
				}
			}
			/* printf("\ndur \t\t%4d\t%4d fotar nphone %d", ((cumdur*64)/10), f0tar[n],nphon); */
		

	  skiprules:					   /* END OF F0 RULES */

		/* Update cumdur to time at end of current phone */
	cumdur += pDph_t->allodurs[nphon];
			/* add up duration for phdrawt0		eab 8/96 don't count final silence */
	/* corrected BATS 713 */
		if( (nphon <= (pDph_t->nallotot-1) &&
		(nphon > 0 && pDph_t->allophons[nphon] != 0))
		|| nphon==0 ) //1st two lines check end of cluase
		//This counts inital silence (we don't vount final silence 
		/* EAB It turns out that there are two possibilites for the way things
		get transmitted one is with and end of clause symbols and the other is without(implied)
		therefore you have to do two checks to know whether or not your at the last real phoneme
		or at a silence phoneme new and improved BATS 897 */
		pDph_t->tcumdur += pDph_t->allodurs[nphon];
#ifndef ENGLISH_UK

			/* Rule 9: Add short schwa vowel to create release of [p,t,k,b,d,g] into sil. 
			 * Logically, this kind of rule should appear in PHALLOPH.C, but
			 * delaying it to here makes all dur and f0 rules much simpler 
			 * EAB 2/28/97 changing to generalize when FPLOS + Fburst then release into a schwa
			 */
	if (( phonex == SIL)&& (phone_feature( pDph_t,phocur) & FPLOSV) 
			&& (phone_feature( pDph_t,phocur) & FBURST) )
	{
													/* p t k b d g */
													/* || ((feacur & FNASAL) IS_PLUS) */ 
													/* m n nx en */
			/*&& (pDph_t->nallotot < NPHON_MAX)) I don't believe we should need this chnage earlier 
			NPHO_MAX code to a yellow zone code so we don't have to constantly check if were at the end things don't
			get added that frequently*/
		
			for (n = pDph_t->nallotot; n > nphon; n--)
			{
				pDph_t->allophons[n] = pDph_t->allophons[n - 1];
				pDph_t->allofeats[n] = pDph_t->allofeats[n - 1];
				pDph_t->allodurs[n] = pDph_t->allodurs[n - 1];
				pDph_t->user_f0[n] = pDph_t->user_f0[n - 1];
			}

			pDph_t->allophons[nphon + 1] = SCHWA1;
			if ( (begtyp[pholas] == 1)
				|| (phone_feature( pDph_t,phocur) & FDENTAL ))
			{
				pDph_t->allophons[nphon + 1] = SCHWA2;
			}

			pDph_t->allodurs[nphon + 1] = NF25MS;
			cumdur += NF25MS;
			cumdur += pDph_t->allodurs[nphon+1];

			/*eab 8/96 update tcumdur*/
			pDph_t->tcumdur +=pDph_t->allodurs[nphon+1];
			pDph_t->allofeats[nphon + 1] = pDph_t->allofeats[nphon] | FDUMMY_VOWEL;
			pDph_t->nallotot++;
			nphon++;
	}
#endif
}
			
#ifdef NWS_US /*maybe in all cases*/
		
				pDphsettar->lastbound=pDph_t->clausetype;
#endif  
}



 
/*
 *      Function Name: make_f0_command()      
 *
 *  	Description: Put an f0 command into f0tar and f0tim arrays  
 *
 *      Arguments: 	PDPH_T pDph_t, 
 *				   	short rulenumber, 
 *					short tar,
 *		            short delay, 
 *		            short *psCumdur
 *
 *      Return Value: void
 *
 *      Comments:
 *x
 */

static void make_f0_command (PDPH_T pDph_t,short type, short rulenumber, short tar,
				 			 short delay,short length, short *psCumdur)
{

	/* Cudur reflects time (in frames) since last f0 command        */
	/* Cumdur+delay should never be less than zero                  */

	/* static short prpholas, temp; *//* MVP : Never Used,comment it out */
	/* If requested time is earlier than last f0 command, zero offset */

		
	//	WINprintf("rule %d tar %d delay %d \n",rulenumber, tar, delay);
	if ((delay + *psCumdur) < 0)
	{
		delay = -(*psCumdur);
	}

	/* Save commands */	
	pDph_t->f0tim[pDph_t->nf0tot] = *psCumdur + delay;
	pDph_t->f0tar[pDph_t->nf0tot] = tar;
	pDph_t->f0type[pDph_t->nf0tot] = type;
	/* eab 1/10/98 We need to be able to specifiy the length of the event instead of having only
	one choice. Initally some commands will ignore length*/
	pDph_t->f0length[pDph_t->nf0tot] = length;

	/* "Zero" counter of time since last command */
	*psCumdur = (-delay);

	/* Increment counter of number of f0 commands issued */
	if (pDph_t->nf0tot < NPHON_MAX - 1)
	{
		pDph_t->nf0tot++;
	}

}
 
/*
 *      Function Name:logscrewup()       
 *
 *  	Description: 
 *
 *      Arguments: 	short phocur, 
 *					short *inputscrewup
 *
 *      Return Value: void 
 *
 *      Comments:
 *
 */

void logscrewup (short phocur, short *inputscrewup)
{

	*inputscrewup = TRUE;
}

/*************************end of ph_inton.c**************************************/

#else /*ifdef NWS_US || ENGLISH_UK */
#include "ph_def.h"
#ifdef ALLINPHDEFSNOW
#ifdef ENGLISH_US
#define   MAX_NRISES      	4
#define   F0_FINAL_FALL   	212
#define   F0_MORE_FALL  	150
#define	  F0_QSYLL_FALL		80
#define   F0_GLOTTALIZE    -131
#endif
#ifdef ENGLISH_UK
#define   MAX_NRISES      	4
#define   F0_FINAL_FALL   	212
#define   F0_MORE_FALL  	150
#define	  F0_QSYLL_FALL		80
#define   F0_GLOTTALIZE    -131
#endif
#ifdef GERMAN
#define   MAX_NRISES      	4
#define   F0_FINAL_FALL   	212
#define   F0_MORE_FALL  	150
#define	  F0_QSYLL_FALL		80
#define   F0_GLOTTALIZE    -131
#endif
#ifdef SPANISH
#define   MAX_NRISES      6
#define   F0_FINAL_FALL   310                              
#define   F0_MORE_FALL     150
#define   F0_QSYLL_FALL      80
#define   F0_QBOUND_PULSE   1000
#define   F0_CBOUND_PULSE   700
#define   F0_GLOTTALIZE    -100
#endif
#ifdef FRENCH
#define   MAX_NRISES      	4
#define   F0_FINAL_FALL   	212
#define   F0_MORE_FALL  	150
#define	  F0_QSYLL_FALL		80
#define   F0_GLOTTALIZE    -131
#endif

#endif

/* 
 * Duration of the "dummy vowel" inserted after a clause-final stop.
 */
/* #define  DUMMY_V_DUR NF25MS      -- seems a bit long */
#define   DUMMY_V_DUR   NF15MS


/***************************************************************************/
/* MVP : The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                */
/* extern short allophons[];    Integer rep of phonetic string             */
/* extern short allofeats[];    Structural features                        */
/* extern short allodurs[];     Duration in frames for each phone          */
/* extern short nallotot;       Number of phones in phonetic string        */
/* extern short arg1,arg2,arg3; Used for muldv(pDph_t->arg1,pDph_t->arg2,pDph_t->arg3) */
/* extern short *user_f0;       User-specified f0 commands, optional       */
/* extern short *user_offset;   User-specified f0 command time offset      */
/* extern FLAG  newparagsw;    Make f0 higher initially if =1              */
/* Set to 0 here after raising f0              							   */
/* extern short f0mode;        State variable determine if rules used      */
/* extern short cbsymbol;      Equals QUEST if clause ends in ?            */
/* extern short assertiveness; Speaker def parameter                       */
/* extern short size_hat_rise; Speaker def parameter                       */
/* extern short scale_str_rise;Speaker def parameter                       */
/* extern short f0tar[];       F0 target commands, in Hz*10                */
/* extern short f0tim[];       Times between commands, in frames           */
/* extern short nf0tot;        Number of commands for cur clause           */
/***************************************************************************/

/* Input variables:                                                    */

/* Output variables:                                                   */

/* TABLES located in PH_ROM.C                                          */

//extern short *f0_stress_level;			/* F0 rise as f(stress-level)  	 */
//extern short *f0_phrase_position;		/* F0 rise as f(phrase-position) */
//extern short *featb;	   /* Phonetic features            */


/* MVP : Static function declarations */
static void make_f0_command (PDPH_T pDph_t, short rulenumber, short tar, short delay,
					  		 short length, short *psCumdur);
	


	/* static short n; *//* MVP : Made local to phinton() */
	/* static short cumdur,phocur; */
	/* static FLAG inputscrewup;   */


#ifdef ENGLISH_US


/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

//BATS 776 EAB 10/22/98 add values to arrays

short f0_phrase_position[] =
{160, 90, 80, 70, 60, 50, 40,30};

/* Was: 210, 90, 40, 20 */

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired impulse
 * function */

short f0_stress_level[] =
{1, 71, 31, 281 };

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

short f0_fphrase_position[] =
{ 100, 94, 88, 82, 77, 73, 64, 60 };

/* Was: 210,  90, 40, 20 */

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired impulse
 * function */

short f0_fstress_level[] =
{1, 71, 41, 311};


#endif

 
/*
 *      Function Name: phinton()      
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
/* GL 03/25/1998,  BATS#639 use phTTS argument instead of pDph_t */
void phinton (LPTTS_HANDLE_T phTTS)

{

	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	short                   n;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;


	/* Automatic variables */
	short nphon = 0, mf0 = 0;
	short pholas = 0, struclas = 0, fealas = 0;
	short struccur = 0, feacur = 0, stresscur = 0;
	short phonex = 0, strucnex = 0, feanex = 0;
	short targf0 = 0, delayf0 = 0;
	short f0fall = 0;		/* Extra fall below baseline at end of clause */
	short nphonx = 0;		/* short temp is never used MVP */
	short cumdur = 0, phocur = 0;		/* MVP : made local */
	short inputscrewup = 0;	/* MVP : was of type FLAG */
#ifdef SPANISH
	short issubclause = 0;   /* TRUE signals subordinate clause */
	short numvowels = 0;
	short NotQuest = 1;
	
	pDph_t->delta_special=0;
#endif                                                                      
	pDphsettar->nrises_sofar = 0;
	pDphsettar->hatsize = 0;
	pDphsettar->hat_loc_re_baseline = 0;

	/* Beginning of initialization */
	inputscrewup = FALSE;
	cumdur = 0;
	/* eab 4/9/97 BATS#346 */
	pDph_t->had_hatbegin=0;
	pDph_t->had_hatend=0;
	pDph_t->nf0tot = 0;
	pholas = SIL;
	fealas = phone_feature( pDph_t,SIL);
	struclas = 0;
	mf0 = 0;
	/* Should set nrises_sofar to zero after a ph_init=0 hard reset */
	/* End of initialization */

	/* MAIN LOOP, for each output phoneme */

	for (nphon = 0; nphon < pDph_t->nallotot; nphon++)
	{

		if (nphon > 0)
		{
			pholas = pDph_t->allophons[nphon - 1];
			struclas = pDph_t->allofeats[nphon - 1];
			fealas = phone_feature( pDph_t,pholas);
		}
		phocur = pDph_t->allophons[nphon];
		struccur = pDph_t->allofeats[nphon];
		stresscur = struccur & FSTRESS;
		feacur = phone_feature( pDph_t,phocur);
		if (nphon < (pDph_t->nallotot - 1))
		{
			phonex = pDph_t->allophons[nphon + 1];
			strucnex = pDph_t->allofeats[nphon + 1];
			feanex = phone_feature( pDph_t,phonex);
		}
#ifdef SPANISH
		/* printf("feacur %d %d %d \n",feacur & FVOWEL,numvowels,NotQuest); */
		if (feacur & (FVOWEL | WBOUND))
		{
			numvowels++;
		}
#endif

        /* 
         *printf("special_phrase %d, stresscur %d, numvowels %d, NotQuest %d\n",
         * pDph_t->special_phrase,stresscur,numvowels,NotQuest); 
         */
        /* 
         * printf("phocur %d feacur %d struccur %d feanex %d phonex %d strucnex %d\n",
         * phocur,feacur,struccur,feanex,phonex,strucnex);  
         */
		/* Rule 0: User-specified commands for phoneme f0 targets or singing */

		if ((pDph_t->f0mode == PHONE_TARGETS_SPECIFIED)
			|| (pDph_t->f0mode == SINGING))
		{

			if (pDph_t->user_f0[nphon] != 0)
			{
				make_f0_command (pDph_t, 0, (2000 + pDph_t->user_f0[nphon]),
								 0,0, &cumdur);
			}
			goto skiprules;
		}

		/* Rule 1: If at bottom of hat, goto top on +HAT_RISE +syllabic */
		/* EAB 4/9/97 BATS#346 Found a basic flaw whose error cause was generated a long time ago
		manual placed f0hat get ignores if the next thing isn't plus syllabic.Looking at
		the code it's hard to believe it ever worked all correctly. Looking at the tuning example I can
		not figure out how it could have ever wroked correctly. The first hat rise in the example 
		would have been seen but only becuase the next word started with a vowel.What it should do is
		remember that it has a hat_rise or hat_fall pending. and execute it at the next syllabic*/
#ifndef LOW_COST_VERSION
		if((struccur & FHAT_BEGINS) IS_PLUS)
			pDph_t->had_hatbegin= 1;
		if((struccur & FHAT_ENDS) IS_PLUS)
			pDph_t->had_hatend= 1;
#endif
		if ((pDph_t->f0mode == NORMAL) || (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED))
		{

			if ((feacur & FSYLL) IS_PLUS)
			{



				/* eab 4/9/97 BATS#346  use had_hatbegin instead of FHAT_BEGINS*/
				if (pDph_t->had_hatbegin)
				{
					pDph_t->had_hatbegin=0;
					delayf0 +=1;
#if defined (ENGLISH_US) || defined (GERMAN) || defined (FRENCH)
					if (pDph_t->f0mode == NORMAL)
#endif
#ifdef SPANISH
					if (pDph_t->f0mode == NORMAL && !pDph_t->special_phrase)
#endif						
					{
						pDphsettar->hatsize = pDph_t->size_hat_rise;	/* speaker-def param */
						/* 
						 * PUT IN CODE TO REDUCE HATSIZE IN SHORTER OF 
						 * TWO HAT PATTERNS OF A SENTENCE 
						 */
						if (pDph_t->cbsymbol)
						{
#if defined ENGLISH_US || defined GERMAN || defined FRENCH
							pDphsettar->hatsize >>= 1;		/* All gest reduced */
#endif
#ifdef SPANISH
							pDphsettar->hatsize >>= 2;		/* All gest reduced */
#endif
						}
						pDphsettar->hatsize &= 037776;	/* Must be even */
						pDphsettar->hatsize |= 02;	/* Must be non-zero */

						/* Begin gesture toward the end of the vowel if long */
#if defined ENGLISH_US || defined GERMAN || defined FRENCH
						delayf0 = 0;
#endif
#ifdef SPANISH
						delayf0 = (pDph_t->allodurs[nphon] >> 1) - NF30MS;
#endif
						/* Begin gesture earlier if also hat fall on same vowel */
						if ((struccur & FHAT_ENDS) IS_PLUS)
						{
							delayf0 = -NF80MS;
						}

						make_f0_command (pDph_t, 1, pDphsettar->hatsize, delayf0,0, &cumdur);
					}
					else if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED)
					{
						pDphsettar->hatsize = ((pDph_t->user_f0[mf0] - 200) * 10) + 2;
						if ((pDphsettar->hatsize >= 2000) || (pDphsettar->hatsize <= 0)
							|| (inputscrewup == TRUE))
						{
							pDphsettar->hatsize = 2;	/* Must be even, greater than 0 */
							logscrewup (phocur, &inputscrewup);
						}
						delayf0 = mstofr (pDph_t->user_offset[mf0]);
						mf0++;
						/* Make hat rise occur at user_dur ms re vowel onset */
						make_f0_command (pDph_t, 1, pDphsettar->hatsize, delayf0,0, &cumdur);
					}

					pDphsettar->hat_loc_re_baseline += pDphsettar->hatsize;
				}

#ifdef SPANISH				
				if (pDph_t->special_phrase)
				{
					pDphsettar->nrises_sofar = 5;
				}

				if (issubclause)
				{
					pDphsettar->nrises_sofar = 3;
					issubclause = FALSE;
				}
#endif
				/* Rule 2: Add stress pulse to every stressed vowel, smaller pulse at end */
                targf0=0;
#if defined ENGLISH_US || defined GERMAN || defined FRENCH             
				if ((stresscur & FSTRESS_1) IS_PLUS)
#endif
#ifdef SPANISH
				if (!pDph_t->special_phrase && ((stresscur & FSTRESS_1) IS_PLUS && (numvowels>2 && NotQuest)) || pDph_t->nallotot < 8)
#endif
				{					   /* Primary or emph */
					/* Make stress impulse prop. to degree of stress */
					/* and stress position relative to clause onset */
					targf0 = f0_stress_level[stresscur]
						+ f0_phrase_position[pDphsettar->nrises_sofar];

					if (pDph_t->cbsymbol)
					{
#ifdef ENGLISH_US
						targf0 >>= 1;	/* All gestures reduced in ? */
#endif
#ifdef GERMAN
#ifdef KAREN
						targf0 >>= 1;	/* All gestures reduced in ? */
#endif
#endif
#ifdef SPANISH
						targf0 >>= 2;	/* All gestures reduced in ? */
#endif
#ifdef FRENCH
						targf0 >>= 1;	/* All gestures reduced in ? */
#endif
					}
#ifdef SPANISH       
					/* Added */
					else if (pDph_t->emphasisflag && stresscur != FEMPHASIS)
					{
						targf0 >>= 1;  /* Reduce unemph. gest    */
					}
						
#endif

					/* Begin gesture 1/4 of way into the vowel */
#if defined ENGLISH_US || defined GERMAN || defined FRENCH
					delayf0 = pDph_t->allodurs[nphon] >> 2;
#endif

#ifdef SPANISH

					delayf0 = 0;	   /* = allodurs[nphon]>>1;*/ 

#endif
					/* Begin impulse much earlier when last stress of phrase */
					if (((struccur & FHAT_ENDS) IS_PLUS)
						|| ((struccur & FPERNEXT) IS_PLUS))
					{
						delayf0 = -NF60MS;
#ifdef SPANISH
						targf0 = targf0 - 150;	/* eab reduce last strees per anna */
						if (targf0 < 0)
							targf0 = 0;		/* don't hurt yourself */
#endif
					}
					/* Except when syllable is emphasized */
					if (stresscur == FEMPHASIS)
					{
#if defined (ENGLISH_US) || defined (GERMAN) || defined (FRENCH)
						delayf0 = 0;
#endif
#ifdef SPANISH
						delayf0 = NF15MS;
#endif
					}

					if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED)
					{
						targf0 = ((pDph_t->user_f0[mf0] - 1000) * 10) + 1;	/* Odd */
						if ((targf0 >= 2000) || (targf0 <= 0)
							|| (inputscrewup == TRUE))
						{
							targf0 = 1;		/* Must be odd, greater than 0 */
							logscrewup (phocur, &inputscrewup);
						}
						delayf0 = mstofr (pDph_t->user_offset[mf0]);
						mf0++;
					}

					/* Scale by speaker def paramter SR, unless emphasized */
					pDph_t->arg1 = pDph_t->scale_str_rise;
					if ((stresscur == FEMPHASIS) && (pDph_t->arg1 < 16))
					{
						pDph_t->arg1 = 16;
					}
					pDph_t->arg2 = targf0;
					pDph_t->arg3 = 32;
					targf0 = muldv (pDph_t->arg1, pDph_t->arg2, pDph_t->arg3);
					targf0 |= 01;	   /* Must be odd */

					/* Save stress impulse in command string */
					make_f0_command (pDph_t, 2, targf0, delayf0,0, &cumdur);

					/* Increment stressed syllable counter */
					if (pDphsettar->nrises_sofar < MAX_NRISES)
						pDphsettar->nrises_sofar++;
				}

				/* Rule 3: Execute hat fall */

				/* If presently at top of hat, return to base shortly after */
				/* vowel onset if this is last stressed syllable in phrase */
				/*eab 4/9/97 BATS#346 fix hat rise fall see earlier note*/
				if ( 	pDph_t->had_hatend)
				{
						pDph_t->had_hatend=0;

#if defined ENGLISH_US || defined GERMAN || defined FRENCH
					if (pDph_t->f0mode == NORMAL)
					{

						/* Default assumptions: */
						/* Make fall try to go below baseline by 21 Hz in a * 
						declarative sentence with stressed final syllable */
						f0fall = F0_FINAL_FALL;
						/* Make fall start 160 ms from end of this vowel */
						delayf0 = pDph_t->allodurs[nphon] - NF160MS;
						/* But not too early */
						if (delayf0 < NF25MS)
							delayf0 = NF25MS;

						/* Non-final clause, don't go too far below baseline */
						if ((struccur & FBOUNDARY) == FCBNEXT)
						{
							f0fall = 120;
						}
						/* Non-final phrase, don't go below baseline at all */
						if ((struccur & FBOUNDARY) == FVPNEXT)
						{
							f0fall = 0;
						}
						/* Non-final syllable, see what boundary is next */
						if ((struccur & FBOUNDARY) < FVPNEXT)
						{

							/* LEFT SHIFT 4 x 4 SPACES SO FITS ON LINE */
							for (nphonx = nphon + 1; nphonx < pDph_t->nallotot; nphonx++)
							{
								if ((pDph_t->allofeats[nphonx] & FHAT_BEGINS) IS_PLUS)
								{
									/* Don't go below baseline if another hatrise in phrase */
									f0fall = 0;
									goto bfound;
								}
								if ((phone_feature( pDph_t,pDph_t->allophons[nphonx]) & FSYLL) IS_PLUS)
								{
								
									if ((pDph_t->allofeats[nphonx] & FSTRESS) IS_MINUS)
									{
										/* Delay fall if next syll unstressed */
										/* MINOR BUG:(should only depend on first syllabic encountered) */
										delayf0 = pDph_t->allodurs[nphon] - NF50MS;
									}
									if ((pDph_t->allofeats[nphonx] & FBOUNDARY) == FVPNEXT)
									{
										/* This syll is last of a phrase */
										f0fall = 0;		/* More of clause coming */
										goto bfound;
									}
									if ((pDph_t->allofeats[nphonx] & FBOUNDARY) > FVPNEXT)
									{
										/* This syll is last of a clause */
										f0fall = F0_NON_FINAL_FALL;	/* Go slightly below baseline */
										goto bfound;
									}
									/* Else continue looking for last syll of this phrase */
								}
							}
						}
						/* END OF LEFT SHIFT */


						/* Or because question rise on same syllable */
					  bfound:if ((struccur & FBOUNDARY) == FQUENEXT)
						{
							f0fall = F0_QSYLL_FALL;
						}

						/* Pitch falls are less pronounced for some speakers 
						 * to reduce impression of assertive personality */
						  f0fall = frac4mul (f0fall, pDph_t->assertiveness);

						if (pDph_t->cbsymbol)
						{
							f0fall = f0fall >> 1;	/* Gest reduced in ? */
						}
						f0fall &= 037776;	/* Must be even */
						/* Total fall is hatsize + f0fall below baseline */
						f0fall += pDphsettar->hatsize;
					}
#endif	/* #if defined ENGLISH_US || defined GERMAN */
#ifdef SPANISH
					/* Make fall start 160 ms from end of this vowel */
					delayf0 = pDph_t->allodurs[nphon] - NF160MS;
					/* Earlier if a long vowel */
					delayf0 = delayf0 >> 1;
					if (delayf0 < NF25MS)
						delayf0 = NF25MS;
					/* Delay fall more if more syllables in phrase */
					if ((struccur & FBOUNDARY) < FVPNEXT)
					{
						/* Until 50 ms before end of vowel */
						delayf0 = pDph_t->allodurs[nphon] - NF50MS;
					}
					/* 
					 * Make fall try to go below baseline by F0_FINAL_FALL 
					 * Hz in a declarative sentence where stressed syllable 
					 * is final 
					 */
					if (pDph_t->f0mode == NORMAL)
					{
						f0fall = F0_NON_FINAL_FALL;
						/* Make fall not go below baseline on this stressed syll 
						 * if there are other (unstressed) sylls in phrase 
						 */
						if ((struccur & FBOUNDARY) <= FCBNEXT)
						{
							/* But it should go somewhat below baseline near */
							/* end of a clause */
							for (nphonx = nphon; nphonx < pDph_t->nallotot; nphonx++)
							{
								if ((pDph_t->allofeats[nphonx] & FBOUNDARY) >= FVPNEXT)
								{
									if ((pDph_t->allofeats[nphonx] & FBOUNDARY) >= FCBNEXT)
									{
										f0fall = F0_NON_FINAL_FALL;
									}
									else
										f0fall = 0;
									break;
								}
							}
						}
						/* Or because question rise on same syllable */
						if ((struccur & FBOUNDARY) == FQUENEXT)
						{
							f0fall = F0_QSYLL_FALL;
						}

						/* 
						 * Pitch falls are less pronounced for some speakers 
						 * to reduce impression of assertive personality 
						 */

						f0fall = frac4mul (f0fall, pDph_t->assertiveness);

						if (pDph_t->cbsymbol)
						{
							f0fall = f0fall >> 2;	/* Gest reduced in ? */
						}
						f0fall &= 037776;	/* Must be even */
						/* Total fall is hatsize + f0fall below baseline */

						f0fall += pDphsettar->hatsize;
					}
#endif /* #ifdef SPANISH */
					/* Unless user-specified fall */
					else if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED)
					{
						f0fall = ((pDph_t->user_f0[mf0] - 400) * 10) + 2;	/* Even */
						if ((f0fall >= 2000) || (f0fall <= 0)
							|| (inputscrewup == TRUE))
						{
							f0fall = 2;		/* Must be even, greaterthan 0 */
							logscrewup (phocur, &inputscrewup);
						}
						delayf0 = mstofr (pDph_t->user_offset[mf0]);
						mf0++;
					}

					make_f0_command (pDph_t, 3, -f0fall, delayf0,0, &cumdur);
					pDphsettar->hat_loc_re_baseline -= f0fall;
				}

				/* 
				 * Rule 4: Add positive pulse to approximate nonterminal fall-rise          
				 * in stressed clause-final but non-sentence-final syllable, 
				 * or in sentence ending in a question mark 
				 */
#ifdef SPANISH
				if ((struccur & FBOUNDARY) == FQUENEXT)
					NotQuest = 0;	   /* it is a question allow early stress */
				if ((struccur & FBOUNDARY) == (FPERNEXT | FEXCLNEXT | FSENTENDS))
				{
					NotQuest = 1;
				}
#endif
				if (((struccur & FBOUNDARY) == FCBNEXT)
					|| ((struccur & FBOUNDARY) == FQUENEXT))
				{
					/* Time rise to begin near end of vowel */
					delayf0 = pDph_t->allodurs[nphon] - NF80MS;
#ifdef SPANISH
					/* Earlier if a long vowel, later if short vowel */
					delayf0 = (NF160MS + delayf0 + delayf0 + delayf0) >> 2;
					/* If impulse too early, f0 goes down again before end */
					if (delayf0 < (pDph_t->allodurs[nphon] - NF100MS))
					{
						delayf0 = pDph_t->allodurs[nphon] - NF100MS;
					}
					pDph_t->delta_special = 0;
#endif
					if ((struccur & FBOUNDARY) == FQUENEXT)
					{
						/* Sent.-final stressed vowel followed by q-mark */
#if defined ENGLISH_US || defined GERMAN || defined FRENCH
						make_f0_command (pDph_t, 4, 181, delayf0,0, &cumdur);
						make_f0_command (pDph_t, 4, 251, pDph_t->allodurs[nphon],0, &cumdur);
#endif

#ifdef SPANISH
						make_f0_command (pDph_t, 4, F0_QBOUND_PULSE, delayf0,0, &cumdur);
#endif
					}
					else
					{
						/* Phrase-final stressed vowel followed by comma */
#if defined ENGLISH_US || defined GERMAN || defined FRENCH
						delayf0 += NF20MS;
						make_f0_command (pDph_t, 4, 171, delayf0,0, &cumdur);
						make_f0_command (pDph_t, 4, 201, pDph_t->allodurs[nphon],0, &cumdur);
#endif
#ifdef SPANISH
						pDph_t->delta_special = -50;
						make_f0_command (pDph_t, 4, F0_CBOUND_PULSE, delayf0,0, &cumdur);
#endif
					}
				}
			}

			/* 
			 * Rule 5: Final fall on unstress clause-final syl, or on stressed 
			 * clause-final syll that didn't have hat fall due to earlier emphasis 
			 */

			if ((feacur & FSYLL) IS_PLUS)
			{
				if (((stresscur & FSTRESS_1) IS_MINUS)	/* 2-str or 0-str */
					|| ((struccur & FHAT_ENDS) IS_MINUS))
				{					   /* or 1-str nofall */

#ifdef SPANISH
					if ((struccur & FTYPESYL) >= FBISYL
						&& ((struccur & FBOUNDARY) > FWBNEXT
							|| (phone_feature( pDph_t,phonex) & FCONSON) IS_PLUS))
					{
#endif
						/* Pitch falls (glottalize) at end of declar. sent. */
						if (((struccur & FBOUNDARY) == FPERNEXT)
							|| ((struccur & FBOUNDARY) == FEXCLNEXT))
						{
							targf0 = F0_GLOTTALIZE;
							/* 
							 * Pitch falls are less pronounced for some speakers 
							 * to reduce impression of assertive personality 
							 */
							targf0 = frac4mul (targf0, pDph_t->assertiveness);
							targf0 |= 01;  /* Must be odd */
							/* Sent.-final unstressed vowel followed by a period */
							make_f0_command (pDph_t, 5, targf0, pDph_t->allodurs[nphon] - NF100MS,0, &cumdur);
						}
	
						/* Rule 6: Continuation rise on unstress clause-final syll before  comma or ? */
	
						/* Rise occurs just before end of vowel */ 
#if defined ENGLISH_US || defined SPANISH || defined FRENCH
						delayf0 = pDph_t->allodurs[nphon] - NF80MS;
						if ((struccur & FBOUNDARY) == FQUENEXT)
						{
#ifdef ENGLISH_US
							/* Unstressed vowel followed by a question mark */
							make_f0_command (pDph_t, 6, 181, delayf0,0, &cumdur);
							make_f0_command (pDph_t, 6, 251, pDph_t->allodurs[nphon],0, &cumdur);
#endif
#ifdef SPANISH
							make_f0_command (pDph_t, 6, F0_QBOUND_PULSE, delayf0,0, &cumdur);
#endif
#ifdef FRENCH
							/* Unstressed vowel followed by a question mark */
							make_f0_command (pDph_t, 6, 181, delayf0,0, &cumdur);
							make_f0_command (pDph_t, 6, 251, pDph_t->allodurs[nphon],0, &cumdur);
#endif
						}
						if ((struccur & FBOUNDARY) == FCBNEXT)
						{
							/* Unstressed vowel followed by a comma */
#ifdef ENGLISH_US
							delayf0 += NF20MS;
							make_f0_command (pDph_t, 6, 71, delayf0,0, &cumdur);
							make_f0_command (pDph_t, 6, 101, pDph_t->allodurs[nphon],0, &cumdur);
#endif
#ifdef SPANISH
							make_f0_command (pDph_t, 6, F0_CBOUND_PULSE, delayf0,0, &cumdur);
#endif
#ifdef FRENCH
							delayf0 += NF20MS;
							make_f0_command (pDph_t, 6, 71, delayf0,0, &cumdur);
							make_f0_command (pDph_t, 6, 101, pDph_t->allodurs[nphon],0, &cumdur);
#endif

						}
#endif /* #if defined ENGLISH_US || defined SPANISH */
#ifdef SPANISH
					}
#endif
				}
			}

			/* Rule 7: Reset baseline at end of sentence */

			if (phocur == SIL)
			{

				/* Reset f0 to hat bottom from sub-hat-bottom */
				if ((pDphsettar->hat_loc_re_baseline != 0) && (pDph_t->nf0tot > 0))
				{
#ifdef GERMAN
					if (pDph_t->cbsymbol)
						make_f0_command (pDph_t, 7, +180, 0,0, &cumdur);
					else
#endif
						make_f0_command (pDph_t, 7, -(pDphsettar->hat_loc_re_baseline),0, 0, &cumdur);
					pDphsettar->hat_loc_re_baseline = 0;
				}
#ifdef ENGLISH_US
				if (nphon > 0)
					pDphsettar->nrises_sofar = 1;	/* Soft reset */
#endif
#ifdef SPANISH
				if ((pDph_t->allofeats[nphon - 1] & FBOUNDARY) == FCBNEXT
					&& pDph_t->nf0tot > 0
					&& (pDph_t->allophons[nphon - 1] != SIL))
				{
					make_f0_command (pDph_t, 7, 0, 0, 0, &cumdur); /* RESET! */
					issubclause = TRUE;
				}
#endif
#ifdef FRENCH
				if (nphon > 0)
					pDphsettar->nrises_sofar = 1;	/* Soft reset */
#endif

				/* Rule 8: Reset baseline and hat position to brim if end of a sentence */
				/*** Add condition to reset if long clause followed by comma and long clause */

				if ((struclas & FSENTENDS) IS_PLUS)
				{
					make_f0_command (pDph_t, 8, 0, 0, 0, &cumdur);
					pDphsettar->hat_loc_re_baseline = 0;
					/* Hard reset counter of stressed sylls in clause */
					pDphsettar->nrises_sofar = 0;
				}
			}
			/* printf("\ndur \t\t%4d\t%4d fotar nphone %d", ((cumdur*64)/10), f0tar[n],nphon); */
		}

	  skiprules:					   /* END OF F0 RULES */

		/* Update cumdur to time at end of current phone */
		cumdur += pDph_t->allodurs[nphon];
			if( (nphon <= (pDph_t->nallotot-1) &&
		(nphon > 0 && pDph_t->allophons[nphon] != 0))//1st two lines check end of cluase
		|| nphon==0 ) //This counts inital silence (we don't vount final silence 
		/* EAB It turns out that there are two possibilites for the way things
		get transmitted one is with and end of cluase symbols and the other is without(implied)
		therefore you have to do two checks to know whether or not your at the last real phoneme
		or at a silence phoneme BATS 791 */
		pDph_t->tcumdur += pDph_t->allodurs[nphon];

#ifdef ENGLISH_US
			/* Rule 9: Add short schwa vowel to create release of [p,t,k,b,d,g] into sil. 
			 * Logically, this kind of rule should appear in PHALLOPH.C, but
			 * delaying it to here makes all dur and f0 rules much simpler 
			 */
		if ((phonex == SIL)
			&& (((phocur >= USP_P) && (phocur <= USP_G))	/* p t k b d g */
													/* || ((feacur & FNASAL) IS_PLUS) */ )
													/* m n nx en */
			&& (pDph_t->nallotot < NPHON_MAX))
		{
			for (n = pDph_t->nallotot; n > nphon; n--)
			{
				pDph_t->allophons[n] = pDph_t->allophons[n - 1];
				pDph_t->allofeats[n] = pDph_t->allofeats[n - 1];
				pDph_t->allodurs[n] = pDph_t->allodurs[n - 1];
				pDph_t->user_f0[n] = pDph_t->user_f0[n - 1];
			}
			pDph_t->allophons[nphon + 1] = USP_AX;
			if ((pholas < USP_AE)
				|| ((phocur >= USP_T) && (phocur <= USP_D)))
			{
				pDph_t->allophons[nphon + 1] = USP_IX;
			}
			pDph_t->allodurs[nphon + 1] = NF25MS;
			cumdur += NF25MS;
			pDph_t->allofeats[nphon + 1] = pDph_t->allofeats[nphon] | FDUMMY_VOWEL;
			pDph_t->nallotot++;
			nphon++;
		}
#endif  /* #ifdef ENGLISH_US */
#ifdef SPANISH
		/* Rule 9: Add short vowel to create release of [p,t,k,b,d,g] into sil. *   Logically, this kind of rule should appear in PHALLOPH.C, but *
		 *   delaying it to here makes all dur and f0 rules much simpler */
		if ((phonex == SIL)
			&& ((feacur & FPLOSV) IS_PLUS)
			&& (pDph_t->nallotot < NPHON_MAX))
		{
			for (n = pDph_t->nallotot; n > nphon; n--)
			{
				pDph_t->allophons[n] = pDph_t->allophons[n - 1];
				pDph_t->allofeats[n] = pDph_t->allofeats[n - 1];
				pDph_t->allodurs[n] = pDph_t->allodurs[n - 1];
				pDph_t->user_f0[n] = pDph_t->user_f0[n - 1];
			}
			if ((fealas & FVOWEL) IS_PLUS)
				pDph_t->allophons[nphon + 1] = pholas;
			else if (pholas == E_YX)
				pDph_t->allophons[nphon + 1] = E_I;
			else if (pholas == E_YX)
				pDph_t->allophons[nphon + 1] = E_I;
			else
			{
				pDph_t->allophons[nphon + 1] = E_A;
			}
			pDph_t->allodurs[nphon + 1] = DUMMY_V_DUR;
			cumdur += DUMMY_V_DUR;
			pDph_t->allofeats[nphon + 1] = pDph_t->allofeats[nphon] | FDUMMY_VOWEL;
			pDph_t->tcumdur +=pDph_t->allodurs[nphon+1];
			pDph_t->nallotot++;
			nphon++;
		}
#endif
#ifdef FRENCH
			/* Rule 9: Add short schwa vowel to create release of [p,t,k,b,d,g] into sil. 
			 * Logically, this kind of rule should appear in PHALLOPH.C, but
			 * delaying it to here makes all dur and f0 rules much simpler 
			 */
		if ((phonex == SIL)
			&& (((phocur >= P) && (phocur <= G))	/* p t k b d g */
													/* || ((feacur & FNASAL) IS_PLUS) */ )
													/* m n nx en */
			&& (pDph_t->nallotot < NPHON_MAX))
		{
			for (n = pDph_t->nallotot; n > nphon; n--)
			{
				pDph_t->allophons[n] = pDph_t->allophons[n - 1];
				pDph_t->allofeats[n] = pDph_t->allofeats[n - 1];
				pDph_t->allodurs[n] = pDph_t->allodurs[n - 1];
				pDph_t->user_f0[n] = pDph_t->user_f0[n - 1];
			}
			pDph_t->allophons[nphon + 1] = AX;
			if ((pholas < AE)
				|| ((phocur >= T) && (phocur <= D)))
			{
				pDph_t->allophons[nphon + 1] = IX;
			}
			pDph_t->allodurs[nphon + 1] = NF25MS;
			cumdur += NF25MS;
			pDph_t->allofeats[nphon + 1] = pDph_t->allofeats[nphon] | FDUMMY_VOWEL;
			pDph_t->nallotot++;
			nphon++;
		}
#endif //french
	}
}

 
/*
 *      Function Name: make_f0_command()      
 *
 *  	Description: Put an f0 command into f0tar and f0tim arrays  
 *
 *      Arguments: 	PDPH_T pDph_t, 
 *				   	short rulenumber, 
 *					short tar,
 *		            short delay, 
 *		            short *psCumdur
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */


static void make_f0_command (PDPH_T pDph_t, short rulenumber, short tar, short delay,
					  		 short length, short *psCumdur)
	

{

	/* Cudur reflects time (in frames) since last f0 command        */
	/* Cumdur + delay should never be less than zero                  */

	/* static short prpholas, temp; *//* MVP : Never Used,comment it out */
	/* If requested time is earlier than last f0 command, zero offset */


		//WINprintf(" rule %d  , tar %d delay %d length %d  \n", rulenumber, tar, delay, length);


	if ((delay + *psCumdur) < 0)
	{
		delay = -(*psCumdur);
	}

	/* Save commands */
	pDph_t->f0tim[pDph_t->nf0tot] = *psCumdur + delay;
	pDph_t->f0tar[pDph_t->nf0tot] = tar;

	/* "Zero" counter of time since last command */
	*psCumdur = (-delay);

	/* Increment counter of number of f0 commands issued */
	if (pDph_t->nf0tot < NPHON_MAX - 1)
	{
		pDph_t->nf0tot++;
	}

}
 
/*
 *      Function Name:logscrewup()       
 *
 *  	Description: 
 *
 *      Arguments: 	short phocur, 
 *					short *inputscrewup
 *
 *      Return Value: void 
 *
 *      Comments:
 *
 */

void logscrewup (short phocur, short *inputscrewup)
{

	*inputscrewup = TRUE;
}

/*************************end of ph_inton.c**************************************/
#endif /*ifdef NWS_US || ENGLISH_UK */