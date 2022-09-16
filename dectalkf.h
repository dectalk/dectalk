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


//#ifdef GERMAN
#define NEW_BINARY_PARSER
#define GERMAN_COMPOUND_NOUNS
//#endif
//#endif
#ifdef _DEBUG
#define PH_DEBUG
#endif
#ifdef ENGLISH_US
//#define HLSYN
//#define FP_VTM
#endif
//#define NEW_PARSER_FILE_LOADING


#define NEW_PHONES

#if defined ALPHA || defined __osf__ 
#define FP_VTM
#endif

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
#define NEW_VOCAL_TRACT
#endif

#if  ( (defined (GERMAN)||defined (SPANISH) ) || defined AD_BASE )
//Use the following line for AD code - we're basically at a base level now


	/* Over time these features will be tested and propogated to all languages and ultimately it will
	eliminate the ifdef's (for example NWS NOAA will require both for improved female voices*/

#ifndef NWSNOAA_no_longer
#define USE_VDEF //Define to say that a vdef file has been specifified

#if ( defined GERMAN || defined SPANISH )
#ifdef AD_BASE
#define USE_VDEF2
#else
#define USE_VDEF1
#endif //ad_base
#else
#ifdef AD_BASE
#define USE_VDEF1
#endif /ad_base
#endif // german or spanish



//#define NEW_VTM
			 /* EAB 5/11/98 This enables the new VTM control parameters and enabling code in both VTM and Ph
			for a 4.5 or NWS build this should not be defined, It is needed for German, others need checking*/
#endif //NWSNOAA

#define NEW_INTONATION 
				/* EAB 5/11/98 This enables the new ph_drwt0.c and ph_inton.c files which have been re-writen 
				to allow for greater intonational control and flexibility as weel as sperating the female voice from 
				the male voice. This should not be enabled for a 4.5 or NWSNOAA build. It is needed for the German
				and needs checking and tuning for others */
     			//EAB 02/18/99 The Spanish and German need to be re-verified
	     		// to insure we have'n broken anything
#ifndef NWSNOAA



			// It is possible to understand speech with only F1 and F2(parrot speak)
//#define NEW_NOISE //Turns on new noise generator note it's level is different and it does
		//affect the speaker def tunings.
#define NEW_TILT // EAB 2/9/99 Use new tilt filter-but not for Spanish and German

#endif //german spanish or AD_BASE
#endif //nwsnoaa

#ifndef NWSNOAA_nolonger
#ifndef USE_VDEF
#if (defined (GERMAN) || defined (SPANISH))
#define USE_VDEF1
#else
#define USEVDEF_BASE
#endif //german or spanish
#endif //use-vdef
#else	//nwsnoaa
#define USE_NWS_TUNE
#endif //NWSNOAA


#if (defined NEW_TILT || defined CLOSING_TIME)
#define UPGRADES1999
#ifndef NEW_VTM
#define NEW_VTM
#endif
//Note UPGRADES1999 should  be defined if NEW_TILT used
//Upgrades1999 can be used without NEW_TILT
// also new_tilt needs NEW_VTM
#endif

//#define LOWCOMPUTE //EAB 10/13/98 This removes the four times sample rate source generation
			//Note EAB May 9,2000 Now everything should have LowCompute

#ifdef UNDER_CE

//#define LOWER_YET  //eab 10.13.98 Lower the computes by removeing cascade f4 and f5
//#define LOWEST // EAB 10/13/98 Removes f4 and f5 of parallel tract

#endif
/* TK 12/30/98, new switch for voice compression */ 
//#define COMPRESSION

/* GL 02/08/99, add NWS_US and NWS_LA support */
#if defined (NWSNOAA) && defined (ENGLISH_US)
#define NWS_US
#endif
#if defined (NWSNOAA) && defined (SPANISH_LA)
#define NWS_LA
#endif


#endif // _DECTALK_H_

