# Microsoft Developer Studio Project File - Name="dtstatic" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=dtstatic - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "dtstatic.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dtstatic.mak" CFG="dtstatic - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dtstatic - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release German" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug German" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release Demo" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release Demo Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release Demo German" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release Demo Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug Demo" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug Demo Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug Demo German" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug Demo Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release Demo United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug Demo United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release French" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug French" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Release Demo French" (based on "Win32 (x86) Static Library")
!MESSAGE "dtstatic - Win32 Debug Demo French" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "dtstatic - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\us\release"
# PROP Intermediate_Dir ".\..\build\dtstatic\us\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "NDEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\us\debug"
# PROP Intermediate_Dir ".\..\build\dtstatic\us\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "_DEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\dtstati0"
# PROP BASE Intermediate_Dir ".\dtstati0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\sp\release"
# PROP Intermediate_Dir ".\..\build\dtstatic\sp\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "api" /I "acna" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "SPANISH" /D "SPANISH_SP" /D "NDEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\dtstati1"
# PROP BASE Intermediate_Dir ".\dtstati1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\gr\release"
# PROP Intermediate_Dir ".\..\build\dtstatic\gr\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "api" /I "acna" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "GERMAN" /D "NDEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /Zm200 /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\dtstatic"
# PROP BASE Intermediate_Dir ".\dtstatic"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\la\release"
# PROP Intermediate_Dir ".\..\build\dtstatic\la\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "api" /I "acna" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "DEMO" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "SPANISH" /D "SPANISH_LA" /D "NDEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\dtstati0"
# PROP BASE Intermediate_Dir ".\dtstati0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\sp\debug"
# PROP Intermediate_Dir ".\..\build\dtstatic\sp\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I "api" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "DEMO" /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "SPANISH" /D "SPANISH_SP" /D "_DEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\dtstati1"
# PROP BASE Intermediate_Dir ".\dtstati1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\gr\debug"
# PROP Intermediate_Dir ".\..\build\dtstatic\gr\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I "api" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "DEMO" /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "GERMAN" /D "_DEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /Zm200 /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\dtstati2"
# PROP BASE Intermediate_Dir ".\dtstati2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\la\debug"
# PROP Intermediate_Dir ".\..\build\dtstatic\la\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I "api" /I "cmd" /I "lts" /I "ph" /I "vtm" /I "kernel" /I "nt" /I "include" /I "protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "DEMO" /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "SPANISH" /D "SPANISH_LA" /D "_DEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release Demo"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtstatic"
# PROP BASE Intermediate_Dir "dtstatic"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\us\demo"
# PROP Intermediate_Dir ".\..\build\dtstatic\us\demo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "DEMO" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "DEMO" /D "ENGLISH" /D "ENGLISH_US" /D "ACNA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release Demo Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtstati0"
# PROP BASE Intermediate_Dir "dtstati0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\sp\demo"
# PROP Intermediate_Dir ".\..\build\dtstatic\sp\demo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "DEMO" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "DEMO" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release Demo German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtstati1"
# PROP BASE Intermediate_Dir "dtstati1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\gr\demo"
# PROP Intermediate_Dir ".\..\build\dtstatic\gr\demo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "GERMAN" /D "DEMO" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "DEMO" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /Zm200 /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release Demo Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtstati2"
# PROP BASE Intermediate_Dir "dtstati2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\la\demo"
# PROP Intermediate_Dir ".\..\build\dtstatic\la\demo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "DEMO" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "DEMO" /D "SPANISH_LA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug Demo"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtstati3"
# PROP BASE Intermediate_Dir "dtstati3"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\us\dbgdemo"
# PROP Intermediate_Dir ".\..\build\dtstatic\us\dbgdemo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "DEMO" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "DEMO" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug Demo Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtstati4"
# PROP BASE Intermediate_Dir "dtstati4"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\sp\dbgdemo"
# PROP Intermediate_Dir ".\..\build\dtstatic\sp\dbgdemo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "DEMO" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "DEMO" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug Demo German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtstati5"
# PROP BASE Intermediate_Dir "dtstati5"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\gr\dbgdemo"
# PROP Intermediate_Dir ".\..\build\dtstatic\gr\dbgdemo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "GERMAN" /D "DEMO" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "GERMAN" /D "DEMO" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /Zm200 /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug Demo Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtstati6"
# PROP BASE Intermediate_Dir "dtstati6"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\la\dbgdemo"
# PROP Intermediate_Dir ".\..\build\dtstatic\la\dbgdemo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "LATIN_AMERICAN" /D "DEMO" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "DEMO" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtstatic"
# PROP BASE Intermediate_Dir "dtstatic"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\uk\release"
# PROP Intermediate_Dir ".\..\build\dtstatic\uk\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "i386" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "ENGLISH_UK" /D "ENGLISH" /D "NDEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtstati0"
# PROP BASE Intermediate_Dir "dtstati0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\uk\debug"
# PROP Intermediate_Dir ".\..\build\dtstatic\uk\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "i386" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "ENGLISH_UK" /D "ENGLISH" /D "_DEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release Demo United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtstati1"
# PROP BASE Intermediate_Dir "dtstati1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\uk\demo"
# PROP Intermediate_Dir ".\..\build\dtstatic\uk\demo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "i386" /D "DEMO" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "DEMO" /D "ENGLISH_UK" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug Demo United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtstati2"
# PROP BASE Intermediate_Dir "dtstati2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\uk\dbgdemo"
# PROP Intermediate_Dir ".\..\build\dtstatic\uk\dbgdemo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "i386" /D "DEMO" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "DEMO" /D "ENGLISH_UK" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtstatic___Win32_Release_French"
# PROP BASE Intermediate_Dir "dtstatic___Win32_Release_French"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\fr\release"
# PROP Intermediate_Dir ".\..\build\dtstatic\fr\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "i386" /D "TYPING_MODE" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /D "ACCESS32" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "FRENCH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtstatic___Win32_Debug_French"
# PROP BASE Intermediate_Dir "dtstatic___Win32_Debug_French"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\fr\debug"
# PROP Intermediate_Dir ".\..\build\dtstatic\fr\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "i386" /D "TYPING_MODE" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /D "ACCESS32" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "FRENCH" /D "_DEBUG" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Release Demo French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtstatic___Win32_Release_Demo_French"
# PROP BASE Intermediate_Dir "dtstatic___Win32_Release_Demo_French"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtstatic\fr\demo"
# PROP Intermediate_Dir ".\..\build\dtstatic\fr\demo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "i386" /D "SPANISH" /D "SPANISH_SP" /D "DEMO" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "FRENCH" /D "DEMO" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "dtstatic - Win32 Debug Demo French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtstatic___Win32_Debug_Demo_French"
# PROP BASE Intermediate_Dir "dtstatic___Win32_Debug_Demo_French"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtstatic\fr\dbgdemo"
# PROP Intermediate_Dir ".\..\build\dtstatic\fr\dbgdemo\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "i386" /D "SPANISH" /D "SPANISH_SP" /D "DEMO" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "FRENCH" /D "DEMO" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF 

# Begin Target

# Name "dtstatic - Win32 Release"
# Name "dtstatic - Win32 Debug"
# Name "dtstatic - Win32 Release Spanish"
# Name "dtstatic - Win32 Release German"
# Name "dtstatic - Win32 Release Latin American"
# Name "dtstatic - Win32 Debug Spanish"
# Name "dtstatic - Win32 Debug German"
# Name "dtstatic - Win32 Debug Latin American"
# Name "dtstatic - Win32 Release Demo"
# Name "dtstatic - Win32 Release Demo Spanish"
# Name "dtstatic - Win32 Release Demo German"
# Name "dtstatic - Win32 Release Demo Latin American"
# Name "dtstatic - Win32 Debug Demo"
# Name "dtstatic - Win32 Debug Demo Spanish"
# Name "dtstatic - Win32 Debug Demo German"
# Name "dtstatic - Win32 Debug Demo Latin American"
# Name "dtstatic - Win32 Release United Kingdom"
# Name "dtstatic - Win32 Debug United Kingdom"
# Name "dtstatic - Win32 Release Demo United Kingdom"
# Name "dtstatic - Win32 Debug Demo United Kingdom"
# Name "dtstatic - Win32 Release French"
# Name "dtstatic - Win32 Debug French"
# Name "dtstatic - Win32 Release Demo French"
# Name "dtstatic - Win32 Debug Demo French"
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

SOURCE=.\Api\Crypt2.c
# End Source File
# Begin Source File

SOURCE=.\NT\dbgwins.c
# End Source File
# Begin Source File

SOURCE=.\Api\Decstd97.c
# End Source File
# Begin Source File

SOURCE=.\dectalk.def
# End Source File
# Begin Source File

SOURCE=.\hlsyn\diffuse.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\fixfft32.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\frame.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\hlframe.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\inithl.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\llinit.c
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

SOURCE=.\Lts\Lsa_adju.c
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

SOURCE=.\Nt\mmalloc.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\nasalf1x.c
# End Source File
# Begin Source File

SOURCE=.\Nt\opthread.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_ambi.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_char.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_dict.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_pars.c
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

SOURCE=.\Nt\pipe.c
# End Source File
# Begin Source File

SOURCE=.\Nt\playaud.c
# End Source File
# Begin Source File

SOURCE=.\Vtm\playtone.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\reson.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\sample.c
# End Source File
# Begin Source File

SOURCE=.\Kernel\services.c
# End Source File
# Begin Source File

SOURCE=.\Nt\spc.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\sqrttable.c
# End Source File
# Begin Source File

SOURCE=.\Vtm\sync.c
# End Source File
# Begin Source File

SOURCE=.\Api\ttsapi.c
# End Source File
# Begin Source File

SOURCE=.\Kernel\Usa_init.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\voice.c
# End Source File
# Begin Source File

SOURCE=.\Vtm\vtm.c
# End Source File
# Begin Source File

SOURCE=.\Vtm\vtmiont.c
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

SOURCE=.\Include\L_sp_ph.h
# End Source File
# Begin Source File

SOURCE=.\Include\L_us_ph.h
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

SOURCE=.\Cmd\par_rule.h
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
