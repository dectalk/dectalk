/*****************************************************************************
* TtsEngObj.cpp *
*---------------*
*   Description:
*       This module is the main implementation file for the CTTSEngObj class.
*-------------------------------------------------------------------------------
*  Creation Date: 03/24/99
*  Copyright (C) 1999 Microsoft Corporation
*  All Rights Reserved
*
*******************************************************************************/
/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                           
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved.   
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
 *********************************************************************** 
 *    File Name:	TtsEngObj.cpp
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:
 *       This module is the main implementation file for the CTTSEngObj class.
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	-------			---------------------------------------	
 *	001	MGS		07/14/2000		more work on sapi 5 
 *	002	MGS		07/20/2000		More Sapi 5 stuff 
 *	003	MGS		07/26/2000		More stuff
 *  004 NAL		07/26/2000		Added <partofsp> stuff, now removes all [: commands
 *								from the sentence list
 *	005	NAL		08/01/2000		dectalk commands used in XML - all preceeded with "dectalk"
 *								i.e. <dectalk dv gv 65>
 *  006 CAB		10/16/00		Changed copyright info
 *  007	MGS		02/28/2001		Changes for the volume attenuator
 *  008 CAB		03/01/2001		Updated copyright info
 */

//--- Additional includes
#include "stdafx.h"
#include "TtsEngObj.h"

//--- Local


extern char SapiToArpaTable[];

extern "C" int OutputSapiAudioData(LPTTS_HANDLE_T phTTS,
		  			short * pBuffer,
					unsigned int uiSamplesToOutput);

extern "C" void SendEventToSapi(void * phTTS,int uiMsg, void *Mark,LPARAM lParam);

extern "C" MMRESULT TextToSpeechSetVolume( LPTTS_HANDLE_T phTTS,int type, int volume);

extern "C" MMRESULT TextToSpeechGetVolume( LPTTS_HANDLE_T phTTS,int type, int *volume);

#include	"par_def.h"
extern "C" unsigned short parser_char_types[];

VOID TTSCallbackRoutine(LONG lParam1, LONG lParam2,DWORD dwInstanceParam, UINT uiMsg) 
{
    HRESULT hr = S_OK;
	CTTSEngObj *TTSEngObj=(CTTSEngObj *)dwInstanceParam;
	if (uiMsg==TTSEngObj->uiID_Index_Message)
	{
		if (lParam2==32000)
			TTSEngObj->m_got_index_32000=1;
	}
	if (uiMsg==TTSEngObj->uiID_Sentence_Message)
	{
		PMARK_DATA Sentence=(PMARK_DATA)lParam1;
                TTSEngObj->CurEvent.eEventId             = SPEI_SENTENCE_BOUNDARY;
                TTSEngObj->CurEvent.elParamType          = SPET_LPARAM_IS_UNDEFINED;
                TTSEngObj->CurEvent.ullAudioStreamOffset = Sentence->qTimeStamp;
                TTSEngObj->CurEvent.wParam               = (WPARAM)((Sentence->dwMarkValue & 0xff000000) >> 24);
                TTSEngObj->CurEvent.lParam               = (LPARAM)Sentence->dwMarkValue & 0x00ffffff;
                hr = TTSEngObj->m_pOutputSite->AddEvents( &TTSEngObj->CurEvent, 1 );
	}
	if (uiMsg==TTSEngObj->uiID_Wordpos_Message)
	{
		PMARK_DATA Wordpos=(PMARK_DATA)lParam1;
                TTSEngObj->CurEvent.eEventId             = SPEI_WORD_BOUNDARY;
                TTSEngObj->CurEvent.elParamType          = SPET_LPARAM_IS_UNDEFINED;
                TTSEngObj->CurEvent.ullAudioStreamOffset = Wordpos->qTimeStamp;
                TTSEngObj->CurEvent.wParam               = (WPARAM)((Wordpos->dwMarkValue & 0xff000000) >> 24);
                TTSEngObj->CurEvent.lParam               = (LPARAM)Wordpos->dwMarkValue & 0x00ffffff;
                hr = TTSEngObj->m_pOutputSite->AddEvents( &TTSEngObj->CurEvent, 1 );
	}
	if (uiMsg==TTSEngObj->uiID_Error_Message)
	{
		if (lParam1==ERROR_IN_AUDIO_WRITE)
		{
			TTSEngObj->m_abort_from_audio=1;
		}
	}
	if (uiMsg==TTSEngObj->uiID_Bookmark_Message)
	{
		PMARK_DATA Wordpos=(PMARK_DATA)lParam1;
		SPVTEXTFRAG *pTextFrag=(SPVTEXTFRAG *)Wordpos->dwMarkValue;
		unsigned int i;
		LPWSTR temp_string;
		
		temp_string=(LPWSTR)CoTaskMemAlloc((pTextFrag->ulTextLen +1) * sizeof(WCHAR));
		if (temp_string!=NULL)
		{
			for (i=0;i<pTextFrag->ulTextLen;i++)
			{
				temp_string[i]=pTextFrag->pTextStart[i];
			}
			temp_string[i]='\0';
			
			TTSEngObj->CurEvent.eEventId             = SPEI_TTS_BOOKMARK;
			TTSEngObj->CurEvent.elParamType          = SPET_LPARAM_IS_STRING;
			TTSEngObj->CurEvent.ullAudioStreamOffset = Wordpos->qTimeStamp+2;
			TTSEngObj->CurEvent.wParam               = (WPARAM)_wtol(temp_string);
			TTSEngObj->CurEvent.lParam               = (LPARAM)temp_string;
			hr = TTSEngObj->m_pOutputSite->AddEvents( &TTSEngObj->CurEvent, 1 );
			TTSEngObj->CurEvent.lParam=NULL;
			TTSEngObj->CurEvent.elParamType=SPET_LPARAM_IS_UNDEFINED;
			CoTaskMemFree(temp_string);
		}
	}
}


/*****************************************************************************
* CTTSEngObj::FinalConstruct *
*----------------------------*
*   Description:
*       Constructor
*****************************************************************************/
HRESULT CTTSEngObj::FinalConstruct()
{
    SPDBG_FUNC( "CTTSEngObj::FinalConstruct" );
    HRESULT hr = S_OK;

    //--- Init vars
    m_hVoiceData = NULL;
    m_pVoiceData = NULL;
    m_pWordList  = NULL;
    m_ulNumWords = 0;

//	m_MlEngineNumber=TextToSpeechStartLang("US");
//	TextToSpeechSelectLang(NULL,m_MlEngineNumber);
	hr=TextToSpeechStartupEx(&m_phTTS,0,DO_NOT_USE_AUDIO_DEVICE | USE_SAPI5_AUDIO_DEVICE,TTSCallbackRoutine,(long)this);
	if (hr!=0)
	{
		m_phTTS=NULL;
		return E_FAIL;

	}
	m_CurrentFormat=WAVE_FORMAT_1M16;
    uiID_Index_Message =RegisterWindowMessage("DECtalkIndexMessage");
    uiID_Error_Message =RegisterWindowMessage("DECtalkErrorMessage");
	uiID_Bookmark_Message =	RegisterWindowMessage("DECtalkBookmarkMessage");
	uiID_Wordpos_Message =	RegisterWindowMessage("DECtalkWordposMessage");
	uiID_Start_Message =RegisterWindowMessage("DECtalkStartMessage");
	uiID_Stop_Message =	RegisterWindowMessage("DECtalkStopMessage");
	uiID_Sentence_Message =	RegisterWindowMessage("DECtalkSentenceMessage");
	m_CurrentSpeaker=0;

    return hr;
} /* CTTSEngObj::FinalConstruct */

/*****************************************************************************
* CTTSEngObj::FinalRelease *
*--------------------------*
*   Description:
*       destructor
*****************************************************************************/
void CTTSEngObj::FinalRelease()
{
    SPDBG_FUNC( "CTTSEngObj::FinalRelease" );

	if (m_phTTS!=NULL)
	{
		TextToSpeechShutdown(m_phTTS);
	}
//	TextToSpeechCloseLang("US");

    delete m_pWordList;

    if( m_pVoiceData )
    {
        ::UnmapViewOfFile( (void*)m_pVoiceData );
    }

    if( m_hVoiceData )
    {
        ::CloseHandle( m_hVoiceData );
    }

} /* CTTSEngObj::FinalRelease */

#if 0

/*****************************************************************************
* CTTSEngObj::MapFile *
*---------------------*
*   Description:
*       Helper function used by SetObjectToken to map file.  This function
*   assumes that m_cpToken has been initialized.
*****************************************************************************/
HRESULT CTTSEngObj::MapFile( const WCHAR * pszTokenVal,  // Value that contains file path
                            HANDLE * phMapping,          // Pointer to file mapping handle
                            void ** ppvData )            // Pointer to the data
{
    HRESULT hr = S_OK;
    CSpDynamicString dstrFilePath;
    hr = m_cpToken->GetStringValue( pszTokenVal, &dstrFilePath );
    if ( SUCCEEDED( hr ) )
    {
        bool fWorked = false;
        *phMapping = NULL;
        *ppvData = NULL;
        HANDLE hFile;
#ifdef _WIN32_WCE
        hFile = CreateFileForMapping( dstrFilePath, GENERIC_READ,
                                                FILE_SHARE_READ, NULL, OPEN_EXISTING,
                                                FILE_ATTRIBUTE_NORMAL, NULL );
#else
        hFile =		CreateFile( dstrFilePath, GENERIC_READ,
                                      FILE_SHARE_READ, NULL, OPEN_EXISTING,
                                      FILE_ATTRIBUTE_NORMAL, NULL );
#endif
        if (hFile != INVALID_HANDLE_VALUE)
        {
            *phMapping = ::CreateFileMapping( hFile, NULL, PAGE_READONLY, 0, 0, NULL );
            if (*phMapping)
            {
                *ppvData = ::MapViewOfFile( *phMapping, FILE_MAP_READ, 0, 0, 0 );
                if (*ppvData)
                {
                    fWorked = true;
                }
            }
            ::CloseHandle( hFile );
        }
        if (!fWorked)
        {
            hr = HRESULT_FROM_WIN32(::GetLastError());
            if (*phMapping)
            {
                ::CloseHandle(*phMapping);
                *phMapping = NULL;
            }
        }
    }
    return hr;
} /* CTTSEngObj::MapFile */
#endif

//
//=== ISpObjectWithToken Implementation ======================================
//

/*****************************************************************************
* CTTSEngObj::SetObjectToken *
*----------------------------*
*   Description:
*       This function performs the majority of the initialization of the voice.
*   Once the object token has been provided, the filenames are read from the
*   token key and the files are mapped.
*****************************************************************************/
STDMETHODIMP CTTSEngObj::SetObjectToken(ISpObjectToken * pToken)
{
	WCHAR *SpeakerNumber=0;
    SPDBG_FUNC( "CTTSEngObj::SetObjectToken" );

	pToken->GetStringValue(L"Speaker",&SpeakerNumber);
	m_CurrentSpeaker=(*SpeakerNumber)-'0';

    HRESULT hr = SpGenericSetObjectToken(pToken, m_cpToken);

    return hr;
} /* CTTSEngObj::SetObjectToken */

//
//=== ISpTTSEngine Implementation ============================================
//

/*****************************************************************************
* CTTSEngObj::Speak *
*-------------------*
*   Description:
*       This is the primary method that SAPI calls to render text.
*-----------------------------------------------------------------------------
*   Input Parameters
*
*   pUser
*       Pointer to the current user profile object. This object contains
*       information like what languages are being used and this object
*       also gives access to resources like the SAPI master lexicon object.
*
*   dwSpeakFlags
*       This is a set of flags used to control the behavior of the
*       SAPI voice object and the associated engine.
*
*   VoiceFmtIndex
*       Zero based index specifying the output format that should
*       be used during rendering.
*
*   pTextFragList
*       A linked list of text fragments to be rendered. There is
*       one fragement per XML state change. If the input text does
*       not contain any XML markup, there will only be a single fragment.
*
*   pOutputSite
*       The interface back to SAPI where all output audio samples and events are written.
*
*   Return Values
*       S_OK - This should be returned after successful rendering or if
*              rendering was interrupted because *pfContinue changed to FALSE.
*       E_INVALIDARG 
*       E_OUTOFMEMORY
*
*****************************************************************************/
STDMETHODIMP CTTSEngObj::Speak( DWORD dwSpeakFlags,
                                REFGUID rguidFormatId,
                                const WAVEFORMATEX * pWaveFormatEx,
                                const SPVTEXTFRAG* pTextFragList,
                                ISpTTSEngineSite* pOutputSite )
{
    SPDBG_FUNC( "CTTSEngObj::Speak" );
    HRESULT hr = S_OK;
	DWORD last_actions=0;
	int num_sentences=0;
	int skip_target=0;

    //--- Check args
    if( SP_IS_BAD_INTERFACE_PTR( pOutputSite ) ||
        SP_IS_BAD_READ_PTR( pTextFragList )  )
    {
        hr = E_INVALIDARG;
    }
    else
    {
        //--- Init some vars

		if (pWaveFormatEx==NULL)
		{
			m_output_is_text=1;
			m_CurrentFormat=WAVE_FORMAT_NULL;
		}

        m_pCurrFrag   = pTextFragList;
        m_pNextChar   = m_pCurrFrag->pTextStart;
        m_pEndChar    = m_pNextChar + m_pCurrFrag->ulTextLen;
        m_ullAudioOff = 0;
		m_pOutputSite = pOutputSite;
		m_got_index_32000 = 0;
		m_abort_from_audio=0;
		m_current_sentence_number=0;

		//TextToSpeechSetSpeaker(m_phTTS,m_CurrentSpeaker);

		CurrentRealtimeRate=encode_rate(0);;
		CurrentRealtimeRateDelta=0;
		TextToSpeechSetRate(m_phTTS,CurrentRealtimeRate);
		CurrentRealtimeVolume=100;
		CurrentRealtimeVolumeDelta=0;

		TextToSpeechSetVolume(m_phTTS,VOLUME_MAIN,CurrentRealtimeVolume);
		SkipToSentence=0;

		TextToSpeechSetSpeaker(m_phTTS,m_CurrentSpeaker);

#ifndef _DEBUG
		TextToSpeechSpeak(m_phTTS,"[:error ignore]",TTS_FORCE);
#endif

		pOutputSite->GetEventInterest(&m_event_interest);

		last_actions=pOutputSite->GetActions();

		num_sentences=build_sentence_list(pTextFragList,last_actions);
		
		TextToSpeechOpenSapi5Output((LPTTS_HANDLE_T)m_phTTS,this,m_CurrentFormat);

        //--- Parse
        //    We've supplied a simple word/sentence breaker just to show one
        //    way of walking the fragment list. It obviously doesn't deal with
        //    things like abreviations and expansion of numbers and dates.
        CItemList ItemList;

		SPLISTPOS ListPos=sentence_list.GetHeadPosition();

        while( SUCCEEDED( hr ) && !((last_actions=pOutputSite->GetActions()) & SPVES_ABORT) && !m_got_index_32000 && !m_abort_from_audio)
        {
            //--- Do skip?
            if( last_actions & SPVES_SKIP && SkipToSentence==0)
            {
                long lSkipCnt;
                SPVSKIPTYPE eType;
                hr = pOutputSite->GetSkipInfo( &eType, &lSkipCnt );
                if( SUCCEEDED( hr ) )
                {
					if (lSkipCnt>0)
					{
						SkipToSentence=m_current_sentence_number+lSkipCnt;
						NumberSkipped=0;
						m_phTTS->SkippingForward=1;
					}
					if (lSkipCnt<=0)
					{
						int count=0;
						int not_found=1;
						DWORD saved_count;

						skip_target=m_current_sentence_number+lSkipCnt;
						NumberSkipped=0;
						SkipToSentence=num_sentences+2;
						m_phTTS->SkippingForward=1;

						EnterCriticalSection( m_phTTS->pcsQueuedSampleCount );
						saved_count=m_phTTS->dwQueuedSampleCount;
						LeaveCriticalSection( m_phTTS->pcsQueuedSampleCount );
						
						count=lSkipCnt;
						if (skip_target<1)
						{
							count+=1-skip_target;
							skip_target=1;
						}
						TextToSpeechReset(m_phTTS,FALSE);
						ListPos=sentence_list.GetHeadPosition();
#if 0
						while (ListPos && not_found)
						{
							sentence_c &cur_sent=sentence_list.GetNext(ListPos);
							if (cur_sent.sentence_number==skip_target)
							{
								not_found=0;
								if (ListPos==0)
								{
									ListPos=sentence_list.GetHeadPosition();
								}
								else
								{
									sentence_list.GetPrev(ListPos);
								}
							}
						}
#endif

						EnterCriticalSection( m_phTTS->pcsQueuedSampleCount );
						m_phTTS->dwQueuedSampleCount = saved_count;
						LeaveCriticalSection( m_phTTS->pcsQueuedSampleCount );
						pOutputSite->CompleteSkip(count);
						SkipToSentence=0;
						m_phTTS->SkippingForward=0;

					}

                    // BUGBUG - Need to implement sample skip
                    //--- This is where the current fragment and character pointers
                    //    should be updated to reflect the skip. 

                    //--- Notify SAPI how many items we skipped. We're returning zero
                    //    because this feature isn't implemented.
                   
                }
            }

			if (last_actions & SPVES_RATE)
			{
				long cur_rate=0;
				DWORD dectalk_rate=0;
				int set_rate=0;
				hr=pOutputSite->GetRate(&cur_rate);
				if (SUCCEEDED(hr))
				{
					TextToSpeechGetRate(m_phTTS,&dectalk_rate);
					set_rate=dectalk_rate+(encode_rate(cur_rate)-CurrentRealtimeRate);
					TextToSpeechSetRate(m_phTTS,set_rate);
					CurrentRealtimeRateDelta=encode_rate(cur_rate)-CurrentRealtimeRate;
					CurrentRealtimeRate=encode_rate(cur_rate);
				}
			}

			if (last_actions & SPVES_VOLUME)
			{
				unsigned short cur_volume=100;
				int dectalk_volume=0;
				int set_volume;
				hr=pOutputSite->GetVolume(&cur_volume);
				if (SUCCEEDED(hr))
				{
					TextToSpeechGetVolume(m_phTTS,VOLUME_MAIN,&dectalk_volume);
					set_volume=dectalk_volume+(cur_volume-CurrentRealtimeVolume);
					TextToSpeechSetVolume(m_phTTS,VOLUME_MAIN,set_volume);
					CurrentRealtimeVolumeDelta=cur_volume-CurrentRealtimeVolume;
					CurrentRealtimeVolume=cur_volume;
				}
			}


            //--- We aren't going to do any part of speech determination,
            //    prosody, or pronunciation determination. If you were, one thing
            //    you will need is access to the SAPI lexicon. You can get that with
            //    the following call.
            //    CComPtr<ISpLexicon> cpLexicon;
            //    hr = pUser->GetLexicon( &cpLexicon );


            if( !(last_actions & SPVES_ABORT)  && ListPos)
			{
				sentence_c &current_sentence= sentence_list.GetNext(ListPos);
				if (skip_target!=0 && current_sentence.sentence_number==skip_target)
				{
					skip_target=0;
				}
				if (skip_target==0)
				{
					if (!ListPos)
					{
						TextToSpeechSpeak(m_phTTS,(char *)current_sentence.text,TTS_FORCE);
						TextToSpeechSpeak(m_phTTS,"[:i m 32000][:sync]",TTS_FORCE);
					}
					else
					{
						TextToSpeechSpeak(m_phTTS,(char *)current_sentence.text,TTS_NORMAL);
					}
				}
				
//				current_sentence=&cur_sentence_p.GetHead();
			}


#if 0
            if( !(last_actions & SPVES_ABORT) )
            {
                //--- Fire begin sentence event
                CSentItem& FirstItem = ItemList.GetHead();
                CSentItem& LastItem  = ItemList.GetTail();
                CSpEvent Event;
                Event.eEventId             = SPEI_SENTENCE_BOUNDARY;
                Event.elParamType          = SPET_LPARAM_IS_UNDEFINED;
                Event.ullAudioStreamOffset = m_ullAudioOff;
                Event.lParam               = (LPARAM)FirstItem.ulItemSrcOffset;
                Event.wParam               = (WPARAM)LastItem.ulItemSrcOffset +
                                                     LastItem.ulItemSrcLen -
                                                     FirstItem.ulItemSrcOffset;
                hr = pOutputSite->AddEvents( &Event, 1 );

                //--- Output
                if( SUCCEEDED( hr ) )
                {
                    hr = OutputSentence( ItemList, pOutputSite );
                }
            }
#endif
			if (skip_target==0 && ListPos==0)
			{
				Sleep(30);
			}
        }

		if ((last_actions & SPVES_ABORT) || m_abort_from_audio)
		{
			TextToSpeechReset(m_phTTS,FALSE);
		}
        //--- S_FALSE just says that we hit the end, return okay
        if( hr == S_FALSE )
        {
            hr = S_OK;
        }
		sentence_list.RemoveAll();
		TextToSpeechCloseSapi5Output(m_phTTS);
    
	}


	
    return hr;
} /* CTTSEngObj::Speak */


  
int CTTSEngObj::build_sentence_list(const SPVTEXTFRAG *pTextFragList,DWORD last_actions)
{
	SPVTEXTFRAG *pTextFrag;
	SPVSTATE *cur_state=NULL,*prev_state=NULL;
//	sentence_t sentence;
	sentence_c sent;
	int src_pos=0;
	int dest_pos=0;
	int src_array_max;
	int dest_array_max;
	unsigned char *src_array;
	unsigned char *dest_array;
	unsigned char *temp_arr;
	unsigned char insert_array[100];
	char *pos_array=NULL;
	char *emph_array=NULL;
	int sentence_number=1;
	int new_sentence=1;
	int insert_size;
	int i, j;
	int last_was_clause=0;
	int position;
	int word_length=0;
	int num_spaces;
	int spell_block=0;
	int new_frag=1;
	char left_square_bracket[] = "left square bracket";
	char dectalk_xml[] = "dectalk";
	bool VALID_XML = true;


	src_array=(unsigned char *)malloc(1024);
	if (src_array==NULL)
	{
		return (S_FALSE);
	}
	src_array_max=1024;
	dest_array=(unsigned char *) malloc(2048);
	if (dest_array==NULL)
	{
		free(src_array);
		return (S_FALSE);
	}
	dest_array_max=2048;

	memset(src_array,0,1024);
	memset(dest_array,0,2048);
	

	pTextFrag=(SPVTEXTFRAG *)pTextFragList;

	while (pTextFrag!=NULL)
	{
		// reallocate src_array if necessary
		if ((unsigned)(src_array_max-1) < pTextFrag->ulTextLen)
		{
			while( (unsigned)(src_array_max-1) < pTextFrag->ulTextLen)
			{
				src_array_max<<=1;
			}
			temp_arr=(unsigned char *)realloc(src_array,src_array_max);
			if (temp_arr==NULL)
			{
				free(src_array);
				free(dest_array);
				return(S_FALSE);
			}
			src_array=temp_arr;
		}
		
		WideCharToMultiByte(CP_ACP, 0, pTextFrag->pTextStart  , pTextFrag->ulTextLen, (char *)src_array,src_array_max-1,0,0);
		src_array[pTextFrag->ulTextLen]='\0';
		src_pos=0;
		
		prev_state=cur_state;
		cur_state=&(pTextFrag->State);
		insert_size=encode_state_change(cur_state,prev_state,insert_array,99,last_actions);
		new_frag=1;
		if (dest_pos+insert_size>dest_array_max)
		{
			dest_array_max<<=1;
			temp_arr=(unsigned char *)realloc(dest_array,dest_array_max);
			if (temp_arr==NULL)
			{
				free(src_array);
				free(dest_array);
				return(S_FALSE);
			}
			dest_array=temp_arr;
		}
		for (i=0;i<insert_size;i++)
		{
			dest_array[dest_pos]=insert_array[i];
			dest_pos++;
		}
		
		switch(pTextFrag->State.ePartOfSpeech)	// Check for <partofsp> tag
		{
		case SPPS_Noun:
			pos_array = "[:pron noun]";
			break;
		case SPPS_Verb:
			pos_array = "[:pron verb]";
			break;
		case SPPS_Modifier:
			pos_array = "[:pron adjective]";
			break;
		case SPPS_Function:
			pos_array = "[:pron function]";
			break;
		case SPPS_Interjection:
			pos_array = "[:pron interjection]";
			break;
		case SPPS_Unknown:
		default:
			pos_array = "";
		}

		if(pTextFrag->State.EmphAdj)		// Check for <emph> tag
		{
			emph_array = "[\"]";
		}
		else
		{
			emph_array = "";
		}

		switch (pTextFrag->State.eAction)
		{
		case SPVA_SpellOut:
			spell_block=1;
			insert_size=sprintf((char *)insert_array,"[:say letter]");
			if (dest_pos+insert_size>dest_array_max)
			{
				dest_array_max<<=1;
				temp_arr=(unsigned char *)realloc(dest_array,dest_array_max);
				if (temp_arr==NULL)
				{
					free(src_array);
					free(dest_array);
					return(S_FALSE);
				}
				dest_array=temp_arr;
			}
			for (i=0;i<insert_size;i++)
			{
				dest_array[dest_pos]=insert_array[i];
				dest_pos++;
			}
		case SPVA_Speak:
			if (new_sentence==0)
			{
				i=0;
				word_length=0;
				for (i;(unsigned)i<pTextFrag->ulTextLen && !(parser_char_types[src_array[i]] & TYPE_white);i++)
				{
					word_length++;
				}
				position=(pTextFrag->ulTextSrcOffset) + (word_length <<24);
				insert_size=sprintf((char *)insert_array,"[:i word %d %d]%s%s",position>>16,position & 0x0000ffff, pos_array, emph_array);
				if (dest_pos+insert_size>dest_array_max)
				{
					dest_array_max<<=1;
					temp_arr=(unsigned char *)realloc(dest_array,dest_array_max);
					if (temp_arr==NULL)
					{
						free(src_array);
						free(dest_array);
						return(S_FALSE);
					}
					dest_array=temp_arr;
				}
				for (i=0;i<insert_size;i++)
				{
					dest_array[dest_pos]=insert_array[i];
					dest_pos++;
				}
			}
			
			for (src_pos=0; (unsigned)src_pos < pTextFrag->ulTextLen; src_pos++)
			{
				if (new_sentence)
				{
					sent.pXmlState=&(pTextFrag->State);
					sent.textsrcoffset=pTextFrag->ulTextSrcOffset+src_pos;
					sent.sentence_number=sentence_number;
					sentence_number++;
					if (new_frag)
					{
						new_frag=0;
					}
					else
					{
						dest_pos=0;
					}
					word_length=0;
					i=src_pos;
					num_spaces=0;
					if ((parser_char_types[src_array[src_pos]] & TYPE_white))
					{
						for (i;(unsigned)i < pTextFrag->ulTextLen && (parser_char_types[src_array[i]] & TYPE_white);i++)
						{
							num_spaces++;
						}
					}
					for (i;(unsigned)i<pTextFrag->ulTextLen && !(parser_char_types[src_array[i]] & TYPE_white);i++)
					{
						word_length++;
					}
					position=(pTextFrag->ulTextSrcOffset+src_pos+num_spaces) + (word_length <<24);
					insert_size=sprintf((char *)insert_array,"[:i start %d %d][:i word %d %d]%s%s",
						sent.sentence_number>>16, sent.sentence_number & 0x0000ffff,
						(position)>>16,(position) & 0x0000ffff, pos_array, emph_array);
					if (dest_pos+insert_size>dest_array_max)
					{
						dest_array_max<<=1;
						temp_arr=(unsigned char *)realloc(dest_array,dest_array_max);
						if (temp_arr==NULL)
						{
							free(src_array);
							free(dest_array);
							return(S_FALSE);
						}
						dest_array=temp_arr;
					}
					for (i=0;i<insert_size;i++)
					{
						dest_array[dest_pos]=insert_array[i];
						dest_pos++;
					}
					new_sentence=0;
				}
				if (parser_char_types[src_array[src_pos]] & TYPE_white) // check for a space
				{
					if (last_was_clause)
					{
						last_was_clause=0;
						dest_array[dest_pos]=src_array[src_pos];
						dest_pos++;
						sent.text=(unsigned char *)malloc(dest_pos+1);
						if (sent.text==NULL)
						{
							sentence_list.RemoveAll();
							free(src_array);
							free(dest_array);
							return(S_FALSE);
						}
						dest_array[dest_pos]='\0';
						strcpy((char *)sent.text,(char *)dest_array);
						sent.textlength=strlen((char *)dest_array);
						sent.textsrclength=(pTextFrag->ulTextLen+pTextFrag->ulTextSrcOffset)- sent.textsrcoffset;
						sentence_list.AddTail(sent);
						memset(&sent,0,sizeof(sent));
						dest_pos=0;
						new_sentence=1;
						continue;
						//add the sentence [:i sent %d %d] to the start of the sentence
						//insert data into the sentence structure
						//start new sentence
					}
					// copy_the space here
					dest_array[dest_pos]=src_array[src_pos];
					dest_pos++;
					
					word_length=0;
					i=src_pos;
					num_spaces=0;
					if (parser_char_types[src_array[src_pos]] & TYPE_white)
					{
						for (i; (unsigned)i < pTextFrag->ulTextLen && (parser_char_types[src_array[i]] & TYPE_white);i++)
						{
							num_spaces++;
						}
					}
					for (i; (unsigned)i < pTextFrag->ulTextLen && !(parser_char_types[src_array[i]] & TYPE_white);i++)
					{
						word_length++;
					}
					position=(pTextFrag->ulTextSrcOffset+src_pos+num_spaces) + (word_length <<24);
					insert_size=sprintf((char *)insert_array,"[:i word %d %d]%s%s",position>>16,position & 0x0000ffff, pos_array, emph_array);
					if (dest_pos+insert_size>dest_array_max)
					{
						dest_array_max<<=1;
						temp_arr=(unsigned char *)realloc(dest_array,dest_array_max);
						if (temp_arr==NULL)
						{
							free(src_array);
							free(dest_array);
							return(S_FALSE);
						}
						dest_array=temp_arr;
					}
					for (i=0;i<insert_size;i++)
					{
						dest_array[dest_pos]=insert_array[i];
						dest_pos++;
					}
					continue;
				}
				if (parser_char_types[src_array[src_pos]] & TYPE_clause)
				{
					last_was_clause=1;
				}
				else
				{
					last_was_clause=0;
				}
				if(src_array[src_pos] == 0x5b)		// 0x5b = [ Keep any DECtalk [:] commands out of the sentence list.
				{									// 0x3a = :
					if(src_array[src_pos+1] == 0x3a)
					{
						for(int j=0;j<(sizeof(left_square_bracket)/sizeof(char))-1;j++)	// -1 to remove the NULL from going to the dest array
					{
							dest_array[dest_pos++]=left_square_bracket[j];
						}
							src_pos++;
					}
				}
				dest_array[dest_pos]=src_array[src_pos];
				dest_pos++;
			}
			if (last_was_clause)
			{
				sent.text=(unsigned char *)malloc(dest_pos+1);
				if (sent.text==NULL)
				{
					sentence_list.RemoveAll();
					free(src_array);
					free(dest_array);
					return(S_FALSE);
				}
				dest_array[dest_pos]='\0';
				strcpy((char *)sent.text,(char *)dest_array);
				sent.textlength=strlen((char *)dest_array);
				sent.textsrclength=(pTextFrag->ulTextLen+pTextFrag->ulTextSrcOffset)- sent.textsrcoffset;
				sentence_list.AddTail(sent);
				memset(&sent,0,sizeof(sent));
				new_sentence=1;
				dest_pos=0;
			}
			if (spell_block==1)
			{
				spell_block=0;
				insert_size=sprintf((char *)insert_array,"[:say clause]");
				if (dest_pos+insert_size>dest_array_max)
				{
					dest_array_max<<=1;
					temp_arr=(unsigned char *)realloc(dest_array,dest_array_max);
					if (temp_arr==NULL)
					{
						free(src_array);
						free(dest_array);
						return(S_FALSE);
					}
					dest_array=temp_arr;
				}
				for (i=0;i<insert_size;i++)
				{
					dest_array[dest_pos]=insert_array[i];
					dest_pos++;
				}
			}
			break;
		case SPVA_Silence:
			insert_size=sprintf((char *)insert_array,"[:phon arpa on][_<%d,>]",pTextFrag->State.SilenceMSecs);
			if (dest_pos+insert_size>dest_array_max)
			{
				dest_array_max<<=1;
				temp_arr=(unsigned char *)realloc(dest_array,dest_array_max);
				if (temp_arr==NULL)
				{
					free(src_array);
					free(dest_array);
					return(S_FALSE);
				}
				dest_array=temp_arr;
			}
			for (i=0;i<insert_size;i++)
			{
				dest_array[dest_pos]=insert_array[i];
				dest_pos++;
			}
			break;
			
		case SPVA_Bookmark:
			//still have to copy bookmark text data to a storage place
			position=(int)(pTextFrag);
			insert_size=sprintf((char *)insert_array,"[:i bookmark %d %d]",position>>16,position & 0x0000ffff);
			if (dest_pos+insert_size>dest_array_max)
			{
				dest_array_max<<=1;
				temp_arr=(unsigned char *)realloc(dest_array,dest_array_max);
				if (temp_arr==NULL)
				{
					free(src_array);
					free(dest_array);
					return(S_FALSE);
				}
				dest_array=temp_arr;
			}
			for (i=0;i<insert_size;i++)
			{
				dest_array[dest_pos]=insert_array[i];
				dest_pos++;
			}
			break;
			
		case SPVA_Pronounce:
			{
				// convert phonemes to arpa (function probably exists in current sapi)
				SPPHONEID *phones=pTextFrag->State.pPhoneIds;
				i=0;
				int arpa_id;
				insert_size=sprintf((char *)insert_array,"[:phon arpa on][");
				while (phones[i])
				{
					arpa_id=SapiToArpaTable[phones[i]];
					insert_array[insert_size++]=m_phTTS->pKernelShareData->arpabet[arpa_id<<1];
					insert_array[insert_size++]=m_phTTS->pKernelShareData->arpabet[(arpa_id<<1)+1];
					i++;
					if (insert_size>98)
					{
						insert_array[insert_size++]=']';
						insert_array[insert_size]='\0';
						if (dest_pos+insert_size>dest_array_max)
						{
							dest_array_max<<=1;
							temp_arr=(unsigned char *)realloc(dest_array,dest_array_max);
							if (temp_arr==NULL)
							{
								free(src_array);
								free(dest_array);
								return(S_FALSE);
							}
							dest_array=temp_arr;
						}
						for (i=0;i<insert_size;i++)
						{
							dest_array[dest_pos]=insert_array[i];
							dest_pos++;
						}
						insert_size=0;
						insert_array[insert_size++]='[';
					}
					
					
				}
				insert_array[insert_size++]=']';
				insert_array[insert_size]='\0';
				if (dest_pos+insert_size>dest_array_max)
				{
					dest_array_max<<=1;
					temp_arr=(unsigned char *)realloc(dest_array,dest_array_max);
					if (temp_arr==NULL)
					{
						free(src_array);
						free(dest_array);
						return(S_FALSE);
					}
					dest_array=temp_arr;
				}
				for (i=0;i<insert_size;i++)
				{
					dest_array[dest_pos]=insert_array[i];
					dest_pos++;
				}
			}
			break;
		case SPVA_ParseUnknownTag:
			i=1; j=0;
			VALID_XML = true;
			insert_size=sprintf((char *)insert_array, (char *)src_array);

			while(insert_array[i] == ' ')i++; // Get rid of any leading white spaces
			
			for(j=0; j<7; j++)
				if(tolower(insert_array[i++]) != dectalk_xml[j])
					VALID_XML = false;

			if(VALID_XML)
			{
				dest_array[dest_pos++]='[';
				dest_array[dest_pos++]=':';
				for (i; i<insert_size - 1; i++)	//The first and last elements of insert_array are <> so skip 'em
				{
					dest_array[dest_pos++]=insert_array[i];
				}	
				dest_array[dest_pos++]=']';
			}
			break;
		}		
		if (pTextFrag->pNext==NULL)
		{	
			if (dest_pos!=0)
			{
				sent.text=(unsigned char *)malloc(dest_pos+1);
				if (sent.text==NULL)
				{
					sentence_list.RemoveAll();
					free(src_array);
					free(dest_array);
					return(S_FALSE);
				}
				dest_array[dest_pos]='\0';
				strcpy((char *)sent.text,(char *)dest_array);
				sent.textlength=strlen((char *)dest_array);
				sent.textsrclength=(pTextFrag->ulTextLen+pTextFrag->ulTextSrcOffset)- sent.textsrcoffset;
				sentence_list.AddTail(sent);
				memset(&sent,0,sizeof(sent));
			}
		}
		pTextFrag=pTextFrag->pNext;
		new_frag=1;
		
	}
	free(src_array);
	free(dest_array);

	return(sentence_number-1);
}
  

int	CTTSEngObj::encode_state_change(SPVSTATE *cur_state,SPVSTATE *prev_state,unsigned char *insert_array,int insert_array_max,DWORD last_actions)
{
	char temp_array[100];
	int i;
	int insert_pos=0;
	int temp_length;
	long cur_rate=0;
	unsigned short cur_volume=100;
	//int temp;
	int add_sync=0;

	if (cur_state==NULL)
	{
		return(0);
	}

/*	if (prev_state==NULL)
	{
//		return(sprintf((char *)insert_array,"[:emph 0][:rate 200][:vol new 100][:pitch 0]"));
		return(sprintf((char *)insert_array,"[:index volume 0 100][:rate 200][:pitch 0]"));
	}
*/
	if ((prev_state==NULL && cur_state->EmphAdj) || (prev_state!=NULL && cur_state->EmphAdj != prev_state->EmphAdj) )
	{
		if (cur_state->EmphAdj)
		{
			temp_length=sprintf(temp_array, "[:phon arpa on]");
		}
		else
		{
			temp_length=sprintf(temp_array, "[:phon arpa off]");
		}
		for (i=0;i<temp_length && insert_pos<insert_array_max;i++,insert_pos++)
		{
			insert_array[insert_pos]=temp_array[i];
		}
	}
	
	if (prev_state==NULL || cur_state->RateAdj != prev_state->RateAdj)
	{
//		if (prev_state==NULL)
//		{
//			m_pOutputSite->GetRate(&cur_rate);
//			temp_length=sprintf(temp_array,"[:rate %d]",encode_rate(cur_rate));
//		}
//		else
		{
			temp_length=sprintf(temp_array,"[:rate %d]",encode_rate(cur_state->RateAdj));
		}
		for (i=0;i<temp_length && insert_pos<insert_array_max;i++,insert_pos++)
		{
			insert_array[insert_pos]=temp_array[i];
		}
		add_sync=1;
	}
	if (prev_state==NULL || cur_state->Volume != prev_state->Volume)
	{
//		if (prev_state==NULL)
//		{
//			m_pOutputSite->GetVolume(&cur_volume);
//			temp_length=sprintf(temp_array,"[:index volume 0 %d]",cur_volume);
//		}
//		else
		{
			temp_length=sprintf(temp_array,"[:index volume 0 %d]",cur_state->Volume);
		}
		for (i=0;i<temp_length && insert_pos<insert_array_max;i++,insert_pos++)
		{
			insert_array[insert_pos]=temp_array[i];
		}
	}
	if (prev_state==NULL  || cur_state->PitchAdj.MiddleAdj != prev_state->PitchAdj.MiddleAdj)
	{
		temp_length=sprintf(temp_array,"[:sync][:dv ap %d]",encode_pitch(cur_state->PitchAdj.MiddleAdj));
		for (i=0;i<temp_length && insert_pos<insert_array_max;i++,insert_pos++)
		{
			insert_array[insert_pos]=temp_array[i];
		}
		add_sync=1;
	}
	if (prev_state==NULL || cur_state->PitchAdj.RangeAdj != prev_state->PitchAdj.RangeAdj)
	{
		temp_length=sprintf(temp_array,"[:sync][:dv pr %d]",encode_pitch_range(cur_state->PitchAdj.RangeAdj));
		for (i=0;i<temp_length && insert_pos<insert_array_max;i++,insert_pos++)
		{
			insert_array[insert_pos]=temp_array[i];
		}
		add_sync=1;
	}
	if (add_sync)
	{
		temp_length=sprintf(temp_array,"[:sync]");
		for (i=0;i<temp_length && insert_pos<insert_array_max;i++,insert_pos++)
		{
			insert_array[insert_pos]=temp_array[i];
		}
	}
	insert_array[insert_pos]='\0';
	return(insert_pos);
}


/* pre-calculated rate table */
#ifdef ACCESS32
short rate_table[21]= {
	/* -10   -9   -8   -7   -6   -5   -4   -3   -2   -1 */
        67,  74,  83,  93, 103, 115, 129, 144, 161, 179,
	/*   0  */
	   200,
	/*   1    2    3    4    5    6    7    8    9   10 */
       223, 249, 278, 310, 346, 387, 432, 482, 538, 600
};
#else
short rate_table[21]= {
	/* -10   -9   -8   -7   -6   -5   -4   -3   -2   -1 */
        75,  80,  87,  95, 104, 115, 129, 144, 161, 179,
	/*   0  */
	   200,
	/*   1    2    3    4    5    6    7    8    9   10 */
       223, 249, 278, 310, 346, 387, 432, 482, 538, 600
};
#endif


int CTTSEngObj::encode_rate(int in_rate)
{
	if (in_rate<-10)
	{
		return(rate_table[0]);
	}
	if (in_rate>10)
	{
		return(rate_table[20]);
	}
	return(rate_table[in_rate+10]);
}

/* multiplier talbe for pitch */
double pitch_change[21] = {
/* -10 */0.749153538,
/*  -9 */0.771105413,
/*  -8 */0.793700526,
/*  -7 */0.816957727,
/*  -6 */0.840896415,
/*  -5 */0.865536561,
/*  -4 */0.890898718,
/*  -3 */0.917004043,
/*  -2 */0.943874313,
/*  -1 */0.971531941,
/*   0 */1.000000000,
/*   1 */1.029302237,
/*   2 */1.059463094,
/*   3 */1.090507733,
/*   4 */1.122462048,
/*   5 */1.155352697,
/*   6 */1.189207115,
/*   7 */1.224053543,
/*   8 */1.259921050,
/*   9 */1.296839555,
/*  10 */1.334839854 
};


int CTTSEngObj::encode_pitch(int in_pitch)
{
	int pitch=0;
	double temp;

	if (in_pitch<-10)
	{
		in_pitch=-10;
	}
	if (in_pitch>10)
	{
		in_pitch=10;
	}

	GetDefaultPitch(m_phTTS,&pitch);
	if (pitch==0)
	{
		return(0);
	}
	temp=(pitch_change[in_pitch+10]*(double)pitch);
	return((int)temp);

}


int CTTSEngObj::encode_pitch_range(int in_pitch)
{
	int pitch=0;
	double temp;

	if (in_pitch<-10)
	{
		in_pitch=-10;
	}
	if (in_pitch>10)
	{
		in_pitch=10;
	}

	GetDefaultPitchRange(m_phTTS,&pitch);
	if (pitch==0)
	{
		return(0);
	}
	temp=(pitch_change[in_pitch+10]*(double)pitch);
	return((int)temp);

}

/*****************************************************************************
* CTTSEngObj::OutputSentence *
*----------------------------*
*   This method is used to output an item list.
****************************************************************************/
HRESULT CTTSEngObj::OutputSentence( CItemList& ItemList, ISpTTSEngineSite* pOutputSite )
{
    HRESULT hr = S_OK;
    ULONG WordIndex;
	char textdata[50000];
	m_got_index_32000=0;

    //--- Lookup words in our voice
    SPLISTPOS ListPos = ItemList.GetHeadPosition();
    while( ListPos && !(pOutputSite->GetActions() & SPVES_ABORT) )
    {
        CSentItem& Item = ItemList.GetNext( ListPos );

        //--- Process sentence items
        switch( Item.pXmlState->eAction )
        {
          //--- Speak some text ---------------------------------------
          case SPVA_Speak:
          {

			  WideCharToMultiByte(CP_ACP, 0, Item.pItem  , Item.ulItemLen, textdata, 50000,0,0);
			  textdata[Item.ulItemLen]=' ';
			  textdata[Item.ulItemLen+1]='\0';

				  TextToSpeechSpeak(m_phTTS,textdata,TTS_NORMAL);

            //--- We don't say anything for punctuation or control characters
            //    in this sample. 
            if( iswalpha( Item.pItem[0] ) || iswdigit( Item.pItem[0] ) )
            {
                //--- Lookup the word, if we can't find it just use the first one
                for( WordIndex = 0; WordIndex < m_ulNumWords; ++WordIndex )
                {
                    if( ( m_pWordList[WordIndex].ulTextLen == Item.ulItemLen ) &&
                        ( !wcsnicmp( m_pWordList[WordIndex].pText, Item.pItem, Item.ulItemLen )) )
                    {
                        break;
                    }
                }
                if( WordIndex == m_ulNumWords )
                {
                    WordIndex = 0;
                }

#if 0
                //--- Queue the event
                CSpEvent Event;
                Event.eEventId             = SPEI_WORD_BOUNDARY;
                Event.elParamType          = SPET_LPARAM_IS_UNDEFINED;
                Event.ullAudioStreamOffset = m_ullAudioOff;
                Event.lParam               = Item.ulItemSrcOffset;
                Event.wParam               = Item.ulItemSrcLen;
                hr = pOutputSite->AddEvents( &Event, 1 );

                //--- Queue the audio data
                hr = pOutputSite->Write( m_pWordList[WordIndex].pAudio,
                                         m_pWordList[WordIndex].ulNumAudioBytes,
                                         NULL );

                //--- Update the audio offset
                m_ullAudioOff += m_pWordList[WordIndex].ulNumAudioBytes;
#endif

            }
          }
          break;

          //--- Output some silence for a pause -----------------------
          case SPVA_Silence:
          {
            BYTE Buff[1000];
            memset( Buff, 0, 1000 );
            ULONG NumSilenceBytes = Item.pXmlState->SilenceMSecs * 22;

            //--- Queue the audio data in chunks so that we can get
            //    interrupted if necessary.
            while( !(pOutputSite->GetActions() & SPVES_ABORT) )
            {
                if( NumSilenceBytes > 1000 )
                {
                    hr = pOutputSite->Write( Buff, 1000, NULL );
                    NumSilenceBytes -= 1000;
                }
                else
                {
                    hr = pOutputSite->Write( Buff, NumSilenceBytes, NULL );
                    break;
                }
            }

            //--- Update the audio offset
            m_ullAudioOff += NumSilenceBytes;
          }
          break;

          //--- Fire a bookmark event ---------------------------------
          case SPVA_Bookmark:
          {
            //--- The bookmark is NOT a null terminated string in the Item, but we need
            //--- to convert it to one.  Allocate enough space for the string.
            WCHAR * pszBookmark = (WCHAR *)_alloca((Item.ulItemLen + 1) * sizeof(WCHAR));
            memcpy(pszBookmark, Item.pItem, Item.ulItemLen * sizeof(WCHAR));
            pszBookmark[Item.ulItemLen] = 0;
            //--- Queue the event
            SPEVENT Event;
            Event.eEventId             = SPEI_TTS_BOOKMARK;
            Event.elParamType          = SPET_LPARAM_IS_STRING;
            Event.ullAudioStreamOffset = m_ullAudioOff;
            Event.lParam               = (LPARAM)pszBookmark;
            Event.wParam               = _wtol(pszBookmark);
            hr = pOutputSite->AddEvents( &Event, 1 );
          }
          break;

          case SPVA_Pronounce:
            //--- Our sample engine doesn't handle this. If it
            //    did, you would use the associated pronunciation in
            //    the XmlState structure instead of the lexicon.
            break;

          case SPVA_ParseUnknownTag:
            //--- This will reference an XML tag that is unknown to SAPI
            //    if your engine has private tags to control state, you
            //    would examine these tags and see if you recognize it. This
            //    would also be the point that you would make the rendering
            //    state change.
            break;
        }
    }

	TextToSpeechSpeak(m_phTTS,"[:index mark 32000][:sync]",TTS_FORCE);

	while (!m_got_index_32000)
	{
		Sleep(50);
	}

    return hr;
} /* CTTSEngObj::OutputSentence */

/*****************************************************************************
* CTTSEngObj::GetVoiceFormat *
*----------------------------*
*   Description:
*       This method returns the output data format associated with the
*   specified format Index. Formats are in order of quality with the best
*   starting at 0.
*****************************************************************************/
STDMETHODIMP CTTSEngObj::GetOutputFormat( const GUID * pTargetFormatId, const WAVEFORMATEX * pTargetWaveFormatEx,
                                          GUID * pDesiredFormatId, WAVEFORMATEX ** ppCoMemDesiredWaveFormatEx )
{
    SPDBG_FUNC( "CTTSEngObj::GetVoiceFormat" );
    HRESULT hr = S_OK;

	if (pTargetFormatId==NULL && pTargetWaveFormatEx==NULL)
	{
		m_CurrentFormat=WAVE_FORMAT_1M16;
		hr = SpConvertStreamFormatEnum(SPSF_11kHz16BitMono, pDesiredFormatId, ppCoMemDesiredWaveFormatEx);
		return(hr);
	}
	if (pTargetFormatId==&SPDFID_Text)
	{
		m_output_is_text=1;
		m_CurrentFormat=WAVE_FORMAT_NULL;
		pDesiredFormatId=(struct _GUID *)&SPDFID_Text;
		*ppCoMemDesiredWaveFormatEx=NULL;
		return(S_OK);
	}
	if (pTargetWaveFormatEx!=NULL && pTargetWaveFormatEx->nSamplesPerSec==8000 && pTargetWaveFormatEx->wBitsPerSample==8)
	{
		m_CurrentFormat=WAVE_FORMAT_08M08;
		hr = SpConvertStreamFormatEnum(SPSF_CCITT_uLaw_8kHzMono, pDesiredFormatId, ppCoMemDesiredWaveFormatEx);
	}
	else
	{
		m_CurrentFormat=WAVE_FORMAT_1M16;
		hr = SpConvertStreamFormatEnum(SPSF_11kHz16BitMono, pDesiredFormatId, ppCoMemDesiredWaveFormatEx);
	}
    return hr;
} /* CTTSEngObj::GetVoiceFormat */

//
//=== This code is just a simplified parser ==================================
//
/*****************************************************************************
* CTTSEngObj::GetNextSentence *
*-----------------------------*
*   This method is used to create a list of items to be spoken.
****************************************************************************/
HRESULT CTTSEngObj::GetNextSentence( CItemList& ItemList )
{
    HRESULT hr = S_OK;

    //--- Clear the destination
    ItemList.RemoveAll();

    //--- Is there any work to do
    if( m_pCurrFrag == NULL )
    {
        hr = S_FALSE;
    }
    else
    {
        BOOL fSentDone = false;
        BOOL fGoToNextFrag = false;

        while( m_pCurrFrag && !fSentDone )
        {
            if( m_pCurrFrag->State.eAction == SPVA_Speak )
            {
                fSentDone = AddNextSentItem( ItemList );

                //--- Advance fragment?
                if( m_pNextChar >= m_pEndChar )
                {
                    fGoToNextFrag = true;
                }
            }
            else
            {
                //--- Add non spoken fragments
                CSentItem Item;
                Item.pItem           = m_pCurrFrag->pTextStart;
                Item.ulItemLen       = m_pCurrFrag->ulTextLen;
                Item.ulItemSrcOffset = m_pCurrFrag->ulTextSrcOffset;
                Item.ulItemSrcLen    = Item.ulItemLen;
                Item.pXmlState       = &m_pCurrFrag->State;
                ItemList.AddTail( Item );
                fGoToNextFrag = true;
            }

            if( fGoToNextFrag )
            {
                fGoToNextFrag = false;
                m_pCurrFrag = m_pCurrFrag->pNext;
                if( m_pCurrFrag )
                {
                    m_pNextChar = m_pCurrFrag->pTextStart;
                    m_pEndChar  = m_pNextChar + m_pCurrFrag->ulTextLen;
                }
                else
                {
                    m_pNextChar = NULL;
                    m_pEndChar  = NULL;
                }
            }
        } // end while

        if( ItemList.IsEmpty() )
        {
            hr = S_FALSE;
        }
    }
    return hr;
} /* CTTSEngObj::GetNextSentence */

/*****************************************************************************
* IsSpace *
*---------*
*   Returns true if the character is a space, tab, carriage return, or line feed.
****************************************************************************/
static BOOL IsSpace( WCHAR wc )
{
    return ( ( wc == 0x20 ) || ( wc == 0x9 ) || ( wc == 0xD  ) || ( wc == 0xA ) );
}

/*****************************************************************************
* SkipWhiteSpace *
*----------------*
*   Returns the position of the next non-whitespace character.
****************************************************************************/
static const WCHAR* SkipWhiteSpace( const WCHAR* pPos )
{
    while( IsSpace( *pPos ) ) ++pPos;
    return pPos;
}

/*****************************************************************************
* FindNextToken *
*---------------*
*   Locates the next space delimited token in the stream
****************************************************************************/
static const WCHAR* 
    FindNextToken( const WCHAR* pStart, const WCHAR* pEnd, const WCHAR*& pNext )
{
    const WCHAR* pPos = SkipWhiteSpace( pStart );
    pNext = pPos;
    if( pNext == pEnd )
    {
        pPos = NULL;
    }
    else
    {
        while( *pNext && !IsSpace( *pNext ) )
        {
            if( ++pNext == pEnd )
            {
                //--- This can happen when a text fragment is
                //    tight up against a following xml tag.
                break;
            }
        }
    }
    return pPos;
} /* FindNextToken */

/*****************************************************************************
* SearchSet *
*-----------*
*   Finds the character in the specified array.
****************************************************************************/
BOOL SearchSet( WCHAR wc, const WCHAR* Set, ULONG Count, ULONG* pIndex )
{
    for( ULONG i = 0; i < Count; ++i )
    {
        if( wc == Set[i] )
        {
            *pIndex = i;
            return true;
        }
    }
    return false;
}

/*****************************************************************************
* CTTSEngObj::AddNextSentItem *
*-----------------------------*
*   Locates the next sentence item in the stream and adds it to the list.
*   Returns true if the last item added is the end of the sentence.
****************************************************************************/
BOOL CTTSEngObj::AddNextSentItem( CItemList& ItemList )
{
    //--- Get the token
    ULONG ulIndex;
    CSentItem Item;
    Item.pItem = FindNextToken( m_pNextChar, m_pEndChar, m_pNextChar );

    //--- This case can occur when we hit the end of a text fragment.
    //    Returning at this point will cause advancement to the next fragment.
    if( Item.pItem == NULL )
    {
        return false;
    }

    const WCHAR* pTrailChar = m_pNextChar-1;
    ULONG TokenLen = m_pNextChar - Item.pItem;

    //--- Split off leading punction if any
    static const WCHAR LeadItems[] = { L'(', L'\"', L'{', L'\'', L'[' };
    while( TokenLen > 1 )
    {
        if( SearchSet( Item.pItem[0], LeadItems, sp_countof(LeadItems), &ulIndex ) )
        {
            CSentItem LItem;
            LItem.pItem           = Item.pItem;
            LItem.ulItemLen       = 1;
            LItem.pXmlState       = &m_pCurrFrag->State;
            LItem.ulItemSrcLen    = LItem.ulItemLen;
            LItem.ulItemSrcOffset = m_pCurrFrag->ulTextSrcOffset +
                                    ( LItem.pItem - m_pCurrFrag->pTextStart );
            ItemList.AddTail( LItem );
            ++Item.pItem;
            --TokenLen;
        }
        else
        {
            break;
        }
    }

    //--- Get primary item insert position
    SPLISTPOS ItemPos = ItemList.AddTail( Item );

    //--- Split off trailing punction if any.
    static const WCHAR EOSItems[] = { L'.', L'!', L'?' };
    static const WCHAR TrailItems[] = { L',', L'\"', L';', L':', L')', L'}', L'\'', L']' };
    SPLISTPOS NextPos = NULL;
    BOOL fIsEOS = false;
    while( TokenLen > 1 )
    {
        BOOL fAddTrailItem = false;
        if( SearchSet( *pTrailChar, EOSItems, sp_countof(EOSItems), &ulIndex ) )
        {
            fIsEOS = true;
            fAddTrailItem = true;
        }
        else if( SearchSet( *pTrailChar, TrailItems, sp_countof(TrailItems), &ulIndex ) )
        {
            fAddTrailItem = true;
        }

        if( fAddTrailItem )
        {
            CSentItem TItem;
            TItem.pItem           = pTrailChar;
            TItem.ulItemLen       = 1;
            TItem.pXmlState       = &m_pCurrFrag->State;
            TItem.ulItemSrcLen    = TItem.ulItemLen;
            TItem.ulItemSrcOffset = m_pCurrFrag->ulTextSrcOffset +
                                    ( TItem.pItem - m_pCurrFrag->pTextStart );
            NextPos = ItemList.InsertAfter( ItemPos, TItem );
            --TokenLen;
            --pTrailChar;
        }
        else
        {
            break;
        }
    }

    //--- Abreviation or sentence end?
    //    If we are at the end of the buffer then EOS is implied.
    if( *m_pNextChar == NULL )
    {
        fIsEOS = true;
        if( !SearchSet( *(m_pNextChar-1), EOSItems, sp_countof(EOSItems), &ulIndex ) )
        {
            //--- Terminate with a period if we are at the end of a buffer
            //    and no end of sentence punction has been added.
            static const WCHAR* pPeriod = L".";
            CSentItem EOSItem;
            EOSItem.pItem           = pPeriod;
            EOSItem.ulItemLen       = 1;
            EOSItem.pXmlState       = &m_pCurrFrag->State;
            EOSItem.ulItemSrcLen    = EOSItem.ulItemLen;
            EOSItem.ulItemSrcOffset = m_pCurrFrag->ulTextSrcOffset +
                                    ( (m_pNextChar-1) - m_pCurrFrag->pTextStart );
            ItemList.AddTail( EOSItem );
        }
    }
    else if( pTrailChar[1] == L'.' )
    {
        //--- Here is where you would try to prove that it's not EOS
        //    It might be an abreviation. That's a hard problem that
        //    we are not going to attempt here.
    }
    
    //--- Substitute underscore for apostrophe
    for( ULONG i = 0; i < TokenLen; ++i )
    {
        if( Item.pItem[i] == L'\'' )
        {
            ((WCHAR)Item.pItem[i]) = L'_';
        }
    }

    //--- Add the main item
    if( TokenLen > 0 )
    {
        Item.ulItemLen       = TokenLen;
        Item.pXmlState       = &m_pCurrFrag->State;
        Item.ulItemSrcLen    = Item.ulItemLen;
        Item.ulItemSrcOffset = m_pCurrFrag->ulTextSrcOffset +
                               ( Item.pItem - m_pCurrFrag->pTextStart );
        ItemList.SetAt( ItemPos, Item );
    }

    return fIsEOS;
} /* CTTSEngObj::AddNextSentItem */

