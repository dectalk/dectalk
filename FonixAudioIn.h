#ifndef __fonixaudioin_h
#define __fonixaudioin_h

#ifndef bool
#define bool int
#endif

#define FNX_AUDIO_IN_CALIBRATE          (0x0001)  
#define FNX_AUDIO_IN_QUIET              (0x0002)     
#define FNX_AUDIO_IN_SOUND              (0x0004)      
#define FNX_AUDIO_IN_CALIBRATE_ERR      (0x0008)
#define FNX_AUDIO_IN_FILE               (0x0010)
#define FNX_AUDIO_IN_AGC                (0x0020)
#define FNX_AUDIO_IN_NO_DETECTION       (0x0040)
#define FNX_AUDIO_IN_PLAY               (0x0080)
#define FNX_AUDIO_IN_MIN_LSILENCE_ERR   (0x0100)
#define FNX_AUDIO_IN_LSILENCE           (0x0200)
#define FNX_AUDIO_IN_TSILENCE           (0x0400)
#define FNX_AUDIO_IN_MAX_RECORD         (0x0800)
#define FNX_AUDIO_IN_CLIPPED            (0x1000)
#define FNX_AUDIO_IN_FILE_ERROR         (0x2000)
#define FNX_AUDIO_IN_INVALID            (0x4000)
#define FNX_AUDIO_IN_ABORT              (0x8000)

typedef int FNX_AUDIO_IN_FLAG;

typedef void * FnxAudioIn;
	
typedef struct 
{
    int                recordStop;
    FNX_AUDIO_IN_FLAG  flags;
    int                percentMaxRecord;
    int                elapsedTime;
    int                peak;
    int                level;
} FnxAudioInStatusData;

typedef void (*FnxAudioInStatusProc)( FnxAudioInStatusData *, void * pUserData );

typedef void (*FnxAudioInCreateProc)();
typedef void (*FnxAudioInInitProc)( int sampleRate );
typedef short * (*FnxAudioInRecordProc)( int * pSamples  );
typedef void (*FnxAudioInQuitProc)();
typedef void (*FnxAudioInDestroyProc)();

typedef struct
{
     FnxAudioInCreateProc  pAudioInCreate;
     FnxAudioInInitProc    pAudioInInit;
     FnxAudioInRecordProc  pAudioInRecord;
     FnxAudioInQuitProc    pAudioInQuit;
     FnxAudioInDestroyProc pAudioInDestroy;
} FnxAudioInDriver;

#if defined(__cplusplus)
extern "C" {
#endif

#if defined(WIN32) || defined(_WIN32) || defined(_WIN32_WCE)
#define export(a,b) __declspec(dllexport) a b
#else
#define export(a,b) a b
#endif

/* FnxAudioIn creation/destruction */
export( FnxAudioIn, FnxAudioInCreate() );
export( int,     FnxAudioInGetApiVersion() );
export( void,    FnxAudioInDestroy( FnxAudioIn ) );

/* Audio drivers */
export( void,    FnxAudioInSetDrivers( FnxAudioIn, FnxAudioInDriver * ) );
export( void,    FnxAudioInGetDrivers( FnxAudioIn, FnxAudioInDriver ** ) );

/* Audio recording feedback */
export( void,    FnxAudioInSetStatusProc( FnxAudioIn, FnxAudioInStatusProc, void * pUserData ) );
export( void,    FnxAudioInGetStatusProc( FnxAudioIn, FnxAudioInStatusProc *, void ** ppUserData ) );

/* FnxAudioIn settings */
export( void,    FnxAudioInSetUseConcurrentRecog( FnxAudioIn, bool useConcurrent ) );
export( void,    FnxAudioInSetTrailingSilence( FnxAudioIn, int trailingSilence ) );
export( void,    FnxAudioInSetLeadingSilence( FnxAudioIn, int leadingSilence ) );
export( void,    FnxAudioInSetMaximumRecord( FnxAudioIn, int maximumRecord ) );
export( void,    FnxAudioInSetDetectSpeech( FnxAudioIn, bool detectSpeech ) );
export( void,    FnxAudioInSetSoundLevels( FnxAudioIn, int silenceMean, int silenceRange, int speechMean, int speechRange, bool freeze ) );

export( bool,    FnxAudioInGetUseConcurrentRecog( FnxAudioIn ) );
export( int,     FnxAudioInGetTrailingSilence( FnxAudioIn ) );
export( int,     FnxAudioInGetLeadingSilence( FnxAudioIn ) );
export( int,     FnxAudioInGetMaximumRecord( FnxAudioIn ) );
export( bool,    FnxAudioInGetDetectSpeech( FnxAudioIn ) );
export( void,    FnxAudioInGetSoundLevels( FnxAudioIn, int * silenceMean, int * silenceRange, int * speechMean, int * speechRange, bool * freeze ) );

#if defined(__cplusplus)
}
#endif

#endif 
