/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	lsacna.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  grab stuff from the lts directorys ...
 *
 ***********************************************************************
 *    Revision History:
 * 06-JAN-1995 Carl Leeber, corrected include for ltsr.h.
 */

#include "kernel.h"
#include	"lsconst.h"
#include	"lschar.h"
#include	"dict.h"
#include	"lsdefs.h"
#include	"ltsp.h"

#ifndef NULL
#define	NULL	0
#endif

/*
 * Language group identifiers.
 */

#define NAME_ENGLISH				0
#define NAME_FRENCH				1
#define NAME_GERMANIC			2
#define NAME_IRISH				3
#define NAME_ITALIAN				4
#define NAME_JAPANESE			5
#define NAME_SLAVIC				6
#define NAME_SPANISH				7

/*
 * The following masks are used in performing rule matching.
 */

#define M_R_LANG	0x7FFF		/* rule's language tag field */
#define M_R_SPECIFIC	0x8000		/* rule's specificity field */
