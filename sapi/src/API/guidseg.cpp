/******************************************************************************\
*       guidseg.cpp
*
*       This file initializes GUIDS for the Microsoft Speech API
*       NOTE: do not use Precompiled Headers to compile this file
*       due to the inclusion of initguid.h.
*
*       This code and information is provided "as is" without warranty
*       of any kind, either expressed or implied, including but not
*       limited to the implied warranties of merchantability and/or
*       fitness for a particular purpose.
*
*       Copyright (C) 1995 Microsoft Corporation.  All Rights Reserved.
*
\******************************************************************************/


#ifndef _AFXDLL  //tek 08jun98 MFC for dialogs
#include <windows.h>
#else //_AFxDLL
#include "stdafx.h"
#endif //_AFXDLL

#include <mmsystem.h>
#include <objbase.h>
#include <initguid.h>
#include <objerror.h>

// cjl 19nov97 change speech.h to local
#include "speech.h"	  // init GUIDs for Speech API (see initguid.h)
//#include <speech.h>

#ifdef BLD_DECTALK_DLL
#include "dtlktts.h"
#endif

#ifdef WILLOWPOND
// tek 29sep96 for DEC engine unlocking..
#include "idec.h"
#endif // WILLOWPOND
