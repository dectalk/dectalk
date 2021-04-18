/* ww_02_27_01
 ***********************************************************************
 *
 *                           Copyright ©
 *
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © SMART Modular Technologies 1999, 2000. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998, 1999 All rights reserved.
 *
 *     U.S. Government Rights: Consistent with FAR 12.211 and 12.212, 
 *     Commercial Computer Software, Computer Software Documentation, 
 *     and Technical Data for Commercial Items are licensed to the U.S. 
 *     Government under vendor's standard commercial license.
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
 * 0017 EAB     04/09/1997		Fixed hat_rise fall phonemic markings see note below
 *                              Fixes BAT 346
 * 0018 EAB		04/18/1997		Completed merge with 5.0 and French plus fixed a problem where somehow and extra line of code
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
 * 0028 EAB		02/16/1998		Re-wrinting for 4.5+ go get all on the same base 
 * 0029 EAB		03/02/1998		Added length to impulse commands to support new command syntax ( note step by definition
 *								have a length of zero-we could change it to be a ramp
 * 0030	gl		03/25/1998		Added DBGV command for PH debug variable passing
 *								also add dectalkf.h to catch the defined symbol
 *								For BATS#639 to change phinton() to use argument phTTS instead of pDph_t
 * 0031 EAB		04/10/1998		Add new German tuning rules plus add new parameters for debug printout to Make_f0
 * 0032 EAB		06/07/1998		7/8/98 Begin to remove hat rise hat fall pattern. It doesn't just do the rise fall so like
								a cancer tumor the removal must be carefully done
 * 0033 EAB		07/8/1998		BATS 711 found bug in counting tcumdur + 709 German tuning
 * 0034 EAB		07/22/1998 		First pass at adding wordfeatr with part of speech
								to intonation. Removed old GERMAN unused wordclass...
 * 0035 EAB		07/24/1998		Modified calling handle of MAKE_F0 to support debug printouts
 * 0036 EAB		08/17/1998		Spanish tuning with Juan
 * 0037 EAB		09/11/1998		Still improving/experimenting to improve naturalness
 * 0038 EAB		09/29/1998		Found some hidden problems ewhere values
 *								were getting sucked out of ROM.c instead of locally --also
 *								tuned for SPANISH_LA
 * 0039 EAB 	10/16/1998 		Final tuning from new release of spanish
 * 0040 EAB 	10/22/1998 		Bats 776- Some arrays were too short for max pointer movement
 *								causing a failure depending on whether the data follwoing the array 
 * 								was freindly or unfreindly values......
 *  0041 EAB 					Further tuning of intonation values for relelase
 *	0042 EAB 	11/04/1998 		Final glotalization gesture is very sensitive to timing and needs to be adjusted in onset if
 *								the phoneme following the syllable nucleus is voiced BATS 796.
 *	0043 EAB 	11/06/1998 		Final adjustments for new release-this file is not the default version but I wanted to give an
 *								option to chose it BATS 807
 *	0044 EAB 	11/09/1998 		Tuned the UK_English male and female voice BATS 777
 *			  					if (new_intonation enabled for UK) This as part of the overall 5.0
 *								tuning process file in AD already contains changes 
 *	0045 EAB 	11/10/1998 		Fixed BATS 791 failure was dur to the fact that typing mode
 *								sent data without and end of clause which ph can handle but the tcumdur
 *								calulation was not handling correctly.
 *  0046 GL	 	11/20/1998		BATS#828 use PH_DEBUG to replace _DEBUG
 *  0047 EAB 	02/03/1999		Added change from NWSNOAA->NWS_US for multi language NOA
 *								Plus did some tuning and added an printout to verifiy that some code is no longer
 *								needed and can be removed later and chnaged a variale name to a more explanatory one
 *	0048 EAB 					Added in copyright notices plus trying to tune this ad code
 *	0049 EAb	06/07/1999		BATS 897
 *  0050 EAB    04/17/1999 		Tuning changes for 4.6
 *  0051 EAB	04/18/1999 		Fixed ifdef for UK for N_last_sylL...
 *	0050 CAB	03/15/2000		WINprintf not supported under Windows CE
 *  051	MGS		04/13/2000		Changes for integrated phoneme set 
 *  052 NAL		04/14/2000		Changed externs featb, begtyp to match declaration
 *  053 CAB		05/23/2000		WINprintf not supported under Windows CE
 *  054 NAL		06/12/2000		cast varibales (warning removal)
 *  055 EAB		06/28/2000		Unified Phoneme Set Changes
 *  056 CHJ		07/20/2000		French added
 *  057	CHJ		07/28/2000		French feature bit modifications
 *  058 CAB		09/21/2000		Fixed  copyright infoi and formatted comment section.
 *  059 EAB		03/02/2001		Changed Fsonor back to FVOICD for rule 6 as silence has always
 *								been declared an FSONOR which causes this rule to do bad things.....
 *								also end glottal rules will be moved shortly to pressure model
 *  060 EAB		03/13/2001		Tuning of intonation with Winfried.
 *  061 EAB		03/28/2001		Fix bats 952 comma intonation
 *  062	MGS		04/11/2002		ARM7 port
 *	063	CAB		05/22/2002		Removed warnings
 *
 */
/* #define MSDBG4 */


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


#ifdef ILLEGAL_STUFF
short impulse_width;		/* RSM */
short vowel_portion;		/* RSM */
short test_targf0;			/* RSM */
short targf0_increment;		/* RSM */
short diff_targf0;			/* RSM */
short impulse_width_increment;	/* RSM */
short diff_impulse_width;		/* RSM */
short ramp_targf0 = 0;			/* RSM */
short ramp_impulse_width;		/* RSM */
short ramp_delayf0;				/* RSM */

short i;						/* RSM */
short temp_var;					/* RSM */
#endif

#ifdef GERMAN


#define EMPH_FALL	1				   /* stress reduce shift for emph. stress 	*/
#define DELTAEMPH_SPEC  505			   /* special value for fast emphatic str 	*/
#define DELTAEMPH	501				   /* normal value for emphatic stress 		*/
#define DELTARISE	200				   /* rise for continuing cadence        	*/
#define DELTAFINAL	100				   /* delta to remain at top in final cad. 	*/
#define FINAL_FALL	1				   /* stress reduce shift for str. at top 	*/

// HELPME  Ed, Please move static tables out of the function

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent
 *  in a phrase */
//BATS 776 EAB 10/22/98 add values to arrays
//eab 2/26/00 -20 to compensate for increase in strength of stress_1 due to 
//misordering stress_2 was bigger than stress_1
//EAB ALSO ADJUST FOR FACT THAT KIEL IS 94 PERCENT OF TOTAL OR MPHRASE_STRESSLEVEL
const short f0_mphrase_position[] = {   91,  83, 76, 69,  63, 59, 55, 51, 49 };
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
const short f0_mstress_level[] = {0, 31, 11, 71, 0, 0, 0, 1};

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent
 *  in a phrase */
//EEAB REDO RICH DIDNOT ADJUST THIS TABLE TO KIEL 94 PERCENT RULE
const short f0_fphrase_position[] = {   140, 112, 88, 71, 67, 54, 48 };
/* Was: 210,  90, 40, 20 */

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */
/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
/*	change to new stress features in german DECtalk			*/
/*	order is changed to: 0 ,1,2 */
/*	USED TO BE: readonly short f0_stress_level[] = {0, 71, 0, 281};	*/
/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
const short f0_fstress_level[] = {0, 31, 11, 71, 0, 0, 0, 1};

#endif // GERMAN
 
#ifdef SPANISH_SP
 
/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */
// HELPME  Ed, Please move static tables out of the function

const short f0_mphrase_position[] =
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

const short f0_mstress_level[] =
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
const short f0_fphrase_position[] =
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
const short f0_fstress_level[] =
{
/* 'stress `stress "stress                      */
  /* 0,       51-10,     31-10,    161-50 */  /*eab  */
	0, 121, 71, 261					   /* eab original stress */

};

#endif // SPANISH_SP
 
#ifdef SPANISH_LA
 
/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */
// HELPME  Ed, Please move static tables out of the function

const short f0_mphrase_position[] =
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

const short f0_mstress_level[] =
{
/* 'stress `stress "stress                      */
	0, 51+20, 31+10, 261					   /* eab original stress */

};
/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */

const short f0_fphrase_position[] =
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
const short f0_fstress_level[] =
{
/* 'stress `stress "stress                      */
  	0, 121, 71, 261	
	

};

#endif // SPANISH_LA


#ifdef ENGLISH_US

// HELPME  Ed, Please move static tables out of the function

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

//BATS 776 EAB 10/22/98 add values to arrays

const short f0_mphrase_position[] =
{160, 90, 80, 70, 60, 50, 40,30};

/* Was: 210, 90, 40, 20 */

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired impulse
 * function */

const short f0_mstress_level[] =
{1, 71, 31, 281 };

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

const short f0_fphrase_position[] =
{ 100, 94, 88, 82, 77, 73, 64, 60 };

/* Was: 210,  90, 40, 20 */

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired impulse
 * function */

const short f0_fstress_level[] =
{1, 71, 41, 311};


#endif // ENGLISH_US


#ifdef ENGLISH_UK

// HELPME  Ed, Please move static tables out of the function

const short f0_mphrase_position[] = {
 100,  90,  80,  60,  40,  20,  0,  0 };

const short f0_mstress_level[] = {
 1,  85,  51,  190,  0,  0,  0,  0 };

const short f0_fphrase_position[] = {
 100,  90,  80,  60,  40,  20,  0,  0 };

const short f0_fstress_level[] = {
 1,  90,  68,  210,  0,  0,  0,  0 };



#endif // ENGLISH_UK

#ifdef FRENCH


/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

//BATS 776 EAB 10/22/98 add values to arrays

// HELPME  Ed, Please move static tables out of the function

const short f0_mphrase_position[] =
{30, 40,  65, 60, 50, 45};

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired impulse
 * function */

const short f0_mstress_level[] =
{1, 81, 51, 191 };

const short f0_fstress_level[] =
{1, 91, 61, 221 };

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent *  in a phrase */

const short f0_fphrase_position[] =
{40, 50,  70, 70, 60, 55 };


/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or you will be creating a step function instead of the desired impulse
 * function */

const short f0_stress_level [] = { 01, 71, 51, 281 };


#endif // FRENCH


//extern __inline short phone_feature(PDPH_T pDph_t, int phone);	   /* Phonetic features            */
//extern __inline short begtyp(int phone);

#define phone_feature(a,b) (all_featb[(b)>>8][(b)&0x00ff])
#define begtyp(b) all_begtyp[(b)>>8][(b)&0xFF]

//extern short *begtyp;
/* MVP : Static function declarations */
static void make_f0_command (LPTTS_HANDLE_T phTTS,short type, short rulenumber, short tar, short delay,
					  		 short length,short *psCumdur,short nphon);
	

  
/* ******************************************************************
 *      Function Name: phinton()      
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
/* GL 03/25/1998,  BATS#639 use phTTS argument instead of pDph_t */
void phinton (LPTTS_HANDLE_T phTTS)
{
//	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	int temp;
	
#ifndef ENGLISH_UK
	short                   n; // NAL warning removal
#endif

#ifdef FRENCH
  FLAG Mot_Accentue;    /* word stressed or not */
  FLAG Dernier_Mot_Acc; /* Last stressed word in the sentence */
  FLAG Raise;           /* Last stressed in a serie of stressed words */
  FLAG Fin_Groupe;      /* End of a syntagme */
  short Syll_Mot;	    /* Nb of syllables in the word */
  short Syll_Synt;      /* Nb of syllables in the syntagme */
  short Syll_Mot_Restantes;  /* Nb of syllables left in the word */
  short Syll_Synt_Restantes; /* Nb of syll. left in the syntagme */
#endif

	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;


	

	/* Automatic variables */
	short nphon = 0, mf0 = 0;
#ifdef ENGLISH_UK
	short n_last_syl_nuc;
#endif
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
#ifndef FRENCH
	short lowrisesw;	
#endif
	short nextsylbou =0 ,nextwrdbou =0 ,nextphrbou =0;
	short issubclause = 0;   /* TRUE signals subordinate clause */
	short NotQuest = 1;
	
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
	pDph_t->nf0tot = 0;
	pholas = GEN_SIL;
	fealas = phone_feature( pDph_t,GEN_SIL);
	struclas = 0;
	mf0 = 0;
#ifdef ENGLISH_UK
	pDph_t->prevtargf0 = -1; /* EAB 1/13/98 Want first target to end up plus
							also initalize completion flag */
	pDph_t->done =0;
#endif

#ifdef FRENCH
//	Syll_Synt           = (pDph_t->allofeats [0] & 0xFFFF) >> 8;
	Syll_Synt = pDph_t->fconsfeats[0];
	Syll_Synt_Restantes = Syll_Synt;
#endif

	/* Should set nrises_sofar to zero after a ph_init=0 hard reset */
	/* End of initialization */


#ifdef ENGLISH_UK
	/* Find last syllable nucleus*/
	/* EAB Part of BATS 600 nphon->n_last_syl_nuc*/
		for(n_last_syl_nuc=pDph_t->nallotot;n_last_syl_nuc > 1;n_last_syl_nuc--)
			{
			if ((phone_feature( pDph_t,pDph_t->allophons[n_last_syl_nuc]) & FSYLL) IS_PLUS)
				break;
			}
#endif

	/* MAIN LOOP, for each output phoneme */

	for (nphon = 0; nphon < pDph_t->nallotot; nphon++)
	{

		if (nphon > 0)
		{
			pholas = pDph_t->allophons[nphon - 1];
			struclas = pDph_t->allofeats[nphon - 1];
			fealas = phone_feature(pDph_t,pholas);
		}
#ifdef FRENCHeabi //DON'T LIKE THIS
		if( (pDph_t->allophons[nphon] & PVALUE) == F_R &&  (pDph_t->allofeats[nphon+1] & FMOT))
		{
			//michel help it was a zero??
           	make_f0_command(phTTS, IMPULSE, 33, -81, 0, 0, &cumdur, nphon);
		}
#endif
		phocur = pDph_t->allophons[nphon];
		struccur = pDph_t->allofeats[nphon];
		
#if defined ENGLISH_US || defined GERMAN_butnotyet

		if(struccur & WORDFEAT) /*EAB This weird code allows for wordfeat to be updaed only when new information arrives
								This is test code and in reality it needs to be cleared at a word boundary
								The above code is not syncronizing ok*/
		{
			wordfeat = struccur & WORDFEAT;
			if(wordfeat & F_NOUN)
			{
				wordfeat = 80;
			}
			else if(wordfeat & F_VERB)
			{
				wordfeat = 60;

			}
			else if(wordfeat & F_ADJ)
			{
				wordfeat = 70;
			}
		}
		else
#endif
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
#ifndef FRENCH
#ifdef ENGLISH
	    if ((fealas & FVOICD) IS_MINUS && pholas != GEN_SIL) {
		if ((feacur & FSON1) IS_PLUS) {
		    pDph_t->alloopenq[nphon] = 70;		/* Spread glottis */
		    if ((pholas == USP_F) || (pholas == USP_TH) || (pholas == USP_S)
		     || (pholas == USP_SH) || (pholas == USP_CH)) {
			pDph_t->alloopenq[nphon] = 30;	/* Stiff vocal folds at onset*/
		    }
		}
	    }
	    else if (((fealas & FOBST) IS_PLUS)
	      && ((fealas & FBURST) IS_MINUS)) {
		pDph_t->alloopenq[nphon] = 70;	  /* Slack folds to maintain voicing */
	    }				  /*  in a voiced fricative. */
	    else if ((pholas == GEN_SIL)
	      && (stresscur IS_PLUS)) {
		pDph_t->alloopenq[nphon] = 30;
		pDph_t->alloopenq[nphon-1] = 30;	/* Glottalized attack */
	    }

	    if (pDph_t->hatstate == AFTER_NONFINAL_FALL) {
		if ((feacur & FVOICD) IS_MINUS) {
		    pDph_t->alloopenq[nphon] = 30;	  /* Glottalized offset */
		}
	    }
	    if ((fealas & FVOICD) IS_PLUS) {
		if ((feacur & FVOICD) IS_MINUS) {
		    pDph_t->alloopenq[nphon] = 70;	/* breathy offset */
		    if ((phocur == GEN_SIL) || (phonex == GEN_SIL)) {
			pDph_t->alloopenq[nphon] = 30;	  /* Glottalized offset */
		    }
		}
	    }
//#endif
#endif // ENGLISH

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
			for (phonex=phonex+1;nphonx<pDph_t->nallotot; nphonx++) {
				if ((nextphrbou=pDph_t->allofeats[nphonx]&FBOUNDARY)>FRELNEXT) {	/* RSM */
					goto fbfound;
				}
			}
		}
fbfound:
//#endif //ndef German /* 02_10_01 change IV rsm */
#endif //#ifndef FRENCH
#ifdef FRENCH //from fphinton.c
      if (pDph_t->allofeats [nphon] & FMOT) {  /* word or clause boundary */

      if (pDph_t->allofeats [nphon] & FSYNT) { /* new clause */
//          Syll_Synt           = (pDph_t->allofeats [nphon] & 0xFFFF) >> 8;
		  Syll_Synt = pDph_t->fconsfeats[nphon];
		  Syll_Synt_Restantes = Syll_Synt;

      } else  { /* new word */
		if(pDph_t->allofeats[nphon] & ACCEN) 
			Mot_Accentue = 1;//(pDph_t->allofeats[nphon] & ACCEN) // ACCEN;
		else
			Mot_Accentue = 0;
		 if(pDph_t->allofeats [nphon] & DERACC)
			 Dernier_Mot_Acc =1;
		 else
			 Dernier_Mot_Acc = 0;
		if(pDph_t->allofeats [nphon] & FGROU)
			Fin_Groupe =1;
		else
			Fin_Groupe = 0;
		if(pDph_t->allofeats [nphon] & RAISE)
			Raise =1;
		else
			Raise = 0;
        if (Mot_Accentue) {
          Syll_Mot           = F_Nb_Syll (pDph_t, nphon);
          Syll_Mot_Restantes = Syll_Mot;

        }
      } /* clause or word */
    } /* word or clause boundary */
#endif //FRENCH
     
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
				make_f0_command ( phTTS, USER,0, (short)(2000 + pDph_t->user_f0[nphon]), 0, 0, &cumdur,nphon); // NAL warning removal
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
		EAB 1/25/98 SInce evreyone is so used to the sound of it I think we need to keep hat_rise_fall*/
//#ifndef FRENCH
#if !(defined  GERMANout  || defined SPANISHout ) /* EAB 4/13/98 German doesn't use the Hat_rise hat fall pattern*/
		if((struccur & FHAT_BEGINS) IS_PLUS && pDph_t->number_words > 2 )
			pDph_t->had_hatbegin= 1;
		/* eab 4/30/98  another oliver check I think hat falls are good*/

		if((struccur & FHAT_ENDS) IS_PLUS && pDph_t->number_words > 2)
			pDph_t->had_hatend= 1;
#endif
//#endif //ndef FRENCH
		if ((pDph_t->f0mode == NORMAL) || (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED))
		{

#ifndef FRENCH

			if ((feacur & FSYLL) IS_PLUS)

#else
			//EAB helpme cj says that TSyll and FSYLL are the same so later we can change this
			if ( feacur &FSYLL )
#endif
			{
#ifdef ENGLISH_UK

			/*Code now works correcctly for UK placing gesture on last syllable
			not on last stresssed syllable as american english does*/

					
					if( pDph_t->number_words > 2  )
					{
						/* n_last_syl_nuc is at the last vowel i.e. last syl nucleus*/
						if((pDph_t->nallotot -nphon) <6)
						{
							if (nphon == n_last_syl_nuc)
							{
								make_f0_command ( phTTS,GLIDE, 23, -200, (short)( -(pDph_t->allodurs[nphon-1]) ), pDph_t->allodurs[nphon-1], &cumdur, nphon); // NAL warning removal
								make_f0_command ( phTTS,GLIDE, 23, +250, 0, pDph_t->allodurs[nphon], &cumdur, nphon);
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
					make_f0_command ( phTTS,GLIDE, 20,targf0 , -6,pDph_t->allodurs[nphon], &cumdur, nphon);
					make_f0_command ( phTTS,GLIDE, 21, (short)(pDph_t->prevtargf0>>3), pDph_t->allodurs[nphon],pDph_t->allodurs[nphon+1], &cumdur, nphon); // NAL warning removal
					goto skiprules;
				}
			

		
#endif // ENGLISH_UK	

				/* eab 4/9/97 BATS#346  use had_hatbegin instead of FHAT_BEGINS*/
				if (pDph_t->had_hatbegin)
//#ifdef FRENCH
//		    if ((pDph_t->hatpos == AT_BOTTOM_OF_HAT) ) /* first vowel of a stressed */
//#endif
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
//#ifndef FRENCH
						if (pDph_t->cbsymbol  || pDph_t->number_words <3 )
						{

							pDphsettar->hatsize >>= 2;		/* All gest reduced */

						}
//#endif

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
//#ifndef FRENCH
						if ((struccur & FHAT_ENDS) IS_PLUS)
						{
							delayf0 = -NF80MS;
						}
//#endif
#ifdef OLD_FRENCH
						 if (Syll_Synt_Restantes==1) 
							delayf0 =  -NF80MS;
#endif

#ifndef GERMAN					
					make_f0_command ( phTTS,STEP, 1, pDphsettar->hatsize, delayf0,20, &cumdur, nphon);
#else				
					make_f0_command ( phTTS,GLIDE, 1, (short)(pDphsettar->hatsize), delayf0, 30, &cumdur, nphon);					
#endif
			
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
#ifndef GERMAN					
						make_f0_command ( phTTS,STEP, 1, (short)(pDphsettar->hatsize), delayf0, 20, &cumdur, nphon); // NAL warning removal
#endif

						
						

					}

					pDphsettar->hat_loc_re_baseline += pDphsettar->hatsize;
						pDph_t->hatpos = AT_TOP_OF_HAT;
						pDph_t->hatstate = ON_TOP_OF_HAT;
				}
#ifndef FRENCH
				if (pDph_t->special_phrase)
				{
					pDphsettar->nrises_sofar = 5;
				}

				if (issubclause)
				{
					pDphsettar->nrises_sofar = 3;
					issubclause = FALSE;
				}
#endif //ndef FRENCH
				/* Rule 2: Add stress pulse to every stressed vowel, smaller pulse at end */
#ifndef FRENCH
                targf0=0;



				if (!pDph_t->special_phrase && (stresscur & FSTRESS) IS_PLUS  )

				{			/* Primary or emph */
					/* Make stress impulse prop. to degree of stress */
					/* and stress position relative to clause onset */

					/*BATS 711 SHould be fine for anybody coughing up 
						a verb but only GERMAN does right now*/
#if (defined ENGLISH_US || defined GERMAN )

					if(wordfeat)
					{
						targf0 =  (f0_mstress_level[stresscur]>>1)+ wordfeat;
					}
					else
					{
						if (pDph_t->malfem == MALE)
							targf0=  f0_mstress_level[stresscur];
						else
							targf0=  f0_fstress_level[stresscur];
					}
#else


					/* eab test code for expanded feature bits */
					if (pDph_t->malfem == MALE)
					{
						targf0 = f0_mstress_level[stresscur]+wordfeat;
					}
					else
					{
						targf0 = f0_fstress_level[stresscur]+wordfeat;
					}
#endif
					wordfeat = 0;


			



				if (pDph_t->malfem == MALE)
					targf0 += f0_mphrase_position[pDphsettar->nrises_sofar];
				else
					targf0 += f0_fphrase_position[pDphsettar->nrises_sofar];
				
					if( pDph_t->number_words == 1 )
						targf0 = targf0 - (targf0>>2);

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

					if (pDph_t->cbsymbol )
					{

						targf0 >>= 2;	/* All gestures reduced in ? */
					}

/* eab 2/21/97 EAB remove emphasisflag and associated stuff pulled see note in phsort.c */

					/* Begin gesture 1/4 of way into the vowel */
#ifdef GERMAN		


					delayf0 = (pDph_t->allodurs[nphon] >> 1)-3 ;
#else
					delayf0 = (pDph_t->allodurs[nphon] >> 2) ;
#endif


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
					//pDph_t->arg2 = targf0;
					//pDph_t->arg3 = 32;
					targf0 = muldv (temp, targf0, 32);

					
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
							make_f0_command ( phTTS,GLIDE, 22, targf0, -6,pDph_t->allodurs[nphon], &cumdur, nphon);
							pDph_t->prevnphon= nphon;
							pDph_t->prevtargf0 = targf0;
						}

					}	

#else

					/* Save stress impulse in command string */
	//					make_f0_command ( phTTS,IMPULSE, 2, targf0, delayf0,20, &cumdur, nphon);

#ifdef GERMAN
						
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
							//	pDph_t->impulse_width += pDph_t->allodurs[nphonx];
							//	nphonx++;
							//}
							delayf0 = delayf0>>1;		/* Less aggressive delay for syllable-final stress */
							pDph_t->impulse_width = delayf0;
						}else{
							while((!pDph_t->allofeats[nphonx] & FBOUNDARY) )
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
								//pDph_t->impulse_width += -(pDph_t->allodurs[nphonx-1]);			/* don't get too close to the end of the word */
								pDph_t->impulse_width -= (pDph_t->allodurs[nphonx-1]);
							}else{
								pDph_t->impulse_width += (pDph_t->allodurs[nphonx]>>1) + (pDph_t->allodurs[nphonx]>>3); /* Add some of the final nucleus is */
							}
						}
					}else if(nextsylbou != nextwrdbou){
						pDph_t->impulse_width += pDph_t->allodurs[nphon];
						delayf0 = 0;
					}else{
						//Want to not add pulse phrase final syl.
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
					//eab aaccording to kiel the first impulse is before the vowel not way later
					//put it at postion -(100ms + 6 frames) for delay of filter
					if(pDph_t->impulse_width > 0)
					{
						make_f0_command (phTTS, IMPULSE, 26, targf0, delayf0, pDph_t->impulse_width, &cumdur, nphon);
						
						
						//make_f0_command (phTTS, IMPULSE, 26, targf0, -20, pDph_t->impulse_width, &cumdur, nphon);
						
						

						//NOW A NEGATIVE PULSE

							targf0 = -targf0; 
						
							delayf0 = delayf0 + pDph_t->impulse_width; 

							pDph_t->impulse_width = 10;
			if(pDph_t->number_words > 2)
			{
						make_f0_command ( phTTS,IMPULSE, 29, targf0, delayf0, pDph_t->impulse_width, &cumdur, nphon);
			}
			
					if(nphon > (pDph_t->nallotot>>2)&& stepcount == 0)
					{
						stepcount++;
						make_f0_command ( phTTS,GLIDE, 21, (short)-(pDphsettar->hatsize>>2), delayf0, 15, &cumdur, nphon);
					}
					else if(nphon > (pDph_t->nallotot>>1)&& stepcount == 1)
					{
						if(nphon > (pDph_t->nallotot-8))
						{
						make_f0_command ( phTTS,GLIDE, 22, (short)-((pDphsettar->hatsize>>1)+(pDphsettar->hatsize>>2)), delayf0, 10, &cumdur, nphon);
						stepcount =0;
						}
						else
						{
						make_f0_command ( phTTS,GLIDE, 23, (short)-(pDphsettar->hatsize>>1), delayf0, 10, &cumdur, nphon);
						stepcount++;
						}
					}
					else if(nphon > (pDph_t->nallotot-8)&& stepcount == 2)
					{
						make_f0_command ( phTTS,GLIDE, 24, (short)-(pDphsettar->hatsize>>2), delayf0, 30, &cumdur, nphon);
						stepcount++;
					}
					
				}
#else
						make_f0_command ( phTTS,IMPULSE, 2, targf0, delayf0, 20, &cumdur, nphon);
#endif // GERMAN


#endif // ENGLISH_UK

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


#endif // #ifndef FRENCH
#ifdef FRENCH //rule 2 from fphinton.c   
		//eab helpme should this be FSYL i.e. start on syllable nucleus
		if( Mot_Accentue)
		
	//if (Syll_Mot_Restantes == 1 && phone_feature(pDph_t, pDph_t->allophons[nphon]) == TSonore)   
		if (Syll_Mot_Restantes == 1 ) //eab already anded with fsyl which I feel is better than fsono anyway
		{
		/* last syllable of a stressed word */
          /* 71 + (210 1er word, 90 2nd word, 60 3rd word, 40, 0) */
			{
			targf0 = f0_stress_level [1] //helpme stresscur]
                 + f0_mphrase_position [pDphsettar->nrises_sofar];
				}
          
        if(pDphsettar->nrises_sofar<=4)
		pDphsettar->nrises_sofar++;
        if (Fin_Groupe || Raise) {
          targf0 += targf0 >> 1;/* increase f0 if Raise or Fin_Groupe */
          pDphsettar->nrises_sofar = 0;
        }						

        delayf0 = pDph_t->allodurs [nphon] >> 2;
        /* Begin impulse much earlier when last stress of phrase */
		/* and reduce it*/
        if (Syll_Synt_Restantes == 1) 
		{
			delayf0 = -NF60MS;
			targf0>>=1;
		}
        /* Except when syllable is emphasized */
        if (stresscur == FEMPHASIS) delayf0 = 0;

        if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED) {
          targf0 = (pDph_t->user_f0 [mf0]-1000) * 10 + 1; /* Odd */
          if (targf0 >= 2000 || targf0 <= 0 || inputscrewup) {
            targf0 = 1; /* Must be odd, greater than 0 */
           // logscrewup(phocur, &inputscrewup);
          }
          delayf0 = mstofr (pDph_t->user_offset [mf0]);
          mf0++;
        }


        /* Scale by speaker def paramter SR, unless emphasized */
        temp = pDph_t->scale_str_rise; /* 32 for Paul */
        if ((stresscur == FEMPHASIS) && (temp < 16)) 
				{
				temp = 16;
				}
		  //pDph_t->arg2 = targf0; 
		  //pDph_t->arg3 = 32-10; 
		  targf0 = muldv (temp, targf0, 32-10);

		  make_f0_command ( phTTS,IMPULSE, 2, targf0, delayf0,20, &cumdur, nphon);
		}
		  
#endif //FRENCH rule 2 from fphinton.c
				/* Rule 3: Execute hat fall */

				/* If presently at top of hat, return to base shortly after */
				/* vowel onset if this is last stressed syllable in phrase */
				if ( pDph_t->had_hatend )
		
#ifdef OLD_FRENCH
				if (Syll_Synt_Restantes <=3 && pDph_t->nallotot-nphon <= 6 
					&& pDph_t->hatpos == AT_TOP_OF_HAT)
#endif
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
#ifndef FRENCH
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
#ifdef notanymore
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
										/* MINOR BUG: (should only depend on first syllabic encountered) */
										delayf0 = pDph_t->allodurs[nphon] - NF50MS;
									}
									if ((pDph_t->allofeats[nphonx] & FBOUNDARY) == FVPNEXT)
									{
										/* This syll is last of a phrase */
										f0fall = 0;		/* More of clause coming */
										goto bfound;
									}
#ifndef ENGLIH_US
									/* eab 4/24/97 I think this may be redundundant*/
									if ((pDph_t->allofeats[nphonx] & FBOUNDARY) > FVPNEXT)
									{
										/* This syll is last of a clause */
										f0fall = F0_NON_FINAL_FALL;	
										pDphsettar->hatsize = pDphsettar->hatsize-150;
										pDph_t->hatstate = AFTER_NONFINAL_FALL;
										/* Go slightly below baseline */
										goto bfound;
									}
#endif
									/* Else continue looking for last syll of this phrase */
								}
							}
						}
						/* END OF LEFT SHIFT */
#endif		//notanymmore				
						/* Or because question rise on same syllable */
	if ((struccur & FBOUNDARY) == FQUENEXT)
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
							//eab 3/28/01change see bats 952. setences ending in unstressed syl with a 
							//comma had unpleasant intonatin. Next version we should really be 
							//able to improve this stuss
							delayf0 -= NF40MS;
							f0fall = 40;
							pDphsettar->hatsize = pDphsettar->hatsize>>1;

						}
						
						
						
						
					}
				}
#ifdef REPLACED_BY_OTHER_CODE
				/*			  Make fall very early if also contin. rise on same syl */
				/*			  i.e. readjust timing so get fall-rise, not r-f-r */
				else if ((nextphrbou == FCBNEXT)
					|| (nextphrbou == FQUENEXT)) {
					lowrisesw++;
					delayf0 = -NF20MS;
					f0fall = 140;
				}
#endif
				if (pDph_t->hatstate == AFTER_FINAL_FALL) {
					lowrisesw = 0;
				}
				
#endif // #ifndef FRENCH
				
				/* Pitch falls are less pronounced for some speakers 
				* to reduce impression of assertive personality */
				f0fall = frac4mul (f0fall, pDph_t->assertiveness);
				if (pDph_t->cbsymbol)
				{
					f0fall = f0fall >> 1;	/* Gest reduced in ? */
				}
				
				
				/* Total fall is hatsize + f0fall below baseline */
				/* eab In evlotution of chnaginf now hat _fall should be defined differently
				eab 4/20/98 */
				
				
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
#ifndef FRENCH
					/*	Delay fall if more sonorants after nucleus */
					//EAB 2/23/99
					if (feanex & FSONOR)
					{
						delayf0 = +NF90MS;
					}
#else
					f0fall=300;
					/*eab slope down then flaten out on last syl*/
					/*eab !fprop means not a period ie a ie a comma*/
					if ( strucnex & FSYNT && !(strucnex & FPROP) ) 
#endif
#ifndef SPANISH
//#ifndef GERMAN						 verify with reiner
						make_f0_command ( phTTS,STEP, 3, (short)-f0fall , delayf0, 20, &cumdur, nphon); // NAL warning removal
//#endif
#else
					
				make_f0_command ( phTTS,STEP, 3, (short)+250 , -15, 10, &cumdur, nphon); 
				make_f0_command ( phTTS,STEP, 3, (short)-f0fall , delayf0, 20, &cumdur, nphon); 
#endif
					
					pDphsettar->hat_loc_re_baseline -= f0fall;
#ifdef FRENCH
					pDph_t->hatpos = AT_BOTTOM_OF_HAT;
#endif
				}
				
				/* 
				* Rule 4: Add positive pulse to approximate nonterminal fall-rise          
				* in stressed clause-final but non-sentence-final syllable, 
				* or in sentence ending in a question mark 
				*/
#ifndef FRENCH
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
#else
					if ( strucnex & FSYNT && !(strucnex & FPROP) ) 
#endif // #ifndef FRENCH
					{
						/* Time rise to begin near end of vowel */
						delayf0 = pDph_t->allodurs[nphon] - NF80MS;
						
						pDph_t->delta_special = 0;
						
#ifndef FRENCH
						if ((struccur & FBOUNDARY) == FQUENEXT)
						{
							/* Sent.-final stressed vowel followed by q-mark */
							
							/* EAB We want the hardcoded gestures to be defined in a language specific 
							or speaker specific way file they ultimately want to be setable perhaps so for now I'm going
							to move all of these kinds of things to the speaker def files. 2/26/97 */
#ifdef GERMAN 
							/* found that it is firing on clause final syllable in German for some
							reason but also in German it presently appears to not be required so not worth
							troubleshooting at the moment */ 
							pDph_t->delta_special = 0; /* This code is garbage put here as a noop space filter
							so that sompiler wouldn't get lost*/
#elif defined SPANISH_LA // HELPME Ed check this out... MGS
							if(pDph_t->number_words == 1)
							{
								make_f0_command ( phTTS,IMPULSE, 41,F0_QGesture1+300, delayf0-2,24, &cumdur, nphon);
								make_f0_command ( phTTS, IMPULSE, 41,F0_QGesture2, (pDph_t->allodurs[nphon]>>1),24, &cumdur, nphon);
							}
							else
							{
								make_f0_command ( phTTS,IMPULSE, 41,F0_QGesture1, delayf0-2,24, &cumdur, nphon);
								make_f0_command ( phTTS, IMPULSE, 41,F0_QGesture2, (pDph_t->allodurs[nphon]>>1),24, &cumdur, nphon);
							}
							
							
							
#else
							make_f0_command ( phTTS,IMPULSE, 41,F0_QGesture1, delayf0,24, &cumdur, nphon);
							make_f0_command ( phTTS, IMPULSE, 41,F0_QGesture2, pDph_t->allodurs[nphon],24, &cumdur, nphon);
#endif // GERMAN
						}
						else
						{
							/* Phrase-final stressed vowel followed by comma */
							/* 2/26/97 See comment above*/
							
							
							pDph_t->delta_special = -50;
							/* EAB 2/15/98 Needs earlier */
							
							delayf0 -= NF20MS;
#if defined GERMAN || defined ENGLISH || defined FRENCH
							//BATS 709
							if(pDph_t->commacnt == 0)
							{
								make_f0_command ( phTTS, IMPULSE,42,  F0_CGesture1, 3 ,22, &cumdur, nphon);
								make_f0_command ( phTTS, IMPULSE, 42, F0_CGesture2, (short)(pDph_t->allodurs[nphon]>>1),18, &cumdur, nphon); // NAL warning removal
							}
							
							else
#endif
								
							{
								make_f0_command ( phTTS, IMPULSE,420,  F0_CGesture1, delayf0,24, &cumdur, nphon);
								make_f0_command ( phTTS, IMPULSE, 420, F0_CGesture2, (short)(pDph_t->allodurs[nphon]>>1),24, &cumdur, nphon); // NAL warning removal
							}
							pDph_t->commacnt++;
							
#endif // #ifndef FRENCH

#ifdef FRENCH
							delayf0 += NF20MS;
#else
						}
#endif // FRENCH
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
#endif
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
						
						f0fall = 120;
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
#endif						
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
					
#ifndef 	GERMAN
					make_f0_command ( phTTS,STEP, 31, (short)-f0fall, delayf0,0, &cumdur, nphon); // NAL warning removal
#endif
					pDphsettar->hat_loc_re_baseline -= f0fall;
					
				}

			}

			/* 
			 * Rule 5: Final fall on unstress clause-final syl, or on stressed 
			 * clause - final syll that didn't have hat fall due to earlier emphasis 
			 */

#ifndef FRENCH		
			if ((feacur & FSYLL) IS_PLUS)
			{
#ifdef GERMAN   //BATS 709
				if((stresscur & FSTRESS) IS_MINUS)
					
#else
				if(((stresscur & FSTRESS_1) IS_MINUS)	/* 2-str or 0-str */
				/*	|| ((struccur & FHAT_ENDS) IS_MINUS)*/)
#endif
					
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

							pDph_t->test_targf0 = targf0;	/* RSM created this variable to reduce final fall in GERMAN */
							pDph_t->impulse_width = 20;		/* RSM */

							/* Sent.-final unstressed vowel followed by a period */
							/* EAB with addition of new code to glotalize in phdrwt0 this
							needs to grt alot weaker*/
#ifdef GERMAN
							pDph_t->test_targf0 = targf0>>2;	/* RSM */
							pDph_t->impulse_width = 10;			/* RSM */
							if(pDph_t->number_words == 1)
							{
								make_f0_command ( phTTS,GLOTTAL, 5, (short)(targf0>>1), (short)(pDph_t->allodurs[nphon] - NF30MS), 30, &cumdur, nphon); // NAL warning removal
							}
							else
#endif
							
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
#endif // #ifndef FRENCH
		if ((phone_feature( pDph_t,pDph_t->allophons[nphon]) & FSYLL) IS_PLUS)
		{
#ifdef FRENCH
							//help This pitch fall looks REALLY BOGUS

				if ( nphon >1 && (strucnex & FPROP))
				{
					if(nphon >4)

							targf0 = -411; 
					else
						targf0 = -200;
			  /* Pitch falls are less pronounced for some speakers
              to reduce impression of assertive personality */
			  /*            targf0 = frac4mul (targf0, assertiveness);
              targf0 |= 01;*/ /* Must be odd */
              /* Sent.-final unstressed vowel followed by a period */
            make_f0_command (phTTS, GLOTTAL, 5,targf0, (short)(pDph_t->allodurs[nphon]-(NF100MS+NF80MS)), 20, &cumdur, nphon);			
#endif				
				}
		}

#ifndef FRENCH
		/* Rule 6: Continuation rise on unstress clause-final syll before  comma or ? */
	
		/* Rise occurs just before end of vowel */ 

		/* This rule also appears to apply a final pitch fall to all declarative sentence-final syllables RSM */

		delayf0 = pDph_t->allodurs[nphon] - NF115MS;
		if ((struccur & FBOUNDARY) == FQUENEXT)
		{
#ifdef GERMAN							
			/* Unstressed vowel followed by a question mark */
			make_f0_command ( phTTS,IMPULSE, 6, F0_QGesture1, delayf0, 24, &cumdur, nphon);
			make_f0_command ( phTTS,GLIDE, 6, F0_QGesture2,0, pDph_t->allodurs[nphon], &cumdur, nphon);
#else
			/* Unstressed vowel followed by a question mark */
			make_f0_command ( phTTS,IMPULSE, 6, F0_QGesture1, delayf0, 24, &cumdur, nphon);
			make_f0_command ( phTTS,IMPULSE, 6, F0_QGesture2, pDph_t->allodurs[nphon],20, &cumdur, nphon);
#endif
			
		}
		if ((struccur & FBOUNDARY) == FCBNEXT)
		{
			/* Unstressed vowel followed by a comma */
			
			delayf0 += NF20MS;
#ifndef GERMAN
			make_f0_command ( phTTS,IMPULSE, 6, F0_CGesture1, 0, 24, &cumdur, nphon);
			make_f0_command ( phTTS,IMPULSE, 6, F0_CGesture2,delayf0, 20, &cumdur, nphon);
#else
			make_f0_command ( phTTS, GLIDE,6, F0_CGesture2, -60, 30, &cumdur, nphon);
			
#endif
			pDph_t->commacnt++;
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
						make_f0_command ( phTTS,IMPULSE, 6, (short)(targf0>>1), (short)(pDph_t->allodurs[nphon] - NF30MS), 30, &cumdur, nphon); // NAL warning removal
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
							make_f0_command ( phTTS,IMPULSE, 6, pDph_t->test_targf0,  delayf0, pDph_t->impulse_width, &cumdur, nphon);
						}
					}
					else
					{
						make_f0_command ( phTTS,IMPULSE, 6, pDph_t->test_targf0, (short)(pDph_t->allodurs[nphon]>>1)+3, pDph_t->impulse_width, &cumdur, nphon); // NAL warning removal
					}
					
				}
				
			}
#endif // #ifndef FRENCH

			/* Rule 7: Reset baseline at end of sentence */

			if (phocur == GEN_SIL)
			{
				stepcount=0;
				/* Reset f0 to hat bottom from sub-hat-bottom */
				if ((pDphsettar->hat_loc_re_baseline != 0) && (pDph_t->nf0tot > 0))
				{
/* eab german code is bull it's too late to do this stuff I think eab 2/26/97 
GERMAN
					if (pDph_t->cbsymbol)
						make_f0_command ( phTTS, 7, +180, 20, &cumdur, nphon);
					else
#endif  */
//#ifndef (GERMAN || SPANISH) 
					//BATS 711
#if !(defined  GERMAN || defined ENGLISH_US || defined SPANISH)

					make_f0_command ( phTTS,STEP, 7, (short)( -(pDphsettar->hat_loc_re_baseline) ), 0, 20, &cumdur, nphon); // NAL warning removal
#endif 

					pDphsettar->hat_loc_re_baseline = 0;
				}

				if (nphon > 0)
					pDphsettar->nrises_sofar = 1;	/* Soft reset */
#ifdef FRENCH
				pDph_t->hatpos=AT_BOTTOM_OF_HAT;
#else
				if ((pDph_t->allofeats[nphon - 1] & FBOUNDARY) == FCBNEXT
					&& pDph_t->nf0tot > 0
					&& (pDph_t->allophons[nphon - 1] != GEN_SIL))
				{
					make_f0_command ( phTTS,F0_RESET, 7, 0, 0, 0, &cumdur, nphon); /* RESET! */
					issubclause = TRUE;
				}
#endif // FRENCH
				/* Rule 8: Reset baseline and hat position to brim if end of a sentence */
				/*** Add condition to reset if long clause followed by comma and long clause */
#ifndef OLD_FRENCH
				if ((struclas & FSENTENDS) IS_PLUS)
				{
					pDph_t->commacnt=0; //BATS709
					make_f0_command ( phTTS,F0_RESET, 8, 0, 0, 0, &cumdur, nphon);
					pDphsettar->hat_loc_re_baseline = 0;
					/* Hard reset counter of stressed sylls in clause */
					pDphsettar->nrises_sofar = 0;
				}
#endif // OLD_FRENCH

#ifdef OLD_FRENCH
				make_f0_command (phTTS, F0_RESET, 8, 0, 0, 0, &cumdur, nphon);
				pDphsettar->hat_loc_re_baseline = 0;
				/* Hard reset counter of stressed sylls in clause */
				pDphsettar->nrises_sofar = 0;
#endif //OLD_FRENCH
			}
			/* printf("\ndur \t\t%4d\t%4d fotar nphone %d", ((cumdur*64)/10), f0tar[n],nphon); */
		

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

#ifndef ENGLISH_UK

			/* Rule 9: Add short schwa vowel to create release of [p,t,k,b,d,g] into sil. 
			 * Logically, this kind of rule should appear in PHALLOPH.C, but
			 * delaying it to here makes all dur and f0 rules much simpler 
			 * EAB 2/28/97 changing to generalize when FPLOS + Fburst then release into a schwa
			 */
	if (( phonex == GEN_SIL)&& (phone_feature( pDph_t,phocur) & FPLOSV) 
			&& (phone_feature( pDph_t,phocur) & FBURST) )
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
				|| (phone_feature( pDph_t,phocur) & FDENTAL ))
			{
				pDph_t->allophons[nphon + 1] = SCHWA2;
			}

			pDph_t->allodurs[nphon + 1] = NF40MS;
			cumdur += NF40MS;
			cumdur += pDph_t->allodurs[nphon+1];

			/*eab 8/96 update tcumdur*/
			pDph_t->tcumdur +=pDph_t->allodurs[nphon+1];
			pDph_t->allofeats[nphon + 1] = pDph_t->allofeats[nphon] | FDUMMY_VOWEL;
			pDph_t->nallotot++;
			nphon++;
	}
#endif // ENGLISH_UK

#ifdef FRENCH  
		if ( feacur &FSYLL )
		{                    

			Syll_Mot_Restantes--;
			Syll_Synt_Restantes--;

	    } /* if FSYLL */
#endif
}
			  
}

 
/* ******************************************************************
 *      Function Name: make_f0_command()      
 *
 *  	Description: Put an f0 command into f0tar and f0tim arrays  
 *
 *      Arguments: 	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					short type
 *				   	short rulenumber
 *					short tar
 *		            short delay
 *					short length
 *		            short *psCumdur
 *					short nPhon
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
static void make_f0_command (LPTTS_HANDLE_T phTTS, short type, short rulenumber, short tar,
				 			 short delay, short length, short *psCumdur, short nphon)
{
#ifdef PH_DEBUG
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
#endif
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	
	

	/* Cudur reflects time (in frames) since last f0 command        */
	/* Cumdur+delay should never be less than zero                  */

	/* static short prpholas, temp; *//* MVP : Never Used,comment it out */
	/* If requested time is earlier than last f0 command, zero offset */

		
#ifdef PH_DEBUG
#ifndef UNDER_CE	//CAB 03/15/00 WINprintf not supported under Windows CE
	if (DT_DBG(PH_DBG,0x010))
		WINprintf("phon %d nphon %d rule %d type %d , tar %d delay %d length %d  \n",(pDph_t->allophons[nphon] & PVALUE), nphon, rulenumber,type, tar, delay, length);
#endif
#endif
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
/***********************end of ph_inton.c**************************************/