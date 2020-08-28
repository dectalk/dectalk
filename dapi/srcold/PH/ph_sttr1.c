/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *	001	MGS		04/06/1996		file created
 *  002	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 *  003	DR		09/30/1997		UK BUILD: added UK STUFF
 *  004	MFG		06/18/1998		SPANISH_SP & SPANISH_LA support added
 *  005	EAB		06/28/2000		Unified Phoneme Set Changes
 *  006 CAB		10/18/2000		Changed copyright info and formatted comments
 */
  

#ifdef NEW_NASAL
#include "p_us_st2.c"
#else
#include "p_us_st1.c"
#endif //NEW_NASAL

#ifdef NEW_NASAL
#include "p_uk_st2.c"
#else
#include "p_uk_st1.c"
#endif



#ifdef NEW_NASAL
#include "p_sp_st2.c"
#else
#include "p_sp_st1.c"
#endif


#ifdef NEW_NASAL
#include "p_la_st2.c"
#else
#include "p_la_st1.c"
#endif



#ifdef NEW_NASAL
#include "p_gr_st2.c"
#else
#include "p_gr_st1.c"
#endif


#ifdef NEW_NASAL
#include "p_fr_st2.c"
#else
#include "p_fr_st1.c"
#endif
