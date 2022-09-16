/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	12	06/24/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	06/24/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	06/24/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	06/24/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	06/24/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	06/24/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	06/24/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	06/24/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	06/24/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	06/24/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	06/24/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	06/24/97	leeber	Initial Version
$
 * Revision 1.1.2.4  1996/10/01  17:14:29  Cathy_Page
 * 	Removed dtmmedefs header file
 * 	[1996/10/01  17:13:16  Cathy_Page]
 *
 * Revision 1.1.2.3  1996/02/27  02:00:16  Krishna_Mangipudi
 * 	 - Removed calls to hash functions, possibly not threads safe on Platinum
 * 	[1996/02/27  02:00:05  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.2  1995/11/14  21:34:54  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 * 	[1995/11/14  21:33:34  Krishna_Mangipudi]
 * 
 * $EndLog$
 */
/* Header stuff */

/*$Id: dtk.c,v 1.1.2.4 1996/10/01 17:14:29 Cathy_Page Exp $ */
/* $Author: leeber$ */ 
/*$Log: 
	12	06/24/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	06/24/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	06/24/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	06/24/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	06/24/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	06/24/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	06/24/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	06/24/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	06/24/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	06/24/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	06/24/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	06/24/97	leeber	Initial Version
$
 * Revision 1.1.2.4  1996/10/01  17:14:29  Cathy_Page
 * 	Removed dtmmedefs header file
 * 	[1996/10/01  17:13:16  Cathy_Page]
 *
 * Revision 1.1.3.2  1996/10/01  17:13:16  Cathy_Page
 * 	Removed dtmmedefs header file
 *
 * Revision 1.1.2.3  1996/02/27  02:00:16  Krishna_Mangipudi
 * 	 - Removed calls to hash functions, possibly not threads safe on Platinum
 * 	[1996/02/27  02:00:05  Krishna_Mangipudi]
 *
 * Revision 1.1.3.2  1996/02/27  02:00:05  Krishna_Mangipudi
 * 	 - Removed calls to hash functions, possibly not threads safe on Platinum
 *
 * Revision 1.1.2.2  1995/11/14  21:34:54  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 * 	[1995/11/14  21:33:34  Krishna_Mangipudi]
 *
 * Revision 1.1.1.2  1995/11/14  21:33:34  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 *
 *End Log*/ 
/*
 * dtk.c
 *
 * A sh interface to the software Dectalk. *
 */

/* include files */

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <math.h>
#ifdef __STDC__
#include <stdarg.h>
#else
#include <varargs.h>
#endif /* __STDC__ */
#include <sys/time.h>
#include <sys/types.h> 
/* Dectalk Includes */
#ifndef _TTSAPI_H_ 
#include <ttsapi.h>
#endif 

#include "queue.h"    
#include "speaker.h"    
#ifndef _DTK_
#include "dtk.h"
#endif
#include <string.h> /* strerror ... */ 
#include <fcntl.h>
#include <errno.h>
#include <time.h>
#include <ctype.h>  /* is upper */

/* the implementation of dtkInitSpeaker is provided by mme.c */
extern int dtkInitSpeaker( dtk_speaker *p, DWORD output_format);

/* Structures */
typedef struct _action {
    char *pAction;
    void *pFunction;
} action;

/* Global variables */
dtk_speaker * dtk_speaker_ptr; 
int dectalk_global[8];
double dectalk_global_char_factor;
char * dectalk_global_punctuations;

#define NUM_SUBROUTINES  40
action actionArray[NUM_SUBROUTINES]; 
int numElements = 0;

#define DEBUG_DTK_MME 0
#if DEBUG_DTK_MME
FILE *errors;
#endif

/* CPP directives: */

#define TIME_OUT 3

/* function prototypes  */

uint sleep(uint); /* declare sleep to make gcc happy */
static void register_subcommand(char *, long *);

int samples_per_second (DWORD output_format);
const char *encoding_type (DWORD output_format);

/* samples per second corresponding to output format */ 

/* compute ticks per second based on sample rate */ 
int samples_per_second (DWORD format)
{
    switch (format) {
      case WAVE_FORMAT_08M08:
	return (8000);
	break;
      case WAVE_FORMAT_1M16:
	return(11025*2);
	break;
      default: fprintf(stderr, "Invalid format code %d.\n", format);
	exit (1); }
}

/* encoding type corresponding to output format */ 
const char *encoding_type (DWORD format)
{
    switch (format) {
      case WAVE_FORMAT_08M08:
	return "ulaw";
	break;
      case WAVE_FORMAT_1M16:
	return "lin16";
	break;
      default: fprintf(stderr, "Invalid format code %d.\n", format);
	exit (1); }
}

void freeArrayMemory( int argc, char **argv )
{
    int i;

    for( i = 0; i < argc; i++ )
    {
	free( argv[i] );
	argv[i] = NULL;
    }
    free( argv );
}
static int convertToArray( char *params, char ***ppArray )
{
    char *pstr;
    int i, count = 0;
    char *temp = params;
    char *pDelim = " 	";
    char **argv;

    i = 0;
    if( params != NULL )
    {
        if((temp = strpbrk( temp, pDelim )) == NULL)
	    count++;
	else
	{
    	    while( temp != NULL )
    	    {
       		if((temp = strpbrk( temp, pDelim )) != NULL)
        	{
            	    temp++;
		    if(( temp[0] != ' ') && ( temp[0] != '	'))
            	        count++;
        	}
    	    }
	}

        if( count > 0 )
        {
            argv = ( char **)malloc( sizeof( char ) * count );
            if(( pstr = strtok( params, pDelim )) != NULL ) 
	    {
	        argv[i] = strdup( pstr );
	        while(( pstr = strtok( (char *)NULL, pDelim )) != NULL )
	        {
		    i++;
		    argv[i] = strdup( pstr );
	        }
		/* Add one so that there are n elements in the array */
		/* from 0 to n-1 */
		i++;
	    }	
        }
    }
    *ppArray = argv;
    return( i ); 
}

/* dtk speaker object */

/*-- Delete proc:  Given a dtk_speaker, free all associated storage. */
static void dtkDeleteSpeaker ( int i )
{
    int status = MMSYSERR_NOERROR;
    LPTTS_HANDLE_T tts_handle = dtk_speaker_ptr->tts_handle; 

    if (tts_handle != NULL) 
	status= TextToSpeechSync( tts_handle );

    status = TextToSpeechShutdown( tts_handle );
    if (status!=MMSYSERR_NOERROR) {
	fprintf(stderr, "Error in TextToSpeechShutdown. \n");
	exit(1);
    }

    free(dtk_speaker_ptr->scratch); 
    free(dtk_speaker_ptr);

    exit( 0 );
}

/* object_command */ 

/*-- dtk_speaker: object 
 * Dispatch table for object commands.
 */
/*-- this is a global variable */ 

/*
 * Add a new subcommand to the object subcommand table.
 */
static void register_subcommand(char *key, long *data )
{
    actionArray[numElements].pAction = strdup(key);
    actionArray[numElements++].pFunction = data;
}

static int validateCommand( char *key )
{
     int i =0;

    for (i = 0;  i< numElements; i++)
    {
       if (strcmp(key, actionArray[i].pAction) == 0)
       {
          return TRUE;
       }
    }

    return FALSE;
}

/* implements the different commands for object dtk_speaker  */
static int object_command(char *func, char *params)
{
 int i = 0;
    static int (*proc)();

    /*-- method dispatch:
     * Find the subcommand in the subcommand hash table, dispatch if
     * found.
     */
    for (i = 0;  i< numElements; i++)
    {
       if (strcmp(func, actionArray[i].pAction) == 0)
       {
          proc = (void *) actionArray[i].pFunction;
          return (*proc)( params );
       }
    }
}

/*-- Create a speaker object, and initialize it. */

static int dtkSpeakerCreateCmd(DWORD *output_format )
{
    dtk_speaker_ptr = (dtk_speaker *) malloc (sizeof (dtk_speaker));

    if (!dtk_speaker_ptr)
    {
	fprintf(stderr, "Could not allocate memory for speaker");
	return( FALSE );
    }

    if (dtkInitSpeaker(dtk_speaker_ptr, *output_format) != TRUE) {
	return FALSE;
    }

    return TRUE;
}

/*  
 * dtkGetLeftVolumeCmd --  Created:  Sat Oct  1 14:36:10 1994
 *Arguments: 
 * Standard TclCmd arguments.
 * clientData contains a pointer to the speaker object.
 * Results: 
 * TCL error status.
 *	if an error occurred (interp->result is also set after errors).
 * Side Effects:
 * Sets interp->result to the current value of the blocking volume.
 * TCL Synopsis:
 * dtk_speaker_object dtk_get_left_volume 
 */ 
static int dtkGetLeftVolumeCmd( char *params) 
{
    fprintf(stdout, "%f", dtk_speaker_ptr->left_volume);
    return(TRUE);
}

/*  
 * dtkGetRightVolumeCmd --  Created:  Sat Oct  1 14:36:10 1994
 *Arguments: 
 * Standard TclCmd arguments.
 * clientData contains a pointer to the speaker object.
 * Results: 
 * TCL error status.
 *	if an error occurred (interp->result is also set after errors).
 * Side Effects:
 * Sets interp->result to the current value of the blocking volume.
 * TCL Synopsis:
 * dtk_speaker_object dtk_get_right_volume 
 */ 
static int dtkGetRightVolumeCmd( char *params )
{
    fprintf(stdout, "%f", dtk_speaker_ptr->right_volume);
    return(TRUE);
}


/*  
 * dtkSetVolumeCmd --  Created:  Tue Dec  6 09:49:58 1994
 *Arguments: 
 * Standard TCL arguments
 * Results: 
 * Standard TCL result
 * Side Effects:
 * Sets left or right volume as specified 
 * TCL Synopsis:
 * dtk_speaker_object  dtk_set_volume ?-left? value ?-right? value
 */ 

static int dtkSetVolumeCmd(char *params)
{
    float volume;
    int i;
    char *e_ptr; 
    char **argv;
    int argc;

    argc = convertToArray( params, &argv );
    if (argc<=2) {
	fprintf(stderr, "Wrong #args:", "Usage:  ?-left vol? ?-right vol? ");
        freeArrayMemory( argc, argv );
	return( FALSE );
    }
    for(i=0; i<argc; i++) {
	if(!strcmp("-left",argv[i])) {
	    volume  = (float)  strtod(argv[++i], &e_ptr);
	    if (e_ptr == argv[1]) {
		fprintf(stderr, "Numeric expected. " );
                freeArrayMemory( argc, argv );
	        return( FALSE );
	    }
	    if (volume <0) volume=0;
	    if (volume >1) volume=1; 
	    dtk_speaker_ptr->left_volume = volume; 
	} else if(!strcmp("-right",argv[i])) {
	    volume  = (float)  strtod(argv[++i], &e_ptr);
	    if (e_ptr == argv[1]) {
		fprintf(stderr, "Numeric expected. ");
                freeArrayMemory( argc, argv );
	        return( FALSE );
	    }
	    if (volume <0) volume=0;
	    if (volume >1) volume=1; 
	    dtk_speaker_ptr->right_volume = volume; 
	} else {
	    fprintf(stderr, "unknown argument: \"%s\"", argv[i] );
            freeArrayMemory( argc, argv );
	    return( FALSE );
	}
    }

    freeArrayMemory( argc, argv );
    return( TRUE ); 
}


/* dtkGetSpatialCmd -- Created: Mon Jun 26 12:28:32 1995
 *Arguments:
 * Standard TCL arguments
 * Results:
 * TCL error status.
 *     if an error occurred (interp->result is also set after errors).
 * Side Effects:
 * Sets interp->result to display the values of the spatial parameters
 *     elevation and azimuth.
 * TCL Synopsis: 
 * dtk_speaker_object dtk_get_spatial
 */

static int dtkGetSpatialCmd (char *params)
{
  fprintf(stdout, "{{elevation  %i} {azimuth %i}}", dtk_speaker_ptr->elevation,
					 dtk_speaker_ptr->azimuth );
  return(TRUE);
}

/* dtkGetElevationCmd -- Created:  Wed Jun 28 09:17:30 1995
 *Arguments:
 * Standard TCL arguments
 * Results:
 * TCL error status.
 *     if an error occurred (interp->result is also set after errors).
 * Side Effects:
 * Sets interp->result to the spatial parameter elevation.
 * TCL Synopsis: 
 * dtk_speaker_object dtk_get_elevation
 */

static int dtkGetElevationCmd (char *params)
{
  fprintf(stdout, "%i", dtk_speaker_ptr->elevation);
  return(TRUE);
}

/* dtkGetAzimuthCmd -- Created:  Wed Jun 28 09:19:19 1995
 *Arguments:
 * Standard TCL arguments
 * Results:
 * TCL error status.
 *     if an error occurred (interp->result is also set after errors).
 * Side Effects:
 * Sets interp->result to the spatial parameter azimuth.
 * TCL Synopsis: 
 * dtk_speaker_object dtk_get_azimuth
 */

static int dtkGetAzimuthCmd (char *params)
{
  fprintf(stdout, "%i", dtk_speaker_ptr->azimuth);
  return(TRUE);
}

/* dtkSetSpatialCmd -- Created: Mon Jun 26 11:21:02 1995
 *Arguments:
 * Standard TCL arguments
 *Results:
 * Stardard TCL result
 *Side Effects:
 * Sets elevation and/or azimuth as specified
 *TCL Synopsis:
 * dtk_speaker_object dtk_set_spatial ?-elevation? value ?-azimuth? value
 */

static int dtkSetSpatialCmd(char *params)
{
    int val;
    int i;
    char *e_ptr;
    char **argv;
    int argc;

    argc = convertToArray( params, &argv );
  
    if (argc<=2) {
        fprintf(stderr, "Wrong #args: ");
        freeArrayMemory( argc, argv );
        return (FALSE); 
    }
    for (i=0; i<argc; i++)
    {
        if (!strcmp("-elevation",argv[i]))
	{
            val = (int) strtol(argv[++i], &e_ptr, 10);
            if (e_ptr == argv[1])
	    {
                fprintf(stderr, "Numeric expected. " );
                freeArrayMemory( argc, argv );
	        return(FALSE); 
            }
            dtk_speaker_ptr->elevation = val;
        } else if(!strcmp("-azimuth", argv[i])) {
            val = (int) strtol(argv[++i], &e_ptr, 10);
            if (e_ptr == argv[1])
	    {
                fprintf(stderr, "Numeric expected. " );
                freeArrayMemory( argc, argv );
	        return(FALSE);
	    }
            dtk_speaker_ptr->azimuth = val;
        } else {
            fprintf(stderr, "unknown argument: \"%s\"", argv[i] );
            freeArrayMemory( argc, argv );
            return FALSE;
        }
    }
    freeArrayMemory( argc, argv );
    return TRUE;
}

/*  
 * dtkToneCmd --  Created:  Mon Dec 12 09:30:03 1994
 *Arguments: 
 * Standard TCL arguments
 * Results: 
 * Standard TCL result
 * Side Effects:
 * Produces a tone of specified pitch and duration. This command is synchronous
 * TCL Synopsis:
 * dtk_speaker_object dtk_tone -pitch value -duration ms
 */ 

static int dtkToneCmd(char * params)
{
    int status;
    int pitch=440;
    int duration = 50;		/*default */ 
    int i;
    char cmd[80]; 
    char **argv;
    int argc;

    argc = convertToArray( params, &argv );
    
    for(i=0; i<argc; i++)
    {
	if(!strcmp("-pitch",argv[i]))
	{
	    pitch = atoi(argv[++i]); 
	    if (pitch <= 0)
	    {
		fprintf(stderr, "Pitch should be an integer > 0");
    		freeArrayMemory( argc, argv );
		return (FALSE);
	    }
	} else if(!strcmp("-duration",argv[i])) {
	    duration  =   atoi(argv[++i]);
	    if (duration <= 0)
	    {
		fprintf(stderr, "Expected integer > 0. " );
    		freeArrayMemory( argc, argv );
		return( FALSE );
	    }
	} else {
            fprintf(stderr, "unknown argument: \"%s\"", argv[i] );
    	    freeArrayMemory( argc, argv );
	    return FALSE;
	}
    }

    sprintf(cmd,"[:tone %d %d :sync]", pitch, duration);

    status = TextToSpeechSpeak( dtk_speaker_ptr->tts_handle, cmd, TTS_NORMAL ); 

    if (status != MMSYSERR_NOERROR)
    {
	fprintf(stderr, "Error sending tone command  to TTS " ); 
    	freeArrayMemory( argc, argv );
	return FALSE;
    }
    status = TextToSpeechSync( dtk_speaker_ptr->tts_handle ); 
    if (status != MMSYSERR_NOERROR) {
	fprintf(stderr, "Error syncing" ); 
	return FALSE;
    }
    freeArrayMemory( argc, argv );
    return TRUE;
}

static int dectalkSetTone(char * params)
{
    int pitch = 440;
    int duration = 50;
    char cmd[80];
    char **argv;
    int argc;

    argc = convertToArray( params, &argv );

    if( argc > 0 )
	pitch = atoi( argv[0] );
    if( argc > 1 )
	duration = atoi( argv[1] );
    freeArrayMemory( argc, argv );

    sprintf( cmd, "-pitch %d -duration %d", pitch, duration );
    
    dtkToneCmd( cmd );

    return TRUE;
}

static int dectalkSetScale(char * params)
{
    double factor;

    if (params == NULL)
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }

    factor = atof( params );

    dectalk_global_char_factor = factor;
    dectalk_global[SAY_RATE] =  dectalk_global[SPEECH_RATE] * 
				dectalk_global_char_factor;

    return TRUE;
}

static int dectalkSetRate(char * params)
{
    char cmd[30];

    if (params == NULL)
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }

    dectalk_global[SPEECH_RATE] =  atoi( params );
    dectalk_global[SAY_RATE] =  dectalk_global[SPEECH_RATE] * 
				dectalk_global_char_factor;
    
    sprintf( cmd, "[:sync :rate %d]", dectalk_global[SPEECH_RATE] );

    dtkSpeakCmd( cmd );

    return TRUE;
}

int hasUpperCase( char *params )
{
    char *temp = params;
    int i = 0; 
    int len; 

    if (params == NULL)
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }

    len = strlen( params );

    while( i < len )
    {
        if( isupper( temp[i] ) ) 
	    return TRUE;
	i++;
    }
   
    return FALSE;
}

static int dectalkLetter(char * params)
{
    char *cmd;
    char *text = " ";
    char *mode;
    int  len = 50;

    if (params == NULL)
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }

    if( dectalk_global[TALKING] )
    	dectalk_global[TALKING] = 0;

    mode = dectalk_global_punctuations; 
    len += strlen( params ) + strlen( mode );

    if( hasUpperCase( params ))
    {
	text = strdup( "cap " );
	len += 4;
    }
    
    cmd = (char *)malloc( sizeof( char ) *  len );
    sprintf( cmd, "[:rate %d :punc all]%s%s [:rate %d :punc %s]", 
		dectalk_global[SAY_RATE], text, params, 
		dectalk_global[SPEECH_RATE], mode );

    dtkSpeakCmd( cmd );

    free( cmd );

    return TRUE;
}

static int dectalkSay(char * params)
{
    char *cmd;
    char *mode = dectalk_global_punctuations; 
    int i, len;

    if (params == NULL)
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }

    // use this to remove the {}
    i = 0;
    while( params[i] != '{' )
	i++;
    params = &(params[i+1]);
    i = strlen( params ) - 1;
    while( params[i] != '}' )
	i--;
    params[i]='\0';
    if( params == NULL )
    {
        dtkSpeakCmd( " " );
	return TRUE;
    }

    len = strlen( params ) + strlen( mode ) + 70;

    cmd = (char *)malloc( sizeof( char ) *  len );

    sprintf(cmd,"[:rate %d :punc all :say word] %s [:rate %d :punc %s :say clause]", 
		dectalk_global[SAY_RATE], params, 
		dectalk_global[SPEECH_RATE], mode );

    dtkSpeakCmd( cmd );

    free( cmd );

    return TRUE;
}

// if replace = 0, then we're only inserting newStr
// if replace = 1, then we're replacing the first character.
void replaceString( char **pStr, char *newStr, int replace )
{
    char *temp = strdup( *pStr );

    temp = (char *)realloc( (char *)temp, strlen( temp ) + strlen( newStr ));
    sprintf( temp, "%s%s", newStr, temp + replace );

    *pStr = temp;
}

char *substituteChar( char *param, char oldStr, char *newStr )
{
    char *pstr;
    char *temp = strdup( param );
    char *temp1;
    int i = 0;
    int len = strlen( param );
    int nlen = strlen( newStr );

    while( i < len )
    {
        if( temp[i] == oldStr )
        {
            pstr = &(temp[i]);
            replaceString( &pstr, newStr, 1 );
            temp1 = (char *)malloc( sizeof(char) * (i + strlen(pstr)));
            temp1[0] = '\0';
            strcat( strncat( temp1, temp, i), pstr );
            free( pstr );
            free( temp );
            temp = temp1;
            i += nlen;
            len += nlen;
        }
        i++;
    }
    return temp;
}

static char *substituteString( char *params, char *oldStr, char *newStr)
{
    char *pstr;
    char *temp = strdup( params );
    char *temp1;
    int n;

    while( (pstr = strpbrk( temp, oldStr )) != NULL )
    {
        n = strlen( temp ) - strlen( pstr );
        replaceString( &pstr, newStr, 1 );
        temp1 = (char *)malloc( sizeof(char) * (n + strlen(pstr)));
	temp1[0] = '\0';
        strcat( strncat( temp1, temp, n), pstr );
        free( pstr );
        free( temp );
        temp = temp1;
    }
    return( temp );
}

static char *insertTone( char *params, char *tone )
{
    int i = 0; 
    int tlen = strlen( tone );
    int len = strlen( params );
    char *temp = strdup( params );
    char *pstr, *temp1;

    while( i < len )
    {
        if( isupper( temp[i] ) ) 
	{
	    pstr = &(temp[i]);
            replaceString( &pstr, tone, 0 );
	    temp1 = (char *)malloc( sizeof(char) * (i + strlen(pstr)));
	    temp1[0] = '\0';
            strcat( strncat( temp1, temp, i), pstr );
            free( pstr );
            free( temp );
            temp = temp1;
            i += tlen;
            len += tlen;
	}
	i++;
    }
    return temp;
}

static char *insertSpecialSpace( char *params )
{
    int i = 0;
    int tlen = 2;
    char *temp = strdup( params );
    char *pstr, *temp1;
    int len = strlen( params );

    while( i < len )
    {
        if( i+2 < len )
        if( isalpha( temp[i] ) && ispunct( temp[i+1] ) && isalpha( temp[i+2] ))
        {
            pstr = &(temp[i+1]);
            replaceString( &pstr, " ", 0 );
            temp1 = (char *)malloc( sizeof(char) * (i+1 + strlen(pstr)));
	    temp1[0] = '\0';
            strcat( strncat( temp1, temp, i+1), pstr );
            free( pstr );
            free( temp );
            temp = temp1;
            i += 3;
            pstr = &(temp[i]);
            replaceString( &pstr, " ", 0 );
            temp1 = (char *)malloc( sizeof(char) * (i + strlen(pstr)));
	    temp1[0] = '\0';
            strcat( strncat( temp1, temp, i), pstr );
            free( pstr );
            free( temp );
            temp = temp1;
            len += tlen;
        }
        i++;
    }
    return temp;
}
static char *splitCaps( char *params )
{
    int i = 0;
    int start;
    int end;
    int slen = 6;
    int elen = 3;
    char *temp = strdup( params );
    char *pstr, *temp1;
    int len = strlen( params );

    while( i < len )
    {
        if( i+1 < len )
        if( islower( temp[i] ) && isupper( temp[i+1] ))
        {
            i++;
            start = i;
            while( i < len )
            {
                if( isalpha( temp[i] ))
                        i++;
                else
                    break;
            }
            end = i + slen;
            pstr = &(temp[start]);
            replaceString( &pstr, "[_<1>]", 0 );
            temp1 = (char *)malloc( sizeof(char) * (start + strlen(pstr)));
	    temp1[0] = '\0';
            strcat( strncat( temp1, temp, start), pstr );
            free( pstr );
            free( temp );
            temp = temp1;
            pstr = &(temp[end]);
            replaceString( &pstr, "[,]", 0 );
            temp1 = (char *)malloc( sizeof(char) * (end + strlen(pstr)));
	    temp1[0] = '\0';
            strcat( strncat( temp1, temp, end), pstr );
            free( pstr );
            free( temp );
            temp = temp1;
            len += slen + elen;
	    i += slen + elen;
        }
        i++;
    }

    i = 0;
    len = strlen( temp );
    while( i < len )
    {
        if( i+1 < len )
        if( islower( temp[i] ) && isupper( temp[i+1] ))
        {
            start = i+1;
            pstr = &(temp[start]);
            replaceString( &pstr, "[:pause 1]", 0 );
            temp1 = (char *)malloc( sizeof(char) * (start + strlen(pstr)));
	    temp1[0] = '\0';
            strcat( strncat( temp1, temp, start), pstr );
            free( pstr );
            free( temp );
            temp = temp1;
            i += 10;
            len += 10;
        }
        i++;
    }

    return temp;
}

static char *splitDash( char *param )
{
    char *pstr;
    char *temp = strdup( param );
    char *temp1;
    char *dash = "--";
    char *newStr = " [_,]";
    int i = 0;
    int len = strlen( param );
    int dlen = 4;;

    while( i < len  )
    {
        if( i+1 < len )
        if(( temp[i] == '-' ) && ( temp[i+1] == '-' ))
        {
            pstr = &(temp[i+1]);
            replaceString( &pstr, newStr, 1 );
            temp1 = (char *)malloc( sizeof(char) * (i + strlen(pstr)));
	    temp1[0] = '\0';
            strcat( strncat( temp1, temp, i), pstr );
            free( pstr );
            free( temp );
            temp = temp1;
            i   += dlen;
            len += dlen;
        }
        i++;
    }
    return( temp );

}

static int speakThePhrase(char * params, int includeGTLT )
{
    int i; 

    if( params == NULL )
	return FALSE;

    // use this to remove the {}
    i = 0;
    while( params[i] != '{' )
	i++;
    params = &(params[i+1]);

    i = strlen( params ) - 1;
    while( params[i] != '}' )
	i--;
    params[i]='\0';
    if( params == NULL )
    {
        dtkSpeakCmd( " " );
	return TRUE;
    }
    
    if( !strcmp("all", dectalk_global_punctuations ))
    {
	if( includeGTLT )
	{
	    if( strpbrk( params, "<" ) != NULL )
	        params = substituteString(params, "<", " less than ");
	    if( strpbrk( params, ">" ) != NULL )
	        params = substituteString(params, ">", " greater than ");
	}
	if( strpbrk( params, "%" ) != NULL )
	    params = substituteChar(params, '%', " % ");
	if( strpbrk( params, "&" ) != NULL )
	    params = substituteChar(params, '&', " & ");
	if( strpbrk( params, ";" ) != NULL )
	    params = substituteChar(params, ';', " ; ");
	if( strpbrk( params, "(" ) != NULL )
	    params = substituteChar(params, '(', " ( ");
	if( strpbrk( params, ")" ) != NULL )
	    params = substituteChar(params, ')', " ) ");
	if( strpbrk( params, "$" ) != NULL )
	    params = substituteChar(params, '$', " $ ");
	if( strpbrk( params, "+" ) != NULL )
	    params = substituteChar(params, '+', " + ");
	if( strpbrk( params, "=" ) != NULL )
	    params = substituteChar(params, '=', " = ");
	if( strpbrk( params, "/" ) != NULL )
	    params = substituteChar(params, '/', " / ");
    } else
    {
	params = insertSpecialSpace( params );
    }
    if( dectalk_global[CAPITALIZE] )
    {
	params = insertTone(params, "[:tone 900 15]");
    }
    if( dectalk_global[SPLIT_CAPS] )
    {
	params = splitCaps( params );
    }
    if( !strcmp("some", dectalk_global_punctuations ))
    {
	params = splitDash( params );
    }

    dtkSpeakCmd( params );
    free( params );

    return TRUE;
}
static int dectalkSpeak(char * params)
{
    return( speakThePhrase( params, 1 ));
}

// Note, this is the same as dectalkSpeak, but it doesn't handle
// the greater than and less than symbols!
static int dectalkQueueSpeech(char * params)
{
    return( speakThePhrase( params, 0 ));
}


/*  
 * dtkSetOutputCmd --  Created:  Sat Oct  1 14:39:12 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 * TCL error status.
 *	if an error occurred (interp->result is also set after errors).
 * Side Effects:
 * Sets the output file handle for this speaker object. 
 * TCL Synopsis:
 * dtk_speaker_object dtk_set_output filehandle
 */ 

static int dtkSetOutputCmd(char *params)
{
    int i, status; 
    FILE *outfile;
    char *fileid = (char *)NULL; 
    char **argv;
    int argc;

    argc = convertToArray( params, &argv );

    /*
     * Process the command line options.
     */
    if ((argc < 1)|| (argc >2))
    {
	fprintf(stderr, "Wrong # args: ");
    	freeArrayMemory( argc, argv );
	return FALSE;
    }
    if (argc == 1)
	fileid = argv[0];

    else if (argc == 2)
    {
	for(i=0; i < argc; i++)
	{
	    if(!strcmp("-file",argv[i]))
		fileid = argv[++i];
	    else {
                fprintf(stderr, "unknown argument: \"%s\"", argv[i] );
    		freeArrayMemory( argc, argv );
		return FALSE;
	    }
	}
    }
    if(( outfile = fopen( fileid, "w" )) == (FILE *) NULL ) {
    	freeArrayMemory( argc, argv );
	return( FALSE );
    }
    /* else */
    if (dtk_speaker_ptr->output_file_ptr != (FILE *) NULL)
    {
	status = TextToSpeechSync(dtk_speaker_ptr->tts_handle);
	switch (status) {
	  case MMSYSERR_NOERROR:
	      break;
	  case MMSYSERR_ERROR: 
	        fprintf(stderr, "Unable to complete queued text. ");
    		freeArrayMemory( argc, argv );
	        return FALSE;
	  case MMSYSERR_INVALHANDLE: 
	        fprintf(stderr, "Invalid handle to speech device \n");
    		freeArrayMemory( argc, argv );
	        return FALSE;
	  default: 
	        fprintf(stderr, "Unrecognized error status returned by synchronize operation.\n");
    		freeArrayMemory( argc, argv );
	        return FALSE;
	}
	if(fflush(dtk_speaker_ptr->output_file_ptr)!=0)
	{
	    fprintf(stdout, "fflush: %s\n", strerror(errno));
	    /* return FALSE;  */ 
	}
	if(fclose (dtk_speaker_ptr->output_file_ptr)!=0)
	{
	    fprintf(stdout, "fflush: %s\n", strerror(errno));
	    /* return FALSE;  */ 
	}
    }
    dtk_speaker_ptr->output_file_ptr = outfile;
    freeArrayMemory( argc, argv );
    return TRUE;
}


/*  
 * dtkSetPhonemeLogCmd --  Created:  Sat Oct  1 14:39:12 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 * TCL error status.
 *	if an error occurred (interp->result is also set after errors).
 * Side Effects:
 * Sets the phoneme log  file handle for this speaker object. 
 * TCL Synopsis:
 * dtk_speaker_object dtk_phoneme_log filehandle
 */ 

static int dtkSetPhonemeLogCmd(char *params)
{
    int i, status; 
    FILE *outfile;
    char *fileid = (char *)NULL; 
    char **argv;
    int argc;

    argc = convertToArray( params, &argv );

    /*
     * Process the command line   options.
     */
    if ((argc < 1)|| (argc >2))
    {
	fprintf(stderr, "Wrong # args: " );
        freeArrayMemory( argc, argv );
	return FALSE;
    }
    if (argc == 1) 
	fileid = argv[0]; 
    else if (argc == 2)
    {
	for(i=0; i<argc; i++)
	{
	    if(!strcmp("-file",argv[i]))
		fileid = argv[++i];
	    else {
                fprintf(stderr, "unknown argument: \"%s\"", argv[i] );
        	freeArrayMemory( argc, argv );
		return FALSE;
	    }
	}
    }
    if(( outfile = fopen( fileid, "w" )) == (FILE *) NULL ) {
        freeArrayMemory( argc, argv );
	return( FALSE );
    }
    /* else */
    if (dtk_speaker_ptr ->phoneme_log_ptr != (FILE *) NULL)
    {
	status = TextToSpeechSync(dtk_speaker_ptr->tts_handle);
	switch (status) {
	  case MMSYSERR_NOERROR: break;
	  case MMSYSERR_ERROR: 
	        fprintf(stderr, "Unable to complete queued text. ");
        	freeArrayMemory( argc, argv );
	        return FALSE;
	  case MMSYSERR_INVALHANDLE: 
	        fprintf(stderr, "Invalid handle to speech device \n" );
        	freeArrayMemory( argc, argv );
	        return FALSE;
	  default: 
	        fprintf(stderr, "Unrecognized error status returned by synchronize operation. \n");
        	freeArrayMemory( argc, argv );
	        return FALSE;
	}
	if(fflush(dtk_speaker_ptr->phoneme_log_ptr)!=0)
	{
	    fprintf(stdout, "fflush: %s\n", strerror(errno));
            freeArrayMemory( argc, argv );
	    return FALSE;
	}
	if ( (dtk_speaker_ptr ->phoneme_log_ptr != (FILE *) stderr )
	    && (dtk_speaker_ptr ->phoneme_log_ptr != (FILE *) stdout ))
	{
	    if(fclose (dtk_speaker_ptr->phoneme_log_ptr)!=0 )
	    {
		fprintf(stdout, "fflush: %s\n", strerror(errno));
        	freeArrayMemory( argc, argv );
		return FALSE;  
	    }
	}
    }
    dtk_speaker_ptr->phoneme_log_ptr = outfile;
    freeArrayMemory( argc, argv );
    return TRUE;
}

/*  
 * dtkLogPhonemesCmd --  Created:  Sat Oct  1 14:41:28 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 * TCL error status.
 *	if an error occurred (interp->result is also set after errors).
 * Side Effects:
 * Sets the state of phoneme logging for this speaker object.
 * TCL Synopsis:
 * dtk_speaker_object dtk_log_phonemes boolean 
 */ 


static int dtkLogPhonemesCmd(char *params)
{
    /* check command args */
    if (params == NULL)
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }
    if (strcmp(params, "0") == 0) 
	dtk_speaker_ptr->log_phonemes = 0; 
    else if (strcmp(params, "1") == 0) 
	dtk_speaker_ptr->log_phonemes = 1; 
    else 
    {			/* invalid */
	fprintf(stderr, "Invalid argument: should be 1 or 0. ");
	return FALSE; 
    }
    return TRUE; 
}


/* Auxilliary function: */ 
static int dtkSpeakInternal(int flag, char *params)
{
    int status;
    char *text;
    char indexstring[25];
    LPTTS_HANDLE_T tts_handle = (dtk_speaker_ptr->tts_handle); 

    if( params == NULL ) {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }
    text=params;

    status = TextToSpeechSpeak( tts_handle, text, flag );

    if (status != MMSYSERR_NOERROR) {
	fprintf(stderr, "Error sending text to TTS " ); 
	return FALSE;
    }
#if 0
    sprintf(indexstring, " [:index mark %i _. ]", STOP_MARK);
    status = TextToSpeechSpeak( tts_handle, indexstring, flag);

    if (status != MMSYSERR_NOERROR) {
	fprintf(stderr, "Error sending terminal index mark  to TTS " ); 
	return FALSE;
    }

    if( flag == TTS_FORCE )
    {
        status = TextToSpeechSync( dtk_speaker_ptr->tts_handle ); 
        if (status != MMSYSERR_NOERROR) {
	    fprintf(stderr, "Error syncing" ); 
	    return FALSE;
        }
    }
#endif

    return TRUE;
}

/*  
 * dtkSpeakCmd --  Created:  Sat Oct  1 14:44:06 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 * TCL error status.
 *	if an error occurred (interp->result is also set after errors).
 * Side Effects:
 * Speaks specified text. Speech is produced (forced ) immediately. 
 * TCL Synopsis:
 * dtk_speaker_object dtk_speak  text 
 */ 

static int dtkSpeakCmd(char *params )
{
    return (dtkSpeakInternal(TTS_FORCE, params));
}

/*  
 * dtkSendCmd --  Created:  Sat Oct  1 14:44:06 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 * TCL error status.
 *	if an error occurred (interp->result is also set after errors).
 * Side Effects:
 *Queues text to the tts system. 
 * TCL Synopsis:
 * dtk_speaker_object dtk_send  text 
 */ 
static int dtkSendCmd(char *params)
{
    return(dtkSpeakInternal(TTS_NORMAL, params));
}

/*  
 * dtk_synchronize_ --  Created:  Sat Oct  1 14:49:01 1994
 *Arguments: 
 * Standard TclCmd arguments.
 * clientData contains a pointer to the speaker object.
 * Results: 
 * TCL error status.
 *	if an error occurred (interp->result is also set after errors).
 * Side Effects:
 * Calls wav_task and then 
 * Blocks until all queued text has been synthesized and played. 
 * TCL Synopsis:
 * dtk_speaker_object dtk_synchronize
 */ 

static int dtkSynchCmd (char *params) 
{
    int status; 
    LPTTS_HANDLE_T tts_handle = (dtk_speaker_ptr->tts_handle);

    status = TextToSpeechSpeak( tts_handle, "", TTS_FORCE);
    if (status != MMSYSERR_NOERROR)
    {
	fprintf(stderr, "Error sending force to  TTS " ); 
	return FALSE;
    }

    status = TextToSpeechSync(dtk_speaker_ptr->tts_handle);
    switch (status) {
      case MMSYSERR_NOERROR:
        if (dtk_speaker_ptr->output_file_ptr != (FILE *) NULL) 
	      fflush(dtk_speaker_ptr->output_file_ptr);
	  return TRUE;
      case MMSYSERR_ERROR: 
	  fprintf(stderr, "Unable to complete queued text. ");
	  return FALSE;
      case MMSYSERR_INVALHANDLE: 
	  fprintf(stderr, "Invalid handle to speech device\n" );
	  return FALSE;
      default: 
	  fprintf(stderr,"Unrecognized error status returned by synchronize operation. \n");
	  return FALSE;
    }
    /* Not reached */
    return TRUE; 
}

static int dectalkSynchronize (char *params) 
{
    dtkSpeakCmd("[:sync]");
}

/*  
 * dtkSpeakerIdCmd --  Created:  Sat Oct  1 14:51:49 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 *  TCL error status.
 * Side Effects:
 *  Sets interp->result to the id of this speaker, an integer.
 * TCL Synopsis:
 * dtk_speaker_object dtk_speaker_id
 */ 

static int dtkSpeakerIdCmd (char *params)
{
    fprintf(stdout, "%d", dtk_speaker_ptr->id);
    return TRUE;
}

/* dectalk_set_punctuations */
static int dtkSetPunctuations (char *params)
{
    char mode[20];

    if (params == NULL ) 
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }

    sprintf( mode, "[:punc %s]", params );

    dtkSpeakCmd( mode );

    if( dectalk_global_punctuations != NULL )
	free( dectalk_global_punctuations );

    dectalk_global_punctuations = strdup( params );

    return TRUE;
}

static int dtkSplitCaps (char *params)
{
    if (params == NULL ) 
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }

    dectalk_global[SPLIT_CAPS] = atoi( params );

    return TRUE;
}

static int dtkCapitalize (char *params)
{
    if (params == NULL ) 
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }

    dectalk_global[CAPITALIZE] = atoi( params );

    return TRUE;
}

static int dtkSpaceSpecialChar (char *params)
{
    if (params == NULL ) 
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }

    dectalk_global[SPACE_SPECIAL_CHAR] = atoi( params );

    return TRUE;
}

/*  
 * dtkResetCmd --  Created:  Sat Oct  1 14:54:46 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 *  TCL error status.
 * Side Effects:
 * Rests the text to speech system. 
 * TCL Synopsis:
 * dtk_speaker_object dtk_reset 
 */ 

/* dtk_reset */
static int dtkResetCmd (char *params)
{
    LPTTS_HANDLE_T tts_handle = dtk_speaker_ptr->tts_handle;
    BOOL  reset_flag =(unsigned char )FALSE; /* msft weirdness */
    int status;

    status = TextToSpeechReset(tts_handle, reset_flag);
    if (status!=MMSYSERR_NOERROR)
    { 
	fprintf(stderr, "TextToSpeechReset failed. \n");
	return FALSE;
    }

    /* set tts mode */
    status = TextToSpeechSpeak( tts_handle, DTK_DEFAULT_MODE, TTS_NORMAL);
    if (status != MMSYSERR_NOERROR) 
    {
	fprintf(stderr, "Failed to set tts mode: \n");
	return FALSE;
    }
    if (dtk_speaker_ptr->output_file_ptr != NULL)
	fflush(dtk_speaker_ptr->output_file_ptr);
    return TRUE;
}		


/*  
 * dtkSetFormatCmd --  Created:  Sat Oct  1 14:56:18 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 *  TCL error status.
 * Side Effects:
 * Sets the output encoding format for speaker object. Restarts the speech
 * system using the new format if possible. In case of errors, tries to reset
 * to present encoding format, and returns  status in  interp->result.
 * TCL Synopsis:
 * dtk_speaker_object dtk_set_format format_code
 */

static int dtkSetFormatCmd( char *params)
{
    DWORD  old_format, format;
    int status; 
    char *eptr; 
    LPTTS_HANDLE_T tts_handle = dtk_speaker_ptr->tts_handle; 
    BOOL  reset_flag =(unsigned char )FALSE; /*microsoft weirdness perculating*/

    if (params == NULL ) 
    {
	fprintf(stderr, "Wrong # args" );
	return FALSE;
    }
    format = (DWORD) strtol(params, &eptr, 16);
    if (eptr == params ) {
	fprintf(stdout, "Illegal format code: %s", params );
	return (FALSE); 
    }

    old_format = dtk_speaker_ptr->output_format; 
    dtk_speaker_ptr->output_format = format;
    status= TextToSpeechReset(tts_handle, reset_flag);

    if (status!=MMSYSERR_NOERROR) {
	fprintf(stderr, "Not reseting  format: TextToSpeechReset failed. \n" );
	return FALSE;
    }

    /* set tts mode */
    status = TextToSpeechSpeak( tts_handle, DTK_DEFAULT_MODE, TTS_NORMAL);
    if (status != MMSYSERR_NOERROR) {
	fprintf(stderr, "Failed to set tts mode: \n" );
	return FALSE;
    }

    return TRUE;
}

/*  
 * dtkGetFormatCmd --  Created:  Sat Oct  1 15:01:06 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 *  TCL error status.
 * Side Effects:
 * Sets interp->result to the current output encoding for this speaker object.
 * Retrieves the format code.
 * This can then be looked up in a table from inside tcl 
 * TCL Synopsis:
 * dtk_speaker_object  dtk_get_format
 */ 

static int dtkGetFormatCmd (char *params)
{
    fprintf(stdout, "%d", dtk_speaker_ptr->output_format); 
    return (TRUE);
}

/*  
 * dtkStopCmd --  Created:  Sat Oct  1 15:03:31 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 *  TCL error status.
 * Side Effects:
 * Stops speech. 
 * TCL Synopsis:
 * dtk_speaker_object dtk_stop
 */ 

static int dtkStopCmd ( char *params )
{
    int i, status; 
    dtk_buffer *buffers =(dtk_speaker_ptr->buffers);
    LPTTS_HANDLE_T tts_handle = dtk_speaker_ptr->tts_handle; 
    BOOL  reset_flag = (unsigned char )FALSE; /* microsoft weirdness
                                                 perculating*/

    status = TextToSpeechSync( dtk_speaker_ptr->tts_handle ); 
    if (status != MMSYSERR_NOERROR) {
	fprintf(stderr, "Error syncing" ); 
	return FALSE;
    }

    status= TextToSpeechReset(tts_handle, reset_flag);
    if (status!=MMSYSERR_NOERROR){
	switch (status) {
	  case MMSYSERR_ERROR: {
	      fprintf(stderr, "Unable to flush text. \n" );
	      return FALSE;
	  }
	  case MMSYSERR_INVALHANDLE: {
	      fprintf(stderr, "Invalid handle to speech device \n");
	      return FALSE;
	  }
	  default: {
	      fprintf(stderr, "Unrecognized  status from  synchronize. \n" );
	      return FALSE;
	  }
	}
      }
    if (dtk_speaker_ptr->output_file_ptr != NULL) /* flush any queued speech */
      fflush(dtk_speaker_ptr->output_file_ptr);

    /* queue speech buffers */
    for ( i = 0; i < NUM_BUFFERS; i++)
    {
	if( buffers[i].speech_buffer_ptr != NULL )
	{
	    status = TextToSpeechAddBuffer(tts_handle,
					   buffers[i].speech_buffer_ptr);
	    if (status != MMSYSERR_NOERROR) {
#if DEBUG_DTK_MME
errors = fopen("errors.txt","a+");
	        fprintf(errors, "Failed to queue buffer. \n" );
fclose(errors);
#else
	        fprintf(stderr, "Failed to queue buffer. \n" );
#endif
	        return FALSE;
	    }
	}
    }

    /* set tts mode */
    status = TextToSpeechSpeak( tts_handle, DTK_DEFAULT_MODE, TTS_NORMAL);
    if (status != MMSYSERR_NOERROR)
    {
	fprintf(stderr, "Failed to set tts mode: \n");
	return FALSE;
    }
    
    return TRUE;
}

/*  
 * dtkPauseCmd --  Created:  Sat Oct  1 15:04:27 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 *  TCL error status.
 * Side Effects:
 * Pauses speech. 
 * TCL Synopsis:
 * dtk_speaker_object dtk_pause   
 */ 
static int  dtkPauseCmd (char *params)
{
    int status;
    LPTTS_HANDLE_T tts_handle = dtk_speaker_ptr->tts_handle;

    status = TextToSpeechPause(tts_handle);
    if (status != MMSYSERR_NOERROR)
	switch (status) {
	  case MMSYSERR_INVALHANDLE:
	    fprintf(stderr, "Pause failed: Invalid tts handle. \n" );
	    return FALSE;
	  default:
	    fprintf(stderr, "Pause failed: \n");
	    return FALSE;
        }
    /* flush any queued output */
    if (dtk_speaker_ptr->output_file_ptr != NULL)
	fflush (dtk_speaker_ptr->output_file_ptr);
    return TRUE;
}

/*  
 * dtkResumeCmd --  Created:  Sat Oct  1 15:06:25 1994
 *Arguments: 
 * Standard TclCmd arguments. clientData contains a pointer to the speaker object.
 * Results: 
 *  TCL error status.
 * Side Effects:
 * Resumes speech if it has been paused. 
 * TCL Synopsis:
 *   dtk_resume
 */ 


static int dtkResumeCmd (char * params)
{
    int status;
    LPTTS_HANDLE_T tts_handle = dtk_speaker_ptr->tts_handle;

    status = TextToSpeechResume(tts_handle);
    if (status != MMSYSERR_NOERROR)
	switch (status) {
	  case MMSYSERR_INVALHANDLE:
	    fprintf(stderr, "Resume  failed: Invalid tts handle. \n");
	    return FALSE;
	  default:
	    fprintf(stderr, "Resume failed: \n");
	    return FALSE;
	}
    return TRUE;
}

/*  
 * dtkSetSpeechRateCmd --  Created:  Sat Oct  1 15:15:04 1994
 *Arguments: 
 * Standard TclCmd arguments. clientData contains a pointer to the speaker object.
 * Results: 
 *  TCL error status.
 * Side Effects:
 *  Sets speech rate to specified value. 
 * TCL Synopsis:
 * dtk_speaker_object dtk_set_speech_rate value  ?synch_flag?
 * Optional argument specifies if the operation is synchronous. 
 */ 

static int dtkSetSpeechRateCmd (char *params)
{
    int status;
    BOOL  sync_flag=FALSE;	/* default */ 
    DWORD rate; 
    char *eptr;
    char **argv;
    int argc;

    argc = convertToArray( params, &argv );

    if ((argc< 1)|| (argc > 2))
    {
	fprintf(stderr, "Usage: dtk_set_speech_rate rate options?" );
        freeArrayMemory( argc, argv );
	return FALSE;
    }

    rate = (DWORD) strtod(argv[0], &eptr); 

    if (eptr == argv[0]) {
	fprintf(stderr, "Rate: Numeric expected. \n" );
        freeArrayMemory( argc, argv );
	return FALSE;
    }
    if (argc == 2) {
	if (strcmp(argv[1], "-sync")==0) 
	    sync_flag = TRUE; 
	else if(strcmp(argv[1], "-no_sync")==0) 
	    sync_flag = FALSE; 
	else {
	    fprintf(stderr, "Valid switches are -sync or -no_sync");
            freeArrayMemory( argc, argv );
	    return (FALSE);
	}
    }
    if (sync_flag)
    {
	/* sync to output previously queued text */
	status = TextToSpeechSync(dtk_speaker_ptr->tts_handle);
	switch (status) {
	  case MMSYSERR_NOERROR:
	      if (dtk_speaker_ptr->output_file_ptr != NULL)
		  fflush(dtk_speaker_ptr->output_file_ptr);
	      break;
	  case MMSYSERR_ERROR: 
	      fprintf(stderr, "Unable to complete queued text. " );
              freeArrayMemory( argc, argv );
	      return FALSE;
	  case MMSYSERR_INVALHANDLE: 
	      fprintf(stderr, "Invalid handle to speech device \n" );
              freeArrayMemory( argc, argv );
	      return FALSE;
	  default: 
	      fprintf(stderr, "Unrecognized error status returned by synchronize operation. \n" );
              freeArrayMemory( argc, argv );
	      return FALSE;
	}
    }
    status = TextToSpeechSetRate (dtk_speaker_ptr->tts_handle, rate);
    if (status != MMSYSERR_NOERROR)
    {
	fprintf(stderr, "Failed to set speech rate to. \n");
   	freeArrayMemory( argc, argv );
	return FALSE;
    }
    if (sync_flag) {
	/* sync to make change effective immediately */
	status = TextToSpeechSync(dtk_speaker_ptr->tts_handle);
	switch (status) {
	  case MMSYSERR_NOERROR:
	      if (dtk_speaker_ptr->output_file_ptr != NULL)
		  fflush(dtk_speaker_ptr->output_file_ptr);
              freeArrayMemory( argc, argv );
	      return TRUE;
	  case MMSYSERR_ERROR: 
	      fprintf(stderr, "Unable to complete queued text. ");
              freeArrayMemory( argc, argv );
	      return FALSE;
	  case MMSYSERR_INVALHANDLE: 
	      fprintf(stderr, "Invalid handle to speech device \n");
              freeArrayMemory( argc, argv );
	      return FALSE;
	  default: 
	      fprintf(stderr,"Unrecognized error status returned by synchronize operation. \n");
              freeArrayMemory( argc, argv );
	      return FALSE;
	}
    }
    /* Not reached */
    freeArrayMemory( argc, argv );
    return (TRUE); 
}

/*  
 * dtkGetSpeechRateCmd --  Created:  Sat Oct  1 15:17:21 1994
 *Arguments: 
 * Standard TclCmd arguments.
 *clientData contains a pointer to the speaker object.
 * Results: 
 *  TCL error status.
 * Side Effects:
 * Sets interp->result to the value of the current speech rate.
 * TCL Synopsis:
 * dtk_speaker_object dtk_get_speech_rate
 */ 


static int dtkGetSpeechRateCmd ( char *params )
{
    int  status;
    DWORD rate; 

    status = TextToSpeechGetRate (dtk_speaker_ptr->tts_handle, &rate);
    if (status != MMSYSERR_NOERROR) {
	fprintf(stderr, "Failed to get  speech rate. \n");
	return FALSE;}

    fprintf(stdout, "%d", rate);
    return TRUE;
}

/*  
 * dtkLastIndexCmd --  Created:  Sat Oct  1 15:19:32 1994
 *Arguments: 
 * Standard TclCmd arguments. clientData contains a pointer to the speaker object.
 * Results: 
 *  TCL error status.
 * Side Effects:
 * Sets interp->result to the last index mark that was processed.
 * TCL Synopsis:
 * dtk_speaker_object dtk_last_index
 */ 


static int dtkLastIndexCmd (char * params)
{
    fprintf(stdout, "%d", dtk_speaker_ptr->last_index_mark); 
    return TRUE; 
}

/* Dtk_Init */

/* dtkInit --
 * Initializes an interpreter to have all the commands defined by
 * dtk.c
 * Also sources the library file dtk.tcl if correctly installed*/
int dtkInit( )
{
    DWORD output_format = DTK_DEFAULT_FORMAT;
    char *dtk_lib = (char *) NULL; 
    char initCmd[] =
	"if [file exists $dtk_lib/dtk.tcl] {\n\
	    source $dtk_lib/dtk.tcl\n\
	} else {\n\
	    set msg \"can't find $dtk_lib/dtk.tcl; perhaps you \"\n\
	    append msg \"need to\\ninstall dtk.tcl or set your DTK_TCL_LIBRARY \"\n\
	    append msg \"environment variable?\"\n\
	    error $msg\n\
	}";
#if 0
    if (getenv("DTK_TCL_LIBRARY") != NULL) 
          dtk_lib = getenv("DTK_TCL_LIBRARY"); 
    else { 
#ifdef DTK_TCL_LIBRARY
	    dtk_lib  = DTK_TCL_LIBRARY;
#else
	    fprintf(stderr,"there is no DTK_Tcl library at this installation.",
			   "Check environment variable DTK_TCL_LIBRARY. \n");
	    return FALSE;
#endif
    }
#endif


    /* Create command dtk_speaker */ 
    if( !dtkSpeakerCreateCmd( &output_format ) )
        return( FALSE );

    /* register subcommands for object dtk_speaker  */

    register_subcommand("dtk_log_phonemes", 	(void *)dtkLogPhonemesCmd);
    register_subcommand("dtk_get_left_volume", 	(void *)dtkGetLeftVolumeCmd);
    register_subcommand("dtk_set_volume", 	(void *)dtkSetVolumeCmd);
    register_subcommand("dtk_tone", 		(void *)dtkToneCmd);
    register_subcommand("dectalk_tone", 	(void *)dectalkSetTone);
    register_subcommand("dtk_get_right_volume", (void *)dtkGetRightVolumeCmd);
    register_subcommand("dtk_speaker_id", 	(void *)dtkSpeakerIdCmd);
    register_subcommand("dtk_set_output", 	(void *)dtkSetOutputCmd);
    register_subcommand("dtk_set_phoneme_log",	(void *)dtkSetPhonemeLogCmd);
    register_subcommand("dtk_set_wave_format_internal",(void*)dtkSetFormatCmd);
    register_subcommand("dtk_get_wave_format_internal",(void*)dtkGetFormatCmd);
    register_subcommand("dtk_speak", 		(void *)dtkSpeakCmd);
    register_subcommand("dtk_send", 		(void *)dtkSendCmd);
    register_subcommand("dtk_stop", 		(void *)dtkStopCmd);
    register_subcommand("dectalk_stop", 	(void *)dtkStopCmd);
    register_subcommand("dtk_reset", 		(void *)dtkResetCmd);
    register_subcommand("dtk_pause", 		(void *)dtkPauseCmd);
    register_subcommand("dectalk_pause", 	(void *)dtkPauseCmd);
    register_subcommand("dtk_resume", 		(void *)dtkResumeCmd); 
    register_subcommand("dectalk_resume", 	(void *)dtkResumeCmd); 
    register_subcommand("dtk_synchronize", 	(void *)dtkSynchCmd);
    register_subcommand("dectalk_synchronize", 	(void *)dectalkSynchronize);
    register_subcommand("dtk_set_speech_rate",	(void *)dtkSetSpeechRateCmd); 
    register_subcommand("dtk_get_speech_rate",	(void *)dtkGetSpeechRateCmd); 
    register_subcommand("dtk_last_index",	(void *)dtkLastIndexCmd );
    register_subcommand("dtk_get_spatial", 	(void *)dtkGetSpatialCmd);
    register_subcommand("dtk_get_elevation", 	(void *)dtkGetElevationCmd);
    register_subcommand("dtk_get_azimuth", 	(void *)dtkGetAzimuthCmd);
    register_subcommand("dtk_set_spatial", 	(void *)dtkSetSpatialCmd);
    register_subcommand("dectalk_set_punctuations", (void *)dtkSetPunctuations);
    register_subcommand("dectalk_split_caps",   (void *)dtkSplitCaps);
    register_subcommand("dectalk_capitalize",   (void *)dtkCapitalize);
    register_subcommand("dectalk_set_voidacter_scale",(void *)dectalkSetScale);
    register_subcommand("dectalk_set_speech_rate",(void *)dectalkSetRate);
    register_subcommand("dectalk_say",		(void *)dectalkSay);
    register_subcommand("dectalk_letter",	(void *)dectalkLetter);
    register_subcommand("dectalk_speak",	(void *)dectalkSpeak);
    register_subcommand("queue_speech",		(void *)dectalkQueueSpeech);
    register_subcommand("dectalk_space_special_void",(void *)dtkSpaceSpecialChar);

    return( TRUE );
}

int ValidateTextString( char *pCommandString )
{
    int commandStrLen;
    int i;
    int openParen=0, closeParen=0;

    commandStrLen = strlen( pCommandString );

    for ( i=0; i<=commandStrLen; i++ )
    {
        if ( pCommandString[i] =='{' )
            openParen++;
        else if ( pCommandString[i] == '}' )
            closeParen++;
    }
    if ( openParen != closeParen )
        return( FALSE );

    return(  TRUE );
}

void processCommands( char *command )
{
    char func[1024];
    char trueparams[1024];
    char *tempc, *temp, *params, *tempp, *semicolon;
    int i, len;
    int moreCommands = TRUE;

    if( command == NULL )
        return;

    tempc = command;
    /* Remove beginning spaces */
    len = strlen( tempc );
    i = 0;
    while( i < len )
    {
        if( isspace( tempc[0] ))
	{
	    tempc++;
	    i++;
	}
	else
	    break;
    }

    /* Find the function and it's params */
    params = strpbrk( tempc, " ");
    temp = params;
    while( temp != NULL )
    {
        if( isspace(temp[0] ))
            temp++;
        else
            break;
    }
    if(( params != NULL ) && ( temp != NULL ))
    {
	params++;
	while(( tempc != NULL ) && moreCommands )
	{
            i = strlen( tempc ) - strlen( params ) - 1;
            strncpy( func, tempc, i ); 
            func[i] = '\0';

            if(( semicolon = strpbrk(  params, ";" )) != NULL )
            {
                temp = semicolon + 1;
                while( temp != NULL )
                {
                    if( isspace(temp[0] ))
                        temp++;
                    else
                        break;
                }

            // if( temp ) is a valid function, then split this command into two
    	        if(( tempp = strpbrk( temp, " ")) != NULL )
	        {
                    i = strlen( temp ) - strlen( tempp );
                    strncpy( trueparams, temp, i );
	            trueparams[i]='\0';
	            if( !validateCommand( trueparams ))
		    {
		        moreCommands = FALSE;
            	        i = strlen( params ); 
		    }
                    else 
			i = strlen(params) - strlen( semicolon );
	        }
            }
            else { i = strlen( params ); moreCommands = FALSE; }

            strncpy( trueparams, params, i );
	    trueparams[i]='\0';

            if( !object_command( func, trueparams ))
	        fprintf(stderr, "error in command %s %s", func, trueparams );

            if( moreCommands )
            {
                tempc = temp;
                params = strpbrk( tempc, " " );
                params++;
            }
	}
    }
    else
	if( !object_command( command, NULL ))
	        fprintf(stderr, "error in command %s", command );
}

int main( int argc, char **argv )
{
    char command[1024];
    int len = 1024;
    int i;
    int gotCmd = FALSE;
    int needBrace = FALSE;


    if( !dtkInit( ))
	exit( 1 );

    signal( SIGABRT, dtkDeleteSpeaker );
    signal( SIGINT,  dtkDeleteSpeaker );
    signal( SIGTERM, dtkDeleteSpeaker );

    dectalk_global[SPLIT_CAPS] = 1;
    dectalk_global[CAPITALIZE] = 0;
    dectalk_global[SPACE_SPECIAL_CHAR] = 1;
    dectalk_global[TALKING] = 0;
    dectalk_global[SPEECH_RATE] = 375;
    dectalk_global_char_factor = 1.2;
    dectalk_global[SAY_RATE] =  dectalk_global[SPEECH_RATE] * 
				dectalk_global_char_factor;
    dectalk_global_punctuations = strdup("some");

#if 0
    /* This is something that T.V. had in his code? ... Don't know why. */
    dtkSpeakCmd("[:punc some] [:phoneme arpabet speak on] [:sync] [:np :ra 180][zhax<15> p'arl,] [/dh`ow<100,140> ,] [:np] [ zhax<13> suw<45>\iy<140,100>.]");
#endif

    dtkSpeakCmd("[:punc some] [:phoneme arpabet speak on] [:sync] [:np :ra 180]");

    // Process the commands forever!
    for(;;)
    {
	i = 0;	
	gotCmd = FALSE;

	/* Read the command line, and if there is a continue line character */
	/* '\', then just continue reading into the same string.            */
	do{
	    if( fgets( &command[i], len - i, stdin ) != NULL )
	    {
	 	i = strlen( command ) - 2;
		if( !strncasecmp( "dectalk_say", command, 11 )  ||
		    !strncasecmp( "queue_speech", command, 12 )  ||
		    !strncasecmp( "dectalk_speak", command, 13 ))
		{
		    needBrace = TRUE;
		    i++;
		    command[i] = ' ';
		    i++;
		}
		if( !needBrace && ( command[i] != '\\' )) 
	  	    gotCmd = TRUE; 
		else if(needBrace && ValidateTextString( command ))
		{
	  	    gotCmd = TRUE; 
		    needBrace = FALSE;
		}
	    }
	    else {
		fprintf(stderr,"Bad command\n");
	    }
	}while((i < len ) && !gotCmd );

#if DEBUG_DTK_MME
errors = fopen("errors.txt","a+");
fprintf(errors,"%s\n",command);
fclose(errors);
#endif

	i = strlen( command ) - 1;
	if( i > 0 )
	{
	    command[i]='\0';
	    processCommands( command );
	}
    }
}
