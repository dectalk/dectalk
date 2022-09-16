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
 *    File Name:	par_ambi.c
 *    Author:		Matthew Schnee
 *    Creation Date:08/09/1996
 *
 *	  Functionality:       
 *		the ambiguous char table
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev	Who		Date    	Description
 *	---	-----	-----------	-----------------------------------------------
 *  001 SIK		10/10/1996  Add VOCAL #ifndef switch to support the VOCAL build 
 *	002	MGS		03/12/1998	Added code for the new binary parser
 *      003     CJL     03/18/1998      Removed specific path for dectalkf.h.
 *
 */

#include "dectalkf.h"

#if (!defined NEW_BINARY_PARSER) || (defined PARSER_COMPILER)

#include 	"port.h"

#include	"par_def.h"

/* 
 * this table is used in the parser to tell it when there is a possible ambiguity 
 * in the type being processed 
 */

#include "par_ambi.tab"
#endif //#if (!defined NEW_BINARY_PARSER) || (defined PARSER_COMPILER)
#endif /* end of #ifndef VOCAL */

