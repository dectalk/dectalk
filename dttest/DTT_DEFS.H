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
 *    File Name:		dtt_defs.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DTtest data definition header file
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		Y.L		08/01/1996	initial release
 *
 *
 */
#ifndef DDTDEFS     
#define DDTDEFS

#define SYSTMP_FILE    "dtsys\\dttest.tmp"
#define SYSLOG_FILE    "dtsys\\dttest.log"
#define SYSERR_FILE    "dtsys\\dttest.err"
#define SYSMAP_FILE    "dtsys\\dttest.map"
#define SYSINI_FILE    "dtsys\\dttest.ini"

#define DTSTARTH        1
#define CHARARRAYSIZL   1024
#define CHARARRAYSIZM   512
#define CHARARRAYSIZE   512
#define CHARARRAYSIZS   256
#define RECORDSIZE      132
#define MAXRECORDSIZE   256
#define FILENAMESIZE    132
#define NORMALSIZE      60
#define SMALLSIZE       10
#define ARGUMENTSIZE    11
#define MAXILOGSIZE		100
#define MAXICASENUM     99
#define MAXLENGTH		256

#define TSR_CLEAN_CYCLE 30000
#define TSR_WAIT_CYCLE  20000
/*
#ifdef DTEX
#define TSR_CLEAN_CYCLE 20000
#define TSR_WAIT_CYCLE  10000
#else
#define TSR_CLEAN_CYCLE 100000
#define TSR_WAIT_CYCLE  100000
#endif
*/

#define TSR_FAILURE     0x00               /* Fails to do function */
#define TSR_SUCCESS     0x01               /* Succeeds */
#define TSR_BUSY        0x02               /* Tsr is busy, try again */
#define TSR_RETRY       0x03               /* Module busy, try again */
#define DECTALK_ID      0xD0
#define INSTALL_CHECK   0x00
#define INSTALLED       0xFF               /* return in al */
#define SEND_CHAR       0x08               /* send a character */
#define GET_CHAR        0x09               /* get a character */
#define SEND_BUFF       0x0a               /* send a character buffer */
#define GET_BUFF        0x0b               /* get a character buffer */
#define FLUSH_TEXT      0x17               /* Flush pending text */
 
unsigned char getbuf[CHARARRAYSIZE]; 
extern unsigned char defbuf[];

#ifndef MSVC4

union _REGS  regs; 
#define RW              regs.x
#define RB              regs.h

#else

#define STRICT
#define INPUT_CMDLINE       0
#define INPUT_STDIN         1

/* global variable for TTS Engine */
short TTS_flag;

#endif

/* if the file type identified, the variable will be one */
int GROUP, CASE, REQUEST, TXT, PRI, POS, BAT, STRING;

extern int TRACE;
extern int FLOW;

/* loop count to limited one access to the loop if sg replaced by case */
extern int BG_LOOPED, SG_LOOPED, CASE_LOOPED, REQ_LOOPED;

/* global test number */
extern int BG_NUM, SG_NUM;

extern int CASE_NUM_IN_GROUP, GLOBAL_CASE_NUM;

extern int REQ_NUM_IN_CASE, REQ_NUM_IN_GROUP, GLOBAL_REQ_NUM;
                                                  
extern FILE *SYS_FPTR;

#endif
