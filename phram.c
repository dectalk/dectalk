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
 *    File Name:	phram.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *	All RAM variables used by more than one C program.
 *	Note: nothing in this file is initialized at load time. This
 *	is a requirement for running on the module.
 *
 ***********************************************************************
 *    Revision History:
 * 0001	27-Dec-84 DGC	Made changes for the 80186
 * 0002  6-May-85 DK	Add breathysw to allow breathy offsets for females
 * 0003 24-Jul-85 DK	Replace outpar struc by simple array parstochip[]
 *							and chip_pars by SP_CHIP[]
 * 0004 08-Aug-85 DGC	"haltsw" is gone.
 */

#include "phdefs.h"

/*
 * misc ram storage moved here to make linking easier ...
 */
#ifdef NOT_USED
P_PIPE   kinp;                  /* Link to KLSYN input pipe	*/
#endif

/*		0. Speaker def params					*/
short f0outa=0;
short f0outb=0, f0outc=0, f0outd=0, f0out1=0, f0out2=0;
short   curspdef[SPDEF];      /* Current speaker defintion pars in user format */
FLAG   loadspdef=1;            /* Set to TRUE if new sp def to go to chip */
short   *global_spc_buf;
short global_spc_v_buf[VOICE_PARS+2];
short global_spc_s_buf[SPDEF_PARS+2];
short   malfem=0;               /* Set to MALE or FEMALE */
short   f0_dep_tilt=0;         /* How much does f0 change spect tilt */
short   assertiveness=0;         /* How much does f0 fall at end of S */
short   f0_lp_filter=0;         /* Cuttoff freq of f0 low-pass filter */
short   size_hat_rise=0;         /* Size in Hz times 10 of the f0 hat rise gesture */
short   scale_str_rise=0;      /* Scale factor for stress impulses */
short   f0minimum=0;            /* Nominal average pitch of a speaker */
short   f0scalefac=0;            /* Scale factor to expand/contract f0 about f0minimum */
short   f0basefall=0;            /* Baseline fall in Hz times ten, used in PHDRAWT0() */
short   spdeflaxprcnt=0;         /* 4096 is max lax breathiness added at voiceless bound */
short   spdeftltoff=0;         /* Tilt offset in dB */
short   spdefb1off=0;            /* First formant bandwidth offset when breathy */
short   last_voice=0;            /*	Voice to use on reloads */

/*		1. Arrays						*/
//#ifndef EPSONC33
//short symbols[NPHON_MAX+2];   /* Phonemes/accents/syntax, in int form	*/
//#else
#ifdef MINIMAL_SYNTH
char symbols[NPHON_MAX+2+10];   /* Phonemes/accents/syntax, in int form	*/
	/*+20 becuase it also has to caryy control pjones*/
#else
char symbols[NPHON_MAX+2+20];   /* Phonemes/accents/syntax, in int form	*/
	/*+20 becuase it also has to caryy control pjones*/
#endif
//#endif
short nsymbtot;               /* Number elements currently in array	*/

short *phonemes;               /* Pointer, use symbols[] array		*/
#ifndef MINIMAL_SYNTH
short *user_durs;               /* Pointer to user-specified durations	*/

short *user_f0;               /* Pointer to user-specified f0 commands */

//short *user_offset;            /* Pointer to time offset of f0 commands */
#endif
short *sentstruc;               /* Sentence Struc coded as feature bits	*/
short nphonetot;               /*  # of elements currently in arrays	*/

char allophons[NPHON_MAX+SAFETY+2];   /* Allophones, in integer	*/
short allofeats[NPHON_MAX+SAFETY+2];   /* Feats of allophones		*/
short allodurs[NPHON_MAX+SAFETY+2];   /* Dur in frames of each phone	*/
short phcur;                  /* Phone  being synthesized	*/
char nphone;                  /* Pointer to currently processed phone	*/
short nallotot;               /*  # of elements currently in arrays	*/

short f0tar[NPHON_MAX+SAFETY+2];   /* F0 target commands, in Hz	*/
short f0tim[NPHON_MAX+SAFETY+2];   /* F0 target times, in frames	*/
short nf0ev;            /* Pointer to cur f0 gesture */
short nf0tot;         /* # of elements currently in arrays	*/

/*		2. State switches					*/

short ph_init;            /* Set to zero to re-init phonetic comp	*/
short f0mode;            /* Set to {NORMAL,USER_SPECIFIED,SINGING} */
short emphasisflag;      /* Set to TRUE if emphatic stress in clause */
short cbsymbol;         /* Set to QUEST in PHSORT if see "?"	*/
short breathysw;         /* Set to 1 in PHSETTAR for breathy offset */

/*    Nominal speaking rate in words/minute */

short sprate=0;      /* Normal rate */

/*	Set to TRUE in "phsort.c" if [+] in the text. Set back to FALSE	*/
/*	in "phdrawt0.c" after F0 has been raised.			*/
#ifndef OLD_GARBAGE
FLAG   newparagsw;
#endif
/*	Output buffer for data going to the signal processor (voice).	*/
/*	The state is filled in by "phmain". The rest by "phdraw[t0]".	*/

short   parstochip[VOICE_PARS];

/*	Array of blocks used by the parameter drawing. The only stuff	*/
/*	that is done at boot time is set up in "phmain".		*/

PARAMETER param[VOICE_PARS-1];

/*	Additional period and comma pauses. In samples.			*/

short   perpause;
short   compause;

/*	Speaker definition for the variable voice. After it loads up	*/
/*	PERFECT_PAUL, "phmain" puts PERFECT_PAUL here.			*/

short   var_val[SPDEF];

/*    Cumulative duration in waveform samples	*/

long longcumdur=0;

/*    Duration of current phone, in frames	*/

short durfon=0;

/*    Time since beginning of current phone, in frames */

short tcum=0;

/*     Unscaled fund frequency times 10 (direct output of low-pass filter) */
short f0=0;

/*    F0 after scaling, glot-stop insertion, and truncation (T0 = 1/f0prime) */
short f0prime=0;

/*    Used to reduce AV during a glottal stop */
short avglstop=0;

/*    Arguments for fractional multiply instruction mlsh1() and muldv() */

short arg1=0,arg2=0,arg3=0;

/*    Array for placing diphthonization spec for current phone */
//help this was 40 I think too big
short dipspec[30];

/*    Variables for vowel-vowel coarticulation across a conson, F2 only */
short fvvtran=0,bvvtran=0,tvvbacktr=0,dfvvtran=0,dbvvtran=0;

/*    Usually point to maleloc[]: (locus freq, percent, and tran dur table) */
short *p_locus;

/*    Usually point to maldip[]: (diphthonization info for segments) */
short *p_diph;

/*    Usually point to maltar[]: (arrays of phoneme target values) */
short *p_tar;

/*    Usually point to malamp[]: (array of parallel amp targets for frics) */
short *p_amp;

