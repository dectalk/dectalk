# Microsoft Developer Studio Project File - Name="devdtk43" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=devdtk43 - Win32 Debug Fuddish
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "devdtk43.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "devdtk43.mak" CFG="devdtk43 - Win32 Debug Fuddish"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "devdtk43 - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug DIGITAL API" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release DIGITAL API" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug NWS_US" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug NWS_LA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Fuddish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath "Desktop"
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "devdtk43 - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\devdtk43"
# PROP BASE Intermediate_Dir ".\devdtk43"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\us\release"
# PROP Intermediate_Dir ".\..\build\dectalk\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o".\..\build\dectalk\us\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /machine:IX86
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /pdb:none /machine:I386 /out:".\..\build\dectalk\us\release\dectalk.dll"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\devdtk40"
# PROP BASE Intermediate_Dir ".\devdtk40"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\us\debug"
# PROP Intermediate_Dir ".\..\build\dectalk\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD WARNINGS /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /debug /machine:IX86
# SUBTRACT BASE LINK32 /incremental:no
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\us\debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\devdtk43"
# PROP BASE Intermediate_Dir ".\devdtk43"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\sp\release"
# PROP Intermediate_Dir ".\..\build\dectalk\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "api" /I "acna" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x40a
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o".\..\build\dectalk\sp\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:"dectalk\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\sp\release\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\devdtk40"
# PROP BASE Intermediate_Dir ".\devdtk40"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\gr\release"
# PROP Intermediate_Dir ".\..\build\dectalk\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "api" /I "acna" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "GERMAN" /YX /FD /Zm200 /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x407
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o".\..\build\dectalk\gr\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:"dectalk\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\gr\release\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\devdtk43"
# PROP BASE Intermediate_Dir ".\devdtk43"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\la\release"
# PROP Intermediate_Dir ".\..\build\dectalk\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "api" /I "acna" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a
# ADD RSC /l 0x40a
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o"dectalk\sp\release/dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\la\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:"dectalk\sp\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\la\release\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\devdtk40"
# PROP BASE Intermediate_Dir ".\devdtk40"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\sp\debug"
# PROP Intermediate_Dir ".\..\build\dectalk\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x40a
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:"dectalk\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\sp\debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\devdtk41"
# PROP BASE Intermediate_Dir ".\devdtk41"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\gr\debug"
# PROP Intermediate_Dir ".\..\build\dectalk\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "GERMAN" /YX /FD /Zm200 /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x407
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:"dectalk\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\gr\debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\devdtk42"
# PROP BASE Intermediate_Dir ".\devdtk42"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\la\debug"
# PROP Intermediate_Dir ".\..\build\dectalk\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x40a
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:"dectalk\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\la\debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\devdtk43"
# PROP BASE Intermediate_Dir ".\devdtk43"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\multi\debug"
# PROP Intermediate_Dir ".\..\build\dectalk\multi\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "USE_CORE_DLL" /D "ACNA" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:"dectalk\us\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\multi\debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\devdtk40"
# PROP BASE Intermediate_Dir ".\devdtk40"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\multi\release"
# PROP Intermediate_Dir ".\..\build\dectalk\multi\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "api" /I "acna" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "USE_CORE_DLL" /D "ACNA" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o"dectalk\us\release/dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\us\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:"dectalk\us\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\multi\release\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "devdtk43"
# PROP BASE Intermediate_Dir "devdtk43"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\us\access32"
# PROP Intermediate_Dir ".\..\build\dectalk\us\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /D "ACNA" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\..\build\dectalk\us\release\dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\us\access32\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\us\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\us\access32\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "devdtk40"
# PROP BASE Intermediate_Dir "devdtk40"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\sp\access32"
# PROP Intermediate_Dir ".\..\build\dectalk\sp\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a
# ADD RSC /l 0x40a
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\..\build\dectalk\sp\release\dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\sp\access32\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\sp\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\sp\access32\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "devdtk41"
# PROP BASE Intermediate_Dir "devdtk41"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\gr\access32"
# PROP Intermediate_Dir ".\..\build\dectalk\gr\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "GERMAN" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /YX /FD /Zm200 /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407
# ADD RSC /l 0x407
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\..\build\dectalk\gr\release\dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\gr\access32\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\gr\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\gr\access32\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "devdtk42"
# PROP BASE Intermediate_Dir "devdtk42"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\la\access32"
# PROP Intermediate_Dir ".\..\build\dectalk\la\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a
# ADD RSC /l 0x40a
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\..\build\dectalk\la\release\dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\la\access32\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\la\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\la\access32\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk44"
# PROP BASE Intermediate_Dir "devdtk44"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\us\a32debug"
# PROP Intermediate_Dir ".\..\build\dectalk\us\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH" /D "ENGLISH_US" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /D "ACNA" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\us\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\us\a32debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk45"
# PROP BASE Intermediate_Dir "devdtk45"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\sp\a32debug"
# PROP Intermediate_Dir ".\..\build\dectalk\sp\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a
# ADD RSC /l 0x40a
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\sp\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\sp\a32debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk46"
# PROP BASE Intermediate_Dir "devdtk46"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\gr\a32debug"
# PROP Intermediate_Dir ".\..\build\dectalk\gr\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "GERMAN" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /YX /FD /Zm200 /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407
# ADD RSC /l 0x407
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\gr\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\gr\a32debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk47"
# PROP BASE Intermediate_Dir "devdtk47"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\la\a32debug"
# PROP Intermediate_Dir ".\..\build\dectalk\la\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a
# ADD RSC /l 0x40a
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\la\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\la\a32debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "devdtk43"
# PROP BASE Intermediate_Dir "devdtk43"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\uk\release"
# PROP Intermediate_Dir ".\..\build\dectalk\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x809
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\..\build\dectalk\us\release\dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\uk\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\us\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\uk\release\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk40"
# PROP BASE Intermediate_Dir "devdtk40"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\uk\debug"
# PROP Intermediate_Dir ".\..\build\dectalk\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x809
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\us\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\uk\debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "devdtk43"
# PROP BASE Intermediate_Dir "devdtk43"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\uk\access32"
# PROP Intermediate_Dir ".\..\build\dectalk\uk\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x809
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\..\build\dectalk\us\access32\dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\uk\access32\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\us\access32\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\uk\access32\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk40"
# PROP BASE Intermediate_Dir "devdtk40"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\uk\a32debug"
# PROP Intermediate_Dir ".\..\build\dectalk\uk\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH" /D "ENGLISH_UK" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x809
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\us\a32debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\uk\a32debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk43"
# PROP BASE Intermediate_Dir "devdtk43"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\nws_us\debug"
# PROP Intermediate_Dir ".\..\build\dectalk\nws_us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "NWSNOAA" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\us\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\nws_us\debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk43"
# PROP BASE Intermediate_Dir "devdtk43"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\nws_la\debug"
# PROP Intermediate_Dir ".\..\build\dectalk\nws_la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "NWSNOAA" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a
# ADD RSC /l 0x40a
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\la\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\nws_la\debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk43___Win32_Debug_French"
# PROP BASE Intermediate_Dir "devdtk43___Win32_Debug_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\fr\debug"
# PROP Intermediate_Dir ".\..\build\dectalk\fr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "FRENCH" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\us\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\fr\debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "devdtk43___Win32_Release_French"
# PROP BASE Intermediate_Dir "devdtk43___Win32_Release_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\fr\release"
# PROP Intermediate_Dir ".\..\build\dectalk\fr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "FRENCH" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\..\build\dectalk\us\release\dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\fr\release\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\us\release\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\fr\release\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk43___Win32_Debug_Access32_French"
# PROP BASE Intermediate_Dir "devdtk43___Win32_Debug_Access32_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalk\fr\a32debug"
# PROP Intermediate_Dir ".\..\build\dectalk\fr\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH" /D "ENGLISH_US" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /D "ACNA" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "FRENCH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\us\a32debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\fr\a32debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "devdtk43___Win32_Release_Access32_French"
# PROP BASE Intermediate_Dir "devdtk43___Win32_Release_Access32_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalk\fr\access32"
# PROP Intermediate_Dir ".\..\build\dectalk\fr\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /D "ACNA" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "FRENCH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\..\build\dectalk\us\access32\dectalk.bsc"
# ADD BSC32 /nologo /o".\..\build\dectalk\fr\access32\dectalk.bsc"
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\us\access32\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /machine:I386 /out:".\..\build\dectalk\fr\access32\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Fuddish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "devdtk43___Win32_Debug_Fuddish"
# PROP BASE Intermediate_Dir "devdtk43___Win32_Debug_Fuddish"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\build\dectalk\ef\debug"
# PROP Intermediate_Dir "..\build\dectalk\ef\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "FUDD" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\us\debug\dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /debug /debugtype:both /machine:IX86 /out:".\..\build\dectalk\ef\debug\dectalk.dll"
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "devdtk43 - Win32 Release"
# Name "devdtk43 - Win32 Debug"
# Name "devdtk43 - Win32 Release Spanish"
# Name "devdtk43 - Win32 Release German"
# Name "devdtk43 - Win32 Release Latin American"
# Name "devdtk43 - Win32 Debug Spanish"
# Name "devdtk43 - Win32 Debug German"
# Name "devdtk43 - Win32 Debug Latin American"
# Name "devdtk43 - Win32 Debug DIGITAL API"
# Name "devdtk43 - Win32 Release DIGITAL API"
# Name "devdtk43 - Win32 Release Access32"
# Name "devdtk43 - Win32 Release Access32 Spanish"
# Name "devdtk43 - Win32 Release Access32 German"
# Name "devdtk43 - Win32 Release Access32 Latin American"
# Name "devdtk43 - Win32 Debug Access32"
# Name "devdtk43 - Win32 Debug Access32 Spanish"
# Name "devdtk43 - Win32 Debug Access32 German"
# Name "devdtk43 - Win32 Debug Access32 Latin American"
# Name "devdtk43 - Win32 Release United Kingdom"
# Name "devdtk43 - Win32 Debug United Kingdom"
# Name "devdtk43 - Win32 Release Access32 United Kingdom"
# Name "devdtk43 - Win32 Debug Access32 United Kingdom"
# Name "devdtk43 - Win32 Debug NWS_US"
# Name "devdtk43 - Win32 Debug NWS_LA"
# Name "devdtk43 - Win32 Debug French"
# Name "devdtk43 - Win32 Release French"
# Name "devdtk43 - Win32 Debug Access32 French"
# Name "devdtk43 - Win32 Release Access32 French"
# Name "devdtk43 - Win32 Debug Fuddish"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\hlsyn\acxf1c.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\brent.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\circuit.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_char.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_cmd.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_copt.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_main.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_pars.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_phon.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_text.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_util.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\Cmd_init.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cmd_wav.c
# End Source File
# Begin Source File

SOURCE=.\API\CRYPT2.C
# End Source File
# Begin Source File

SOURCE=.\Nt\dbgwins.c
# End Source File
# Begin Source File

SOURCE=.\api\DECSTD97.C
# End Source File
# Begin Source File

SOURCE=.\DECTALK.DEF
# End Source File
# Begin Source File

SOURCE=.\hlsyn\hlframe.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\inithl.c
# End Source File
# Begin Source File

SOURCE=.\Lts\loaddict.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\log10table.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_chari.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_dict.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_homo.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_math.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_proc.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_spel.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_speli.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_suff.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_suffi.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_adju.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_coni.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_fr.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_gr.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_ir.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_it.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_ja.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_rtbi.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_rule.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_sl.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_sp.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_task.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_us.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_util.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsw_main.c
# End Source File
# Begin Source File

SOURCE=.\NT\mmalloc.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\nasalf1x.c
# End Source File
# Begin Source File

SOURCE=.\NT\opthread.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_ambi.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\Par_char.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\Par_dict.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\Par_pars.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_rule.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_aloph.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_claus.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_draw.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_drwt0.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_inton.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_main.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_romi.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_setar.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_sort.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_syl.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_syntx.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_task.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_timng.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_vdefi.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_vset.c
# End Source File
# Begin Source File

SOURCE=.\Ph\phinit.c
# End Source File
# Begin Source File

SOURCE=.\Ph\phlog.c
# End Source File
# Begin Source File

SOURCE=.\PH\phprint.c
# End Source File
# Begin Source File

SOURCE=.\nt\PIPE.C
# End Source File
# Begin Source File

SOURCE=.\NT\playaud.c
# End Source File
# Begin Source File

SOURCE=.\vtm\PLAYTONE.C
# End Source File
# Begin Source File

SOURCE=.\kernel\SERVICES.C
# End Source File
# Begin Source File

SOURCE=.\nt\SPC.C
# End Source File
# Begin Source File

SOURCE=.\hlsyn\sqrttable.c
# End Source File
# Begin Source File

SOURCE=.\vtm\SYNC.C
# End Source File
# Begin Source File

SOURCE=.\api\ttsapi.c
# End Source File
# Begin Source File

SOURCE=.\kernel\USA_INIT.C
# End Source File
# Begin Source File

SOURCE=.\Vtm\vtm.c
# End Source File
# Begin Source File

SOURCE=.\vtm\VTMIONT.C
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\include\186.h
# End Source File
# Begin Source File

SOURCE=.\include\audioapi.h
# End Source File
# Begin Source File

SOURCE=.\Include\Audiodef.h
# End Source File
# Begin Source File

SOURCE=.\INCLUDE\bachus.h
# End Source File
# Begin Source File

SOURCE=.\INCLUDE\bachusfeatures.h
# End Source File
# Begin Source File

SOURCE=.\INCLUDE\bachusi.h
# End Source File
# Begin Source File

SOURCE=.\Cmd\Cm_copt.h
# End Source File
# Begin Source File

SOURCE=.\Cmd\Cm_util.h
# End Source File
# Begin Source File

SOURCE=.\include\cmd.h
# End Source File
# Begin Source File

SOURCE=.\nt\dbgwins.h
# End Source File
# Begin Source File

SOURCE=.\include\dectalk.h
# End Source File
# Begin Source File

SOURCE=.\include\defs.h
# End Source File
# Begin Source File

SOURCE=.\include\esc.h
# End Source File
# Begin Source File

SOURCE=.\hlsyn\flavor.h
# End Source File
# Begin Source File

SOURCE=.\include\ger_def.h
# End Source File
# Begin Source File

SOURCE=.\include\ger_err.tab
# End Source File
# Begin Source File

SOURCE=.\include\ger_phon.tab
# End Source File
# Begin Source File

SOURCE=.\include\ger_type.tab
# End Source File
# Begin Source File

SOURCE=.\include\hardw.h
# End Source File
# Begin Source File

SOURCE=.\hlsyn\hlsyn.h
# End Source File
# Begin Source File

SOURCE=.\include\iso_char.h
# End Source File
# Begin Source File

SOURCE=.\include\kernel.h
# End Source File
# Begin Source File

SOURCE=.\Include\L_com_ph.h
# End Source File
# Begin Source File

SOURCE=.\Include\L_gr_ph.h
# End Source File
# Begin Source File

SOURCE=.\INCLUDE\l_la_ph.h
# End Source File
# Begin Source File

SOURCE=.\Include\L_sp_ph.h
# End Source File
# Begin Source File

SOURCE=.\Include\L_us_ph.h
# End Source File
# Begin Source File

SOURCE=.\INCLUDE\la_def.h
# End Source File
# Begin Source File

SOURCE=.\INCLUDE\la_err.tab
# End Source File
# Begin Source File

SOURCE=.\INCLUDE\la_phon.tab
# End Source File
# Begin Source File

SOURCE=.\INCLUDE\la_type.tab
# End Source File
# Begin Source File

SOURCE=.\hlsyn\llsyn.h
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_dict.h
# End Source File
# Begin Source File

SOURCE=.\include\ls_feat.tab
# End Source File
# Begin Source File

SOURCE=.\include\ls_fold.tab
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_homo.h
# End Source File
# Begin Source File

SOURCE=.\include\ls_lower.tab
# End Source File
# Begin Source File

SOURCE=.\include\ls_upper.tab
# End Source File
# Begin Source File

SOURCE=.\nt\mmalloc.h
# End Source File
# Begin Source File

SOURCE=.\include\mulawi.h
# End Source File
# Begin Source File

SOURCE=.\nt\opthread.h
# End Source File
# Begin Source File

SOURCE=.\Cmd\Par_rule.h
# End Source File
# Begin Source File

SOURCE=.\include\pcport.h
# End Source File
# Begin Source File

SOURCE=.\Include\Pipe.h
# End Source File
# Begin Source File

SOURCE=.\nt\playaud.h
# End Source File
# Begin Source File

SOURCE=.\include\port.h
# End Source File
# Begin Source File

SOURCE=.\hlsyn\reson.h
# End Source File
# Begin Source File

SOURCE=.\include\spa_def.h
# End Source File
# Begin Source File

SOURCE=.\include\spa_err.tab
# End Source File
# Begin Source File

SOURCE=.\include\spa_phon.tab
# End Source File
# Begin Source File

SOURCE=.\include\spa_type.tab
# End Source File
# Begin Source File

SOURCE=.\hlsyn\synth.h
# End Source File
# Begin Source File

SOURCE=.\api\ttsapi.h
# End Source File
# Begin Source File

SOURCE=.\include\usa_def.h
# End Source File
# Begin Source File

SOURCE=.\include\usa_err.tab
# End Source File
# Begin Source File

SOURCE=.\include\usa_phon.tab
# End Source File
# Begin Source File

SOURCE=.\include\usa_type.tab
# End Source File
# Begin Source File

SOURCE=.\include\version.h
# End Source File
# Begin Source File

SOURCE=.\Vtm\Vtm.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
