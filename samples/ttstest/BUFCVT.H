///////////////////////////////////////////////////////////////////////////////////////////
// bufcvt.h
//
// Copyright (C) 1994, 1995 Microsoft Corporation,
// All rights reserved.
//
// This file contains macros to assist in writing test applications that can be compiled
// using the _UNICODE or UNICODE define (to switch the application between the Win32 'A'
// and 'W' APIs), and the _S_UNICODE or _S_ANSI defines to independently switch the Speech
// API between the 'A' and 'W' versions (in speech.h). NOTE: UNICODE is used by Win32 and
// _UNICODE is used by the Microsoft Foundation Classes.
//
// To use, #include this file in any .cpp files where you need to pass strings between the
// application and the speech APIs. The following combinations are possible:
// 
//  Targets   Application   Speech 
// NT  Win95  API strings   API strings   Compiler defines
// --------------------------------------------------------
// X     X    ANSI          ANSI          <none>
// X     X    ANSI          Unicode       _S_UNICODE
// X          Unicode       ANSI          (UNICODE || _UNICODE) && _S_ANSI
// X          Unicode       Unicode       (_UNICODE || UNICODE)
// 
// NOTE: The parameters are typed correctly in the macro to either ANSI or Unicode
//       (ANSI/Unicode), depending on the compiler defines.
//
// The macros are summarized here, followed by a detailed description:
//
// Allocate/Free buffers of speech (API) character width or application (LOC) character width.
// APIALLOC    - allocate a speech-compatible buffer.
// APIFREE     - free the (allocated) speech-compatible buffer.
// LOCALLOC    - allocate an application-compatible buffer.
// LOCFREE     - free the (allocated) application-compatible buffer.
//
// Convert where API buffer has been allocated
// APIA2SCVT    - convert an application buffer to an (allocated) speech-compatible buffer.
// APIS2ACVT    - convert an (allocated) speech-compatible buffer to an application buffer.
//
// Convert where local (LOC) application buffer has been allocated
// LOCA2SCVT    - convert an (allocated) application buffer to an speech-compatible buffer.
// LOCS2ACVT    - convert a speech-compatible buffer to an (allocated) application buffer.
//
// Convert where both buffers are pre-existing (not allocated using APIALLOC or LOCALLOC)
// A2SCVTEX  - convert an application buffer to an existing speech-compatible buffer.
// S2ACVTEX  - convert an existing speech-compatible buffer to an application buffer.
//
// Helper macros that understand width of API or LOC strings.
// APISIZEOFBUF  - return the length in bytes of an (allocated) speech-compatible buffer.
// LOCSIZEOFBUF  - return the length in bytes of an (allocated) speech-compatible buffer.
// APPMAXSTRLEN  - return the maximum number of characters an application buffer can hold,
//                 excluding a terminating NULL, given a pointer to the buffer.
// APISTRLEN     - return the length in characters, not including terminating NULL of
//                 a string contained in an speech-compatible buffer.
//
// APICAST       - Used to cast a value to the API data type.
//                 Usage:  speech_api_func( (APICAST *)pdwVal );
//
// NOTE: Conversion macros (except x2xCVTEX versions) depend on the source and destination
//       buffers being the same size IN NUMBER OF CHARACTERS. The macros take care of
//       computing the correct number of bytes for an allocated buffer, given the number of
//       characters the application buffer can hold. The APPMAXSTRLEN macro can compute
//       this for array of TCHAR, and APISTRLEN can return the length in characters of
//       an existing speech (API) string.
//
//       The x2xCVTEX versions are similar to strncpy, with the third parameter indicating
//       the maximum number of characters the destination buffer can hold, excluding the
//       terminating NULL.
//
/////////////////////////////////////////////////////////////////////////////////////////
//
// APIALLOC( bufName, appStrLen )
//
// Declares/allocates a buffer compatible with the speech api based on UNICODE state.
// The memory is initialized to 0.
//
//   bufName   - Pointer to the new memory buffer (for use in speech api calls).
//   appStrLen - The number of characters (not bytes) required, not including null.
//               WARNING: Do not use sizeof(my_buf)! Use _tcslen(my_buf), which
//               the portable version of strlen(). You may pass sizeof(my_buf)
//               to the APPMAXSTRLEN to get this value. The allocated buffer
//               must always match the existing application buffer as far as
//               the maximum number of characters it can contain.
//
//   NOTE: APIALLOC uses the OLE IMalloc interface to allocate memory so that
//         the buffer is compatible with In, Out, and In/Out parameters on the
//         speech  api.
//
//
// LOCALLOC( bufName, apiStrLen )
//
// Declares/allocates a buffer compatible with the application based on UNICODE state.
// The memory is initialized to 0.
//
//   bufName   - Pointer to the new memory buffer (for use by the application).
//   appStrLen - The number of characters (not bytes) required, not including null.
//               WARNING: Do not use sizeof(api_buf)! Use APISTRLEN(api_buf), which
//               returns the length of a string of the api type in characters.
//
//   NOTE: LOCALLOC uses the OLE IMalloc interface to allow sharing of code with
//         APIALLOC.
//
//
// APIA2SCVT( pSpeech, pApp )
//
// Performs an application to speech string convert using allocated speech buffer.
//
//   pSpeech - The allocated buffer which is used in the speech api calls.
//   pApp    - The application's local buffer.
//
// LOCA2SCVT( pSpeech, pApp )
//
// Same as LOCA2SCVT but uses an application (LOC) allocated buffer.
//
//
// A2SCVTEX( pSpeech, pApp, speechNumChars )
//
// Performs an application to speech string convert using an existing app & speech buffer.
//
//   pSpeech        - An existing buffer of the same type as the speech api.
//   pApp           - An application buffer.
//   speechNumChars - The maximum number of characters the speech buffer can hold.
//                    Similar to strncpy, speechNumChars must include the terminating NULL.
//
//
// APIS2ACVT( pApp, pSpeech )
//
// Performs a speech to application string convert using allocated speech buffer.
//
//   pApp    - The application's local buffer.
//   pSpeech - The allocated buffer which is used in the speech api calls.
//
//
// LOCS2ACVT( pSpeech, pApp )
//
// Same as LOCS2ACVT but uses an application (LOC) allocated buffer.
//
//
// S2ACVTEX( pApp, pSpeech, appNumChars )
//
// Performs a speech to application string convert using an existing speech buffer.
//
//   pApp        - An application buffer.
//   pSpeech     - An existing buffer of the same type as the speech api.
//   appNumChars - The maximum number of characters the application buffer can hold.
//                 Similar to strncpy, appNumChars must include the terminating NULL.
//
//
// APISIZEOFBUF( bufName )
//
// The length of the allocated buffer in bytes including the terminating NULL.
//
//   bufName - Pointer to the allocated buffer used in the speech api calls.
//
//
// APPMAXSTRLEN( pApp )
//
// The maximum number of characters an array can hold (not including terminating NULL).
//
//   pApp - Pointer to an array of TCHAR allocated by the application.
//
//
// APIFREE( bufName )
//
// Frees the allocated buffer.  This MUST be called before leaving scope where the
// buffer was allocated.
//
//   bufName - Pointer to the allocated buffer used in the speech api calls.
//
//
// LOCFREE( bufName )
//
// Frees the allocated buffer.  This MUST be called before leaving scope where the
// buffer was allocated.
//
//   bufName - Pointer to the allocated buffer of application type (character width).
//
//
///////////////////////////////////////////////////////////////////////////////////////////
// Two types are defined to allow allocation strings of Speech type. They are equivalent
// to TCHAR and PTCHAR (as used in the Application) but are switched between CHAR and WCHAR
// by the _S_UNICODE define rather than the _UNICODE define.
//
// SCHAR:   A character of the type used by the Speech API. 
// PSCHAR:  A pointer to a character of the type used by the Speech API. 
//
// Since a portable application uses TCHARs, there is a problem with portable use of the C
// run-time routines, however this is solved in by #include <tchar.h> and using macros such
// as _stprintf.
//

///////////////////////////////////////////////////////////////////////////////////////////
// Character types for use by the Speech APIs
///////////////////////////////////////////////////////////////////////////////////////////

#ifndef _BUFCVT_H_
#define _BUFCVT_H_

#if defined(_S_UNICODE)  // uses speech API switch
typedef WCHAR SCHAR, *PSCHAR;
// #pragma message("Speech data type is WCHAR" )
#else
typedef CHAR SCHAR, *PSCHAR;
// #pragma message("Speech data type is CHAR" )
#endif

///////////////////////////////////////////////////////////////////////////////////////////
// ANSI application and ANSI speech APIs
///////////////////////////////////////////////////////////////////////////////////////////

#if !(defined(_UNICODE) || defined(UNICODE)) && !defined(_S_UNICODE)
#pragma message("ANSI app, ANSI speech api" )

// Allocate an api buffer...
#define APIALLOC(bufName, appStrLen) \
    int bufName##SizeOf = (((appStrLen) + 1)*sizeof(CHAR)); \
    IMalloc* pIMalloc##bufName; \
    CHAR* bufName = NULL; \
    if(SUCCEEDED(CoGetMalloc(MEMCTX_TASK, &pIMalloc##bufName))) { \
        bufName = (CHAR*) pIMalloc##bufName->Alloc(bufName##SizeOf); \
        if( bufName != NULL ) memset( bufName, 0, bufName##SizeOf ); }

// Allocate an application buffer...
#define LOCALLOC(bufName, appStrLen) APIALLOC(bufName, appStrLen);

// app to speech convert...
#define APIA2SCVT(pSpeech, pApp) \
    if(pSpeech && pApp) strcpy(pSpeech, pApp);

#define LOCA2SCVT(pSpeech, pApp) APIA2SCVT(pSpeech, pApp);

// similar to strncpy; assumes source NULL terminated
#define A2SCVTEX(pSpeech, pApp, speechNumChars) \
    if(pSpeech && pApp) strncpy(pSpeech, pApp, (speechNumChars));

// speech to app convert...
#define APIS2ACVT(pApp, pSpeech) \
    if(pApp && pSpeech) strcpy(pApp, pSpeech);

#define LOCS2ACVT(pApp, pSpeech) APIS2ACVT(pApp, pSpeech);

#define S2ACVTEX(pApp, pSpeech, appNumChars) \
    if(pSpeech && pApp) strncpy(pApp, pSpeech, (appNumChars));

///////////////////////////////////////////////////////////////////////////////////////////
// ANSI application and Unicode speech APIs
///////////////////////////////////////////////////////////////////////////////////////////

#elif !(defined(_UNICODE) || defined(UNICODE)) && defined(_S_UNICODE)
#pragma message("ANSI app UNICODE speech api" )

// Allocate an api buffer...
#define APIALLOC(bufName, appStrLen) \
    int bufName##SizeOf = (((appStrLen) + 1)*sizeof(WCHAR)); \
    IMalloc* pIMalloc##bufName; \
    WCHAR* bufName = NULL; \
    if(SUCCEEDED(CoGetMalloc(MEMCTX_TASK, &pIMalloc##bufName))) { \
        bufName = (WCHAR*) pIMalloc##bufName->Alloc(bufName##SizeOf); \
        if( bufName != NULL ) memset( bufName, 0, bufName##SizeOf ); }

// Allocate an application buffer...
#define LOCALLOC(bufName, appStrLen) \
    int bufName##SizeOf = (((appStrLen) + 1)*sizeof(CHAR)); \
    IMalloc* pIMalloc##bufName; \
    CHAR* bufName = NULL; \
    if(SUCCEEDED(CoGetMalloc(MEMCTX_TASK, &pIMalloc##bufName))) { \
        bufName = (CHAR*) pIMalloc##bufName->Alloc(bufName##SizeOf); \
        if( bufName != NULL ) memset( bufName, 0, bufName##SizeOf ); }

// app to speech convert...
#define APIA2SCVT(pSpeech, pApp) \
    if(pSpeech && pApp) \
        MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, pApp, -1, pSpeech, pSpeech##SizeOf/sizeof(WCHAR));

#define LOCA2SCVT(pSpeech, pApp) \
    if(pSpeech && pApp) \
        MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, pApp, -1, pSpeech, pApp##SizeOf/sizeof(CHAR));

#define A2SCVTEX(pSpeech, pApp, speechNumChars) \
    if(pSpeech && pApp) \
        MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, pApp, -1, pSpeech, (speechNumChars));

// speech to app convert...
#define APIS2ACVT(pApp, pSpeech) \
    if(pApp && pSpeech) \
        WideCharToMultiByte(CP_ACP, 0, pSpeech, -1, pApp, pSpeech##SizeOf/sizeof(WCHAR), NULL, NULL );

#define LOCS2ACVT(pApp, pSpeech) \
    if(pApp && pSpeech) \
        WideCharToMultiByte(CP_ACP, 0, pSpeech, -1, pApp, pApp##SizeOf, NULL, NULL );

 #define S2ACVTEX(pApp, pSpeech, appNumChars) \
    if(pApp && pSpeech) \
        WideCharToMultiByte(CP_ACP, 0, pSpeech, -1, pApp, (appNumChars), NULL, NULL );


///////////////////////////////////////////////////////////////////////////////////////////
// Unicode application and ANSI speech APIs
///////////////////////////////////////////////////////////////////////////////////////////

#elif (defined(_UNICODE) || defined(UNICODE)) && defined(_S_ANSI)
#pragma message("UNICODE app, ANSI speech api" )

// Allocate an api buffer...
#define APIALLOC(bufName, appStrLen) \
    int bufName##SizeOf = (((appStrLen) + 1)*sizeof(CHAR)); \
    IMalloc* pIMalloc##bufName; \
    CHAR* bufName = NULL; \
    if(SUCCEEDED(CoGetMalloc(MEMCTX_TASK, &pIMalloc##bufName))) { \
        bufName = (CHAR*) pIMalloc##bufName->Alloc(bufName##SizeOf); \
        if( bufName != NULL ) memset( bufName, 0, bufName##SizeOf ); }

// Allocate an application buffer...
#define LOCALLOC(bufName, appStrLen) \
    int bufName##SizeOf = (((appStrLen) + 1)*sizeof(WCHAR)); \
    IMalloc* pIMalloc##bufName; \
    WCHAR* bufName = NULL; \
    if(SUCCEEDED(CoGetMalloc(MEMCTX_TASK, &pIMalloc##bufName))) { \
        bufName = (WCHAR*) pIMalloc##bufName->Alloc(bufName##SizeOf); \
        if( bufName != NULL ) memset( bufName, 0, bufName##SizeOf ); }

// app to speech convert...
#define APIA2SCVT(pSpeech, pApp) \
    if(pSpeech && pApp) \
        WideCharToMultiByte(CP_ACP, 0, pApp, -1, pSpeech, pSpeech##SizeOf, NULL, NULL );

#define LOCA2SCVT(pSpeech, pApp) \
    if(pSpeech && pApp) \
        WideCharToMultiByte(CP_ACP, 0, pApp, -1, pSpeech, pApp##SizeOf*sizeof(WCHAR), NULL, NULL );

#define A2SCVTEX(pSpeech, pApp, speechNumChars) \
    if(pSpeech && pApp) \
        WideCharToMultiByte(CP_ACP, 0, pApp, -1, pSpeech, (speechNumChars), NULL, NULL );

// speech to app convert...
#define APIS2ACVT(pApp, pSpeech) \
    if(pApp && pSpeech) \
        MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, pSpeech, -1, pApp, pSpeech##SizeOf/sizeof(WCHAR));

#define LOCS2ACVT(pApp, pSpeech) \
    if(pApp && pSpeech) \
        MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, pSpeech, -1, pApp, pApp##SizeOf);

#define S2ACVTEX(pApp, pSpeech, appNumChars) \
    if(pApp && pSpeech) \
        MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, pSpeech, -1, pApp, (appNumChars));


///////////////////////////////////////////////////////////////////////////////////////////
// Unicode application and Unicode speech APIs
///////////////////////////////////////////////////////////////////////////////////////////

#elif (defined(_UNICODE) || defined(UNICODE)) && !defined(_S_ANSI)
#pragma message("UNICODE app, UNICODE speech api" )

// Allocate an api buffer...
#define APIALLOC(bufName, appStrLen) \
    int bufName##SizeOf = (((appStrLen) + 1)*sizeof(WCHAR)); \
    IMalloc* pIMalloc##bufName; \
    WCHAR* bufName = NULL; \
    if(SUCCEEDED(CoGetMalloc(MEMCTX_TASK, &pIMalloc##bufName))) { \
        bufName = (WCHAR*) pIMalloc##bufName->Alloc(bufName##SizeOf); \
        if( bufName != NULL ) memset( bufName, 0, bufName##SizeOf ); }

// Allocate an application buffer...
#define LOCALLOC(bufName, appStrLen) APIALLOC(bufName, appStrLen);

// app to speech convert...
#define APIA2SCVT(pSpeech, pApp) \
    if(pSpeech && pApp) wcscpy(pSpeech, pApp);

#define LOCA2SCVT(pSpeech, pApp) APIA2SCVT(pSpeech, pApp);

// just do wcscpy since both buffers equal length; assumes source NULL terminated
#define A2SCVTEX(pSpeech, pApp, speechNumChars) \
    if(pSpeech && pApp) wcsncpy(pSpeech, pApp, (speechNumChars));

// speech to app convert...
#define APIS2ACVT(pApp, pSpeech) \
    if(pApp && pSpeech) wcscpy(pApp, pSpeech);

#define LOCS2ACVT(pApp, pSpeech) APIS2ACVT(pApp, pSpeech);

#define S2ACVTEX(pApp, pSpeech, appNumChars) \
    if(pApp && pSpeech) wcsncpy(pApp, pSpeech, (appNumChars));

#endif  // (UNICODE definitions)

 
///////////////////////////////////////////////////////////////////////////////////////////
// ANSI OR Unicode application
///////////////////////////////////////////////////////////////////////////////////////////

// return the maximum number of characters app buffer can hold
// in NULL terminated string of TCHAR
#if !(defined(_UNICODE) || defined(UNICODE))
// ANSI application - app buffer is 1 byte per character
#define APPCHARSIZE sizeof(CHAR)
#define APPMAXSTRLEN(pApp) (sizeof(pApp) - 1)
#else
// Unicode application - app buffer is 2 bytes per character
#define APPCHARSIZE sizeof(WCHAR)
#define APPMAXSTRLEN(pApp) ((sizeof(pApp)/2) - 1)
#endif

///////////////////////////////////////////////////////////////////////////////////////////
// ANSI OR Unicode speech API
///////////////////////////////////////////////////////////////////////////////////////////

#if !defined(_S_UNICODE)

#define APICHARSIZE sizeof(CHAR)

// ANSI api string
#define APISTRLEN(pApiStr) strlen((CHAR*) pApiStr)
// ANSI typecast operator
#define APICAST CHAR

#else

#define APICHARSIZE sizeof(WCHAR)

// Unicode api string
#define APISTRLEN(pApiStr) wcslen((WCHAR*) pApiStr)
// ANSI typecast operator
#define APICAST WCHAR

#endif

///////////////////////////////////////////////////////////////////////////////////////////
// These macros are the same regardless of the UNICODE state.
///////////////////////////////////////////////////////////////////////////////////////////

// return the length of buffer in bytes...
#define APISIZEOFBUF(bufName) bufName##SizeOf
#define LOCSIZEOFBUF(bufName) bufName##SizeOf

// free buffer...
#define APIFREE(bufName) \
    if(pIMalloc##bufName) {  \
        pIMalloc##bufName->Free(bufName); \
        pIMalloc##bufName->Release(); \
        bufName = NULL; }

#define LOCFREE(bufName) APIFREE(bufName)

#endif // _BUFCVT_H_
