
#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 5.03.0280 */
/* at Tue Mar 27 14:25:25 2001
 */
/* Compiler settings for D:\work\rnd\Sapi5\src\ttseng.idl:
    Os (OptLev=s), W1, Zp8, env=Win32 (32b run), ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
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

/* Forward Declarations */ 

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

#ifdef __cplusplus
extern "C"{
#endif 

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

/* interface __MIDL_itf_ttseng_0000 */
/* [local] */ 

typedef struct VOICEITEM
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

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


