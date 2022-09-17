/* 
 ***********************************************************************
 *                                                                      
 *                           Coryright (c)                              
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.        
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
 * 0003		DR		09/30/1997		UK BUILD: added UK STUFF
 *  004     JAW     04/27/1998      Added limits for glottal speed and output gain multiplier.
 *  005     EAB		05/18/98		EAB Added new dvf files for new_intonation model
 */

#include "ph_def.h"

#ifdef NEW_INTONATION

#ifdef ENGLISH_US
#include "p_us_vdf1.c"
#endif
#ifdef ENGLISH_UK
#include "p_uk_vdf1.c"
#endif
#ifdef SPANISH         
#include "p_sp_vdf1.c"
#endif
#ifdef GERMAN
#include "p_gr_vdf1.c"
#endif

#else /* end NEW_INTONATION */

#ifdef ENGLISH_US
#include "p_us_vdf.c"
#endif
#ifdef ENGLISH_UK
#include "p_uk_vdf.c"
#endif
#ifdef SPANISH         
#include "p_sp_vdf.c"
#endif
#ifdef GERMAN
#include "p_gr_vdf.c"
#endif
#endif 

/* 
 * This table, indexed by the
 * speaker definition code (the "SP_" symbols),
 * is used to range check user specified voice
 * definition ":dv" commands.
 */
LIMIT limit[] =
{
	0, 1,							   /* SEX                  */
	0, 100,							   /* SM                   */
	0, 100,							   /* AS                   */
	50, 350,						   /* AP                   */
	0, 250,							   /* PR                   */
	0, 72,							   /* BR                   */
	0, 100,							   /* RI                   */
	0, 100,							   /* NF                   */
	0, 100,							   /* LA                   */
	65, 145,						   /* HS                   */
	2000, 4650,						   /* F4                   */
	100, ZAPB,						   /* B4                   */
	2500, 4950,						   /* F5                   */
	100, ZAPB,						   /* B5                   */
	2500, 4950,						   /* P4                   */
	2500, 4950,						   /* P5                   */
	0, 86,							   /* GF                   */
	0, 86,							   /* GH                   */
	0, 86,							   /* GV                   */
	0, 86,							   /* GN                   */
	0, 86,							   /* G1                   */
	0, 86,							   /* G2                   */
	0, 86,							   /* G3                   */
	0, 86,							   /* G4                   */
	0, 86,							   /* LO                   */
	0, 100,							   /* FT                   */
	0, 40,							   /* BF                   */
	0, 100,							   /* LX                   */
	0, 100,							   /* QU                   */
	2, 100,							   /* HR                   */
	1, 100,							   /* SR                   */
	0, 100,                            /* GS                   */
	-32768, 32767					   /* OS                   */
};

/* Variable Val (initially not defined) */
/* extern short var_val[SPDEF]; */
/* 
 * MVP : The following arrays are now made instance specific for MI:
 * voidef_8[], voidef[]
 */
