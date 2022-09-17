/* **********************************************************************
 *    						Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © Force Computers Incorporated 2000. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.
 * **********************************************************************/

/**********************************************************************/
/*                                                                    */
/*  Include File: pipe.h                                              */
/*  Author Bill Hallahan                                              */
/*  Date: March 19, 1993                                              */
/*                                                                    */
/**********************************************************************/
/*    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------  
 * 001	MGS		08/22/2000		BATS #935, fixed 2 concurrency problems
 * 002 	CAB		10/16/2000		Changed copyright info
 * 003	CAB		07/10/2002		Updated copyright info
 **********************************************************************/

#ifndef _PIPE_H_

#define _PIPE_H_

/**********************************************************************/
/*  Pipe type symbols for function create_pipe().                     */
/**********************************************************************/

#define  BYTE_PIPE      0
#define  WORD_PIPE      1
#define  DWORD_PIPE     2
#define  QWORD_PIPE     3
#ifdef NEVER
#define  FLOAT_PIPE     4
#define  DOUBLE_PIPE    5
#endif
#define  VOID_PTR_PIPE  6

/**********************************************************************/
/*  Pipe type definitions.                                            */
/**********************************************************************/

typedef  unsigned char   BYTE_T;
typedef  unsigned short  WORD_T;
typedef  unsigned int    DWORD_T;
typedef  unsigned long   QWORD_T;

/**********************************************************************/
/*  Opaque pipe structure definition.                                 */
/**********************************************************************/

typedef struct PIPE_TAG PIPE_T;

typedef PIPE_T * LPPIPE_T;

/**********************************************************************/
/*  Function prototypes.                                              */
/**********************************************************************/

LPPIPE_T create_pipe( UINT, UINT );

void write_pipe( LPPIPE_T, void *, UINT );

void read_pipe( LPPIPE_T, void *, UINT );

void read_pipeEx( LPPIPE_T *pPipe, void * pItems, UINT uiNumberToRead );

void pause_pipe( LPPIPE_T );

void resume_pipe( LPPIPE_T );

void exit_pipe( LPPIPE_T );

void reset_pipe( LPPIPE_T );

void destroy_pipe( LPPIPE_T );

UINT pipe_count( LPPIPE_T );

// tek 03sep96 add LockPipe, UnlockPipe.
void LockPipe( LPPIPE_T );
void UnlockPipe( LPPIPE_T );
// tek 04sep96 add FlushPipe.
void SWFlushPipe( LPPIPE_T pPipe );

#define READ_WORD_PIPE_PACKET 0xFEEDC0DE

#endif	//_PIPE_H_
