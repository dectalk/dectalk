/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000, 2001 Force computers Inc., a Solectron Company. All rights reserved. 
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
 *    File Name:        cm_def.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Contains all common #include directives 
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev	Who     Date            Description
 * ---  -----   -----------     -----------------------------------------
 * 001  MGS     04/22/1996      Added WIN32 includes and cmd.h
 * 002	SIK	    09/23/1996	    remove NEW_INDEX definition if in VOCAL mode
 * 003	GL	    04/21/1997	    BATS#357  Add the code for __osf__ build 
 * 004 	GL	    04/21/1997	    BATS#360  remove spaces before "#define" or "#if" 
 * 005  ETT		10/05/1998 	   	added linux code
 * 006	ETT		11/19/1999		fixed stuff for osf...
 * 007	MGS		04/13/2000		Changes for integrated phoneme set 
 * 008 	CAB		10/16/2000		Changed copyright info
 * 009	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 010	CAB		05/14/2001		Updated copyright info
 * 011	MGS		06/19/2001		Solaris Port BATS#972
 */              
#ifndef CMDEFH
#define CMDEFH 1

#include "dectalk.h"
 
#ifdef WIN32
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include "tts.h"
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#include <stdio.h>
#include <string.h>
#include "tts.h"
#endif

#include "l_all_ph.h"
#include "defs.h"
#include "port.h"
#include "kernel.h"
#include "cm_defs.h"
#include "par_def.h"
#include "cm_data.h"
#include "cm_prot.h"
#include "esc.h"
#include "cmd.h"
#include "iso_char.h"

#ifdef VOCAL
#define SPAN_TEXTPRE_BYPASS
#else
#define NEW_INDEXING
#endif

/* GL 04/21/1997  add this for OSF build */
#ifdef PRINTFDEBUG
#ifdef WIN32
#define printf WINprintf
#endif
#if defined (MSDOS) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#define WINprintf printf
#endif
#endif

#endif
