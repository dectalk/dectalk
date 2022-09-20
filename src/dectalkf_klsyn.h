/*
 ***********************************************************************
 *
 *                           Copyright ©  
 *	  Copyright © 2000-2001 Force Computers, a Solectron Company. All rights reserved. 
 *    © Digital Equipment Corporation 1995-98. All rights reserved.
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
 *
 *	Created By:	Matthew Schnee
 *	Created On:	xx-mar-1998
 *
 *	Function:	DECtalk new features definitions file
 *
 ***********************************************************************
 *	Modification History
 * 001	03/10/1998	cjl		Add copyright header.
 * 002	03/13/1998	tek		sapi group H (audio timing)
 * 003	03/13/1998	MGS		Added new parser
 * 004  03/16/1998  JAW 	Added comment about compiling under CE.
 * 005  03/25/1998  GL  	Added DBGV command for debug variable passing
 * 006  03/31/1998  JAW 	BATS 637: Removed comment about compiling under
 *                      	CE.
 * 007	04/02/1998  MGS		Added #ifndef NWSNOAA for the new parser
 *							Added FP_VTM for alpha builds
 * 008  04/03/1998	EAB 	Added new features required by German and needed by all languages NEW_VTM adds
 *							new capabilities to the vocal tract and NEW_INTONATION adds new flexiblity and control
 *							to the intonation routines and allows for seperate tuning of the female voice.
 * 009  04/29/1998  MGS 	Added NEW_BINARY_PARSER for GERMAN
 * 010  05/22/1998  MGS 	added FP_VTM for __osf__
 * 011	06/10/1998  MGS		added GERMAN_COMPOUND_NOUNS for german only
 * 012	06/11/1998  MGS 	Enabled GERMAN_COMPOUND_NOUNS
 * 013 	07/13/1998			In process of switching code from old to new for English and Spanish.
 * 014	08/18/1998  MGS 	Enabled the new parser for all languages
 *							this fixes many bug in english and spanish as well as adding new functionality
 * 015 	10/16/1998 	EAB 	Modified to support the latest levels of the languages
 * 016 	10/26/1998 	EAB 	Add #define NEW_NOISE option to list
 * 017	10/27/1998 	EAB 	Add UK_ENGLISH to new base code stuff
 * 018 	10/30/1998 	TK 		Add COMPRESSION option
 * 019 	11/13/1998 	GL 		turn off NEW_VTM and NEW_INTONATION for US ENGLISH
 * 020 	02/08/1999 	GL 		add NWS_LA and NWS_US support
 * 021 	02/09/1999 	EAB 	Changed OLD_TILT to NEW_TILT to follow convention of 
 *		    				enabling new functions
 * 022 	02/10/1999 			Opps wanted new_tilt disabled for submital until it's checked out
 * 023 	02/12/1999	EAB 	Added comments and chnaged one ifdef
 * 024 	02/22/1999 			Modified to support new ad_buid and multiple vdef files
							and turned off ad for defalt
   025 	02/23/1999 	EAB 	spanish should include latin as well for the vdef file
   026 	03/19/1999 	EAB 	Fixed for NWSNOAA plus fixed bug in spanish an german 
							vdef fetch also nwsnoaa needs to fetch yet another vdef file
   027 	03/19/1999 	EAB 	Added chages to support the 16 build for Noaa SPanish inluding
							a new nwsnoaa tuning file set
   028 	03/22/1999 	EAB 	In process broke ad_base builds so fixed that
   029 	02/22/1999 	EAB 	Added code to support Wang's closing time work you get this
							if you dont define new_tilt and define closing_time
 * 021 	12/04/1999	mfg 	shutoff LOWCOMPUTE for Windows CE
 * 022 	03/13/2000	mfg 	turned of AD_BASE for MSDOS build
 * 023	04/13/2000	MGS		Changes for integrated phoneme set 
 * 024 	05/09/2000  EAB  	Adjusted new level tuning base.
 * 025 	10/16/2000	CAB		Added copyright info
 * 026  01/15/2001 	EAb 	Turned on new_noise for all languages may cause short term burp but needed
							// ditto for new_tilt
 * 027	01/29/2001	CAB		Updated copyright info
 * 028	05/09/2001	MGS		Access32 Merge BATS#972
 * 029  07/09/2001  CAB		Exclude access32 for SAPI5
 * 030	07/26/2001	CAB		Exclude HLSYN for Windows CE
 * 031  07/30/2001  CAB		Defined SLOWTALK
 * 032	02/26/2002	MGS	ACNA changes
 * 033	07/17/2002	MFG		Included HLSYN for Windows CE
 * 034	09/24/2002  MFG		set CUP28PROJECt for the mitsubichi build
 * 035	05/08/2003	MFG		defined LOWCOMPUTE_MITSU for WINCE to lower computes
 *
 *
 ***********************************************************************
 */

#ifndef _DECTALK_H_
#define _DECTALK_H_

#define SAPI_MULTI_LANGUAGE_SUPPORT
#define SAPI_GROUP_F_INTERFACES
#define SAPI_GROUP_H_TIMING

//#ifndef NWSNOAA
/* MGS 08/18/1998 enabeled new parser for all languages */

//#define GWMICRO 1
#define NEW_BINARY_PARSER
#define GERMAN_COMPOUND_NOUNS

#ifndef ARM7
#ifdef _DEBUG
#define PH_DEBUG
#endif
#endif

#ifdef EPSON_ARM7
#include "ltsnames.h"
#endif

//#define FAKE_HLSYN
//#define HLSYN
//#ifndef SAPI5DECTALK

#ifdef EPSON_ARM7
#define HLSYN
#endif

#ifdef ACCESS_SOLUTIONS
#undef HLSYN
#endif


//#define NEW_PARSER_FILE_LOADING

/* LTS stuff */
//#define NEW_LTS

#ifdef ENGLISH
#define NEW_ACNA
#endif

#ifdef _APPLE_MAC_
#define USE_PORTAUDIO
#endif

//#define UPGRADES1999

#ifndef SAPI5DECTALK
// Turn on ACCESS32, TYPING_MODE, and SLOWTALK
#ifndef ARM7
#ifndef ACCESS32
#define ACCESS32
#endif

#ifndef TYPING_MODE
#define TYPING_MODE
#endif
#endif

#ifndef SLOWTALK
#define SLOWTALK
#endif

#endif	// SAPI5DECTALK


#define NEW_PHONES

#if defined ALPHA || defined __osf__ 
#define FP_VTM
#endif

//#define TONGUE_BODY_AREA

// Bypass license validation checks in licenseu only.
// Used to generate registry values for a new release.
//#define VALIDATION_BYPASS

// Symbol for DBGV activation
//#define DBGV_ON

/* The tuning files vary based on language and whether or not anything has changed
 as literally changing anything could cause a new tuning to be needed
Therefore do the documentation and callout here.
On tuning for AD it will give the first letters of the voice(s) that should be reasonable
if any.

LANGUAGE	VDEF_FILE	TUNING UP	VDEF_FILE	TUNING UP
			Source FOR	 TO DATE	SOURCE FOR	 UP TO DATE
			RELEASE					AD

 US			P_US_VDF.C		YES		P_US_VD1.C	 P,B
 SP			P_SP_VDF1.C		YES		P_SP_VD2.C	 no
 LA			P_LA_VDF1.C		YES		P_LA_VD2.C	 no
 GR			P_GR_VDF1.C		YES		P_GR_VD2.C	 no
 UK			P_UK_VDF.C		YES		P_UK_VD1.C	 no
 
   Below will call out the appropriate USE_VDEFXXX and global callout for USEVDEF
   so the default if nothing defined is the base level _vdef.c version
*/

#ifndef MSDOS
#define AD_BASE //Turns on advanced development build
#endif

#ifdef AD_BASE
//#define NEW_VOCAL_TRACT
#endif

#define SINGLE_THREADED


//#define NEW_VTM


			 /* EAB 5/11/98 This enables the new VTM control parameters and enabling code in both VTM and Ph
			for a 4.5 or NWS build this should not be defined. It is needed for German, others need checking*/
//#define NEW_TILT // EAB 2/9/99 Use new tilt filter-but not for Spanish and German

#define NEW_INTONATION 

//#define NEW_NOISE //Turns on new noise generator note it's level is different and it does
		//affect the speaker def tunings.
//#define LOWCOMPUTE //EAB 6/12/03 Until we get it solved this is on to to downsampling filter 
	// problems 
//#define TOMBUCHLER
//#define TESTING

#if defined UNDER_CE
/* THIS MUST BE LEFT DEFINED FOR ARM7 AND CE !!!!!!!!!!!!!!!!!!! */

#define LOWCOMPUTE_MITSU //MFG 05/06/02 needed for windoe ce to lower computes
			//Note EAB May 9,2000 Now everything should have LowCompute
#endif


/* TK 12/30/98, new switch for voice compression */ 
//#define COMPRESSION


#if defined (NWSNOAA) && defined (SPANISH_LA)
#define NWS_LA
#endif

/* Try to make the parser compatible with older songs,
 * prevents 'command error in phoneme' when encountering 'l' instead of 'll' */
#define PARSER_HACK_FOR_OLD_SONGS
#define VTM1
// try to find/revert various code changes after v4.3, breaks different functionality but fixes other :-/
//#define CHANGES_AFTER_V43

// changes which make it sound more like 4.4 (only works when CHANGES_AFTER_43 is not defined!)
//#define CHANGES_FOR_V44

// Use old intonation and timing code, still work in progress
#define OLD_INTONATION_AND_TIMING

// Which voice to use (default when not defined is 4.3)
// VDF_DECTALKEXPRESS_42 -> DECtalk Express 4.2a
// VDF_DECTALKEXPRESS_42CD -> DECtalk Express 4.2cd
// VDF_DECTALK_44 -> DECtalk speak window 4.4
// VDF_BETA5 -> VDF for non-hlsyn included in beta 5
// nothing -> DECtalk speak window 4.3 (exactly the same as DEC ALPHA 4.2)
//#define VDF_DECTALKEXPRESS_42
//#define VDF_DECTALKEXPRESS_42CD
//#define VDF_DECTALK_44
//#define VDF_BETA5

// Which voice rom to use
// VOICE_ROM_1997 -> voice rom from around 1997, probably 4.60
// VOICE_ROM_1996 -> voice rom from around 1996, unknown version
// nothing -> voice rom generated from 88_mal and 88_fem
//#define VOICE_ROM_1997
#define VOICE_ROM_1996

#if defined(VOICE_ROM_1997) || defined(VOICE_ROM_1996)
// Decrease /s, z/ amplification in VOICE_ROM_1996/7
#define DEC_SZ 3

// Use old implementation of setting target value for us-english, use with 1996/7 voice roms, wip
#define OLD_SETTAR
#endif

// Disable limit cycle rampdown code.
// This squelches filter-output in passages without speech (originally
// added after 4.4), fixes artefacts in pauses. Should be left undefined
// except if diagnosing cut-off problems.
// #define NO_LIMIT_CYCLE_RAMPDOWN

#endif // _DECTALK_H_
