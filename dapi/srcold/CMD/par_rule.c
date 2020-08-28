#ifndef VOCAL
/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers Inc., a Solectron company. All rights reserved.
 *    Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
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
 *    File Name:	par_rule.c
 *    Author:		Matthew Schnee
 *    Creation Date:7/26/96
 *
 *	  Functionality:       
 *		this file is here to be able to compile the rule table 
 *		by itself and link it with the rest of the parser.
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev	Who		Date    	Description
 *	---	-----	-----------	-----------------------------------------------
 *	001	SIK		10/10/1996	Add VOCAL #ifndef switch to support the VOCAL build 
 *	002	GL		10/22/1997	Add NWSNOAA #ifdef switch to support the NWSNOAA build 
 *	003	MGS		03/12/1998	Added code for the new binary parser
 *	004	CJL		03/18/1998	Removed specific path for dectalkf.h.
 *	005	MGS		06/08/1998	Added code for German Compound Nouns
 *	006	MGS		06/11/1998	removed german compound noun tables from all MSDOS builds
 *							The dummy table is used instead
 *	007	MGS		07/02/1998	changed dummy file to comp_dum.h
 *	008	MGS		01/09/2001	Fixed NWSNOAA builds with GERMAN_COMPOUND_NOUNS
 *	009	CAB		01/19/2001	Fixed copyright info
 *	010	MGS		06/19/2001	Solaris Port BATS#972
 *
 */


#include "dectalkf.h"

#include 	"port.h"

#include	"par_def.h"

#ifdef NEW_BINARY_PARSER

#ifdef GERMAN_COMPOUND_NOUNS
#include "comp_dum.h"
#endif //GERMAN_COMPOUND_NOUNS

#ifdef _BIGENDIAN_
#include "par_rule2b.h"
#else //_big
#include "par_rule2.h"
#endif

#else // NEW_BINARY_PARSER

#include 	"par_rule.h"


#endif // NEW_BINARY_PARSER
#endif //vocal