/* ww_02_27_01
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © SMART Modular Technologies 1999, 2000. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998, 1999 All rights reserved.
 *
 *     U.S. Government Rights: Consistent with FAR 12.211 and 12.212, 
 *     Commercial Computer Software, Computer Software Documentation, 
 *     and Technical Data for Commercial Items are licensed to the U.S. 
 *     Government under vendor's standard commercial license.
 *
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
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
 * 0001 DK 		12/16/1984		Initial creation
 * 0002 DGC		12/27/1984		Version for 80186, use mstofr()
 * 0003 DK		01/09/1985		Fix handling of user inputted f0 commands
 * 0004 DK		01/21/1985		Fix bug causing f0 to drift down in long sentences
 * 0005 DK		03/01/1985		Reduce pitch gestures in a clause ended by "?"
 * 0006 DK		04/18/1985		Try releasing final nasals into silence for intellig.
 * 0007 DK		04/25/1985		Fix continuation rise so not too early
 * 0008 DK		05/17/1985		F0 fall cannot occur too early in a long vowel
 * 0009 DK		06/14/1985		Fix f0 fall for f0mode=HAT_LOCATIONS_SPECIFIED
 * 0010 DK		06/19/1985		Fix insertion of dummy-vowel phoneme
 * 0011 MGS		03/25/1996		Merged WIN 95 code to 42c 
 * 0012 MGS		04/01/1996		Added MSDBG blocks
 * 0013 MGS		06/04/1996		Merged Spanish with English 
 * 0014	MGS		06/06/1996		Changed file name from phinton.c ph_inton.c
 * 0015 EDB		01/10/1997		Fix many data.
 * 0016 EAB		02/22/1997		Copied rule 3 was checked to make it work with new doitlater code in ph_aloph
 *								It has to be in twice so that the rules fire in the proper order i.e. otherwise
 *								rule 4 will fire before rule three in a normal ordering. Time eprmitting later
 *								thus may be able to be simplified.
 * 0017 EAB		04/09/1997		Fixed hat_rise fall phonemic markings see note below
 *								Fixes BAT 346
 * 0018 EAB		04/18/1997		Completed merge with 5.0 and French plus fixed a problem where somehow and extra line of code
 *								erroneuosly snuck in.
 * 0019 EAB		05/15/1997		Found that hat_rise hat_fall still didn't work and traced problem back to rewrite in1984
 *								I also removed uneeded restriction that a hat_rise couldn't operate if someone had already
 *								put in a hat rise. Let people do whatever they want aldo this removed the variable hatpos
 *								The code now assigns the hat rise or fall to the next phoneme that is FSYLL perhaps later
 *								we might want to open it up to FSONOR. Also night want to defferiate final fall effects from
 *								final hat fall and not have it automatic.
 *
 * 0020 KSB		05/20/1997		Moved f0 and place to gl_phones
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
 * 0027 EAB		02/10/1998		Submitted wrong version with a bug causing last gesture to be incorrect BATS 600
 * 0028 EAB		02/16/1998		Re-wrinting for 4.5+ go get all on the same base 
 * 0029 EAB		03/02/1998		Added length to IMPULSE commands to support new command syntax ( note step by definition
 *								have a length of zero-we could change it to be a ramp
 * 0030	gl		03/25/1998		Added DBGV command for PH debug variable passing
 *								also add dectalkf.h to catch the defined symbol
 *								For BATS#639 to change phinton() to use argument phTTS instead of pDph_t
 * 0031 EAB		04/10/1998		Add new German tuning rules plus add new parameters for debug printout to Make_f0
 * 0032 EAB		06/07/1998		eab 7/8/98 Begin to remove hat rise hat fall pattern. It doesn't just do the rise fall so like
								a cancer tumor the removal must be carefully done
 * 0033 EAB		07/08/1998		BATS 711 found bug in counting tcumdur + 709 German tuning
 * 0034 EAB		07/22/1998		First pass at adding wordfeatr with part of speech
								to intonation. Removed old GERMAN unused wordclass...
 * 0035 EAB		07/24/1998		Modified calling handle of MAKE_F0 to support debug printouts
 * 0036 EAB		08/17/1998		Spanish tuning with Juan
 * 0037 EAB		09/11/1998		Still improving/experimenting to improve naturalness
 * 0038 EAB		09/29/1998		Found some hidden problems ewhere values
 *								were getting sucked out of ROM.c instead of locally --also
 *								tuned for SPANISH_LA
 * 0039 EAB		10/16/1998		Final tuning from new release of spanish
 * 0040 EAB		10/22/1998		Bats 776- Some arrays were too short for max pointer movement
 *								causing a failure depending on whether the data follwoing the array 
 * 								was freindly or unfreindly values......
 * 0041 EAB						Further tuning of intonation values for relelase
 * 0042 EAB		11/04/1998		Final glotalization gesture is very sensitive to timing and needs to be adjusted in onset if
 *								the phoneme following the syllable nucleus is voiced BATS 796.
 * 0043 EAB		11/06/1998		Final adjustments for new release-this file is not the default version but I wanted to give an
 *								option to chose it BATS 807
 * 0044 EAB		11/09/1998		Tuned the UK_English male and female voice BATS 777
 *								if (new_intonation enabled for UK) This as part of the overall 5.0
 *								tuning process file in AD already contains changes 
 * 0045 EAB		11/10/1998		Fixed BATS 791 failure was dur to the fact that typing mode
 *								sent data without and end of clause which ph can handle but the tcumdur
 *								calulation was not handling correctly.
 * 0046	GL		11/20/1998		BATS#828 use PH_DEBUG to replace _DEBUG
 * 0047 EAB		02/03/1999		Added change from NWSNOAA->NWS_US for multi language NOA
 *								Plus did some tuning and added an printout to verifiy that some code is no longer
 *								needed and can be removed later and chnaged a variale name to a more explanatory one
 * 0048 EAB						Added in copyright notices plus trying to tune this ad code
 * 0049 EAb		06/07/1999		BATS 897
 * 0050 EAB		04/17/1999		Tuning changes for 4.6
 * 0051 EAB		04/18/1999		Fixed ifdef for UK for N_last_sylL...
 * 0052 CAB		03/15/2000		WINprintf not supported under Windows CE
 * 0053 MGS		04/13/2000		Changes for integrated phoneme set 
 * 0054 NAL		04/14/2000		Changed externs featb, begtyp to match declaration
 * 0055 CAB		05/23/2000		WINprintf not supported under Windows CE
 * 0056 NAL		06/12/2000		cast varibales (warning removal)
 * 0057 EAB		06/28/2000		Unified Phoneme Set Changes
 * 0058 CHJ		07/20/2000		French added
 * 0059 CHJ		07/28/2000		French feature bit modifications
 * 0060 CAB		09/21/2000		Fixed  copyright infoi and formatted comment section.
 * 0061 EAB		03/02/2001		Changed Fsonor back to FVOICD for rule 6 as silence has always
 *								been declared an FSONOR which causes this rule to do bad things.....
 *								also end glottal rules will be moved shortly to pressure model
 * 0062 EAB		03/13/2001		Tuning of intonation with Winfried.
 * 0063 EAB		03/28/2001		Fix bats 952 comma intonation
 * 0064 CAB		05/16/2001		Fixed warning by adding ()
   0046 EAB		07/10/2001
 * 0047 CAB		05/02/2002		Condensed #if
 * 0048 CAB		05/22/2002		Removed warnings
 */
/* #define MSDBG4 */

//BTS10192 Fixes some phoneme based on MRT
#include "ph_def.h"

#define BEFORE_HAT_RISE			0
#define ON_TOP_OF_HAT			1
#define AFTER_FINAL_FALL		2
#define AFTER_NONFINAL_FALL		3
#define DONTKNOW				0
#define QUESTCLAUSE				1
#define VERBPHRASE				2
#define PERIODCLAUSE			3

/* 
 * Duration of the "dummy vowel" inserted after a clause-final stop.
 */
/* #define  DUMMY_V_DUR NF25MS      -- seems a bit long */
#define DUMMY_V_DUR   NF15MS



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
/*   1/17/99 EAB Note cbcymbol is either 0 or the phonemic value of a ?    */
/*	so if(cbsymbol == Quest) and if(cbsymbol) are equivalent               */
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

//extern short f0_stress_level[];			/* F0 rise as f(stress-level)  	 */

//extern __inline short phone_feature(PDPH_T pDph_t, int phone);	   /* Phonetic features            */
//extern __inline short begtyp(int phone);
//extern short *begtyp;

#define phone_feature(a,b) (all_featb[(b)>>8][(b)&0x00ff])
#define begtyp(b) all_begtyp[(b)>>8][(b)&0xFF]

/* MVP : Static function declarations */
static void make_f0_command (LPTTS_HANDLE_T phTTS,short type, short rulenumber, short tar, short delay,
					  		 short length,short *psCumdur,short nphon);
	


/*
 *      Function Name: phinton()      
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS		Text-To-speech handle
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
/* GL 03/25/1998,  BATS#639 use phTTS argument instead of pDph_t */
void phinton (LPTTS_HANDLE_T phTTS)
{
	PKSD_T	pKsd_t = phTTS->pKernelShareData;
	PDPH_T	pDph_t = phTTS->pPHThreadData;
	int		temp;




	PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;

short F0_CBOUND_PULSE;
short SCHWA1;
short SCHWA2;
short F0_QGesture1;
short  F0_QGesture2;
short F0_CGesture1;
short F0_CGesture2;
short GEST_SHIFT;
short  MAX_NRISES;
short F0_FINAL_FALL;
short F0_NON_FINAL_FALL;
short  F0_QSYLL_FALL;
short F0_GLOTTALIZE;
short Reduce_last;
short F0_COMMA_FALL;



#define EMPH_FALL		  1				/* stress reduce shift for emph. stress 	*/
#define DELTAEMPH_SPEC  505				/* special value for fast emphatic str 	*/
#define DELTAEMPH		501				/* normal value for emphatic stress 		*/
#define DELTARISE		200				/* rise for continuing cadence */
#define DELTAFINAL		100				/* delta to remain at top in final cad. */
#define FINAL_FALL		  1				/* stress reduce shift for str. at top */


short *f0_mstress_level;
short *f0_fstress_level;
short *f0_mphrase_position;
short *f0_fphrase_position;


/* eab 2/26/97 EAB Group hardcoded items into one file to be 
handled differently later */
/* Note F0_Final _fall is the number of hertz *10 that it
   will try to fall below the baseline on a declarative stressed final syllable.
*/




/*nd, ... accent in a phrase
	* Check against MAX_NRISES in phinton.c
	*/
	
	const short gr_f0_mphrase_position[] =
	{
		/* First clause    Second clause  */
		/* 300, 275, 250, 200, 175, 150, 50,50 last pos=0 causes bad problems */
		110, 90, 60, 40, 20, 20 , 20, 20};
	const short gr_f0_fphrase_position[] =
	{
		/* First clause    Second clause  */
		/* 300, 275, 250, 200, 175, 150, 50,50 last pos=0 causes bad problems */
		110, 90, 60, 40, 20, 20 , 20, 20};
	/* 
	* F0 rise as f(stress-level); Order is
	* FNOSTRESS  unstressed
	* FSTRESS_1  primary stress
	* FSTRESS_2  secondary stress
	* FEMPHASIS  emphatic stress
	*/

	/* 0,       71,     31,    261 eab original stress */
	
	const short gr_f0_mstress_level[] =
	{
		/* 'stress `stress "stress                      */
		0, 51+20, 31, 261					   /* eab original stress */
			
	};
	const short gr_f0_fstress_level[] =
	{
		/* 'stress `stress "stress                      */
		0, 51+20, 31, 261					   /* eab original stress */
			
	};

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

//BATS 776 EAB 10/22/98 add values to arrays

//#define POETRY
#ifdef POETRY
	const short us_f0_mphrase_position[] =
{210, 50, 40, 30, 30, 20, 20, 10};
#else
	const short us_f0_mphrase_position[] ={160, 80, 60, 40, 30, 20, 20, 5};
#endif

	/* Was: 210, 90, 40, 20 */
	
	/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */
	
	/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired IMPULSE
	* function */
	
	const short us_f0_mstress_level[] =
	{1, 81, 61, 161 };
	
	/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */
	
	const short us_f0_fphrase_position[] =
	{ 180, 80, 70, 60, 50, 40, 34, 30 };

	
	
const short us_f0_fstress_level[] =	{1, 100, 80, 161};


const	short uk_f0_mphrase_position[] = { 100,  90,  80,  60,  40,  20,  0,  0 };
const 	short uk_f0_mstress_level[] = { 1,  85,  51,  190,  0,  0,  0,  0 };
const short uk_f0_fphrase_position[] = { 100,  90,  80,  60,  40,  20,  0,  0 };
const short uk_f0_fstress_level[] = { 1,  90,  68,  210,  0,  0,  0,  0 };




const short la_f0_mphrase_position[] =
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

const short la_f0_mstress_level[] =
{
/* 'stress `stress "stress                      */
	0, 81, 61, 261					   /* eab original stress */

};
/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */

const short la_f0_fphrase_position[] =
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
const short la_f0_fstress_level[] =
{
/* 'stress `stress "stress                      */
  	0, 131, 81, 261	
	

};

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired IMPULSE
 * function */

//const short f0_stress_level [] = { 01, 71, 51, 281 };
const short sp_f0_mphrase_position[] =
{
	  /* First clause    Second clause  */
/* 300, 275, 250, 200, 175, 150, 50,50 last pos=0 causes bad problems */
	//300,275, 250, 200, 175, 150, 50, 50	   /* last pos=0 causes bad problems */
	130,85, 70, 50, 40, 30, 30, 30
};

/* 
 * F0 rise as f(stress-level); Order is
 *      FNOSTRESS       unstressed
 *      FSTRESS_1       primary stress
 *      FSTRESS_2       secondary stress
 *      FEMPHASIS       emphatic stress
 */


/* 0,       71,     31,    261 eab original stress */

const short sp_f0_mstress_level[] =
{
/* 'stress `stress "stress                      */
  /* 0,       51-10,     31-10,    161-50 */   /*eab  */
	0, 81, 61, 241					   /* eab original stress */
};
/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */
const short sp_f0_fphrase_position[] =
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
const short sp_f0_fstress_level[] =
{
/* 'stress `stress "stress                      */
  /* 0,       51-10,     31-10,    161-50 */  /*eab  */
	0, 121, 81, 261					   /* eab original stress */

};


const short it_f0_mphrase_position[] =
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

const short it_f0_mstress_level[] =
{
/* 'stress `stress "stress                      */
	0, 81, 61, 261					   /* eab original stress */

};
/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */

const short it_f0_fphrase_position[] =
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
const short it_f0_fstress_level[] =
{
/* 'stress `stress "stress                      */
  	0, 131, 81, 261	
	

};






	/* Automatic variables */
	short nphon = 0, mf0 = 0;
	short gesture_ref=0;
	short length=0;
	short n_last_syl_nuc;
	short pholas = 0, struclas = 0, fealas = 0;
	U32  struccur = 0, feacur = 0;
	U32  stresscur = 0, wordfeat=0;
	short phonex = 0, strucnex = 0, feanex = 0;
	short targf0 = 0, delayf0 = 0;
	short f0fall = 0;		/* Extra fall below baseline at end of clause */
	short nphonx = 0;		/* short temp is never used MVP */
	short cumdur = 0, phocur = 0;		/* MVP : made local */
	short stepcount;
	short inputscrewup = 0;	/* MVP : was of type FLAG */
	short lowrisesw;	
	short nextsylbou =0 ,nextwrdbou =0 ,nextphrbou =0;
	short issubclause = 0;   /* TRUE signals subordinate clause */
	short NotQuest = 1;
	short n=0;

	pDph_t->delta_special=0;
	pDphsettar->nrises_sofar = 0;
	pDphsettar->hatsize = 0;
	pDphsettar->hat_loc_re_baseline = 0;

	/* Beginning of initialization */
//	pDph_t->commacnt =0; //BATS709
	
	inputscrewup = FALSE;
	cumdur = 0;
	stepcount=0;
	pDph_t->had_hatbegin=0;
	pDph_t->had_hatend=0;
	pDph_t->had_in_phrase_final = 0;
	pDph_t->nf0tot = 0;
	pholas = GEN_SIL;
	fealas = phone_feature( pDph_t,GEN_SIL);
	struclas = 0;
	mf0 = 0;
	pDph_t->prevtargf0 = -1; /* EAB 1/13/98 Want first target to end up plus
							also initalize completion flag */
	pDph_t->done =0;


if(pKsd_t->lang_curr == LANG_german)
{
f0_mstress_level = (short *)gr_f0_mstress_level;
f0_fstress_level = (short *)gr_f0_fstress_level;
f0_mphrase_position = (short *)gr_f0_mphrase_position;
f0_fphrase_position = (short *)gr_f0_fphrase_position;



 SCHWA1 = GRP_EX;
 SCHWA2 = GRP_EX;
 F0_QGesture1 =281-100;
 F0_QGesture2 = 351-100;
 F0_CGesture1 = 160-60;
 F0_CGesture2 = 140-60;
 GEST_SHIFT = 1;
   MAX_NRISES = 6;
   F0_FINAL_FALL = 180;
   F0_NON_FINAL_FALL = 80;
	  F0_QSYLL_FALL	= 80;
   F0_GLOTTALIZE  = -100;
 Reduce_last = 10;
}
else if(pKsd_t->lang_curr == LANG_latin_american)
{
f0_mstress_level = (short *)la_f0_mstress_level;
f0_fstress_level = (short *)la_f0_fstress_level;
f0_mphrase_position = (short *)la_f0_mphrase_position;
f0_fphrase_position = (short *)la_f0_fphrase_position;


   F0_CBOUND_PULSE  = 700;
   F0_GLOTTALIZE  = -60; //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
 SCHWA1 = LAP_IX;
 SCHWA2 = LAP_IX;
 F0_QGesture1 = -150;
 F0_QGesture2 = -350;
 F0_CGesture1 = -81;
 F0_CGesture2  = 171;
 GEST_SHIFT = 2;
   MAX_NRISES  = 6;
   F0_FINAL_FALL  =	180;
   F0_NON_FINAL_FALL  =	150;
	  F0_QSYLL_FALL	= 80;
 Reduce_last = 50; 
}
else if(pKsd_t->lang_curr == LANG_spanish)
{
f0_mstress_level = (short *)sp_f0_mstress_level;
f0_fstress_level = (short *)sp_f0_fstress_level;
f0_mphrase_position = (short *)sp_f0_mphrase_position;
f0_fphrase_position = (short *)sp_f0_fphrase_position;


   F0_CBOUND_PULSE = 700;
   F0_GLOTTALIZE   = -60; //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
 SCHWA1 = SPP_IX;
 SCHWA2 = SPP_IX;
 F0_QGesture1 = -150;
 F0_QGesture2 = -350;
 F0_CGesture1 = -81;
 F0_CGesture2 = 171;
 GEST_SHIFT = 2; 
   MAX_NRISES = 6;
   F0_FINAL_FALL = 180;
   F0_NON_FINAL_FALL = 150;
	  F0_QSYLL_FALL	 = 80;
 Reduce_last = 30;
}
else if(pKsd_t->lang_curr == LANG_italian)
{
f0_mstress_level = (short *)it_f0_mstress_level;
f0_fstress_level = (short *)it_f0_fstress_level;
f0_mphrase_position = (short *)it_f0_mphrase_position;
f0_fphrase_position = (short *)it_f0_fphrase_position;


   F0_CBOUND_PULSE = 700;
   F0_GLOTTALIZE   = -60; //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
 SCHWA1 = SPP_IX;
 SCHWA2 = SPP_IX;
 F0_QGesture1 = -150;
 F0_QGesture2 = -350;
 F0_CGesture1 = -81;
 F0_CGesture2 = 171;
 GEST_SHIFT = 2; 
   MAX_NRISES = 6;
   F0_FINAL_FALL = 180;
   F0_NON_FINAL_FALL = 150;
	  F0_QSYLL_FALL	 = 80;
 Reduce_last = 70;
}

else if(pKsd_t->lang_curr == LANG_english)
{ 


#ifdef SUEB
f0_mstress_level = (short *)us_f0_mstress_level;
f0_fstress_level = (short *)us_f0_fstress_level;
f0_mphrase_position = (short *)us_f0_mphrase_position;
f0_fphrase_position = (short *)us_f0_fphrase_position;
SCHWA1 = USP_AX;
 SCHWA2 = USP_IX;
 F0_QGesture1 = 351;
 F0_QGesture2 = 451;
 F0_CGesture1 = 171;
 F0_CGesture2 = 250;
 GEST_SHIFT = 1;
   MAX_NRISES   = 7;
   F0_FINAL_FALL  =	350;
   F0_NON_FINAL_FALL  = 150;
	  F0_COMMA_FALL	= 120;
	  F0_QSYLL_FALL	= 80;
   F0_GLOTTALIZE   = -60; //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
   Reduce_last = 10;
#else
f0_mstress_level = (short *)us_f0_mstress_level;
f0_fstress_level = (short *)us_f0_fstress_level;
f0_mphrase_position = (short *)us_f0_mphrase_position;
f0_fphrase_position = (short *)us_f0_fphrase_position;
SCHWA1 = USP_AX;
 SCHWA2 = USP_IX;
 F0_QGesture1 = 351;
 F0_QGesture2 = 451;
 F0_CGesture1 = 171;
 F0_CGesture2 = 250;
 GEST_SHIFT = 1;
   MAX_NRISES   = 7;
   F0_FINAL_FALL  =	550;
   F0_NON_FINAL_FALL  = 150;
	  F0_COMMA_FALL	= 120;
	  F0_QSYLL_FALL	= 80;
   F0_GLOTTALIZE   = -60; //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
   Reduce_last = 10;






#endif
}
else if(pKsd_t->lang_curr == LANG_british)
{ 
f0_mstress_level = (short *)uk_f0_mstress_level;
f0_fstress_level = (short *)uk_f0_fstress_level;
f0_mphrase_position = (short *)uk_f0_mphrase_position;
f0_fphrase_position = (short *)uk_f0_fphrase_position;

SCHWA1 = UKP_AX;
 SCHWA2 = UKP_IX;
 F0_QGesture1 = 351;
 F0_QGesture2 = 451;
 F0_CGesture1 = -50;
 F0_CGesture2 = 220;
 GEST_SHIFT = 1;
   MAX_NRISES  = 6; 
   F0_FINAL_FALL  = 160;
   F0_NON_FINAL_FALL  = 150;
	  F0_QSYLL_FALL	= 80;
   F0_GLOTTALIZE  = -10; //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
	  F0_COMMA_FALL	 = 120;
 Reduce_last = 10;
}



	/* Should set nrises_sofar to zero after a ph_init=0 hard reset */
	/* End of initialization */

if (pKsd_t->lang_curr == LANG_british)
	/* Find last syllable nucleus*/
	/* EAB Part of BATS 600 nphon->n_last_syl_nuc*/
		for(n_last_syl_nuc=pDph_t->nallotot;n_last_syl_nuc > 1;n_last_syl_nuc--)
			{
			if ((phone_feature( pDph_t,pDph_t->allophons[n_last_syl_nuc]) & FSYLL) IS_PLUS)
				break;
			}


	/* MAIN LOOP, for each output phoneme */

	for (nphon = 0; nphon < pDph_t->nallotot; nphon++)
	{
		if (nphon > 0)
		{
			pholas = pDph_t->allophons[nphon - 1];
			struclas = pDph_t->allofeats[nphon - 1];
			fealas = phone_feature(pDph_t,pholas);
		}

		phocur = pDph_t->allophons[nphon];
		struccur = pDph_t->allofeats[nphon];
		

		if(struccur & WORDFEAT) /*EAB This weird code allows for wordfeat to be updaed only when new information arrives
								This is test code and in reality it needs to be cleared at a word boundary
								The above code is not syncronizing ok*/
		{
			wordfeat = struccur & WORDFEAT;
			if(wordfeat & F_NOUN)
			{
				wordfeat = 25;
			}
			else if(wordfeat & F_VERB)
			{
				wordfeat = 20;

			}
			else if(wordfeat & F_ADJ)
			{
				wordfeat = 35;
			}
		}
		else

		wordfeat=0;
		stresscur = struccur & FSTRESS;
		feacur = phone_feature( pDph_t,phocur);
		if (nphon < (pDph_t->nallotot - 1))
		{
			phonex = pDph_t->allophons[nphon + 1];
			strucnex = pDph_t->allofeats[nphon + 1];
			feanex = phone_feature( pDph_t,phonex);
		}

		/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
		/*		      O P E N   Q U O T I E N T			     */
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

		/*	  Rules for setting open quotient OQ targets */
	    pDph_t->alloopenq[nphon] = 50;		/* Default */

#if (defined ENGLISH && !(defined HLSYN))
		if ((fealas & FVOICD) IS_MINUS && pholas != GEN_SIL) {
			if ((feacur & FSON1) IS_PLUS)
			{	pDph_t->alloopenq[nphon] = 70;		/* Spread glottis */
				if ((pholas == USP_F) || (pholas == USP_TH) || (pholas == USP_S)
				|| (pholas == USP_SH) || (pholas == USP_CH))
				{	pDph_t->alloopenq[nphon] = 30;	/* Stiff vocal folds at onset*/
				}
			}
		}
		else if (((fealas & FOBST) IS_PLUS)
			&& ((fealas & FBURST) IS_MINUS))
		{	pDph_t->alloopenq[nphon] = 70;	  /* Slack folds to maintain voicing */
		}				  /*  in a voiced fricative. */
		else if ((pholas == GEN_SIL)
			&& (stresscur IS_PLUS))
		{	pDph_t->alloopenq[nphon] = 30;
			pDph_t->alloopenq[nphon-1] = 30;	/* Glottalized attack */
		}
		
		if (pDph_t->hatstate == AFTER_NONFINAL_FALL) {
			if ((feacur & FVOICD) IS_MINUS) {
				pDph_t->alloopenq[nphon] = 30;	  /* Glottalized offset */
			}
		}
		if ((fealas & FVOICD) IS_PLUS)
		{	if ((feacur & FVOICD) IS_MINUS)
			{	pDph_t->alloopenq[nphon] = 70;	/* breathy offset */
				if ((phocur == GEN_SIL) || (phonex == GEN_SIL))
				{	pDph_t->alloopenq[nphon] = 30;	  /* Glottalized offset */
				}
			}
		}
//#endif
#endif // ENGLISH && not hlsyn

		pDph_t->hatstatel = pDph_t->hatstate;	/* Remember previous state */
		if (phocur == GEN_SIL) {
			pDph_t->hatstate = BEFORE_HAT_RISE;
		}
		//numwowels not used yet so removed BATS 711
		        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
//#ifndef GERMAN /* 02_10_01 RSM */
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
		if (nextsylbou >= FCBNEXT) {				/* RSM To not count spurious FPPNEXT, FVPNEXT, and FRELNEXT */
			nextphrbou = nextwrdbou;
		}
		/*	  Step 6, Look ahead if this is not a phrase-final syllable */
		else {
			//wait this code is broken phonex+1

			/*
			for (phonex=phonex+1;nphonx<pDph_t->nallotot; nphonx++) {
				if ((nextphrbou=pDph_t->allofeats[nphonx]&FBOUNDARY)>FRELNEXT) {	
					goto fbfound;
				}
			}*/
		}
//fbfound:


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
			make_f0_command ( phTTS, USER,0, (short)(1000 + pDph_t->user_f0[nphon]), 0, 0, &cumdur,nphon); // NAL warning removal
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
	/* eab 7/8/98 Begin to remove hat rise hat fall pattern. 
	EAB 1/25/98 Since evreyone is so used to the sound of it I think we need to keep hat_rise_fall*/
	

if( pDph_t->number_words > 2  )
{
	if((struccur & FHAT_BEGINS) IS_PLUS  )
		pDph_t->had_hatbegin= 1;
	/* eab 4/30/98  another oliver check I think hat falls are good*/

	if((struccur & FHAT_ENDS) IS_PLUS )
		pDph_t->had_hatend= 1;
}



if((struccur & F_IRESET )
   && pDph_t->hatstate == ON_TOP_OF_HAT)
{
//	   printf("saw reset\n");
		//When I set this I didn't know what else what yet to come only do this
	//if we're far from the end
			if(pDph_t->nallotot > (nphon+10))
				pDph_t->had_hatend= 1;
			
}	



	if ((pDph_t->f0mode == NORMAL) || (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED))
	{

		if ((feacur & FSYLL) IS_PLUS)
		{
if(pKsd_t->lang_curr == LANG_british)
{

		/* Code now works correcctly for UK placing gesture on last syllable
		   not on last stresssed syllable as american english does */
			
			if( pDph_t->number_words > 2  )
			{
				/* n_last_syl_nuc is at the last vowel i.e. last syl nucleus*/
				if((pDph_t->nallotot -nphon) <6)
				{
					if (nphon == n_last_syl_nuc)
					{
						make_f0_command( phTTS,GLIDE, 23, -150, (short)( -(pDph_t->allodurs[nphon-1]) ), 
							             pDph_t->allodurs[nphon-1], &cumdur, nphon); // NAL warning removal
						make_f0_command( phTTS,GLIDE, 23, +150, 0, pDph_t->allodurs[nphon], &cumdur, nphon);
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
					make_f0_command( phTTS,GLIDE, 20,targf0 , -6,pDph_t->allodurs[nphon], &cumdur, nphon);
					make_f0_command( phTTS,GLIDE, 21, (short)(pDph_t->prevtargf0>>3), pDph_t->allodurs[nphon],
									 pDph_t->allodurs[nphon+1], &cumdur, nphon); // NAL warning removal
					goto skiprules;
			}

}

			/* eab 4/9/97 BATS#346  use had_hatbegin instead of FHAT_BEGINS*/
			if (pDph_t->had_hatbegin)
			{

				if (pDph_t->f0mode == NORMAL && !pDph_t->special_phrase)
				{
					pDph_t->had_hatbegin=0;
					pDphsettar->hatsize = pDph_t->size_hat_rise;	/* speaker-def param */
					
					if(nphon >10)
					{
#ifdef POETRY
						pDphsettar->hatsize = pDphsettar->hatsize;
#else
						pDphsettar->hatsize = pDphsettar->hatsize+15;
#endif
					}
					if(nphon == 2) //extra when first syllable.
					{
						pDphsettar->hatsize += 70;
					}

					/* 
					* PUT IN CODE TO REDUCE HATSIZE IN SHORTER OF 
					* TWO HAT PATTERNS OF A SENTENCE 
					*/

					
					
				
						/* Begin gesture earlier if also hat fall on same vowel */



if(pKsd_t->lang_curr != LANG_german)
{					
						//if first syllable voiced stressed
						make_f0_command( phTTS,STEP, 1, pDphsettar->hatsize,0,5, &cumdur, nphon);
						//if primary stressed item much later in the sentence 
						//make_f0_command( phTTS,GLIDE, 1, 80/*pDphsettar->hatsize*/, -2/*delayf0*/,10, &cumdur, nphon);
						//( phTTS,GLIDE, 1, 320/*pDphsettar->hatsize*/, -2/*delayf0*/,10, &cumdur, nphon);
}
else
{					
						make_f0_command( phTTS,STEP, 1, (short)(pDphsettar->hatsize), delayf0, 10, &cumdur, nphon);
						
}
			
						}
						else if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED)
						{
							pDphsettar->hatsize = ((pDph_t->user_f0[mf0] - 200) * 10) + 2;
							if ((pDphsettar->hatsize >= 2000) || (pDphsettar->hatsize <= 0)
								|| (inputscrewup == TRUE))
							{
								/* this is abort code for a goof*/
								pDphsettar->hatsize = 2;	/* Must be even, greater than 0 */
								
							}
							delayf0 = mstofr (pDph_t->user_offset[mf0]);
							mf0++;

							/* Make hat rise occur at user_dur ms re vowel onset */
//eab hat rise at least for susan and idane look like 
//0 delay punch it at beggining of stress vowel if aspirated you probably don't even see it.
if(pKsd_t->lang_curr != LANG_german)
{					
							make_f0_command( phTTS,STEP, 1, (short)(pDphsettar->hatsize),
											 0, 15, &cumdur, nphon); // NAL warning removal
}

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

					{			/* Primary or emph */
						/* Make stress IMPULSE prop. to degree of stress */
						/* and stress position relative to clause onset */


					/* BATS 711 SHould be fine for anybody coughing up 
					   a verb but only GERMAN does right now*/

						if(wordfeat)
						{
							if (pDph_t->malfem == MALE)
								targf0 = f0_mstress_level[stresscur]+wordfeat;
							else
								targf0 = f0_fstress_level[stresscur]+wordfeat;
						}
						else
						{
							if (pDph_t->malfem == MALE)
								targf0 = f0_mstress_level[stresscur];
							else
								targf0 =  f0_fstress_level[stresscur];
						}

						/* eab test code for expanded feature bits */
						if (pDph_t->malfem == MALE)
						{
							targf0 = f0_mstress_level[stresscur]+wordfeat;
						}
						else
						{
							targf0 = f0_fstress_level[stresscur]+wordfeat;
						}

						wordfeat = 0;


						if (pDph_t->malfem == MALE)
							targf0 += f0_mphrase_position[pDphsettar->nrises_sofar];
						else
							targf0 += f0_fphrase_position[pDphsettar->nrises_sofar];

//						if( pDph_t->number_words == 1 )
//							targf0 = targf0 - (targf0>>1);

						//EAB Phrase final stressed syllable don't wack
						//it so hard unless emphatic-but this doesn't work correctly but
						// it's too dangerous to fix right before a release the finalsyl
						// is not marked as final in a single syl word the phrbound is 
						// a look ahead so that doesn't work num_words to versus word num is the right sol I think
#ifdef OUTFORNOW
					if(nextphrbou > FWBNEXT ) 
					{
			
						targf0=targf0;
					}
#endif
#ifdef SUEB
					pDph_t->impulse_width = pDph_t->allodurs[nphon]-(pDph_t->allodurs[nphon]>>2) ;
#else

					pDph_t->impulse_width = pDph_t->allodurs[nphon]>>1;
#endif
					
					if (pDph_t->cbsymbol )
					{
						
						targf0 >>= 2;	/* All gestures reduced in ? */
					}
					
					/* eab 2/21/97 EAB remove emphasisflag and associated stuff pulled see note in phsort.c */
					
					/* Begin gesture 1/4 of way into the vowel */
					//experimenting with 
					//don't know why the fudge factor -6 yet
					delayf0 = pDph_t->allodurs[nphon] -(pDph_t->impulse_width>>1);
					
					
					/* Begin IMPULSE much earlier when last stress of phrase */
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
						}
						delayf0 = mstofr (pDph_t->user_offset[mf0]);
						mf0++;
					}
					
					/* Scale by speaker def paramter SR, unless emphasized */
					temp = pDph_t->scale_str_rise;
					if ((stresscur == FEMPHASIS) && (temp < 16))
					{
						temp = 16;
					}
					pDph_t->arg2 = targf0;
					pDph_t->arg3 = 32;
					targf0 = muldv (temp, targf0, 32);
					if (pKsd_t->lang_curr == LANG_british)
					{
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
								make_f0_command ( phTTS,IMPULSE, 22, targf0, delayf0,pDph_t->allodurs[nphon], &cumdur, nphon);
								pDph_t->prevnphon= nphon;
								pDph_t->prevtargf0 = targf0;
							}
							
						}
						
						
						
						/* Save stress IMPULSE in command string */
						//				   make_f0_command ( phTTS,IMPULSE, 2, targf0, delayf0,20, &cumdur, nphon);
						
#ifdef GERMANout
						
						pDph_t->impulse_width = 0;
						nphonx = nphon;
						pDph_t->vowel_portion = pDph_t->allodurs[nphon];
						if(nextphrbou != nextwrdbou)
						{
							delayf0 = pDph_t->vowel_portion;
							if(nextwrdbou == nextsylbou) /* non-phrase final word, with stress on the final syllable */
							{
								//while (((pDph_t->allofeats[nphonx] & FSYLL) IS_PLUS)) /* Use all the syllabic sounds in stressed final syllables, perhaps go to all voiced sounds */
								//{
								//	impulse_width += pDph_t->allodurs[nphonx];
								//	nphonx++;
								//}
								delayf0 = delayf0>>1;		/* Less aggressive delay for syllable-final stress */
								pDph_t->impulse_width = delayf0;
							}
							else
							{	while((!pDph_t->allofeats[nphonx] & FBOUNDARY) )
							/* Go to the following syllable in the word */
							{
								pDph_t->impulse_width += pDph_t->allodurs[nphonx];
								nphonx++;
							}
							//while ((pDph_t->allophons[nphonx] & FSYLL) IS_MINUS) /* Go as far as the nucleus of that syllable */
							//eab the above won't work
							while((phone_feature( pDph_t,pDph_t->allophons[nphonx]) & FSYLL) IS_MINUS)
							{
								pDph_t->impulse_width += pDph_t->allodurs[nphonx];
								nphonx++;
							}
							//if((pDph_t->allophons[nphonx] & FWBEND) IS_PLUS)
							if((pDph_t->allofeats[nphonx] & FWBEND) IS_PLUS)
							{
								//impulse_width += -(pDph_t->allodurs[nphonx-1]);			/* don't get too close to the end of the word */
								pDph_t->impulse_width -= (pDph_t->allodurs[nphonx-1]);
							}else{
								pDph_t->impulse_width += (pDph_t->allodurs[nphonx]>>1) + (pDph_t->allodurs[nphonx]>>3); /* Add some of the final nucleus is */
							}
							}
						}
						else if(nextsylbou != nextwrdbou)
						{	pDph_t->impulse_width += pDph_t->allodurs[nphon];
						delayf0 = 0;
						}
						else
						{	//Want to not add pulse phrase final syl.
							//eab Not sure what the purpose is but on singles words it kill
							//the pulse completed leaving isolated words flat.
							if(pDph_t->number_words == 1)
							{
								pDph_t->impulse_width = 20;
								delayf0=-8;
							}
							else
							{
								pDph_t->impulse_width = 0;
							}
						}
						//eab aaccording to kiel the first IMPULSE is before the vowel not way later
						//put it at postion -(100ms + 6 frames) for delay of filter
						if(pDph_t->impulse_width > 0)
						{
							make_f0_command (phTTS, IMPULSE, 26, targf0, delayf0, pDph_t->impulse_width, &cumdur, nphon);
							
							//make_f0_command (phTTS, IMPULSE, 26, targf0, -20, impulse_width, &cumdur, nphon);
							
							//NOW A NEGATIVE PULSE
							
							targf0 = -targf0; 
							pDph_t->impulse_width = 10;
							delayf0 = delayf0 + pDph_t->impulse_width; 
							
							
							if(pDph_t->number_words > 2)
							{
								make_f0_command ( phTTS,IMPULSE, 29, targf0, delayf0, pDph_t->impulse_width, &cumdur, nphon);
							}
							
							if(nphon > (pDph_t->nallotot>>2)&& stepcount == 0)
							{
								stepcount++;
								make_f0_command ( phTTS,IMPULSE, 21, (short)-(pDphsettar->hatsize>>2), delayf0, 15, &cumdur, nphon);
							}
							else if(nphon > (pDph_t->nallotot>>1)&& stepcount == 1)
							{
								if(nphon > (pDph_t->nallotot-8))
								{
									make_f0_command ( phTTS,IMPULSE, 22, (short)-((pDphsettar->hatsize>>1)+(pDphsettar->hatsize>>2)), delayf0, 10, &cumdur, nphon);
									stepcount =0;
								}
								else
								{
									make_f0_command ( phTTS,IMPULSE, 23, (short)-(pDphsettar->hatsize>>1), delayf0, 10, &cumdur, nphon);
									stepcount++;
								}
							}
							else if(nphon > (pDph_t->nallotot-8)&& stepcount == 2)
							{
								make_f0_command ( phTTS,IMPULSE, 24, (short)-(pDphsettar->hatsize>>2), delayf0, 30, &cumdur, nphon);
								stepcount++;
							}
						}
#endif // #ifdef GERMAN
}
else //not british
{
			
	//			if(feanex & FSON1)
	//			{
	//				length += pDph_t->allodurs[nphonx];
	//			}
	//			
				make_f0_command( phTTS,IMPULSE, 2,  targf0/3, delayf0,pDph_t->impulse_width+15 , &cumdur, nphon);
				
}


/* Increment stressed syllable counter */
if (pDphsettar->nrises_sofar < MAX_NRISES)
pDphsettar->nrises_sofar++;
if (pDphsettar->nrises_sofar == MAX_NRISES)
pDphsettar->nrises_sofar=1;
			}
			
			/* EAB 2/27/97 Fhat_fall on last stressed syl is not always appropriate because there aare times when there
			is still too many phonemes left to go to end of clause and we need to delay the fall. Need to check it in two places
			FSYL test which is not needed because we must assume the fhat was put in the coreect place to begin with, but the 
			duplication is so that the rules fire in the correct order also*/
			
			
			
			
			
			/* Rule 3: Execute hat fall */
			
			/* If presently at top of hat, return to base shortly after */
			/* vowel onset if this is last stressed syllable in phrase */
			if ( pDph_t->had_hatend )
				
			{
				pDph_t->had_hatend=0;
				pDph_t->had_in_phrase_final = 1;
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
					if (pDph_t->malfem == MALE)
					f0fall = F0_FINAL_FALL>>1;
					else
					f0fall = F0_FINAL_FALL;
					pDph_t->hatstate = AFTER_FINAL_FALL;
					/* Make fall start 180 ms from end of this vowel */
					delayf0 = 10;
					/* But not too early */
					if (delayf0 < NF25MS)
						delayf0 = NF25MS;
					
#ifdef ENGLISH_US
					if (((struccur & FBOUNDARY) == FCBNEXT )||
						(pDph_t->clausetype == COMMACLAUSE))
					{
						f0fall = F0_COMMA_FALL;
#else
						/* Non-final clause, don't go too far below baseline */
						if ((struccur & FBOUNDARY) == FCBNEXT )
						{
							f0fall = F0_NON_FINAL_FALL;
#endif //ENGLISH_US
							
							pDph_t->hatstate = AFTER_NONFINAL_FALL;
						}
						/* Non-final phrase, don't go below baseline at all */
						if ((struccur & FBOUNDARY) == FVPNEXT)
						{		
							
							f0fall = 0;
						}
						
						/* Or because question rise on same syllable */
						if ((struccur & FBOUNDARY) == FQUENEXT)
						{
							f0fall = F0_QSYLL_FALL;
						}
						
#ifdef MAYBE //eab ask corine
						/*			  Delay fall if more (unstressed) sylls in phrase */
						if (nextsylbou != nextphrbou) {
							delayf0 = pDph_t->allodurs[nphon] - NF20MS;
							/*			      But not too much delay if also continuation rise */
							/*			      i.e. readjust timing so get fall-rise, not r-f-r */
							if ((nextphrbou == FCBNEXT)
								|| (nextphrbou == FQUENEXT)) {
								if (lowrisesw == 0) {  /* Limit=1/sent. */
									lowrisesw++;
									//eab 3/28/01change see bats 952. setences ending in unstressed syl with a 
									//comma had unpleasant intonatin. Next version we should really be 
									//able to improve this stuss
									delayf0 -= NF40MS;
									f0fall = 40;
									pDphsettar->hatsize = pDphsettar->hatsize>>1;
									
								}
							}
						}
						
#endif
						
						
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
							
						}
						
						delayf0 = mstofr(pDph_t->user_offset[mf0]);
						
						mf0++;
						
					}
					
					/*	Delay fall if more sonorants after nucleus */
					//EAB 2/23/99
					if (feanex & FSONOR)
					{
						delayf0 +=5;
					}
					
					length = pDph_t->allodurs[nphon]+10;
					
					if(struccur & F_IRESET )
					{	
						//f0fall = (f0fall >>2);
						delayf0 +=30;
						length +=10;
						pDph_t->had_hatbegin =1;
					}
					
					
					if(pKsd_t->lang_curr != LANG_german)
						// CAB removed warnings by typecast
						
						make_f0_command( phTTS, GLIDE, 3, (short)-f0fall, delayf0, length, &cumdur, nphon); // NAL warning removal
					
					
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
				// BATS 711 Old code a lie without stresscur it isn't checking for stress
				// old comment correct 
				// do to changing a comma boundary to a period we must check--
				//we really should decide on cluse stuff at the very beginning
				if (pDph_t->clausetype != DECLARATIVE &&
					stresscur && ((struccur & FBOUNDARY) == FCBNEXT)
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
 
							/* found that it is firing on clause final syllable in German for some
							reason but also in German it presently appears to not be required so not worth
							troubleshooting at the moment */ 
							pDph_t->delta_special = 0; /* This code is garbage put here as a noop space filter
							so that sompiler wouldn't get lost*/
if(pKsd_t->lang_curr == LANG_spanish
   ||pKsd_t->lang_curr == LANG_latin_american)
{
							if(pDph_t->number_words == 1)
							{
								make_f0_command ( phTTS,IMPULSE, 41,F0_QGesture1+300, delayf0,24, &cumdur, nphon);
								make_f0_command ( phTTS, IMPULSE, 41,F0_QGesture2, pDph_t->allodurs[nphon],24, &cumdur, nphon);
							}
							else
							{
								make_f0_command ( phTTS,IMPULSE, 41,F0_QGesture1, delayf0,24, &cumdur, nphon);
								make_f0_command ( phTTS, IMPULSE, 41,F0_QGesture2, pDph_t->allodurs[nphon],24, &cumdur, nphon);
							}
							
}							
							
if(pKsd_t->lang_curr == LANG_german)
{
							make_f0_command ( phTTS,IMPULSE, 41,F0_QGesture1, delayf0,24, &cumdur, nphon);
							make_f0_command ( phTTS, IMPULSE, 41,F0_QGesture2, pDph_t->allodurs[nphon],24, &cumdur, nphon);
}
						}
						else
						{
							/* Phrase-final stressed vowel followed by comma */
							/* 2/26/97 See comment above*/
							
							
							pDph_t->delta_special = -50;
							/* EAB 2/15/98 Needs earlier */
							
							delayf0 -= NF20MS;


							//BATS 709
							if(pDph_t->commacnt == 0)
							{
								make_f0_command ( phTTS, IMPULSE,42,  F0_CGesture1, 3 ,22, &cumdur, nphon);
								make_f0_command ( phTTS, IMPULSE, 42, F0_CGesture2, (short)(pDph_t->allodurs[nphon]>>1),18, &cumdur, nphon); // NAL warning removal
							}
							
							else

								
							{
								make_f0_command ( phTTS, IMPULSE,420,  F0_CGesture1, delayf0,24, &cumdur, nphon);
								make_f0_command ( phTTS, IMPULSE, 420, F0_CGesture2, (short)(pDph_t->allodurs[nphon]>>1),24, &cumdur, nphon); // NAL warning removal
							}
							pDph_t->commacnt++;
							
						}

					}
			}
			
			/* EAB 2/27/97 Fhat_fall on last stressed syl is not always appropriate because there aare times when there
			is still too many phonemes left to go to end of clause and we need to delay the fall. In previous 
			position it did and FSYL test which is not need because we must assume the fhat was put in the
			coreect place to begin with sorry it put in the right place it turns out this code hasn't
			work since I believe 1984*/
			
			//I believe this code is no longer needed
			/* Rule 31: Execute hat fall */
			
			/* If presently at top of hat, return to base shortly after */
			/* vowel onset of the next syllabic */
			if (pDph_t->had_hatend && (feacur & FSYLL) IS_PLUS)
			{
#ifdef PH_DEBUG
 #ifndef UNDER_CE	//CAB 03/15/00 WINprintf not supported under Windows CE
				WINprintf("CODE still being hit\n");
#endif
#endif // PH_DEBUG
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
					if (((struccur & FBOUNDARY) == FCBNEXT) ||
						(pDph_t->clausetype == COMMACLAUSE))
					{
						
						f0fall = 60;
					}
						/* Non-final phrase, don't go below baseline at all */
						if ((struccur & FBOUNDARY) == FVPNEXT)
						{
							
							f0fall = 0;
						}
#ifdef NOLONGERNEEDED
						/* Non-final syllable, see what boundary is next */

						if ((struccur & FBOUNDARY) < FVPNEXT)
						{

						
							for (nphonx = nphon + 1; nphonx < pDph_t->nallotot; nphonx++)
							{
								/* eab DENiis broke the code with this line in 1984
								if ((phone_feature( pDph_t,pDph_t->allophons[nphonx]) & FSYLL) IS_PLUS)
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
#endif // NOLONGERNEEDED
						/* Or because question rise on same syllable */
	if ((struccur & FBOUNDARY) == FQUENEXT)
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
							
						}
						delayf0 = mstofr(pDph_t->user_offset[mf0]);
						mf0++;
					}
					
if(pKsd_t->lang_curr != LANG_german)
					make_f0_command ( phTTS,STEP, 31, (short)-f0fall, delayf0,0, &cumdur, nphon); // NAL warning removal

					pDphsettar->hat_loc_re_baseline -= f0fall;
					
				}

			}

			/* 
			* Rule 5: Final fall on unstress clause-final syl, or on stressed 
			* clause - final syll that didn't have hat fall due to earlier emphasis 
			*/
			
			
			if ((feacur & FSYLL) IS_PLUS)
			{
				if(((stresscur & FSTRESS_1) IS_MINUS)	/* 2-str or 0-str */
					/*	|| ((struccur & FHAT_ENDS) IS_MINUS)*/)
					
				{					   /* or 1-str nofall */
					
					
					
					if(pKsd_t->lang_curr == LANG_spanish
						|| pKsd_t->lang_curr == LANG_latin_american)
					{
						if ((struccur & FTYPESYL) >= FBISYL
							&& ((struccur & FBOUNDARY) > FWBNEXT
							|| (phone_feature( pDph_t,phonex) & FCONSON) IS_PLUS))
						{
						}
						
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
							
							pDph_t->test_targf0 = targf0;	/* RSM created this variable to reduce final fall in GERMAN */
							pDph_t->impulse_width = 20;		/* RSM */
							
							/* Sent.-final unstressed vowel followed by a period */
							/* EAB with addition of new code to glotalize in phdrwt0 this
							needs to grt alot weaker*/
if(pKsd_t->lang_curr == LANG_german)
{
							pDph_t->test_targf0 = targf0>>2;	/* RSM */
							pDph_t->impulse_width = 10;			/* RSM */
}
							if(pDph_t->number_words == 1)
							{
								make_f0_command ( phTTS,GLOTTAL, 5, (short)(targf0>>1), (short)(pDph_t->allodurs[nphon] - NF30MS), 30, &cumdur, nphon); // NAL warning removal
							}
							else
								
							/*	EAB 11/4/98 Final glotalization gesture is very sensitive to timing and needs to be adjusted in onset if
							the phoneme following the syllable nucleus is voiced BATS 796. */
							if(phone_feature( pDph_t,phonex) & FVOICD)
							{
								pDph_t->test_targf0 = targf0>>3;
								if(nphon+2 <= pDph_t->nallotot && (phone_feature( pDph_t,pDph_t->allophons[nphon+2]) & FVOICD))
									/* nucleus has two voiced phonemes following it so delay even more*/
								{
									make_f0_command ( phTTS,IMPULSE, 5, pDph_t->test_targf0,  (pDph_t->allodurs[nphon]), pDph_t->impulse_width, &cumdur, nphon);
								}
								else
								{
									delayf0 = (pDph_t->allodurs[nphon]>>1) + (pDph_t->allodurs[nphon]>>2);
									make_f0_command ( phTTS,IMPULSE, 5, pDph_t->test_targf0,  delayf0, pDph_t->impulse_width, &cumdur, nphon);
								}
								
							}
							else
							{
								make_f0_command ( phTTS,IMPULSE, 5, pDph_t->test_targf0, (short)(pDph_t->allodurs[nphon]>>1), pDph_t->impulse_width, &cumdur, nphon); // NAL warning removal
							}
							
							if ((phone_feature( pDph_t,pDph_t->allophons[nphon]) & FSYLL) IS_PLUS)
							{
								
							}
						}
					}
				}
			}

			/* Rule 6: Continuation rise on unstress clause-final syll before  comma or ? */
			/* Rise occurs just before end of vowel */ 
			/* This rule also appears to apply a final pitch fall to all declarative sentence-final syllables RSM */
			
			delayf0 = -5;//new test pDph_t->allodurs[nphon] - NF115MS;
			if ((struccur & FBOUNDARY) == FQUENEXT)
			{
if(pKsd_t->lang_curr == LANG_german)
{			/* Unstressed vowel followed by a question mark */
				make_f0_command (phTTS,IMPULSE, 6, F0_QGesture1, delayf0, 24, &cumdur, nphon);
				make_f0_command (phTTS,IMPULSE, 6, F0_QGesture2,0, pDph_t->allodurs[nphon], &cumdur, nphon);
}
else
{
				/* Unstressed vowel followed by a question mark */
				make_f0_command (phTTS,IMPULSE, 6, F0_QGesture1, delayf0, 24, &cumdur, nphon);
				make_f0_command (phTTS,IMPULSE, 6, F0_QGesture2, pDph_t->allodurs[nphon],20, &cumdur, nphon);
				}
				

				
			}
			if ((struccur & FBOUNDARY) == FCBNEXT)
			{
				/* Unstressed vowel followed by a comma */			
				delayf0 += NF20MS;
#ifndef GERMAN
				make_f0_command ( phTTS,IMPULSE, 6, F0_CGesture1, 0, 24, &cumdur, nphon);
				make_f0_command ( phTTS,IMPULSE, 6, F0_CGesture2,delayf0, 20, &cumdur, nphon);
#else
				make_f0_command ( phTTS, IMPULSE,6, F0_CGesture2, -60, 30, &cumdur, nphon);
				
#endif // #ifndef GERMAN
				pDph_t->commacnt++;
			}
			
			
			
			
			
			else if (((struccur & FBOUNDARY) == FPERNEXT))
			{
				targf0 = F0_GLOTTALIZE;
				
				/* 
				* Pitch falls are less pronounced for some speakers 
				* to reduce impression of assertive personality 
				*/
				
				targf0 = frac4mul(targf0, pDph_t->assertiveness);
				
				pDph_t->test_targf0 = targf0; /* RSM variable use to reduce the final fall in GERMAN */
				pDph_t->impulse_width = 20;	/* RSM */
				/* Sent.-final unstressed vowel followed by a period */
				/* eab 4/13/98 comment is wrong this is stressed vowel so review code in detail 
				when time permits*/
#ifdef GERMAN
				pDph_t->test_targf0 = targf0>>2;
				pDph_t->impulse_width = 10;
				if(pDph_t->number_words == 1)
				{
					make_f0_command ( phTTS,IMPULSE, 6, (short)(targf0>>1), (short)(pDph_t->allodurs[nphon] - NF130MS), 20, &cumdur, nphon); // NAL warning removal
				}
				else
#endif							
				/*	EAB 11/4/98 Final glotalization gesture is very sensitive to timing and needs to be adjusted in onset if
				the phoneme following the syllable nucleus is voiced.BATS 796  */
				if(phone_feature( pDph_t,phonex) & FVOICD)
				{
					pDph_t->test_targf0 = targf0>>3;
					if(nphon+2 <= pDph_t->nallotot && (phone_feature( pDph_t,pDph_t->allophons[nphon+2]) & FVOICD))
						/* nucleus has two voiced phonemes following it so delay even more*/
					{
						make_f0_command ( phTTS,IMPULSE, 6, pDph_t->test_targf0,  (pDph_t->allodurs[nphon]), pDph_t->impulse_width, &cumdur, nphon);
					}
					else	/* RSM */
					{
						delayf0 = (pDph_t->allodurs[nphon]>>1) + (pDph_t->allodurs[nphon]>>2);
						make_f0_command( phTTS,IMPULSE, 6, pDph_t->test_targf0,  delayf0, pDph_t->impulse_width, &cumdur, nphon);
					}
				}
				else
				{	// CAB Removed warnings by enclosing typecast in ()
					make_f0_command( phTTS,IMPULSE, 6, pDph_t->test_targf0, (short)((pDph_t->allodurs[nphon]>>1)+3),
						pDph_t->impulse_width, &cumdur, nphon); // NAL warning removal
				}	
			}
			

			/* Rule 7: Reset baseline at end of sentence */

			if (phocur == GEN_SIL)
			{
				stepcount=0;
				/* Reset f0 to hat bottom from sub-hat-bottom */
				if ((pDphsettar->hat_loc_re_baseline != 0) && (pDph_t->nf0tot > 0))
				{

if(pKsd_t->lang_curr == LANG_british)
					make_f0_command ( phTTS,STEP, 7, (short)( -(pDphsettar->hat_loc_re_baseline) ), 0, 20, &cumdur, nphon); // NAL warning removal

					pDphsettar->hat_loc_re_baseline = 0;
				}

				if (nphon > 0)
					pDphsettar->nrises_sofar = 1;	/* Soft reset */
else if(pKsd_t->lang_curr == LANG_french)
{
				pDph_t->hatpos=AT_BOTTOM_OF_HAT;
}
else
{
				if ((pDph_t->allofeats[nphon - 1] & FBOUNDARY) == FCBNEXT
					&& pDph_t->nf0tot > 0
					&& (pDph_t->allophons[nphon - 1] != GEN_SIL))
				{
					make_f0_command ( phTTS,F0_RESET, 7, 0, 0, 0, &cumdur, nphon); /* RESET! */
					issubclause = TRUE;
				}
}
			}
				/* Rule 8: Reset baseline and hat position to brim if end of a sentence */
				/*** Add condition to reset if long clause followed by comma and long clause */
					

	  skiprules:					   /* END OF F0 RULES */

		/* Update cumdur to time at end of current phone */
	cumdur += pDph_t->allodurs[nphon];
		/* add up duration for phdrawt0	eab 8/96 don't count final silence 
			eab 7/8/98 Bats 711*/
	if( (nphon <= (pDph_t->nallotot-1) &&
		(nphon > 0 && (pDph_t->allophons[nphon] & PVALUE)!= 0))
		|| nphon==0 ) //1st two lines check end of cluase
		//This counts inital silence (we don't vount final silence 
		/* EAB It turns out that there are two possibilites for the way things
		get transmitted one is with and end of clause symbols and the other is without(implied)
		therefore you have to do two checks to know whether or not your at the last real phoneme
		or at a silence phoneme BATS 897 */
		pDph_t->tcumdur += pDph_t->allodurs[nphon];




			/* Rule 9: Add short schwa vowel to create release of [p,t,k,b,d,g] into sil. 
			 * Logically, this kind of rule should appear in PHALLOPH.C, but
			 * delaying it to here makes all dur and f0 rules much simpler 
			 * EAB 2/28/97 changing to generalize when FPLOS + Fburst then release into a schwa
			 */
	// 3/14/01 eab don't use dummy vowel if cons unvoiced
	// 6/14/01 eab chnage- use it but don't voic it we need the placeholder for the release
	
	if (( phonex == GEN_SIL)&& (phone_feature( pDph_t,phocur) & FPLOSV) 
			&& (phone_feature( pDph_t,phocur) & FBURST) 
			/*&& phone_feature( pDph_t,phocur) & FVOICD*/)
	{
													/* p t k b d g */
													/* || ((feacur & FNASAL) IS_PLUS) */ 
													/* m n nx en */
			/*&& (pDph_t->nallotot < NPHON_MAX)) I don't believe we should need this chnage earlier 
			NPHO_MAX code to a yellow zone code so we don't have to constantly check if were at the end things don't
			get added that frequently*/
	
			for (n = pDph_t->nallotot+1; n > nphon; n--)
			{
				pDph_t->allophons[n] = pDph_t->allophons[n - 1];
				pDph_t->allofeats[n] = pDph_t->allofeats[n - 1];
				pDph_t->allodurs[n] = pDph_t->allodurs[n - 1];
				pDph_t->user_f0[n] = pDph_t->user_f0[n - 1];
			}
	
			pDph_t->allophons[nphon + 1] = SCHWA1;
			if ( (begtyp(pholas ) == 1)
				|| (phone_feature( pDph_t,phocur) & FALVEL ))
			{
				pDph_t->allophons[nphon + 1] = SCHWA2;
			}
		/*	      B,D,G need longer voicing in release to be heard as voiced */
		if (((phocur >= USP_P) && (phocur <= USP_G))	/* p t k b d g */
		  && ((feacur & FVOICD) IS_PLUS)) {
		    pDph_t->allodurs[nphon+1] = NF40MS;
		}
		else {
		    pDph_t->allodurs[nphon+1] = NF40MS;
		}

			
			cumdur += pDph_t->allodurs[nphon+1];

			/*eab 8/96 update tcumdur*/
			pDph_t->tcumdur +=pDph_t->allodurs[nphon+1];
			pDph_t->allofeats[nphon + 1] = pDph_t->allofeats[nphon] | FDUMMY_VOWEL;
			pDph_t->nallotot++;
			nphon++;
	}
 


}
			
  
}

/* ******************************************************************
 *      Function Name: make_f0_command()      
 *
 *  	Description: Put an f0 command into f0tar and f0tim arrays  
 *
 *      Arguments: 	LPTTS_HANDLE_T		Text-to-speech handle
 *					short type
 *					short rulenumber
 *					short tar,
 *					short delay
 *					short length
 *		            short *psCumdur
 *					short nphon
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
static void make_f0_command(LPTTS_HANDLE_T phTTS, short type, short rulenumber, short tar,
				 			 short delay, short length, short *psCumdur, short nphon)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PDPH_T pDph_t = phTTS->pPHThreadData;

	/* Cudur reflects time (in frames) since last f0 command        */
	/* Cumdur+delay should never be less than zero                  */

	/* static short prpholas, temp; *//* MVP : Never Used,comment it out */
	/* If requested time is earlier than last f0 command, zero offset */
		
#ifdef PH_DEBUG
#ifndef UNDER_CE	//CAB 03/15/00 WINprintf not supported under Windows CE
	if (DT_DBG(PH_DBG,0x010))
		WINprintf("phon %d nphon %d rule %d type %d , tar %d delay %d length %d  \n",(pDph_t->allophons[nphon] & PVALUE), nphon, rulenumber,type, tar, delay, length);
#endif
#endif // PH_DEBUG
	if ((delay + *psCumdur) < 0)
	{
			delay = -(*psCumdur);
	}
	/* Save commands */	
	pDph_t->f0tim[pDph_t->nf0tot] = *psCumdur + delay;
	pDph_t->f0tar[pDph_t->nf0tot] = tar;
	pDph_t->f0type[pDph_t->nf0tot] = type;
	/* eab 1/10/98 We need to be able to specifiy the length
	of the event instead of having only
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
/***********************end of ph_inton2.c**************************************/