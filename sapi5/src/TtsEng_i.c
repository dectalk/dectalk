/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Mon Jul 24 21:50:09 2000
 */
/* Compiler settings for F:\work\ad\Sapi5\src\ttseng.idl:
    Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )
#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

const IID LIBID_DECTALKPAULUSLib = {0x99EE9581,0xA4A6,0x11d1,{0xBE,0xB2,0x00,0x60,0x08,0x3E,0x83,0x76}};


const CLSID CLSID_DECtalkPaulUS = {0x99EE9580,0xA4A6,0x11d1,{0xBE,0xB2,0x00,0x60,0x08,0x3E,0x83,0x76}};


#ifdef __cplusplus
}
#endif

