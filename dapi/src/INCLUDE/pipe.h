/**********************************************************************/
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
 * 062	MGS	08/22/2000	BATS #935, fixed 2 concurrency problems
 *
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
#define  FLOAT_PIPE     4
#define  DOUBLE_PIPE    5
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

#endif
