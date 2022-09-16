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
 *    File Name:	viport.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * DECtalk porting specific header file
 *
 ***********************************************************************
 *    Revision History:
 * 0001 23-MAR-95 CJL, Add comments, renam this file from port.h
 *                      to viport.h, changed VI_PORT_H to VIPORT_H.
 *						Move UINT, DWORD, MAXIMUM_FRAME_SIZE,
 *						SAMPLE_RATE_INCREASE, SAMPLE_RATE_DECREASE
 *						and NO_SAMPLE_RATE_CHANGE from vtm_i.h.
 * 0002 31-JUL-95 CJL, Remove code duplicated in port.h and include port.h
 *
 */

#ifndef VIPORT_H
#define VIPORT_H

/*
 ************************************************************************
 * Include port.h for OS specific defines for VTM
 */

#include "port.h"

/*
 ************************************************************************
 * OS independent defines for VTM
 */
 
#define  MAXIMUM_FRAME_SIZE  100
#define  SAMPLE_RATE_INCREASE   0
#define  SAMPLE_RATE_DECREASE   1
#define  NO_SAMPLE_RATE_CHANGE  2

#define UINT    int
#define DWORD long

#endif /* VIPORT_H */
