/* 
 ***********************************************************************
 *
 *                           Copyright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:    ph_sttr1.c
 *    Author:		Matthew Schnee
 *    Creation Date:04-Jun-1996
 *
 *    Functionality:
 *		phsettar.c include file for language specific functions
 *
 ***********************************************************************
 *
 *	Rev	Who		Date			Description
 *	---	-----	-----------		--------------------------------------------
 *	001	MGS		04-Jun-1996		file created
 *  002	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 *  003 DR		09/30/1997		UK BUILD: added UK STUFF
 *  004	MFG		06/18/1998		SPANISH_SP & SPANISH_LA support added
 */
  
#ifdef ENGLISH_US
#ifdef NEW_NASAL
#include "p_us_st2.c"
#else
#include "p_us_st1.c"
#endif //NEW_NASAL
#endif

#ifdef ENGLISH_UK
#ifdef NEW_NASAL
#include "p_uk_st2.c"
#else
#include "p_uk_st1.c"
#endif
#endif

#ifdef SPANISH_SP
#ifdef NEW_NASAL
#include "p_sp_st2.c"
#else
#include "p_sp_st1.c"
#endif
#endif

#ifdef SPANISH_LA   
#ifdef NEW_NASAL
#include "p_la_st2.c"
#else
#include "p_la_st1.c"
#endif
#endif

#ifdef GERMAN
#ifdef NEW_NASAL
#include "p_gr_st2.c"
#else
#include "p_gr_st1.c"
#endif
#endif

