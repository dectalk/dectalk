# Microsoft Developer Studio Project File - Name="wttsdtlk" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=wttsdtlk - Win32 Debug French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Wttsdtlk.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wttsdtlk.mak" CFG="wttsdtlk - Win32 Debug French"
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
!MESSAGE "wttsdtlk - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

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
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MT /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
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

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release French"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wttsdtlk___Win32_Release_French"
# PROP BASE Intermediate_Dir "wttsdtlk___Win32_Release_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkttse\fr\release"
# PROP Intermediate_Dir ".\..\build\wtlkttse\fr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\..\build\wtlkttse\us\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40c /fo".\..\build\wtlkttse\fr\release\link\wtlktts.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\us\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\us\release\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\wtlkstat\fr\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /map /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\wtlkttse\fr\release\wtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug French"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wttsdtlk___Win32_Debug_French"
# PROP BASE Intermediate_Dir "wttsdtlk___Win32_Debug_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkttse\fr\debug"
# PROP Intermediate_Dir ".\..\build\wtlkttse\fr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /fo".\..\build\wtlkttse\gr\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /fo".\..\build\wtlkttse\fr\debug\link\wtlktts.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\wtlkstat\gr\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /map /debug /debugtype:both /machine:I386 /out:".\..\build\wtlkttse\gr\debug\wtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\wtlkstat\fr\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /map /debug /debugtype:both /machine:I386 /out:".\..\build\wtlkttse\fr\debug\wtlkttse.dll"
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
# Name "wttsdtlk - Win32 Release United Kingdom"
# Name "wttsdtlk - Win32 Debug United Kingdom"
# Name "wttsdtlk - Win32 Release French"
# Name "wttsdtlk - Win32 Debug French"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\API\AboutDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\auddest.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\audioact.cpp
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\audqueue.c
# End Source File
# Begin Source File

SOURCE=.\API\BufNotify.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\ctools.cpp
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Api\Decstd97.c
# End Source File
# Begin Source File

SOURCE=.\API\DECtalkDialogs.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\DialogSpeak.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\dtlktts.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\dtlktts.rc
# ADD BASE RSC /l 0x409 /i "Api"
# ADD RSC /l 0x409 /i "Api" /i ".\Api"
# End Source File
# Begin Source File

SOURCE=.\Api\dtlkttsc.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\dtlkttse.cpp
# End Source File
# Begin Source File

SOURCE=.\API\GeneralDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\guidseg.cpp
# End Source File
# Begin Source File

SOURCE=.\API\LexiconDialog.cpp
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\mmalloc.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\opthread.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Cmd\par_char.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\pipe.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\playtone.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Kernel\services.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\spc.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\sync.c
# End Source File
# Begin Source File

SOURCE=.\API\TranslateDialog.cpp
# End Source File
# Begin Source File

SOURCE=..\..\dapi\Src\Kernel\Usa_init.c
# End Source File
# Begin Source File

SOURCE=.\Api\VoiceDef.cpp
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\vtmiont.c
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
