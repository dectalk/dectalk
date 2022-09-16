#ifndef __fonixaudioout_h
#define __fonixaudioout_h

#ifndef bool
#define bool int
#endif
	
#define FNX_AUDIO_OUT_SOURCE_NONE       0
#define FNX_AUDIO_OUT_SOURCE_MIC        1
#define FNX_AUDIO_OUT_SOURCE_TTS        2
#define FNX_AUDIO_OUT_SOURCE_FILE       3
#define FNX_AUDIO_OUT_SOURCE_RAW        4

#define FNX_AUDIO_OUT_FORMAT_PCM		1
#define FNX_AUDIO_OUT_FORMAT_ALAW		6
#define FNX_AUDIO_OUT_FORMAT_MULAW		7

typedef int FNX_AUDIO_OUT_FORMAT_FLAG;
typedef int FNX_AUDIO_OUT_SOURCE_FLAG;

typedef void * FnxAudioOut;

typedef void (*FnxAudioOutCreateProc)();
typedef void (*FnxAudioOutInitProc)( int * samplesEachPlay, int sampleRate, FNX_AUDIO_OUT_SOURCE_FLAG source, int bytesPerSample, FNX_AUDIO_OUT_FORMAT_FLAG format );
typedef void (*FnxAudioOutPlayProc)( short * pData, int samples );
typedef void (*FnxAudioOutQuitProc)();
typedef void (*FnxAudioOutDestroyProc)();

typedef struct
{
    FnxAudioOutCreateProc  pAudioOutCreate;
    FnxAudioOutInitProc    pAudioOutInit;
	FnxAudioOutPlayProc    pAudioOutPlay;
    FnxAudioOutQuitProc    pAudioOutQuit;
    FnxAudioOutDestroyProc pAudioOutDestroy;
} FnxAudioOutDriver;

#if defined(__cplusplus)
extern "C" {
#endif

#if defined(WIN32) || defined(_WIN32) || defined(_WIN32_WCE)
#define export(a,b) __declspec(dllexport) a b
#else
#define export(a,b) a b
#endif

/* FnxAudioOut creation/destruction */
export( FnxAudioOut, FnxAudioOutCreate() );
export( int,     FnxAudioOutGetApiVersion() );
export( void,    FnxAudioOutDestroy( FnxAudioOut ) );

/* Audio drivers */
export( void,    FnxAudioOutSetDrivers( FnxAudioOut, FnxAudioOutDriver * ) );
export( void,    FnxAudioOutGetDrivers( FnxAudioOut, FnxAudioOutDriver ** ) );

/* Runtime */
export( void,    FnxAudioOutOpenStreaming( FnxAudioOut, int * samplesEachPlay, int sampleRate, int bytesPerSample, FNX_AUDIO_OUT_FORMAT_FLAG format ) );
export( void,    FnxAudioOutPlayStreaming( FnxAudioOut, short * pRawData, int rawSamples ) );
export( void,    FnxAudioOutCloseStreaming( FnxAudioOut ) );
export( void,    FnxAudioOutPlayRawData( FnxAudioOut, short * pRawData, int rawSamples, int rawSampleRate ) );
export( void,    FnxAudioOutPlayWave( FnxAudioOut, char * szWaveName ) );

#if defined(__cplusplus)
}
#endif


#endif 
