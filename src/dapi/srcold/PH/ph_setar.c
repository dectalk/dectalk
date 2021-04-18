/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved. 
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved.
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
 *    File Name:    ph_setar.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Reset targets and Transition Specification for next phone
 *    This routine is called by PHCLAUSE
 *    Order of control params in tables: (F0 preceeds these in param[])
 *    F1,F2,F3,FZ,B1,B2,B3,AV,AP,A2,A3,A4,A5,A6,AB,TILT
 *    This is really only the order in "param". The output order is
 *    independent of this. Look at the "OUT_" stuff in "phdefs.h".
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 DK      03/12/1984      Initial creation
 * 0002 DGC     12/27/1984      Modified for the 80186.
 * 0003 DGC     01/02/1985      Use call to "mstofr" to prevent 16-bit overflow
 * 0004 DK      01/09/1985      Change VOT rule
 * 0005 DK      02/13/1985      Add rules changing vowel targets as f(context)
 *                              and extend rules to TILT parameter
 * 0006 DK      02/28/1985      Increase coartic and reduce AV for unstressed
 * 0007 DK      03/20/1985      BW widening for voiced next to -voiced by explicit rule
#ifdef ENGLISH_US
 * 0008 DK      03/25/1985      Comment out rule to add voicebar for [b,d,g]
 * 0009 DK      05/06/1985      Make ends of clauses/phrases breathy, esp. for females
 * 0010 DK      05/17/1985      No breathy onset from sil ("raider" heard as "greater")
 * 0011 DK      06/20/1985      Nasal before silence too stong
 * 0012 DK      07/29/1985      Adjust tilt targets, make transitions smooth sometimes
 * 0013 DK      08/24/1985      Reinstate voicebar for [b,d,g] followed by -voiced
 * 0014 MGS     03/25/1996      Merged Win 95 code to 42c  
 * 0015 MGS     04/02/1996      Made sure all local variables are initialized
 * 0016 EAB     03/06/1996      The stress amplitude for stessed unstressed syllables
 *                              was only 1db the minimal perceptable level not enough
 *                              to be functional for stressed vs unstressed to 3db
 * 0017 MGS     05/29/1996      Merged Ed'ss changed since 0014
#endif
#ifdef SPANISH
 * 0008 MM      04/02/1985      68000 hacks
 * 0009 MM      10/18/1985      Changes per review by Prof. Quilis
 * 0010 MM      03/26/1986      Dennis' changes
 * 0011 EAB     04/04/1986      greatly reduced dennis's shift of the second formant
 *                              in palatal or dental enviroment as it doesn't fit
 *                              data. will discuss with dennis.
 * 0012 MM      04/08/1986      Merged Ed's changes into baselevel.
 * 0013 MM      04/10/1986      Fixed voicebar code.  Fixed [ch] durations.
 * 0014 MM      04/14/1986      [bh dh gh] nolonger voicebars.
 * 0015 MM      04/16/1986      Redid vowel coarticulations
 * 0016 MM      04/17/1986      Continued vowel stuff, added bdgtilt[]
 * 0017 MM      04/18/1986      Bit the bullet -- removed locus table, replaced
 *                              it by boundary value table.
 * 0018 MM      04/28/1986      Slight changes to nasal trans. durations.
 *                              Blocked transition to silence rule.
 * 0019 MM      04/29/1986      Dipthong rule (?)
 *  0020 MM     05/05/1986      [y] now a fricitive, [yh] now an affricate
 * 0021 MM      05/071986       Fixed some [yh] bugs, fixed tilt for bdg
 * 0022 MM      05/08/1986      Still fixing [yh] and tilt bugs.
 *                              Added [m] and [n] assimilation rules.
 *                              Added [s] and [th] prevoicing rule.
 * 0023 CJL     02/10/1995      Added prototypes to get around bug.
 * 0024 CJL     02/22/1995      tartemp changed to 14-5. Merged Ed B sources
#endif
 * 0025 MGS     06/04/1996      Merged spanish with english,  langiage specific funcitons 
 *                              moved to ph_sttr1.c
 * 0026 MGS     06/06/1996      Changed filne name from phsettar.c ph_setar.c
 * 0027 MGS     06/18/1996      Merged Germa whith Spanish/english
 * 0028 EDB     12/10/1996      Change code in turning off breath switch section
 * 0029 EAB     05/08/1997      Aspiration  of segment after plosive  still too hot in spanish
 * 0030 MGS     09/09/1997      Made change for osf build
 * 0031 EAB     10/12/1997      Edited for UK
 * 0032 GL      04/15/1998      For BATS#492 convert get_phone() to macro, move it to ph_defs.h
 * 0033 EAB		04/27/1998		Removed old broken rule that was breaking german r (RRULE 9) and
                                added an F2 modification rule for rr into u
 * 0034 EAB		05/18/1998		BATS249 removed unused variable pholm2.
 * 0035 EAB		05/20/1998     	BATS681  Remove unneeded code--debugforward,debugback
 * 0036 EAB		11/9/1998     	BATS 716 Fixed but bats never noted and cleared
 * 0037	MGS		04/13/2000		Changes for integrated phoneme set 
 * 0038 NAL		04/14/2000	    Fixed externs featb, begtyp, burdr, endtyp, place,
 *								ptram, plocu to match ph_rom.c files
 * 0039 EAB		06/28/2000		Unified Phoneme Set Changes
 * 0040 NAL		06/12/2000	    Warning removal
 * 0041 CHJ		07/20/2000		French added
 * 0042 CAB		10/18/2000		Changed copyright info and formatted comments
 * 0043 EAB  					Change to reduce gettar overhead for 4.61 CE
 * 0044	MGS		12/13/2000		Further optimization on gettar
 * 0045	MGS		01/18/2001		Removed arg1 arg2 and arg3 from calculations 
 * 0046 CAB		01/15/2001		Merged changes for Michel Divay for French.
 * 0047 EAB		01/23/2001		Added variable phontemp to replace arg1,arg2,arg3
 * 0048 CAB		01/23/2001		Remerged for French.
 * 0049	MFG		05/29/2001		Included dectalkf.h
 * 0050	CAB		06/01/2001		Fixed typo in copyright info
 * 0051 EAB		07/10/2001		bats 982
 * 0052 MGS		04/17/2002		ARM7 port
 * 0053	CAB		04/25/2002		Removed warnings by typecast
 */

#include "dectalkf.h"
#include "ph_def.h"                   


//#define   LOW_VOWEL             6 Not used any more

#define FRONT_VOWEL             1
#define BACK_UNROUNDED_VOWEL    2
#define BACK_ROUNDED_VOWEL      3
#define OBSTRUENT               4
#define ROUNDED_SONOR_CONS      5       
extern const short us_maleloc[];
extern const short us_maldip[];
extern const short us_maltar[];
//extern const short us_malamp[];

extern const short uk_maleloc[];
extern const short uk_maldip[];
extern const short uk_maltar[];
//extern const short uk_malamp[];

extern const short gr_maleloc[];
extern const short gr_maldip[];
extern const short gr_maltar[];
//extern const short gr_malamp[];

extern const short la_maleloc[];
extern const short la_maldip[];
extern const short la_maltar[];
//extern const short la_malamp[];

extern const short sp_maleloc[];
extern const short sp_maldip[];
extern const short sp_maltar[];
//extern const short sp_malamp[];

//extern const short fr_maleloc[];
//extern const short fr_maldip[];
//extern const short fr_maltar[];
//extern const short fr_malamp[];

extern const short us_femloc[];
extern const short us_femdip[];
extern const short us_femtar[];
extern const short us_femamp[];

extern const short uk_femloc[];
extern const short uk_femdip[];
extern const short uk_femtar[];
extern const short uk_femamp[];

extern const short gr_femloc[];
extern const short gr_femdip[];
extern const short gr_femtar[];
extern const short gr_femamp[];

extern const short la_femloc[];
extern const short la_femdip[];
extern const short la_femtar[];
extern const short la_femamp[];

extern const short sp_femloc[];
extern const short sp_femdip[];
extern const short sp_femtar[];
extern const short sp_femamp[];

extern const short fr_femloc[];
//extern const short fr_femdip[];
//extern const short fr_femtar[];
extern const short fr_femamp[];

extern const short *all_begtyp[];
extern const short *all_endtyp[];
extern const short *all_ptram[];
extern const short *all_burdr[];
extern const short *all_plocu[];


__inline short begtyp(int phone);
__inline short endtyp(int phone);
__inline short ptram(int phone);
__inline short burdr(int phone);
__inline short plocu(int index);

#ifdef GERMAN
	//#define   RRULES   9      /* enable uvular R-rules */ eab 4/27/98 don't work right no time to evaualte
 	// before release of code
	
//#define   LRULES   9		/* enable L-rules */
//eab 3/12/02 eab and reiner. The germans had too mush sschnapps-- eliminate these rules
//and add back items when deemed needed. 
#endif

#ifdef SPANISH
#define ASPIRATION_AMPLITUDE    42
/* EAB  of segment after plosive  05/08/97 EAB Still too hot in some places */

/* 
 * Used to select boundary values
 */
#endif
#define INITIAL                 FALSE
#define FINAL                   TRUE


static char sonequivindex[] =
{
			0,      /* Unused                       */
			2,      /* Front vowel                  */
			0,      /* Back unrounded               */
			4,      /* Back rounded                 */
			0,      /* ?? *//* Obstruent            */
			4       /* Rounded sonorant consonant   */
};


/* #define DEBUG_targetS   0  *//* Print Debug stuff.            */

/***************************************************************************/
/* MVP : The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                */
/* Input arrays (set by call to PHSETTAR.C whenever time for new phone)    */
/* extern PARAMETER param[];       Struc of input vars for each par        */
/* INPUT arrays                                                            */
/* extern short durfon;       Dur in frames of curr phone                  */
/* Variables for vowel-vowel coarticulation across a conson, F2 only       */
/* extern short fvvtran,bvvtran,tvvbacktr,dfvvtran,dbvvtran;               */
/* extern short breathysw;       Add asp & tilt down spect if == 1         */
/* OUTPUT arrays:                                                          */
/* extern short parstochip[];    Values sent to chip in prev. frame        */
/* extern short allophons[];    Input phonetic array                       */
/* extern short allofeats[];    Struc features of inputphones              */
/* extern short allodurs[];     Durations in frames of input               */
/* extern short nallotot;       Total number of input phones               */
/* extern short malfem;         Def of current speaker sex                 */
/* extern short *p_locus;       Usually pointing to maleloc[]: (locus      */
/* extern short *p_diph;        Usually pointing to maldip[]:              */
/* (diphthonization info for segments)        */
/* extern short *p_tar;         Usually pointing to maltar[]: (arrays      */
/* of phoneme target values)                  */
/* extern short *p_amp;         Usually pointing to malamp[]: (array       */
/* of parallel amp targets for frics)         */
/* extern short pDph_t->arg1,pDph_t->arg2,pDph_t->arg3; pDph_t->arguments for muldv, mlsh1                 */
/* extern short dipspec[];      Dipthong targets will be put here          */
/* extern short nphone;         Pointer to cur phone in imput              */
/***************************************************************************/

/* From PHROM.C: */

int gettar(LPTTS_HANDLE_T phTTS, int phone);
//extern __inline short phone_feature(PDPH_T pDph_t, int phone);	   /* Phonetic features */
#define phone_feature(a,b) (all_featb[(b)>>8][(b)&0x00ff])

__inline short place(int);
extern const short *all_place[];
extern const short			 us_place[];
extern const short             uk_place[];
extern const short             sp_place[];
extern const short             la_place[];
extern const short             gr_place[];
extern const short			 fr_place[];

extern const short            us_begtyp[];
extern const short            uk_begtyp[];
extern const short            la_begtyp[];
extern const short            sp_begtyp[];
extern const short            gr_begtyp[];
extern const short			fr_begtyp[];

extern const short            us_ptram[];           /* Pointer into array parallel amps for frics */
extern const short            uk_ptram[];
extern const short            la_ptram[];
extern const short            sp_ptram[];
extern const short            gr_ptram[];
extern const short			fr_ptram[];

extern const short            us_burdr[];           /* List of burst durs in msec for plosives */
extern const short            uk_burdr[];
extern const short            la_burdr[];
extern const short            sp_burdr[];
extern const short            gr_burdr[];
extern const short			fr_burdr[];

extern const short            us_plocu[];           /* Pointer into above table */
extern const short            uk_plocu[];
extern const short            sp_plocu[];
extern const short            la_plocu[];
extern const short            gr_plocu[];
extern const short			fr_plocu[];

extern short            *inhdr;           /* Used with durfon to shrink tran durs */
//extern short            *burdr;           /* List of burst durs in msec for plosives */
//extern short            *ptram;           /* Pointer into array parallel amps for frics */
//extern short            *plocu;           /* Pointer into above table */

/* freq, percent, and tran dur table)   */
extern short            parini[];          /* Initial or default values for pars  */
extern char             partyp[];          /* Type of table to use to get tar val */
extern short            divtab[];          /* Use multiply for divide-by-small-#  */

/* End of arrays in PHROM.C */




extern short            printsw;           /* Debugging printout only */
extern char            *parname[];         /* Debugging printout only */
short					phontemp;					
short            getbegtar ( LPTTS_HANDLE_T phTTS, int nfone);
short            getendtar (LPTTS_HANDLE_T phTTS, int nfone);
short            gr_gettar (LPTTS_HANDLE_T phTTS, int nphone_temp);
short            us_gettar (LPTTS_HANDLE_T phTTS, int nphone_temp);
short            sp_gettar (LPTTS_HANDLE_T phTTS, int nphone_temp);
short            la_gettar (LPTTS_HANDLE_T phTTS, int nphone_temp);
short            uk_gettar (LPTTS_HANDLE_T phTTS, int nphone_temp);
short			 fr_gettar (LPTTS_HANDLE_T phTTS, int nphone_temp);

//int  gettar (LPTTS_HANDLE_T phTTS, int nphone_temp);

short (*(all_gettar[32]))(LPTTS_HANDLE_T phTTS, int nphone_temp) = {
/* 00 */	us_gettar,
/* 01 */	NULL,
/* 02 */	NULL,
/* 03 */	NULL,
/* 04 */	NULL,
/* 05 */	NULL,
/* 06 */	NULL,
/* 07 */	NULL,
/* 08 */	NULL,
/* 09 */	NULL,
/* 0A */	NULL,
/* 0B */	NULL,
/* 0C */	NULL,
/* 0D */	NULL,
/* 0E */	NULL,
/* 0F */	NULL,
/* 10 */	NULL,
/* 11 */	NULL,
/* 12 */	NULL,
/* 13 */	NULL,
/* 14 */	NULL,
/* 15 */	NULL,
/* 16 */	NULL,
/* 17 */	NULL,
/* 18 */	NULL,
/* 19 */	fr_gettar,
/* 1A */	la_gettar,
/* 1B */	sp_gettar,
/* 1C */	gr_gettar,
/* 1D */	uk_gettar,
/* 1E */	us_gettar,
/* 1F */	NULL
};

#ifndef _DEBUG
//#define  gettar(a,b) ((all_gettar[(get_phone(((PDPH_T)((a)->pPHThreadData)),(b)))>>8])((a),((b))))
#else
//__inline short gettar(LPTTS_HANDLE_T phTTS,int nphone_temp)
//{
//	return (all_gettar[(get_phone(((PDPH_T)(phTTS->pPHThreadData)),nphone_temp))>>8])(phTTS,nphone_temp);
//}
#endif
									 

/* Protype to work around a MSVC preprocessor problem */
extern short            ukspecial_coartic (PDPH_T pDph_t, short nfon, short diphpos);
extern short            usspecial_coartic (PDPH_T pDph_t, short nfon, short diphpos);
extern short            laspecial_coartic (PDPH_T pDph_t, short nfon, short diphpos);
extern short            spspecial_coartic (PDPH_T pDph_t, short nfon, short diphpos);
extern short            grspecial_coartic (PDPH_T pDph_t, short nfon, short diphpos);
extern short			frspecial_coartic (PDPH_T pDph_t, short nfon, short diphpos);

static short            setloc (LPTTS_HANDLE_T phTTS,
								short nfonobst,         /* Segment thought to be an obstruent     */
								short nfonsonor,        /* Segment thought to be a sonorant       */
								char initfinso,         /* Set to 'i' if use init part of sonor   */
								short nfonvowel,        /* Segment (vowel?) on other side of obst */
								short feanex);

static void             us_forw_smooth_rules (LPTTS_HANDLE_T phTTS, short shrif, short pholas,
										   short fealas, short feacur, short struclas,
										   short struccur, short feanex);

static void             la_forw_smooth_rules (LPTTS_HANDLE_T phTTS, short shrif, short pholas,
										   short fealas, short feacur, short struclas,
										   short struccur, short feanex);

static void             sp_forw_smooth_rules (LPTTS_HANDLE_T phTTS, short shrif, short pholas,
										   short fealas, short feacur, short struclas,
										   short struccur, short feanex);

static void             uk_forw_smooth_rules (LPTTS_HANDLE_T phTTS, short shrif, short pholas,
										   short fealas, short feacur, short struclas,
										   short struccur, short feanex);

static void             gr_forw_smooth_rules (LPTTS_HANDLE_T phTTS, short shrif, short pholas,
										   short fealas, short feacur, short struclas,
										   short struccur, short feanex);

static void             fr_forw_smooth_rules (LPTTS_HANDLE_T phTTS, short shrif, short pholas,
										   short fealas, short feacur, short struclas,
										   short struccur, short feanex);


static void             us_back_smooth_rules (LPTTS_HANDLE_T phTTS, short shrib, short feacur,
										   short feanex, short strucnex);

static void             uk_back_smooth_rules (LPTTS_HANDLE_T phTTS, short shrib, short feacur,
										   short feanex, short strucnex);

static void             sp_back_smooth_rules (LPTTS_HANDLE_T phTTS, short shrib, short feacur,
										   short feanex, short strucnex);

static void             la_back_smooth_rules (LPTTS_HANDLE_T phTTS, short shrib, short feacur,
										   short feanex, short strucnex);

static void             gr_back_smooth_rules (LPTTS_HANDLE_T phTTS, short shrib, short feacur,
										   short feanex, short strucnex);

static void             fr_back_smooth_rules (LPTTS_HANDLE_T phTTS, short shrib, short feacur,
										   short feanex, short strucnex);


static void             us_special_rules (LPTTS_HANDLE_T phTTS, short fealas,
									   short feacur, short feanex, short struclm2,
									   short struccur, short pholas, short struclas);

static void             uk_special_rules (LPTTS_HANDLE_T phTTS, short fealas,
									   short feacur, short feanex, short struclm2,
									   short struccur, short pholas, short struclas);

static void             sp_special_rules (LPTTS_HANDLE_T phTTS, short fealas,
									   short feacur, short feanex, short struclm2,
									   short struccur, short pholas, short struclas);

static void             la_special_rules (LPTTS_HANDLE_T phTTS, short fealas,
									   short feacur, short feanex, short struclm2,
									   short struccur, short pholas, short struclas);

static void             gr_special_rules (LPTTS_HANDLE_T phTTS, short fealas,
									   short feacur, short feanex, short struclm2,
									   short struccur, short pholas, short struclas);

static void             fr_special_rules (LPTTS_HANDLE_T phTTS, short fealas,
									   short feacur, short feanex, short struclm2,
									   short struccur, short pholas, short struclas);


static void             init_variables (LPTTS_HANDLE_T phTTS, short *psInhdr_frames, short *psShrink,
										short *psShrif, short *psShrib,
										short *psPholas, short *psFealas, short *psFeacur,
										short *feanex, short *psStruclm2, short *psStruclas,
										short *psStruccur, short *psStrucnex, short **ppsNdips,
										short *psPhonp2);

static void             make_dip (PDPH_T pDph_t, short pdip, short inhdr_frames, short shrink,
								  short struccur, short **ppsNdips);

/* GL 04/15/98  For BATS#492 not a function any more
static short              get_phone (PDPH_T pDph_t, short pointer);
*/

static void             vv_coartic_across_c (PDPH_T pDph_t, short remoteV, short remotetar,
											 short currentV, short currenttar, short middleC,
											 short dur_cons);

static int              shrdur (PDPH_T pDph_t, short durin, short inhdr_frames, short shrink);


static int span_spec_coart (PDPH_T pDph_t,
							short vowel,   /* Current phoneme              */
							short other);  /* Other (next/last) phoneme    */

static int la_spec_coart (PDPH_T pDph_t,
							short vowel,   /* Current phoneme              */
							short other);  /* Other (next/last) phoneme    */


#include "ph_sttr1.c"   /* pick up the language specific functions */

#include "ph_sttr2.c"   /* get more language dependent code shared between more than one language */


/********************************************************************************/
/* MVP : List of static variables made instance specific                        */
/********************************************************************************/
/* Temporary boundary value and duration of transition */
/* static short bouval;         */
/* static short vvbouval;       */
/* static short durtran;        */
/* static short vvdurtran;      */

/* MVP : This varaible is used only in this file and so it is made static */
/* I couldn't understand the comments for this variable set by some one earlier */
/* static short pDphsettar->phcur; *//* Make variable available to PHDRAW.C for    */
/* computing TILT (SHIFT THIS CALC HERE)      */

/* Variables based on ratio of durfon to inhdr[], used for -OBST only */
/* static short inhdr_frames; *//* MVP :Made local to phsettar() */
/* static short shrink; *//* Shrink or lengthen diph trans nonlinearly */
/* static short shrif;  *//* Shrink forward transitions in -OBST    */
/* static short shrib; *//* Shrink backward transitions in -OBST   */

/* static short phonp2; *//* MVP : The value of phonp2 is never used */
/* static short pholas,pDphsettar->phonex */
/* static fealas,feacur,feanex */
/* static short struclm2,struclas,struccur,strucnex; */
/* static short bdur,vot,ptemp,dipsw; */
/* static short gencoartic; *//* MI */
/* static short oldvalue,newvalue,oldtime,newtime,initsw; */
/* static short initsw; *//* MI */
/* static PARAMETER   *np; *//* points to current parameter          */
/* static short        *ndips; *//* pointer in dipspec[]             */
/* static char      par_type;  *//* Identifies type of current par */
/* static short   closure_dur,temp,nasvowel; */
/* static short  nasvowel; */
 
/*
 *      Function Name: phsettar()      
 *
 *      Description: 
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void phsettar ( LPTTS_HANDLE_T phTTS)
{
	/* 
	 * MVP :The following variables are made local to phsettar,
	 * Earlier they were static at file scope 
	 */
	short tmp=0;
	short inhdr_frames = 0;
	short pholas = 0;
	short fealas = 0, feacur = 0, feanex = 0;
	short struclm2 = 0, struclas = 0, struccur = 0, strucnex = 0;
	short *ndips;      /* pointer in dipspec[]                   */
	short temp;
	short phonp2=GEN_SIL;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
//	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST   pDphsettar = pDph_t->pSTphsettar;

    // Initialize program at beginning of each clause
	PAREAL.tspesh=0;
	PAREAB.tspesh =0;
	PTONGUEBODY.tspesh=0;

	init_variables (phTTS, &inhdr_frames, &pDph_t->shrink,
					&pDph_t->shrif, &pDph_t->shrib,
					&pholas, &fealas, &feacur,
					&feanex, &struclm2, &struclas,
					&struccur, &strucnex, &ndips,&phonp2);

    // Turn off breathyness switch at end of a phrase
    // 12/10/1996 EDB
	if ((pDphsettar->phcur == GEN_SIL)/* || ((struccur & FHAT_BEGINS) IS_PLUS)*/)
	{
		pDph_t->breathysw = 0;
	}	
	/* Turn on breathyness switch during last syllable of clause */
	/* (generally restricted to female voices via spdef LX) */

#ifndef FRENCH
	if ((struccur & FSENTENDS) IS_PLUS)
	{
		pDph_t->breathysw = 1;
	}
#endif

    // printf ("ph_setar.c phsettar()\n");

    // Main loop: For each parameter, set target and transition specs
    // F1, F2, F3, FZ, B1, B2, B3, AV, AP, A2, A3, A4, A5, A6, AB, TILT
    for (pDphsettar->np = &PF1; pDphsettar->np <= &PTILT; pDphsettar->np++) {
        if (pDph_t->nphone < (pDph_t->nallotot - 2)) {
			phonp2 = pDph_t->allophons[pDph_t->nphone + 2];
        } else {
			phonp2 = GEN_SIL;
		}

        pDphsettar->par_type = partyp [pDphsettar->np - &PF1];   // formfreq, ampl, etc.

        // 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
        // Set target value associated with end time of last phone
		pDphsettar->np->tarlas = pDphsettar->np->tarend;

        // printf ("pDphsettar->np->tarlas %d\n", pDphsettar->np->tarlas);

        // 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
        // Set target value associated with onset of next phone
        // and compute any shift due to coartic with adjacent phones
        pDphsettar->np->tarnex = getbegtar (phTTS, (pDph_t->nphone + 1));  // Calls gettar()
        if (pDphsettar->np->tarnex == 4) pDphsettar->np->tarnex++;  // ???? Michel



        // 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
        // Set target value(s) associated with current phone
        // tarcur is target at phone beginning
        // tarend is target at phone ending
        // if diphthongized, also set sequence of time, value commands &
        // add special coartic such as change in [ih] due to postvoc [l]
	//	if(pDph_t->nphone == 0)
	//		 pDphsettar->np->dipcum = 0;  //BREAK POINT CODE
        pDphsettar->np->tarcur = gettar (phTTS, pDph_t->nphone);  // target or -pointer to target
        pDphsettar->np->dipcum = 0;                               // Diph time since phone begin

#ifndef FRENCH
        // no diphtong for French
        if (pDphsettar->np->tarcur < -1) {   // -pointer: diphthongized vowel
            make_dip (pDph_t, (short)(-pDphsettar->np->tarcur), inhdr_frames, pDph_t->shrink,
                      struccur, &ndips);    // Cur seg diphthongized, generate
            // several straight lines (this    
		}
        // routine also sets pDphsettar->np->tarend)
		else
#endif
		{
            pDphsettar->np->deldip = 0;               // Set dipthong increment to zero
            pDphsettar->np->durlin = pDph_t->durfon;  // and dipth dur to phone duration

            // 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
            // General coartic rule for curr sonor cons: prev. & next phones
            // modify formant freqs: 5% tarlas, 5% tarnex, 90% tarcur
            // (only effective for -diph -obst because of p_ locus[] tables)
            // Special case for /r/ and /rr/ in Spanish
			if (pDphsettar->par_type IS_FORM_FREQ)
			{
				pDphsettar->gencoartic = 0;//N10PRCNT;
	

// =================================== GERMAN ===========================================
#ifdef GERMAN   // Michel : this big ifdef should be a function
                // the " if ((struccur & FSTRESS) IS_MINUS)" is repeated in the #else
                // could be written once at the end I think
			phontemp = 0;
				/* special german coarticulation rules              */
				/* /R/-coarticulation rules before vowel                */
				if ((pDphsettar->phcur == GRP_R) && (pholas != GRP_EX) &&
					((fealas & FVOWEL) IS_PLUS))
				{
					pDphsettar->gencoartic = N20PRCNT;
					phontemp = GRP_R;

				}

				/* special rule for /@r/ suffix                
				else if ((pDphsettar->phcur == GRP_EX) && (pDphsettar->phonex == GRP_R))
				{
					if (pDphsettar->np == &PF1)
					{
						pDphsettar->np->tarcur = 520;
					}

					if (pDphsettar->np == &PF2)
					{
						pDphsettar->np->tarcur = 1300;
					}
					pDphsettar->gencoartic = 0;
					phontemp = GRP_R;
				}*/
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* no modification of /r/ after /@/             */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				else if ((pholas == GRP_EX) && (pDphsettar->phcur == GRP_R))
				{
					pDphsettar->gencoartic = 0;
					phontemp = GRP_R;
				}

#ifdef LRULES
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* special german coarticulation rules              */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				else if (pDphsettar->phcur == GRP_L)
				{
					if (((feanex & FVOWEL) IS_PLUS) &&
						((begtyp(pDphsettar->phonex) != 2) &&
						 (begtyp(pDphsettar->phonex) != 6) &&
						 !((endtyp(pholas) != 1) &&
						   (begtyp(pDphsettar->phonex) == 1))))
					{
						if (pDphsettar->np == &PF1)
						{
							pDphsettar->gencoartic = N30PRCNT;
						}
						else
						{
							pDphsettar->gencoartic = N50PRCNT;
						}
						phontemp = GRP_L;
					}
					else if ((endtyp(pholas) == 1) ||
							 ((endtyp(pholas) == 2) ||
							  (endtyp(pholas) == 6)))
					{
						if (pDphsettar->np == &PF1)
						{
							pDphsettar->gencoartic = N40PRCNT;
						}
						else
						{
							pDphsettar->gencoartic = N50PRCNT;
						}
						phontemp = GRP_R;
					}
					/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
					/* make 'L' audible in 'schwa'-'L'-'nasal' cluster           */
					/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
					else if ((pholas == GRP_EX) &&
							 ((phone_feature( pDph_t,pDphsettar->phonex) & FNASAL) IS_PLUS))
					{
						if (pDphsettar->np == &PF1)
						{
							pDphsettar->np->tarnex -= 0;
						}
						else if (pDphsettar->np == &PF2)
						{
							pDphsettar->np->tarnex += 200;
						}
						pDphsettar->gencoartic = 0;
						phontemp = GRP_L;
					}
				}
#endif //LRULES
				/* eab 4/2/7/98 f2 needs some dropping in these contexts*/
				if (pDphsettar->phcur == GRP_RR && (pDphsettar->phonex == GRP_U))
						if (pDphsettar->np == &PF2)
						{
							pDphsettar->np->tarcur -= 300;
						}
					
#ifdef RRULES
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* special coarticulation rules for uvular R (RR)           */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				else if ((pDphsettar->phcur == GRP_RR))
				{
					pDphsettar->gencoartic = N20PRCNT;
					phontemp = 0;
					if (begtyp(pDphsettar->phonex) == 1)
					{
						pDphsettar->gencoartic += N10PRCNT;
						phontemp = GRP_L;
					}
					
					if (endtyp[pDphsettar->phonex] == 1)
					{
						pDphsettar->gencoartic += N30PRCNT;
						phontemp = GRP_R;
					}

				}
#endif //RRULES
				else
				{                                          /* standard dt3 treatment */
#endif  /* #ifdef GERMAN */
				if ((struccur & FSTRESS) IS_MINUS)
				{
					/* Increased coarticulation, especially F2, if unstressed */
					pDphsettar->gencoartic = N15PRCNT;
					if (pDphsettar->np == &PF2)
					{
						pDphsettar->gencoartic = N25PRCNT;
					}
				} 
#ifdef GERMAN
				}
				/* end of else, standard dt3 treatment */
				if (pDphsettar->np->tarnex <= 0)
				{
					pDph_t->arg1 = pDphsettar->np->tarlas - pDphsettar->np->tarcur;
				}
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* german R-coarticulation only with previous phonemes      */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				else if (phontemp == GRP_R)
				{
					pDph_t->arg1 = pDphsettar->np->tarlas - pDphsettar->np->tarcur;
				}

#ifdef LRULES
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* most german L-coarticulation only with next phonemes     */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				else if (phontemp == GRP_L)
				{
					pDph_t->arg1 = pDphsettar->np->tarnex - pDphsettar->np->tarcur;
				}
#endif // LRULES
				else
				{
#endif /* #ifdef GERMAN */                              
				pDph_t->arg1 = ((pDphsettar->np->tarlas + pDphsettar->np->tarnex) >> 1) - pDphsettar->np->tarcur;
#ifdef GERMAN
				}
#endif //GERMAN

				//if (pDphsettar->np == &PF2)
			//	{
			//	printf( "las %d nex %d cur %d \n",pDphsettar->np->tarlas,pDphsettar->np->tarnex,
			//		pDphsettar->np->tarcur);
			//	}
  
				pDph_t->arg2 = pDphsettar->gencoartic;
				pDphsettar->np->tarcur += mlsh1 (pDph_t->arg1, pDph_t->arg2);
			}
			pDphsettar->np->tarend = pDphsettar->np->tarcur;        /* Tar at end of cur phone */
		}
		/* end of 'else' begun in rule 3 */

		/* 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 */
		/* Compute (approx.) general coartic of tarnex with tarend         */
		/* THIS IS BAD, FIX IT IF POSSIBLE                                 */
		/* 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 */
		if (pDphsettar->par_type IS_FORM_FREQ)
		{
			pDph_t->arg2 = N10PRCNT;

#ifdef GERMAN  // should be a function for GERMAN Michel
			phontemp = 0;
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* special german coarticulation rules             */
			/* /R/-coarticulation rules after vowel                */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			if ((pDphsettar->phonex == GRP_R) && (pDphsettar->phcur != GRP_EX) &&
				((feacur & FVOWEL) IS_PLUS))
			{
				pDph_t->arg2 = N20PRCNT;
				phontemp = GRP_R;

			}
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* special rule for '@r' suffix                    */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			else if ((pDphsettar->phcur == GRP_EX) && (pDphsettar->phonex == GRP_R))
			{
				pDph_t->arg2 = 0;
				phontemp = GRP_R;

			}

#ifdef LRULES
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* special german coarticulation rules, if next phoneme is 'L' */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			else if (pDphsettar->phonex == GRP_L)
			{
				if (((phone_feature( pDph_t,phonp2) & FVOWEL) IS_PLUS) &&
					((begtyp(phonp2) != 2) &&
					 (begtyp(phonp2) != 6) &&
					 !((endtyp(pDphsettar->phcur) != 1) &&
					   (begtyp(phonp2) == 1))))
				{
					if (pDphsettar->np == &PF1)
					{
						pDph_t->arg2 = N30PRCNT;
					}
					else
					{
						pDph_t->arg2 = N50PRCNT;
					}
					phontemp = GRP_L;
				}
				else if ((endtyp(pDphsettar->phcur) == 1) ||
						 ((endtyp(pDphsettar->phcur) == 2) ||
						  (endtyp(pDphsettar->phcur) == 6)))
				{
					if (pDphsettar->np == &PF1)
					{
						pDph_t->arg2 = N20PRCNT;        /* n40prcnt, eab 5/95  */
					}
					else
					{
						pDph_t->arg2 = N20PRCNT;        /* n50prcnt, eab 5/95 */
					}
					phontemp = GRP_R;
				}
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* make 'L' audible in 'schwa'-'L'-'nasal' cluster          */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				else if ((pDphsettar->phcur == GRP_EX) &&
						 ((phone_feature( pDph_t,phonp2) & FNASAL) IS_PLUS))
				{
					if (pDphsettar->np == &PF1)
					{
						pDphsettar->np->tarnex -= 0;
					}
					else if (pDphsettar->np == &PF2)
					{
						pDphsettar->np->tarnex += 200;
					}
					pDph_t->arg2 = 0;
					phontemp = GRP_L;
				}
			}
#endif //LRULES

#ifdef RRULES
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* special coarticulation rules for uvular R (RR)          */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			else if ((pDphsettar->phonex == GRP_RR))
			{
				pDph_t->arg2 = N20PRCNT;
				phontemp = 0;
				if (begtyp(phonp2) == 1)
				{
					pDph_t->arg2 += N10PRCNT;
					phontemp = GRP_L;
				}
				if (endtyp(phonp2) == 1)
				{
					pDph_t->arg2 += N30PRCNT;
					phontemp = GRP_R;
				}
			}
#endif //RRULES
			else
			{                                                  /* standard dt3 treatment */
				if ((struccur & FSTRESS) IS_MINUS)
				{
					/* Increased coarticulation, especially F2, if unstressed */
					pDph_t->arg2 = N15PRCNT;
					if (pDphsettar->np == &PF2)
					{
						pDph_t->arg2 = N25PRCNT;
					}
				}
			}

			/* end of else, standard dt3 treatment */
			if (pDphsettar->np->tarnex <= 0)
			{
				pDph_t->arg1 = pDphsettar->np->tarend;
			}

#ifdef LRULES
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* some german L-coarticulation rules with second next phonemes    */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			else if (phontemp == GRP_L)
			{
				pDph_t->arg1 = pDphsettar->np->tarend - getbegtar (phTTS,pDph_t->nphone + 2);
				/* Calls gettar() */
			}
#endif //LRULES
			else
			{
#endif /* #ifdef GERMAN */
				pDph_t->arg1 = pDphsettar->np->tarend - pDphsettar->np->tarnex;
#ifdef GERMAN
		}
#endif //GERMAN
			pDphsettar->np->tarnex += mlsh1 (pDph_t->arg1, pDph_t->arg2);
		}
//		WINprintf("pholas=%d  pDphsettar->phcur=%d  pDphsettar->phonex=%d \n",
//	  pholas, pDphsettar->phcur, pDphsettar->phonex); 
		

		/* 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 */
		/* Smooth forward from beginning of current phone            */
		/* Default bouval is halfway, half of transition duration is 30 ms */
		/* 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 */

		pDphsettar->bouval = (pDphsettar->np->tarlas + pDphsettar->np->tarcur) >> 1;
		pDphsettar->durtran = NF30MS;

		/* 
		 * printf("pDph_t->shrif %d, pholas %d, fealas %d, feacur %d, struclas %d, struccur %d, 
		 * feanex %d\n",pDph_t->shrif, pholas,fealas, feacur, struclas, struccur,feanex);
		 */

		tmp = (pDphsettar->phcur & PFONT);
		
			
		if(tmp == PFUSA<<PSFONT)
		{
			us_forw_smooth_rules (phTTS, pDph_t->shrif, pholas,
						   fealas, feacur, struclas, struccur,feanex);
			
		}
		else if(tmp == PFUK<<PSFONT)
		{
			uk_forw_smooth_rules (phTTS, pDph_t->shrif, pholas,
						   fealas, feacur, struclas, struccur,feanex);
		}
		else if(tmp == PFGR<<PSFONT)
		{
			gr_forw_smooth_rules (phTTS, pDph_t->shrif, pholas,
						   fealas, feacur, struclas, struccur,feanex); 
		}
		else if(tmp == PFLA<<PSFONT)
		{
			la_forw_smooth_rules (phTTS, pDph_t->shrif, pholas,
						   fealas, feacur, struclas, struccur,feanex);
		}
		else if(tmp == PFSP<<PSFONT)
		{
			sp_forw_smooth_rules (phTTS, pDph_t->shrif, pholas,
						   fealas, feacur, struclas, struccur,feanex);
		}
				else if(tmp == PFIT<<PSFONT)
		{
			it_forw_smooth_rules (phTTS, pDph_t->shrif, pholas,
						   fealas, feacur, struclas, struccur,feanex);
		}
		else if(tmp == PFFR<<PSFONT)
		{
			fr_forw_smooth_rules (phTTS, pDph_t->shrif, pholas,
						   fealas, feacur, struclas, struccur,feanex);
		}
		else 
		{
#ifdef PH_DEBUG
		printf("OH MY GOD! You gave me ecoli, you dirty rat!\n");
#endif
		us_forw_smooth_rules (phTTS, pDph_t->shrif, pholas,
						   fealas, feacur, struclas, struccur,feanex);
		}

		/* Convert bouval and pDphsettar->durtran into params used directly by phdraw() */
		pDphsettar->np->ftran = 0;
#ifdef FRENCH
		pDphsettar->np->dftran = 0;
#endif
		if (pDphsettar->durtran > 0)
		{
			/* Incremental change per frame                        */
			/* (shift left 3 bits to avoid roundoff accumulation)  */
			pDphsettar->np->ftran = (pDphsettar->bouval - pDphsettar->np->tarcur) << 3;
			if (pDphsettar->np->ftran != 0)
			{
				pDph_t->arg1 = pDphsettar->np->ftran;
				pDph_t->arg2 = divtab[pDphsettar->durtran];
				pDphsettar->np->dftran = mlsh1 (pDph_t->arg1, pDph_t->arg2);
				pDphsettar->np->ftran = pDphsettar->np->dftran * pDphsettar->durtran;
			}

#if 0
			if (pDphsettar->np == &PF2 )
			{
        		printf ("ph_setar.c phsettar() tarlas %d phcur %d (%x) phprint (pDphsettar->phcur) %s\n",
            	pDphsettar->np->tarlas,pDphsettar->phcur, pDphsettar->phcur, phprint (pDphsettar->phcur));
        		printf ("  pDphsettar->bouval %d, pDphsettar->np->tarcur %d, pDphsettar->durtran %d\n",
                pDphsettar->bouval, pDphsettar->np->tarcur, pDphsettar->durtran);
        		printf ("pDphsettar->np->ftran %d \n", pDphsettar->np->ftran>>3);
			}
#endif
		}
		//debugforward (" Unknown rule must have been executed", pDphsettar->np);

		/* Slowish vowel-vowel formant motions across consonant modeled by   */
		/* a separate transition increment and duration, so far only for F2 */
		/* (vvbouval and vvdurtran set in routine forw_smooth_rules() which */
		/* calls setloc() which calls vv_coartic_across_c())                  */
    if (pDphsettar->np == &PF2)
    {
#if 0 // for FRENCH
        printf ("ph_setar.c  phsettar() PF2  bouval %d, durtran %d, tarcur %d\n", 
                 pDphsettar->bouval, pDphsettar->durtran, pDphsettar->np->tarcur);
#endif

			pDph_t->fvvtran = 0;
			pDph_t->dfvvtran = 0;
            // Truncate tran dur if exceeds duration of current phone
            if (pDphsettar->vvdurtran > pDph_t->durfon) {
				pDphsettar->vvdurtran = pDph_t->durfon;
			}
            if ((pDphsettar->vvdurtran > 0) && (pDphsettar->vvbouval != 0)) {
                // Shift left 3 bits to avoid roundoff accumulation
				pDph_t->arg1 = pDphsettar->vvbouval << 3;
				pDph_t->arg2 = divtab[pDphsettar->vvdurtran];
				pDph_t->dfvvtran = mlsh1 (pDph_t->arg1, pDph_t->arg2);  /* pDphsettar->vvbouval*8 / pDphsettar->vvdurtran */
				pDph_t->fvvtran = pDph_t->dfvvtran * pDphsettar->vvdurtran;
			}
			pDphsettar->vvdurtran = 0;
			pDphsettar->vvbouval = 0;
		}


        // 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8
        // Smooth backward from end of current phone
        // Default bouval is halfway, half of transition duration is 30 ms
		pDphsettar->bouval = (pDphsettar->np->tarend + pDphsettar->np->tarnex) >> 1;
		pDphsettar->durtran = NF25MS;

		/* 
		 * printf("pDph_t->shrib %d, pDphsettar->phcur %d feacur %d, feanex %d, 
		 * strucnex %d\n",pDph_t->shrib, pDphsettar->phcur, feacur, feanex, strucnex); 
		 */
		/* This routine contains all the "smarts" */

		if(tmp == PFUSA<<PSFONT)
		{
			us_back_smooth_rules (phTTS, pDph_t->shrib, feacur, 
				feanex, strucnex);
		}
		else if(tmp == PFUK<<PSFONT)
		{
			uk_back_smooth_rules (phTTS, pDph_t->shrib, feacur, 
				feanex, strucnex);
		}
		else if(tmp == PFGR<<PSFONT)
		{
			gr_back_smooth_rules (phTTS, pDph_t->shrib, feacur, 
				feanex, strucnex);
		}
		else if(tmp == PFLA<<PSFONT)
		{
			la_back_smooth_rules (phTTS, pDph_t->shrib, feacur, 
				feanex, strucnex);
		}
		else if(tmp == PFSP<<PSFONT)
		{
			sp_back_smooth_rules (phTTS, pDph_t->shrib, feacur, 
				feanex, strucnex);
		}
		else if(tmp == PFIT<<PSFONT)
		{
			it_back_smooth_rules (phTTS, pDph_t->shrib, feacur, 
				feanex, strucnex);
		}
		else if(tmp == PFFR<<PSFONT)
		{
			fr_back_smooth_rules (phTTS, pDph_t->shrib, feacur, 
				feanex, strucnex);
		}
		else 
		{
#ifdef PH_DEBUG
			printf("OH MY GOD!! You got the West Nile Virus!\n");
#endif
			us_back_smooth_rules (phTTS, pDph_t->shrib, feacur, 
				feanex, strucnex);
		}
		


		 /*
		  printf("backward durtran %d tarend %d tarlas %d bouval %d tbacktr %d\n",
		  pDphsettar->durtran, 
		  pDphsettar->np->tarend,pDphsettar->np->tarlas,pDphsettar->bouval, 
		  pDphsettar->np->tbacktr);
		 */

		/* Convert bouval and pDphsettar->durtran into params used directly by phdraw() */
		pDphsettar->np->btran = 0;
		pDphsettar->np->dbtran = 0;
		if (pDphsettar->durtran > 0)
		{
			/* Shift left 3 bits to avoid roundoff accumulation */
			temp = (pDphsettar->bouval - pDphsettar->np->tarend) << 3;
			if (temp != 0)
			{
				pDph_t->arg1 = temp;
				pDph_t->arg2 = divtab[pDphsettar->durtran];
				pDphsettar->np->dbtran = mlsh1 (pDph_t->arg1, pDph_t->arg2);
			}
		}
		//debugbackward (" Unknown rule must have been executed", pDphsettar->np);

		/* Slowish vowel-vowel formant motions across consonant modeled by   */
		/* a separate transition increment and duration, so far only for F2 */
		/* (vvbouval and pDphsettar->vvdurtran set in routine back_smooth_rules() which */
		/* calls setloc() which calls vv_coartic_across_c())                  */
		if (pDphsettar->np == &PF2)
		{
			pDph_t->bvvtran = 0;       /* Default if no vv-coartic */
			pDph_t->dbvvtran = 0;      /* Default if no vv-coartic */
			pDph_t->tvvbacktr = pDph_t->durfon;             /* Default if no vv-coartic */
			/* Truncate tran dur if exceeds duration of current phone */
			if (pDphsettar->vvdurtran > pDph_t->durfon)
			{
				pDphsettar->vvdurtran = pDph_t->durfon;
			}

			if ((pDphsettar->vvdurtran > 0) && (pDphsettar->vvbouval != 0))
			{
				pDph_t->tvvbacktr = pDph_t->durfon - pDphsettar->vvdurtran;
				/* Shift left 3 bits to avoid roundoff accumulation */
				pDph_t->arg1 = pDphsettar->vvbouval << 3;
				pDph_t->arg2 = divtab[pDphsettar->vvdurtran];
				pDph_t->dbvvtran = mlsh1 (pDph_t->arg1, pDph_t->arg2);  /* vvbouval*8 / pDphsettar->vvdurtran */
			}
			pDphsettar->vvdurtran = 0;
			pDphsettar->vvbouval = 0;
		}
		
	}
	/* 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 */
	/* Special rules that override values computed in regular way.          */
	/* From the beginning of the current phone to a time "tspesh",          */
	/* place the constant value "pspesh" in the given parameter track.      */
	/* (Used to generate bursts, aspiration for [ptk], voicebar for [bdg]) */
	/* 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 */

		if(tmp == PFUSA<<PSFONT)
		{
			us_special_rules (phTTS, fealas, feacur, feanex, struclm2,
				struccur, pholas, struclas);
		}
		else if(tmp == PFUK<<PSFONT)
		{
			uk_special_rules (phTTS, fealas, feacur, feanex, struclm2,
				struccur, pholas, struclas);
		}
		else if(tmp == PFGR<<PSFONT)
		{
			gr_special_rules (phTTS, fealas, feacur, feanex, struclm2,
				struccur, pholas, struclas);
		}
		else if(tmp == PFLA<<PSFONT)
		{
			la_special_rules (phTTS, fealas, feacur, feanex, struclm2,
				struccur, pholas, struclas);
		}
		else if(tmp == PFSP<<PSFONT)
		{
			sp_special_rules (phTTS, fealas, feacur, feanex, struclm2,
				struccur, pholas, struclas);
		}
		else if(tmp == PFIT<<PSFONT)
		{
			it_special_rules (phTTS, fealas, feacur, feanex, struclm2,
				struccur, pholas, struclas);
		}
		else if(tmp == PFFR<<PSFONT)
		{
			fr_special_rules (phTTS, fealas, feacur, feanex, struclm2,
				struccur, pholas, struclas);
		}
		else 
		{
#ifdef PH_DEBUG
			printf("OH MY GOD! You tasmanian devil you, forgetting my specail rules!\n");
#endif
			us_special_rules (phTTS, fealas, feacur, feanex, struclm2,
				struccur, pholas, struclas);
		}

#ifdef DEBGFRENCH // for FRENCH
     print_parameters (phTTS, pDphsettar->phcur);
#endif
} // phsettar


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* A.                 G E T B E G T A R                             */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Get target value at beginning of phone, compute all coarticulatory */
/* influences of adjacent phones                                     */

short getbegtar ( LPTTS_HANDLE_T phTTS, int nfone)
{
	short                   temp, tmp;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
//	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	temp = gettar (phTTS, nfone);

		
	if (temp < -1)
	{          
		/* If next seg diphthong, */
		temp = pDph_t->p_diph[-temp];  /* use diph first value  */
		/* Special coarticulation rules to change (vowel) target */
		if (pDphsettar->par_type IS_FORM_FREQ)
		{
			//old code replace by below temp += special_coartic (pDph_t, nfone, 0);
			tmp = get_phone(pDph_t,nfone);
			tmp = nfone & PFONT;
			if(tmp == PFUSA<<PSFONT)
			{
				temp += us_special_coartic (pDph_t,(short)nfone, 0);
			}
			else if(tmp == PFGR<<PSFONT)
			{	
				temp += gr_special_coartic (pDph_t, (short)nfone, 0);
			}
			else if(tmp == PFLA<<PSFONT)
			{
				temp += la_special_coartic (pDph_t, (short)nfone, 0);
			}
			else if(tmp == PFSP<<PSFONT)
			{
				temp += sp_special_coartic (pDph_t, (short)nfone, 0);
			}
			else if(tmp == PFFR<<PSFONT)
			{
				//temp += fr_special_coartic (pDph_t, nfone, 0);
			//when we have french change to fr_
			}
		}
	}
	return (temp);
}


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* B.                 G E T E N D T A R                             */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: getendtar      
 *
 *      Description: Get target value at end of phone, compute all coarticulatory 
 *              influences of adjacent phones  
 *
 *      Arguments: PDPH_T pDph_t, short nfone
 *
 *      Return Value: short
 *
 *      Comments:
 *
 */

short getendtar (LPTTS_HANDLE_T phTTS, int nfone)
{
	short                   temp, tmp;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
//	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	temp = gettar (phTTS, nfone);
	if (temp < -1)
	{
		temp = -temp;                              /* Vowel tar is diphth */

		while (pDph_t->p_diph[temp] != -1)
		{
			temp++;
		}
		temp = pDph_t->p_diph[temp - 1];        /* Last val of diph */
		/* Special coarticulation rules to change (vowel) target */
		if (pDphsettar->par_type IS_FORM_FREQ)
		{
			//temp1 = special_coartic (pDph_t, nfone, 1);
			tmp = get_phone(pDph_t,nfone);
			tmp = tmp & PFONT;
			if(tmp == PFUSA<<PSFONT)
			{
				temp += us_special_coartic (pDph_t, (short)nfone, 0);
			}
			else if(tmp == PFGR<<PSFONT)
			{	
				temp += gr_special_coartic (pDph_t, (short)nfone, 0);
			}
			else if(tmp == PFLA<<PSFONT)
			{
				temp += la_special_coartic (pDph_t, (short)nfone, 0);
			}
			else if(tmp == PFSP<<PSFONT)
			{
				temp += sp_special_coartic (pDph_t, (short)nfone, 0);
			}
			else if(tmp == PFFR<<PSFONT)
			{
				//temp += fr_special_coartic (pDph_t, nfone, 0);
			//when we have french change to fr_
			}
		}
	}
	return (temp);
}


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* D.                      M A K E - D I P                          */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: make_dip()      
 *
 *      Description: 
 *
 *      Arguments:      PDPH_T pDph_t,
 *                                      short pdip,                                Pointer to diphthongization info 
 *                                      short inhdr_frames,
 *                                      short shrink,
 *                                      short struccur, short **ppsNdips
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static void make_dip (PDPH_T pDph_t,
		  short pdip,                              /* Pointer to diphthongization info */
		  short inhdr_frames,
		  short shrink,
		  short struccur, short **ppsNdips)
{
	short                   temp, dip_pos,tmp;

	/* MVP :List of variables made local                      */
	short                   dipsw;
	short                   oldvalue, newvalue, oldtime, newtime;

	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	pDphsettar->np->ndip = *ppsNdips;  /* Start of diph info for this par in dipspec[] */

	oldvalue = pDph_t->p_diph[pdip];   /* cccc Initial value of first straight line */

	/* Formant frequency coarticulation rules */
	if (pDphsettar->par_type IS_FORM_FREQ)
	{
		/* General rule: prev. phone changes init. vowel tar toward phlas */
		pDphsettar->gencoartic = N10PRCNT;
		if ((struccur & FSTRESS) IS_MINUS)
		{
			/* Increased coarticulation, especially F2, if unstressed */
			   pDphsettar->gencoartic = N15PRCNT; 
			   if (pDphsettar->np == &PF2)
			   { pDphsettar->gencoartic = N25PRCNT; }
		}
		pDph_t->arg1 = pDphsettar->np->tarlas - oldvalue;
		pDph_t->arg2 = pDphsettar->gencoartic;
		oldvalue += mlsh1 (pDph_t->arg1, pDph_t->arg2);
		/* Special rule: (see subroutine) */
		dip_pos = 0;
		//oldvalue += special_coartic (pDph_t, pDph_t->nphone, dip_pos);
			tmp =  get_phone(pDph_t, pDph_t->nphone);
			tmp = tmp & PFONT;
			if(tmp == PFUSA<<PSFONT)
			{ 
				oldvalue += us_special_coartic (pDph_t, pDph_t->nphone, 0);
			}
			else if(tmp == PFGR<<PSFONT)
			{	
				oldvalue += gr_special_coartic (pDph_t, pDph_t->nphone, 0);
			}
			else if(tmp == PFLA<<PSFONT)
			{
				oldvalue += la_special_coartic (pDph_t, pDph_t->nphone, 0);
			}
			else if(tmp == PFSP<<PSFONT)
			{
				oldvalue += sp_special_coartic (pDph_t, pDph_t->nphone, 0);
			}
			else if(tmp == PFFR<<PSFONT)
			{
				//oldvalue += fr_special_coartic (pDph_t, pDph_t->nphone, 0);
			//when we have frecnh change to fr_
			}
			
		
		
#ifdef DEBUG_targetS
		printf (
				   " tarbeg=%4d  (from 10%% tarlas=%4d, 90%% tarbeg=%d)\n",
				   oldvalue, pDphsettar->np->tarlas, pDph_t->p_diph[pdip]);
#endif
	}
	pDphsettar->np->tarcur = oldvalue;

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
			newvalue = pDph_t->p_diph[pdip++];

			/* Formant frequency coarticulation rules */
			if (pDphsettar->par_type IS_FORM_FREQ)
			{
				/* General rule: next phone changes vowel tar toward phnex */
				if (pDphsettar->np->tarnex > 0)
				{
					pDph_t->arg1 = pDphsettar->np->tarnex - newvalue;
					pDph_t->arg2 = pDphsettar->gencoartic;
					newvalue += mlsh1 (pDph_t->arg1, pDph_t->arg2);
				}
				/* Special rule: (see subroutine) */
				//newvalue += special_coartic (pDph_t, pDph_t->nphone, ++dip_pos);
				tmp = pDph_t->nphone & PFONT;
			if(tmp == PFUSA<<PSFONT)
			{
				newvalue += us_special_coartic (pDph_t, pDph_t->nphone, 0);
			}
			else if(tmp == PFGR<<PSFONT)
			{	
				newvalue += gr_special_coartic (pDph_t, pDph_t->nphone, 0);
			}
			else if(tmp == PFLA<<PSFONT)
			{
				newvalue += la_special_coartic (pDph_t, pDph_t->nphone, 0);
			}
			else if(tmp == PFSP<<PSFONT)
			{
				newvalue += sp_special_coartic (pDph_t, pDph_t->nphone, 0);
			}
			else if(tmp == PFFR<<PSFONT)
			{
				//fr_special_coartic (pDph_t, pDph_t->nphone, 0);
			//when we have frecnh change to fr_
			}
			
		
			}
		}
#ifdef ENGLISH
		if (NSAMP_FRAME == 128)
			newtime = pDph_t->p_diph[pdip] >> 1;    /* eab ccc for 1/2 samp */
		else
#endif
#ifdef FRENCH 
		if (NSAMP_FRAME == 128)
			newtime = pDph_t->p_diph[pdip] >> 1;    /* eab ccc for 1/2 samp */
		else
#endif
			newtime = pDph_t->p_diph[pdip];
		if (newtime != -1)
		{
			/* Adjust newtime as f(shrink), i.e. make tran dur semi-invariant */
			newtime = shrdur (pDph_t, newtime, inhdr_frames, shrink);
		}
		else
		{
			/* Desired time is end of segment */
			newtime = pDph_t->durfon;
		}
		*(*ppsNdips)++ = newtime;

		/* Compute increment/frame during transition */
		temp = newtime - oldtime;
		if (temp == 0)
		{
			*(*ppsNdips) = 0;
		}
		else
		{
			/* No divide if possible (for speed) */
			pDph_t->arg2 = (newvalue - oldvalue) << 3;
			if (temp < 50)
			{
				pDph_t->arg1 = divtab[temp];
				*(*ppsNdips) = mlsh1 (pDph_t->arg1, pDph_t->arg2);
			}
			else
			{
				*(*ppsNdips) = pDph_t->arg2 / temp;
			}
			oldvalue = newvalue;
			oldtime = newtime;
		}
		(*ppsNdips)++;

	}
	while (pDph_t->p_diph[pdip++] != -1);

	/* Set final value of diph tran, first increment and duration in frames */
	pDphsettar->np->tarend = newvalue; /* Code more transparent: use getendtar() */
	pDphsettar->np->durlin = *pDphsettar->np->ndip++;
	pDphsettar->np->deldip = *pDphsettar->np->ndip++;
}
/* GL 4/15/1998, BATS#492 convert get_phone() to macro, move it to ph_defs.h */
#if 0
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* G E T - P H O N E                                                                             */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: get_phone()      
 *
 *      Description: 
 *
 *      Arguments: PDPH_T pDph_t, short pointer
 *
 *      Return Value: short 
 *
 *      Comments:
 *
 */
static short get_phone (PDPH_T pDph_t, short pointer)
{
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	if ((pointer >= 0) && (pointer < pDph_t->nallotot))
	{
#ifdef     DEBUG_targetS
		printf ("getp phone=%d \n", pDph_t->allophons[pointer]);
#endif
		return (pDph_t->allophons[pointer]);

	}
	else
	{
		return (GEN_SIL);
	}
}
#endif

#ifdef NEEDSMALLERSIZEBATS681
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* D E B U G - F O W A R D                                                               */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: debugforward()      
 *
 *      Description: 
 *
 *      Arguments:  char message, 
 *                                      PARAMETER       nparameter
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

void debugforward (char *message, PARAMETER *nparameter)
{

#ifdef DEBUG_targetS
	short                   temp1;
	static PARAMETER       *nparlast;
	static short            savbvf, savtcf;

	temp1 = (durtran * NSAMP_FRAME) / 10;
	if (nparameter != nparlast)
	{
		printf ("bvbeg=%4d tcforw=%3d %s  \n",
				pDphsettar->bouval, temp1, message);
	}
	else
	{
		if ((pDphsettar->bouval != savbvf) || (temp1 != savtcf))
		{
			printf ("          %4d        %3d    %s.\n",
					pDphsettar->bouval, temp1, message);
		}
	}
	nparlast = nparameter;
	savbvf = pDphsettar->bouval;
	savtcf = temp1;
#endif
}
#endif

#ifdef NEEDSMALLERSIZEBATS681
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* D E B U G - B A C K W A R D                      */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: debugbackward()      
 *
 *      Description: 
 *
 *      Arguments: char message, PARAMETER nparameter 
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

void debugbackward (char *message, PARAMETER *nparameter)
{

#ifdef DEBUG_targetS
	short                   temp1;
	static PARAMETER       *nparlast;
	static short            savbvb, savtcb;

	temp1 = (durtran * NSAMP_FRAME) / 10;
	if (nparameter != nparlast)
	{
		printf ("bvend=%4d tcback=%3d  %s \n",
				pDphsettar->bouval, temp1, message);
	}
	else
	{
		if ((pDphsettar->bouval != savbvb) || (temp1 != savtcb))
		{
			printf ("          %4d        %3d    %s.\n",
					pDphsettar->bouval, temp1, message);
		}
	}
	nparlast = nparameter;
	savbvb = pDphsettar->bouval;
	savtcb = temp1;
#endif
}
#endif

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* I N I T _ V A R I A B L E S                      */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

 
/*
 *      Function Name: init_variables()      
 *
 *      Description: Initialize program at beginning of each clause 
 *
 *      Arguments:      PDPH_T pDph_t, short *psInhdr_frames, short *psShrink,
 *                                      short *psShrif, short *psShrib,
 *                                      short *psPholas, short *psFealas, short *psFeacur,
 *                                      short *psFeanex, short *psStruclm2, short *psStruclas,
 *                                      short *psStruccur, short *psStrucnex, short **ppsNdips,
 *                                      short *psPhonp2
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static void init_variables (LPTTS_HANDLE_T phTTS, short *psInhdr_frames, short *psShrink,
				short *psShrif, short *psShrib,
				short *psPholas, short *psFealas, short *psFeacur,
				short *psFeanex, short *psStruclm2, short *psStruclas,
				short *psStruccur, short *psStrucnex, short **ppsNdips,
				short *psPhonp2)
{

	PDPH_T                  pDph_t = phTTS->pPHThreadData;
//	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	extern int inh_timing(LPTTS_HANDLE_T phTTS, int phone);

	if (pDph_t->nphone == 0)//FIrst position
	{
		*psStruclm2 = 0;
		*psPholas = GEN_SIL;
		if (pDphsettar->initsw == 0)
		{
			pDphsettar->initsw++;
			for (pDphsettar->np = &PF1; pDphsettar->np <= &PTILT; pDphsettar->np++)
			{
				//eab Note was the value 0 is ambiguos,  is really the first
				//phone position which is pDph_t->nphone which should be zero by definition
				pDphsettar->np->tarend = getbegtar (phTTS, 0);
			}
		}
    } else {
        if (pDph_t->nphone > 1) *psStruclm2 = pDph_t->allofeats[pDph_t->nphone - 2];
		*psPholas = pDphsettar->phcur;
		*psStruclas = pDph_t->allofeats[pDph_t->nphone - 1];
	}
	/* Begin normal initialization of variables for new phoneme */

    // Begin normal initialization of variables for new phoneme
	pDphsettar->phcur = pDph_t->allophons[pDph_t->nphone] ;
	*psStruccur = pDph_t->allofeats[pDph_t->nphone];

    if (pDph_t->nphone < (pDph_t->nallotot - 2)) {
		pDphsettar->phonex = pDph_t->allophons[pDph_t->nphone + 1];
		*psStrucnex = pDph_t->allofeats[pDph_t->nphone + 1];
    } else {
		pDphsettar->phonex = GEN_SIL;
		*psStrucnex = 0;
	}

#ifdef NOT_USED_BUT_REVIEWSTRIPPEDCODE
	/* MVP:The below if..else is invalid as the value of phonp2 is never used */
	/* Hence, the code is commented out(#ifdef IF_ED_OUT_CODE ) */
   /* back in, phonp2 is used in german */
   if (pDph_t->nphone < (pDph_t->nallotot - 2))
   {
      *psPhonp2 = pDph_t->allophons[pDph_t->nphone + 2];
   }
   else
   {
      *psPhonp2 = GEN_SIL;
   }
#endif

	*ppsNdips = &(pDph_t->dipspec[1]); /* Initialize pointer to diph info for phone */

    // Precompute often-used variables
	*psFealas = phone_feature( pDph_t,*psPholas);
	*psFeacur = phone_feature( pDph_t,pDphsettar->phcur);
	*psFeanex = phone_feature( pDph_t,pDphsettar->phonex);

	*psInhdr_frames = mstofr (inh_timing(phTTS, pDphsettar->phcur));
		//mstofr (inhdr[pDphsettar->phcur]);    /* Inherent dur in frames */

    // Transition durs are shorter if phone dur is short rel to inherent dur
    // Compute change in duration rel. to inherent dur if a sonorant
#ifndef FRENCH
	if (((*psFeacur & FOBST) IS_MINUS) && (pDphsettar->phcur != GEN_SIL))
#endif
#ifdef FRENCH
    if ( !(*psFeacur & FPLOSV) && !(*psFeacur & TFricative) && pDphsettar->phcur != GEN_SIL )
#endif
	{
        // Shrink,shrif,shrib only apply to sonorants
		if (pDph_t->durfon < (*psInhdr_frames << 1))
		{                                                          /* durfon can't exceed 2*inhd */
			//pDph_t->arg1 = FRAC_ONE;
			//pDph_t->arg2 = pDph_t->durfon;
			//pDph_t->arg3 = *psInhdr_frames;
			*psShrink = muldv (FRAC_ONE, pDph_t->durfon, (*psInhdr_frames));   /* = FRAC_ONE, i.e. 16384 if no */
		}
		else
		{
			*psShrink = FRAC_ONE + (FRAC_ONE - 1);  /* IS THIS AN ERROR ??? */
		}
		/* Shrinkage factor for formant transitions inside sonorants */
		*psShrif = (*psShrink >> 1) + FRAC_HALF;
		/* Ditto for backward transition, which is slightly (15%) faster */
		*psShrib = *psShrif - 1600;
	}
	PAV.tspesh = 0;                                    /* Default case: set 'end time' of special  */
	PAP.tspesh = 0;                                    /* constant override of computed parameter */
	PF1.tspesh = 0;
	PB1.tspesh = 0;                                    /* value to zero, i.e. no special override */
	PB2.tspesh = 0;                                    /* for this phone.                          */
	PB3.tspesh = 0;
	PA2.tspesh = 0;
	PA3.tspesh = 0;                                    /* If rules below set to non-zero, substitute */
	PA4.tspesh = 0;                                    /* pspesh for computed value over time       */
 	PA5.tspesh = 0;                                    /* interval from beginning of phone (done   */
	PA6.tspesh = 0;                                    /* in PH_DRAW.C                      */
	PAB.tspesh = 0;
	PTILT.tspesh = 0;

}  // init_variables


	
int gettar (LPTTS_HANDLE_T phTTS, int phone) {
    PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
	int tmp, count=0;
	short npar;
	int index[4]={0,1,2,-1};
	int tartemp=0;
	while(count <= 3)
	{
		if(index[count] == 2 && pDph_t->nallotot >= (phone+index[count]+1))
			count++;
		
		tmp =  get_phone(pDph_t, (phone+index[count]));
		tmp = tmp & PFONT;
	
		//EAB compare to see if we've changed data source
		if( tmp != pDph_t->last_lang)
		{
				
				pDph_t->last_lang = tmp;
				if(tmp == (PFUSA<<PSFONT))
				{
					if(pDph_t->malfem == MALE)
					{	// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)us_maleloc;	   			/* Use MALE tables */
						pDph_t->p_diph = (short *)us_maldip;
						pDph_t->p_tar = (short *)us_maltar;
//						pDph_t->p_amp = (short *)us_malamp;
					}
					else
					{	// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)us_femloc;	   			/* Use FEMALE tables */
						pDph_t->p_diph = (short *)us_femdip;
						pDph_t->p_tar = (short *)us_femtar;
//						pDph_t->p_amp = (short *)us_malamp;
					}

					
				}
				else if(tmp == (PFUK<<PSFONT))
				{
					if(pDph_t->malfem == MALE)
					{	// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)uk_maleloc;	   			/* Use MALE tables */
						pDph_t->p_diph = (short *)uk_maldip;
						pDph_t->p_tar = (short *)uk_maltar;
//						pDph_t->p_amp = (short *)uk_malamp;
					}
					else
					{	// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)uk_femloc;	   			/* Use FEMALE tables */
						pDph_t->p_diph = (short *)uk_femdip;
						pDph_t->p_tar = (short *)uk_femtar;
//						pDph_t->p_amp = (short *)uk_malamp;
					}

				}
				else if(tmp == PFGR<<PSFONT)
				{
					if(pDph_t->malfem == MALE)
					{	// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)gr_maleloc;	   			/* Use MALE tables */
						pDph_t->p_diph = (short *)gr_maldip;
						pDph_t->p_tar = (short *)gr_maltar;
//						pDph_t->p_amp = (short *)gr_malamp;
					}
					else
					{	// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)gr_femloc;	   			/* Use FEMALE tables */
						pDph_t->p_diph = (short *)gr_femdip;
						pDph_t->p_tar = (short *)gr_femtar;
//						pDph_t->p_amp = (short *)gr_malamp;
					}

				}
				else if(tmp == PFLA<<PSFONT)
				{
					if(pDph_t->malfem == MALE)
					{	// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)la_maleloc;	   			/* Use MALE tables */
						pDph_t->p_diph = (short *)la_maldip;
						pDph_t->p_tar = (short *)la_maltar;
//						pDph_t->p_amp = (short *)la_malamp;
					}
					else
					{	// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)la_femloc;	   			/* Use FEMALE tables */
						pDph_t->p_diph = (short *)la_femdip;
						pDph_t->p_tar = (short *)la_femtar;
						//pDph_t->p_amp = (short *)la_malamp;
					}
		
				}
				else if(tmp == PFSP<<PSFONT)
				{
					if(pDph_t->malfem == MALE)
					{	// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)sp_maleloc;	   			/* Use MALE tables */
						pDph_t->p_diph = (short *)sp_maldip;
						pDph_t->p_tar = (short *)sp_maltar;
				//		pDph_t->p_amp = (short *)sp_malamp;
					}
					else
					{	// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)sp_femloc;	   			/* Use FEMALE tables */
						pDph_t->p_diph = (short *)sp_femdip;
						pDph_t->p_tar = (short *)sp_femtar;
//						pDph_t->p_amp = (short *)sp_malamp;
					}

				}
				else if(tmp == PFFR<<PSFONT)
				{
					if(pDph_t->malfem == MALE)
					{	
						pDph_t->Cibles_Defaut=(short *)Cibles_MALE;
						// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)fr_maleloc;	   		
						pDph_t->p_diph = (short *)us_maldip;
						pDph_t->p_tar = (short *)us_maltar;
//						pDph_t->p_amp = (short *)fr_malamp;
					}
					else
					{
						pDph_t->Cibles_Defaut=(short *)Cibles_FEMALE;
						// CAB Removed warnings by typecast
//						pDph_t->p_locus = (short *)fr_femloc;	   	
						pDph_t->p_diph = (short *)us_femdip;
//						pDph_t->p_tar = (short *)us_femtar;
					}
	
					
				} 
				else 
				{
#ifdef PH_DEBUG
					printf("OH MY GOD! THEY'VE KILLED KENNY\n");
#endif
					tartemp = us_gettar(phTTS,phone & PVALUE);
				}    
	}

				if(tmp == (PFUSA<<PSFONT))
				{
					tartemp = us_gettar(phTTS,phone+index[count]);	
				}
				else if(tmp == (PFUK<<PSFONT))
				{
					tartemp = uk_gettar(phTTS,phone+index[count]);
				}
				else if(tmp == PFGR<<PSFONT)
				{
					tartemp = gr_gettar(phTTS,phone+index[count]);
				}
				else if(tmp == PFLA<<PSFONT)
				{
					tartemp = la_gettar(phTTS,phone+index[count]);
				}
				else if(tmp == PFSP<<PSFONT)
				{
					tartemp = sp_gettar(phTTS,phone+index[count]);
				}
				else if(tmp == PFFR<<PSFONT)
				{
					tartemp = fr_gettar(phTTS,phone+index[count]);	
				}
				
				if(pDph_t->allophons[phone+index[count]] == USP_K)
				{
					if (pDphsettar->np == &PF2 )
					{
						
						tartemp += 300;	
					}
					else if(pDphsettar->np == &PF3)
					{
						tartemp += 500;
					}
					
				}
	
	switch (index[count])
	{
		case -1:
		//using last segment of previous phone so use target or
		//last dip position
		if(tartemp > 0) 
			return (tartemp);
		if (tartemp < -1)
		{
			/* Diphthonized seg, use last target value */
				while (pDph_t->p_diph[-tartemp] != -1)
				{
					tartemp--;
				}
				tartemp = pDph_t->p_diph[-tartemp - 1];
		}
		if (tartemp == -1)
				{
					npar = pDphsettar->np - &PF1;
					tartemp = parini[npar];
				}
				return(tartemp);
	case 0:
		// found target at phoneme possibly a pointer to a dip or an actual value
		//so return it if not == -1
		if(tartemp != -1 )
			return(tartemp);
		break;
	case 1:
	case 2:
		// at phoneme plus one if <-1 return dipi value, if -1 kep trying and if value return value
		if(tartemp < -1 )
			return(pDph_t->p_diph[-tartemp]);
		if(tartemp > 0) 
			return (tartemp);
		break;

	}
count++;

}
return(0);
}



__inline short place( int phone)
{
	return(all_place[phone>>8][phone&0xFF]);
#if 0	

	int tmp;
	tmp = phone & PFONT;
	phone= phone & PVALUE;
	if(tmp == (PFUSA<<PSFONT))
	{
		return(us_place[phone]);
	}
	else if(tmp == PFGR<<PSFONT)
	{
		return(gr_place[phone]);
	}
	else if(tmp == PFLA<<PSFONT)
	{
		return(la_place[phone]);
	}
	else if(tmp == PFUK<<PSFONT)
	{
		return(uk_place[phone]);
	}
	else if(tmp == PFSP<<PSFONT)
	{
		return(sp_place[phone]);
	}
	else if(tmp == PFFR<<PSFONT)
	{
		return(fr_place[phone]);
	}
	else 
	{
#ifdef _DEBUG
	printf("OH MY GOD I shuldn't awta be here \n");
#endif
	return(0);
	}
#endif
}

__inline short begtyp(int phone)
{
	return(all_begtyp[phone>>8][phone&0xFF]);

#if 0
#include "ph_def.h"
extern short us_begtyp[];
extern short uk_begtyp[];
extern short gr_begtyp[];
extern short la_begtyp[];
extern short sp_begtyp[];
extern short fr_begtyp[];

	int tmp;
	tmp = phone & PFONT;
	if((phone & PVALUE) >= 100 )
		return(0);
	phone= phone & PVALUE;
	if(tmp == PFUSA<<PSFONT)
	{
		return(us_begtyp[phone]);
	}
	else if(tmp == PFUK<<PSFONT)
	{
		return(uk_begtyp[phone]);
	}
	else if(tmp == PFGR<<PSFONT)
	{
		return(gr_begtyp[phone]);
	}
	else if(tmp == PFLA<<PSFONT)
	{
		return(la_begtyp[phone]);
	}
	else if(tmp == PFSP<<PSFONT)
	{
		return(sp_begtyp[phone]);
	}
	else if(tmp == PFFR<<PSFONT)
	{
		return(fr_begtyp[phone]);
	}
	else 
	{
#ifdef _DEBUG
	printf("OH MY GOD! THEY'VE KILLED NAT\n");
#endif
	return(0);
	}    
#endif
}

__inline short endtyp(int phone)
{
	return(all_endtyp[phone>>8][phone&0xFF]);
#if 0
	
#include "ph_def.h"
extern short us_endtyp[];
extern short uk_endtyp[];
extern short gr_endtyp[];
extern short la_endtyp[];
extern short sp_endtyp[];
extern short fr_endtyp[];

	int tmp;
	tmp = phone & PFONT;
	if((phone & PVALUE) >= 100 )
		return(0);
	phone= phone & PVALUE;
	if(tmp == PFUSA<<PSFONT)
	{
		return(us_endtyp[phone]);
	}
	else if(tmp == PFUK<<PSFONT)
	{
		return(uk_endtyp[phone]);
	}
	else if(tmp == PFGR<<PSFONT)
	{
		return(gr_endtyp[phone]);
	}
	else if(tmp == PFLA<<PSFONT)
	{
		return(la_endtyp[phone]);
	}
	else if(tmp == PFSP<<PSFONT)
	{
		return(sp_endtyp[phone]);
	}
	else if(tmp == PFFR<<PSFONT)
	{
		return(fr_endtyp[phone]);
	}
	else 
	{
#ifdef _DEBUG
		printf("OH MY GOD! THEY'VE KILLED ED\n");
#endif
		return(0);
	}    
#endif
}

__inline short ptram(int phone)
{
	return(all_ptram[phone>>8][phone&0xFF]);
#if 0
	
#include "ph_def.h"
extern short us_ptram[];
extern short uk_ptram[];
extern short gr_ptram[];
extern short la_ptram[];
extern short sp_ptram[];
extern short fr_ptram[];

	int tmp;
	tmp = phone & PFONT;
	if((phone & PVALUE) >= 100 )
		return(0);
	phone= phone & PVALUE;
	if(tmp == PFUSA<<PSFONT)
	{
		return(us_ptram[phone]);
	}
	else if(tmp == PFUK<<PSFONT)
	{
		return(uk_ptram[phone]);
	}
	else if(tmp == PFGR<<PSFONT)
	{
		return(gr_ptram[phone]);
	}
	else if(tmp == PFLA<<PSFONT)
	{
		return(la_ptram[phone]);
	}
	else if(tmp == PFSP<<PSFONT)
	{
		return(sp_ptram[phone]);
	}
	else if(tmp == PFFR<<PSFONT)
	{
		return(fr_ptram[phone]);
	}
	else 
	{
#ifdef _DEBUG
	printf("OH MY GOD! THEY'VE KILLED MATT\n");
#endif
	return(0);
	}    
#endif
}

__inline short burdr(int phone)
{
	return(all_burdr[phone>>8][phone&0xFF]);
#if 0
#include "ph_def.h"
extern short us_burdr[];
extern short uk_burdr[];
extern short gr_burdr[];
extern short la_burdr[];
extern short sp_burdr[];
extern short fr_burdr[];

	int tmp;
	tmp = phone & PFONT;
	if((phone & PVALUE) >= 100 )
		return(0);
	phone= phone & PVALUE;
	if(tmp == PFUSA<<PSFONT)
	{
		return(us_burdr[phone]);
	}
	else if(tmp == PFUK<<PSFONT)
	{
		return(uk_burdr[phone]);
	}
	else if(tmp == PFGR<<PSFONT)
	{
		return(gr_burdr[phone]);
	}
	else if(tmp == PFLA<<PSFONT)
	{
		return(la_burdr[phone]);
	}
	else if(tmp == PFSP<<PSFONT)
	{
		return(sp_burdr[phone]);
	}
	else if(tmp == PFFR<<PSFONT)
	{
		return(fr_burdr[phone]);
	}
	else 
	{
#ifdef _DEBUG
	printf("OH MY GOD! THEY'VE KILLED MIKE\n");
#endif
	return(0);
	}    
#endif
}

__inline short plocu(int index)
{
	return(all_plocu[index>>8][index&0xFF]);
#if 0
	
#include "ph_def.h"
extern short us_plocu[];
extern short uk_plocu[];
extern short gr_plocu[];
extern short la_plocu[];
extern short sp_plocu[];
extern short fr_plocu[];

	int tmp;
	tmp = index & PFONT;
	index= index & PVALUE;
	if(tmp == PFUSA<<PSFONT)
	{
		return(us_plocu[index]);
	}
	else if(tmp == PFUK<<PSFONT)
	{
		return(uk_plocu[index]);
	}
	else if(tmp == PFGR<<PSFONT)
	{
		return(gr_plocu[index]);
	}
	else if(tmp == PFLA<<PSFONT)
	{
		return(la_plocu[index]);
	}
	else if(tmp == PFSP<<PSFONT)
	{
		return(sp_plocu[index]);
	}
	else if(tmp == PFFR<<PSFONT)
	{
		return(fr_plocu[index]);
		//when we have french change to fr_
	}
	else 
	{
#ifdef _DEBUG
	printf("OH MY GOD! THEY'VE KILLED CARL\n");
#endif
	return (0);
	}    
#endif
}
