/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1998. All rights reserved.
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
 *	001  EAB	03/11/1998	Initial creation, at the moment the only new prosodic files are ph_inton and ph_draw
 *  002  CAB	10/18/2000	Changed copyright info and formatted comments
 *  003  CAB	01/15/2001	Merged changes for Michel Divay for French.
 */

#include "dectalkf.h"

#ifdef FRENCH
// really too different to be merged  Michel
#include "ph_fr_inton2.c"
#else
#include "ph_inton2.c"
#endif


