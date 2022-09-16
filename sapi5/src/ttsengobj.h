/******************************************************************************
* TtsEngObj.h *
*-------------*
*  This is the header file for the sample CTTSEngObj class definition.
*------------------------------------------------------------------------------
*  Copyright (C) 1999 Microsoft Corporation         Date: 09/17/99
*  All Rights Reserved
*
******************************************************************************/
/*
 ***********************************************************************
 *                                                                      
 *                           Copyright (c)                              
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
 *    File Name:	TtsEngObj.h
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
 * 	002	MGS		07/20/2000		More Sapi 5 stuff 
 *	003	MGS		07/26/2000		More Stuff
 *	004	MGS		07/27/2000		Realtime Volume and Speaker selection
 *
 */





#ifndef TtsEngObj_h
#define TtsEngObj_h

#include "windows.h"

#include "dectalkf.h"
#include "defs.h"
#include "esc.h"
#include "kernel.h"
#include "cmd.h"
#include "samprate.h"
#include "tts.h"
// tek 05aug96 changes to allow freeing the PH thread data..
#include "ph_def.h"
// tek 29oct98 needed for the tuner data structure
#include "vtminst.h"


//--- Additional includes
#ifndef __TtsEng_h__
#include "ttseng.h"
#endif

#ifndef SPDDKHLP_h
#include <spddkhlp.h>
#endif

#ifndef SPCollec_h
#include <spcollec.h>
#endif

#include "resource.h"

#define MAX_PHONEMES 256
#define MAX_INDEX_MARKS 256
#define BUFFSIZ 50000

//=== Constants ====================================================

//=== Class, Enum, Struct and Union Declarations ===================

//=== Enumerated Set Definitions ===================================

//=== Function Type Definitions ====================================

extern "C"
{
  int  GetCurrentPitch(LPTTS_HANDLE_T phTTS, int *pitch);
  int GetDefaultPitch(LPTTS_HANDLE_T phTTS, int *pitch);
  int GetDefaultPitchRange(LPTTS_HANDLE_T phTTS, int *pitch_range);
}




//=== Class, Struct and Union Definitions ==========================

/*** CSentItem
*   This object is a helper class
*/
class CSentItem
{
  public:
    CSentItem() { memset( this, 0, sizeof(*this) ); }
    CSentItem( CSentItem& Other ) { memcpy( this, &Other, sizeof( Other ) ); }

  /*--- Data members ---*/
    const SPVSTATE* pXmlState;
    LPCWSTR         pItem;
    ULONG           ulItemLen;
    ULONG           ulItemSrcOffset;        // Original source character position
    ULONG           ulItemSrcLen;           // Length of original source item in characters
};

typedef CSPList<CSentItem,CSentItem&> CItemList;


class sentence_c
{
public:
	sentence_c() { memset( this, 0, sizeof(*this) );  }
    sentence_c( sentence_c& Other ) { memcpy( this, &Other, sizeof( Other ) ); }
	~sentence_c() { if (text!=NULL) free(text); }
	
	SPVSTATE		*pXmlState;
	int				sentence_number;
	unsigned char	*text;
	int				textlength;
	int				textsrclength;
	int				textsrcoffset;
};

typedef CSPList<sentence_c,sentence_c&> sentence_t;



/*** CTTSEngObj COM object ********************************
*/
class ATL_NO_VTABLE CTTSEngObj : 
	public CComObjectRootEx<CComMultiThreadModel>,
	public CComCoClass<CTTSEngObj, &CLSID_DECtalkPaulUS>,
	public ISpTTSEngine,
    public ISpObjectWithToken
{
  /*=== ATL Setup ===*/
  public:
    DECLARE_REGISTRY_RESOURCEID(IDR_SAMPLETTSENGINE)
    DECLARE_PROTECT_FINAL_CONSTRUCT()

    BEGIN_COM_MAP(CTTSEngObj)
	    COM_INTERFACE_ENTRY(ISpTTSEngine)
	    COM_INTERFACE_ENTRY(ISpObjectWithToken)
    END_COM_MAP()

  /*=== Methods =======*/
  public:
    /*--- Constructors/Destructors ---*/
    HRESULT FinalConstruct();
    void FinalRelease();

  /*=== Interfaces ====*/
  public:
    //--- ISpObjectWithToken ----------------------------------
    STDMETHODIMP SetObjectToken( ISpObjectToken * pToken );
    STDMETHODIMP GetObjectToken( ISpObjectToken ** ppToken )
        { return SpGenericGetObjectToken( ppToken, m_cpToken ); }


    //--- ISpTTSEngine --------------------------------------------
    STDMETHOD(Speak)( DWORD dwSpeakFlags,
                      REFGUID rguidFormatId, const WAVEFORMATEX * pWaveFormatEx,
                      const SPVTEXTFRAG* pTextFragList, ISpTTSEngineSite* pOutputSite );
    STDMETHOD(GetOutputFormat)( const GUID * pTargetFormatId, const WAVEFORMATEX * pTargetWaveFormatEx,
                                GUID * pDesiredFormatId, WAVEFORMATEX ** ppCoMemDesiredWaveFormatEx );


  private:
    /*--- Non interface methods ---*/
    HRESULT MapFile(const WCHAR * pszTokenValName, HANDLE * phMapping, void ** ppvData );
    HRESULT GetNextSentence( CItemList& ItemList );
    BOOL    AddNextSentItem( CItemList& ItemList );
    HRESULT OutputSentence( CItemList& ItemList, ISpTTSEngineSite* pOutputSite );
	int		build_sentence_list(const SPVTEXTFRAG *pTextFragList,DWORD last_actions);
	int	    encode_state_change(SPVSTATE *cur_state,SPVSTATE *prev_state,unsigned char *insert_array,int insert_array_max,DWORD last_actions);
	int encode_rate(int in_rate);
	int encode_pitch(int in_pitch);
	int encode_pitch_range(int in_pitch);
	
  /*=== Member Data ===*/
  public:
    CComPtr<ISpObjectToken> m_cpToken;
    HANDLE                  m_hVoiceData;
    void*                   m_pVoiceData;
    //--- Voice (word/audio data) list
    //  Note: You will probably have something more sophisticated here
    //        we are just trying to keep it simple for the example.
    VOICEITEM*          m_pWordList;
    ULONG               m_ulNumWords;

    //--- Working variables to walk the text fragment list during Speak()
    const SPVTEXTFRAG*  m_pCurrFrag;
    const WCHAR*        m_pNextChar;
    const WCHAR*        m_pEndChar;
    ULONGLONG           m_ullAudioOff;

	// DECtalk variables
	LPTTS_HANDLE_T		m_phTTS;
	unsigned int		m_bufferMsgID;
	ISpTTSEngineSite*	m_pOutputSite;
	unsigned int		m_got_index_32000;
	unsigned int		m_CurrentFormat;
	int					m_MlEngineNumber;
	sentence_t			sentence_list;
	int					m_return_buffer;
	int					m_output_is_text;
	UINT uiID_Error_Message;
	UINT uiID_Index_Message;
	UINT uiID_Buffer_Message;
	UINT uiID_Bookmark_Message;	//tek 01aug97 bats 404
	UINT uiID_Wordpos_Message;	//tek 01aug97 bats 404
	UINT uiID_Start_Message;	//tek 01aug97 bats 404
	UINT uiID_Stop_Message;	//tek 01aug97 bats 404
	UINT uiID_Visual_Message;	//tek 27aug97 visual support
	UINT uiID_Sentence_Message;
	CSpEvent CurEvent;
	volatile int m_abort_from_audio;
	volatile DWORD m_current_sentence_number;
	ULONGLONG m_event_interest;
	volatile int CurrentRealtimeRate;
	volatile int CurrentRealtimeRateDelta;
	volatile int CurrentRealtimeVolume;
	volatile int CurrentRealtimeVolumeDelta;
	int m_CurrentSpeaker;
	volatile int SkipToSentence;
	volatile int NumberSkipped;


};

#endif //--- This must be the last line in the file
