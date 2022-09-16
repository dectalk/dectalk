// WIN32 version (each platform should have their own)
#ifndef AUDIO_MAPPING

#ifdef OUTPUT_FILE
extern FILE *outfile;
#else

#include "FonixAudioOut.h"

extern short *AudioBuffer;
extern int sizeAudioBuffer;
//short *AudioBuffer=NULL;
//int sizeAudioBuffer=0;

extern void AudioOutBufferAll( short * MiniAudioBuffer, int MiniAudioBufferSamples );
extern void AudioOutInitBuffer( int * samplesEachPlay, int sampleRate, FNX_AUDIO_OUT_SOURCE_FLAG source );
extern void AudioOutPlayBuffer( );

#endif

#define AUDIO_OUT_CREATE
#define AUDIO_OUT_INIT AudioOutInitBuffer
#define AUDIO_OUT_PLAY AudioOutBufferAll
#define AUDIO_OUT_QUIT AudioOutPlayBuffer
#define AUDIO_OUT_DESTROY
#endif