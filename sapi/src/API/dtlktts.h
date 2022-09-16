/************************************************************************
dtlkTTS.h - Header for DECtalk engine code.

Copyright 1994 by Microsoft corporation.
Copyright 1995-1998 Digital Equipment COrporation.
All rights reserved.
*/

// tek 26aug96		Changes to support RTLICENSEKEY for Willow Pond et al
// tek 01may97		licensing changes
// tek 07aug97		qw time for SAPI
// tek 14aug97		notifications, wordpos, etc
// tek 12nov97		merge in the above aug97 fixes (mostly
//					turns out to be datastructure and class-member
//					updates
// mgs 02feb98		added support for more tags
// tek	09mar98		sapi backend timing (group h)
// tek	16mar98		bats608/609/620: audio formats
// cjl  18mar98         Removed specific path for dectalkf.h.
// tek	08jun98		sapi dialogs: remove BOOKMARK
// tek	11Sep98		add m_bDoNotNotify flag for dialogs..
// tek	14sep98		add PeekAndPump()
// tek	30seo98		add reference-vount member vars for ANSI classes
// tek	09jan99		bats850: add member PeekAndPump to CMode

/************************************************************************
Random stuff
*/

#include "dectalkf.h"

#ifdef _AFXDLL	// tek 08jun98 sapi dialogs and mfc
#include "stdafx.h"
#include "resource.h"
#else //_AFXDLL
#include <windows.h>
#endif //_AFXDLL

#include "ctools.h"
#include <olectl.h>
//#include <olectlid.h>
#include <mmsystem.h> // tek 08jun98 tts.h needs this..
// tek 15aug97 need to pick up some structure defs in tts.h
extern "C" {
#include "tts.h"
}

#ifndef _DESTROY_
#define _DESTROY_
typedef void (FAR PASCAL *LPFNDESTROYED) (void);
#endif 

/* mode (voice) constants tek 26feb97 */
#define  NUMTTSMODES         9   // MVP: nine voices  of DECTalk to enumerate

#define  TTSMODE_PAUL        0
#define  TTSMODE_BETTY       1
#define  TTSMODE_HARRY       2
#define  TTSMODE_FRANK       3
#define  TTSMODE_DENNIS      4
#define  TTSMODE_KIT         5
#define  TTSMODE_URSULA      6
#define  TTSMODE_RITA        7
#define  TTSMODE_WENDY       8




extern DWORD       gEngObjectCount;    // number of objects existing
extern HINSTANCE   ghInstance;         // DLL library instance
// tek 08jun98 this is a spurious, old bit of data
//extern DWORD 	   BOOKMARK;		   // MVP : Bookmark
/************************************************************************
Class factory object
*/

#ifndef ACI_LICENSE
// this stuff should be romoved for everybody; it is wrong.
#ifdef RTLICENSEKEY
EXTERN_C const IID IID_IClassFactory2;
class CEngineClassFactory : public IClassFactory2 {
#else
class CEngineClassFactory : public IClassFactory {
#endif //RTLICENSEKEY
#endif //ACI_LICENSE

   protected:

      ULONG    m_cRef;  // Reference count on class object

   public:

      CEngineClassFactory(void);
      ~CEngineClassFactory(void);

// IUnknown menebers

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

// TTSManagerClassFactory members

      STDMETHODIMP         CreateInstance (LPUNKNOWN, REFIID, LPVOID FAR *);
      STDMETHODIMP         LockServer (BOOL);

#ifndef ACI_LICENSE
// this is all junk.
/* 31mar97 - ncs
	Non-usable stuff.  Getting rid of them
MAYBE
*/
	
#ifdef RTLICENSEKEY
      //IClassFactory2 members
      STDMETHODIMP GetLicInfo(LPLICINFO);
      STDMETHODIMP RequestLicKey(DWORD, BSTR *);
      STDMETHODIMP CreateInstanceLic(LPUNKNOWN, LPUNKNOWN, REFIID
	    	, BSTR, LPVOID *);
#endif //RTLICENSEKEY
#endif //ACI_LICENSE
/* To here -ncs- */

   };

typedef CEngineClassFactory FAR * PCEngineClassFactory;



/************************************************************************
Enumerator Object
*/

// CEngITTSEnum interface

class CEngITTSEnumW : public ITTSEnumW {

   private:

      ULONG          m_cRef;        // interface reference count
      LPVOID         m_pObj;        // Back pointer to the object
      LPUNKNOWN      m_punkOuter;   // Controlling unknown for delegation

   public:

      CEngITTSEnumW (LPVOID, LPUNKNOWN);
      ~CEngITTSEnumW (void);

      FInit(LPVOID, LPUNKNOWN);

// IUnkown members that delegate to m_punkOuter
// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

// ITTSFind

      STDMETHODIMP Next (ULONG, PTTSMODEINFOW, ULONG *);
      STDMETHODIMP Skip (ULONG);
      STDMETHODIMP Reset (void);
      STDMETHODIMP Clone (ITTSEnumW * FAR *);
      STDMETHODIMP Select (GUID, PITTSCENTRALW *, LPUNKNOWN);
   };

typedef CEngITTSEnumW * PCEngITTSEnumW;


class CEngITTSEnumA : public ITTSEnumA {

   private:

      LPVOID         m_pObjA;        // Back pointer to the (A..) object
      ULONG          m_cRef;        // tek 18sep98 need interface reference count

   public:

      CEngITTSEnumA (LPVOID, LPUNKNOWN);
      ~CEngITTSEnumA (void);

// IUnkown members that delegate to m_punkOuter
// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

// ITTSFind

      STDMETHODIMP Next (ULONG, PTTSMODEINFOA, ULONG *);
      STDMETHODIMP Skip (ULONG);
      STDMETHODIMP Reset (void);
      STDMETHODIMP Clone (ITTSEnumA * FAR *);
      STDMETHODIMP Select (GUID, PITTSCENTRALA *, LPUNKNOWN);
   };

typedef CEngITTSEnumA * PCEngITTSEnumA;



// CEngineEnum class - TTS engine enumeration class

class CEngineEnum : public IUnknown {

// interfaces are friends

   friend class CEngITTSEnumW;
   friend class CEngITTSEnumA;

   protected:

      ULONG           m_cRef;              // reference count (# I.F.'s opened)
      LPUNKNOWN       m_punkOuter;         // controlling unknown for aggregation
      LPFNDESTROYED   m_pfnDestroy;        // function call on closure
      PCEngITTSEnumW  m_pEngITTSEnumW;     // Enumeration interface class
      PCEngITTSEnumA  m_pEngITTSEnumA;     // Enumeration interface class
      DWORD           dwCurrentEnumPosn;   // Current position for next, skip

   public:

      CEngineEnum (LPUNKNOWN, LPFNDESTROYED);
      ~CEngineEnum (void);

      BOOL FInit (void);

// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);
   };

typedef CEngineEnum * PCEngineEnum;



/************************************************************************
TTS-mode object
*/

/* Mode notification object */

class CModeNotify : public IAudioDestNotifySink {

   private:

      void *         m_pObj;        // CMode object
	  unsigned int	 m_iRefCnt;		// ref count (tek 25feb97)

   public:

      CModeNotify (void * pObj);
      ~CModeNotify (void);

// IUnkown members that delegate to m_punkOuter
// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

// IAudioDestNotifySink

      STDMETHODIMP AudioStop   (WORD);
      STDMETHODIMP AudioStart   (void);
      STDMETHODIMP FreeSpace  (DWORD, BOOL);
      STDMETHODIMP BookMark   (DWORD, BOOL);
   };

typedef CModeNotify * PCModeNotify;



// IAttributesW interface for engines
// A CModeITTSAttributesA inteface is not needed yet but given anyway.

class CModeITTSAttributesW : public ITTSAttributesW {

   private:

      ULONG          m_cRef;        // interface reference count
      LPVOID         m_pObj;        // Back pointer to the object
      LPUNKNOWN      m_punkOuter;   // Controlling unknown for delegation

   public:

      CModeITTSAttributesW (LPVOID, LPUNKNOWN);
      ~CModeITTSAttributesW (void);

      FInit(LPVOID, LPUNKNOWN);

// IUnkown members that delegate to m_punkOuter
// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

// ITTSAttributes members

      STDMETHODIMP PitchGet (WORD *);
      STDMETHODIMP PitchSet (WORD);
      STDMETHODIMP RealTimeGet (DWORD *);
      STDMETHODIMP RealTimeSet (DWORD);
      STDMETHODIMP SpeedGet (DWORD *);
      STDMETHODIMP SpeedSet (DWORD);
      STDMETHODIMP VolumeGet(DWORD *);
      STDMETHODIMP VolumeSet(DWORD);
   };

typedef CModeITTSAttributesW * PCModeITTSAttributesW;


class CModeITTSAttributesA : public ITTSAttributesA {

   private:
      ULONG          m_cRef;        // tek 18sep98 interface reference count
      LPVOID         m_pObjA;        // Back pointer to the (A..) object

   public:

      CModeITTSAttributesA (LPVOID, LPUNKNOWN);
      ~CModeITTSAttributesA(void);

// IUnkown members that delegate to m_punkOuter
// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

// ITTSAttributes members

      STDMETHODIMP PitchGet (WORD *);
      STDMETHODIMP PitchSet (WORD);
      STDMETHODIMP RealTimeGet (DWORD *);
      STDMETHODIMP RealTimeSet (DWORD);
      STDMETHODIMP SpeedGet (DWORD *);
      STDMETHODIMP SpeedSet (DWORD);
      STDMETHODIMP VolumeGet(DWORD *);
      STDMETHODIMP VolumeSet(DWORD);
   };

typedef CModeITTSAttributesA * PCModeITTSAttributesA;



// ITTSCentral interface for engines

class CModeITTSCentralW : public ITTSCentralW {

	friend class CMode;
   private:

      volatile ULONG m_cRef;        // interface reference count
      LPVOID         m_pObj;        // Back pointer to the object
      LPUNKNOWN      m_punkOuter;   // Controlling unknown for delegation

   public:

      CModeITTSCentralW (LPVOID, LPUNKNOWN);
      ~CModeITTSCentralW (void);

      FInit(LPVOID, LPUNKNOWN);

// IUnkown members that delegate to m_punkOuter
// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

// ITTSCentral members

      STDMETHODIMP Inject         (PCWSTR);
      STDMETHODIMP ModeGet        (PTTSMODEINFOW);
      STDMETHODIMP Phoneme        (VOICECHARSET, DWORD, SDATA, PSDATA);
      STDMETHODIMP PosnGet        (PQWORD);
      STDMETHODIMP TextData       (VOICECHARSET, DWORD, SDATA, PVOID, IID);
      STDMETHODIMP ToFileTime     (PQWORD, FILETIME *);
      STDMETHODIMP AudioPause     (void);
      STDMETHODIMP AudioResume    (void) ;
      STDMETHODIMP AudioReset     (void);
      STDMETHODIMP Register       (PVOID, IID, DWORD*);
      STDMETHODIMP UnRegister     (DWORD);
   };

typedef CModeITTSCentralW * PCModeITTSCentralW;


class CModeITTSCentralA : public ITTSCentralA {

   private:

	  volatile ULONG m_cRef;
      LPVOID         m_pObjA;        // Back pointer to the (A..) object

   public:

      CModeITTSCentralA (LPVOID, LPUNKNOWN);
      ~CModeITTSCentralA (void);

// IUnkown members that delegate to m_punkOuter
// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

// ITTSCentral members

      STDMETHODIMP Inject     (PCSTR);
      STDMETHODIMP ModeGet    (PTTSMODEINFOA);
      STDMETHODIMP Phoneme    (VOICECHARSET, DWORD, SDATA, PSDATA);
      STDMETHODIMP PosnGet    (PQWORD);
      STDMETHODIMP TextData   (VOICECHARSET, DWORD, SDATA, PVOID, IID);
      STDMETHODIMP ToFileTime (PQWORD, FILETIME *);
      STDMETHODIMP AudioPause (void);
      STDMETHODIMP AudioResume(void) ;
      STDMETHODIMP AudioReset (void);
      STDMETHODIMP Register   (PVOID, IID, DWORD*);
      STDMETHODIMP UnRegister (DWORD);
   };

typedef CModeITTSCentralA * PCModeITTSCentralA;



// ITTSDialogs interface for engines

class CModeITTSDialogsW : public ITTSDialogsW {

   private:

      ULONG          m_cRef;        // interface reference count
      LPVOID         m_pObj;        // Back pointer to the object
      LPUNKNOWN      m_punkOuter;   // Controlling unknown for delegation

   public:

      CModeITTSDialogsW (LPVOID, LPUNKNOWN);
      ~CModeITTSDialogsW (void);

      FInit(LPVOID, LPUNKNOWN);

// IUnkown members that delegate to m_punkOuter
// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

// ITTSDialogs members

      STDMETHODIMP AboutDlg      (HWND, PCWSTR);
      STDMETHODIMP LexiconDlg    (HWND, PCWSTR);
      STDMETHODIMP GeneralDlg    (HWND, PCWSTR);
      STDMETHODIMP TranslateDlg  (HWND, PCWSTR);
   };

typedef CModeITTSDialogsW * PCModeITTSDialogsW;


class CModeITTSDialogsA : public ITTSDialogsA {

   private:

      LPVOID         m_pObjA;        // Back pointer to the (A..) object
      ULONG          m_cRef;        // tek 18sep98 interface reference count

   public:

      CModeITTSDialogsA (LPVOID, LPUNKNOWN);
      ~CModeITTSDialogsA (void);

// IUnkown members that delegate to m_punkOuter
// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

// ITTSDialogs members

      STDMETHODIMP AboutDlg      (HWND, PCSTR);
      STDMETHODIMP LexiconDlg    (HWND, PCSTR);
      STDMETHODIMP GeneralDlg    (HWND, PCSTR);
      STDMETHODIMP TranslateDlg  (HWND, PCSTR);
   };

typedef CModeITTSDialogsA * PCModeITTSDialogsA;


extern "C"
{
#include "tts.h"
#ifndef ACI_LICENSE
#ifdef WILLOWPOND
#include "idec.h"
#endif
#endif //ACI_LICENSE
//  #include "ttsapi.h"
}


// CMode class - TTS engine mode

class CMode : public IUnknown {

// interfaces are friends

   friend class CModeITTSAttributesW;
   friend class CModeITTSAttributesA;
   friend class CModeITTSCentralW;
   friend class CModeITTSCentralA;
   friend class CModeITTSDialogsW;
   friend class CModeITTSDialogsA;
   friend class CModeNotify;
   friend class CEngITTSEnumW;
   friend class CGeneralDialog;	// tek 08jun98 to get at the engine info
   friend class CLexiconDialog;	// tek 20aug98 to get at the AudioReset
   friend class CDialogSpeak; // tek 31aug98 

#ifdef WILLOWPOND
   friend class CEngUnlock;
#endif // WILLOWPOND

   public:
      LPTTS_HANDLE_T        m_pDECtalk;               // Handle to DECtalk
		DWORD				m_dwSpeaker;
		BOOL				m_bDoNotNotify;			  // tek 20aug98 inhibit notification callbacks
   protected:

	  int                   m_iShutdownCount;         // Counter used to delay shutdown.
	  HWND                  m_hModeWnd;               // Hidden window for engine
      ULONG                 m_cRef;                   // ref count (# I.F's opened)
      LPUNKNOWN             m_punkOuter;              // controlling unknown for aggr.
      LPFNDESTROYED         m_pfnDestroy;             // function call on closure
      PCModeITTSAttributesW m_pModeITTSAttributesW;   // Attreibutes class
      PCModeITTSAttributesA m_pModeITTSAttributesA;   // Attreibutes class
      PCModeITTSCentralW    m_pModeITTSCentralW;      // Central control class
      PCModeITTSCentralA    m_pModeITTSCentralA;      // Central control class
      PCModeITTSDialogsW    m_pModeITTSDialogsW;      // Dialogs class
      PCModeITTSDialogsA    m_pModeITTSDialogsA;      // Dialogs class
      LPUNKNOWN             m_pAudioIUnknown;         // unknown for the audio
      PIAUDIO               m_pAudioIAudio;           // to get audio information from
      PIAUDIODEST           m_pAudioIAudioDest;       // to get audio information from
      PCModeNotify          m_pNotify;                // notify sink object
      WORD                  m_wPitch;                 // Pitch
      DWORD                 m_dwRealTime;             // real-time value
      DWORD                 m_dwSpeed;                // Speed
      DWORD                 m_dwVolume;               // Volume
      TTSMODEINFOW          m_TTSModeInfo;            // Stores the selected mode
// Current speaking state
      BOOL                  m_fClaimed;               // TRUE if wave device claimed
      BOOL                  m_fPaused;                // TRUE if app has called pause
      BOOL                  m_fDataPending;           // TRUE if data is pending
#ifdef SAPI_GROUP_H_TIMING
	  BOOL					m_fStarted;				  // TRUE if we've started after a ::Claim
	  QWORD					m_qwBaseAudioPosition;	  // position on Open.
#endif // SAPI_GROUP_H_TIMING

	// MVP: The following elements are added for 
	// the interface between low-level DECtalk and 
	// audio-destination object in OLE-DECtalk application
	  // tek 16mar98 BATS 608/609/620
	  // m_bAudioDriver no longer exists. It is replaced
	  // by m_bAudioIsEightBit and m_bAudioIsMulaw. The 
	  // allowed states are:
	  //  EightBit		Mulaw		Allowed?
	  //	T			  T			 yes
	  //	T			  F			 yes
	  //	F			  T			 NO
	  //	F			  F			 yes
	  BOOL		m_bAudioIsEightBit;
	  BOOL		m_bAudioIsMulaw;

	  DWORD   m_dwAudioDestObjectBufferLength;		  // Audio-destination object's
	  												  // internal memory size
	  volatile BOOL	  m_bTextDataDoneFlag;					  //MVP 03/20/96

#if 0 // tek 20aug97 We should no longer need this crud, because 
	  // the maintenance of the bufnotify sinnks is done synchronously
	  // by start/stop marks AND sequence numbers.
// The following pair of lists is a quick and dirty way to effect a
// list of Texts + associated IDs (as opposed to a list of structs
// which include a text and an ID each).  I.e. the lists are always
// maintained in parallel.

      PCList         m_pTextList;                  // list of text objects
      PCList         m_pIDList;                    // companion of TextList, lists ofIDs, use BUFLIST structre
#endif //0
// 'currently speaking' means speech is lined up to speak but not necessarily
// that sound is coming out the audio componant.

      BOOL           m_fSpeaking;                  // TRUE if currently speaking

	DWORD			 m_dwSequenceNumber;				// tek 13aug97 for keeping track of TextData buffers
	CRITICAL_SECTION m_csSequenceNumber;			// two threads use this..
	DWORD			 m_dwPlayingSequenceNumber;		// the last TextDataStarted sequence we saw

	// tek 15aug97 re-engineered this notification stuff..
	PBUFNOTIFYLIST	 m_pbnlBufNotifyList;			// where we keep the BufNotifySink info for each TextData
	PNOTIFYLIST		 m_pnlNotifyList;					// where we keep the registered NotifySink(s)
	PITTSBUFNOTIFYSINK GetBufNotifySink(DWORD SequenceNumber);
	PITTSBUFNOTIFYSINK GetFirstBufNotifySink(DWORD *SequenceNumber);
	void			 FreeBufNotifySink(DWORD SequenceNumber);
	HRESULT			 SetBufNotifySink(PITTSBUFNOTIFYSINK, DWORD SequenceNumber);
	void			 InitBufNotifySinkList(void);
	void			 FreeAllBufNotifySinks(void);

      void           Output (PSTR);                // Output string to edit window
      BOOL           Get1Char       (CHAR *);      // 1 ch fm list to screen 
      void           Print1Char     (HWND, CHAR);  // 1 ch fm list to screen
      STDMETHODIMP   DataAvailable  (DWORD, BOOL);
      HRESULT        SpeakIfNecessary(void);
      HRESULT        SendAudioIfCan (void);
	  BOOL			 PeekAndPump(void);				// tek 08jan99 bats850 



#ifdef WILLOWPOND
	  PCEngUnlock	m_pEngUnlock; // willow pond RT locking
	  BOOL			bUnlocked;
#endif // WILLOWPOND
   public:
	// tek 22aug97 we use these in a few places, so we might was well keep them around..
	UINT			m_uiBookMarkMessage;
	UINT			m_uiWordPosMessage;
	UINT			m_uiStartMessage;
	UINT			m_uiStopMessage;	
	UINT			m_uiVisualMessage;


   public:

      CMode (LPUNKNOWN, LPFNDESTROYED, LPUNKNOWN);

// BUGBUG: Need more stuff here

      ~CMode (void);

      BOOL FInit (void);
/***************************************************************************/
// MVP : The following member functions are added for the implementation
// of audio-destination object for the DECtalk speech engine.
	  HRESULT ProcessAudio(void);
	  HRESULT OpenAudioDevice(void);
	  void SetAudioSampleOutFormat(void);
	  INT SendAudioToDestinationBuffer(INT);
	  void SendMoreAudioSamplesOnNotifyFreeSpace(DWORD);
      void PrepareRingBufferToSendSamples(LPAUDIO_PARAMS_T);
	  UINT WriteBufferToWaveDevice( LPAUDIO_PARAMS_T,UINT);
	  void DestroyAudioObjects(void);
	  void DECPauseAudio(void);
	  void DECResumeAudio(void);
	  void DECAudioReset(void);
	  void DECGetAudioVolume(LPDWORD);
	  void DECSetAudioVolume(DWORD);
	  void DECGetAudioPosition(LPDWORD);
	  void DECGetQWAudioPosition(QWORD *pqwPosition); //07aug97 tek QW time support	  
	  HRESULT DECSetBookmark(DWORD dwMarkId);	// tek 22aug97 bookmark sink timing
	  void DECGetAudioParams(LPWAVEFORMATEX);
	  MMRESULT DECSetAudioParams(LPWAVEFORMATEX);
	  
	  // MVP :03/11/96 Bookmarks implementation
	  void NotifyBookMarks(PMARK_DATA);
	  void NotifyWordPosition(PMARK_DATA);
	  
	  //tek 15aug97 start/stop messages
	  void ProcessStartMessage(PMARK_DATA);
	  void ProcessStopMessage(PMARK_DATA);

	  friend void InitializeSpeaker(CMode * ,UINT,const char *);
	  void ModeShutdown(void);
/***************************************************************************/

// Non-delegating object IUnknown

      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

      HWND           hWndMain;      // main window
      HWND           hWndEdit;      // edit control window
      PCList         m_pNotifyList;
   };

typedef CMode * PCMode;


// MVP: 03/12/96 The declaration of BUFLIST structure is copied from
//	dtlktts.cpp. (This structure definition is used in auddest.cpp)

typedef struct {
	PITTSBUFNOTIFYSINKW pSinkW;
	// BUGBUG: Have a pSinkA here also, mutually exclusive of pSinkW
	DWORD                       dwNotifiedStart;
	} BUFLIST, *PBUFLIST;
 

// a couple local helper functions for converting in and out of an _int64:

void FileTimeToInt64(LPFILETIME pft, _int64 *pI);
void Int64ToFileTime(_int64 *pI, LPFILETIME pft);

// tek 14sep98
// the helper function to pump messages while waiting for something..
//BOOL PeekAndPump(); // tek 08jan98 this is now a member of CMode.
