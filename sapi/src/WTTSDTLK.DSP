# Microsoft Developer Studio Project File - Name="wttsdtlk" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102
# TARGTYPE "Win32 (ALPHA) Dynamic-Link Library" 0x0602

CFG=wttsdtlk - Win32 ALPHA Debug United Kingdom
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Wttsdtlk.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wttsdtlk.mak" CFG="wttsdtlk - Win32 ALPHA Debug United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wttsdtlk - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Release" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\WinRel"
# PROP BASE Intermediate_Dir ".\WinRel"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkttse\us\release"
# PROP Intermediate_Dir ".\..\build\wtlkttse\us\release\link"
# PROP Ignore_Export_Lib 0
CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /fo".\..\build\wtlkttse\us\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 ..\..\dapi\build\wtlkstat\us\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\us\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\WinDebug"
# PROP BASE Intermediate_Dir ".\WinDebug"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkttse\us\debug"
# PROP Intermediate_Dir ".\..\build\wtlkttse\us\debug\link"
# PROP Ignore_Export_Lib 0
CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /fo".\..\build\wtlkttse\us\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\wtlkstat\us\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /map /debug /debugtype:both /machine:I386 /out:".\..\build\wtlkttse\us\debug\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\wttsdtlk_"
# PROP BASE Intermediate_Dir ".\wttsdtlk_"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkttse\sp\release"
# PROP Intermediate_Dir ".\..\build\wtlkttse\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /i "z:\inc" /d "NDEBUG"
# ADD RSC /l 0x40a /fo".\..\build\wtlkttse\sp\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:"dtlkttse\release\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\wtlkstat\sp\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\sp\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\wttsdtlk0"
# PROP BASE Intermediate_Dir ".\wttsdtlk0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkttse\gr\release"
# PROP Intermediate_Dir ".\..\build\wtlkttse\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /i "z:\inc" /d "NDEBUG"
# ADD RSC /l 0x407 /fo".\..\build\wtlkttse\gr\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:"dtlkttse\release\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\wtlkstat\gr\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\gr\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\wttsdtlk_"
# PROP BASE Intermediate_Dir ".\wttsdtlk_"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkttse\la\release"
# PROP Intermediate_Dir ".\..\build\wtlkttse\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /fo".\..\build\wtlkttse\la\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\us\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:"dtlkttse\us\release\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\wtlkstat\la\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\la\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\wttsdtlk1"
# PROP BASE Intermediate_Dir ".\wttsdtlk1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkttse\sp\debug"
# PROP Intermediate_Dir ".\..\build\wtlkttse\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /fo".\..\build\wtlkttse\sp\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:"dtlkttse\debug\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\wtlkstat\sp\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /map /debug /debugtype:both /machine:I386 /out:".\..\build\wtlkttse\sp\debug\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\wttsdtlk2"
# PROP BASE Intermediate_Dir ".\wttsdtlk2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkttse\gr\debug"
# PROP Intermediate_Dir ".\..\build\wtlkttse\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x407 /fo".\..\build\wtlkttse\gr\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:"dtlkttse\debug\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\wtlkstat\gr\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /map /debug /debugtype:both /machine:I386 /out:".\..\build\wtlkttse\gr\debug\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\wttsdtlk3"
# PROP BASE Intermediate_Dir ".\wttsdtlk3"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkttse\la\debug"
# PROP Intermediate_Dir ".\..\build\wtlkttse\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /fo".\..\build\wtlkttse\la\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:"dtlkttse\debug\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\wtlkstat\la\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /map /debug /debugtype:both /machine:I386 /out:".\..\build\wtlkttse\la\debug\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wttsdtlk"
# PROP BASE Intermediate_Dir "wttsdtlk"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\wtlkttse\us\release"
# PROP Intermediate_Dir ".\..\alpha\wtlkttse\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_US" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /YX /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /fo"..\build\wtlkttse\us\release\link\wtlktts.res" /d "NDEBUG"
# ADD RSC /l 0x409 /fo".\..\alpha\wtlkttse\us\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\us\release\wtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:"..\build\wtlkttse\us\release\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\wtlkstat\us\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\wtlkttse\us\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wttsdtl0"
# PROP BASE Intermediate_Dir "wttsdtl0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\wtlkttse\us\debug"
# PROP Intermediate_Dir ".\..\alpha\wtlkttse\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /YX /FD /MTd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /fo"..\build\wtlkttse\us\debug\link\wtlktts.res" /d "_DEBUG"
# ADD RSC /l 0x409 /fo".\..\alpha\wtlkttse\us\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\us\debug\wtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /map /debug /debugtype:both /machine:ALPHA /out:"..\build\wtlkttse\us\debug\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\wtlkstat\us\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\wtlkttse\us\debug\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wttsdtlk"
# PROP BASE Intermediate_Dir "wttsdtlk"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\wtlkttse\sp\release"
# PROP Intermediate_Dir ".\..\alpha\wtlkttse\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "WILLOWPOND" /YX /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /fo".\..\build\wtlkttse\sp\release\link\wtlktts.res" /d "NDEBUG"
# ADD RSC /l 0x40a /fo".\..\alpha\wtlkttse\sp\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\sp\release\wtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\sp\release\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\wtlkstat\sp\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\wtlkttse\sp\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wttsdtl0"
# PROP BASE Intermediate_Dir "wttsdtl0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\wtlkttse\gr\release"
# PROP Intermediate_Dir ".\..\alpha\wtlkttse\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /D "WILLOWPOND" /YX /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /fo".\..\build\wtlkttse\gr\release\link\wtlktts.res" /d "NDEBUG"
# ADD RSC /l 0x407 /fo".\..\alpha\wtlkttse\gr\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\gr\release\wtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\gr\release\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\wtlkstat\gr\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\wtlkttse\gr\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wttsdtl1"
# PROP BASE Intermediate_Dir "wttsdtl1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\wtlkttse\la\release"
# PROP Intermediate_Dir ".\..\alpha\wtlkttse\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /D "WILLOWPOND" /YX /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /fo".\..\build\wtlkttse\la\release\link\wtlktts.res" /d "NDEBUG"
# ADD RSC /l 0x40a /fo".\..\alpha\wtlkttse\la\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\la\release\wtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\la\release\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\wtlkstat\la\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\wtlkttse\la\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wttsdtl2"
# PROP BASE Intermediate_Dir "wttsdtl2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\wtlkttse\sp\debug"
# PROP Intermediate_Dir ".\..\alpha\wtlkttse\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "PRINTFDEBUG" /D "SPANISH" /D "WILLOWPOND" /YX /FD /MTd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /fo".\..\build\wtlkttse\sp\debug\link\wtlktts.res" /d "_DEBUG"
# ADD RSC /l 0x40a /fo".\..\alpha\wtlkttse\sp\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\sp\debug\wtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /map /debug /debugtype:both /machine:ALPHA /out:".\..\build\wtlkttse\sp\debug\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\wtlkstat\sp\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\wtlkttse\sp\debug\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wttsdtl3"
# PROP BASE Intermediate_Dir "wttsdtl3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\wtlkttse\gr\debug"
# PROP Intermediate_Dir ".\..\alpha\wtlkttse\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "PRINTFDEBUG" /D "GERMAN" /D "WILLOWPOND" /YX /FD /MTd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /fo".\..\build\wtlkttse\gr\debug\link\wtlktts.res" /d "_DEBUG"
# ADD RSC /l 0x407 /fo".\..\alpha\wtlkttse\gr\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\gr\debug\wtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /map /debug /debugtype:both /machine:ALPHA /out:".\..\build\wtlkttse\gr\debug\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\wtlkstat\gr\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\wtlkttse\gr\debug\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wttsdtl4"
# PROP BASE Intermediate_Dir "wttsdtl4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\wtlkttse\la\debug"
# PROP Intermediate_Dir ".\..\alpha\wtlkttse\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "PRINTFDEBUG" /D "SPANISH" /D "LATIN_AMERICAN" /D "WILLOWPOND" /YX /FD /MTd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /fo".\..\build\wtlkttse\la\debug\link\wtlktts.res" /d "_DEBUG"
# ADD RSC /l 0x40a /fo".\..\alpha\wtlkttse\la\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\la\debug\wtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /map /debug /debugtype:both /machine:ALPHA /out:".\..\build\wtlkttse\la\debug\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\wtlkstat\la\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\wtlkttse\la\debug\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wttsdtlk"
# PROP BASE Intermediate_Dir "wttsdtlk"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkttse\uk\release"
# PROP Intermediate_Dir ".\..\build\wtlkttse\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /fo".\..\build\wtlkttse\us\release\link\wtlktts.res" /d "NDEBUG"
# ADD RSC /l 0x809 /fo".\..\build\wtlkttse\uk\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\us\release\wtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\us\release\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\wtlkstat\uk\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\uk\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wttsdtl0"
# PROP BASE Intermediate_Dir "wttsdtl0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkttse\uk\debug"
# PROP Intermediate_Dir ".\..\build\wtlkttse\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /fo".\..\build\wtlkttse\us\debug\link\wtlktts.res" /d "_DEBUG"
# ADD RSC /l 0x809 /fo".\..\build\wtlkttse\uk\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\us\debug\wtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /map /debug /debugtype:both /machine:I386 /out:".\..\build\wtlkttse\us\debug\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\wtlkstat\uk\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /map /debug /debugtype:both /machine:I386 /out:".\..\build\wtlkttse\uk\debug\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wttsdtlk"
# PROP BASE Intermediate_Dir "wttsdtlk"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\wtlkttse\uk\release"
# PROP Intermediate_Dir ".\..\alpha\wtlkttse\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /fo".\..\build\wtlkttse\uk\release\link\wtlktts.res" /d "NDEBUG"
# ADD RSC /l 0x809 /fo".\..\alpha\wtlkttse\uk\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\uk\release\wtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\uk\release\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\wtlkstat\uk\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\wtlkttse\uk\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wttsdtl0"
# PROP BASE Intermediate_Dir "wttsdtl0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\wtlkttse\uk\debug"
# PROP Intermediate_Dir ".\..\alpha\wtlkttse\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /MTd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /YX /FD /MTd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /fo".\..\build\wtlkttse\uk\debug\link\wtlktts.res" /d "_DEBUG"
# ADD RSC /l 0x809 /fo".\..\alpha\wtlkttse\uk\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\uk\debug\wtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /map /debug /debugtype:both /machine:ALPHA /out:".\..\build\wtlkttse\uk\debug\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\wtlkstat\uk\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\wtlkttse\uk\debug\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "wttsdtlk - Win32 Release"
# Name "wttsdtlk - Win32 Debug"
# Name "wttsdtlk - Win32 Release Spanish"
# Name "wttsdtlk - Win32 Release German"
# Name "wttsdtlk - Win32 Release Latin American"
# Name "wttsdtlk - Win32 Debug Spanish"
# Name "wttsdtlk - Win32 Debug German"
# Name "wttsdtlk - Win32 Debug Latin American"
# Name "wttsdtlk - Win32 ALPHA Release"
# Name "wttsdtlk - Win32 ALPHA Debug"
# Name "wttsdtlk - Win32 ALPHA Release Spanish"
# Name "wttsdtlk - Win32 ALPHA Release German"
# Name "wttsdtlk - Win32 ALPHA Release Latin American"
# Name "wttsdtlk - Win32 ALPHA Debug Spanish"
# Name "wttsdtlk - Win32 ALPHA Debug German"
# Name "wttsdtlk - Win32 ALPHA Debug Latin American"
# Name "wttsdtlk - Win32 Release United Kingdom"
# Name "wttsdtlk - Win32 Debug United Kingdom"
# Name "wttsdtlk - Win32 ALPHA Release United Kingdom"
# Name "wttsdtlk - Win32 ALPHA Debug United Kingdom"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\API\AboutDialog.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_ABOUT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_ABOUT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_ABOUT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_ABOUT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_ABOUT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_ABOUT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_ABOUT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_ABOUT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_ABOUT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_ABOUT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\auddest.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_AUDDE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_AUDDE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_AUDDE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_AUDDE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_AUDDE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_AUDDE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_AUDDE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_AUDDE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_AUDDE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_AUDDE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\audioact.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_AUDIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_AUDIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_AUDIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_AUDIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_AUDIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_AUDIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_AUDIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_AUDIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_AUDIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_AUDIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\audqueue.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\API\BufNotify.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	".\API\BufNotify.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	".\API\BufNotify.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	".\API\BufNotify.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	".\API\BufNotify.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	".\API\BufNotify.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	".\API\BufNotify.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	".\API\BufNotify.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	".\API\BufNotify.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	".\API\BufNotify.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	".\API\BufNotify.h"\
	".\API\stdafx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\ctools.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_CTOOL=\
	".\Api\ctools.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_CTOOL=\
	".\Api\ctools.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_CTOOL=\
	".\Api\ctools.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_CTOOL=\
	".\Api\ctools.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_CTOOL=\
	".\Api\ctools.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_CTOOL=\
	".\Api\ctools.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_CTOOL=\
	".\Api\ctools.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_CTOOL=\
	".\Api\ctools.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_CTOOL=\
	".\Api\ctools.h"\
	".\API\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CTOOL=\
	".\Api\ctools.h"\
	".\API\stdafx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Api\Decstd97.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\API\DECtalkDialogs.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_DECTA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_DECTA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_DECTA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_DECTA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_DECTA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_DECTA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_DECTA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_DECTA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_DECTA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DECTA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\DialogSpeak.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_DIALO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_DIALO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_DIALO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_DIALO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_DIALO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_DIALO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_DIALO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_DIALO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_DIALO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DIALO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\dtlktts.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_DTLKT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_DTLKT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_DTLKT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_DTLKT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_DTLKT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_DTLKT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_DTLKT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_DTLKT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_DTLKT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DTLKT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\AboutDialog.h"\
	".\Api\ctools.h"\
	".\API\DECtalkDialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\GeneralDialog.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\dtlktts.rc
# ADD BASE RSC /l 0x409 /i "Api"
# ADD RSC /l 0x409 /i "Api" /i ".\Api"
# End Source File
# Begin Source File

SOURCE=.\Api\dtlkttsc.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_DTLKTT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dectalk_mfc.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_DTLKTT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dectalk_mfc.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_DTLKTT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dectalk_mfc.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_DTLKTT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dectalk_mfc.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_DTLKTT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dectalk_mfc.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_DTLKTT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dectalk_mfc.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_DTLKTT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dectalk_mfc.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_DTLKTT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dectalk_mfc.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_DTLKTT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dectalk_mfc.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DTLKTT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dectalk_mfc.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\dtlkttse.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_DTLKTTS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_DTLKTTS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_DTLKTTS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_DTLKTTS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_DTLKTTS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_DTLKTTS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_DTLKTTS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_DTLKTTS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_DTLKTTS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DTLKTTS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\Api\dtlkttse.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\API\GeneralDialog.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_GENER=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_GENER=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_GENER=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_GENER=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_GENER=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_GENER=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_GENER=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_GENER=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_GENER=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_GENER=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\API\BufNotify.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\GeneralDialog.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\guidseg.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_GUIDS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_GUIDS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_GUIDS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_GUIDS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_GUIDS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_GUIDS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_GUIDS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_GUIDS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_GUIDS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_GUIDS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\API\LexiconDialog.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_LEXIC=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_LEXIC=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_LEXIC=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_LEXIC=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_LEXIC=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_LEXIC=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_LEXIC=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_LEXIC=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_LEXIC=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LEXIC=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\dtlktts.h"\
	".\API\LexiconDialog.h"\
	".\API\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\mmalloc.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\opthread.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Cmd\par_char.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\pipe.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\playtone.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_PLAYT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_PLAYT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_PLAYT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_PLAYT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_PLAYT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_PLAYT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_PLAYT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_PLAYT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_PLAYT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PLAYT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Kernel\services.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_SERVI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_SERVI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_SERVI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_SERVI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_SERVI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_SERVI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_SERVI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_SERVI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_SERVI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_SERVI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\spc.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_SPC_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_SPC_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_SPC_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_SPC_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_SPC_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_SPC_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_SPC_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_SPC_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_SPC_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_SPC_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\sync.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_SYNC_=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_SYNC_=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_SYNC_=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_SYNC_=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_SYNC_=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_SYNC_=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_SYNC_=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_SYNC_=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_SYNC_=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_SYNC_=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\API\TranslateDialog.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_TRANS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_TRANS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_TRANS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_TRANS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_TRANS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_TRANS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_TRANS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_TRANS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_TRANS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_TRANS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\API\TranslateDialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\Src\Kernel\Usa_init.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\VoiceDef.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_VOICE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_VOICE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_VOICE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_VOICE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_VOICE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_VOICE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_VOICE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_VOICE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_VOICE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_VOICE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	"..\..\samples\wttstest\idec.h"\
	".\Api\ctools.h"\
	".\Api\dtlktts.h"\
	".\API\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\vtmiont.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

DEP_CPP_VTMIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

DEP_CPP_VTMIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_VTMIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

DEP_CPP_VTMIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_VTMIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_VTMIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_VTMIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_VTMIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_VTMIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_VTMIO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	"..\..\samples\ttstest\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\Wtlkttse.def
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\Api\ctools.h
# End Source File
# Begin Source File

SOURCE=.\Api\dtlktts.h
# End Source File
# Begin Source File

SOURCE=.\Api\dtlkttse.h
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\mmalloc.h
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\nt\opthread.h
# End Source File
# Begin Source File

SOURCE=.\Api\VoiceDef.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
