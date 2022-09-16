/*
 * @DEC_COPYRIGHT@
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY
 * Revision 1.1.2.2  1995/07/05  19:35:51  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:44  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  23:08:29  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:14:43  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 */
/*
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   
** MODULE NAME: 
**
** MODULE DESCRIPTION: 
** 
** DESIGN OVERVIEW: 
** 
**--
*/
/***************************************************************************
**
**  Copyright (c) Digital Equipment Corporation, 1994 All Rights Reserved.
**  Unpublished rights reserved under the copyright laws of the United States.
**  The software contained on this media is proprietary to and embodies the
**  confidential technology of Digital Equipment Corporation.  Possession, use,
**  duplication or dissemination of the software and media is authorized only
**  pursuant to a valid written license from Digital Equipment Corporation.
**
**  RESTRICTED RIGHTS LEGEND   Use, duplication, or disclosure by the U.S.
**  Government is subject to restrictions as set forth in Subparagraph
**  (c)(1)(ii) of DFARS 252.227-7013, or in FAR 52.227-19, as applicable.
**
****************************************************************************/

/*****************************************************************************
**  PROGRAM:
**     play.h
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     Krishna Mangipudi
**
**  CREATION DATE:
**     July 8, 1993
**
**  MODIFICATION HISTORY:
**
**     Aug 10, 94    KM   Moved time_interval structure into mbuf.h to 
**                        make it is accessable to mbuf.c
**
*****************************************************************************/

/*
 * Declare 1 6144 byte buffer with 2 3072 byte segments
 */
#define MAX_BUFFERS 1  
#define BUFFER_SIZE 65536 
#define MAX_SEGMENTS 8 
#define SEGMENT_SIZE 8192 

/* This requires that MAX_SEGMENTS be a power of 2 */
#define MOD_SEGMENT_MASK ( MAX_SEGMENTS - 1 )
 
#define MAX_STRINGS 64
#define APP_DEBUG 1
#define MAX_ERR_STRING 128
#define BUFSIZE 4096 /* mbuf buffer size */
#define SS_PLAYING     1
#define SS_SILENT      2
#define SECONDS_DELAY  0.7
#define SECONDS_MAXB   1.5
/* 
 * Data type definitions
 */
typedef struct 
{
   char  *lpData;
   char  *segment_address[MAX_SEGMENTS];
   BOOL  not_in_use[MAX_SEGMENTS];
}buffer_t;
