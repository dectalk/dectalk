/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	viphdefs.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 * 0001  1-Sep-84 DK    Initial creation
 * 0002 27-Dec-84 DGC   Moved some stuff to defs.h for 80186
 * 0003 19-Jan-85 DGC   Moved the LIMIT structure def. to here.
 * 0004 19-Feb-85 DK    Rename spdef variables not sent to chip, add tltoff
 * 0005 28-Feb-85 DK    Define a few more constants, new place[] features
 * 0006 06-Mar-85 DGC   Added system call PUTSEQ.
 * 0007 24-Jul-85 DK    Remove tltoff from set of spdefs sent to chip
 *                      rename OUTPAR structure to be parstochip[] array
 * 0008 23-Mar-95 CJL   Rename this file from PHDEFS.H to VIPHDEFS.H,
 *                      add comments, add #define to exclude multiple includes.
 * 0009 16-JAN-96 SIK 	Removed white space inbetween # and include in places
 * 					  	where #include is commented out.
 * 0010 10/05/98  ETT   Added Linux code.
 * 0011 9/26/00	  EAB	Remove SIZTARTAB it's a dangerous redundant definition
 * 0012 10/16/00  CAB	Changed copyright info
 * 0013	08/08/02  CAB	Updated copyright info
 *
 */

#ifndef VIPHDEFS_H
#define VIPHDEFS_H

/* 23-Mar-95 CJL the space in # include is to turn off depend.exe for process.*/
/*16-JAN-96 SIK Removed white space inbetween # and include in places
 * 					  where #include is commented out.  */
/*#include "port.h"*/
#include "defs.h"
/*#include "kernel.h"*/
/*#include "dectalk.h"*/
/*#include "esc.h"*/
#include "cmd.h"
/*#include "l_us_ph.h"*/

/* The following stuff is all unique to modules named ph*.c */

#define FSTRESS           03    /* Stress feature bits                  */
#define FNOSTRESS          0    /*  Value of FSTRESS if not stressed    */
#define FSTRESS_1         01    /*  Value of FSTRESS for primary stress */
#define FSTRESS_2         02    /*  Value of FSTRESS for secondary stres*/
#define FEMPHASIS         03    /*  Value of FSTRESS for emphasis       */

#define FWINITC           04    /* Word-initial consonant               */

#define FTYPESYL         030    /* Syllable structure feature bits      */
#define FMONOSYL           0    /*  Value of FSYL_STRUC for monosyll    */
#define FFIRSTSYL        010    /*  Value of FSYL_STRUC for first syll  */
#define FMEDIALSYL       020    /*  Value of FSYL_STRUC for medial syll */
#define FFINALSYL        030    /*  Value of FSYL_STRUC for final syll  */

#define FBOUNDARY       0740    /* Following boundary type feature bits */
#define FNO_BOUNDARY       0    /*  Value of FBOUNDARY if rhyme not final*/
#define FSYBNEXT        0040    /*  Value of FBOUNDARY if syllable bound*/
#define FMBNEXT         0100    /*  Value of FBOUNDARY if morpheme bound*/
#define FWBNEXT         0140    /*  Value of FBOUNDARY if word boundary */
#define FPPNEXT         0200    /*  Value of FBOUNDARY if prep phrase   */
#define FVPNEXT         0240    /*  Value of FBOUNDARY if verb phrase   */
#define FRELNEXT        0300    /*  Value of FBOUNDARY if rel clause    */
#define FCBNEXT         0340    /*  Value of FBOUNDARY if comma         */
#define FPERNEXT        0400    /*  Value of FBOUNDARY if period        */
#define FQUENEXT        0440    /*  Value of FBOUNDARY if quest mark    */
#define FEXCLNEXT       0500    /*  Value of FBOUNDARY if excalation    */

#define FSENTENDS       0400    /* Next boundary is a sentence end      */

#define FHAT_BEGINS     01000
#define FHAT_ENDS       02000

#define AT_BOTTOM_OF_HAT        1
#define AT_TOP_OF_HAT           2


#define FDUMMY_VOWEL    004000  /* Do not count this plosive release gesture */

#define FHYPHENATED     010000

#define FBLOCK          020000

#define PHO_FEA_MAX     14      /* # of features in struc[] structure   */
#define FMAXIMUM        037777  /* Any feature > this is illegal        */


/*              4.  Phonetic feature values allowed in featb[]          */

#define FSYLL   0000001 /* Syllabic: vowels + /el/, /em/, /en/          */
#define FVOICD  0000002 /* Regular, except /tq/ is [+voicd]             */
#define FVOWEL  0000004 /* Vowels                                       */
#define FSON1   0000010 /* [+sonor], except not /si/ and /h/            */
#define FSONOR  0000020 /* [-obst], except /q/ is [-sonor, -obst]       */
#define FOBST   0000040 /* Regular, except /q/ is [-obst]               */
#define FPLOSV  0000100 /* Plosives, excluding affricates               */
#define FNASAL  0000200 /* Nasals                                       */
#define FCONSON 0000400 /* [-syll], except for /si/ and /q/             */
#define FSONCON 0001000 /* Voiced liq. and glides: w, y, r, l, rx, lx   */
#define FSON2   0002000 /* /w, y, r, l, yu/, /m, n, ng, em, en/         */
#define FBURST  0004000 /* plosives and affricates                      */
#define FSTMARK 0010000 /* [', `, !]                                    */
#define FSTOP   0020000 /* Plosives, affricates, and nasals             */

/*              4.  Phonetic feature values allowed in place[]          */

#define FLABIAL 0000001         /* p, b, m, f, v                        */
#define FDENTAL 0000002         /* th, dh, d$                           */
#define FPALATL 0000004         /* sh, zh, ch, jh                       */
#define FALVEL  0000010         /* t, d, n, en, s, z, tx (not l,r,dx)   */
#define FVELAR  0000020         /* k, g, nx                             */
#define FGLOTAL 0000040         /* h, q, tq                             */
#define F2BACKI 0000100         /* iy, y, yu                            */
#define F2BACKF 0000200         /* iy, y, ey (not ay,oy)                */

#define IS_PLUS !=0     /* If feature value is plus, some bit is set    */
#define IS_MINUS ==0



/*              6. Various constants                                    */



#if defined (__osf__) || defined (__linux__) || defined _SPARC_SOLARIS_
#define NSAMP_FRAME     51              /* # of samples per output frame 8 KHz. */
#else
#define NSAMP_FRAME     64              /* # of samples per output frame 10 KHz. */
#endif

#ifdef MSDOS

#define VOICE_PARS      18              /* # of words in a voice block.         */
#define SPDEF_PARS      22              /* # of words in a speaker definition.  */

#else

#define VOICE_PARS      20              /* # of words in a voice block.         */
#define SPDEF_PARS      24              /* # of words in a speaker definition.  */
#define SYNC_PARS        0              /* There are no sync parameters. */
#define INDEX_PARS       2              /* # of words in an index mark block */
#define TONE_PARS        5              /* # of words in a tone packet */

#endif

#define NPHON_MAX       300     /* Size of phone[] and struc[] arrays.  */
#define MALLINE 9               /* # of parameters in a line of locus code(phrom.c)     */

#define DIV_BY8         >> 3
#define DIV_BY128       >> 7

#define MSTOFR(msec)    (((msec+4)*10)/NSAMP_FRAME)

/* Within the synthesizer, values are represented as fractions.
 * 1.0 is thus 2**14 == 040000 == 16384 */

#define FRAC_ONE        16384           /* 1.0                          */
#define FRAC_HALF        8192           /* 1.0 * 0.50                   */
#define FRAC_3_4THS     12288           /* 1.0 * 0.75                   */
#define FRAC_3_HALVES   24567           /* 1.0 * 1.50                   */

/* Used in PHSETTAR.C to determine type of current parameter:           */
/* (see also partyp[] in KLROM.C)                                       */

#define IS_AV_OR_AH             ==0
#define IS_NASAL_ZERO_FREQ      ==1
#define IS_PARALLEL_FORM_AMP    ==2
#define IS_FORM_FREQ            ==3
#define IS_FORM_BW              ==4
#define IS_FORM_FREQ_OR_BW       >2

/* Number of frames in xx milliseconds.  I.e., NF15MS is the number
 * of synthesizer frames in 15 msec. */

#define NF7MS           1
#define NF15MS  2
#define NF20MS  3
#define NF25MS  4
#define NF30MS  5
#define NF40MS  6
#define NF45MS  7
#define NF50MS  8
#define NF60MS  9
#define NF64MS  10
#define NF70MS  11
#define NF75MS  12
#define NF80MS  13
#define NF100MS 16
#define NF115MS 18
#define NF130MS 20
#define NF160MS 25
#define NF480MS 75
#define NF640MS 100



/* Fraction corresponding to xx percent of (1.0 = 16384) */

#define N10PRCNT         1638           /* 1.0 * 0.10                   */
#define N15PRCNT         2457           /* 1.0 * 0.15                   */
#define N25PRCNT         4096           /* 1.0 * 0.25                   */

#define N35PRCNT         6500           /* 1.0 * 0.25                   */
#define N50PRCNT         8192           /* 1.0 * 0.25                   */
#define N60PRCNT         9831           /* 1.0 * 0.60                   */
#define N70PRCNT        11469           /* 1.0 * 0.70                   */
#define N80PRCNT        13108           /* 1.0 * 0.80                   */
#define N85PRCNT        13927           /* 1.0 * 0.85                   */
#define N90PRCNT        13927           /* 1.0 * 0.90                   */
#define N100PRCNT       16384           /* 1.0                          */
#define N110PRCNT       18022           /* 1.0 * 1.10                   */
#define N120PRCNT       19661           /* 1.0 * 1.20                   */
#define N150PRCNT       24576           /* 1.0 * 1.50                   */
#define N160PRCNT       26215           /* 1.0 * 1.60                   */



/*
 * The parameter structure contains all information needed to compute
 * a synthesizer parameter.  Note, not all entries are used for all
 * parameters, but the structure is optimized for performance.
 */
typedef struct  Parameters {
	short   tarcur;         /* Current target value.                */
	short   durlin;         /* Duration of current dipthong line,   */
				/*  duration of phone if not dipthong.  */
	short   deldip;         /* Delta-value per update interval for  */
				/*  dipthong specification.             */
	short   dipcum;         /* Cumulative amount of dipthongization */
				/*  since start of straight line.       */
	short   ftran;          /* Forward transition                   */
	short   dftran;         /* Delta-value for forward transition   */
	short   btran;          /* Backward transition                  */
	short   dbtran;         /* Delta-value for backward transition  */
	short   tbacktr;        /* Beginning time of backward trans.,   */
				/*  relative to phoneme onset.          */
	short   tspesh;         /* Duration of special constant value   */
				/*  at beginning of phoneme.            */
	short   pspesh;         /* Value of special constant value at   */
				/*  beginning of phoneme.               */
	short   tarnex;         /* Next target value                    */
	short   tarlas;         /* Last target value                    */
	short   tarend;         /* End of last phonememe target value   */
	short   *ndip;          /* Pointer to dipthong specification in */
				/*  dipspec[] if any for this param.    */
	short   *outp;          /* Pointer to where the output goes.    */
}       PARAMETER;

/*
 * NOTE:        .durlin and .deldip apply only to
 *                      F1, F2, F3, B1, B2, and B3.
 *              .tspesh and .psepsh apply only to
 *                      B1, B2, AV, AP, A2, A3, A4, A5, A6, AB
 * Parameters are stored in param[].  The following define static pointers
 * to param[].  They are in order.
 */
#define PF0     param[F0]
#define PF1     param[F1]
#define PF2     param[F2]
#define PF3     param[F3]
#define PFZ     param[FZ]
#define PB1     param[B1]
#define PB2     param[B2]
#define PB3     param[B3]
#define PAV     param[AV]
#define PAP     param[AP]
#define PA2     param[A2]
#define PA3     param[A3]
#define PA4     param[A4]
#define PA5     param[A5]
#define PA6     param[A6]
#define PAB     param[AB]
#define PTILT   param[TILT]

/*              8.    Speaker definitions                               */

/*
 * This structure describes a
 * speaker. The first "SPDEF_PARS" words
 * are sent to the chip.  Note that the state
 * field is removed since the driver now appends 
 * it ... kak
 */
typedef struct  {
	short   r4cb;           /* Resonator 4, cascade, bandwidth      */
	short   r4cc;           /*                      center freq.    */
	short   r5cb;
	short   r5cc;
	short   r4pb;           /* Resonator 4, parallel, bandwidth     */
	short   r5pb;
	short   t0jit;          /* Jitter                               */
	short   r5ca;           /* Resonator 5, cascade, amplitude      */
	short   r4ca;
	short   r3ca;
	short   r2ca;
	short   r1ca;
	short   nopen1;
	short   nopen2;
	short   aturb;
	short   fnscale;
	short   afgain;
	short   rnpgain;
	short   azgain;
	short   apgain;
	short   notused;                /* was tltoff, Tilt offset      */
	short   osgain;
	short   speaker;
	short	sex;
}       SPD_CHIP;

#ifdef MSDOS
#define ZAPF    2500    /* Magic f value to zap b constant of diff eqn  */
#define ZAPB    2048    /* Magic bw value to zap c constant of diff eqn */
#else
#define ZAPF    6000    /* Magic f value to zap b constant of diff eqn  */
#define ZAPB    6000    /* Magic bw value to zap c constant of diff eqn */
#endif

#define F2max   2500    /* Limit to keep SPC from overloading           */
#define F3max   3500    /* Limit to keep SPC from overloading           */

#define MALE    1       /* Value of malfem for male voice               */
#define FEMALE  0       /* Value of malfem for female voice             */

#define NORMAL                  1 /* Implies rule-generated f0 (default) */
#define HAT_LOCATIONS_SPECIFIED 2 /* User specified location of hatrise/fall */
#define HAT_F0_SIZES_SPECIFIED  3 /* User attached steps and impulses to */
				  /*  hatrise, hatfall, and stress phones */
#define SINGING                 4 /* Implies user-requested sung notes */
#define PHONE_TARGETS_SPECIFIED 5 /* Implies user-spec f0 targets for phones */

#define SAFETY  8       /* Offset between shared arrays such as phonemes[SAFETY]
			 * and allophons[0] */

/*
 * Speaker def. limit table entry.
 */
typedef struct  {
	short   l_min;                  /* Minimum value                */
	short   l_max;                  /* Maximum value                */
}       LIMIT;

typedef struct  {
	short   i_offset;               /* Offset into "symbols"        */
	short   i_type;                 /* Type, "INDEX", "INDEX_REPLY" */
	short   i_value;                /* The value of the index       */
}       IQUEUE;

#define NIQUEUE 250                     /* # of index events            */
#define GUARD   25                                      /* WBOUND => COMMA guardband    */



/*
 *  math function prototypes ...
 */

/*#ifdef MSDOS*/

/*S32 klrmul(S32,S32);*/
/*S32 kllmul(S32, S32 *);*/
/*S32 klrdiv(S32,S32);*/
/*S32 klldiv(S32,S32 *);*/
/*short muldv();*/
/*short mulsh1();*/
/*short mulsh2();*/
/*short mulsh3();*/
/*short frac1mul();*/
/*short frac4mul();*/

/*#else*/

/* !! These definitions need to be checked to make sure they are right */

#define klrmul(x,y)     (x * y)
#define kllmul(x,y)     (x * (*y))
#define klrdiv(x,y)     (x / y)
#define klldiv(x,y)     (x / *y)
#define muldv()         ((arg1*arg2) / arg3)
#define mlsh1()         ((arg1*arg2) >> 14)
/*
#define mlsh2()         ((arg1*arg2) << 3)
#define mlsh3()         ((arg1*arg2) << 4)
 */

#define  frac4mul(x,y)  (((x)*(S32)(y))>>12)
#define  frac1mul(x,y)  (((x)*(S32)(y))>>15)

/*#endif*/  
/* #ifdef MSDOS */

/*#include "php.h"*/

/* 23-mar-95 cjl add endif to prevent multiple includes.*/
#endif
