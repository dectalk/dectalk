/*******************************************************************************
* SPError.h *
*-----------*
*   Description:
*       This header file contains the custom error codes specific to SAPI5
*-------------------------------------------------------------------------------
*   Copyright (c) Microsoft Corporation. All rights reserved.
*******************************************************************************/
#ifndef SPError_h
#define SPError_h

#ifndef _WINERROR_
#include <winerror.h>
#endif

#define FACILITY_SAPI      FACILITY_ITF
#define SAPI_ERROR_BASE    0x5000

#define MAKE_SAPI_HRESULT(sev, err)    MAKE_HRESULT(sev, FACILITY_SAPI, err)
#define MAKE_SAPI_ERROR(err)           MAKE_SAPI_HRESULT(SEVERITY_ERROR, err + SAPI_ERROR_BASE)
#define MAKE_SAPI_SCODE(scode)         MAKE_SAPI_HRESULT(SEVERITY_SUCCESS, scode + SAPI_ERROR_BASE)

/*** SPERR_UNINITIALIZED
*   The object has not been properly initialized
*/
#define SPERR_UNINITIALIZED                                MAKE_SAPI_ERROR(0x001)

/*** SPERR_ALREADY_INITIALIZED
*   The object has already been initialized
*/
#define SPERR_ALREADY_INITIALIZED                          MAKE_SAPI_ERROR(0x002)

/*** SPERR_UNSUPPORTED_FORMAT
*   The caller has specified an unsupported format
*/
#define SPERR_UNSUPPORTED_FORMAT                           MAKE_SAPI_ERROR(0x003)

/*** SPERR_INVALID_FLAGS
*   The caller has specified invalid flags for this operation
*/
#define SPERR_INVALID_FLAGS                                MAKE_SAPI_ERROR(0x004)

/*** SP_END_OF_STREAM
*   The operation has reached the end of stream
*/
#define SP_END_OF_STREAM                                   MAKE_SAPI_SCODE(0x005)

/*** SPERR_DEVICE_BUSY
*   The wave device is busy
*/
#define SPERR_DEVICE_BUSY                                  MAKE_SAPI_ERROR(0x006)

/*** SPERR_DEVICE_NOT_SUPPORTED
*   The wave device is not supported
*/
#define SPERR_DEVICE_NOT_SUPPORTED                         MAKE_SAPI_ERROR(0x007)

/*** SPERR_DEVICE_NOT_ENABLED
*   The wave device is not enabled
*/
#define SPERR_DEVICE_NOT_ENABLED                           MAKE_SAPI_ERROR(0x008)

/*** SPERR_NO_DRIVER
*   There is no wave driver installed
*/
#define SPERR_NO_DRIVER                                    MAKE_SAPI_ERROR(0x009)

/*** SPERR_FILEMUSTBEUNICODE
*   The file must be unicode
*/
#define SPERR_FILE_MUST_BE_UNICODE                         MAKE_SAPI_ERROR(0x00a)

/*** SP_INSUFFICIENTDATA
*
*/
#define SP_INSUFFICIENT_DATA                               MAKE_SAPI_SCODE(0x00b)

/*** SPERR_INVALIDPHRASEID
*   The phrase ID specified does not exist or is out of range.
*/
#define SPERR_INVALID_PHRASE_ID                            MAKE_SAPI_ERROR(0x00c)

/*** SPERR_BUFFER_TOO_SMALL
*   The caller provided buffer is too small to return a result.
*/
#define SPERR_BUFFER_TOO_SMALL                             MAKE_SAPI_ERROR(0x00d)

/*** SPERR_FORMAT_NOT_SPECIFIED
*   Caller did not specify a format for a stream prior to opening it.
*/
#define SPERR_FORMAT_NOT_SPECIFIED                         MAKE_SAPI_ERROR(0x00e)

/*** SPERR_AUDIO_STOPPED
*   The stream I/O was aborted by setting the audio object into the stopped state.
*   This will be returned for both read and write streams.
*/
#define SPERR_AUDIO_STOPPED                                MAKE_SAPI_ERROR(0x00f)

/*** SP_AUDIO_PAUSED
*   This will only be returned on input (read) streams when the stream is paused.  Reads on
*   paused streams will not block, and this return code indicates that all of the data has been
*   removed from the stream.
*/
#define SP_AUDIO_PAUSED                                    MAKE_SAPI_SCODE(0x010)

/*** SPERR_RULE_NOT_FOUND
*   Invalid rule name passed to ActivateGrammar.
*/
#define SPERR_RULE_NOT_FOUND                               MAKE_SAPI_ERROR(0x011)

/*** SPERR_TTS_ENGINE_EXCEPTION
*   An exception was raised during a call to the current TTS driver.
*/
#define SPERR_TTS_ENGINE_EXCEPTION                         MAKE_SAPI_ERROR(0x012)

/*** SPERR_TTS_NLP_EXCEPTION
*   An exception was raised during a call to an application sentence filter.
*/
#define SPERR_TTS_NLP_EXCEPTION                            MAKE_SAPI_ERROR(0x013)

/*** SPERR_ENGINE_BUSY
*   In Recognition, this means that the current method can not be performed while
*   a grammar rule is active.
*/
#define SPERR_ENGINE_BUSY                                  MAKE_SAPI_ERROR(0x014)

/*** SP_AUDIO_CONVERSION_ENABLED
*   The operation was successful, but only with automatic stream format conversion.
*/
#define SP_AUDIO_CONVERSION_ENABLED                        MAKE_SAPI_SCODE(0x015)

/*** SP_NO_HYPOTHESIS_AVAILABLE
*   There is currently no hypothesis recognition available.
*/
#define SP_NO_HYPOTHESIS_AVAILABLE                         MAKE_SAPI_SCODE(0x016)

/*** SPERR_CANT_CREATE
*   Can not create a new object instance for the specified object category
*/
#define SPERR_CANT_CREATE                                  MAKE_SAPI_ERROR(0x017)

/*** SP_ALREADY_IN_LEX
*   The word or the pronunciation/POS pair being added is already in lexicon
*/
#define SP_ALREADY_IN_LEX                                  MAKE_SAPI_SCODE(0x018)

/*** SPERR_NOT_IN_LEX
*   The word does not exist in the lexicon
*/
#define SPERR_NOT_IN_LEX                                   MAKE_SAPI_ERROR(0x019)

/*** SP_LEX_NOTHING_TO_SYNC
*   The client is synced up with the lexicon with which it is trying to sync
*/
#define SP_LEX_NOTHING_TO_SYNC                             MAKE_SAPI_SCODE(0x01a)

/*** SPERR_LEX_VERY_OUT_OF_SYNC
*   The client is very much out of sync with the lexicon with which it is trying to sync incrementally.
*/
#define SPERR_LEX_VERY_OUT_OF_SYNC                         MAKE_SAPI_ERROR(0x01b)

/*** SPERR_UNDEFINED_FORWARD_RULE_REF
*   A rule reference in a grammar was made to a named rule that was never defined.
*/
#define SPERR_UNDEFINED_FORWARD_RULE_REF                   MAKE_SAPI_ERROR(0x01c)

/*** SPERR_EMPTY_RULE
*   A non-dynamic grammar rule has no body
*/
#define SPERR_EMPTY_RULE                                   MAKE_SAPI_ERROR(0x01d)

/*** SPERR_GRAMMAR_COMPILER_INTERNAL_ERROR
*   The grammar compiler failed due to an internal state error.
*/
#define SPERR_GRAMMAR_COMPILER_INTERNAL_ERROR              MAKE_SAPI_ERROR(0x01e)


/*** SPERR_RULE_NOT_DYNAMIC
*   An attempt was made to modify a non-dynamic rule.
*/
#define SPERR_RULE_NOT_DYNAMIC                             MAKE_SAPI_ERROR(0x01f)

/*** SPERR_DUPLICATE_RULE_NAME
*   A rule name was duplicated.
*/
#define SPERR_DUPLICATE_RULE_NAME                          MAKE_SAPI_ERROR(0x020)

/*** SPERR_DUPLICATE_RESOURCE_NAME
*   A resource name was duplicated for a given rule.
*/
#define SPERR_DUPLICATE_RESOURCE_NAME                      MAKE_SAPI_ERROR(0x021)


/*** SPERR_TOO_MANY_GRAMMARS
*   Too many grammars have been loaded
*/
#define SPERR_TOO_MANY_GRAMMARS                            MAKE_SAPI_ERROR(0x022)

/*** SPERR_CIRCULAR_REFERENCE
*   Circular reference in import rules of grammars
*/
#define SPERR_CIRCULAR_REFERENCE                           MAKE_SAPI_ERROR(0x023)

/*** SPERR_INVALID_IMPORT
*   A rule reference to an imported grammar could not be resolved.
*/
#define SPERR_INVALID_IMPORT                               MAKE_SAPI_ERROR(0x024)

/*** SPERR_INVALID_WAV_FILE
*   The format of the WAV file is not supported
*/
#define SPERR_INVALID_WAV_FILE                             MAKE_SAPI_ERROR(0x025)

/*** SP_REQUEST_PENDING
*   This success code indicates that an SR method called with the SPRIF_ASYNC flag is
*   being processed.  When it is completed an SPFEI_ASYNC_COMPLETED event will be generated.
*/
#define SP_REQUEST_PENDING                                 MAKE_SAPI_SCODE(0x026)

/*** SPERR_ALL_WORDS_OPTIONAL
*   A grammar rule was defined with a null path through the rule.  That is, it is possible
*   to satisfy the rule conditions with no words.
*/
#define SPERR_ALL_WORDS_OPTIONAL                           MAKE_SAPI_ERROR(0x027)

/*** SPERR_INSTANCE_CHANGE_INVALID
*   It is not possible to change the current engine or input.  This occurs in the
*   following cases:
*
*       SelectEngine called while a Reco Context exists.
*       SetInput called in the shared instance case.
*/
#define SPERR_INSTANCE_CHANGE_INVALID                      MAKE_SAPI_ERROR(0x028)

//*** SPERR_RULE_NAME_ID_CONFLICT
//  A rule exists with matching ids (names) but different names (ids).  
//
#define SPERR_RULE_NAME_ID_CONFLICT                        MAKE_SAPI_ERROR(0x029)

//*** SPERR_NO_RULES
//  A grammar contains zero top-level, dynamic, or exported rules.  There is no possible
//  way to activate or otherwise use a rule in this grammar
#define SPERR_NO_RULES                                     MAKE_SAPI_ERROR(0x02a)

//*** SPERR_CIRCULAR_RULE_REF
//  Rule 'A' refers to a second rule 'B' which, refers in turn to rule 'A'.
#define SPERR_CIRCULAR_RULE_REF                            MAKE_SAPI_ERROR(0x02b)

//*** SP_NO_PARSE_FOUND
//  Parse path cannot be parsed given the currently active rules.
#define SP_NO_PARSE_FOUND                                  MAKE_SAPI_SCODE(0x02c)

//*** SPERR_NO_PARSE_FOUND
//  Parse path cannot be parsed given the currently active rules.
#define SPERR_INVALID_HANDLE                               MAKE_SAPI_ERROR(0x02d)

//*** SPERR_REMOTE_CALL_TIMED_OUT
//  A marshaled remote call failed to respond.
#define SPERR_REMOTE_CALL_TIMED_OUT                        MAKE_SAPI_ERROR(0x02e)

/*** SPERR_AUDIO_BUFFER_OVERFLOW
*   This will only be returned on input (read) streams when the stream is paused because
*   the SR driver had not been retrieving data for a while.
*/
#define SPERR_AUDIO_BUFFER_OVERFLOW                        MAKE_SAPI_ERROR(0x02f)


/*** SPERR_NO_AUDIO_DATA
*   The result does not contain any audio or the portion of the element chain of the result
*   does not contain any audio.  Returned from ISpResult::GetAudio and ISpResult::SpeakAudio
*/
#define SPERR_NO_AUDIO_DATA                                MAKE_SAPI_ERROR(0x030)

/*** SPERR_DEAD_ALTERNATE
*   This alternate is no longer a valid alternate to the result it once was obtained from.
*   Returned from ISpPhraseAlt methods.
*/
#define SPERR_DEAD_ALTERNATE                               MAKE_SAPI_ERROR(0x031)

/*** SPERR_HIGH_LOW_CONFIDENCE
*   The result does not contain any audio or the portion of the element chain of the result
*   does not contain any audio.  Returned from ISpResult::GetAudio and ISpResult::SpeakAudio
*/
#define SPERR_HIGH_LOW_CONFIDENCE                          MAKE_SAPI_ERROR(0x032)

/*** SPERR_INVALID_FORMAT_STRING
*   The XML format string for this RULEREF is invalid, e.g. not a GUID or REFCLSID
*/
#define SPERR_INVALID_FORMAT_STRING                        MAKE_SAPI_ERROR(0x033)

/*** SP_UNSUPPORTED_ON_STREAM_INPUT
*   The operation is not supported for stream input
*/
#define SP_UNSUPPORTED_ON_STREAM_INPUT                     MAKE_SAPI_SCODE(0x034)

/*** SPERR_APPLEX_READ_ONLY
*   The operation is invalid for all but newly created app lexicons
*/
#define SPERR_APPLEX_READ_ONLY                             MAKE_SAPI_ERROR(0x035)

/*** SPERR_NO_TERMINATING_RULE_PATH
*
*/

#define SPERR_NO_TERMINATING_RULE_PATH                     MAKE_SAPI_ERROR(0x036)

/*** SP_WORD_EXISTS_WITHOUT_PRONUNCIATION
*   The word exists but without pronunciation
*/
#define SP_WORD_EXISTS_WITHOUT_PRONUNCIATION               MAKE_SAPI_SCODE(0x037)

/*** SPERR_STREAM_CLOSED
*   An operation was attempted on a stream object that has been closed
*/
#define SPERR_STREAM_CLOSED                                MAKE_SAPI_ERROR(0x038)

// --- The following error codes are taken directly from WIN32  ---

/*** SPERR_NO_MORE_ITEMS
*   When enumerating items, the requested index is greater than the count of items
*/
#define SPERR_NO_MORE_ITEMS                                MAKE_SAPI_ERROR(0x039)

/*** SPERR_NOT_FOUND
*   The requested data item (data key, value, etc.) was not found.
*/
#define SPERR_NOT_FOUND                                    MAKE_SAPI_ERROR(0x03a)

/*** SPERR_INVALID_AUDIO_STATE
*   Audio state passed to SetState() is invalid.
*/
#define SPERR_INVALID_AUDIO_STATE                          MAKE_SAPI_ERROR(0x03b)

/*** SPERR_GENERIC_MMSYS_ERROR
*   A generic MMSYS error not caught by _MMRESULT_TO_HRESULT
*/
#define SPERR_GENERIC_MMSYS_ERROR                          MAKE_SAPI_ERROR(0x03c)

/*** SPERR_MARSHALER_EXCEPTION
*   An exception was raised during a call to the marshaling code
*/
#define SPERR_MARSHALER_EXCEPTION                          MAKE_SAPI_ERROR(0x03d)

/*** SPERR_NOT_DYNAMIC_GRAMMAR
*   Attempt was made to manipulate a non-dynamic grammar
*/
#define SPERR_NOT_DYNAMIC_GRAMMAR                          MAKE_SAPI_ERROR(0x03e)

/*** SPERR_AMBIGUOUS_PROPERTY
*   Cannot add ambiguous property
*/
#define SPERR_AMBIGUOUS_PROPERTY                           MAKE_SAPI_ERROR(0x03f)

/*** SPERR_INVALID_REGISTRY_KEY
*   The key specified is invalid
*/
#define SPERR_INVALID_REGISTRY_KEY                         MAKE_SAPI_ERROR(0x040)

/*** SPERR_INVALID_TOKEN_ID
*   The token specified is invalid
*/
#define SPERR_INVALID_TOKEN_ID                             MAKE_SAPI_ERROR(0x041)

/*** SPERR_XML_BAD_SYNTAX
*   The xml parser failed due to bad syntax
*/
#define SPERR_XML_BAD_SYNTAX                               MAKE_SAPI_ERROR(0x042)

/*** SPERR_XML_RESOURCE_NOT_FOUND
*   The xml parser failed to load a required resource (e.g. voice, phoneconverter, etc..)
*/
#define SPERR_XML_RESOURCE_NOT_FOUND                       MAKE_SAPI_ERROR(0x043)

/*** SPERR_TOKEN_IN_USE
*   Tried to remove registry data from a token that is already in use elsewhere
*/
#define SPERR_TOKEN_IN_USE                                 MAKE_SAPI_ERROR(0x044)

/*** SPERR_TOKEN_DELETED
*   Tried to perform an action on an object token that has had associated registry key deleted
*/
#define SPERR_TOKEN_DELETED                                MAKE_SAPI_ERROR(0x045)

/*** SPERR_MULTI_LINGUAL_NOT_SUPPORTED
*   The selected voice was registered as multi-lingual, SAPI does not support this
*/
#define SPERR_MULTI_LINGUAL_NOT_SUPPORTED                  MAKE_SAPI_ERROR(0x046)

/*** SPERR_EXPORT_DYNAMIC_RULE
*   Exported rules cannot refer directly or indirectly to a dynamic rule.
*/
#define SPERR_EXPORT_DYNAMIC_RULE                          MAKE_SAPI_ERROR(0x047)

/*** SPERR_STGF_ERROR
*   Error parsing the SAPI Text Grammar Format (XML grammar)
*/
#define SPERR_STGF_ERROR                                   MAKE_SAPI_ERROR(0x048)

/*** SPERR_WORDFORMAT_ERROR
*   Incorrect word format, probably due to incorrect pronunciation string
*/
#define SPERR_WORDFORMAT_ERROR                             MAKE_SAPI_ERROR(0x049)

/*** SPERR_STREAM_NOT_ACTIVE
*   Methods associated with active audio stream cannot be called unless stream is running.
*/
#define SPERR_STREAM_NOT_ACTIVE                            MAKE_SAPI_ERROR(0x04a)

/*** SPERR_ENGINE_RESPONSE_INVALID
*   Arguments or data supplied by the engine are in an invalid format or inconsistent.
*/
#define SPERR_ENGINE_RESPONSE_INVALID                      MAKE_SAPI_ERROR(0x04b)

/*** SPERR_SR_ENGINE_EXCEPTION
*   An exception was raised during a call to the current SR engine.
*/
#define SPERR_SR_ENGINE_EXCEPTION                          MAKE_SAPI_ERROR(0x04c)

/*** SPERR_STREAM_POS_INVALID
*   Stream position information supplied from engine is inconsistent.
*/
#define SPERR_STREAM_POS_INVALID                           MAKE_SAPI_ERROR(0x04d)

/*** SP_RECOGNIZER_INACTIVE
*   Operation could not be completed because the recognizer is inactive either becuase
*   the recognition state is currenly inactive or because there are no active rules.
*/
#define SP_RECOGNIZER_INACTIVE                             MAKE_SAPI_SCODE(0x04e)

/*** SPERR_REMOTE_CALL_ON_WRONG_THREAD
*   When remoting a call to the server, a call was made on the wrong thread
*/
#define SPERR_REMOTE_CALL_ON_WRONG_THREAD                  MAKE_SAPI_ERROR(0x04f)

/*** SPERR_REMOTE_PROCESS_TERMINATED
*   The remote process terminated unexpectedly.
*/
#define SPERR_REMOTE_PROCESS_TERMINATED                    MAKE_SAPI_ERROR(0x050)

/*** SPERR_REMOTE_PROCESS_ALREADY_RUNNING
*   The remote process is already running and cannot be started a second time.
*/
#define SPERR_REMOTE_PROCESS_ALREADY_RUNNING               MAKE_SAPI_ERROR(0x051)

/*** SPERR_LANGID_MISMATCH
*   We are trying to load a CFG grammar with a different LANGID than the other loaded grammars.
*/
#define SPERR_LANGID_MISMATCH                              MAKE_SAPI_ERROR(0x052)

//*** SP_PARTIAL_PARSE_FOUND
//  A grammar ending parse not using all the available words has been found.
#define SP_PARTIAL_PARSE_FOUND                             MAKE_SAPI_SCODE(0x053)

//*** SPERR_NOT_TOPLEVEL_RULE
//  An attempt was made to de-/activate a non-toplevel rule.
#define SPERR_NOT_TOPLEVEL_RULE                            MAKE_SAPI_ERROR(0x054)

//*** SP_NO_RULE_ACTIVE
//  An attempt was made to parse when no rule was active.
#define SP_NO_RULE_ACTIVE                                  MAKE_SAPI_SCODE(0x055)

//*** SPERR_LEX_REQUIRES_COOKIE
//  An attempt was made to ask a container lexicon for all words at once.
#define SPERR_LEX_REQUIRES_COOKIE                          MAKE_SAPI_ERROR(0x056)

//*** SP_STREAM_UNINITIALIZED
//  An attempt was made to activate a rule/dictation/etc without calling SetInput(...) first in the inproc case.
#define SP_STREAM_UNINITIALIZED                            MAKE_SAPI_SCODE(0x057)

//*** Error x058 is not used in SAPI 5.0

//*** SPERR_UNSUPPORTED_LANG
//  The requested language is not supported
#define SPERR_UNSUPPORTED_LANG                             MAKE_SAPI_ERROR(0x059)

//*** SPERR_VOICE_PAUSED
//  The operation cannot be performed because the voice is currently paused
#define SPERR_VOICE_PAUSED                                 MAKE_SAPI_ERROR(0x05a)

/*** SPERR_AUDIO_BUFFER_UNDERFLOW
*   This will only be returned on input (read) streams when the real time audio device
*   stops returning data for a long time
*/
#define SPERR_AUDIO_BUFFER_UNDERFLOW                       MAKE_SAPI_ERROR(0x05b)

/**** SPERR_AUDIO_STOPPED_UNEXPECTEDLY
*   An audio device stopped returning data from the Read() method even though it was in
*   the run state.  This error is only returned in the END_SR_STREAM event.
*/
#define SPERR_AUDIO_STOPPED_UNEXPECTEDLY                   MAKE_SAPI_ERROR(0x05c)

/*** SPERR_NO_WORD_PRONUNCIATION
*   The SR engine is unable to add this word to a grammar.
*   An explicit pronunciation may need to be supplied by the app for this word.
*/
#define SPERR_NO_WORD_PRONUNCIATION                        MAKE_SAPI_ERROR(0x05d)

/*** SPERR_ALTERNATES_WOULD_BE_INCONSISTENT
*   This will be returned on an attempt to call ScaleAudio on a recognition result after
*   having previously called GetAlternates. Allowing the call to succeed would result in
*   the previously created alternates having incorrect audio stream positions.
*/
#define SPERR_ALTERNATES_WOULD_BE_INCONSISTENT             MAKE_SAPI_ERROR(0x05e)

/*** SPERR_NOT_SUPPORTED_FOR_SHARED_RECOGNIZER
*   The method called is not supported for the shared recognizer.
*   For example, ISpRecognizer::GetInputStream()    
*/
#define SPERR_NOT_SUPPORTED_FOR_SHARED_RECOGNIZER          MAKE_SAPI_ERROR(0x05f)

/*** SPERR_TIMEOUT
*   A task could not complete becuase the SR engine was unresponsive.
*/
#define SPERR_TIMEOUT                                      MAKE_SAPI_ERROR(0x060)


/*** SPERR_REENTER_SYNCHRONIZE
*   A SR engine called synchronize while inside of a synchronize call.
*/
#define SPERR_REENTER_SYNCHRONIZE                          MAKE_SAPI_ERROR(0x061)

/*** SPERR_STATE_WITH_NO_ARCS
*   The grammar contains a node without any arcs.
*/
#define SPERR_STATE_WITH_NO_ARCS                           MAKE_SAPI_ERROR(0x062)

#endif  //--- This must be the last line in the file
