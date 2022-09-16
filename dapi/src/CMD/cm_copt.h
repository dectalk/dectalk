 /*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved. 
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	cm_copt.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Catches language-dependent code for cm_copt.c
 ***********************************************************************
 *    Revision History:
 *
 * Rev	Who		Date		Description
 * ---- -----	-------		----------------------------------------
 * 001	GL		08/05/96		Add language switch
 * 002  DR		09/30/1997		UK BUILD: added UK STUFF
 * 003	MFG		06/18/1998		SPANISH_SP & SPANISH_LA support added
 * 004	MGS		04/13/2000		Changes for integrated phoneme set 
 * 005  CHJ     07/20/2000      FRENCH support added
 * 006 	CAB		10/16/00		Changed copyright info
 */
#ifndef CMCOPTH
#define CMCOPTH 1

#ifdef NEW_PHONES
#include "l_all_ph.h"
#else
#ifdef ENGLISH_US
#include "l_us_ph.h"
#endif
#ifdef ENGLISH_UK
#include "l_uk_ph.h"
#endif
#ifdef SPANISH_SP
#include "l_sp_ph.h"
#endif
#ifdef SPANISH_LA
#include "l_la_ph.h"
#endif
#ifdef GERMAN
#include "l_gr_ph.h"
#endif
#ifdef FRENCH
#include "l_fr_ph.h"
#endif

#endif	// NEW_PHONES

#endif
