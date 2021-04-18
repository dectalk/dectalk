# Microsoft Developer Studio Project File - Name="Sapi5" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=Sapi5 - Win32 Debug French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "sapi5.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "sapi5.mak" CFG="Sapi5 - Win32 Debug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Sapi5 - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Sapi5 - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Sapi5"
# PROP BASE Intermediate_Dir ".\Sapi5"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\us\release"
# PROP Intermediate_Dir ".\build\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\src" /I ".\include" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /I ".\idl" /D "NDEBUG" /D "ENGLISH_US" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409 /fo".\build\us\release/ttseng.res" /d "NDEBUG" /d "ENGLISH_US"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /machine:IX86
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\devdtk40"
# PROP BASE Intermediate_Dir ".\devdtk40"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\debug"
# PROP Intermediate_Dir ".\build\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I ".." /I ".\src" /I "..\dapi\src\hlsyn" /I ".\include" /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /I ".\idl" /D "_DEBUG" /D "ENGLISH_US" /win32
# SUBTRACT MTL /mktyplib203 /Oicf
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409 /fo".\build\us\debug/ttseng.res" /d "_DEBUG" /d "ENGLISH_US"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /debug /machine:IX86
# SUBTRACT BASE LINK32 /incremental:no
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /pdbtype:sept /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Sapi5"
# PROP BASE Intermediate_Dir ".\Sapi5"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\sp\release"
# PROP Intermediate_Dir ".\build\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "api" /I "acna" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\src" /I ".\include" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /I ".\idl" /D "NDEBUG" /D "SPANISH_SP" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x40a /fo".\build\sp\release/ttseng.res" /d "NDEBUG" /d "SPANISH_SP"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o".\..\build\dectalk\sp\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:"dectalk\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\devdtk40"
# PROP BASE Intermediate_Dir ".\devdtk40"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\gr\release"
# PROP Intermediate_Dir ".\build\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "api" /I "acna" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "NDEBUG" /D "GERMAN" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /Zm200 /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /I ".\idl" /D "NDEBUG" /D "GERMAN" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x407 /fo".\build\gr\release/ttseng.res" /d "NDEBUG" /d "GERMAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o".\..\build\dectalk\gr\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:"dectalk\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Sapi5"
# PROP BASE Intermediate_Dir ".\Sapi5"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\la\release"
# PROP Intermediate_Dir ".\build\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "api" /I "acna" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\src" /I ".\include" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /I ".\idl" /D "NDEBUG" /D "SPANISH_LA" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x40a
# ADD RSC /l 0x40a /fo".\build\la\release/ttseng.res" /d "NDEBUG" /d "SPANISH_LA"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o"dectalk\sp\release/dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\la\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:"dectalk\sp\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\devdtk40"
# PROP BASE Intermediate_Dir ".\devdtk40"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\sp\debug"
# PROP Intermediate_Dir ".\build\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /I ".\idl" /D "_DEBUG" /D "SPANISH_SP" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x40a /fo".\build\sp\debug/ttseng.res" /d "_DEBUG" /d "SPANISH_SP"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:"dectalk\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /pdbtype:sept /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\devdtk41"
# PROP BASE Intermediate_Dir ".\devdtk41"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\gr\debug"
# PROP Intermediate_Dir ".\build\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "GERMAN" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /Zm200 /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /I ".\idl" /D "_DEBUG" /D "GERMAN" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x407 /fo".\build\gr\debug/ttseng.res" /d "_DEBUG" /d "GERMAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:"dectalk\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /pdbtype:sept /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\devdtk42"
# PROP BASE Intermediate_Dir ".\devdtk42"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\la\debug"
# PROP Intermediate_Dir ".\build\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /I ".\idl" /D "_DEBUG" /D "SPANISH_LA" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x40a /fo".\build\la\debug/ttseng.res" /d "_DEBUG" /d "SPANISH_LA"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:"dectalk\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /pdbtype:sept /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Sapi5"
# PROP BASE Intermediate_Dir "Sapi5"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\uk\release"
# PROP Intermediate_Dir ".\build\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /I ".\idl" /D "NDEBUG" /D "ENGLISH_UK" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x809 /fo".\build\uk\release/ttseng.res" /d "NDEBUG" /d "ENGLISH_UK"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\..\build\dectalk\us\release\dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\uk\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\us\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk40"
# PROP BASE Intermediate_Dir "devdtk40"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\uk\debug"
# PROP Intermediate_Dir ".\build\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /I ".\idl" /D "_DEBUG" /D "ENGLISH_UK" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x809 /fo".\build\la\debug/ttseng.res" /d "_DEBUG" /d "ENGLISH_UK"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\us\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /pdbtype:sept /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Sapi5___Win32_Debug_French"
# PROP BASE Intermediate_Dir "Sapi5___Win32_Debug_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\fr\debug"
# PROP Intermediate_Dir ".\build\fr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT BASE CPP /YX
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "FRENCH" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /I ".\idl" /D "_DEBUG" /D "SPANISH_SP" /win32
# SUBTRACT BASE MTL /mktyplib203
# ADD MTL /nologo /I ".\idl" /D "_DEBUG" /D "FRENCH" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x40a /fo".\build\sp\debug/ttseng.res" /d "_DEBUG" /d "SPANISH_SP"
# ADD RSC /l 0x40c /fo".\build\fr\debug/ttseng.res" /d "_DEBUG" /d "FRENCH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\build\sp\debug/sapi5.dll" /pdbtype:sept /libpath:".\lib\i386"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /pdbtype:sept /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Sapi5___Win32_Release_French"
# PROP BASE Intermediate_Dir "Sapi5___Win32_Release_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\fr\release"
# PROP Intermediate_Dir ".\build\fr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\src" /I ".\include" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT BASE CPP /YX
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\src" /I ".\include" /D "NDEBUG" /D "FRENCH" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /FD /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /I ".\idl" /D "NDEBUG" /D "SPANISH_SP" /win32
# SUBTRACT BASE MTL /mktyplib203
# ADD MTL /nologo /I ".\idl" /D "NDEBUG" /D "FRENCH" /win32
# SUBTRACT MTL /mktyplib203
# ADD BASE RSC /l 0x40a /fo".\build\sp\release/ttseng.res" /d "NDEBUG" /d "SPANISH_SP"
# ADD RSC /l 0x40c /fo".\build\fr\release/ttseng.res" /d "NDEBUG" /d "FRENCH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\..\build\dectalk\sp\release\dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\sp\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /out:".\build\sp\release/sapi5.dll" /libpath:".\lib\i386"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /libpath:".\lib\i386"
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "Sapi5 - Win32 Release"
# Name "Sapi5 - Win32 Debug"
# Name "Sapi5 - Win32 Release Spanish"
# Name "Sapi5 - Win32 Release German"
# Name "Sapi5 - Win32 Release Latin American"
# Name "Sapi5 - Win32 Debug Spanish"
# Name "Sapi5 - Win32 Debug German"
# Name "Sapi5 - Win32 Debug Latin American"
# Name "Sapi5 - Win32 Release United Kingdom"
# Name "Sapi5 - Win32 Debug United Kingdom"
# Name "Sapi5 - Win32 Debug French"
# Name "Sapi5 - Win32 Release French"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=..\dapi\src\hlsyn\acxf1c.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\hlsyn\brent.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\hlsyn\circuit.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\cm_char.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\cm_cmd.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\cm_copt.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\cm_main.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\cm_pars.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\cm_phon.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\cm_text.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\cm_util.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\Cmd_init.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\cmd_wav.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\API\CRYPT2.C
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Nt\dbgwins.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\api\DECSTD97.C
# End Source File
# Begin Source File

SOURCE=..\dapi\src\hlsyn\hlframe.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\hlsyn\inithl.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\loaddict.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\hlsyn\log10table.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\ls_chari.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\ls_dict.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\ls_homo.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\ls_math.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\ls_proc.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\ls_spel.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\ls_speli.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\ls_suff.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\ls_suffi.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_adju.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_coni.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_fr.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_gr.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_ir.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_it.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_ja.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_rtbi.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_rule.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_sl.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_sp.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_task.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_us.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsa_util.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\lsw_main.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\NT\mmalloc.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\hlsyn\nasalf1x.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\NT\opthread.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\par_ambi.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\Par_char.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\Par_dict.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\Par_pars.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\par_rule.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_aloph.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_claus.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_draw.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_drwt0.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_inton.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_main.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_romi.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_setar.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_sort.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_syl.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_syntx.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_task.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_timng.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_vdefi.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\ph_vset.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\phinit.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Ph\phlog.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\PH\phprint.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\nt\PIPE.C
# End Source File
# Begin Source File

SOURCE=..\dapi\src\NT\playaud.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\vtm\PLAYTONE.C
# End Source File
# Begin Source File

SOURCE=.\src\sapiiont.cpp
# End Source File
# Begin Source File

SOURCE=..\dapi\src\kernel\SERVICES.C
# End Source File
# Begin Source File

SOURCE=..\dapi\src\nt\SPC.C
# End Source File
# Begin Source File

SOURCE=..\dapi\src\hlsyn\sqrttable.c
# End Source File
# Begin Source File

SOURCE=.\src\stdafx.cpp
# End Source File
# Begin Source File

SOURCE=..\dapi\src\vtm\SYNC.C
# End Source File
# Begin Source File

SOURCE=..\dapi\src\api\ttsapi.c
# End Source File
# Begin Source File

SOURCE=.\src\ttseng.cpp
# End Source File
# Begin Source File

SOURCE=.\src\ttseng.def
# End Source File
# Begin Source File

SOURCE=.\src\ttseng.idl
# End Source File
# Begin Source File

SOURCE=.\src\ttseng.rc
# End Source File
# Begin Source File

SOURCE=.\src\ttsengobj.cpp
# End Source File
# Begin Source File

SOURCE=..\dapi\src\kernel\USA_INIT.C
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Vtm\vtm.c
# End Source File
# Begin Source File

SOURCE=..\dapi\src\vtm\VTMIONT.C
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=..\dapi\src\include\186.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\audioapi.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Include\Audiodef.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\Cm_copt.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\Cm_util.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\cmd.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\nt\dbgwins.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\dectalk.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\defs.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\esc.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\ger_def.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\ger_err.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\ger_phon.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\ger_type.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\hardw.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\iso_char.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\kernel.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Include\L_com_ph.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Include\L_gr_ph.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\INCLUDE\l_la_ph.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Include\L_sp_ph.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Include\L_us_ph.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\INCLUDE\la_def.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\INCLUDE\la_err.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\INCLUDE\la_phon.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\INCLUDE\la_type.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\Ls_dict.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\ls_feat.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\ls_fold.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Lts\Ls_homo.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\ls_lower.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\ls_upper.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\nt\mmalloc.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\mulawi.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\nt\opthread.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Cmd\Par_rule.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\pcport.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Include\Pipe.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\nt\playaud.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\port.h
# End Source File
# Begin Source File

SOURCE=.\src\resource.h
# End Source File
# Begin Source File

SOURCE=.\src\sapiiont.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\spa_def.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\spa_err.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\spa_phon.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\spa_type.tab
# End Source File
# Begin Source File

SOURCE=.\src\stdafx.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\api\ttsapi.h
# End Source File
# Begin Source File

SOURCE=.\src\ttsengobj.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\usa_def.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\usa_err.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\usa_phon.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\usa_type.tab
# End Source File
# Begin Source File

SOURCE=..\dapi\src\include\version.h
# End Source File
# Begin Source File

SOURCE=..\dapi\src\Vtm\Vtm.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\src\ttsengobj.rgs
# End Source File
# End Group
# End Target
# End Project
