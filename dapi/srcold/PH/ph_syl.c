/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000, 2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997 All rights reserved.
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
 *
 ***********************************************************************
 *    File Name:    ph_syl.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  ph_syl.c -- syllabification and output ....
 *
 ***********************************************************************
 *
 *  Rev Name    Date        Description
 *  --- -----   ----------- --------------------------------------------
 *  001 MGS     03/25/1996  Merged WIN 95 code to 42c
 *	002 MGS		03/06/1996	Merged Spanish with english
 *	003 MGS		05/06/1996	fixed 2 bugs with syllable logging 
 *	004	MGS		06/06/1996	Changed file name from phsyl.c to ph_syl.c
 *  005 SIK		07/09/1996  Cleaning up and maintenance
 *  006 GL		09/18/1996	Add WIN95 logging handler.
 *  007	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 *  008	GL		04/21/1997	BATS#360  remove spaces before "#define" or "#if" 
 *  009 DR		09/30/1997	UK BUILD: added UK STUFF
 *  010	MFG		05/04/1998	added dbglog.txt logging for debug switch[:debug 2004]
 *  011 MFG		05/19/1998	excluded dbglog logging when build 16-bit code (MSDOS)	 
 *  012 ETT		10/05/1998	Added Linux code.
 *  013	MGS		12/17/1999	Fixed Printing of syllablesso that the last ones would actually print.
 *  014	MGS		04/13/2000	Changes for integrated phoneme set 
 *  015 CHJ		07/20/2000	French added
 *  016	MGS		10/05/2000	Redhat 6.2 and linux warning removal
 *  017 CAB		10/16/2000	Changed copyright info
 *  018	MGS		11/16/2000	Fixed sylable logging for single language
 *  019	MGS		05/09/2001	Some VxWorks porting BATS#972
 *  020 CAB		05/14/2001	Updated copyright
 *  021 MFG		05/29/2001	Incuded dectalkf.h	
 *  022	MGS		06/19/2001	Solaris Port BATS#972
 *  023	MGS		03/20/2002	Single threaded vtm
 *  021	MGS		04/11/2002	ARM7 port
 *	022	CAB		09/17/2002	Removed warnings
 */


#include   "ph_def.h" 

#if defined (ENGLISH) || defined (SPANISH) || defined (FRENCH)

#ifdef ENGLISH_US
#include "usa_def.h"
#endif
#ifdef ENGLISH_UK
#include "uk_def.h"
#endif
#ifdef SPANISH
#include "spa_def.h"
#endif
#ifdef FRENCH
#include "fr_def.h"
#endif

/***************************************************************************/
/* MVP: The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                */
/* extern short symbols[];      Integer represent of input string          */
/* extern  short   nsymbtot;    Length of above.                           */
/* extern  short   *user_durs;  Where user durations go.                   */
/* extern  short   *user_f0;    Where user f0 commands go.                 */
/* extern  short *user_offset;                                             */
/* extern  int     asperation;                                             */
/* extern  int     bound;                                                  */
/* extern  int     nphone;                                                 */
/* extern  int     lastoffs;                                               */
/* unsigned int syllable_struct[256];                                      */
/* unsigned int phone_struct[256];                                         */
/***************************************************************************/

/* Static function declarartions : MVP */
static void syl_clause_init (PDPH_T);
static void speak_syllable (LPTTS_HANDLE_T phTTS);
static int  ph_syllab (PDPH_T pDph_t, int j);
static short syl_find_affix (PDPH_T pDph_t, int *ph);

#include "ph_syl1.c"	/* include the language dependent stuff */
/*
 *      Function Name: syl_find_vowel()      
 *  
 *  	Description: Finds a vowel in the input arg ph.
 *
 *      Arguments: int *ph
 *
 *      Return Value: short
 *
 *      Comments:
 *
 */

short syl_find_vowel (int *ph)
{
#ifdef SPANISH
	int	vc, hit = 0;
#endif
#if defined ENGLISH_US || defined ENGLISH_UK// NAL warning removal
	int l;
#endif
#ifndef FRENCH
	int j;
#endif
	int i, off;
#ifdef ENGLISH
	int k=0;
#endif

	off = 1;
	for (i = 0; ph[i] != WBOUND; i--)
	{
		if (ascky_check[ph[i] & PVALUE])
		{
#ifdef ENGLISH_US
			for (j = 0; syl_vowels[j] != 0; j++)
			{
				if (ascky_check[ph[i] & PVALUE] == syl_vowels[j])
				{
					for (k = 1; ascky_check[ph[i - k] & PVALUE] == 0 && ph[i - k] != WBOUND; k++);
					if (ph[i - k] != US_YU)
						return (off);
					for (l = k + 1; ascky_check[ph[i - l] & PVALUE] == 0 && ph[i - l] != WBOUND; l++);
					if (ph[i - l] != WBOUND)
						return (off);
					return (off);
				}
				if (ph[i] == US_YU)
				{
					for (k += 1; ascky_check[ph[i - k] & PVALUE] == 0 && ph[i - k] != WBOUND; k++);
					if (ph[i - k] != WBOUND)
						return (off);
					else
						return (0);
				}
			}
#endif
#ifdef ENGLISH_UK
			for (j = 0; syl_vowels[j] != 0; j++)
			{
				if (ascky_check[ph[i] & PVALUE] == syl_vowels[j])
				{
					for (k = 1; ascky_check[ph[i - k] & PVALUE] == 0 && ph[i - k] != WBOUND; k++);
					if (ph[i - k] != UKP_YU)
						return (off);
					for (l = k + 1; ascky_check[ph[i - l] & PVALUE] == 0 && ph[i - l] != WBOUND; l++);
					if (ph[i - l] != WBOUND)
						return (off);
					return (off);
				}
				if (ph[i] == UKP_YU)
				{
					for (k += 1; ascky_check[ph[i - k] & PVALUE] == 0 && ph[i - k] != WBOUND; k++);
					if (ph[i - k] != WBOUND)
						return (off);
					else
						return (0);
				}
			}
#endif
#ifdef SPANISH
			for (j = 0; syl_vowels[j] != 0; j++)
			{
				if (ascky_check[ph[i] & PVALUE] == syl_vowels[j])
				{
					/* 
					 * any vowel before i and u or Y and W become one.
					 * also if this or any vowel preceed by iuYW it also 
					 * becomes one vowel as with ia ana iai 
					 */
					vc = i;
					if (ph[i] == 3 || (ph[i] >= 5 && ph[i] <= 7))
					{
						if (ascky_check[ph[i - 1] & PVALUE] == syl_vowels[j])
							hit = 1;
						vc--;
					}
					vc--;
					while (ph[vc] >= BLOCK_RULES && ph[vc] < SBOUND)
					{
						hit = 1;
						vc--;
					}
					/* if preceeded by 'i' || 'u' ||'y' || 'w' */
					if (ph[vc] == 3 || (ph[vc] >= 5 && ph[vc] <= 7))
					{
						hit = 1;
					}
					if (hit)
						off += i - vc;
					return (off);
				}
			}
#endif
		}
		off += 1;
	}
	return (0);
}
/*
 *      Function Name: syl_find_cons()      
 *
 *  	Description: 
 *
 *      Arguments: short *ph
 *
 *      Return Value: short
 *
 *      Comments:
 *
 */
short syl_find_cons (int *ph)
{
	int                   *tp;
	int                     i= 0 , j = 0, len = 0;

#ifdef ENGLISH_US
	tp = ph;
	if (*tp-- == 26+ (PFUSA<<PSFONT))
	{
		for (j = 0; syl_vowels[j] != 0; j++)
		{
			if (ascky_check[(*tp) & PVALUE] == syl_vowels[j])
			{
				return (0);
			}
		}
	}
#endif
#ifdef ENGLISH_UK
	tp = ph;
	if (*tp-- == 26 + (PFUK << PSFONT))
	{
		for (j = 0; syl_vowels[j] != 0; j++)
		{
			if (ascky_check[(*tp) & PVALUE] == syl_vowels[j])
			{
				return (0);
			}
		}
	}
#endif
#ifdef FRENCH
	tp = ph;
	if (*tp-- == 26 + (PFFR<<PSFONT))
	{
		for (j = 0; syl_vowels[j] != 0; j++)
		{
			if (ascky_check[(*tp) & PVALUE] == syl_vowels[j])
			{
				return (0);
			}
		}
	}
#endif
	for (j = 0; syl_cons[j]; j++)
	{
		for (i = 0; syl_cons[j][i]; i++);
/* printf(" %s ons %d \n",syl_cons[j],len); */
		len = i;
		tp = ph;
		while (true)
		{
			if (ascky_check[(*tp) & PVALUE] == 0)
			{
#ifdef ENGLISH_US
				tp++;
#endif      
#ifdef ENGLISH_UK
				tp++;
#endif      
#ifdef SPANISH
				tp--;
#endif
#ifdef FRENCH
				tp++;
#endif 
				len += 1;

			}
			else
			{

/* 
 * printf("asc = %c \n",syl_cons[j][i-1]);
 * 
 * printf("look at   %d %c \n",ascky_check[*tp],ascky_check[*tp]); 
 */
				--i;
				if (syl_cons[j][i] != ascky_check[(*tp) & PVALUE])
				{
					tp--;
					break;
				}
				tp--;
			}
			if (i == 0)
				return (len);
		}
	}
	return (0);
}
/*
 *      Function Name: syl_find_affix()      
 *
 *  	Description: Finds common english affix.
 *
 *      Arguments: PDPH_T pDph_t, short *ph
 *
 *      Return Value: short
 *
 *      Comments:
 *
 */
static short syl_find_affix (PDPH_T pDph_t, int *ph)
{
	int *tp;
	int i, j, len = 0;

	for (j = 0; common_affixes[j]; j++)
	{
		for (i = 0; common_affixes[j][i]; i++);
		len = i;
		tp = ph;
		while (true)
		{
			if (ascky_check[(*tp) & PVALUE] == 0)
			{
#ifdef ENGLISH_US
				tp++;
#endif
#ifdef ENGLISH_UK
				tp++;
#endif
#ifdef SPANISH
				tp--;
#endif
#ifdef FRENCH
				tp++;
#endif
				len += 1;
			}
			else
			{
				--i;
				if ((common_affixes[j][i]) != (ascky_check[(*tp) & PVALUE]))
				{
					tp--;
					break;
				}
				tp--;
			}
			if (i == 0)
				return (len);
		}
	}
	return (0);
}

#ifndef MSDOS

#ifdef WIN32
#include <windows.h>
#include <mmsystem.h>
#endif

#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
/* GL 04/21/1997  change to be the same as the latest OSF code */
/*#include "dtmmedefs.h"*/
#include "opthread.h"
#endif

#include "tts.h"

/* LPTTS_HANDLE_T TextToSpeechGetHandle(void); */

#ifndef ARM7
void TextToSpeechErrorHandler (LPTTS_HANDLE_T, UINT, MMRESULT);
#endif

#endif
/*
 *      Function Name: logsyllable()      
 *
 *  	Description: Writes sylables to output specified by phTTS->pLogFile
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void logsyllable (LPTTS_HANDLE_T phTTS)
{
	int                     i, j, k;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
#ifndef ARM7
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
#endif

#ifndef MSDOS
/* 
 * LPTTS_HANDLE_T phTTS;
 * 
 * phTTS = TextToSpeechGetHandle(); 
 */
#endif

#ifdef WIN32
	EnterCriticalSection (phTTS->pcsLogFile);
#endif
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
	/* GL 04/21/1997  change this as the latest OSF code */
	/*ToggleLogfileMutex (MUTEX_RESERVE);*/
	OP_LockMutex( phTTS->pcsLogFile );
#endif

	for (i = 1; i < pDph_t->nsymbtot; i++)
	{
		/* 
		 *  first, isolate phonemic words ...
		 */
		pDph_t->phone_struct[0] = WBOUND;
		for (j = 0; pDph_t->symbols[i + j] != WBOUND && i + j < pDph_t->nsymbtot && j < 256; j++)
		{
			pDph_t->phone_struct[j + 1] = pDph_t->symbols[i + j];
		}
		j++;    
		pDph_t->phone_struct[j]=0;
		pDph_t->phone_struct[j+1]=0;
		i += j - 1;
		k = ph_syllab (pDph_t, j);
#ifdef MSDOS
		WAIT_PRINT;
		printf ("[:syll ");
#else
#ifdef PRINTFDEBUG
		printf ("[:syll ");
#endif
#ifndef ARM7_NOSWI
		
#ifndef MSDOS
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			fprintf(pKsd_t->dbglog,"[:syll ");
#endif
#endif		
#ifndef ARM7
		if (pKsd_t->logflag & LOG_SYLLABLES)
		{
			if (fprintf (phTTS->pLogFile, "[:syll ") < 0)
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			}
		}
#endif
#endif

#ifdef MSDOS

		/* 
		 * the table pKsd_t->ascky should be change 
		 * when a [:lang ] commad is engountered 
		 */
		for (j = 0; pDph_t->phone_struct[j]; j++)
		{
		printf ("%c", pKsd_t->ascky[pDph_t->phone_struct[j] & PVALUE]);	
		}

		printf (" --> ");

		while (--k)
		{
		printf ("%c", pKsd_t->ascky[pDph_t->syllable_struct[k] & PVALUE]);
		}
		printf ("]\n");
		SIGNAL_PRINT;
#else //#ifdef MSDOS
#ifndef ARM7_NOSWI

		for (j = 0; pDph_t->phone_struct[j]; j++)
		{

#ifdef PRINTFDEBUG
			printf ("%c", pKsd_t->ascky[pDph_t->phone_struct[j] & PVALUE]);
#endif
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
				fprintf(pKsd_t->dbglog,"%c", pKsd_t->ascky[pDph_t->phone_struct[j] & PVALUE]);

#ifndef ARM7
			if (pKsd_t->logflag & LOG_SYLLABLES)
			{


				if (fprintf (phTTS->pLogFile,
							 "%c", pKsd_t->ascky[pDph_t->phone_struct[j] & PVALUE]) < 0)
				{
					TextToSpeechErrorHandler (phTTS,
											  ERROR_WRITING_FILE,
											  0L);
				}
			}
#endif
		}
#ifdef PRINTFDEBUG
		printf (" --> ");
#endif
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
				fprintf(pKsd_t->dbglog, " --> ");
#ifndef ARM7
		if (pKsd_t->logflag & LOG_SYLLABLES)
		{

			if (fprintf (phTTS->pLogFile, " --> ") < 0)
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			}
		}
#endif
		while (--k)
		{
#ifdef PRINTFDEBUG
			printf ("%c", pKsd_t->ascky[pDph_t->syllable_struct[k] & PVALUE]);
#endif
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
				fprintf(pKsd_t->dbglog,"%c", pKsd_t->ascky[pDph_t->syllable_struct[k] & PVALUE]);
#ifndef ARM7
			if (pKsd_t->logflag & LOG_SYLLABLES)
			{
				if (fprintf (phTTS->pLogFile,
							 "%c", pKsd_t->ascky[pDph_t->syllable_struct[k] & PVALUE]) < 0)
				{
					TextToSpeechErrorHandler (phTTS,
											  ERROR_WRITING_FILE,
											  0L);
				}
			}
#endif
		}
#ifdef PRINTFDEBUG
		printf ("]\n");
#endif
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			fprintf(pKsd_t->dbglog,"]\n");
#ifndef ARM7
		if (pKsd_t->logflag & LOG_SYLLABLES)
		{
			if (fprintf (phTTS->pLogFile, "]\n") < 0)
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			}
		}
#endif
#endif
#endif // #ifdef MSDOS

	}
#ifdef WIN32
	LeaveCriticalSection (phTTS->pcsLogFile);
#endif
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
	/* GL 04/21/1997  change this as the latest OSF code */
	/* ToggleLogfileMutex (MUTEX_RELEASE);*/
	OP_UnlockMutex( phTTS->pcsLogFile );
#endif

}
/*
 *      Function Name: ph_syllab()
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   int j
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */
static int ph_syllab (PDPH_T pDph_t, int j)
{
	int k; 
	short len;

	/* 
	 *  first, strip off any  ...
	 */

	k = 0;
	while (true)
	{
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
		len = syl_find_affix (pDph_t, &(pDph_t->phone_struct[j]));
#else
        len = syl_find_affix (pDph_t, &(pDph_t->phone_struct[j])); // NAL warning removal
#endif
		if (len == 0)
			break;
		while (len-- && j)
			pDph_t->syllable_struct[k++] = pDph_t->phone_struct[j--];
		if (j == 0)
			break;
		while (j && ascky_check[pDph_t->phone_struct[j] & PVALUE] == 0)
			pDph_t->syllable_struct[k++] = pDph_t->phone_struct[j--];
		if (pDph_t->syllable_struct[k-1] != SBOUND)		/* fix duplicated syllable boundries */
			pDph_t->syllable_struct[k++] = SBOUND;
		
	}
	/* 
	 *  Now, syllablify the rest of it ...
	 */
	if (j != 0)
	{
		while (true)
		{
			/* 
			 *  Find vowel ...
			 */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			len = syl_find_vowel (&(pDph_t->phone_struct[j]));
#else
                        len = syl_find_vowel ( &(pDph_t->phone_struct[j])); // NAL warning removal
#endif
			if (len)
			{
				while (len-- && j)
				{
					pDph_t->syllable_struct[k++] = pDph_t->phone_struct[j--];
				}
				if (j == 0)
					break;
				while (j && ascky_check[pDph_t->phone_struct[j] & PVALUE] == 0)
					pDph_t->syllable_struct[k++] = pDph_t->phone_struct[j--];
			}
			else
			{
				while (j)
					pDph_t->syllable_struct[k++] = pDph_t->phone_struct[j--];
				break;
			}


			/* 
			 *  head cons ...
			 */


#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_


			len = syl_find_cons( &(pDph_t->phone_struct[j]));


#else

            len = syl_find_cons( &(pDph_t->phone_struct[j])); // NAL warning removal

#endif

			if (len)
			{
				while (len-- && j)

					pDph_t->syllable_struct[k++] = pDph_t->phone_struct[j--];

				if (j == 0)

					break;

			}


			/* 
			 *  syllable break must be here ... if we are not word initial ...
			 */


			while(j && ascky_check[pDph_t->phone_struct[j] & PVALUE] == 0)
				pDph_t->syllable_struct[k++] = pDph_t->phone_struct[j--];


			if(j == 0)
			{
				break;
			}


			if (pDph_t->phTTS->pKernelShareData->sayflag == SAY_SYLLABLE)
			{

				if(pDph_t->syllable_struct[k-1] != SBOUND)	/* fix duplicated syllable boundries */	
					pDph_t->syllable_struct[k++] = SBOUND;

			}
			else
			{

				pDph_t->syllable_struct[k++] = SBOUND;

			}

		}

	}
	return (k);
}



/*
 *      Function Name: syl_clause_init()       
 *
 *  	Description: Initializes vars. used for clause processing
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */


static void syl_clause_init (PDPH_T pDph_t)
{

	if (pDph_t->phTTS->pKernelShareData->sayflag == SAY_SYLLABLE)
	{
		pDph_t->symbols[0] = COMMA;
		pDph_t->user_durs[0] = 0;
		pDph_t->user_f0[0] = 0;
		pDph_t->bound = COMMA;
		pDph_t->lastoffs = 0;
		pDph_t->nphone = 0;
		pDph_t->asperation = 0;
		pDph_t->nsymbtot = 1;
		pDph_t->nphone = 0;
	}
}

/*
 *      Function Name: speak_syllable()      
 *  	Description: Calls phclause() to pronounce clause, then writes to
 *					 VTM pipe.
 *      Arguments: LPTTS_HANDLE_T phTTS
 *      Return Value: void
 *      Comments:
 *
 */
static void speak_syllable (LPTTS_HANDLE_T phTTS)
{
/* GL 04/21/1997  change this as the latest OSF code */
#ifndef MSDOS
//#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
	DT_PIPE_T               pipe_item[1];
#endif
#ifndef SINGLE_THREADED
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
#endif
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	if (pDph_t->phTTS->pKernelShareData->sayflag == SAY_SYLLABLE)
	{
		pDph_t->symbols[pDph_t->nsymbtot] = COMMA;
	}
	else
	{
		pDph_t->symbols[pDph_t->nsymbtot] = SBOUND;
	}
	pDph_t->user_durs[pDph_t->nsymbtot] = 0;
	pDph_t->user_f0[pDph_t->nsymbtot++] = 0;
	if (pDph_t->phTTS->pKernelShareData->sayflag == SAY_SYLLABLE)
	{
		phclause (phTTS);
		syl_clause_init (pDph_t);
	}

/* GL 04/21/1997  change this as the latest OSF code */
/* write forced clause boundary symbol to VTM */
#ifndef  MSDOS
	if (pDph_t->phTTS->pKernelShareData->sayflag == SAY_SYLLABLE)
	{
//#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
	pipe_item[0] = SPC_type_force;
#ifndef SINGLE_THREADED	
	write_pipe (pKsd_t->vtm_pipe, pipe_item, 1);
#else
	vtm_loop(phTTS,pipe_item);
#endif
	}
#endif

}

#endif /* #if defined ENGLISH_US || SPANISH */
/***************************************ph_syl.c***************************************/
