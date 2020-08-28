/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
 *    © SMART Modular Technologies, 2000. All rights reserved.	
 *    Copyright © 2000, 2001 Force Computers, Inc., a Solectron company. All rights reserved.
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
 *    File Name:    ph_vdefi.c
 *    Author:       Matthew Schnee                                       
 *    Creation Date:06/04/1996                                           
 *                                                                       
 *    Functionality:                                                     
 *  	Speaker voice definition file for multi language
 *                                                                       
 *********************************************************************** 
 *                                                                       
 *  Rev 	Who     Date        	Description
 *  --- 	-----   ----------- 	---------------------------------------
 *  001 	MGS		07/18/1996	    Merged from ph_vdef.c, sph_vdef.c, gph_vdef.c
 *  002		GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if"
 *  003		DR		09/30/1997		UK BUILD: added UK STUFF
 *  004     JAW     04/27/1998      Added limits for glottal speed and output gain multiplier.
 *  005     EAB		05/18/1998		EAB Added new dvf files for new_intonation model
 *  006	    MFG		06/18/1998		SPANISH_SP & SPANISH_LA support added
 *  007     MGS		11/03/1998		BATS #782
 *  008     EAB		11/16/1998		BATS 804 limit checking of internal speaker defs when
 *									debug enabled (should NEVER fire in a checked in file ideally)
 *									but the new code did already find a bad parameter already
 *									This code be improved by taking into account sample rate and
 *									to check for max value seperate from ZAPF on formants
 *  009		EAB		02/18/1999		Restructure to allow for new vdef files as needed
 *									Other chnages in DECTALKF.H
 *	010		EAB		03/19/1999		Modified to suport tuning files for the nws build
 *	011		NAL		01/24/1900		Modified to include vdf for tuned params for each lang
 *	012		CHJ		07/20/1900		French added
 *  013 	CAB		10/18/2000		Changed copyright info and formatted comments
 *	014		MFG		05/29/2001		Included dectalkf.h
 * 	015		CAB		06/01/2001		Updated copyright info
 */


#include "dectalkf.h"
#include "ph_def.h"


#ifdef FRENCH
#include "p_us_vdf1.c"
#else
#include "p_us_vdf1.c"
#endif


#ifdef HLSYN
#include "p_us_vdf_tunehl.c"
#include "p_fr_vdf_tunehl.c"
#ifndef EPSON_ARM7
#include "p_uk_vdf_tunehl.c"
#include "p_sp_vdf_tunehl.c"
#include "p_la_vdf_tunehl.c"
#include "p_gr_vdf_tunehl.c"
#endif
#else
#include "p_us_vdf_tuneint.c"
#include "p_fr_vdf_tuneint.c"
#include "p_uk_vdf_tuneint.c"
#include "p_sp_vdf_tuneint.c"
#include "p_la_vdf_tuneint.c"
#include "p_gr_vdf_tuneint.c"


#endif

#ifdef EPSON_ARM7
const short			default_tune[SPDEF] =
{
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
#ifndef MSDOS
	0
#endif
};


const short			fr_default_tune[SPDEF] =
{
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	/*65-60+*/7-    7,		
	/*68-71+*/15-  16,		
	/*68-71+*/19-  16,		
	/*60-65+*/1-   -1,		
	/*49-65+*/19-   4,		
	/*64-66+*/-8- -11,	
	/*86-70+*/-7-  11,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
	0,		
#ifndef MSDOS
	0,		
#endif
};


#endif


#ifndef HLSYN


#ifdef outfornow

#ifdef ENGLISH_US
#include "p_us_vdf1.c"
#endif
#ifdef ENGLISH_UK
#include "p_uk_vdf1.c"
#endif
#ifdef SPANISH_SP
#include "p_sp_vdf1.c"

#endif
#ifdef SPANISH_LA
#include "p_la_vdf1.c"

#endif
#ifdef GERMAN
#include "p_gr_vdf1.c"

#endif
#ifdef FRENCH
#include "p_fr_vdf1.c"

#endif

#endif




#endif //HLSYN


/*
 * This table, indexed by the
 * speaker definition code (the "SP_" symbols),
 * is used to range check user specified voice
 * definition ":dv" commands.
 */
	//EAB 11/16/98 Changed some limits that were incorrect (ZAPF is the largest value not 4950 (which is
	//only true at 10 Khz anyway plus amptable goes to 97 not 86
	// Part of BATS 804
const LIMIT limit[] =
{
	0, 1,							   /* SEX                  */
	0, 100,							   /* SM                   */
	0, 200,							   /* AS                   */
	50, 350,						   /* AP                   */
	0, 250,							   /* PR                   */
	0, 72,							   /* BR                   */
	0, 100,							   /* RI                   */
	0, 100,							   /* NF                   */
	0, 100,							   /* LA                   */
	65, 145,						   /* HS                   */
	2000, ZAPF,						   /* F4                   */
	100, ZAPB,						   /* B4                   */
	2500, ZAPF,						   /* F5                   */
	100, ZAPB,						   /* B5                   */
	2500, ZAPF,						   /* P4                   */
	2500, ZAPF,						   /* P5                   */
	0, 87,							   /* GF                   */
	0, 87,							   /* GH                   */
	0, 87,							   /* GV                   */
	0, 87,							   /* GN                   */
	0, 87,							   /* G1                   */
	0, 87,							   /* G2                   */
	0, 87,							   /* G3                   */
	0, 87,							   /* G4                   */
	0, 87,							   /* LO                   */
	0, 100,							   /* FT                   */
	0, 90,							   /* BF                   */
	0, 100,							   /* LX                   */
	0, 100,							   /* QU                   */
	2, 100,							   /* HR                   */
	1, 100,							   /* SR                   */
	0, 1500,                           /* ago                   */
	0, 1800,                           /* agvo                   */
	0, 3000,						   /* aguo                   */
	0, 3000,							   /* area of chink                   */
	1, 100,							   /* open quotient                  */
	-32768, 32767,					   /* OS                   */
	0, 8							   /* NM				   */

};

/* Variable Val (initially not defined) */
/* extern short var_val[SPDEF]; */
/*
 * MVP : The following arrays are now made instance specific for MI:
 * voidef_8[], voidef[]
 */

