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
 *    File Name:        start_sp.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Start up message program.
 *
 ***********************************************************************
 *    Revision History:
 *
 * 06-JAN-1995 Carl Leeber, Removed include of dtstap.h.
 * 10-FEB-1995 Carl Leeber, Merged spanish and english setups
 * 13-JUN-1995 Carl Leeber, Add automatic prototype file sdtstarp.h.
 * 14-JUN-1995 Carl Leeber, Add support from DTCOMMON.
 * 10-Dec-1996 Ginger Lin,  Fix the text error
 * 31-DEC-1997 Carl Leeber, Change version 4.5.
 * 30-NOV-1998 Carl Leeber, Change version 4.6.
 */

#include <stdio.h>
#include "dttsr.h" 
#include <string.h>
#include "sdtstarp.h"
#include "dtstart.h"

void main(int argc,char *argv[])
{
  strcpy  (defbuf, "DECtalk PC versi¢n 4 punto 6, est  op‚rationnel. ");
	dtstart(argc,argv);
}
