/* 
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1998. All rights reserved.
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
 *    File Name:    ph_pros.c
 *    Author:       Matthew Schnee
 *    Creation Date:03-mar-1998
 *
 *    Functionality:
 *  	Controls which files get included for re-write of new prosody files
 *
 ***********************************************************************
 *    Revision History:
 *	Rev	Who		Date		Description
 *	---	-----	-----------	--------------------------------------------
 *	001  EAB	03-11-98	Initial creation, at the moment the only new prosodic files are ph_inton and ph_draw
 */




 
#include "dectalkf.h"


#ifdef NEW_INTONATION
#include "ph_inton2.c"
#else
#include "ph_inton1.c"
#endif



