/**********************************************************************
 *
 *  Copyright (C), 1997  SEIKO EPSON Corp.
 *  ALL RIGHTS RESERVED
 *
 *  file name : lib.c
 *
 *  This is initialize file for ANSI C library
 *
 *  Revision history
 *  1997/3/27   M.Kudo
 *  2000/2/23   C.Nakayama   Delete _STACK_TOP and _STACK_BOTTOM
 *  2000/6/1    M.Kakinuma   Change, initialize for memory allocation prc. 
 *  2001/7/2	M.Kakinuma	 for ICD
 *
 **********************************************************************/

#include <smcvals.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* initialize for memory allocation address */
#define	ALLOC_START 0x6f0000	// allocation area start address
#define	ALLOC_END	0x6ffffc	// allocation area end address

/* definition for all */

int errno;          /* error number */

/* definition for io.lib */

FILE    _iob[FOPEN_MAX + 1];    /* standard i/o stream, FOPEN max is 3 */
FILE    *stdin;         /* standard input */
FILE    *stdout;        /* standard output */
FILE    *stderr;        /* standard error */

/* definition for others in lib.lib */

unsigned int  seed;     /* seed of random value */
time_t  gm_sec;         /* for time function */

/**************************
/   initialize routine
/*************************/

void _init_lib()
    {

    int iRet;
    
/* initalize for general */

      errno = 0;    /* clear error number */

/* initalize for io stream in io.lib */ 

    _iob[0]._flg = _UGETN;  /* initialize stdin stream */
    _iob[0]._buf = 0;
    _iob[0]._fd = 0;

    _iob[1]._flg = _UGETN;  /* initialize stdout stream */
    _iob[1]._buf = 0;
    _iob[1]._fd = 1;

    _iob[2]._flg = _UGETN;  /* initialize stderr stream */
    _iob[2]._buf = 0;
    _iob[2]._fd = 2;

    stdin = &_iob[0];   /* initialize each file pointer */
    stdout = &_iob[1];
    stderr = &_iob[2];

/* initialize for memory allocation address in lib.lib */
    iRet = ansi_InitMalloc(ALLOC_START, ALLOC_END);

/* initialize for others in lib.lib */

    seed = 1;   /* initialize random seed */
    gm_sec = -1;    /* initialize time */
    }

