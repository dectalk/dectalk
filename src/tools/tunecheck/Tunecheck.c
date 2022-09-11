/********************************************************************************
*																				
*                           Copyright ©										    
*	 Copyright © 2000-2001 Force Computers, a Solectron Company. All rights reserved.			
*	 © SMART Modular Technologies, 2000. All rights reserved.				
*																				
*    Restricted Rights: Use, duplication, or disclosure by the U.S.				
*    Government is subject to restrictions as set forth in subparagraph			
*    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR			
*    52.227-14 Alt. III, as applicable.											
*																				
*    This software is proprietary to and embodies the confidential				
*    technology of Force Computers Incorporated and other parties.				
*    Possession, use, or copying of this software and media is authorized		
*    only pursuant to a valid written license from Force or an				    
*    authorized sublicensor.													
*																				
*********************************************************************************
* a program that does a quick test of the synthesizer for						
* tuning and overloading.														
*																				
* this is based loosely on dtmemory. It only writes								
* the synthesizer output to memory, and then discards it after					
* it runs some stats on it.														
*																				
* 001 tek 03/02/1999	added tuner dv string generation							
* 002 EAB 03/19/1999	Modified for submittal to starteam and also modified for		
* 003 CJL				faster tuning and added comments to help other users also		
*						changed _DEBUG to DEBUG_TUNER as _DEBUG is used elsewhere		
* 004 NAL 01/20/2000	Made FullTune option to tune all the voices						
*						created	a table of offsets of the tuned params for each voice	
* 005 NAL 02/09/2000	Added Quiktune define to make param files for quiktuner's use	
*						Fixed endless loop if voice is bad and can't be tuned			
*						Puts a compiler error flag in offset file when bad tune			
* 006 EAB 03/01/2000	Made tuner depend on dectalkf.h for new_vocal_tract				
* 007 NAL 03/02/2000	Tunecheck now builds into the appropriate build\dectalk\lang dir
*						and creates the offset file directly into src\PH.				
* 008 NAL 03/15/2000	Removed -f option and made it default
* 009 NAL 04/27/2000	Cleaned up for check - in
* 010 NAL 04/28/2000	Added backup support for long tunes in case of sys/power/etc. failure
* 011 NAL 06/13/2000	BATS #930 Now puts clean array for Val in tunefile.
* 012 NAL 07/19/2000	Added French support
* 013 NAL 08/17/2000	Fixed a concurrency problem. Fixed call to free a null pointer.
*						Cosmetic changes.
* 014 MGS 08/30/2000	Increased the speed of the tuner
* 015 CAB 10/13/2000	Fixed copyright
* 016 CAB 02/23/2001    Updated copyright info
*********************************************************************************
*	Documentation. Last edited 23mar00
*
*	Tunecheck is built into build\dectalk\lang. Put any text file for tuning in the
*		same dir. After the tunechecker finishes, the file p_lang_vdef_tune.c is
*		automatically created in PH, and you must rebuild dectalk.dll for any
*		changes to occur.
*	For full tune, at commandline: tunecheck -t [textfile] -r [resultfile]
*		textfile is the file used in the tuning
*		resultfile logs phoneme overloads and RMS vals. If missing, defaults to
*		res.txt
*	To tune 1 voice, use -a. No offset file created with this flag set.
*	-p [prefix] is useful for changing voice to tune with -a
*	-s [samp] sets sample rate (8000 or 11025)
*	-b [bytes] sets bytes/sample (1 or 2)
*********************************************************************************/

#define STRICT
#include <windows.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <time.h>

//#include "ttsapi.h"
#include "dectalkf.h"
#include "tts.h"
#include "vtminst.h"

//#define DEBUG_TUNER

#define SAMPLES_PER_BUFFER	(4000)
#define BUFS_PER_INSTANCE	(4) // number of buffers available
#define NUMBER_OF_VOICES	36	// Number of voices (times 2 for 8 bit voices)
#define STARTING_VOICE		0	/* The starting voice for tuning. Should be 0 for normal tuning.
								   Sometimes useful to change if you just want to tune one voice
								   for testing. The first half are 8 bit voices
								*/
// allowable combinations of sample rates are
//		8-bit	16-bit
// 8000   Y		   N
// 11025  Y		   Y

UINT uiBytesPerSample=2; // default to 16-bit
UINT uiSampleRate=11025; //default to 11KHz
DWORD dwFormat;

BOOL bVerbose =				FALSE;
BOOL bUseBackup =			FALSE;
BOOL g_bDidOverload =		FALSE;
BOOL g_bDoAutotune =		TRUE;	// tek 02mar99 do autotuning
BOOL g_bDoFullAutotune =	TRUE;	// NAL 17Jan00 do fully automated autotune
BOOL TUNEERROR =			FALSE;	// set flag in offsetfile if something goes wrong


int 			create_empty_file=FALSE;

int g_iParamToTune=2; // what parameter we're tuning

LPTTS_HANDLE_T		ttsHandlePtr;		/* DECtalk TTS handle          */
TTS_BUFFER_T		ttsbBuf[BUFS_PER_INSTANCE];		/* buffer structs */
TTS_INDEX_T			ttsiIndex[BUFS_PER_INSTANCE];	/* index structs */
DWORD				dwTotalSamples;		/* total samples generated */
DWORD				dwTotalBuffers;		/* total buffer turns */
DWORD				dwStartTime;		/* time we sent the first text */
DWORD				dwFirstBufferTime;	/* time we got the first buffer */
DWORD				dwLastBufferTime;	/* time we got the most recent buffer*/
volatile BOOL		bSynthIsRunning;	/* if clear, don't turn buffers. */
BOOL				bGotDoneMark;		/* set when we see the final index */
BOOL				bRequestRequeue;	/* set by main loop to signal for more*/
DWORD				dwTotalPasses;		/* total complete runs */

/****************************************************************************/
typedef short S16;
//#include "tunecheck.h"

// tek 02mar99 the datastruct we use to set up a tuning pass
// this becomes part of a union, and the 'other' side of the 
// union  is used to access the parameters for tuning. This means
// that the first parameter tuned is the one at the top of this 
// list, and they are tuned in order. So, if you want to change the
// order that gains are tuned, just change the order of the
// params in this struct.
#ifdef HLSYN
typedef struct TUNERPARAMS_T {
	int gf; // gain of frication
	int gh; // gain of aspiration
	int	gv;  //Gain of voicing
	int gn;  // Gain of pole zero pair later might want to make both tunable
	int g3; //formant 3
	int	g1; //formant 5
	int g2; //formant 4
	int g4; //formant 2
	int	g5; //formant 1
	char string[256];
} TUNERPARAMS;
#elif defined NEW_VOCAL_TRACT
typedef struct TUNERPARAMS_T {
	int gf; // gain of frication
	int gh; // gain of aspiration
	int	gv;  //Gain of voicing
	int gn;  // Gain of pole zero pair later might want to make both tunable
	int g3; //formant 3
	int	g1; //formant 5
	int g2; //formant 4
	int g4; //formant 2
	int	g5; //formant 1
	char string[256];
} TUNERPARAMS;
#else 
typedef struct TUNERPARAMS_T {
	int gf; // gain of frication
	int gh; // gain of aspiration
	int	gv;  //Gain of voicing
	int gn;  // Gain of pole zero pair later might want to make both tunable
	int	g1; //formant 5
	int g2; //formant 4
	int g3; //formant 3
	int g4; //formant 2
	int	g5; //formant 1
	
	char string[256];
} TUNERPARAMS;
#endif //NEW_VOCAL_TRACT from dectalkf.h

#if defined(VTM1) || defined(VTM2)
#define MAX_TRIGGER 16000 // VTM1, VTM2
#else
#define MAX_TRIGGER 20000 // VTM3
#endif

#define NUMTUNERPARAMS (9)
typedef union TUNERUNION_T {
	TUNERPARAMS tp;
	int params[NUMTUNERPARAMS];
} TUNERUNION;

_inline int checkmax(S32 value,S32 checkval);


// the function that makes the string
void MakeTunerParams(TUNERPARAMS *pTP)
{
	sprintf(pTP->string,
		"[:sync][:dv gf %d gh %d gv %d gn %d g1 %d g2 %d g3 %d g4 %d g5 %d][:sync]",
		pTP->gf,
		pTP->gh,
		pTP->gv,
		pTP->gn,
		pTP->g1,
		pTP->g2,
		pTP->g3,
		pTP->g4,
		pTP->g5);
}


int TunedTable[NUMBER_OF_VOICES+1][sizeof(SPDEFS)/sizeof(short)];	// hold all of the tuned params for Full Tune
						// 9 voices * 2 bit rates (8, 16) + val = 19

#define  GF 16
#define  GH 17
#define  GV 18
#define  GN 19
#define  G1 20
#define  G2 21
#define  G3 22
#define  G4 23
#define  LO 24
int nextVoice = 0;			// determines which prefix to use for full tuning

// a global instance of the tuner params that we fill in..
// eab note since we are tuning down the first instance (gv) is set above what I would
// expect to be an overload this must be watched to make sure it always generates anoverload 
//otherwise it need to be set hotter
//TUNERUNION gTunerUnion = {78,0,0,0,0,0,0,0,""}; // Declared inside of DoAutotune()
// a global keeper of the limit for each param..
//TUNERUNION gTunerLimits = {80,80,80,80,80,80,80,""};
// limits now implied by offset to base levels (30) in later portion of code
// private definitions of function codes for 
// TextToSpeechTuning()
#define TTSTUNING_ENABLE (1)
#define TTSTUNING_DISABLE (2)
#define TTSTUNING_GET_RESULTS (3)
MMRESULT TextToSpeechTuning(LPTTS_HANDLE_T phTTS,
							int iFunction, 
							VTM_TUNER_DATA *pvtdArg);


VOID TTSCallbackRoutine(LONG lParam1, LONG lParam2,
						DWORD dwInstanceParam, UINT uiMsg);
void ParseTime(int);
void StartText();
void CreateOffsetFile();
void DoAutotune();
void DoFullAutoTune();
void ShowHelpMsg();
void LookForBackup();


#ifdef HLSYN
#ifdef ENGLISH
char OFFSETFILE[] = "p_us_vdf_tunehl.c";
char *message = "\n\nNow tuning ENGLISH_US HL\n";
#endif // ENGLISH

#ifdef ENGLISH_UK
char OFFSETFILE[] = "p_uk_vdf_tunehl.c";
char *message = "ENGLISH_UK HL";
#endif // ENGLISH_UK

#ifdef SPANISH
char OFFSETFILE[] = "p_sp_vdf_tunehl.c";
char *message = "SPANISH_SP HL";
#endif // SPANISH

#ifdef ITALIAN
char OFFSETFILE[] = "p_it_vdf_tunehl.c";
char *message = "ITALIAN HL";
#endif // SPANISH

#ifdef SPANISH_LA
char OFFSETFILE[] = "p_la_vdf_tunehl.c";
char *message = "SPANISH_LA HL";
#endif // SPANISH_LA

#ifdef GERMAN
char OFFSETFILE[] = "p_gr_vdf_tunehl.c";
char *message = "GERMAN HL";
#endif // GERMAN

#ifdef FRENCH
char OFFSETFILE[] = "p_fr_vdf_tunehl.c";
char *message = "FRENCH HL";
#endif // FRENCH
#else  // HLSYN
#ifdef ENGLISH
char OFFSETFILE[] = "p_us_vdf_tuneint.c";
char *message = "\n\nNow tuning ENGLISH_US Int\n";
#endif // ENGLISH

#ifdef ENGLISH_UK
char OFFSETFILE[] = "p_uk_vdf_tuneint.c";
char *message = "ENGLISH_UK Int";
#endif // ENGLISH_UK

#ifdef SPANISH
char OFFSETFILE[] = "p_sp_vdf_tuneint.c";
char *message = "SPANISH_SP Int";
#endif // SPANISH

#ifdef ITALIAN
char OFFSETFILE[] = "p_it_vdf_tuneint.c";
char *message = "Italian Int";
#endif // SPANISH

#ifdef SPANISH_LA
char OFFSETFILE[] = "p_la_vdf_tuneint.c";
char *message = "SPANISH_LA Int";
#endif // SPANISH_LA

#ifdef GERMAN
char OFFSETFILE[] = "p_gr_vdf_tuneint.c";
char *message = "GERMAN Int";
#endif // GERMAN

#ifdef FRENCH
char OFFSETFILE[] = "p_fr_vdf_tuneint.c";
char *message = "FRENCH Int";
#endif // FRENCH
#endif // HLSYN

ULONG	ulInFileSize=0;				// size of the input file
#define MAXFILENAME (255)

FILE *fpInFile		= NULL;			// the input file
FILE *fpResultFile	= NULL;			// the result log file
FILE *fpBackup		= NULL;			// backup file
FILE *fpOffsetFile	= NULL;			// offsets file

char szInFileName[MAXFILENAME+1]		= "";
char szResultFileName[MAXFILENAME+1]	= "res.txt";
char szBackup[]							= "backup.txt";
char offsetPath[]  = ".\\..\\..\\..\\..\\src\\PH\\";

#define COMMENTLEN (255)
#define BUF_REALLOC_SIZE (1024)				// for the input data buffer

char lang_tag[100]={'\0'};

char szComment[COMMENTLEN+1]="";

char *szInputData=NULL;						// where we put the input text

ULONG	ulInputDataSize=0;
ULONG	ulInputCount=0;

void *pvTempMalloc=NULL;
char *pszPrefixText=NULL;
char	*pcBufArray=NULL;					// the buffers
UINT	uiID_Buffer_Msg=0;					// for buffer turns..
double dLevel=0;							// where we accumulate average level

int	startTime=0;

int	main(int argc, char *argv[])
{
	int			argp = 0;
	int			level = 0;

	startTime = time(NULL);
	// parse the args and fill in the blanks..
	for (argp=1; argp<argc; argp++)
	{
		if (argv[argp][0] != '-')
		{
			printf("can't parse switch %s\n",argv[argp]);
			printf("Use -h for help.\n");
			exit(-1);
		}

		switch (argv[argp][1])
		{
		case 'H':
		case 'h':
		case '?':
			ShowHelpMsg();
			exit(1);
			break;

		case 'A':	// do autotuning
		case 'a':

			g_bDoFullAutotune = FALSE;
			printf("WARNING: NO OFFSETFILE WILL BE CREATED! (cause: -a)\n");
			Sleep(3000);	// Make sure user sees warning before it scrolls off screen
			break;

			
		case 'T':
		case 't':

			// the input filename

			argp++;
			if (argp>=argc)
			{
				printf("switch missing argument: %s\n",argv[--argp]);
				printf("Use -h for help.\n");
				exit(-3);
			}
			
			// put it in the global, length-limited..
			strncpy(szInFileName,argv[argp],MAXFILENAME);
			szInFileName[MAXFILENAME] = '\0'; // for safety
			// see if we had to truncate it.. 
			if (strlen(argv[argp]) != strlen(szInFileName))
			{
				printf("!*** WARNING ***!\n !*** Input File Name was truncated!\n");
			}
			
			break;		
			
		case 'S':
		case 's':
			// the output format - sample rate
			{
				long lTemp=0;
				argp++;
				if (argp>=argc)
				{
					printf("switch missing argument: %s\n",argv[--argp]);
					printf("Use -h for help.\n");
					exit(-3);
				}

				// pull it in..
				lTemp = (DWORD) atol(argp[argv]);
				if (  (lTemp != 8000)
					&&(lTemp != 11025) )
				{
					printf("Invalid sample rate %ld; only 8000 and 11025 allowed.\n",lTemp);
					printf("Use -h for help.\n");
					exit(-3);
				}
				uiSampleRate = (UINT)lTemp;
			}
			break;
		case 'B':
		case 'b':
			// the output format - bytes/sample
			{
				long lTemp=0;
				argp++;
				if (argp>=argc)
				{
					printf("switch missing argument: %s\n",argv[--argp]);
					printf("Use -h for help.\n");
					exit(-3);
				}
				
				// pull it in..
				lTemp = (DWORD) atol(argp[argv]);
				if (  (lTemp != 1)
					&&(lTemp != 2) )
				{
					printf("Invalid bytes-per-sample %ld; only 1 or 2 allowed.\n",lTemp);
					printf("Use -h for help.\n");
					exit(-3);
				}
				uiBytesPerSample = (UINT)lTemp;
			}
			break;
			
		case 'R':
		case 'r':
			// the results filename
			argp++;
			if (argp>=argc)
			{
				printf("switch missing argument: %s\n",argv[--argp]);
				printf("Use -h for help.\n");
				exit(-3);
			}
			
			// put it in the global, length-limited..
			strncpy(szResultFileName,argv[argp],MAXFILENAME);
			szResultFileName[MAXFILENAME] = '\0'; // for safety
			// see if we had to truncate it.. 
			if (strlen(argv[argp]) != strlen(szResultFileName))
			{
				printf("!*** WARNING ***!\n !*** Result File Name was truncated!\n");
			}
			
			break;
		case 'P':
		case 'p':
			// prefix text
			{
				argp++;
				if (argp>=argc)
				{
					printf("switch missing argument: %s\n",argv[--argp]);
					printf("Use -h for help.\n");
					exit(-3);
				}
				// pull it in..
				pszPrefixText = argv[argp];
			}
			break;
		case 'L':
		case 'l':
			{
				argp++;
				if (argp>=argc)
				{
					printf("switch missing argument: %s\n",argv[--argp]);
					printf("Use -h for help.\n");
					exit(-3);
				}
			}
			strcpy(lang_tag,argv[argp]);
			break;
		case 'e':
		case 'E':
			create_empty_file=1;
			break;


		default:
			printf("unknown switch %s\n",argv[argp]);
			printf("Use -h for help.\n");
			exit (-2);
		}// switch arg
	} // for args

	fpResultFile = fopen(szResultFileName,"w");
	if (fpResultFile == NULL)
	{
		printf(" could not open result file %s\n",szResultFileName);
		exit(2);
	}

	
	// write the comment to the result file..
	fprintf(fpResultFile, "%s\n", szComment);
	// write the format to the output file


	if(g_bDoFullAutotune)
	{
		LookForBackup();
		DoFullAutoTune();
	}
	else
	{
		DoAutotune();
	}

	free(szInputData);
	if( fclose (fpResultFile) )
	{
		printf("Result File was not closed!\n");
	}

	if(g_bDoFullAutotune)	// Finish the full tune and get the offsets
		CreateOffsetFile();


	if (g_bDidOverload)
	{
		printf("Overload detected!");
		return(1);
	}
	else
	{
		return(0);
	}
}// main()


/********************************************************************************/
/*	NAL 19Jan00	Put most of the initial stuff into it's own function so it will */
/*				be reinitialized for each voice during a full tune.				*/
/********************************************************************************/
void DoAutotune()
{
	int			iJ=0;
	BOOL		bDone=FALSE;
	MMRESULT	mmStatus=0;
	TUNERUNION gTunerUnion; //= {78,0,0,0,0,0,0,0,""};	// Must reset these vals for each tune
	VTM_TUNER_DATA vtdData;
	int count=0;
	short *DefaultParams;

	int gf=0,gh=0,gv=0;
	int tv=0,th=0,tf=0;
	int max=0;


	// make sure we don't have 8kHz 16-bit..
	if (  (uiBytesPerSample == 2)
		&&(uiSampleRate == 8000) )
	{
		printf("8kHz 16-bit not supported.\n");
		exit(3);
	}


	DefaultParams = TextToSpeechGetPhVdefParams(ttsHandlePtr, nextVoice);

	gf=DefaultParams[GF];
	gh=DefaultParams[GH];
	gv=DefaultParams[GV];

	max=gf;
	if (gh>max) max=gh;
	if (gv>max) max=gv;

	tf=gf-max+78;
	th=gh-max+78;
	tv=gv-max+78;
	while (tv<87 && th<87 && tv<78)
	{
		tf++; th++; tv++;
	}

	// init the tunerunion
	gTunerUnion.tp.gf=tf;//gf-max+78;
	gTunerUnion.tp.gh=th;//gh-max+78;
	gTunerUnion.tp.gv=tv;//gv-max+78;
	gTunerUnion.tp.gn=0;   
	gTunerUnion.tp.g1=0; 
	gTunerUnion.tp.g5=0; 
	gTunerUnion.tp.g2=0; 
	gTunerUnion.tp.g3=0; 
	gTunerUnion.tp.g4=0; 
	gTunerUnion.tp.string[0]='\0';
	
	if (strlen(szInFileName) != 0)
	{
		fpInFile = fopen(szInFileName,"r");
		if (fpInFile == NULL)
		{
			printf(" could not open input file %s\n",szInFileName);
			printf("Use -h for help.\n");
			exit(1);
		}
	}
	else
	{
		printf("No input file.\n");
		exit (1);
	}
	
	


	fprintf(fpResultFile, "Bytes/sample=%d, sample rate=%d\n",
			uiBytesPerSample, uiSampleRate);
	printf("\rBytes/sample=%d, sample rate=%d",
			uiBytesPerSample, uiSampleRate);

	
	// read in the input file to a memory buffer.
	szInputData = malloc(BUF_REALLOC_SIZE);
	if (szInputData == NULL)
	{
		printf(" no memory for input data? \n");
		exit(3);
	}
	ulInputDataSize = BUF_REALLOC_SIZE;
	ulInputCount = 0;	// how much we have so far..
	
	// stick the start index on the front of the buffer.. 
	strcpy(szInputData, "[:i m 1] ");

	if (pszPrefixText)
	{
		fprintf(fpResultFile, "PREFIX TEXT IS %s\n",pszPrefixText);
		printf("\tPREFIX: %s\n", pszPrefixText);
	}

	ulInputCount = strlen(szInputData);
	
	while(!feof(fpInFile))
	{
		ulInputCount += fread(&szInputData[ulInputCount],
			1,
			(ulInputDataSize - ulInputCount),
			fpInFile);
		if (ulInputCount > (ulInputDataSize-20))	// make sure there is space for
			// later addition of an index mark
		{
			char *szTempInputData = NULL;
			// realloc the buffer..
			szTempInputData = realloc(szInputData,ulInputDataSize+BUF_REALLOC_SIZE);
			if (szTempInputData == NULL)
			{
				printf("Out of memory for input buffer.\n");
				free(szInputData);
				exit(5);
			}
			szInputData = szTempInputData;
			ulInputDataSize += BUF_REALLOC_SIZE;
		}
	} // while input file
	// add in the trailing index

	strcpy(&szInputData[ulInputCount], " [:i m 2][:sync]");

	// get the final size..
	ulInputCount = strlen(szInputData);
	// mark the size of the input
	fprintf(fpResultFile,"Input file: %s  Net Size: %lu\n",szInFileName, ulInputCount);
	printf("File size: %lu\n", ulInputCount);

		pcBufArray = malloc(SAMPLES_PER_BUFFER*uiBytesPerSample*BUFS_PER_INSTANCE);
		if (pcBufArray == NULL)
		{
			printf("No memory for buffer data.\n");
			exit(5);
		
		}
		ttsHandlePtr = NULL;
		// we can init the synthesizer instances here too..
		mmStatus = TextToSpeechStartupEx(&ttsHandlePtr, WAVE_MAPPER, DO_NOT_USE_AUDIO_DEVICE, TTSCallbackRoutine, 1);
		if (mmStatus != MMSYSERR_NOERROR)
		{
			printf("TextToSpeechStartupEx() returned %lu\n",mmStatus);
			exit(10);
		}
		ttsHandlePtr->hTuneStopEvent=OP_CreateEvent(TRUE,FALSE);


/*  tek 02mar99 this is the part we loop in for autotuning; it's a "do" loop  */
/*              so that we make one pass through in non-tuning mode.          */
	do {
#ifndef DEBUG_TUNER
		if(strcmp(szResultFileName, "CON") )
		{
			switch(count){	// Just a visual to tell if the tuner is doing anything
			case 0:printf("\rTuning"); count++; break;
			case 1:printf("\rtUning"); count++; break;
			case 2:printf("\rtuNing"); count++; break;
			case 3:printf("\rtunIng"); count++; break;
			case 4:printf("\rtuniNg"); count++; break;
			case 5:printf("\rtuninG"); count++; break;
			case 6:printf("\rtuniNg"); count++; break;
			case 7:printf("\rtunIng"); count++; break;
			case 8:printf("\rtuNing"); count++; break;
			case 9:printf("\rtUning"); count=0; break;
			}
		}
#endif // DEBUG_TUNER

		// make sure we're not done with autotuning
		if (g_iParamToTune >= NUMTUNERPARAMS)
			break;


		// set up the data structures that we use to keep track of
		// what's happening..
		
		
		
		
		for (iJ=0;iJ<BUFS_PER_INSTANCE;iJ++)
		{
			ttsbBuf[iJ].lpData = &pcBufArray[(iJ)*(SAMPLES_PER_BUFFER*uiBytesPerSample)];
			
			ttsbBuf[iJ].lpPhonemeArray = NULL;
			// need an index array here, to see when we're done..
			// if we only have one, then we'll get the buffer immediately
			// when the index is encountered.
			ttsbBuf[iJ].lpIndexArray = &ttsiIndex[iJ];
			ttsbBuf[iJ].dwMaximumBufferLength = SAMPLES_PER_BUFFER*uiBytesPerSample;
			ttsbBuf[iJ].dwMaximumNumberOfPhonemeChanges = 0;
			ttsbBuf[iJ].dwMaximumNumberOfIndexMarks = 1;
			ttsbBuf[iJ].dwBufferLength = 0; // just for form..
		}
		dwTotalSamples = 0;
		dwTotalBuffers = 0;
		dwStartTime = 0; //fill in later..
		dwFirstBufferTime = 0; // fill in later
		dwLastBufferTime = 0; // fill in later
//		bSynthIsRunning = TRUE; // allow buffers..
		bRequestRequeue = FALSE;
		dwTotalPasses = 0;
		

		// this should never happen..
		if (ttsHandlePtr == NULL)
		{
			printf("TextToSpeechStartupEx() returned null handle!\n");
			exit(10);
		}
		// configure for synthesizing to memory..
		// set the format..
		switch (uiBytesPerSample)
		{
		case 1:
			if (uiSampleRate == 11025)
			{
				dwFormat = WAVE_FORMAT_1M08;
			}
			else if (uiSampleRate == 8000)
			{
				dwFormat = WAVE_FORMAT_08M08;
			}
			else
			{
				printf(" !! bad wave format?? \n");
				exit(2);
			}
			break;
		case 2:
			if (uiSampleRate == 11025)
			{
				dwFormat = WAVE_FORMAT_1M16;
			}
			else
			{
				printf(" !! bad wave format?? \n");
				exit(2);
			}
			break;
		default:
			{
				printf(" !! bad wave format?? \n");
				exit(2);
			}
		} // switch
		mmStatus = TextToSpeechOpenInMemory(ttsHandlePtr,dwFormat);
		if (mmStatus != MMSYSERR_NOERROR)
		{
			printf("TextToSpeechOpenInMemory() returned %lu\n",mmStatus);
			exit(10);
		}
		bSynthIsRunning = TRUE; // allow buffers.. // move this here
		// park the buffers..
		for (iJ=0;iJ<BUFS_PER_INSTANCE;iJ++)
		{
			mmStatus = TextToSpeechAddBuffer(ttsHandlePtr,&ttsbBuf[iJ]);
			if (mmStatus != MMSYSERR_NOERROR)
			{
				printf("TextToSpeechAddBuffer() returned %lu\n",mmStatus);
				exit(11);
			}
		}
		
		
		// pick up the ID for buffer changes..
#ifdef WIN32
		uiID_Buffer_Msg = RegisterWindowMessage("DECtalkBufferMessage");
#else
		uiID_Buffer_Msg=TTS_MSG_BUFFER;
#endif
		
		// initialize tuning data
		mmStatus = TextToSpeechTuning(ttsHandlePtr,TTSTUNING_ENABLE,NULL);
		
		

		OP_ResetEvent(ttsHandlePtr->hTuneStopEvent);

		//eab 3/5/99 If we have a prefix string send it now
		if (pszPrefixText)
		{
			TextToSpeechSpeak(ttsHandlePtr, pszPrefixText,0);
		}
		
		// do we have to send a tuning string?
		if (g_bDoAutotune)
		{
			// build the string..
			MakeTunerParams(&gTunerUnion.tp);
			TextToSpeechSpeak(ttsHandlePtr, gTunerUnion.tp.string,0);
			//printf("\n\n%s ", gTunerUnion.tp.string);
		}
		
		StartText();
		
				
		// hang out until we're done..
		bDone = FALSE;
		while (!bDone)
		{
			
			dLevel=0.0;

			OP_WaitForEvent(ttsHandlePtr->hTuneStopEvent,OP_INFINITE);
			//Sleep(50);
			// check to see if we're all done..
			bDone = TRUE;
			if (!bGotDoneMark)
			{
				bDone=FALSE;
			}
			memset(&vtdData,0,sizeof(vtdData));
			mmStatus = TextToSpeechTuning(ttsHandlePtr,TTSTUNING_GET_RESULTS,&vtdData);
			if(vtdData.bDidOverload)
			{
				// eab 3/10/99 As soon as we overload abandon ship- We want to fail
				// quickly and try again....
				bSynthIsRunning = FALSE; // do not allow buffers to be returned to dectalk in a reset
				// also TRUE causes speech to memory to be closed
				TextToSpeechReset(ttsHandlePtr, TRUE);
				TextToSpeechReset(ttsHandlePtr, TRUE);
				bDone=TRUE;
			}
			
			// flush out any text..
			fflush(fpResultFile);
		}
		// check the results..
		{
			if(vtdData.bDidOverload)
			{
				fprintf(fpResultFile,"\r ** Overload detected at phoneme %ld, previous phoneme %ld\n:",
					vtdData.dwThisPhoneme, vtdData.dwLastPhoneme);
				//printf("** Overload detected at phoneme %ld, previous phoneme %ld\n:",
				//	vtdData.dwThisPhoneme, vtdData.dwLastPhoneme);
				g_bDidOverload = TRUE;
			}
#ifdef DEBUG_TUNER
			else
			{
				fprintf(fpResultFile,"No overload detected\n");
			}
			fprintf(fpResultFile,"*maximum value of downsampled voice :            %5d\n" ,(int)vtdData.purevmax);
			fprintf(fpResultFile,"*maximum value within filter of casade rnz:      %5d\n" ,(int)vtdData.rnzmax);
			fprintf(fpResultFile,"*maximum value within filter of casade rnp:      %5d\n" ,(int)vtdData.rnpmax);
			fprintf(fpResultFile,"*maximum value within filter of casade 1(F5):        %5d\n" ,(int)vtdData.c5max);
			fprintf(fpResultFile,"*maximum value within filter of casade 2(F4):        %5d\n" ,(int)vtdData.c4max);
			fprintf(fpResultFile,"*maximum value within filter of casade 3(F3):        %5d\n" ,(int)vtdData.c3max);
			fprintf(fpResultFile,"*maximum value within filter of casade 4(F2):        %5d\n" ,(int)vtdData.c2max);
			fprintf(fpResultFile,"*maximum value within filter of casade 5(F1):        %5d\n" ,(int)vtdData.c1max);		
#endif
			
		}
		
		// print out the RMS level..
		if (dLevel!=0.0)
		{
			dLevel = dLevel / (double)dwTotalSamples;
			dLevel = sqrt(dLevel);
		}

		fprintf(fpResultFile,"RMS level is %f\n",dLevel);

#ifndef DEBUG_TUNER
		//if(strcmp(szResultFileName, "CON") )
			printf(" param %d of 9\tRMS level is %f",g_iParamToTune+1, dLevel);		
#endif

		// when we're done, close up shop.
		// shut down all synthesizer instances
		
		bSynthIsRunning = FALSE;
	TextToSpeechCloseInMemory(ttsHandlePtr);
#ifdef DEBUG_TUNER
		printf("Tune string is %s\n",gTunerUnion.tp.string);
#endif //DEBUG_TUNER
		
		// decide what to do with this param..
		if (g_bDidOverload)
		{
			g_bDidOverload = FALSE;
			// back down the gain..
			// eab 3/10/99 if bigger than 1 This check is boiler plate
			// no gain should ever normally be below 30.....

			if (checkmax(vtdData.purevmax,MAX_TRIGGER) && gTunerUnion.tp.gv>0 )
			{
				gTunerUnion.tp.gv--;
				gTunerUnion.tp.gf--;
				gTunerUnion.tp.gh--;
			} else
			if (checkmax(vtdData.r2pd1,MAX_TRIGGER) && gTunerUnion.tp.gv>0 )
			{
				gTunerUnion.tp.gv--;
				gTunerUnion.tp.gf--;
				gTunerUnion.tp.gh--;
			} else
			if (checkmax(vtdData.r3pd1,MAX_TRIGGER) && gTunerUnion.tp.gv>0 )
			{
				gTunerUnion.tp.gv--;
				gTunerUnion.tp.gf--;
				gTunerUnion.tp.gh--;
			} else
			if (checkmax(vtdData.r4pd1,MAX_TRIGGER) && gTunerUnion.tp.gv>0 )
			{
				gTunerUnion.tp.gv--;
				gTunerUnion.tp.gf--;
				gTunerUnion.tp.gh--;
			} else
			if (checkmax(vtdData.r5pd1,MAX_TRIGGER) && gTunerUnion.tp.gv>0 )
			{
				gTunerUnion.tp.gv--;
				gTunerUnion.tp.gf--;
				gTunerUnion.tp.gh--;
			} else
#if 0
			if (checkmax(vtdData.r6pd1,MAX_TRIGGER) && gTunerUnion.tp.gv>0 )
			{
				gTunerUnion.tp.gv--;
				gTunerUnion.tp.gf--;
				gTunerUnion.tp.gh--;
			} else
#endif
			if (checkmax(vtdData.rnzmax,MAX_TRIGGER)&& gTunerUnion.tp.gn>0)
			{
				gTunerUnion.tp.gn--;
			}
			else if (checkmax(vtdData.rnpmax,MAX_TRIGGER)&& gTunerUnion.tp.gn>0)
			{
				gTunerUnion.tp.gn--;
			}
			else if (checkmax(vtdData.c3max,MAX_TRIGGER)&& gTunerUnion.tp.g3>0)
			{
				gTunerUnion.tp.g3--;
			}
			else if (checkmax(vtdData.c5max,MAX_TRIGGER)&& gTunerUnion.tp.g1>0)
			{
				gTunerUnion.tp.g1--;
			}
			else if (checkmax(vtdData.c4max,MAX_TRIGGER)&& gTunerUnion.tp.g2>0)
			{
				gTunerUnion.tp.g2--;
			}
			else if (checkmax(vtdData.c2max,MAX_TRIGGER)&& gTunerUnion.tp.g4>0)
			{
				gTunerUnion.tp.g4--;
			}
			else if (checkmax(vtdData.c1max,MAX_TRIGGER)&& gTunerUnion.tp.g5>0)
			{
				gTunerUnion.tp.g5--;
			}
			else if(gTunerUnion.params[g_iParamToTune] >=1)
			{
				if (g_iParamToTune==2)
				{
					gTunerUnion.tp.gv--;
					gTunerUnion.tp.gf--;
					gTunerUnion.tp.gh--;
				}
				else
				{

					gTunerUnion.params[g_iParamToTune]--;
				}
			}
			else		// NAL keep from infinitely looping here
			{
				printf("Cannot tune; Check speaker definition.\n");
				TUNEERROR = TRUE;
				break;
			}
		}
		else
		{
//			if (g_iParamToTune==0) // more overload fixes MGS
//			{
//				gTunerUnion.tp.gv-=3;
//			}
			g_iParamToTune++;
			gTunerUnion.params[g_iParamToTune] += 87;
			// eab 30+58=88 the maximum allowed by tables
			
		}

		
	} while (g_bDoAutotune && (g_iParamToTune<NUMTUNERPARAMS)); // end of the do loop

	free(pcBufArray);
	//free(szInputData);
	OP_DestroyEvent(ttsHandlePtr->hTuneStopEvent);
	TextToSpeechShutdown(ttsHandlePtr);

	
	// if we're autotuning, declare victory.
	if (g_bDoAutotune)
	{
		fprintf(fpResultFile,"RMS level is %f\n",dLevel);
		fprintf(fpResultFile,"Final tuner string was: %s\n\n",
			gTunerUnion.tp.string);
//		fprintf(stdout,"RMS level is %f\n",dLevel);
		fprintf(stdout,"\nFinal tuner string was: %s\n\n",
			gTunerUnion.tp.string);
		g_bDoAutotune = FALSE;
	}



	if(g_bDoFullAutotune)		// Get the tuned params and put them in a table for later
	{	
		if(nextVoice == 0)
		{
			fpBackup = fopen(szBackup, "w");
		}
		else
		{
			fpBackup = fopen(szBackup, "a+");
		}

		TunedTable[nextVoice][GF] = gTunerUnion.tp.gf;
		TunedTable[nextVoice][GH] = gTunerUnion.tp.gh;
		TunedTable[nextVoice][GV] = gTunerUnion.tp.gv;
		TunedTable[nextVoice][GN] = gTunerUnion.tp.gn;
		TunedTable[nextVoice][G1] = gTunerUnion.tp.g1;
		TunedTable[nextVoice][G2] = gTunerUnion.tp.g2;
		TunedTable[nextVoice][G3] = gTunerUnion.tp.g3;
		TunedTable[nextVoice][G4] = gTunerUnion.tp.g4;
		TunedTable[nextVoice][LO] = gTunerUnion.tp.g5;

		fprintf(fpBackup, "%d %d %d\n", nextVoice, GF, gTunerUnion.tp.gf);
		fprintf(fpBackup, "%d %d %d\n", nextVoice, GH, gTunerUnion.tp.gh);
		fprintf(fpBackup, "%d %d %d\n", nextVoice, GV, gTunerUnion.tp.gv);
		fprintf(fpBackup, "%d %d %d\n", nextVoice, GN, gTunerUnion.tp.gn);
		fprintf(fpBackup, "%d %d %d\n", nextVoice, G1, gTunerUnion.tp.g1);
		fprintf(fpBackup, "%d %d %d\n", nextVoice, G2, gTunerUnion.tp.g2);
		fprintf(fpBackup, "%d %d %d\n", nextVoice, G3, gTunerUnion.tp.g3);
		fprintf(fpBackup, "%d %d %d\n", nextVoice, G4, gTunerUnion.tp.g4);
		fprintf(fpBackup, "%d %d %d\n\n", nextVoice, LO, gTunerUnion.tp.g5);

		fclose(fpBackup);
	}
	
	fclose(fpInFile);
 
} // end of DoAutotune


/*******************************************************************
* TTSCallbackRoutine
*
*	the callback routine for status etc..
*******************************************************************/
VOID TTSCallbackRoutine(LONG lParam1, LONG lParam2,
						DWORD dwInstanceParam, UINT uiMsg) {
	
		if (uiMsg == uiID_Buffer_Msg)
		{
			LPTTS_BUFFER_T	lpttsbBuffer = (LPTTS_BUFFER_T)(lParam2);
			int	iI=0;
			
			DWORD	dwAvgSamplesPerSecond=0;
			DWORD	dwCurrentSamplesPerSecond=0;
			DWORD	dwOldSamples = 0;
			DWORD	dwCurrentSamples = 0;
			DWORD	dwDeltaTime = 0;
			DWORD	dwDeltaTimeSinceFirst = 0;
			DWORD	dwOldTime = 0;
		DWORD	dwTime;
		
		short *psData;
		char *pcData;
		int iData=0;
		double dData = 0;
		
		DWORD dwIndexValue=0;
		DWORD dwIndexSampleNumber=0;

		if (bVerbose)
		{
			dwTime=timeGetTime();
		}
			
			
			// we have a buffer turn.
			if (bVerbose)
			{
				fprintf(fpResultFile,"[%09lu] [%02lu] Buffer Turn:%lx\n",
					dwTime,dwInstanceParam,lParam2);
			
			
			// look for index marks..

				fprintf(fpResultFile,"        [%02lu] %lu index marks, %lu bytes\n",
					dwInstanceParam,
					lpttsbBuffer->dwNumberOfIndexMarks,
					lpttsbBuffer->dwBufferLength);
			}
			// prance through the index marks to see if we have a start or end
			for (iI=0;iI<(int)lpttsbBuffer->dwNumberOfIndexMarks;iI++)
			{
				dwIndexValue = 
					lpttsbBuffer->lpIndexArray[iI].dwIndexValue;
				if (bVerbose)
				{
				dwIndexSampleNumber =
					lpttsbBuffer->lpIndexArray[iI].dwIndexSampleNumber;
					fprintf(fpResultFile,
						"        [%02lu] Index:%ld Sample:%ld\n",
						dwInstanceParam,
						dwIndexValue, 
						dwIndexSampleNumber);
				}
			
		
				// is it start?
				switch (dwIndexValue)
				{
				case 1:
					// start..
				if (bVerbose)
					dwFirstBufferTime = dwTime;
					break;
				case 2:
					// end
					bGotDoneMark = TRUE;
				OP_SetEvent(ttsHandlePtr->hTuneStopEvent);
				
					break;
					
					
				} // switch		

				
			} // index marks
			// sum in the info..
		//			dwOldSamples = dwTotalSamples;
		//dwOldTime = dwLastBufferTime;
		dwCurrentSamples = (lpttsbBuffer->dwBufferLength)>> (uiBytesPerSample-1);
			dwTotalSamples += dwCurrentSamples;
			// calculate avg, current data rate
		//dwDeltaTime = dwTime - dwOldTime;
		if (bVerbose)
		{
			dwDeltaTime = dwTime - dwLastBufferTime;
			
			dwLastBufferTime = dwTime;
			
			dwDeltaTimeSinceFirst = dwTime - dwFirstBufferTime;
		}
			// what we do on the first buffer is different..
		if (bVerbose)
		{
			if (dwTotalBuffers)
			{
				if (dwDeltaTime)
				{
					fprintf(fpResultFile,
						"[%09lu][%02lu] samp/sec: avg:%ld, curr:%ld\n",
						dwTime,
						dwInstanceParam,
						1000L*dwTotalSamples/dwDeltaTimeSinceFirst,
						1000L*dwCurrentSamples/dwDeltaTime);
				}
			}
			else
			{
				dwFirstBufferTime = dwTime;
				fprintf(fpResultFile,
					"[%09lu][%02lu] time to first buffer=%lu\n",
					dwTime,
					dwInstanceParam, 
					dwTime-dwStartTime);
				}
			}
			// note the fact..
			dwTotalBuffers++;
			

		if ((g_iParamToTune+1)==NUMTUNERPARAMS)
		{
			// sum up the data in the buffer to keep
			// track of the RMS value..
			psData = (short *)(lpttsbBuffer->lpData);
			pcData = (char *)(lpttsbBuffer->lpData);
			for (iI=0;iI<(long)dwCurrentSamples;iI++)
			{
				// the lpData member is where the samples are, but
				// its either bytes or words..
				if (uiBytesPerSample == 1)
				{
					iData = (int)(pcData[iI]);
				}
				else // must be 2
				{
					iData = (int)(psData[iI]);
				}
				dData = (double)(iData * iData);
				//dData = dData * dData;
				dLevel += dData; // accumulate squares
			}

		}
			// if we're still running, return the buffer.
			if (bSynthIsRunning)
			{
				TextToSpeechAddBuffer(ttsHandlePtr,
					lpttsbBuffer);
			}
			}
	else
	{	
		switch( lParam1 )
		{
		case TTS_INDEX_MARK:
			break;
			
		case TTS_AUDIO_PLAY_START:
		case TTS_AUDIO_PLAY_STOP:
		case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
		case ERROR_IN_AUDIO_WRITE:
		case ERROR_GETTING_DEVICE_CAPABILITIES:
#ifdef WIN32
			PostMessage((HWND)dwInstanceParam,uiMsg,lParam1,lParam2);
#endif
			break;
			
		default:
			
			break;
	}
}
}

void StartText()
{
	
	// log some activity to the console..
#ifdef DEBUG_TUNER
	printf("Sending text \n");
#endif
	
	if ((ttsHandlePtr != NULL) 	)
	{
		// reinit the state..
		dwTotalSamples = 0;
		dwTotalBuffers = 0;
		bSynthIsRunning = TRUE;
		bGotDoneMark = FALSE;
		bRequestRequeue = FALSE;

		dwStartTime = timeGetTime();
		TextToSpeechSpeak(ttsHandlePtr, szInputData, TTS_FORCE);
		if (bVerbose)
		{
			fprintf(fpResultFile,"[%09lu] TTSSpeak completed.\n");
		}
	}
}


// Get the default params for each voice and compare against the tuned string
// then spit out a offsets file with the vals in array format
void CreateOffsetFile()
{
	UINT i=0, j=0;
	short *DefaultParams = NULL;
	char *speaker=NULL;
	char offsets[256] = "\0";
	time_t timestamp;
	
	time(&timestamp);
	
	strcpy(offsets, offsetPath);
	strcat(offsets, OFFSETFILE);
	fpOffsetFile = fopen(offsets, "w");
	if(fpOffsetFile == NULL)
	{
		printf(" could not open offset file %s\n",OFFSETFILE);
		exit(2);
	}	
	
	
	fprintf(fpOffsetFile, "/***********************************************************************\n");
	fprintf(fpOffsetFile, "*\n");
	fprintf(fpOffsetFile, "*                           Copyright ©\n");
	fprintf(fpOffsetFile, "*    Copyright © 2000-2001 Force Computers, a Solectron Company. All rights reserved.\n");
	fprintf(fpOffsetFile, "*\n");
	fprintf(fpOffsetFile, "*    Restricted Rights: Use, duplication, or disclosure by the U.S.\n");
	fprintf(fpOffsetFile, "*    Government is subject to restrictions as set forth in subparagraph\n");
	fprintf(fpOffsetFile, "*    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR\n");
	fprintf(fpOffsetFile, "*    52.227-14 Alt. III, as applicable.\n");
	fprintf(fpOffsetFile, "*\n");
	fprintf(fpOffsetFile, "*    This software is proprietary to and embodies the confidential\n");
	fprintf(fpOffsetFile, "*    technology of Force Computers Incorporated and other parties.\n");
	fprintf(fpOffsetFile, "*    Possession, use, or copying of this software and media is authorized\n");
	fprintf(fpOffsetFile, "*    only pursuant to a valid written license from Force or an\n");
	fprintf(fpOffsetFile, "*    authorized sublicensor.\n");
	fprintf(fpOffsetFile, "*\n");
	fprintf(fpOffsetFile, "***********************************************************************\n");
	fprintf(fpOffsetFile, "* COMMENTS\n");
	fprintf(fpOffsetFile, "* 001	CAB	10/16/2000	Changed copyright info\n");
	fprintf(fpOffsetFile, "* 002	CAB	02/23/2001	Updated copyright info\n");
	fprintf(fpOffsetFile, "*\n");
	fprintf(fpOffsetFile, "***********************************************************************\n");
	fprintf(fpOffsetFile, "*    File Name:    %s\n", OFFSETFILE);
	fprintf(fpOffsetFile, "******************\n");
	fprintf(fpOffsetFile, "*    FILE CREATED ON: %s", ctime(&timestamp) );
	fprintf(fpOffsetFile, "*    TUNED WITH FILE: %s (size: %d)\n", szInFileName, ulInputCount);
	fprintf(fpOffsetFile, "******************\n");
	fprintf(fpOffsetFile, "*    Functionality:\n");
	fprintf(fpOffsetFile, "*    Speaker voice definition for tuned voice params\n");
	fprintf(fpOffsetFile, "*    Created automatically by Autotuner in CreateOffsetFile()\n");
	fprintf(fpOffsetFile, "***********************************************************************/\n");
	
	if(TUNEERROR)
	{
		fprintf(fpOffsetFile, "\n/**/\n#error VOICE NOT TUNED PROPERLY!\n/**/\n");
	}
	for(i=0;i<37;i++)
	{
		switch (i) {
		case 0:	 speaker = "paul_8_tune";		break;
		case 1:	 speaker = "betty_8_tune";		break;
		case 2:	 speaker = "harry_8_tune";		break;
		case 3:	 speaker = "frank_8_tune";		break;
		case 4:	 speaker = "kit_8_tune";		break;
		case 5:	 speaker = "ursula_8_tune";		break;
		case 6:	 speaker = "rita_8_tune";		break;
		case 7:	 speaker = "wendy_8_tune";		break;
		case 8:	 speaker = "dennis_8_tune";		break;
		case 9:	 speaker = "ed_8_tune";			break;
		case 10: speaker = "matt_8_tune";		break;
		case 11: speaker = "sue_8_tune";		break;
		case 12: speaker = "mary_8_tune";		break;
		case 13: speaker = "lynn_8_tune";		break;
		case 14: speaker = "tom_8_tune";		break;
		case 15: speaker = "bob_8_tune";		break;
		case 16: speaker = "charline_8_tune";	break;
		case 17: speaker = "sarah_8_tune";		break;
		case 18: speaker = "paul_tune";			break;
		case 19: speaker = "betty_tune";		break;
		case 20: speaker = "harry_tune";		break;
		case 21: speaker = "frank_tune";		break;
		case 22: speaker = "kit_tune";			break;
		case 23: speaker = "ursula_tune";		break;
		case 24: speaker = "rita_tune";			break;
		case 25: speaker = "wendy_tune";		break;
		case 26: speaker = "dennis_tune";		break;
		case 27: speaker = "ed_tune";			break;
		case 28: speaker = "matt_tune";			break;
		case 29: speaker = "sue_tune";			break;
		case 30: speaker = "mary_tune";			break;
		case 31: speaker = "lynn_tune";			break;
		case 32: speaker = "tom_tune";			break;
		case 33: speaker = "bob_tune";			break;
		case 34: speaker = "charline_tune";		break;
		case 35: speaker = "sarah_tune";		break;
		case 36: speaker = "val_tune";			break;
			
		}
		
		if(!create_empty_file && i != 37) // Val has no defaults
		{
			DefaultParams = TextToSpeechGetPhVdefParams(ttsHandlePtr, i);
		}
		fprintf(fpOffsetFile, "\nconst short\t\t\t%s%s[] =\n{\n",lang_tag,speaker);
		
		for(j=0;j<(sizeof(SPDEFS)/sizeof(short));j++)
		{
			if(!create_empty_file &&  (i!=37) && (j>=GF && j<=LO)	)// get differences for just these values
			{
				fprintf(fpOffsetFile, "\t%d,\n", TunedTable[i][j] - DefaultParams[j]);
			}
			else
			{					// Other params stay the same
				fprintf(fpOffsetFile, "\t%d,\n", TunedTable[i][j]);
			}
		}
		fprintf(fpOffsetFile, "#ifndef MSDOS\n\t%d\n#endif\n};\n", TunedTable[i][j]);
		if(i != 36) // Val has no defaults
		{
#if defined(WIN32) && !defined(UNDER_CE)
			CoTaskMemFree(DefaultParams);
#else
			free(DefaultParams);
#endif
			DefaultParams=NULL;
		}
	}
	printf("\n\nAll Done!!\n%s created in \\dapi\\src\\ph ", OFFSETFILE);
	ParseTime(time(NULL) - startTime);

	fclose(fpOffsetFile);
	if (create_empty_file==FALSE)
	{
		if(_unlink(szBackup) != 0)
		{
			printf("Could not unlink file %s!\n", szBackup);
		}
	}

}


/************************************************************************
* Function: DoFullAutoTune()
*
* Functionality:
*   Tunes all voices by calling the main tune function, DoAutoTune(), for each
*   combination of prefix and bytes per sample/sample rate. Any command line
*   flags are thus ignored/overwritten
*************************************************************************/
void DoFullAutoTune()
{
	int			ii = 0;
	int			jj = 0;	
	int			kk = 0;
	int startVoice = STARTING_VOICE;
	int voice	   = 0;
	int param      = 0;
	int value      = 0;
	int end        = 0;
	int v_time     = 0;


	// Must make sure that the order of these prefixes match up with the switch in
	// CreateOffsetFile() or the offset file will be wrong
	char *prefixes[] = {
		"[:np]","[:nb]","[:nh]","[:nf]","[:nk]","[:nu]","[:nr]","[:nw]","[:nd]",
		"[:ne]","[:nm]","[:ns]","[:ny]","[:nl]","[:nt]","[:no]","[:nc]","[:ni]",
		"[:np]","[:nb]","[:nh]","[:nf]","[:nk]","[:nu]","[:nr]","[:nw]","[:nd]",
		"[:ne]","[:nm]","[:ns]","[:ny]","[:nl]","[:nt]","[:no]","[:nc]","[:ni]"
	};
	
	fprintf(fpResultFile, "***  Doing FULL TUNE  ***\n\n");
	
	for(ii=0;ii<37;ii++)		// Initialize tables for full tune
	{
		for(jj=0;jj<(sizeof(SPDEFS)/sizeof(short));jj++)
		{
			TunedTable[ii][jj]=0;
		}
	}

	if (create_empty_file)
	{
		return;
	}

	if(bUseBackup)
	{
		fpBackup = fopen(szBackup, "r");

		end = fscanf(fpBackup, "%d", &voice);
		end = fscanf(fpBackup, "%d", &param);
		end = fscanf(fpBackup, "%d", &value);

		while(end != 0 && end != EOF)
		{
			TunedTable[voice][param] = value;
		
			end = fscanf(fpBackup, "%d", &voice);
			end = fscanf(fpBackup, "%d", &param);
			end = fscanf(fpBackup, "%d", &value);
		}
		startVoice = voice + 1;
		fclose(fpBackup);
	}

	for(nextVoice=startVoice;nextVoice<NUMBER_OF_VOICES;nextVoice++)
	{
		v_time = time(NULL);
		g_iParamToTune = 2;
		g_bDoAutotune = TRUE;		
		pszPrefixText = prefixes[nextVoice];
		
		if(nextVoice < 18)
		{
			uiSampleRate = 8000;
			uiBytesPerSample = 1;
		}
		else
		{
			uiSampleRate = 11025;
			uiBytesPerSample = 2;
		}
		DoAutotune();
		printf("\r\t\t\t\t\t\t\t\r");
		ParseTime(time(NULL) - v_time);
		printf("\n");
	}
}

void LookForBackup()
{
	char c;

	fpBackup = fopen(szBackup, "r");

	if(fpBackup == NULL)
	{
		return;
	}

	fclose(fpBackup);
	

	printf("\nA backup file has been detected. Would you like to use it?(y/n)");
	c = getchar();
	
	while(c != 'y' && c != 'n' && c != 'Y' && c != 'N')
	{
		printf("Please enter y or n :");
		c = getchar();
	}

	if(c == 'Y' || c == 'y')
	{
		bUseBackup = TRUE;
	}

	return;
}



void ShowHelpMsg()
{
	printf("\nAutomatic Voice Tuner\n\n");
	printf("usage: tunecheck -a -t textfile [-r resultfile] [-p prefix] [-s samplerate] [-b bytes/sample] [-h]");
	printf("usage: tunecheck -t textfile [-r resultfile] [-h]\n\n");
	printf("-a               Autotune one voice. NOTE: This will NOT automatically create\n");
	printf("                   offset file or affect the dectalk voices in any way.\n");
	printf("                 If absent, Fulltune. Tunes all voices. Automatically creates\n");
	printf("                   offset file into \\src\\PH. Ignores -p -s -b flags.\n");
	printf("-t [textfile]    What text to tune with.\n");
	printf("                   textfile: name of textfile.\n");
	printf("-r [resultfile]  Logs overloaded phoneme info and RMS vals.\n");
	printf("                   resultfile: name of logfile. Default is command line.\n");
	printf("-p [prefix]      Prefix text added before text file.\n");
	printf("                   prefix: any text. Most useful to set as a dectalk command.\n");
	printf("                   example: [:nb]\n");
	printf("-s [samplerate]  Sampling Rate.\n");
	printf("                   samplerate: 8000 or 11025. Default is 11025.\n");
	printf("-b [bytes]       Bytes/Sample.\n");
	printf("                   bytes: 1 or 2. Default is 2.\n");
	printf("-l [lang_tag]    The prefix on the array names.\n");
	printf("-h               This help message. Ignores all other flags.\n");
}

void ParseTime(int t)
{
	int sec=0,
	    min=0,
	    hr=0,
	    day=0;

	day = t/86400;
	t %= 86400;
	hr = t/3600;
	t %= 3600;
	min = t/60;
	sec = t%60;

	printf("%.3d:%.2d:%.2d:%.2d\n", day, hr, min, sec);
	return;
}

_inline int checkmax(S32 value,S32 checkval)
{
	if (value>checkval || value<(-checkval))
		return(1);
	else
		return(0);
}