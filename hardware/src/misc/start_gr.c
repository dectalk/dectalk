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
 *    File Name:        start_gr.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Start up message program.
 *
 ***********************************************************************
 *    Revision History:
 *
 * 13-JUN-1995 Carl Leeber, Add automatic prototype file gdtstarp.h.
 * 14-JUN-1995 Carl Leeber, Add support from DTCOMMON. Msg in Spanish!
 * 01-Nov-1995 Ginger Lin, use the correct German greeting.
 *                    use leuft to replace läuft.  "ä" can not process
 *                    by program at this point
 * 31-Dec-1997 Carl Leeber. Change version to 4.5.
 * 30-Nov-1998 Carl Leeber. Change version to 4.6.
 */

#include <stdio.h>
#include "dttsr.h"
#include <string.h>
#include "gdtstarp.h"
#include "dtstart.h"

void main(int argc,char *argv[])
{
        strcpy(defbuf,"DECtalk PC Version 4 Punkt 6 leuft. ");
	dtstart(argc,argv);
}
