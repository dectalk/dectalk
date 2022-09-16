/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995-98. All rights reserved.
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
 *
 *	Created By:	Matthew Schnee
 *	Created On:	xx-mar-1998
 *
 *	Function:	DECtalk new features definitions file
 *
 ***********************************************************************
 *	Modification History
 * 001	10-mar-1998	cjl	Add copyright header.
 * 002	13mar98		tek	sapi group H (audio timing)
 * 003	03/13/1998	MGS	Added new parser
 * 004  03/16/1998  JAW Added comment about compiling under CE.
 * 005  03/25/1998  GL  Added DBGV command for debug variable passing
 * 006  03/31/1998  JAW BATS 637: Removed comment about compiling under
 *                      CE.
 * 007	04/02/1998  MGS	Added #ifndef NWSNOAA for the new parser
 *			Added FP_VTM for alpha builds
 * 008  04/03/1998	EAB Added new features required by German and needed by all languages NEW_VTM adds
 *					new capabilities to the vocal tract and NEW_INTONATION adds new flexiblity and control
 *					to the intonation routines and allows for seperate tuning of the female voice.
 * 009  04/29/1998  MGS Added NEW_BINARY_PARSER for GERMAN
 * 010  05/22/1998  MGS added FP_VTM for __osf__
 * 011	06/10/1998  MGS	added GERMAN_COMPOUND_NOUNS for german only
 * 012	06/11/1998  MGS Enabled GERMAN_COMPOUND_NOUNS
 * 0013 7/13/98		In process of switching code from old to new for English and Spanish.
 * 014	08/18/1998  MGS Enabled the new parser for all languages
 *			this fixes many bug in english and spanish as well as adding new functionality
 * 015 10/16/98 EAB Modified to support the latest levels of the languages
 * 016 10/26/98 EAB Add #define NEW_NOISE option to list
 * 017 10/27/98 EAB Add UK_ENGLISH to new base code stuff
 * 018 10/30/98 TK Add COMPRESSION option
 * 019 11/13/98 GL turn off NEW_VTM and NEW_INTONATION for US ENGLISH
 * 020 02/08/99 GL add NWS_LA and NWS_US support
 * 021 12/04/99	mfg shutoff LOWCOMPUTE for Windows CE
 *
 *
 ***********************************************************************
 */
#ifndef _DECTALK_H_
#define _DECTALK_H_

#define SAPI_MULTI_LANGUAGE_SUPPORT
#define SAPI_GROUP_F_INTERFACES
#define SAPI_GROUP_H_TIMING

#ifndef NWSNOAA
/* MGS 08/18/1998 enabeled new parser for all languages */
//#ifdef GERMAN
#define NEW_BINARY_PARSER
#define GERMAN_COMPOUND_NOUNS
//#endif
#endif

//#define NEW_PARSER_FILE_LOADING

#if defined ALPHA || defined __osf__
#define FP_VTM
#endif

// Bypass license validation checks in licenseu only.
// Used to generate registry values for a new release.
//#define VALIDATION_BYPASS

// Symbol for DBGV activation
//#define DBGV_ON



#if defined (GERMAN) || defined (SPANISH) 
//#if defined (GERMAN) || defined (ENGLISH_US) || defined (SPANISH) 
	/* Over time these features will be tested and propogated to all languages and ultimately it will
	eliminate the ifdef's (for example NWS NOAA will require both for improved female voices*/

#define NEW_VTM
			 /* EAB 5/11/98 This enables the new VTM control parameters and enabling code in both VTM and Ph
			for a 4.5 or NWS build this should not be defined, It is needed for German, others need checking*/

#define NEW_INTONATION 
				/* EAB 5/11/98 This enables the new ph_drwt0.c and ph_inton.c files which have been re-writen 
				to allow for greater intonational control and flexibility as weel as sperating the female voice from 
				the male voice. This should not be enabled for a 4.5 or NWSNOAA build. It is needed for the German
				and needs checking and tuning for others */

			// It is possible to understand speech with only F1 and F2(parrot speak)
#ifndef GERMAN //for rolling hte release back to 5.1
#define NEW_NOISE //Turns on new noise generator note it's level is different and it does
		//affect the speaker def tunings.
#endif

#endif
#define OLD_TILT // EAB 10/13/98 Forces  old style tilt filter until new one anaylsized and integrated

//#ifdef UNDER_CE

//#define LOWCOMPUTE //EAB 10/13/98 This removes the four times sample rate source generation
		//and decimation filter. All thing as considered I think this should always be turned on
//#define LOWER_YET  //eab 10.13.98 Lower the computes by removeing cascade f4 and f5
//#define LOWEST // EAB 10/13/98 Removes f4 and f5 of parallel tract

//#endif
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

