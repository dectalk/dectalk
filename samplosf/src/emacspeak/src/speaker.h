/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	12	05/14/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	05/14/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	05/14/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	05/14/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	05/14/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	05/14/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	05/14/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	05/14/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	05/14/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	05/14/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	05/14/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	05/14/97	leeber	Initial Version
$
 * Revision 1.1.2.2  1995/11/14  21:34:50  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 * 	[1995/11/14  21:33:50  Krishna_Mangipudi]
 *
 * $EndLog$
 */
/* Header Stuff */

/*$Id: speaker.h,v 1.1.2.2 1995/11/14 21:34:50 Krishna_Mangipudi Exp $*/
/*Description: Speaker structure definitions */

/* Include files */
#include <stdio.h>

/* dtk_speaker object */

/*-- A  speaker object is principally a tts_handle and the associated */ 
/* book-keeping data */ 

#define NUM_BUFFERS 3
#define BUFFER_SIZE 4096   
#define NUMBER_INDEX_MARKS  10
#define DTK_DEFAULT_FORMAT WAVE_FORMAT_1M16
#define DTK_DEFAULT_MODE "[:phoneme arpabet on]"
#define STOP_MARK 99
#define RESET_MARK 100

typedef struct dtk_buffer  {
    LPTTS_BUFFER_T speech_buffer_ptr; /* speech buffer */ 
    double  elapsed_time;
    time_t timer1;
    time_t timer2;
}dtk_buffer; 

typedef struct dtk_speaker {
    int id;			/* speaker id */ 
    LPTTS_HANDLE_T tts_handle;	/* tts handle */
    dtk_buffer  buffers[NUM_BUFFERS]; /* speech buffers */
    char * scratch;		/* temporary workspace */
    float left_volume;
    float right_volume;		/*scale factors*/ 
    DWORD  output_format;	/* encoding type */ 
    int last_index_mark;
    int log_phonemes;		/* boolean */
    FILE * output_file_ptr;	/* if non-NULL, where the output is sent */
    FILE * phoneme_log_ptr;	/* where the phoneme log  is sent */
    void (*dtk_callback_routine)(long, long, long); 
    int azimuth;                
    int elevation;              /* spatial locators */
    QUEUE queue;
}dtk_speaker; 

/* stereo: structure */

/*-- type stereo is a struct that holds left and right channels */
/* At present only handles short int samples */
typedef struct __stereo {
    short left;
    short right; 
} STEREO; 
