/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *    Copyright (c) 1985, Digital Equipment Corporation, Maynard, Mass.
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
 *    File Name:    ph_data.h
 *    Author:       Matthew Schnee                                         
 *    Creation Date:03/21/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    Data structure definitions for LTS
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *  Rev Who     Date        	Description                    
 *  --- -----   ----------- 	---------------------------------------
 *  004 MGS     05/15/1996 		moved PKSD_T typedef to kernel.h
 *	005 MGS		05/31/1996 		started merging spanish
 *	006	EDB		01/10/1997		add "delay_cnt" and move "modulcount" 
 *	007 EAB		04/09/1997		for BATS#346
 *                              Added new variable had_hatbegin and had_hatend,
 *  008	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 *  009	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 *	010	MGS		08/26/1997		Merged in fasttalk
 * 	011 EAB		07/08/1997		Added new variable vot and tarbas
 *	012	MGS		10/14/1997		BATS #470 fixed crash due to reset
 * 	013 GL		10/22/1997		Change ULONG to "U32"
 *  014 CJL     11/10/1997      Add glide_tot & oddeven.
 *  015 GL      12/12/1997      Add ends_in_r for LINKRWORD support in UK_English
 *	016 EAB		01/10/1998		Added length to f0_command for British Inotnation bats 575
 *	017 EAB		01/22/1998		Added prevtarg0 prevnphon and done for Bats 575 british intonation
 *	018 EAB		03/10/1998		Added new variable tot_enddrop
 *	019 EAB		03/27/1998		Added new variable Word_has_stress
 *	020 EAB		04/27/1998		Added several new varibles related intonation and prosody I expect to use
 *								them in all languages so I haven't ifdef'd them out becuase it would be a
 *								ifndef NWSNOAA which being a single point product it didn't seem worth
 *								adding another ifdef for so few variables
 *  0021 EAB 	07/13/1998		BATS 711 Added number_vowels and increase feature bits array
 *	0022 EAb 	01/25/1999 		Improved UK linkr in phsort code so that ends_in_r no_longer needed
 *  0023 EAB	02/03/1999		Added change from NWSNOAA->NWS_US for multi language NOA
 *								also added openq variable but haven't decided how to ifdef them yet
 *								and variables for Evan Ballaban 
 *	0024 NAL 	01/20/2000		Added extern declarations for the tuned speaker param arrays
 *  0025 eab 	04/07/2000		Removed unused spanish variables
 *  0026 NAL 	06/13/2000		BATS #930 Added val declaration for tuned speaker params 
 *  0027 EAB 	06/28/2000      Unified Phoneme Set Changes 
 *	0028 CHJ 	07/20/2000		Added French
 *  0029 EAB 	09/20/2000		Removed unused variable. Chris found Product and AD different 
 *  0030 CAB	10/18/2000		Fixed copyright info and formatted comment section.
 *  0063 MGS	01/18/2001		Fixed comment error
 *  0062 CAB	01/16/2001		Merged Michel Divay changes for French
 *  0063 eab	07/10/2001		Changes for hlsyn
 *  0064 MGS	04/11/2002		ARM7 port
 *	0065 CAB	05/22/2002		Updated for copyright info
 *  0066 MFG	09/19/2002	 	Added support for new chris voice
 *	0067 CAB	09/19/2002		Changed chris voice to US only
 *	0068 CAB	09/19/2002		Changed chris voice to us only rev:2
 *	0069 MGS	06/26/2003		changed tbstep and bstep to int because it
 *						is required for ARM to correctly compare to negative numbers
 */


#ifndef _PH_DATA_H
#define _PH_DATA_H

/* MVP : The constant MAX_SPEAKERS should change whenever you add more speakers */
/* The existing speaker parameters are listed in phvdefi.c .whenever you would  */
/* like to add new speaker arrays, This constant should be changed accrodingly */
/* The MAX_SPEAKERS count include one additonal slot to store last speaker params */


#ifdef EPSON_ARM7
#define MAX_SPEAKERS 10
#else
#define MAX_SPEAKERS 10
#endif

/* Extern declarations for speaker param arrays */
/* All are defined in phvdefi.c */
#ifdef EPSON_ARM7
extern const short            paul_8[SPDEF];
extern const short            paul[SPDEF];
extern const short            us_paul_8_tune[];
extern const short            default_tune[SPDEF];
#else
extern const short            paul_8[SPDEF];
extern const short            betty_8[SPDEF];
extern const short            harry_8[SPDEF];
extern const short            frank_8[SPDEF];
extern const short            kit_8[SPDEF];
extern const short            ursula_8[SPDEF];
extern const short            rita_8[SPDEF];
extern const short            wendy_8[SPDEF];
extern const short            dennis_8[SPDEF];

extern const short            paul[SPDEF];
extern const short            betty[SPDEF];
extern const short            harry[SPDEF];
extern const short            frank[SPDEF];
extern const short            kit[SPDEF];
extern const short            ursula[SPDEF];
extern const short            rita[SPDEF];
extern const short            wendy[SPDEF];
extern const short            dennis[SPDEF];

extern const short            gr_paul[SPDEF];
extern const short            gr_betty[SPDEF];
extern const short            gr_harry[SPDEF];
extern const short            gr_frank[SPDEF];
extern const short            gr_kit[SPDEF];
extern const short            gr_ursula[SPDEF];
extern const short            gr_rita[SPDEF];
extern const short            gr_wendy[SPDEF];
extern const short            gr_dennis[SPDEF];

extern const short            uk_paul_8_tune[];
extern const short            uk_betty_8_tune[];
extern const short            uk_harry_8_tune[];
extern const short            uk_frank_8_tune[];
extern const short            uk_kit_8_tune[];
extern const short            uk_ursula_8_tune[];
extern const short            uk_rita_8_tune[];
extern const short            uk_wendy_8_tune[];
extern const short            uk_dennis_8_tune[];

extern const short            gr_paul_8_tune[];
extern const short            gr_betty_8_tune[];
extern const short            gr_harry_8_tune[];
extern const short            gr_frank_8_tune[];
extern const short            gr_kit_8_tune[];
extern const short            gr_ursula_8_tune[];
extern const short            gr_rita_8_tune[];
extern const short            gr_wendy_8_tune[];
extern const short            gr_dennis_8_tune[];

extern const short            fr_paul_8_tune[];
extern const short            fr_betty_8_tune[];
extern const short            fr_harry_8_tune[];
extern const short            fr_frank_8_tune[];
extern const short            fr_kit_8_tune[];
extern const short            fr_ursula_8_tune[];
extern const short            fr_rita_8_tune[];
extern const short            fr_wendy_8_tune[];
extern const short            fr_dennis_8_tune[];

extern const short            sp_paul_8_tune[];
extern const short            sp_betty_8_tune[];
extern const short            sp_harry_8_tune[];
extern const short            sp_frank_8_tune[];
extern const short            sp_kit_8_tune[];
extern const short            sp_ursula_8_tune[];
extern const short            sp_rita_8_tune[];
extern const short            sp_wendy_8_tune[];
extern const short            sp_dennis_8_tune[];

extern const short            la_paul_8_tune[];
extern const short            la_betty_8_tune[];
extern const short            la_harry_8_tune[];
extern const short            la_frank_8_tune[];
extern const short            la_kit_8_tune[];
extern const short            la_ursula_8_tune[];
extern const short            la_rita_8_tune[];
extern const short            la_wendy_8_tune[];
extern const short            la_dennis_8_tune[];

extern const short            us_paul_8_tune[];
extern const short            us_betty_8_tune[];
extern const short            us_harry_8_tune[];
extern const short            us_frank_8_tune[];
extern const short            us_kit_8_tune[];
extern const short            us_ursula_8_tune[];
extern const short            us_rita_8_tune[];
extern const short            us_wendy_8_tune[];
extern const short            us_dennis_8_tune[];

extern const short            us_paul_tune[];
extern const short            us_betty_tune[];
extern const short            us_harry_tune[];
extern const short            us_frank_tune[];
extern const short            us_kit_tune[];
extern const short            us_ursula_tune[];
extern const short            us_rita_tune[];
extern const short            us_wendy_tune[];
extern const short            us_dennis_tune[];


extern const short            la_paul_tune[];
extern const short            la_betty_tune[];
extern const short            la_harry_tune[];
extern const short            la_frank_tune[];
extern const short            la_kit_tune[];
extern const short            la_ursula_tune[];
extern const short            la_rita_tune[];
extern const short            la_wendy_tune[];
extern const short            la_dennis_tune[];
extern const short			  la_val_tune[];

extern const short            sp_paul_tune[];
extern const short            sp_betty_tune[];
extern const short            sp_harry_tune[];
extern const short            sp_frank_tune[];
extern const short            sp_kit_tune[];
extern const short            sp_ursula_tune[];
extern const short            sp_rita_tune[];
extern const short            sp_wendy_tune[];
extern const short            sp_dennis_tune[];
extern const short			  sp_val_tune[];

extern const short            gr_paul_tune[];
extern const short            gr_betty_tune[];
extern const short            gr_harry_tune[];
extern const short            gr_frank_tune[];
extern const short            gr_kit_tune[];
extern const short            gr_ursula_tune[];
extern const short            gr_rita_tune[];
extern const short            gr_wendy_tune[];
extern const short            gr_dennis_tune[];
extern const short			  gr_val_tune[];

extern const short            uk_paul_tune[];
extern const short            uk_betty_tune[];
extern const short            uk_harry_tune[];
extern const short            uk_frank_tune[];
extern const short            uk_kit_tune[];
extern const short            uk_ursula_tune[];
extern const short            uk_rita_tune[];
extern const short            uk_wendy_tune[];
extern const short            uk_dennis_tune[];
extern const short			  uk_val_tune[];

extern const short            fr_paul_tune[];
extern const short            fr_betty_tune[];
extern const short            fr_harry_tune[];
extern const short            fr_frank_tune[];
extern const short            fr_kit_tune[];
extern const short            fr_ursula_tune[];
extern const short            fr_rita_tune[];
extern const short            fr_wendy_tune[];
extern const short            fr_dennis_tune[];
extern const short			  fr_val_tune[];

extern const short            uk_paul_tune[];
extern const short            uk_betty_tune[];
extern const short            uk_harry_tune[];
extern const short            uk_frank_tune[];
extern const short            uk_kit_tune[];
extern const short            uk_ursula_tune[];
extern const short            uk_rita_tune[];
extern const short            uk_wendy_tune[];
extern const short            uk_dennis_tune[];
extern const short			  uk_val_tune[];

#endif


extern const short *all_begtyp[];
extern const short *all_endtyp[];
extern const short *all_ptram[];
extern const short *all_burdr[];
extern const short *all_plocu[];
extern const short *all_place[];
extern const short *all_featb[];

/***************************************************************************/
/* MVP : Static variables in PH_SETAR.C FILE ARE GROUPED HERE FOR MI       */
/* Initially thought of having separate structures for each group of static */
/* variables in each of the files.But after re-organizing the variables    */
/* through either passing as function arguments or as locals ,there are less */
/* number of static variables left in each file.All of them are grouped in */
/* the same structure as defined below.                                    */
/* NOTE: The variables with routing through not many functions are made    */
/* function arguments. (A balanced approach is taken up)                   */
/* The list  of static variables which are made function arguments are     */
/* logged in phglob.log for each file                                      */
/***************************************************************************/

typedef struct phsettar_static_tag
{
	/* Elements used by PH_SETAR.C */
	short                   bouval;
	short					vot;
	short                   vvbouval;
	short                   durtran;
	short                   vvdurtran;
	short                   phonex;
	short                   gencoartic;
	short                   initsw;
	PARAMETER              *np;                /* points to current parameter */
	char                    par_type;  /* Identifies type of current par */
	short                   nasvowel;
	short                   phcur;
	short                                   delay_cnt;

	

	/* This element is used by  PH_SORT.C file */
	int                     did_del;

	/* Elements used by PH_TIMNG.C */
	short                   sprlast;   /* Sprate during last clause        */
	short                   sprat1;    /* Sprate factor for pauses and deldur  */
	short                   sprat2;    /* Sprate factor for segments       */
	short                   strucstressprev;
	short                   phonex_timing;
	short                   strucnex;
	short                   feanex;
	short                   sprat0;
	short                   durxx;
	/* Elements used by PH_DRWT0.C */
	short					basecntr;
	short					basestep;
	short					basetime;
	short					f0command;
	short					glide_step;
	short					glide_inc;
    short                   glide_tot; /*Added to merged EAB code. cjl 11/10/97*/
	short					place;
	short					type;
	short					length; /* EAB 1/10/98  new parameter for make_f0*/
	short					phocur;
	short                   nfram;
	short                   nframb;
	short                   nframs;
	short                   nframg;
	short					diplo;
	short                   extrad;
	short                   tglstp;
	short                   tglstn;
	short                   segdur;
	short                   segdrg;
	short                   f0las1;
	short                   f0las2;
	short                   tarhat;
	short                   tarimp;
	short                   f0a2;
	short                   f0b;
	short                   f0a1;
	short                   dtimf0;
	short                   phonex_drawt0;
	short                   tarseg;
	short                   tarseg1;
	short                   beginfall;
	short                   lastone;
	short					lastbase;
	short                   np_drawt0;
	short                   npg;
	short                   nimp;
	short					nimpcnt;
	short                   endfall;
	short					timecos3;
	short					timecos5;
	short					timecos10;
	short					timecos15;
	short					timecosvib;
	short					f0basestart;
	short                   f0beginfall;
	short                   f0endfall;
	short                   vibsw;
	short                   newnote;
	short                   delnote;
	short                   delcum;
	short                   f0start;
	short					tarbas;
	short					f0slas1;
	short					f0slas2;
    short                   f0delta;
	short					delimp;
	short					f0sa2;
	short					f0sb;
	short					f0sa1;

	/* MVP : list of static vars in phdraw() in PH_DRAW.C */
	short                   drawinitsw;
	short                   breathyah;
	short                   breathytilt;
	/* MVP list of static vars in phinton() in PH_INTON.C */
	short                   nrises_sofar;
	short                   hatsize;
	short                   hat_loc_re_baseline;
	short					delayed_pulse;
	short					numstresses; /* 4/2/97 EAB new phones needed later in code merge*/
	short					creek;
	short					numsylsofar;
	short					checkedphone;
	short					numsyllables;
	short					tarstop;
}
DPHSETTAR_ST;
typedef struct phsettar_static_tag *PDPHSETTAR_ST;

/* MVP :PH thread instance specific data structure */
typedef struct DPH_TAG
{
	/* List of vars from old phram.c START */
	PARAMETER               param[VOICE_PARS - 1];
	int last_lang;
#ifdef PH_SWAPDATA   
	FILE *PHSwapIn;
	FILE *PHSwapOut;
	short PHSwapCnt;
#endif	// PH_SWAPDATA   
	short                   fvvtran;
	short                   bvvtran;
	short                   tvvbacktr;
	short                   dfvvtran;
	short                   dbvvtran;
	short                   breathysw;
	short                   spdefb1off;
	short                   spdeflaxprcnt;
	short                   spdeftltoff;
	short                   f0_dep_tilt;    /* english tilt */  /* spanish %-f0-fall */
	short					f0flutter;
	short					f0s;
	short                   f0;
	short                   parstochip[VOICE_PARS];
	short					lastf1;
#ifdef _DEBUG
	short					printdata;
#endif
	short					at_ending_sil;
	short					pressure;
	short					spressure;
	short					pressure_pause;
	short					delta_pressure;
	short					pressure_drop;
	short					pressure_gest;
	short					syl_pressure;
	short					press_offset;
	short					area_ap;
	short					target_ap;
	short					target_l;
	short					lastvot;
	short					target_ag;
	short					area_g;
	short					lastthing;
	short					last_area_g;
	short					delta_area_g;
	short					delta_a_forap;
	short					delta_area_gst;
	short					delta_area_gstop;
	short					agspeed;
	short					area_n;
	short					target_narea;
	short					area_l;
	short					last_area_l;
	short					area_flap;
	short					area_b;
	short					last_area_b;
	short					last_area_tb;
	short					target_b;
	short					target_tb;
	short					area_tb;
	short					dcstep;
	short					uestep;
	short					in_lclosure;
	short					in_lrelease;
	short					in_lfric;
	short					fnscale;
	short					in_tbrelease;
	short					in_bclosure;
	short					in_tbclosure;
	short					in_brelease;
	short					in_bfric;
	short					in_tbfric;
// int is required for ARM to correctly compare these to negative numbers
	int					lstep;
	int					bstep;
	int					tbstep;
	short					tstep;
	short					f1_velar;
	short					nasal_step;
	short					p_step;
	short					openquo;
	short					oqtarget;
	short					oqleadtime;
	short                   tcum;
	short					stress_pulse;
	short                   avglstop;
	short					avcreek;
	short					DelayCnt;
	short					timeref;  /* time reference for rhythm */
	short					Speaker_Rhythm;
	short					tarbas;
	short					clausetype;
	short					addjit;	
	short					sprate;
	short                   allophons[NPHON_MAX + SAFETY + 2];
	U32						allofeats[NPHON_MAX + SAFETY + 2];
	short                   alloopenq[NPHON_MAX + SAFETY + 2];
	short                   allodurs[NPHON_MAX + SAFETY + 2];
	unsigned long		    wordclass[NPHON_MAX + SAFETY + 2];
	unsigned long			holdwordclass;
	short					last_real_phon;
	short					promote_helper_verb;
	short					prevtargf0; /* EAB in for British */
	short					done;
	short					prevnphon; /* EAB in for British */
	short					clausenumber;
	short					clausepos;
	short					commacnt;
	short					dcommacnt;
	short					hatstate;
	short					hatstatel;
	short					hatpos;
	short					sinstart;
	short					spdefglspeed;
#ifndef MSDOS
	/* MGS 10/14/1997 BATS #470 fixed crash due to reset */
	LPTTS_HANDLE_T		phTTS;
#endif

	short                   durfon;
	short                   nallotot;
	short                   malfem;
	short					del_av;
    short                  *p_locus;
    short                  *p_diph;
    short                  *p_tar;
    short                  *p_amp;
	short                   arg1;
	short                   arg2;
	short                   arg3;
	short                   symbols[NPHON_MAX + 2];
	short                   nsymbtot;
	short                  *user_durs;
	short                  *user_f0;
	short                  *user_offset;
	short                  *phonemes;
	U32			           *sentstruc;
	short                   nphonetot;
	FLAG                    newparagsw;
	short                   f0mode;
    short                   cbsymbol;  /* Can be avoided by changing in
                                            * phclause()(phclause.c) and make
                                            * phinton() to expect cbsymbol as an 
                                            * argument etc...
                                            */
	short					nfperiod;
	short					nfcomma;
    short                   oddeven; /*Added cjl 11/10/97*/
	short                   curspdef[SPDEF];
	short                  *voidef[MAX_SPEAKERS];
	short                  *voidef_8[MAX_SPEAKERS];
	short                  *tunedef[MAX_SPEAKERS];		// NAL 20jan00	These hold offsets after
	short                  *tunedef_8[MAX_SPEAKERS];	//				autotuned
	short                   var_val[SPDEF];
	FLAG                    loadspdef;
	short                   assertiveness;
	short                   f0_lp_filter;
	short                   size_hat_rise;
	short                   scale_str_rise;
	short                   f0basefall;
	short                   f0minimum;
	short                   f0scalefac;
	short					f0segscalefac; /* eab 4/27/97 New spdef parameter to scale segmental effect*/
	short                   compause;
	short                   perpause;
	short                   f0tar[NPHON_MAX + SAFETY + 2];
	short                   f0type[NPHON_MAX + SAFETY + 2];
	short					f0length[NPHON_MAX + SAFETY + 2];
	short					Cntfromlast;
	short					keepallo;
	short					lastallo;
	short					keepdur;
	short					number_words; 
	short					number_verbs;
	short					number_fsyls;
	short					*f0baseline;		// Points to an f0basetypes base element
	short					f0basetypes[5][17];	// Array of basetypes
							/*eab 8/96 17 point contour specifiying fo baseline contour*/
	short                   f0tim[NPHON_MAX + SAFETY + 2];
	short					cumdur;
	short					tcumdur; /*eab 8/96 total dur of clause */
	short                   nf0ev;
	short                   nf0tot;
	short                   f0prime;
	short					f0last;

#ifdef _DEBUG
	short					temp;
#endif

	short					avtemp;
	short					f0primelast;
	short					enddrop;
	short					tot_enddrop;
	short					scaled_enddrop;
	short					glotalize;
	short					delayed_pulse;
	short					creek;
	short                   ph_init;                /* Can be avoided */
	S32                     longcumdur;
	short                   dipspec[40];
	short *Cibles_Defaut;	   /* targets, points to either Cibles_MALE or Cibles_FEMALE */


	//	FLAG  FR_Interrogative;    /* phclause, phsort, phinton */ //aka cbsymbol
	short NbSyllabes;		   /*phaloph, phtiming, Nb. syll. in a sentence*/
	short fconsfeats[NPHON_MAX + SAFETY + 2];


	/* List of vars from old phram.c END  */

	int					asperation;             /* From ph_main.c */
	int                 reset_pitch;    /* From ph_main.c */
	int                 bound;                  /* Last Edit session end (From ph_main.c) */
	short               nphone;                 /* From old phram.c */
	short					nphonelast;
	short					phonestep;
	short				fric_count;
	short					frequency_shift;
	int                 lastoffs;               /* From ph_main.c */
	unsigned int        syllable_struct[256];   /* 
											     * From ph_syl.c  
											     * changed to 256 for spanish MGS 
												*/
	unsigned int        phone_struct[256];      /* 
												 * From ph_syl.c      
												 * changed to 256 for spanish MGS 
												 */
	int                 default_pitch;  /* From ph_main.c */
	short               initpardelay;   /* From ph_claus.c */
	short far           *delaypars; /* From ph_claus.c */
	/* List of pointers to structures containing Static variables of each file in PH */
	short               shrink; /* Shrink or lengthen diph trans nonlinearly */
	short               shrif;  /* Shrink forward transitions in -OBST    */
	short               shrib;  /* Shrink backward transitions in -OBST   */
	short		 		had_hatbegin; /* eab added these variables so that hat rise and fall could work
										 correctly see phinton.c 4/9/97 */
	short		 		had_hatend;
	short				had_in_phrase_final;
	int                 docitation;        /* From ph_aloph.c */
	short               modulcount;        /* for R modulation */
	short				smodulcount;
	short				gettar_count;
	short               delta_special;
	short               special_phrase;
	short               th_to_s;           /* From ph_setar.c */
	short               lastf0;
	short               evryoth;
    short               emphasisflag; 
	short               *pbvalue;           /* Pointer into boundary value table   */
	short               *p_bvalue;          /* Pointer into boundary value table  */

	short impulse_width;		/* RSM */
	short vowel_portion;		/* RSM */
	short test_targf0;			/* RSM */
	short targf0_increment;		/* RSM */
	short diff_targf0;			/* RSM */
	short impulse_width_increment;	/* RSM */
	short diff_impulse_width;		/* RSM */
	short ramp_targf0;			/* RSM */
	short ramp_impulse_width;		/* RSM */
	short ramp_delayf0;				/* RSM */
	short last_preamble_command;

		short                   hat_seen, wordcount;
		short					Word_has_stress; //eab 3/27/98
	

		


	PDPHSETTAR_ST           pSTphsettar;	
} DPH_T;

typedef struct DPH_TAG *PDPH_T;

/* GL 04/21/1997  change this for OSF build */
#ifdef MSDOS
struct TTS_HANDLE_TAG
{
	PKSD_T                  pKernelShareData;
	PDPH_T                  pPHThreadData;
};
typedef struct TTS_HANDLE_TAG *LPTTS_HANDLE_T;
#endif // MSDOS

#endif	// _PH_DATA_H