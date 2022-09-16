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
 *    File Name:    ph_log.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  all ph logging functions have been moved to here lib and now log
 *  based on the loaded phonemic set ...
 *
 ***********************************************************************
 *    Revision History: 
 *
 *  Rev Name    Date        Description
 *  --- -----   ----------- --------------------------------------------
 *  001 MGS     3/25/1996	Merged WIN 95 code to 42c
 *	002	MGS		06/06/1996	Changed file name from phlog.c ph_log.c
 *  003 GL		10/03/1996  Add many logging hook for WIN95
 *							add make sure LATIN mode get the correct logging for Spanish
 *  004 GL		03/21/1997  for BATS#305	
 *							need to send the space for single phoneme character logging
 *							for WIN32
 *  005 GL		03/24/1997  for BATS#313	
 *							the ascky logging should no have the spaces.
 *  006	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 *  007 GL      11/06/1997  BATS#486 change display to 72 character from 35
 *  008	MFG		05/8/98	    added dbglog.txt logging for debug switch[:debug 2008]
 *	009 MFG		05/12/98	cleanup of dbglog.txt logging
 *  010 MFG		05/19/98	excluded dbglog logging when build 16-bit code (MSDOS)	 
 *  011 ETT		10/05/1998     Added Linux code.
 */

#include		"port.h"

#ifdef WIN32
#include <windows.h>
#include "tts.h"
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined (__osf__) || defined (__linux__)
#include "tts.h"
#endif

#include        "defs.h"
#include        "dectalk.h"
#include        "kernel.h"
#include        "cmd.h"
#include        "esc.h"
#include        "l_us_ph.h"
#include        "pcport.h"
#include        "186.h"

#if defined (WIN32) && defined (PRINTFDEBUG)
#define printf WINprintf
#endif


#ifdef MSDOS
void dologphoneme (short phone, short dur, short f0);
#else
void dologphoneme (LPTTS_HANDLE_T phTTS, short phone, short dur, short f0);
#endif

/*
 * Phoneme names, for logging.
 */

/* 
 * Table of "SP" names,
 */

char                   *logspnames[] =
{
	"sex",
	"sm",
	"as",
	"ap",
	"pr",
	"br",
	"ri",
	"nf",
	"la",
	"hs",
	"f4",
	"b4",
	"f5",
	"b5",
	"p4",
	"p5",
	"gf",
	"gh",
	"gv",
	"gn",
	"g1",
	"g2",
	"g3",
	"g4",
	"lo",							   /* Was "g5".            */
	"ft",
	"bf",
	"lx",							   /* Was "ef", now gone.  */
	"qu",
	"hr",
	"sr"
};

/* 
 * This routine is called after a clause has been
 * read, and the LOG_HOSTPH flag is set. It runs down the
 * "symbols", "user_durs", and "user_f0" arrays, and writes out
 * the phonemes it finds. A carriage return is appended to the
 * clause; this can be used as a signal that the end of
 * the clause has been reached.
 */

#ifndef MSDOS

#ifdef WIN32
#include <windows.h>
#include <mmsystem.h>
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined (__osf__) || defined (__linux__)
#include "opthread.h"
#endif

void  TextToSpeechErrorHandler (LPTTS_HANDLE_T, UINT, MMRESULT);

#endif

#ifdef MSDOS
void 
logclaus (short *sym,
		  short nsym,
		  short *ud,
		  short *uf0)
#else
void 
logclaus (LPTTS_HANDLE_T phTTS,
		  short *sym,
		  short nsym,
		  short *ud,
		  short *uf0)
#endif
{
	register int            i,cnt;
	struct spc_packet _far *spc_pkt;
	PKSD_T                  pKsd_t;

#ifdef MSDOS
	pKsd_t = kernel_share;
#else
	pKsd_t = phTTS->pKernelShareData;
#endif

#ifndef MSDOS
/* 
 * LPTTS_HANDLE_T phTTS;
 * 
 * phTTS = TextToSpeechGetHandle(); */
#endif

#ifdef MSDOS
	WAIT_PRINT;
#endif
	cnt=0;

	for (i = 1; i < nsym; ++i)
	{
		cnt++;
#ifdef WIN32
		EnterCriticalSection (phTTS->pcsLogFile);
#endif
#if defined (__osf__) || defined (__linux__)
		/* GL 04/21/1997  change this as the latest OSF code */
		/* ToggleLogfileMutex (MUTEX_RESERVE);*/
		OP_LockMutex( phTTS->pcsLogFile );
#endif

#ifdef MSDOS
		if ((spc_pkt = (struct spc_packet _far *) pKsd_t->index_pending.head) != NULL_SPC_PACKET)
#else
		if ((spc_pkt = (struct spc_packet _far *) pKsd_t->spc_pkt_save) != NULL_SPC_PACKET)
#endif
		{
			while (spc_pkt != NULL_SPC_PACKET)
			{
				cnt += 6;
				if ((*spc_pkt).data[0] == (U16) i)
				{
#ifdef MSDOS
					printf ("[:i %d]", (*spc_pkt).data[2]);
#else
#ifdef PRINTDEBUG
					printf ("[:i %d]", (*spc_pkt).data[2]);
#endif
					if (pKsd_t->logflag & LOG_PHONEMES)
					{
					   	if (fprintf(phTTS->pLogFile, "[:i %d]", (*spc_pkt).data[2]) < 0)
					   	{
					     	TextToSpeechErrorHandler (phTTS,
												  ERROR_WRITING_FILE,
												  0L);
						}
					}
#endif
				}
				spc_pkt = (struct spc_packet _far *) (*spc_pkt).link;
			}
		}

#ifdef WIN32
		LeaveCriticalSection (phTTS->pcsLogFile);
#endif
#if defined (__osf__) || defined (__linux__)
		/* GL 04/21/1997  change this as the latest OSF code */
		/* ToggleLogfileMutex (MUTEX_RESERVE);*/
		OP_UnlockMutex( phTTS->pcsLogFile );
#endif

#ifdef MSDOS
		dologphoneme (sym[i], ud[i], uf0[i]);
#else
		dologphoneme (phTTS, sym[i], ud[i], uf0[i]);
#endif
		/* GL 11/06/1997 BATS#486 change display to 72 character from 35 */
		if (cnt >= 72)
		{
#ifdef MSDOS
			printf("\n");
#else
#ifdef PRINTFDEBUG
			printf ("\n");
#endif
			if (pKsd_t->logflag & LOG_PHONEMES)
			{
				if (fprintf (phTTS->pLogFile, "\n") < 0)
				{
					TextToSpeechErrorHandler (phTTS,
											  ERROR_WRITING_FILE,
											  0L);
				}
			}
#endif
			cnt=0;
		}
	}

#ifdef MSDOS
	printf("\n");
	SIGNAL_PRINT;
#else
#ifdef PRINTFDEBUG
	printf ("\n");
#endif
	if (pKsd_t->logflag & LOG_PHONEMES)
	{
		if (fprintf (phTTS->pLogFile, "\n") < 0)
		{
			TextToSpeechErrorHandler (phTTS,
									  ERROR_WRITING_FILE,
									  0L);
		}
	}
#endif

	return;
	
}

/* 
 * Log a single item. This is called to
 * log control phonemes that appear between breath
 * groups. Each one gets a log line by itself. I don't
 * log index marks, syncs, or breath breaks. Only speaking
 * phonemes (rate, pauses, etc.) are logged.
 */

#ifdef MSDOS
void 
logitem (register short buf[])
#else
void 
logitem (LPTTS_HANDLE_T phTTS, register short buf[])
#endif
{
	register char          *cp;
	char                    oc;
#ifndef MSDOS
	PKSD_T                  pKsd_t;

	pKsd_t = phTTS->pKernelShareData;
/* 
 * LPTTS_HANDLE_T phTTS; phTTS = TextToSpeechGetHandle(); */
#endif


/* GL 04/21/1997  change this for OSF build */
#if defined (MSDOS) || defined (__osf__) || defined (__linux__)
	WAIT_PRINT;
#endif

#ifdef WIN32
	EnterCriticalSection (phTTS->pcsLogFile);
#endif

#if defined (__osf__) || defined (__linux__)
	/* GL 04/21/1997  change this as the latest OSF code */
	/* ToggleLogfileMutex (MUTEX_RESERVE);*/
	OP_LockMutex( phTTS->pcsLogFile );
#endif


	switch (buf[0])
	{
	case RATE:

#ifdef MSDOS
		printf (":ra %d\n", buf[1]);
#else
#ifdef PRINTFDEBUG
		printf (":ra %d\n", buf[1]);
#endif

#ifndef MSDOS
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			fprintf(pKsd_t->dbglog,":ra %d\n", buf[1]);
#endif
		
		if (pKsd_t->logflag & LOG_PHONEMES)
		{
			if (fprintf (phTTS->pLogFile, ":ra %d\n", buf[1]) < 0)
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			}
		}
#endif
		break;

	case CPAUSE:


#ifdef MSDOS
		printf (":cp %d\n", buf[1]);
#else
#ifdef PRINTFDEBUG
		printf (":cp %d\n", buf[1]);
#endif

#ifndef MSDOS
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			fprintf(pKsd_t->dbglog,":cp %d\n", buf[1]);
#endif

		if (pKsd_t->logflag & LOG_PHONEMES)
		{
			if (fprintf (phTTS->pLogFile, ":cp %d\n", buf[1]) < 0)
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			}
		}
#endif
		break;

	case PPAUSE:


#ifdef MSDOS
		printf (":pp %d\n", buf[1]);
#else
#ifdef PRINTFDEBUG
		printf (":pp %d\n", buf[1]);
#endif
#ifndef MSDOS
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			fprintf(pKsd_t->dbglog,":pp %d\n", buf[1]);
#endif
		if (pKsd_t->logflag & LOG_PHONEMES)
		{
			if (fprintf (phTTS->pLogFile, ":pp %d\n", buf[1]) < 0)
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			}
		}
#endif
		break;

	case NEW_SPEAKER:

		oc = "pbhfdkurwv"[buf[1]];

#ifdef MSDOS
		printf (":n%c\n", oc);
#else
#ifdef PRINTFDEBUG
		printf (":n%c\n", oc);
#endif
#ifndef MSDOS
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			fprintf(pKsd_t->dbglog,":n%c\n", oc);
#endif
		if (pKsd_t->logflag & LOG_PHONEMES)
		{
			if (fprintf (phTTS->pLogFile, ":n%c\n", oc) < 0)
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			}
		}
#endif
		break;

	case SPECIALWORD:

#ifdef MSDOS
		printf (" sp ");
#else
#ifdef PRINTFDEBUG
		printf (" sp ");
#endif
#ifndef MSDOS
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			fprintf(pKsd_t->dbglog," sp ");
#endif
		if (pKsd_t->logflag & LOG_PHONEMES)
		{
			if (fprintf (phTTS->pLogFile, " sp ") < 0)
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			}
		}
#endif
		break;

	case NEW_PARAM:

		cp = logspnames[buf[1]];

#ifdef MSDOS
		printf (":dv %s %d\n", cp, buf[2]);
#else
#ifdef PRINTFDEBG
		printf (":dv %s %d\n", cp, buf[2]);
#endif

#ifndef MSDOS
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			fprintf(pKsd_t->dbglog,":dv %s %d\n", cp, buf[2]);
#endif

		if (pKsd_t->logflag & LOG_PHONEMES)
		{
			if (fprintf (phTTS->pLogFile, ":dv %s %d\n", cp, buf[2]) < 0)
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			}
		}
#endif
		break;

	case SAVE:


#ifdef MSDOS
		printf (":dv save\n");
#else
#ifdef PRINTFDEBUG
		printf (":dv save\n");
#endif
		
#ifndef MSDOS
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			fprintf(pKsd_t->dbglog,":dv save\n");
#endif

		if (pKsd_t->logflag & LOG_PHONEMES)
		{
			if (fprintf (phTTS->pLogFile, ":dv save\n") < 0)
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			}
		}
#endif
		break;
	}

#ifdef WIN32
	LeaveCriticalSection (phTTS->pcsLogFile);
#endif
#if defined (__osf__) || defined (__linux__)
		/* GL 04/21/1997  change this as the latest OSF code */
		/* ToggleLogfileMutex (MUTEX_RESERVE);*/
		OP_UnlockMutex( phTTS->pcsLogFile );
#endif


#ifdef MSDOS
	SIGNAL_PRINT;
#endif
}

#ifdef MSDOS
void 
dologphoneme (short phone, short dur, short f0)
#else
void 
dologphoneme (LPTTS_HANDLE_T phTTS, short phone, short dur, short f0)
#endif
{
	unsigned char _far     *arpa;
	unsigned char _far     *ascky;
	PKSD_T                  pKsd_t;

#ifdef MSDOS
	pKsd_t = kernel_share;
#else
	pKsd_t = phTTS->pKernelShareData;
#endif

#ifndef MSDOS
	/* 
	 * LPTTS_HANDLE_T phTTS; phTTS = TextToSpeechGetHandle(); */
#endif

#ifdef WIN32
	EnterCriticalSection (phTTS->pcsLogFile);
#endif

#if defined (__osf__) || defined (__linux__)
	/* GL 04/21/1997  change this as the latest OSF code */
	/* ToggleLogfileMutex (MUTEX_RESERVE);*/
	OP_LockMutex( phTTS->pcsLogFile );
#endif
	ascky = (char _far *) pKsd_t->ascky;
	arpa = (unsigned char _far *) pKsd_t->arpabet;

/* GL 10/03/1996 */ /*mfg_debug*/
/* make sure the logging for LATIN mode is correct. change E_TH(17) to E_S(15) */
		if ((pKsd_t->lang_curr == LANG_latin_american)  && (pKsd_t->modeflag & MODE_LATIN) && (phone == 17))
		{
			phone = 15;
		}


#ifdef MSDOS
	if (pKsd_t->phoneme_mode & PHONEME_ASCKY)
	{
		if (dur != 0 || f0 != 0)
		{
			if (ascky[phone] == '_')
			{
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
				fprintf(pKsd_t->dbglog,"%c<0,0>\n", ascky[phone]);
#endif
			printf ("%c<0,0>", ascky[phone]);
			}
			else
			{
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
				fprintf(pKsd_t->dbglog,"%c<%d,%d>\n", ascky[phone], dur, f0);
#endif

			printf ("%c<%d,%d>", ascky[phone], dur, f0);
			}
		}
		else
		{
#ifndef MSDOS
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			fprintf(pKsd_t->dbglog,"%c ", ascky[phone]);
#endif
		printf ("%c ", ascky[phone]);
		}
	}
	else
	{
		if (arpa[phone * 2 + 1] == ' ')
		{
			if (dur != 0 || f0 != 0)
			{
			    if (arpa[phone * 2] == '_')
				{
#ifndef MSDOS
				if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
					fprintf(pKsd_t->dbglog,"%c<0,0>\n", arpa[phone * 2]);
#endif
				printf ("%c<0,0>", arpa[phone * 2]);
				}
				else
				{
#ifndef MSDOS
				if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
					fprintf(pKsd_t->dbglog,"%c<%d,%d>\n", arpa[phone * 2], dur, f0);
#endif
				printf ("%c<%d,%d>", arpa[phone * 2], dur, f0);
				}
			}
			else
			{
#ifndef MSDOS
				if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
					fprintf(pKsd_t->dbglog,"%c ", arpa[phone * 2]);
#endif
				printf ("%c ", arpa[phone * 2]);
			}
		}
		else
		{
			if (dur != 0 || f0 != 0)
			{
#ifndef MSDOS
				if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
					fprintf(pKsd_t->dbglog,"%c%c<%d,%d>\n", arpa[phone * 2], arpa[phone * 2 + 1], dur, f0);
#endif
				printf ("%c%c<%d,%d>", arpa[phone * 2], arpa[phone * 2 + 1], dur, f0);
			}
			else
			{
#ifndef MSDOS
				if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
					fprintf(pKsd_t->dbglog,"%c%c", arpa[phone * 2], arpa[phone * 2 + 1]);
#endif
				printf ("%c%c", arpa[phone * 2], arpa[phone * 2 + 1]);
			}
		}
	}
#else
	if (pKsd_t->phoneme_mode & PHONEME_ASCKY)
	{
		if (dur != 0 || f0 != 0)
		{
#ifdef PRINTFDEBUG
			if (ascky[phone] == '_')
			printf ("%c<0,0>", ascky[phone]);			
			else
			printf ("%c<%d,%d>", ascky[phone], dur, f0);
#endif


#ifndef MSDOS
			if (pKsd_t->dbglog)	/* mfg added for dbglog.txt logging support*/
			{
				if (ascky[phone] == '_')
					fprintf(pKsd_t->dbglog,"%c<0,0>\n", ascky[phone]);
				else
					fprintf(pKsd_t->dbglog,"%c<%d,%d>\n", ascky[phone], dur, f0);
			}
#endif

			if ((pKsd_t->logflag & LOG_OUTPHON) || (pKsd_t->logflag & LOG_PHONEMES))
			{

				if (fprintf (phTTS->pLogFile,
							 "%c<%d,%d>", ascky[phone], dur, f0) < 0)
				{
					TextToSpeechErrorHandler (phTTS,
											  ERROR_WRITING_FILE,
											  0L);
				}
			}
		}
		else
		{
		/* GL 03/24/1997 for BATS#313  should not send out the space for ASCKY logging */
#ifdef PRINTFDEBUG
			printf ("%c", ascky[phone]);
#endif
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
					fprintf(pKsd_t->dbglog,"%c", ascky[phone]);
#endif
			if ((pKsd_t->logflag & LOG_OUTPHON) || (pKsd_t->logflag & LOG_PHONEMES))
			{
				if (fprintf (phTTS->pLogFile, "%c", ascky[phone]) < 0)
				{
					TextToSpeechErrorHandler (phTTS,
											  ERROR_WRITING_FILE,
											  0L);
				}
			}
		}

	}
	else
	{
		if (arpa[phone * 2 + 1] == ' ')
		{
			if (dur != 0 || f0 != 0)
			{
#ifdef PRINTFDEBUG
			    if (arpa[phone * 2] == '_')
			    printf ("%c<0,0>", arpa[phone * 2]);
			    else
				printf ("%c<%d,%d>", arpa[phone * 2], dur, f0);
#endif
								
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			{
			    if (arpa[phone * 2] == '_')
			    fprintf (pKsd_t->dbglog,"%c<0,0>\n", arpa[phone * 2]);
			    else
				fprintf (pKsd_t->dbglog,"%c<%d,%d>\n", arpa[phone * 2], dur, f0);
			}
#endif

				if ((pKsd_t->logflag & LOG_OUTPHON) || (pKsd_t->logflag & LOG_PHONEMES))
				{
					if (fprintf (phTTS->pLogFile, "%c<%d,%d>", arpa[phone * 2], dur, f0) < 0)
					{
						TextToSpeechErrorHandler (phTTS,
												  ERROR_WRITING_FILE,
												  0L);
					}
				}
			}
			else
			{


#ifdef PRINTFDEBUG
				printf ("%c ", arpa[phone * 2]);
#endif

#ifndef MSDOS
				if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
					fprintf(pKsd_t->dbglog,"%c ", arpa[phone * 2]);
#endif

				if ((pKsd_t->logflag & LOG_OUTPHON) || (pKsd_t->logflag & LOG_PHONEMES))
				{
					/* GL 03/21/1997 for BATS#305 need to send "%c " intead of "%c" only */
					if (fprintf (phTTS->pLogFile, "%c ", arpa[phone * 2]) < 0)
					{
						TextToSpeechErrorHandler (phTTS,
												  ERROR_WRITING_FILE,
												  0L);
					}
				}
			}
		}
		else
		{
			if (dur != 0 || f0 != 0)
			{
#ifdef PRINTFDEBUG
				printf ("%c%c<%d,%d>", arpa[phone * 2], arpa[phone * 2 + 1], dur, f0);
#endif
#ifndef MSDOS
				if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
					fprintf(pKsd_t->dbglog,"%c%c<%d,%d>\n", arpa[phone * 2], arpa[phone * 2 + 1], dur, f0);
#endif
				
				if ((pKsd_t->logflag & LOG_OUTPHON) || (pKsd_t->logflag & LOG_PHONEMES))
				{
					if (fprintf (phTTS->pLogFile, "%c%c<%d,%d>", arpa[phone * 2], arpa[phone * 2 + 1], dur, f0) < 0)
					{
						TextToSpeechErrorHandler (phTTS,
												  ERROR_WRITING_FILE,
												  0L);
					}
				}
			}
			else
			{


#ifdef PRINTFDEBUG
				printf ("%c%c", arpa[phone * 2], arpa[phone * 2 + 1]);
#endif

#ifndef MSDOS
				if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
					fprintf(pKsd_t->dbglog,"%c%c", arpa[phone * 2], arpa[phone * 2 + 1]);
#endif
				
				if ((pKsd_t->logflag & LOG_OUTPHON) || (pKsd_t->logflag & LOG_PHONEMES))
				{
					if (fprintf (phTTS->pLogFile, "%c%c", arpa[phone * 2], arpa[phone * 2 + 1]) < 0)
					{
						TextToSpeechErrorHandler (phTTS,
												  ERROR_WRITING_FILE,
												  0L);
					}
				}
			}
		}
	}
#endif

#ifdef WIN32
	LeaveCriticalSection (phTTS->pcsLogFile);
#endif
#if defined (__osf__) || defined (__linux__)
	/* GL 04/21/1997  change this as the latest OSF code */
	/* ToggleLogfileMutex (MUTEX_RESERVE);*/
	OP_UnlockMutex( phTTS->pcsLogFile );
#endif
}
/************************************end of phlog.c***************************/
