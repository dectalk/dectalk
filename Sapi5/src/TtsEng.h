/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Mon Jul 24 21:50:09 2000
 */
/* Compiler settings for F:\work\ad\Sapi5\src\ttseng.idl:
    Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 440
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __ttseng_h__
#define __ttseng_h__

#ifdef __cplusplus
extern "C"{
#endif 

/* Forward Declarations */ 
#ifdef ENGLISH_US

#ifndef __DECtalkPaulUS_FWD_DEFINED__
#define __DECtalkPaulUS_FWD_DEFINED__

#ifdef __cplusplus
typedef class DECtalkPaulUS DECtalkPaulUS;
#else
typedef struct DECtalkPaulUS DECtalkPaulUS;
#endif /* __cplusplus */

#endif 	/* __DECtalkPaulUS_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "sapiddk.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

/* interface __MIDL_itf_ttseng_0000 */
/* [local] */ 

typedef struct  VOICEITEM
    {
    LPCWSTR pText;
    ULONG ulTextLen;
    ULONG ulNumAudioBytes;
    BYTE __RPC_FAR *pAudio;
    }	VOICEITEM;



extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_s_ifspec;


#ifndef __DECTALKPAULUSLib_LIBRARY_DEFINED__
#define __DECTALKPAULUSLib_LIBRARY_DEFINED__

/* library DECTALKPAULUSLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_DECTALKPAULUSLib;

EXTERN_C const CLSID CLSID_DECtalkPaulUS;

#ifdef __cplusplus

class DECLSPEC_UUID("99EE9580-A4A6-11d1-BEB2-0060083E8376")
DECtalkPaulUS;
#endif
#endif /* __DECTALKPAULUSLib_LIBRARY_DEFINED__ */

#endif
#ifdef SPANISH_SP

#ifndef __DECtalkPaulSP_FWD_DEFINED__
#define __DECtalkPaulSP_FWD_DEFINED__

#ifdef __cplusplus
typedef class DECtalkPaulSP DECtalkPaulSP;
#else
typedef struct DECtalkPaulSP DECtalkPaulSP;
#endif /* __cplusplus */

#endif 	/* __DECtalkPaulSP_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "sapiddk.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

/* interface __MIDL_itf_ttseng_0000 */
/* [local] */ 

typedef struct  VOICEITEM
    {
    LPCWSTR pText;
    ULONG ulTextLen;
    ULONG ulNumAudioBytes;
    BYTE __RPC_FAR *pAudio;
    }	VOICEITEM;



extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_s_ifspec;


#ifndef __DECTALKPAULSPLib_LIBRARY_DEFINED__
#define __DECTALKPAULSPLib_LIBRARY_DEFINED__

/* library DECTALKPAULSPLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_DECTALKPAULSPLib;

EXTERN_C const CLSID CLSID_DECtalkPaulSP;

#ifdef __cplusplus

class DECLSPEC_UUID("99EE9582-A4A6-11d1-BEB2-0060083E8376")
DECtalkPaulSP;
#endif
#endif /* __DECTALKPAULSPLib_LIBRARY_DEFINED__ */

#endif

#ifdef GERMAN

#ifndef __DECtalkPaulGR_FWD_DEFINED__
#define __DECtalkPaulGR_FWD_DEFINED__

#ifdef __cplusplus
typedef class DECtalkPaulGR DECtalkPaulGR;
#else
typedef struct DECtalkPaulGR DECtalkPaulGR;
#endif /* __cplusplus */

#endif 	/* __DECtalkPaulGR_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "sapiddk.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

/* interface __MIDL_itf_ttseng_0000 */
/* [local] */ 

typedef struct  VOICEITEM
    {
    LPCWSTR pText;
    ULONG ulTextLen;
    ULONG ulNumAudioBytes;
    BYTE __RPC_FAR *pAudio;
    }	VOICEITEM;



extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_s_ifspec;


#ifndef __DECTALKPAULGRLib_LIBRARY_DEFINED__
#define __DECTALKPAULGRLib_LIBRARY_DEFINED__

/* library DECTALKPAULGRLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_DECTALKPAULGRLib;

EXTERN_C const CLSID CLSID_DECtalkPaulGR;

#ifdef __cplusplus

class DECLSPEC_UUID("99EE9586-A4A6-11d1-BEB2-0060083E8376")
DECtalkPaulGR;
#endif
#endif /* __DECTALKPAULGRLib_LIBRARY_DEFINED__ */

#endif


#ifdef SPANISH_LA

#ifndef __DECtalkPaulLA_FWD_DEFINED__
#define __DECtalkPaulLA_FWD_DEFINED__

#ifdef __cplusplus
typedef class DECtalkPaulLA DECtalkPaulLA;
#else
typedef struct DECtalkPaulLA DECtalkPaulLA;
#endif /* __cplusplus */

#endif 	/* __DECtalkPaulLA_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "sapiddk.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

/* interface __MIDL_itf_ttseng_0000 */
/* [local] */ 

typedef struct  VOICEITEM
    {
    LPCWSTR pText;
    ULONG ulTextLen;
    ULONG ulNumAudioBytes;
    BYTE __RPC_FAR *pAudio;
    }	VOICEITEM;



extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_s_ifspec;


#ifndef __DECTALKPAULLALib_LIBRARY_DEFINED__
#define __DECTALKPAULLALib_LIBRARY_DEFINED__

/* library DECTALKPAULLALib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_DECTALKPAULLALib;

EXTERN_C const CLSID CLSID_DECtalkPaulLA;

#ifdef __cplusplus

class DECLSPEC_UUID("99EE9584-A4A6-11d1-BEB2-0060083E8376")
DECtalkPaulLA;
#endif
#endif /* __DECTALKPAULLALib_LIBRARY_DEFINED__ */

#endif


#ifdef ENGLISH_UK

#ifndef __DECtalkPaulUK_FWD_DEFINED__
#define __DECtalkPaulUK_FWD_DEFINED__

#ifdef __cplusplus
typedef class DECtalkPaulUK DECtalkPaulUK;
#else
typedef struct DECtalkPaulUK DECtalkPaulUK;
#endif /* __cplusplus */

#endif 	/* __DECtalkPaulUK_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "sapiddk.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

/* interface __MIDL_itf_ttseng_0000 */
/* [local] */ 

typedef struct  VOICEITEM
    {
    LPCWSTR pText;
    ULONG ulTextLen;
    ULONG ulNumAudioBytes;
    BYTE __RPC_FAR *pAudio;
    }	VOICEITEM;



extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_s_ifspec;


#ifndef __DECTALKPAULUKLib_LIBRARY_DEFINED__
#define __DECTALKPAULUKLib_LIBRARY_DEFINED__

/* library DECTALKPAULUKLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_DECTALKPAULUKLib;

EXTERN_C const CLSID CLSID_DECtalkPaulUK;

#ifdef __cplusplus

class DECLSPEC_UUID("99EE9588-A4A6-11d1-BEB2-0060083E8376")
DECtalkPaulUK;
#endif
#endif /* __DECTALKPAULUKLib_LIBRARY_DEFINED__ */

#endif


#ifdef FRENCH

#ifndef __DECtalkPaulFR_FWD_DEFINED__
#define __DECtalkPaulFR_FWD_DEFINED__

#ifdef __cplusplus
typedef class DECtalkPaulFR DECtalkPaulFR;
#else
typedef struct DECtalkPaulFR DECtalkPaulFR;
#endif /* __cplusplus */

#endif 	/* __DECtalkPaulFR_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "sapiddk.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

/* interface __MIDL_itf_ttseng_0000 */
/* [local] */ 

typedef struct  VOICEITEM
    {
    LPCWSTR pText;
    ULONG ulTextLen;
    ULONG ulNumAudioBytes;
    BYTE __RPC_FAR *pAudio;
    }	VOICEITEM;



extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_ttseng_0000_v0_0_s_ifspec;


#ifndef __DECTALKPAULFRLib_LIBRARY_DEFINED__
#define __DECTALKPAULFRLib_LIBRARY_DEFINED__

/* library DECTALKPAULFRLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_DECTALKPAULFRLib;

EXTERN_C const CLSID CLSID_DECtalkPaulFR;

#ifdef __cplusplus

class DECLSPEC_UUID("99EE9590-A4A6-11d1-BEB2-0060083E8376")
DECtalkPaulFR;
#endif
#endif /* __DECTALKPAULSPLib_LIBRARY_DEFINED__ */

#endif
/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif
