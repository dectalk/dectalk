/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved. 
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
 *    File Name:	vfphdefs.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 * 0001  1-Sep-84 	DK    	Initial creation
 * 0002 27-Dec-84 	DGC   	Moved some stuff to defs.h for 80186
 * 0003 19-Jan-85 	DGC   	Moved the LIMIT structure def. to here.
 * 0004 19-Feb-85 	DK    	Rename spdef variables not sent to chip, add tltoff
 * 0005 28-Feb-85 	DK    	Define a few more constants, new place[] features
 * 0006 06-Mar-85 	DGC   	Added system call PUTSEQ.
 * 0007 24-Jul-85 	DK    	Remove tltoff from set of spdefs sent to chip
 *                      	rename OUTPAR structure to be parstochip[] array
 * 0008 23-Mar-95 	CJL   	Rename this file from PHDEFS.H to VIPHDEFS.H,
 *                      	add comments, add #define to exclude multiple includes.
 * 0009 31-Mar-95 	CJL   	Rename this file from VIPHDEFS.H to VFPHDEFS.H,
 *                      	add comments, add #define to exclude multiple includes.                                                                             
 * 0010 16-JAN-96 	SIK 	Removed white space inbetween # and include in places
 * 					  		where #include is commented out.
 * 0011	10/05/1998 	ETT		Added Linux code.
 * 0012	09/21/2000	CAB		Fixed copyright info and formatted comment section.
 */

#ifndef VFPHDEFS_H
#define VFPHDEFS_H

/* 31-Mar-95 CJL the space in # include is to turn off depend.exe for process.*/
/* 16-JAN-96 SIK Removed white space inbetween # and include in places
 * 					  where #include is commented out.  */
/*#include "port.h"*/
#include "ph_defs.h"

#endif