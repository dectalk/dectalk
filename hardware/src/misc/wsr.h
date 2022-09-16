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
 *    File Name:	wsr.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *
 */
 
#include <windows.h>
#include <string.h>
#include <stdlib.h>
#include	<ctype.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>
#include	<stdio.h>
#include <conio.h>
#include	<time.h>
#include	<malloc.h>
#include	"wsr_prot.h"
#include	"user_dll.h"
#include	"wsr_rc.h"
#include	"wsr_dlg.h"

#define	true		1
#define	TRUE		1
#define	false		0
#define	FALSE		0
#define	success	1
#define	SUCCESS	1
#define	failure	0
#define	FAILURE	0

extern char szString[128];
extern char szAppName[20];

/*
 *  General handy windows handles...
 */

extern HANDLE	wsrInst;          
extern HWND		wsrWnd;       
extern HWND		wsrDlg;

/*
 *  file control ...
 */

#define	READ_BUFF_SIZE		512 
#define	MAX_OUT_BYTES		512				/* Output size in DECtalk */
#define	READ_DELAY			250				/* Sleep time when buffer full */
#define	SEND_SIZE			128				/* Size of chunck to send at once */


extern char 				wsrDirectory[256];
extern char 				wsrFileName[256];
extern char 				wsrFileTitle[256];
extern HFILE				wsrFile;
extern FARPROC				ReadControl;
extern HGLOBAL				hReadBuff;
extern char _huge			*read_buff;
extern int					BytesAvail;
extern int					ByteIndex;
extern int					AbortFlag;
extern int					ReadFlag;
extern int					ReadModule;
extern unsigned long		ReadWait;
extern int					UserReadControl;
extern int					UserPauseControl;
extern int					UserTextControl;


/*
 *  screen control ...
 */


typedef struct type_SCREEN_INDEX {
	int				sx;
	int				sy;
} SCREEN_INDEX;

#define	TOTAL_INDEX		512
#define	MAX_INDEX		(TOTAL_INDEX-1)
#define	NULL_INDEX		(TOTAL_INDEX+1)

#define	MaxLines   		40
#define	MaxChars			132
#define	MaxLine			(MaxLines - 1)
#define	TTY_FONT			(SYSTEM_FIXED_FONT)
#define	TAB_SETTING		8

#define	TEXT_NORMAL			0x00000000
#define	TEXT_HIGHLIGHT		0x00FFFFFF
#define	BACK_NORMAL			0x00FFFFFF
#define	BACK_HIGHLIGHT		0x00000000

extern char				ScreenBuff[MaxLines][MaxChars+2];
extern short			nFirstLine;
extern short 			nLastLine;
extern short			nCurrPos;
extern int				LastScroll;
extern SCREEN_INDEX	sindex[];
extern int				si_head,si_tail,si_count;
extern int				curr_index;
extern int				watch_index;
extern int				highlight_index;
extern BOOL				IndexFlag;

/*
 *  character control stuff ...
 */

extern unsigned char char_types[];

#define	MARK_null			0x00			/* null marker for place holder */
#define	MARK_vowel			0x01			/* has a vowel */
#define	MARK_upper			0x02			/* has an upper */
#define	MARK_cons			0x04			/* has a consonant*/
#define	MARK_digit			0x08			/* has a digit */
#define	MARK_non_alpha		0x10			/* has a non-alpha character */
#define	MARK_punct			0x20			/* has some type of punctuation */
#define	MARK_clause			0x40			/* punctuation used as clause terminator */

#define	IS_CLAUSE(c)		(char_types[c] & MARK_clause)
#define	IS_DIGIT(c)			(char_types[c] & MARK_digit)
#define	IS_WORD(c)			(char_types[c] & (MARK_vowel|MARK_cons|MARK_digit))
