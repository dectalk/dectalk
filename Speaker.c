/*C_HEADER_FILE****************************************************************
FILE			:	Speaker.c
DESC			:	wave playing functions for Epson S1C33 using vox software
TABS			:	3
OWNER			:	fonix
DATE CREATED:	

(C) Copyright 2001 All rights reserved.
This is an unpublished work, and is confidential and proprietary: 
technology and information of fonix corporation.  No part of this
code may be reproduced, used or disclosed without written consent of 
fonix corporation in each and every instance.

*END_HEADER*******************************************************************/
#include "FonixCore.h"
#include "S1C33Audio.h"
#include "S1C33Memory.h"

#include "Speak.h"
#include "voxcomn.h"

#define FNX_AUDIO_OUT_SOURCE_10bit       5

unsigned char *SpkParams;
short *SpkBuffer;
int	spkrDone;
int gQueueDifference;
int gSpkLLSequence;
int gPlayedSequence;
FNX_AUDIO_OUT_SOURCE_FLAG gSource;

typedef struct tagSpkLList
{
	short * pData;
	struct tagSpkLList * pNext;
	int sequence;
} SpkLList;

SpkLList * gSpkLLHead = NULL;
SpkLList * gSpkLLTail = NULL;

SpkLList * NewSpkLListMember( short * pData )
{
	SpkLList * llist = S1C33Malloc( sizeof( SpkLList ) );
	llist->pData = pData;
	llist->pNext = NULL;
	llist->sequence = gSpkLLSequence++;
	return llist;
}

void SpkQueueDone(unsigned char *SpkParams, short *Buffer, int Length);
void SpeakerFinished(unsigned char *SpkParams);

int FormatAudioData16bTo10b(short* Src, short* Dst, int Length, unsigned int source)
{
	int i;

	if(source == FNX_AUDIO_OUT_SOURCE_10bit)
	{
		for(i=0;i<Length;i++)
			Dst[i] = Src[i];
	}
	else if(source == FNX_AUDIO_OUT_SOURCE_MIC){
		for(i=0;i<Length;i++)
			Dst[i] = Src[i] + 512;
	}
	else if(source == FNX_AUDIO_OUT_SOURCE_TTS || source == FNX_AUDIO_OUT_SOURCE_FILE)
	{
		for (i = 0; i < Length;i++)
			Dst[i] = (Src[i] >> 6)+512;		//zero center data and convert 16 bit -> 10 bit
	} 

/*	else if(source == FNX_AUDIO_OUT_SOURCE_TTS || source == FNX_AUDIO_OUT_SOURCE_FILE)
	{
		for (i = 0; i < Length;i++)
			Dst[i] = (Src[i] + 32767) / 64;		//zero center data and convert 16 bit -> 10 bit
	} 
*/

	else
		return (-1);
	return 0;
}

int IsDone()
{
	return spkrDone;
}

int GetThisInteger( int val )	// to keep the compiler from optimizing out
{
	return val;
}

void SpkQueueDone(unsigned char *SpkParams, short *Buffer, int Length)
{
	gQueueDifference--;
	gPlayedSequence++;
}

void SpeakerFinished(unsigned char *SpkParams)
{
	spkrDone = 1;
}

void AudioOutCreate()
{
	return;
}

void AudioOutInit( int * samplesEachPlay, int sampleRate, FNX_AUDIO_OUT_SOURCE_FLAG source, int bytesPerSample, FNX_AUDIO_OUT_FORMAT_FLAG format )
{
	gSpkLLHead = gSpkLLTail = NULL;

	gQueueDifference = 0;
	gSpkLLSequence = 0;
	gPlayedSequence = 0;
	gSource = source;
	SpkInit();
	SpkSoftening(1);
	SpkParams = SpkOpen(0, SPK_SAMPLING(CPU_CLK_RATE, sampleRate));
	SpkOnDone(SpkParams, SpkQueueDone);
	SpkOnEmpty(SpkParams, SpeakerFinished);

	*samplesEachPlay = TTS_BUFFER_SIZE;
}

int AudioOutPlay( short * pData, int samples )
{
	short	*pBuffer;
	SpkLList * SpkLListNext = NULL;

	/* 2 buffer for speak */
	pBuffer = (short *)S1C33Malloc( samples*sizeof(short) );
	if( !gSpkLLHead )
	{
		gSpkLLHead = gSpkLLTail = NewSpkLListMember( pBuffer );
	}
	else
	{
		gSpkLLTail->pNext = NewSpkLListMember( pBuffer );
		gSpkLLTail = gSpkLLTail->pNext;
	}
	if (pBuffer)
	{
		if( FormatAudioData16bTo10b( pData, pBuffer, samples, gSource ) )
			return 0;
		if( SpkRoom(SpkParams) > 0)
		{
			gQueueDifference++;
			SpkAppend(SpkParams, pBuffer, samples); 
			spkrDone = 0;
			
			//IF NOT CACHING TTS DECOMPRESSION CODE DELAY THE FIRST BUFFER TO AVOID BREAKS
			//if( gQueueDifference > 1 && !SpkIsRunning(SpkParams) )
			if( !SpkIsRunning(SpkParams) )
			{
				SpkStart(SpkParams);		/* start speaking */
			}
			while( GetThisInteger( gQueueDifference ) > 5 )
			{
				// wait
			}
			while( gSpkLLHead->pNext && gSpkLLHead->sequence < gPlayedSequence )
			{
				S1C33Free( gSpkLLHead->pData );
				SpkLListNext = gSpkLLHead->pNext;
				S1C33Free( gSpkLLHead );
				gSpkLLHead = SpkLListNext;
			}
		}
	}
	return 0;
}

void AudioOutQuit()
{
	SpkLList * llist = NULL;
	SpkLList * llistNext = NULL;

	if( !SpkIsRunning(SpkParams) )
	{
		SpkStart(SpkParams);		/* start speaking */
	}
	while (!IsDone()) {}
	SpkClose(SpkParams);

	llist = gSpkLLHead;
	while( llist )
	{
		S1C33Free( llist->pData );
		llistNext = llist->pNext;
		S1C33Free( llist );
		llist = llistNext;
	}

	gSpkLLHead = gSpkLLTail = NULL;
}

void AudioOutDestroy()
{
	return;
}

