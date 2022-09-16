/*
 ***********************************************************************
 *                                                                      
 *                           Coryright (c)                              
 *    © Force Computers, Inc. 2000. All rights reserved.        
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
 *    File Name:	sapiiont.cpp
 *    Author:		Matthew Schnee                                         
 *    Creation Date:06/28/2000                                                   
 *                                                                             
 *    Functionality:                                                           
 *    this file is intended to be able to output data to the sapi object.
 *		the source file for this must be a cpp because it need saccess to the
 *		TTSEngObj class and a .c file wont work.
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001	MGS		07/20/2000		Sapi 5 stuff
 * 002	NAL		07/25/2000		Added ls_sapi_find_word() to search sapi lexicons
 * 003	MGS		07/26/2000		Sapi 5 visual notification
 * 004  NAL		07/26/2000		Fixed SAPI/ARPA R, ER, RR prob
 */


#include "stdafx.h"
#include "dectalkf.h"
#include <windows.h>
#include <malloc.h>
#include "port.h"
#include "defs.h"
#include "kernel.h"
#include "ph_def.h"    /* MVP : Now phinst.h includes phdefs.h */
#include "samprate.h"
#include "dectalkf.h"

#include <process.h>
#include <mmsystem.h>
#include <mmreg.h>
#include <string.h>
#include "mmalloc.h"
//#include "audioapi.h"

#include "sapiiont.h"


#ifdef AUD_DEBUG
#include "kernel.h" // for ODS debug
#endif //AUD_DEBUG


#include "tts.h"
#include "ttsengobj.h"

static DWORD __stdcall SapiAudioThreadMain( LPAUDIO_PARAMS_T pAudioParams );

extern "C" void DestroyAudioObjects(LPAUDIO_PARAMS_T pAudioParams);

static void ResetAudioQueue( LPAUDIO_PARAMS_T pAudioParams );
extern "C" unsigned char LinearToMuLaw( short wSample );
extern "C" MMRESULT SAPI_PA_Queue( LPAUDIO_PARAMS_T pAudioParams,
					 LPAUDIO_T pBuffer,
					 DWORD dwLength );
extern "C" void ls_util_send_phone(LPTTS_HANDLE_T phTTS,int ph);

#ifdef __osf__
extern "C" int ls_homo_sapi_homo(LPTTS_HANDLE_T phTTS, unsigned  int, unsigned  int);
#else
extern "C" int ls_homo_sapi_homo(LPTTS_HANDLE_T phTTS, unsigned long, unsigned long);
#endif


#define MISS 0
#define HIT  1



double volume_table[101]=
{
	0.000000,
	0.032685,
	0.033875,
	0.035065,
	0.036301,
	0.037583,
	0.038895,
	0.040269,
	0.041672,
	0.043137,
	0.044663,
	0.046235,
	0.047852,
	0.049531,
	0.051286,
	0.053086,
	0.054948,
	0.056870,
	0.058869,
	0.060945,
	0.063081,
	0.065309,
	0.067597,
	0.069978,
	0.072435,
	0.074983,
	0.077623,
	0.080339,
	0.083162,
	0.086091,
	0.089113,
	0.092256,
	0.095491,
	0.098848,
	0.102327,
	0.105913,
	0.109636,
	0.113497,
	0.117479,
	0.121614,
	0.125887,
	0.130312,
	0.134890,
	0.139635,
	0.144533,
	0.149615,
	0.154879,
	0.160311,
	0.165957,
	0.171786,
	0.177813,
	0.184070,
	0.190539,
	0.197238,
	0.204166,
	0.211337,
	0.218769,
	0.226459,
	0.234409,
	0.242649,
	0.251179,
	0.260014,
	0.269139,
	0.278599,
	0.288396,
	0.298528,
	0.309026,
	0.319875,
	0.331121,
	0.342763,
	0.354803,
	0.367269,
	0.380179,
	0.393545,
	0.407370,
	0.421683,
	0.436515,
	0.451850,
	0.467735,
	0.484169,
	0.501183,
	0.518791,
	0.537026,
	0.555901,
	0.575433,
	0.595651,
	0.616587,
	0.638254,
	0.660685,
	0.683909,
	0.707942,
	0.732815,
	0.758572,
	0.785229,
	0.812818,
	0.841382,
	0.870954,
	0.901564,
	0.933242,
	0.966049,
	1.000000
};


char SapiToArpaTable[] = {
//arpa	sapi
0,
108, //	- syllable boundary (hyphen)			1
118, //	! Sentence terminator (exclamation mark)2 
111, //	& word boundary							3 
115, //	, Sentence terminator (comma)			4 
116, //	. Sentence terminator (period)			5 
117, //	? Sentence terminator (question mark)	6
0,	//	_ Silence (underscore)					7 
103, //	1 Primary stress						8 
102, //	2 Secondary stress						9 
6,	//	aa	father		10 
5,	//	ae	cat			11 
9,	//	ah	cut			12 
10, //	ao	dog			13 
8,	//	aw	foul		14 
17, //	ax	ag0			15 
7,	//	ay	bite		16 
46, //	b	big			17 
54, //	ch	chin		18 
48, //	d	dig			19 
40, //	dh	then		20 
4,	//	eh	pet			21 
15, //	er	fur			22 
3,	//	ey	ate			23 
37, //	f	fork		24 
50, //	g	gut			25 
28, //	h	help		26 
2,	//	ih	fill		27 
1,	//	iy	feel		28 
55, //	jh	joy			29 
49, //	k	cut			30 
27, //	l	lid			31 
31, //	m	mat			32 
32, //	n	no			33 
33, //	ng	sing		34 
11, //	ow	go			35 
12, //	oy	toy			36 
45, //	p	put			37 
26, //	r	red			38 
41, //	s	sit			39 
43, //	sh	she			40 
47, //	t	talk		41 
39, //	th	thin		42 
13, //	uh	book		43 
14, //	uw	too			44 
38, //	v	vat			45 
24, //	w	with		46 
25, //	y	yard		47 
42, //	z	zap			48 
44 //	zh	pleasure	49 
};

char ArpaToSapiTable[]= {
7,	0,	0,	//	'_',	' ',
27,	0,	0,	//	'i',	'y',
27,	0,	0,	//	'i',	'h',
23,	0,	0,	//	'e',	'y',
21,	0,	0,	//	'e',	'h',
11,	0,	0,	//	'a',	'e',
10,	0,	0,	//	'a',	'a',
16,	0,	0,	//	'a',	'y',
14,	0,	0,	//	'a',	'w',
12,	0,	0,	//	'a',	'h',
13,	0,	0,	//	'a',	'o',
35,	0,	0,	//	'o',	'w',
36,	0,	0,	//	'o',	'y',
43,	0,	0,	//	'u',	'h',
44,	0,	0,	//	'u',	'w',
22,	0,	0,	//	'r',	'r',
47,	44,	50,	//	'y',	'u',
15,	0,	0,	//	'a',	'x',
27,	0,	0,	//	'i',	'x',	goes to ih
27,	38,	50,	//	'i',	'r',
21,	38,	50,	//	'e',	'r',
12,	38,	50,	//	'a',	'r',
35,	38,	50,	//	'o',	'r',
43,	38,	50,	//	'u',	'r',
46,	0,	0,	//	'w',	' ',
47,	0,	0,	//	'y',	'x',
38,	0,	0,	//	'r',	' ',
31,	0,	0,	//	'l',	' ',
26,	0,	0,	//	'h',	'x',
38,	0,	0,	//	'r',	'x',
31,	0,	0,	//	'l',	'x',
32,	0,	0,	//	'm',	' ',
33,	0,	0,	//	'n',	' ',
34,	0,	0,	//	'n',	'x',
15,	31,	50,	//	'e',	'l',	goes to ax,l
19,	0,	0,	//	'd',	'z',	/* Dentalized "d".	*/	goes to d
15,	33,	50,	//	'e',	'n',	goes to ax,n 
24,	0,	0,	//	'f',	' ',
45,	0,	0,	//	'v',	' ',
42,	0,	0,	//	't',	'h',
20,	0,	0,	//	'd',	'h',
39,	0,	0,	//	's',	' ',
48,	0,	0,	//	'z',	' ',
40,	0,	0,	//	's',	'h',
49,	0,	0,	//	'z',	'h',
37,	0,	0,	//	'p',	' ',
17,	0,	0,	//	'b',	' ',
41,	0,	0,	//	't',	' ',
19,	0,	0,	//	'd',	' ',
30,	0,	0,	//	'k',	' ',
25,	0,	0,	//	'g',	' ',
19,	0,	0,	//	'd',	'x',	goes to d
41,	0,	0,	//	't',	'x',	goes to t
7,	0,	0,	//	'q',	' ',	goes to nothing
18,	0,	0,	//	'c',	'h',
29,	0,	0,	//	'j',	'h',
19,	0,	0	//	'd',	'f',	goes to d
};


char SapiToVisemeTable[]={
0,
SP_VISEME_0,  //	- syllable boundary (hyphen) 1 
SP_VISEME_0,  //	! Sentence terminator (exclamation mark) 2 
SP_VISEME_0,  //	& word boundary 3 
SP_VISEME_0,  //	, Sentence terminator (comma) 4 
SP_VISEME_0,  //	. Sentence terminator (period) 5 
SP_VISEME_0,  //	? Sentence terminator (question mark) 6
SP_VISEME_0,  //	_ Silence (underscore) 7 
SP_VISEME_0,  //	1 Primary stress 8 
SP_VISEME_0,  //	2 Secondary stress 9 
SP_VISEME_2,  //	aa father 10 
SP_VISEME_1,  //	ae cat 11 
SP_VISEME_1,  //	ah cut 12 
SP_VISEME_3,  //	ao dog 13 
SP_VISEME_9,  //	aw foul 14 
SP_VISEME_1,  //	ax ag0 15 
SP_VISEME_11, //	ay bite 16 
SP_VISEME_21, //	b big 17 
SP_VISEME_16, //	ch chin 18 
SP_VISEME_19, //	d dig 19 
SP_VISEME_17, //	dh then 20 
SP_VISEME_4,  //	eh pet 21 
SP_VISEME_5,  //	er fur 22 
SP_VISEME_4,  //	ey ate 23 
SP_VISEME_18, //	f fork 24 
SP_VISEME_20, //	g gut 25 
SP_VISEME_12, //	h help 26 
SP_VISEME_6,  //	ih fill 27 
SP_VISEME_6,  //	iy feel 28 
SP_VISEME_16, //	jh joy 29 
SP_VISEME_20, //	k cut 30 
SP_VISEME_14, //	l lid 31 
SP_VISEME_21, //	m mat 32 
SP_VISEME_19, //	n no 33 
SP_VISEME_20, //	ng sing 34 
SP_VISEME_8,  //	ow go 35 
SP_VISEME_10, //	oy toy 36 
SP_VISEME_21, //	p put 37 
SP_VISEME_13, //	r red 38 
SP_VISEME_15, //	s sit 39 
SP_VISEME_16, //	sh she 40 
SP_VISEME_19, //	t talk 41 
SP_VISEME_17, //	th thin 42 
SP_VISEME_4,  //	uh book 43 
SP_VISEME_7,  //	uw too 44 
SP_VISEME_18, //	v vat 45 
SP_VISEME_7,  //	w with 46 
SP_VISEME_6,  //	y yard 47 
SP_VISEME_15, //	z zap 48 
SP_VISEME_16  //	zh pleasure 49
};

extern "C" int OutputSapiAudioData(LPTTS_HANDLE_T phTTS,
		  			short * pBuffer,
					unsigned int uiSamplesToOutput)
{	
	HRESULT return_value=0;
	PKSD_T pKsd_t=phTTS->pKernelShareData;
	double fvolume=volume_table[pKsd_t->volume];

	if ((!pKsd_t->halting) && (!((CTTSEngObj *)phTTS->CTTSEngObj)->m_abort_from_audio) && 
		((CTTSEngObj *)phTTS->CTTSEngObj)->SkipToSentence==0  )
	{
		// set the volume here
		for (unsigned int i=0;i<uiSamplesToOutput;i++)
		{
			pBuffer[i]=(short)(fvolume * (double)(pBuffer[i]));
		}
		if (phTTS->pAudioHandle->bAudioIsEightBit)
		{
			unsigned int dwI;
			unsigned long ulTemp;
			unsigned char *ucDestBuf = (unsigned char *)pBuffer;
			short *sSrcBuf = (SHORT *)pBuffer;
			// readjust teh length to be "samples"..
		//	dwLength = dwLength>>1;
			// convert in place.. take the invariant compare out of the loop..
			if (phTTS->pAudioHandle->bAudioIsMulaw)
			{
				for (dwI=0;dwI<uiSamplesToOutput;dwI++)
				{
					ucDestBuf[dwI] = LinearToMuLaw(sSrcBuf[dwI]);
				}
			}
			else
			{
				// linear..
				for (dwI=0;dwI<uiSamplesToOutput;dwI++)
				{
					ulTemp = sSrcBuf[dwI]+32767;
					ucDestBuf[dwI] = (unsigned char)(ulTemp>>8);
				}
			}
		}
		

		switch(phTTS->dwFormat)
		{
		case WAVE_FORMAT_08M08:
		case WAVE_FORMAT_1M08:
			
			return_value=((CTTSEngObj *)phTTS->CTTSEngObj)->m_pOutputSite->Write( pBuffer,
				uiSamplesToOutput,
				NULL );
			if (return_value!=S_OK)
			{
				return_value=1;
				((CTTSEngObj *)phTTS->CTTSEngObj)->m_abort_from_audio=1;
			}
			EnterCriticalSection( phTTS->pcsQueuedSampleCount );
			phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput; 
			LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
			
			
			break;
		case WAVE_FORMAT_1M16:
			return_value=((CTTSEngObj *)phTTS->CTTSEngObj)->m_pOutputSite->Write( pBuffer,
				uiSamplesToOutput<<1,
				NULL );
			if (return_value!=S_OK)
			{
				return_value=1;
				((CTTSEngObj *)phTTS->CTTSEngObj)->m_abort_from_audio=1;
			}
			EnterCriticalSection( phTTS->pcsQueuedSampleCount );
			phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput << 1 ; 
			LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
			break;
		}
	}
	return(0);
}	


extern "C" void SendEventToSapi(LPTTS_HANDLE_T phTTS,int uiMsg, void *in_Mark,LPARAM lParam)
{
	PMARK_DATA Mark=(PMARK_DATA)in_Mark;
	CSpEvent CurEvent;
	HRESULT hr=S_OK;
	PKSD_T pKsd_t=phTTS->pKernelShareData;
	
	if ((!phTTS->pKernelShareData->halting) && (!((CTTSEngObj *)phTTS->CTTSEngObj)->m_abort_from_audio))
	{
		if ((unsigned int)uiMsg==phTTS->uiID_Sentence_Message)
		{
			int not_found=1;
			SPLISTPOS ListPos=((CTTSEngObj *)phTTS->CTTSEngObj)->sentence_list.GetHeadPosition();
			while (ListPos && not_found)
			{
				sentence_c &cur_sent=((CTTSEngObj *)phTTS->CTTSEngObj)->sentence_list.GetNext(ListPos);
				if ((unsigned int)cur_sent.sentence_number==Mark->dwMarkValue)
				{
					CurEvent.eEventId             = SPEI_SENTENCE_BOUNDARY;
					CurEvent.elParamType          = SPET_LPARAM_IS_UNDEFINED;
					CurEvent.ullAudioStreamOffset = Mark->qTimeStamp+2;
					CurEvent.wParam               = (WPARAM)(cur_sent.textsrcoffset);
					CurEvent.lParam               = (LPARAM)(cur_sent.textsrclength);
					hr = ((CTTSEngObj *)phTTS->CTTSEngObj)->m_pOutputSite->AddEvents( &CurEvent, 1 );
					if (((CTTSEngObj *)phTTS->CTTSEngObj)->SkipToSentence)
					{
						((CTTSEngObj *)phTTS->CTTSEngObj)->NumberSkipped++;
					}

					if (((CTTSEngObj *)phTTS->CTTSEngObj)->SkipToSentence==cur_sent.sentence_number)
					{
						((CTTSEngObj *)phTTS->CTTSEngObj)->m_pOutputSite->CompleteSkip(((CTTSEngObj *)phTTS->CTTSEngObj)->NumberSkipped);
						((CTTSEngObj *)phTTS->CTTSEngObj)->SkipToSentence=0;
						phTTS->SkippingForward=0;
					}
					not_found=0;
				}
			}
			((CTTSEngObj *)phTTS->CTTSEngObj)->m_current_sentence_number=Mark->dwMarkValue;
		}
		if ((unsigned int)uiMsg==phTTS->uiID_Wordpos_Message)
		{
			CurEvent.eEventId             = SPEI_WORD_BOUNDARY;
			CurEvent.elParamType          = SPET_LPARAM_IS_UNDEFINED;
			CurEvent.ullAudioStreamOffset = Mark->qTimeStamp+2;
			CurEvent.wParam               = (WPARAM)((Mark->dwMarkValue & 0xff000000) >> 24);
			CurEvent.lParam               = (LPARAM)Mark->dwMarkValue & 0x00ffffff;
			hr = ((CTTSEngObj *)phTTS->CTTSEngObj)->m_pOutputSite->AddEvents( &CurEvent, 1 );
		}
		if (uiMsg==(SPC_type_index | SPC_subtype_volume))
		{
			int temp;
			temp=((Mark->dwMarkValue))+((CTTSEngObj *)phTTS->CTTSEngObj)->CurrentRealtimeVolumeDelta;
			if (temp<0)
				temp=0;
			if (temp>100)
				temp=100;
			phTTS->pKernelShareData->volume=temp;
		}
		
	}
}

extern "C" void SendSapi5VisualNotification(LPTTS_HANDLE_T phTTS, DWORD dwPhoneme, DWORD dwDuration,DWORD NextPhone)
{
	CSpEvent CurEvent;
	HRESULT hr=S_OK;
	PKSD_T pKsd_t=phTTS->pKernelShareData;
	char first_sapi_phone=0;
	char second_sapi_phone=0;
	int first_duration=0;
	int second_duration=0;
	int duration_mult=100;

	pKsd_t->dwLastPhoneme = dwPhoneme;
	if (((CTTSEngObj *)phTTS->CTTSEngObj)->m_event_interest & (SPFEI(SPEI_PHONEME) | SPFEI(SPEI_VISEME)))
	{
		first_sapi_phone=ArpaToSapiTable[(dwPhoneme & 0x00ff)*3];
		second_sapi_phone=ArpaToSapiTable[(dwPhoneme & 0x00ff)*3+1];
		if (second_sapi_phone)
		{
			duration_mult=ArpaToSapiTable[(dwPhoneme & 0x00ff)*3+2];
			first_duration=(dwDuration*100)/duration_mult;
			second_duration=dwDuration-first_duration;
		}
		else
		{
			first_duration=dwDuration;
		}
		if (((CTTSEngObj *)phTTS->CTTSEngObj)->m_event_interest & SPFEI(SPEI_PHONEME))
		{
			CurEvent.eEventId             = SPEI_PHONEME;
			CurEvent.elParamType          = SPET_LPARAM_IS_UNDEFINED;
			EnterCriticalSection( phTTS->pcsQueuedSampleCount );
			CurEvent.ullAudioStreamOffset = phTTS->dwQueuedSampleCount;
			LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
			if (second_sapi_phone)
			{
				CurEvent.wParam               = (WPARAM)(first_duration<<16) + second_sapi_phone;
			}
			else
			{
				CurEvent.wParam               = (WPARAM)(first_duration<<16) + ArpaToSapiTable[(NextPhone & 0x00ff)*3];
			}
			CurEvent.lParam               = (LPARAM)(first_sapi_phone);
			hr = ((CTTSEngObj *)phTTS->CTTSEngObj)->m_pOutputSite->AddEvents( &CurEvent, 1 );
			if (hr!=S_OK)
			{
				hr=2;
			}
			if (second_sapi_phone)
			{
				CurEvent.eEventId             = SPEI_PHONEME;
				CurEvent.elParamType          = SPET_LPARAM_IS_UNDEFINED;
				EnterCriticalSection( phTTS->pcsQueuedSampleCount );
				CurEvent.ullAudioStreamOffset = phTTS->dwQueuedSampleCount + first_duration;
				LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
				CurEvent.wParam               = (WPARAM)(second_duration<<16)+ ArpaToSapiTable[NextPhone*3];
				CurEvent.lParam               = (LPARAM)(second_sapi_phone);
				hr = ((CTTSEngObj *)phTTS->CTTSEngObj)->m_pOutputSite->AddEvents( &CurEvent, 1 );
				if (hr!=S_OK)
				{
					hr=2;
				}
			}
		}
		if (((CTTSEngObj *)phTTS->CTTSEngObj)->m_event_interest & SPFEI(SPEI_VISEME))
		{
			CurEvent.eEventId             = SPEI_VISEME;
			CurEvent.elParamType          = SPET_LPARAM_IS_UNDEFINED;
			EnterCriticalSection( phTTS->pcsQueuedSampleCount );
			CurEvent.ullAudioStreamOffset = phTTS->dwQueuedSampleCount;
			LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
			if (second_sapi_phone)
			{
				CurEvent.wParam               = (WPARAM)(first_duration<<16) & SapiToVisemeTable[second_sapi_phone];
			}
			else
			{
				CurEvent.wParam               = (WPARAM)(first_duration<<16) & SapiToVisemeTable[ArpaToSapiTable[NextPhone]];
			}
			CurEvent.lParam               = (LPARAM)SapiToVisemeTable[first_sapi_phone];
			hr = ((CTTSEngObj *)phTTS->CTTSEngObj)->m_pOutputSite->AddEvents( &CurEvent, 1 );
			if (hr!=S_OK)
			{
				hr=2;
			}
			if (second_sapi_phone)
			{
				CurEvent.eEventId             = SPEI_VISEME;
				CurEvent.elParamType          = SPET_LPARAM_IS_UNDEFINED;
				EnterCriticalSection( phTTS->pcsQueuedSampleCount );
				CurEvent.ullAudioStreamOffset = phTTS->dwQueuedSampleCount + second_duration;
				LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
				CurEvent.wParam               = (WPARAM)(second_duration<<16) & SapiToVisemeTable[ArpaToSapiTable[NextPhone]];
				CurEvent.lParam               = (LPARAM)SapiToVisemeTable[second_sapi_phone];
				hr = ((CTTSEngObj *)phTTS->CTTSEngObj)->m_pOutputSite->AddEvents( &CurEvent, 1 );
				if (hr!=S_OK)
				{
					hr=2;
				}
			}
		}
	}
}


extern "C" int GetSapiRealtimeRate(LPTTS_HANDLE_T phTTS)
{
	return ((CTTSEngObj *)phTTS->CTTSEngObj)->CurrentRealtimeRateDelta;
}



/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: InitializeAudioParams                                   */
/*  Author: Murthy Parakala                                           */
/*  Date: December 8, 1995                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function initializes the audio params structure            */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams       A pointer to AUDIO_PARAMS_T structure        */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a status code of type MMRESULT.           */
/*    This value is zero if audio initialization was successful.      */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*                      -1   On error                                           */
/**********************************************************************/
/**********************************************************************/

static int InitializeAudioParams(LPAUDIO_PARAMS_T pAudioParams)
{
	LPQUEUE_T pAudioQueue = NULL;

	/********************************************************************/
	/*  Initialize some Audio parameter handles and flags.              */
	/********************************************************************/
	pAudioParams->bPaused = FALSE;
	pAudioParams->bTimerExit = FALSE;

	/********************************************************************/
	/*  Initialize the wave out device state flags.                     */
	/********************************************************************/

	pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_INACTIVE;
	pAudioParams->dwAudioPlayState = AUDIO_STATE_PLAY;

	/********************************************************************/
	/*  Set both audio position counts to zero.                         */
	/********************************************************************/

	pAudioParams->dwPositionBase = 0;
	pAudioParams->dwSamplesPlayed = 0;

	/********************************************************************/
	/*  Initialize several handle objects to NULL.                      */
	/********************************************************************/

	pAudioParams->pcsAudioDeviceState = NULL;
	pAudioParams->hQueueNotFull = NULL;
	pAudioParams->pcsQueueCount = NULL;
	pAudioParams->pcsQueueAudioBusy = NULL;
	pAudioParams->pAudioQueue = NULL;
	pAudioParams->hAudioDeviceInactive = NULL;
	pAudioParams->hAudioNotPaused = NULL;
	pAudioParams->hTimerThread = NULL;
	pAudioParams->hevTimerThreadActive = NULL;

	/********************************************************************/
	/*  Create the "Audio Device State" critical section object.        */
	/********************************************************************/

	pAudioParams->pcsAudioDeviceState =
		(LPCRITICAL_SECTION)malloc( sizeof( CRITICAL_SECTION ));

	if ( pAudioParams->pcsAudioDeviceState == NULL )
	{
 		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	InitializeCriticalSection( pAudioParams->pcsAudioDeviceState );

    /********************************************************************/
    /*  Create an "Timer Thread Active" event. The initial state is     */
    /*  signalled.                                                      */
    /********************************************************************/

    pAudioParams->hevTimerThreadActive = OP_CreateEvent( TRUE, TRUE );

    if ( pAudioParams->hevTimerThreadActive == NULL )
    {
      DestroyAudioObjects( pAudioParams );
      return MMSYSERR_ERROR;
    }

	/********************************************************************/
	/*  Create a "Queue Not Full" event. The initial state is signaled. */
	/********************************************************************/

	pAudioParams->hQueueNotFull = CreateEvent( NULL, TRUE, TRUE, NULL );

	if ( pAudioParams->hQueueNotFull == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}


	/********************************************************************/
	/*  Create an "Audio Device Inactive" event. The initial state is   */
	/*  signaled.                                                       */
	/********************************************************************/

	pAudioParams->hAudioDeviceInactive =
		CreateEvent( NULL, TRUE, TRUE, NULL );

	if ( pAudioParams->hAudioDeviceInactive == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	/********************************************************************/
	/*  Create an "Audio Not Paused" event. The initial state is        */
	/*  signaled.                                                       */
	/********************************************************************/

	pAudioParams->hAudioNotPaused =
		CreateEvent( NULL, TRUE, TRUE, NULL );

	if ( pAudioParams->hAudioNotPaused == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}
	
	/********************************************************************/
	/*  Create the "Queue Count" critical section object.               */
	/********************************************************************/

	pAudioParams->pcsQueueCount =
	(LPCRITICAL_SECTION)malloc( sizeof( CRITICAL_SECTION ));

	if ( pAudioParams->pcsQueueCount == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	InitializeCriticalSection( pAudioParams->pcsQueueCount );

	/********************************************************************/
	/*  Create the "Queue Audio Busy" critical section object.          */
	/********************************************************************/

	pAudioParams->pcsQueueAudioBusy =
	(LPCRITICAL_SECTION)malloc( sizeof( CRITICAL_SECTION ));

	if ( pAudioParams->pcsQueueAudioBusy == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	InitializeCriticalSection( pAudioParams->pcsQueueAudioBusy );


	/********************************************************************/
	/*  Allocate Memory for the Audio Queue Structure.                  */
	/********************************************************************/

	pAudioParams->pAudioQueue = (LPQUEUE_T)malloc(sizeof(QUEUE_T));

	if ( pAudioParams->pAudioQueue == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	pAudioQueue = pAudioParams->pAudioQueue;

	/********************************************************************/
	/*  Initialize all of the audio queue objects to NULL.              */
	/********************************************************************/

	/********************************************************************/
	/*  Allocate Memory for the audio buffer.                           */
	/********************************************************************/

	pAudioQueue->pQueueStart = (LPAUDIO_T)
	malloc(( AUDIO_BUFFER_SIZE) * sizeof(AUDIO_T));

	if ( pAudioQueue->pQueueStart == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	/********************************************************************/
	/*  Initialize the audio queue buffer start and length.             */
	/********************************************************************/
	pAudioQueue->iQueueLength = AUDIO_BUFFER_SIZE;

	/********************************************************************/
	/*  Initialize the audio queue and the completion count.            */
	/********************************************************************/

 	ResetAudioQueue( pAudioParams );

	return MMSYSERR_NOERROR;
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: InitializeDECtalkAudio                                  */
/*  Author: Murthy Parakala                                           */
/*  Date: December 8, 1995                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function initializes the audio processing done within      */
/*    DECtalk system.(OLE version of DECtalk calls this function)     */
/*    TextToSpeechStartup API calls this routine.                                                                */
/*  Input:                                                            */
/*                                                                    */
/*                                                                    */
/*    hWnd                A handle to speech engine mode window       */
/*                                                                    */
/*    ppAudioParams       A pointer to a pointer to AUDIO_PARAMS_T    */
/*                        structure                                   */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a status code of type MMRESULT.           */
/*    This value is zero if audio initialization was successful.      */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_NOMEM         Memory allocation error                  */
/*    MMSYSERR_ERROR         General failure                          */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

extern "C" MMRESULT InitializeDECtalkAudio( HWND hWndMode,
								 LPAUDIO_PARAMS_T *ppAudioParams)
{
	LPAUDIO_PARAMS_T pAudioParams = NULL;
	HANDLE hTimerThread = NULL;
	DWORD dwTimerThreadID;

	/*MVP : The below typedef is used in _beginthreadex function call */
	typedef unsigned int ( __stdcall * start_address )(void *);

  /*******************************************************/
  /*  Allocate memory for the Audio parameter structure. */
  /*******************************************************/

	*ppAudioParams = (LPAUDIO_PARAMS_T)malloc(sizeof(AUDIO_PARAMS_T));

	if ( *ppAudioParams == NULL )
	{
	  return( MMSYSERR_NOMEM );
	}

	pAudioParams = *ppAudioParams;

	pAudioParams->hModeWnd = hWndMode;
	
	if(InitializeAudioParams(*ppAudioParams) == -1)
		return(MMSYSERR_NOMEM); 
	//MVP:06/06/96 Timer thread is added   
 	pAudioParams->hTimerThread = (void *)_beginthreadex( NULL,
 							   0,
 							   (start_address)SapiAudioThreadMain,
							   (LPDWORD)pAudioParams,
							   0,
 							   (unsigned int *) &dwTimerThreadID );

	if ( pAudioParams->hTimerThread == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return(MMSYSERR_NOMEM);
	}

	return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: DestroyAudioObjects                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function de-allocates all audio objects in the audio       */
/*    handle                                                          */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    LPAUDIO_PARAMS_T    A pointer to the Audio params structure.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

extern "C" void DestroyAudioObjects(LPAUDIO_PARAMS_T pAudioParams)
{
	LPQUEUE_T pAudioQueue = NULL;
    THREAD_STATUS_T ThreadStatus;

	/********************************************************************/
	/*  Return if NULL handle.                                          */
	/********************************************************************/

	if (!pAudioParams)
		return;

    /******************************************************************/
    /*  Cause the timer thread to exit.                               */
    /******************************************************************/

    if ( pAudioParams->hTimerThread != NULL )
    {
       pAudioParams->bTimerExit = TRUE;

       if ( pAudioParams->hevTimerThreadActive != NULL )
       {
         OP_SetEvent( pAudioParams->hevTimerThreadActive );
       }

       OP_WaitForThreadTermination( pAudioParams->hTimerThread,
                                   &ThreadStatus );
    }

	SetEvent( pAudioParams->hAudioDeviceInactive );
	SetEvent( pAudioParams->hAudioNotPaused );

	/******************************************************************/
	/*  Free the Audio Queue memory.                                  */
	/******************************************************************/

	pAudioQueue = pAudioParams->pAudioQueue;

	if ( pAudioQueue != NULL )
	{
	  /****************************************************************/
	  /*  Free Memory for the Audio Queue sample buffer.              */
	  /****************************************************************/

	  if ( pAudioQueue->pQueueStart != NULL )
		free( pAudioQueue->pQueueStart );

	  /****************************************************************/
	  /*  Free Memory for the Audio Queue Structure.                  */
	  /****************************************************************/

	  free( pAudioQueue );
	}

	/******************************************************************/
	/*  Free the "Queue Audio Busy" critical section object.          */
	/******************************************************************/

	if ( pAudioParams->pcsQueueAudioBusy != NULL )
	{
	  DeleteCriticalSection( pAudioParams->pcsQueueAudioBusy );
	  free( pAudioParams->pcsQueueAudioBusy );
	}

	/******************************************************************/
	/*  Free the "Queue Count" critical section object.               */
	/******************************************************************/

	if ( pAudioParams->pcsQueueCount != NULL )
	{
	  DeleteCriticalSection( pAudioParams->pcsQueueCount );
	  free( pAudioParams->pcsQueueCount );
	}

	 /******************************************************************/
	/*  Free the "Audio Device State" critical section object.        */
	/******************************************************************/

	if ( pAudioParams->pcsAudioDeviceState != NULL )
	{
	  DeleteCriticalSection( pAudioParams->pcsAudioDeviceState );
	  free( pAudioParams->pcsAudioDeviceState );
	}

   /******************************************************************/
	/*  Free the handle to the "Queue Not Full" event.                */
	/******************************************************************/

	if ( pAudioParams->hQueueNotFull != NULL )
	  CloseHandle( pAudioParams->hQueueNotFull );

    /******************************************************************/
    /*  Destroy the "Timer Thread Active" event.                      */
    /******************************************************************/

    OP_DestroyEvent( pAudioParams->hevTimerThreadActive );

	/******************************************************************/
	/*  Free the handle to the "Audio Not Paused" event.              */
	/******************************************************************/

	if ( pAudioParams->hAudioNotPaused != NULL )
	  CloseHandle( pAudioParams->hAudioNotPaused );

	/******************************************************************/
	/*  Free the handle to the "Audio Device Inactive" event.         */
	/******************************************************************/

	if ( pAudioParams->hAudioDeviceInactive != NULL )
	  CloseHandle( pAudioParams->hAudioDeviceInactive );

	/******************************************************************/
	/*  Free the audio handle.                                        */
	/******************************************************************/
	free( pAudioParams );

  return;
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ResetAudioQueue                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function initializes all of the audio queue           */
/*    parameters to the queue empty state.                            */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams  A pointer to a structure of type AUDIO_PARAMS_T.  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void ResetAudioQueue( LPAUDIO_PARAMS_T pAudioParams )
{
  LPQUEUE_T pAudioQueue;

  // tek 15aug96 should this stuff be in a critical sect?
  EnterCriticalSection( pAudioParams->pcsQueueAudioBusy );

  pAudioQueue = pAudioParams->pAudioQueue;
  pAudioQueue->pQueueInput = pAudioQueue->pQueueStart;
  pAudioQueue->pQueueOutput = pAudioQueue->pQueueStart;
  pAudioQueue->iInputPosition = 0;
  pAudioQueue->iOutputPosition = 0;
  pAudioQueue->iQueueCount = 0;

  SetEvent( pAudioParams->hQueueNotFull );
  LeaveCriticalSection( pAudioParams->pcsQueueAudioBusy );


  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ResetAudio                                              */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function stops any audio which is playing and resets  */
/*    the audio queue. A reset may be delayed if another thread       */
/*    has called the QueueAudio() function.                           */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    A handle to the Audio window.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
//MVP: was ResetAudio : After new audio it is 
MMRESULT PA_Reset( LPAUDIO_PARAMS_T pAudioParams)
{
	MMRESULT mmStatus =0;


	if ( pAudioParams == NULL )
		return( MMSYSERR_INVALPARAM );

	/********************************************************************/
	/*  Block if another thread is queueing audio.                      */
	/********************************************************************/
	EnterCriticalSection( pAudioParams->pcsQueueAudioBusy );

	/********************************************************************/
	/*  Reset the audio queue to the empty state.                       */
	/********************************************************************/
				  
	ResetAudioQueue( pAudioParams );
	
	/********************************************************************/
	/*  Set both audio position counts to zero.                         */
	/********************************************************************/

	pAudioParams->dwPositionBase = 0;
	pAudioParams->dwSamplesPlayed = 0;

	/********************************************************************/
	/*  Release the audio queue.                                        */
	/********************************************************************/

	LeaveCriticalSection( pAudioParams->pcsQueueAudioBusy );

	return( mmStatus );
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: QueueAudio                                              */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function queues a buffer of samples to the wave       */
/*    output device. This function will block until there is enough   */
/*    space in the audio queue. The wave output device will open      */
/*    automatically. This will happen one of two ways. Either enough  */
/*    samples in the queue (MINIMUM_SAMPLES_TO_START) will cause this */
/*    function to send the ID_Open_Wave_Output_Device message, or if  */
/*    the queue sample count remains non-zero while the wave output   */
/*    device is closed, then after a sufficent amount of time, the    */
/*    timer thread will send the ID_Open_Wave_Output_Device message.  */
/*    The wave output device will also be closed automatically.       */
/*                                                                    */
/*         Each queued audio block MUST have a length that is a       */
/*    multiple of the current block alignment. If it does not, then   */
/*    the audio samples will still be added to the audio queue, but   */
/*    the audio driver may hang.                                      */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd        The handle to the Audio window.                     */
/*                                                                    */
/*    pBuffer     A pointer (of type unsigned char) to a buffer that  */
/*                contains byte samples.                              */
/*                                                                    */
/*    dwLength    A DWORD which is equal to the number of bytes to be */
/*                queued which are in the buffer pointed to by        */
/*                "pBuffer".                                          */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    The queued audio size was larger then    */
/*                           MAXIMUM_QUEUED_SIZE or the audio window  */
/*                           is invalid.                              */
/*                                                                    */
/*                                                                    */
/*      ASYNCHRONOUS ERROR MESSAGES.                                  */
/*                                                                    */
/*         After QueueAudio() function is called, the audio thread    */
/*    may send error messages to the window procedure specified by    */
/*    the window handle passed in the OpenAudio() function. The user  */
/*    may wish to handle these messages. The message number will be   */
/*    pAudioParams->uiAudioErrorMessage. One of the error codes       */
/*    listed below will be contained in the wParam field of the       */
/*    message. The lParam field of the message will contain a value   */
/*    of type MMRESULT. An application may use the                    */
/*    waveOutGetErrorText() function to obtain a text string          */
/*    corresponding to the MMRESULT (lParam) error code.              */
/*                                                                    */
/*        wParam error code                                           */
/*                                                                    */
/*      ERROR_IN_AUDIO_WRITE                1                         */
/*      ERROR_OPENING_WAVE_OUTPUT_DEVICE    2                         */
/*      ERROR_GETTING_DEVICE_CAPABILITIES   3                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
// tek 16mar98 bats 608/609/620
// this routine performs the conversion to 8-bit as needed; doing this 
// conversion here allows us to keep a consistent view of audio position
// so that all of the indexing/syncing/etc will work correctly without
// having to adjust for somple size everywhere.

extern "C" int QueueSapiAudioData(LPTTS_HANDLE_T phTTS,
		  			short * pBuffer,
					unsigned int uiSamplesToOutput)
{
	MMRESULT mmres=0;
	switch(phTTS->dwFormat)
	{
	case WAVE_FORMAT_08M08:
	case WAVE_FORMAT_1M08:
		mmres=SAPI_PA_Queue(phTTS->pAudioHandle,(unsigned char * )pBuffer,uiSamplesToOutput<<1); // fixed later
		EnterCriticalSection( phTTS->pcsQueuedSampleCount );
		phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput; 
		LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
		break;
	case WAVE_FORMAT_1M16:
		mmres=SAPI_PA_Queue(phTTS->pAudioHandle,(unsigned char *)pBuffer,uiSamplesToOutput<<1);
		EnterCriticalSection( phTTS->pcsQueuedSampleCount );
		phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput; 
		LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
		break;
	}
	return(mmres);

}

					
extern "C" MMRESULT SAPI_PA_Queue( LPAUDIO_PARAMS_T pAudioParams,
					 LPAUDIO_T pBuffer,
					 DWORD dwLength )
{
	DWORD dwWrap;
	DWORD dwRemaining;
	LPQUEUE_T pAudioQueue;
	BOOL	bRequestSend=FALSE;		//tek 16aug96 take SendMessage()
									//            out of critical sect
	BOOL	bTimerRequest=FALSE;	//            get this out of C.S. too.


	/******************************************************************/
	/*  Return an error if NULL handle.                               */
	/******************************************************************/

	if ( !pAudioParams)
		return( MMSYSERR_INVALPARAM );


	// check here for any necessary conversions..
	if (pAudioParams->bAudioIsEightBit)
	{
		unsigned int dwI;
		unsigned long ulTemp;
		unsigned char *ucDestBuf = (unsigned char *)pBuffer;
		short *sSrcBuf = (SHORT *)pBuffer;
		// readjust teh length to be "samples"..
		dwLength = dwLength>>1;
		// convert in place.. take the invariant compare out of the loop..
		if (pAudioParams->bAudioIsMulaw)
		{
			for (dwI=0;dwI<dwLength;dwI++)
			{
				ucDestBuf[dwI] = LinearToMuLaw(sSrcBuf[dwI]);
			}
		}
		else
		{
			// linear..
			for (dwI=0;dwI<dwLength;dwI++)
			{
				ulTemp = sSrcBuf[dwI]+32767;
				ucDestBuf[dwI] = (unsigned char)(ulTemp>>8);
			}
		}
	}


	/********************************************************************/
	/*  If too many samples then exit with error status.                */
	/********************************************************************/

	if ( dwLength > MAXIMUM_QUEUED_SIZE )
		return( MMSYSERR_INVALPARAM );

	pAudioQueue = pAudioParams->pAudioQueue;

	/********************************************************************/
	/*  Block if another thread is queueing audio or performing a       */
	/*  reset.                                                          */
	/********************************************************************/

	EnterCriticalSection( pAudioParams->pcsQueueAudioBusy );


	/********************************************************************/
	/*  Wait for space in the queue before adding the new audio buffer. */
	/*  Block if another thread is manipulating the queue count.        */
	/********************************************************************/


	EnterCriticalSection( pAudioParams->pcsQueueCount );


	while ( pAudioQueue->iQueueCount + (int)dwLength > pAudioQueue->iQueueLength )
	{

		LeaveCriticalSection( pAudioParams->pcsQueueCount );
		LeaveCriticalSection( pAudioParams->pcsQueueAudioBusy );

		ResetEvent( pAudioParams->hQueueNotFull );


		WaitForSingleObject( pAudioParams->hQueueNotFull, INFINITE );

		EnterCriticalSection( pAudioParams->pcsQueueAudioBusy );
		EnterCriticalSection( pAudioParams->pcsQueueCount );

	}

//	LeaveCriticalSection( pAudioParams->pcsQueueCount );

	/********************************************************************/
	/*  There is enough space in the audio queue. Test to see if the    */
	/*  data will wrap around the circular queue.                       */
	/********************************************************************/

	if ( pAudioQueue->iInputPosition + (int)dwLength > pAudioQueue->iQueueLength )
	{
		/******************************************************************/
		/*  The data will wrap around the circular queue.                 */
		/******************************************************************/

		dwRemaining = pAudioQueue->iQueueLength - pAudioQueue->iInputPosition;

		/******************************************************************/
		/*  for ( i = 0; i < dwRemaining; i++ )                           */
		/*    *pAudioQueue->pQueueInput++ = *pBuffer++;                   */
		/******************************************************************/

		memcpy( pAudioQueue->pQueueInput, pBuffer, dwRemaining );

		pBuffer += dwRemaining;

		/******************************************************************/
		/*  Reset to the start of the audio queue.                        */
		/******************************************************************/

		pAudioQueue->pQueueInput = pAudioQueue->pQueueStart;

		/******************************************************************/
		/*  for ( i = dwRemaining; i < (int)dwLength; i++ )
		/*    *pAudioQueue->pQueueInput++ = *pBuffer++;
		/******************************************************************/

		dwWrap = dwLength - dwRemaining;

		memcpy( pAudioQueue->pQueueInput, pBuffer, dwWrap );

		pAudioQueue->pQueueInput += dwWrap;
		pAudioQueue->iInputPosition = (int)dwWrap;
	}
	else
	{
		/******************************************************************/
		/*  The data will NOT wrap around the circular queue.             */
		/******************************************************************/
		/******************************************************************/
		/*  for ( i = 0; i < (int)dwLength; i++ )                         */
		/*    *pAudioQueue->pQueueInput++ = *pBuffer++;                   */
		/******************************************************************/

		memcpy( pAudioQueue->pQueueInput, pBuffer, dwLength );

		pAudioQueue->pQueueInput += dwLength;
		pAudioQueue->iInputPosition += (int)dwLength;
	}

	/********************************************************************/
	/*  Atomically update the audio queue count.                        */
	/********************************************************************/
//	EnterCriticalSection( pAudioParams->pcsQueueCount );
	pAudioQueue->iQueueCount += (int)dwLength;

   /********************************************************************/
   /*  Atomically update the queued byte count.                        */
   /*  If audio is not playing then activate the timer thread.         */
   /********************************************************************/
    if ( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
    {
		bTimerRequest=TRUE;
    }

	/********************************************************************/
	/*  If the audio is not playing then start it playing if we         */
	/*  have enough available.                                          */
	/********************************************************************/

	if (( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
	&& ( pAudioQueue->iQueueCount >= MINIMUM_STARTUP_SAMPLES )
	&& ( ! pAudioParams->bPaused ))
	{
		bRequestSend = TRUE;		
	}

	// tek 08aug97 sheck to see if we have to cover for a FreeSpace that
	// found no samples to send.. we can't wait for MINIMUM_STARTUP_SAMPLES
	// because we're in dire straits here..
	if (   ( pAudioParams->bAudioRanDry )
	    && ( pAudioQueue->iQueueCount > (MINIMUM_STARTUP_SAMPLES/2) )
	    && ( ! pAudioParams->bPaused )
	   )
	{
#ifdef AUD_DEBUG // tek 08aug97
		{
			char szTemp[256]="";
			sprintf(szTemp,"PA_Queue, detected RanDry; qcount=%d at %lu\n",
				pAudioQueue->iQueueCount,
				timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //AUD_DEBUG

		bRequestSend = TRUE;		
	}


	/********************************************************************/
	/*  Release the QueueAudio() function for use in another thread.    */
	/********************************************************************/
	LeaveCriticalSection( pAudioParams->pcsQueueCount );
	LeaveCriticalSection( pAudioParams->pcsQueueAudioBusy );

	// tek 16aug96 check for timer request.. 
	if (bTimerRequest)
	{
      OP_SetEvent( pAudioParams->hevTimerThreadActive );
	}

	// tek 16aug96 see if we need to kick off..
	// tek 07aug97 this need to NOT happen if we've started reset..
	// tek 08aug97 also shouldn't happen if our last request hasn't been
	// processed yet.
	if (bRequestSend 
		&& !pAudioParams->bSendSamplesRequested
		&& !pAudioParams->bInAudioReset)
	{
#ifdef AUD_DEBUG // tek 08aug97
		{
			char szTemp[256]="";
			sprintf(szTemp,"PA_Queue, kicking audio at %lu\n",
				timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //AUD_DEBUG

		// tek 08aug97 set the flag that tells us we have a send 
		// request pending, so that we don't send a barrage of them
		// while waiting for the first message to be delivered..
		pAudioParams->bSendSamplesRequested = TRUE;
		// tek 16aug96 post message? 
		// tek 08aug97 if we've run dry, we need to send these samples NOW..
		// so use SendMessage in that case.
#ifdef FIXME
		if (pAudioParams->bAudioRanDry)
		{
			SendMessage( pAudioParams->hModeWnd,
				 ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,
				 0,
				 0L );
		}
		else
		{
			PostMessage( pAudioParams->hModeWnd,
				 ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,
				 0,
				 0L );
		}
#endif // * FIXME *
	}

	return( MMSYSERR_NOERROR );
}



/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Thread Main: TimerThreadMain                                      */
/*  Author: Bill Hallahan                                             */
/*  Date: May 18, 1993                                                */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This thread task is started in the OpenAudio() function.   */
/*    If audio samples remain in the queue for too long then a        */
/*    message will be sent to flush the audio queue.                  */
/*                                                                    */
/*                                                                    */
/*  Input: (Thread start parameter)                                   */
/*                                                                    */
/*    pAudioParams   A pointer to a structure of type AUDIO_PARAMS_T. */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  TIMER_SLEEP_TIME_IN_MSEC          10
#define  QUEUE_FLOW_CHECK_TIME_IN_MSEC    100
#define	UNCLAIM_CHECK_SLEEP_TIME		(100) // tek 03sep97 

static DWORD __stdcall SapiAudioThreadMain( LPAUDIO_PARAMS_T pAudioParams )
{
  LPQUEUE_T pAudioQueue = pAudioParams->pAudioQueue;
  unsigned int uiLastQueueCount=0;
  unsigned int uiCurrentQueueCount=0;
  DWORD	dwLastTotalGet=0;	// tek 05mar98
  DWORD dwCurrentTotalGet=0;
  unsigned int uiStartupTimeoutTime;


  /******************************************************************/
  /******************************************************************/
  /*  If audio is NOT playing and the system is NOT paused and      */
  /*  there are samples in the queue then test to see if it will    */
  /*  be necessary to start playing audio.                          */
  /******************************************************************/

  /******************************************************************/
  /********************************************************************/
  /*  Initialize the timer count to 0. This is used to count the      */
  /*  number of consecutive times that audio is in the queue and the  */
  /*  audio device is not active.                                     */
  /********************************************************************/

//  unsigned int uiElapsedTime = 0;

  /********************************************************************/
  /*  Loop forever until thread shutdown time.                        */
  /********************************************************************/
  while( ! pAudioParams->bTimerExit )
  {

  /* list of things that this thread hs to do */
  // wait until enough audio is in the queue to start sending audio to sapi 
  //	500 ms worth (samplerate /2)  22050/2 or 8000/2  (11025 or 4000)
  // send the audio to sapi in manageable chunks
  //	send audio in 1/8 second chunks 22050/8 (2756) or (1000)
  // pause sending when the a pause is asked for 
  // send all audio when asked to
  // resume when asked
  // exit when told

	  /******************************************************************/
	/*  Calculate how long to sleep.                                  */
	/******************************************************************/
	  //(double)pAudioParams->pWaveFormat->nSamplesPerSec 
	uiStartupTimeoutTime = (unsigned int)( 500.0 *
	  (double)(MINIMUM_STARTUP_SAMPLES) / 11025 );

    /******************************************************************/
    /*  Limit the total startup check wait time to 1/4 second.        */
    /******************************************************************/

	if ( uiStartupTimeoutTime > 250)
	{
	  uiStartupTimeoutTime = 250;
	}
    
    //tek 05nov96 shouldn't we sit and wait until we are active?
	// if there are no samples waiting, then we should be able to just sleep.
	// unfortunately, nobody ever wrote down what this was supposed to do..
	if (pAudioQueue->iQueueCount == 0)
		OP_Sleep(2*TIMER_SLEEP_TIME_IN_MSEC);
	 else
		OP_WaitForEvent(pAudioParams->hevTimerThreadActive,
				QUEUE_FLOW_CHECK_TIME_IN_MSEC);


	// if there are at least startup samples in the queue, and we are told to startup
	 // set the state to ACTIVE 
	if (pAudioQueue->iQueueCount > MINIMUM_STARTUP_SAMPLES )
	{
		EnterCriticalSection(pAudioParams->pcsAudioDeviceState);
		pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_ACTIVE;
		LeaveCriticalSection(pAudioParams->pcsAudioDeviceState);
	}


         /*
		OP_Sleep(uiStartupTimeoutTime);
	 else
		OP_WaitForEvent(pAudioParams->hevTimerThreadActive,uiStartupTimeoutTime); 
          */
	// end tek 05nov96
	
	// tek 03sep97
	// in some cases (like short utterances) we can run out of samples
	// to send before we process the message that set m_bTextDataDone;
	// the audio dest seems to get confused and forgets to send us another
	// FreeSpace notification after we find out we have no more to send, 
	// so we have to watch here to make sure that we do the unclaim.

	 if (   (pAudioQueue->iQueueCount == 0)
		&& (pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE)
	   )
	{
		// we're done; this will do all the relevant checking and 
		// unclaim.	  Sleep first, though, to make sure things are settled
		// down.
			OP_Sleep(UNCLAIM_CHECK_SLEEP_TIME);
		// and recheck that we should stop..

			if (   (pAudioQueue->iQueueCount == 0)
			&& (pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE)
			)

		{
// *FIX ME*			PostMessage( pAudioParams->hModeWnd,
// *FIX ME*				 ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,
// *FIX ME*				 0,
// *FIX ME*				 0L );

		}
	}



    while (( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
      && ( pAudioQueue->iQueueCount > 0 ))
    {
      /****************************************************************/
      /*  Wait for "uiStartupTimeoutTime" milliseconds.               */
      /****************************************************************/

 //     uiElapsedTime = 0;
 //     uiFlowCheckTime = 0;
        uiLastQueueCount = pAudioQueue->iQueueCount;

      //while (( uiElapsedTime < uiStartupTimeoutTime )
      //  && ( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE ))

      //if( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
      //{
        //OP_Sleep( TIMER_SLEEP_TIME_IN_MSEC );
        OP_Sleep( uiStartupTimeoutTime );

        //uiElapsedTime += TIMER_SLEEP_TIME_IN_MSEC;
        //uiFlowCheckTime += TIMER_SLEEP_TIME_IN_MSEC;

        /**************************************************************/
        /*  If the queue input flow rate to the PA_Queue() function   */
        /*  has been slower than real-time over the entire            */
        /*  QUEUE_FLOW_CHECK_TIME_IN_MSEC interval then start the     */
        /*  open now.                                                 */
        /**************************************************************/

        //if ( uiFlowCheckTime > QUEUE_FLOW_CHECK_TIME_IN_MSEC )
        //{
        uiCurrentQueueCount = (unsigned int)pAudioQueue->iQueueCount;

        if ( uiCurrentQueueCount == uiLastQueueCount )
        {
             /****************************************************************/
             /*  If audio is still NOT playing and there are samples in the  */
             /*  audio queue then start playing audio. It does not matter    */
             /*  that all of the tests this section of code are not          */
             /*  protected by mutex's. This is because an unnecessary        */
             /*  ID_Open_Wave_Output_Device messages will be discarded in    */
             /*  the "play audio" thread.                                    */
             /****************************************************************/

             if (( pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_ACTIVE )
                && ( pAudioQueue->iQueueCount > 0 ))
             {

// *FIX ME*		         SendMessage( pAudioParams->hModeWnd,
// *FIX ME*				      ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,
// *FIX ME*				      0,
// *FIX ME*				      0L );
             }
                break;
        }

          uiLastQueueCount = uiCurrentQueueCount;
        //  uiFlowCheckTime = 0;
        //}
      //}

      /****************************************************************/
      /*  If the audio device starts playing then exit this loop.     */
      /****************************************************************/

      if ( pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE )
      {
        break;
      }


      /****************************************************************/
      /*  Test for thread shutdown. Shutdown is caused by the         */
      /*  PA_DestroyPlayHandle() function.                            */
      /****************************************************************/

      if ( pAudioParams->bTimerExit )
      {
        break;
      }
      
#if 0
	  if ( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
      {
        OP_ResetEvent( pAudioParams->hevTimerThreadActive );
      }
      else
      {
        if ( pAudioQueue->iQueueCount == 0 )
        {
          OP_ResetEvent( pAudioParams->hevTimerThreadActive );
        }
      }

      /******************************************************************/
      /*  Wait for the thread to unblock.                               */
      /******************************************************************/
#endif

      //OP_WaitForEvent( pAudioParams->hevTimerThreadActive, OP_INFINITE );
      OP_WaitForEvent( pAudioParams->hAudioDeviceInactive, OP_INFINITE );

	  /******************************************************************/
      /*  Test for thread shutdown. Shutdown is caused by the           */
      /*  PA_DestroyPlayHandle() function.                              */
      /******************************************************************/

      if ( pAudioParams->bTimerExit )
      {
        break;
      }

    }

  }
  /********************************************************************/
  /*  Exit the thread.                                                */
  /********************************************************************/
  OP_ExitThread( 0 );

  OP_THREAD_RETURN;
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WaitForAudioToComplete                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: June 24, 1994                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function will block until all queued audio samples have    */
/*    been played.                                                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    A handle to the Audio window.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_WaitForPlayToComplete( LPAUDIO_PARAMS_T pAudioParams)
{
  int iQueueCount;
  BOOL bAudioPlaying;
  LPQUEUE_T pAudioQueue;

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pAudioParams == NULL )
	return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Loop and wait for all queued audio samples to complete.         */
  /********************************************************************/

  pAudioQueue = pAudioParams->pAudioQueue;
  bAudioPlaying = TRUE;

  while( bAudioPlaying )
  {
	/******************************************************************/
	/*  Wait on the hAudioDeviceInactive Event.                       */
	/******************************************************************/

	WaitForSingleObject( pAudioParams->hAudioDeviceInactive, INFINITE );

	/******************************************************************/
	/*  Check the Audio Queue Count. If there is any audio to be      */
	/*  played then go to sleep and contine to wait.                  */
	/******************************************************************/

	EnterCriticalSection( pAudioParams->pcsQueueCount );
	iQueueCount = pAudioQueue->iQueueCount;
	LeaveCriticalSection( pAudioParams->pcsQueueCount );

	if ( iQueueCount == 0 )
	{
	  bAudioPlaying = FALSE;
	}
	else
	{
	  Sleep( AUDIO_WAIT_SLEEP_TIME_IN_MSEC );
	}
  }
  return( MMSYSERR_NOERROR );
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ls_sapi_find_word                                       */
/*  Author: Nathan LeStage                                            */
/*  Date: July 25, 2000                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function Searches the registered user and application      */
/*    lexicons for the specified word. It also implements the pron    */
/*    command if the word specified is in the SAPI lexicon.           */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    LPTTS_HANDLE_T phtts       TTS Handle                           */
/*    unsigned char * comp_str   string to look for in lex            */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns either HIT or MISS which is used          */
/*    in the calling function, ls_dict_blook.                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
extern "C" 
int ls_sapi_find_word(LPTTS_HANDLE_T phTTS, unsigned char *comp_str, short pars_lookup)
{
#ifdef __osf__
	unsigned  int fc[2];
#else
	unsigned long fc[2];
#endif

	PKSD_T  pKsd_t;
	pKsd_t = phTTS->pKernelShareData;

	int i = 0, ii = 0;

	CComPtr<ISpContainerLexicon>	cpConLexicon;

	SPPARTOFSPEECH pos;
	SPWORDPRONUNCIATION *pwordpron;
	SPWORDPRONUNCIATIONLIST spwordpronlist; 
    memset(&spwordpronlist, 0, sizeof(spwordpronlist)); 

	WCHAR wideword[SP_MAX_WORD_LENGTH];

	MultiByteToWideChar(CP_ACP, 0, (const char *)comp_str, -1, wideword, SP_MAX_WORD_LENGTH);

	if(!SUCCEEDED(cpConLexicon.CoCreateInstance(CLSID_SpLexicon)) )
		return MISS;


	// GetPronunciations automatically looks in the USER lexicon first, then the APP lexicon (or so they say..)
	if( ( cpConLexicon->GetPronunciations(wideword, 0, (eLEXTYPE_USER | eLEXTYPE_APP), &spwordpronlist)) != S_OK)
	{
		CoTaskMemFree(spwordpronlist.pvBuffer);
		return MISS;
	}
	if(pars_lookup)
	{
		return HIT;
	}

	pwordpron = spwordpronlist.pFirstWordPronunciation;
	if(pwordpron->pNextWordPronunciation != NULL)	// See if homophone. If pronflag is set, but it's not a homophone,
	{												// whatever is in the lexicon is spoken.
		if(pKsd_t->pronflag == 0)
		{


			for(i=0;i<2;i++)		// Make the two form classes to pass to ls_homo_sapi_homo
			{
				switch(pwordpron->ePartOfSpeech)
				{
				case SPPS_Noun:
					fc[i] = FC_NOUN;
					break;
				case SPPS_Verb:
					fc[i] = FC_VERB;
					break;
				case SPPS_Modifier:
					fc[i] = FC_ADJ;
					break;
				case SPPS_Function:
					fc[i] = FC_FUNC;
					break;
				case SPPS_Interjection:
					fc[i] = FC_INTER;
					break;
				default:
					fc[i] = FC_NOUN;
					break;
				}
				pwordpron = pwordpron->pNextWordPronunciation;
			}

	

			switch( ls_homo_sapi_homo(phTTS, fc[0], fc[1]) )	
			{
			case FC_NOUN:		// Get the pos back
				pos = SPPS_Noun;
				break;
			case FC_VERB:
				pos = SPPS_Verb;
				break;
			case FC_ADJ:
				pos = SPPS_Modifier;
				break;
			case FC_FUNC:
				pos = SPPS_Function;
				break;
			case FC_INTER:
				pos = SPPS_Interjection;
				break;
			default:
				pos = SPPS_Noun;
				break;
			}
		}



		else		// If pronflag is set, just pronounce the correct POS
		{
			if(pKsd_t->pronflag & PRON_DIC_NOUN)
			{
				pKsd_t->pronflag &= (~PRON_DIC_NOUN);
				pos = SPPS_Noun;
			}
			if(pKsd_t->pronflag & PRON_DIC_VERB)
			{
				pKsd_t->pronflag &= (~PRON_DIC_VERB);
				pos = SPPS_Verb;
			}
			if(pKsd_t->pronflag & PRON_DIC_ADJECTIVE)
			{
				pKsd_t->pronflag &= (~PRON_DIC_ADJECTIVE);
				pos = SPPS_Modifier;
			}
			if(pKsd_t->pronflag & PRON_DIC_FUNCTION)
			{
				pKsd_t->pronflag &= (~PRON_DIC_FUNCTION);
				pos = SPPS_Function;
			}
			if(pKsd_t->pronflag & PRON_DIC_INTERJECTION)
			{
				pKsd_t->pronflag &= (~PRON_DIC_INTERJECTION);
				pos = SPPS_Interjection;
			}
		}

		for (pwordpron = spwordpronlist.pFirstWordPronunciation; pwordpron != NULL; pwordpron = pwordpron->pNextWordPronunciation)
		{
			if(pwordpron->ePartOfSpeech == pos || pwordpron->pNextWordPronunciation == NULL)
			{
				while(pwordpron->szPronunciation[ii] != NULL)
				{
					ls_util_send_phone(phTTS, SapiToArpaTable[(int)(pwordpron->szPronunciation[ii++]) ] );
				}
				CoTaskMemFree(spwordpronlist.pvBuffer);
				return HIT;
			}
		}
	}


	else   // If there's no homophone, speak the word and be done with it
	{
		while(pwordpron->szPronunciation[ii] != NULL)
		{
			ls_util_send_phone(phTTS, SapiToArpaTable[(int)(pwordpron->szPronunciation[ii++]) ] );
		}
		CoTaskMemFree(spwordpronlist.pvBuffer);
		return HIT;
	}

	CoTaskMemFree(spwordpronlist.pvBuffer);
	return MISS;	// Shouldn't ever get here
}
