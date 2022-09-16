#ifndef __fonixcore_h
#define __fonixcore_h

#include "FonixAudioIn.h"
#include "FonixAudioOut.h"

#ifndef bool
#define bool int
#endif

#define FNX_MF_STATIC                   (0x0001)
#define FNX_MF_WRITING                  (0x0002)
#define FNX_MF_MAXFILES                 64

#define UserFunctionsDllName           "UserFunctions"
#define UserFunctionsDllInitializeName "UserFunctionsInitialize"
#define UserFunctionsDllCleanupName    "UserFunctionsCleanup"

typedef void * FnxCore;

typedef struct
{
    int  flags;
    int  len;
    char *pName;
    char *pAddr;
} FnxMemFileMapping;

typedef void * FnxUserFunctionData;
typedef int (*FnxUserFunction)( FnxUserFunctionData, char * szFunctionParam, char * szWordList );
typedef FnxUserFunctionData (*FnxUserFunctionsInitializeProc)( FnxCore );
typedef void (*FnxUserFunctionsCleanupProc)( FnxUserFunctionData );

typedef void * FnxTtsProcData;
typedef int (*FnxTtsProc)( FnxCore, FnxTtsProcData, char * szText );

typedef struct
{
    FnxUserFunction function;
    char * szFunctionName;
} FnxUserFunctionMapping;

typedef enum
{
    FnxAsrTypeGeneral,
    FnxAsrTypeDigit
} FnxAsrType;

typedef enum
{
    FnxFlowControlRun,
    FnxFlowControlStep,
    FnxFlowControlPause,
    FnxFlowControlAbort
} FnxFlowControl;

typedef enum
{
    FnxLanguageIdEnglish,
    FnxLanguageIdGerman,
    FnxLanguageIdJapanese
} FnxLanguageId;

#if defined(__cplusplus)
extern "C" {
#endif

#if defined(WIN32) || defined(_WIN32) || defined(_WIN32_WCE)
#define export(a,b) __declspec(dllexport) a b
#else
#define export(a,b) a b
#endif


/* FnxCore creation/destruction */
export( FnxCore, FnxCoreCreate() );
export( int,     FnxCoreGetApiVersion() );
export( int,     FnxCoreWriteFile( FnxCore, char * szPath ) );
export( int,     FnxCoreWriteMemFiles( FnxCore, char * szPath ) );
export( FnxCore, FnxCoreReadFile( char * szFile, char * szError, int errLen ) );
export( FnxCore, FnxCoreReadMemory( FnxMemFileMapping *, char * szError, int errLen ) );
export( void,    FnxCoreDestroy( FnxCore ) );

/* Error handling */
export( int,     FnxCoreGetError( FnxCore, char * szError, int errLen) );

/* FnxCore settings */
export( void,    FnxCoreSetSharedPath( FnxCore, char * szPath ) );
export( void,    FnxCoreSetProjectPath( FnxCore, char * szPath ) );
export( int,     FnxCoreSetGeneralNNetFile( FnxCore, char * szFile, bool optimizeSpeed ) );
export( int,     FnxCoreSetDigitNNetFile( FnxCore, char * szFile ) );
export( void,    FnxCoreSetRejectionStrength( FnxCore, int rejectionStrength ) );
export( void,    FnxCoreSetBeepOnRecognition( FnxCore, bool beep ) );
export( void,    FnxCoreSetSayInputErrors( FnxCore, bool sayErrors ) );
export( void,    FnxCoreSetReplayInput( FnxCore, bool replayInput ) );
export( void,    FnxCoreSetTtsSayRecognized( FnxCore, bool sayRecognized ) );
export( void,    FnxCoreSetDisableRejection( FnxCore, bool disableRejection ) );
export( int,     FnxCoreSetTtsFile( FnxCore, char * szFile, FnxLanguageId ) );
export( void,    FnxCoreSetTtsProc( FnxCore, FnxTtsProc, FnxTtsProcData ) );
export( void,    FnxCoreSetWaveInput( FnxCore, int numWaves, char ** ppWaveList ) );
export( void,    FnxCoreSetName( FnxCore, char * szName ) );
export( void,    FnxCoreSetFirstNodeId( FnxCore, int nodeId ) );
export( int,     FnxCoreSetAsrDictionaryFile( FnxCore, char * szFile ) );
export( int,     FnxCoreSetAsrRulesFile( FnxCore, char * szFile ) );
export( int,     FnxCoreSetAsrSuffixFile( FnxCore, char * szFile ) );
export( void,    FnxCoreSetNBest( FnxCore, int nbest ) );

export( char *,  FnxCoreGetSharedPath( FnxCore ) );
export( char *,  FnxCoreGetProjectPath( FnxCore ) );
export( char *,  FnxCoreGetNNetConfiguration( FnxCore, FnxAsrType asrType, int * pSampleRate, int * pLayers, int * pNumLayers, char * szExtension ) );
export( int,     FnxCoreGetRejectionStrength( FnxCore ) );
export( bool,    FnxCoreGetBeepOnRecognition( FnxCore ) );
export( bool,    FnxCoreGetSayInputErrors( FnxCore ) );
export( bool,    FnxCoreGetReplayInput( FnxCore ) );
export( bool,    FnxCoreGetTtsSayRecognized( FnxCore ) );
export( bool,    FnxCoreGetDisableRejection( FnxCore ) );
export( char *,  FnxCoreGetTtsFile( FnxCore, FnxLanguageId * language ) );
export( char **, FnxCoreGetWaveInput( FnxCore, int * numWaves ) );
export( char *,  FnxCoreGetName( FnxCore ) );
export( char *,  FnxCoreGetAsrDictionaryFile( FnxCore ) );
export( char *,  FnxCoreGetAsrRulesFile( FnxCore ) );
export( char *,  FnxCoreGetAsrSuffixFile( FnxCore ) );
export( int,     FnxCoreGetNBest( FnxCore ) );

/* Phoneme creation/destruction */
export( char**,  FnxCoreCreateAsrPhonemes( FnxCore, int numWords, char ** ppWords ) );
export( void,    FnxCoreDestroyAsrPhonemes( FnxCore, int numWords, char ** ppPhonemes ) );

/* Node creation/destruction */
export( int,     FnxCoreCreateWordNode( FnxCore, char * szNodeName, int numWords, char ** ppWords ) );
export( int,     FnxCoreCreateKeyWordNode( FnxCore, char * szNodeName, int numWords, char ** ppWords ) );
export( int,     FnxCoreCreateGrammarNode( FnxCore, char * szNodeName, char * szGrammar ) );
export( int,     FnxCoreCreateDigitNode( FnxCore, char * szNodeName, char * szGrammar ) );
export( int,     FnxCoreCreateEmptyNode( FnxCore, char * szNodeName ) );
export( void,    FnxCoreDestroyNodes( FnxCore ) );

/* Node settings */
export( void,    FnxCoreSetNodeName( FnxCore, int nodeId, char * szNodeName ) );
export( void,    FnxCoreSetNodeRejectionStrength( FnxCore, int nodeId, int rejectionStrength ) );
export( void,    FnxCoreSetNodeTrailingSilence( FnxCore, int nodeId, int trailingSilence ) );
export( void,    FnxCoreSetNodeLeadingSilence( FnxCore, int nodeId, int leadingSilence ) );
export( void,    FnxCoreSetNodeMaximumRecord( FnxCore, int nodeId, int maximumRecord ) );
export( void,    FnxCoreSetNodeNextStates( FnxCore, int nodeId, int * pNext ) );
export( void,    FnxCoreSetNodeWordMessages( FnxCore, int nodeId, char ** ppMessages ) );
export( void,    FnxCoreSetNodeEntryFunction( FnxCore, int nodeId, char * szFunctionName, char * szFunctionParam ) );
export( void,    FnxCoreSetNodeExitFunction( FnxCore, int nodeId, char * szFunctionName, char * szFunctionParam ) );
export( void,    FnxCoreSetNodePrompt( FnxCore, int nodeId, char * szPrompt ) );
export( void,    FnxCoreSetNodeErrorMessage( FnxCore, int nodeId, char * szErrorMessage ) );
export( void,    FnxCoreSetNodeActivePercent( FnxCore, int nodeId, int activePercent ) );

export( char *,  FnxCoreGetNodeName( FnxCore, int nodeId ) );
export( int,     FnxCoreGetNodeId( FnxCore, char * szNodeName ) );
export( int,     FnxCoreGetNodeRejectionStrength( FnxCore, int nodeId ) );
export( int,     FnxCoreGetNodeTrailingSilence( FnxCore, int nodeId ) );
export( int,     FnxCoreGetNodeLeadingSilence( FnxCore, int nodeId ) );
export( int,     FnxCoreGetNodeMaximumRecord( FnxCore, int nodeId ) );
export( int *,   FnxCoreGetNodeNextStates( FnxCore, int nodeId, int * numStates ) );
export( char *,  FnxCoreGetNodePrompt( FnxCore, int nodeId ) );
export( char *,  FnxCoreGetNodeErrorMessage( FnxCore, int nodeId ) );
export( int,     FnxCoreGetNodeWords( FnxCore, int nodeId, char *** pppWordList ) );
export( int,     FnxCoreGetNodeActivePercent( FnxCore, int nodeId ) );

/* Runtime functions */
export( int,     FnxCoreReady( FnxCore ) );
export( int,     FnxCoreRunFile( char * szFile, char * szProjectPath, char * szSharedPath, char * szError, int errLen ) );
export( int,     FnxCoreRunMemory( FnxMemFileMapping * map, char * szError, int errLen ) );
export( void,    FnxCoreSetFlowControl( FnxCore, FnxFlowControl ) );
export( FnxFlowControl, FnxCoreGetFlowControl( FnxCore ) );
export( void,    FnxCoreSetNodeRawAudioInput( FnxCore, int nodeId, short * pRawData, int rawSamples, int rawSampleRate ) );
export( int,     FnxCoreRunNode( FnxCore, int nodeId, int * wordIndex ) );
export( int,     FnxCoreChangeNodeWords( FnxCore, int nodeId, int numWords, char ** ppWords ) );
export( int,     FnxCoreChangeNodeGrammar( FnxCore, int nodeId, char * szGrammar ) );
export( int,     FnxCoreGetFirstNodeId( FnxCore ) );
export( int,     FnxCoreGetNextNodeId( FnxCore, int currentID, int wordIndex) );
export( char *,  FnxCoreGetFirstAsrResult( FnxCore, int * pWordScore, int * pGarbageScore, int * pBeginFrame, int * pEndFrame ) );
export( char *,  FnxCoreGetNextAsrResult( FnxCore, int * pWordScore, int * pGarbageScore, int * pBeginFrame, int * pEndFrame ) );
export( bool,    FnxCoreIncrementNBestResult( FnxCore ) );
export( int,     FnxCoreGetUnrecognizedRawData( FnxCore, int beginWordNumber, short ** ppRawData, int * rawSamples, int * rawSampleRate ) );
export( int,     FnxCoreGetRawData( FnxCore pCoreIn, int beginFrame, int endFrame, short ** ppRawData, int * rawSamples, int * rawSampleRate ) );

/* Utility */
export( void,    FnxCoreSay( FnxCore, char * szText ) );

/* User functions */
export( void,    FnxCoreMapUserFunctions( FnxCore, FnxUserFunctionsInitializeProc, FnxUserFunctionsCleanupProc, FnxUserFunctionMapping * ) );

#if defined(__cplusplus)
}
#endif

#endif
