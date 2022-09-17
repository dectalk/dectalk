#ifndef VOCAL
/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
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
 *  001 SIK		10/10/96	Add VOCAL #ifndef switch to support the VOCAL build 
 *  002 GL		10/22/97	Add NWSNOAA #ifdef switch to support the NWSNOAA build 
 *	003	MGS		03/12/1998	Added code for the new binary parser
 *      004     CJL     03/18/98        Removed specific path for dectalkf.h.
 *
 */


#include "dectalkf.h"

#include 	"port.h"

#include	"par_def.h"

#ifdef NEW_BINARY_PARSER
#ifdef NWSNOAA
#include 	"par_nws1.h"
#else
#include 	"par_rule1.h"
#endif

#else

#ifdef NWSNOAA
#include 	"par_nws.h"
#else
#include 	"par_rule.h"
#endif
#endif

#endif
