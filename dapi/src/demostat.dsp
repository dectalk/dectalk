# Microsoft Developer Studio Project File - Name="demostat" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (ALPHA) Static Library" 0x0604
# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=demostat - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "demostat.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "demostat.mak" CFG="demostat - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "demostat - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release German" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug German" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 ALPHA Release" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "demostat - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\WinRel"
# PROP BASE Intermediate_Dir ".\WinRel"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\demostat\us\release"
# PROP Intermediate_Dir ".\..\build\demostat\us\release\link"
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\WinDebug"
# PROP BASE Intermediate_Dir ".\WinDebug"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\demostat\us\debug"
# PROP Intermediate_Dir ".\..\build\demostat\us\debug\link"
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\demosta0"
# PROP BASE Intermediate_Dir ".\demosta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\demostat\sp\release"
# PROP Intermediate_Dir ".\..\build\demostat\sp\release\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\demosta1"
# PROP BASE Intermediate_Dir ".\demosta1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\demostat\gr\release"
# PROP Intermediate_Dir ".\..\build\demostat\gr\release\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "GERMAN" /YX /FD /Zm200 /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\demosta0"
# PROP BASE Intermediate_Dir ".\demosta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\demostat\la\release"
# PROP Intermediate_Dir ".\..\build\demostat\la\release\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\demosta1"
# PROP BASE Intermediate_Dir ".\demosta1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\demostat\sp\debug"
# PROP Intermediate_Dir ".\..\build\demostat\sp\debug\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /Z7 /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\demosta2"
# PROP BASE Intermediate_Dir ".\demosta2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\demostat\gr\debug"
# PROP Intermediate_Dir ".\..\build\demostat\gr\debug\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /Z7 /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "GERMAN" /YX /FD /Zm200 /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\demosta3"
# PROP BASE Intermediate_Dir ".\demosta3"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\demostat\la\debug"
# PROP Intermediate_Dir ".\..\build\demostat\la\debug\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /Z7 /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "demostat"
# PROP BASE Intermediate_Dir "demostat"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\demostat\us\release"
# PROP Intermediate_Dir ".\..\alpha\demostat\us\release\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /D "ACNA" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "demosta0"
# PROP BASE Intermediate_Dir "demosta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\demostat\us\debug"
# PROP Intermediate_Dir ".\..\alpha\demostat\us\debug\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /D "ACNA" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "demostat"
# PROP BASE Intermediate_Dir "demostat"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\demostat\sp\release"
# PROP Intermediate_Dir ".\..\alpha\demostat\sp\release\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /D "ALPHA" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "demosta0"
# PROP BASE Intermediate_Dir "demosta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\demostat\gr\release"
# PROP Intermediate_Dir ".\..\alpha\demostat\gr\release\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "GERMAN" /D "ALPHA" /YX /FD /Zm200 /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "demosta1"
# PROP BASE Intermediate_Dir "demosta1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\demostat\la\release"
# PROP Intermediate_Dir ".\..\alpha\demostat\la\release\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "demosta2"
# PROP BASE Intermediate_Dir "demosta2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\demostat\sp\debug"
# PROP Intermediate_Dir ".\..\alpha\demostat\sp\debug\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /D "ALPHA" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "demosta3"
# PROP BASE Intermediate_Dir "demosta3"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\demostat\gr\debug"
# PROP Intermediate_Dir ".\..\alpha\demostat\gr\debug\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "GERMAN" /D "ALPHA" /YX /FD /Zm200 /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "demosta4"
# PROP BASE Intermediate_Dir "demosta4"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\demostat\la\debug"
# PROP Intermediate_Dir ".\..\alpha\demostat\la\debug\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF 

# Begin Target

# Name "demostat - Win32 Release"
# Name "demostat - Win32 Debug"
# Name "demostat - Win32 Release Spanish"
# Name "demostat - Win32 Release German"
# Name "demostat - Win32 Release Latin American"
# Name "demostat - Win32 Debug Spanish"
# Name "demostat - Win32 Debug German"
# Name "demostat - Win32 Debug Latin American"
# Name "demostat - Win32 ALPHA Release"
# Name "demostat - Win32 ALPHA Debug"
# Name "demostat - Win32 ALPHA Release Spanish"
# Name "demostat - Win32 ALPHA Release German"
# Name "demostat - Win32 ALPHA Release Latin American"
# Name "demostat - Win32 ALPHA Debug Spanish"
# Name "demostat - Win32 ALPHA Debug German"
# Name "demostat - Win32 ALPHA Debug Latin American"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\Cmd\cm_char.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_CM_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_CM_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_CM_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_CM_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_cmd.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_CM_CM=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_CM_CM=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_CM=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_CM_CM=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_CM=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_CM=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_CM_CM=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_CM=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_copt.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_CM_CO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\Cm_copt.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\version.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_CM_CO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\Cm_copt.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\version.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_CO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\Cm_copt.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\version.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_CM_CO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\Cm_copt.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\version.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_CO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\Cm_copt.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\version.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_CO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\Cm_copt.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\version.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_CM_CO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\Cm_copt.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\version.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_CO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\Cm_copt.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\version.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_main.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_CM_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_CM_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_CM_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_CM_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_pars.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_CM_PA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_CM_PA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_PA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_CM_PA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_PA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_PA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_CM_PA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_PA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_phon.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_CM_PH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_CM_PH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_PH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_CM_PH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_PH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_PH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_CM_PH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_PH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_text.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_CM_TE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_CM_TE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_TE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_CM_TE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_TE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_TE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_CM_TE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_TE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_util.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_CM_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\Cm_util.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_CM_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\Cm_util.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\Cm_util.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_CM_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\Cm_util.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\Cm_util.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\Cm_util.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_CM_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\Cm_util.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\Cm_util.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\Cmd_init.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_CMD_I=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_CMD_I=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_CMD_I=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_CMD_I=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_CMD_I=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_CMD_I=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_CMD_I=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_CMD_I=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cmd_wav.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_CMD_W=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_CMD_W=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_CMD_W=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_CMD_W=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_CMD_W=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_CMD_W=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_CMD_W=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_CMD_W=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\Decstd97.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\loaddict.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LOADD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LOADD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LOADD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LOADD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LOADD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LOADD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LOADD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LOADD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LOADD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LOADD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LOADD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LOADD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LOADD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LOADD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LOADD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LOADD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_chari.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LS_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_us_cha.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LS_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_us_cha.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_us_cha.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LS_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_us_cha.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_us_cha.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_us_cha.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LS_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_us_cha.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_CH=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_us_cha.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_CH=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_dict.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LS_DI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_DI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LS_DI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_DI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_DI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_DI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LS_DI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_DI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_DI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_DI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_DI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_DI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LS_DI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_DI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_DI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\mmalloc.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_DI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_homo.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LS_HO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\Ls_homo.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_HO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LS_HO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\Ls_homo.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_HO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_HO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\Ls_homo.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_HO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LS_HO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\Ls_homo.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_HO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_HO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\Ls_homo.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_HO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_HO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\Ls_homo.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_HO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LS_HO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\Ls_homo.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_HO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_HO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\Ls_homo.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_HO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_math.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LS_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ma1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ma1.c"\
	".\Lts\l_sp_ma1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ma1.c"\
	".\Lts\l_us_ma1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_math1.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LS_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ma1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ma1.c"\
	".\Lts\l_sp_ma1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ma1.c"\
	".\Lts\l_us_ma1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_math1.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ma1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ma1.c"\
	".\Lts\l_sp_ma1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ma1.c"\
	".\Lts\l_us_ma1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_math1.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LS_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ma1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ma1.c"\
	".\Lts\l_sp_ma1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ma1.c"\
	".\Lts\l_us_ma1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_math1.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ma1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ma1.c"\
	".\Lts\l_sp_ma1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ma1.c"\
	".\Lts\l_us_ma1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_math1.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ma1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ma1.c"\
	".\Lts\l_sp_ma1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ma1.c"\
	".\Lts\l_us_ma1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_math1.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LS_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ma1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ma1.c"\
	".\Lts\l_sp_ma1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ma1.c"\
	".\Lts\l_us_ma1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_math1.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ma1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ma1.c"\
	".\Lts\l_sp_ma1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ma1.c"\
	".\Lts\l_us_ma1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_math1.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_proc.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LS_PR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_pr1.c"\
	".\Lts\l_la_pr1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_pr1.c"\
	".\Lts\l_uk_pr1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_pr1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_PR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LS_PR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_pr1.c"\
	".\Lts\l_la_pr1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_pr1.c"\
	".\Lts\l_uk_pr1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_pr1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_PR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_PR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_pr1.c"\
	".\Lts\l_la_pr1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_pr1.c"\
	".\Lts\l_uk_pr1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_pr1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_PR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LS_PR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_pr1.c"\
	".\Lts\l_la_pr1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_pr1.c"\
	".\Lts\l_uk_pr1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_pr1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_PR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_PR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_pr1.c"\
	".\Lts\l_la_pr1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_pr1.c"\
	".\Lts\l_uk_pr1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_pr1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_PR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_PR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_pr1.c"\
	".\Lts\l_la_pr1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_pr1.c"\
	".\Lts\l_uk_pr1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_pr1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_PR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LS_PR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_pr1.c"\
	".\Lts\l_la_pr1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_pr1.c"\
	".\Lts\l_uk_pr1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_pr1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_PR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_PR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_pr1.c"\
	".\Lts\l_la_pr1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_pr1.c"\
	".\Lts\l_uk_pr1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_pr1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_PR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_spel.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LS_SP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_sp1.c"\
	".\Lts\l_la_sp1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_sp1.c"\
	".\Lts\l_uk_sp1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_sp1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_spel1.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LS_SP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_sp1.c"\
	".\Lts\l_la_sp1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_sp1.c"\
	".\Lts\l_uk_sp1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_sp1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_spel1.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_SP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_sp1.c"\
	".\Lts\l_la_sp1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_sp1.c"\
	".\Lts\l_uk_sp1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_sp1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_spel1.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LS_SP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_sp1.c"\
	".\Lts\l_la_sp1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_sp1.c"\
	".\Lts\l_uk_sp1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_sp1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_spel1.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_SP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_sp1.c"\
	".\Lts\l_la_sp1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_sp1.c"\
	".\Lts\l_uk_sp1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_sp1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_spel1.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_SP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_sp1.c"\
	".\Lts\l_la_sp1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_sp1.c"\
	".\Lts\l_uk_sp1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_sp1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_spel1.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LS_SP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_sp1.c"\
	".\Lts\l_la_sp1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_sp1.c"\
	".\Lts\l_uk_sp1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_sp1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_spel1.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_SP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_sp1.c"\
	".\Lts\l_la_sp1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_sp1.c"\
	".\Lts\l_uk_sp1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_sp1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_spel1.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_speli.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LS_SPE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_spe.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_spe.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SPE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LS_SPE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_spe.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_spe.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SPE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_SPE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_spe.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_spe.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SPE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LS_SPE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_spe.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_spe.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SPE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_SPE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_spe.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_spe.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SPE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_SPE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_spe.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_spe.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SPE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LS_SPE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_spe.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_spe.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SPE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_SPE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_spe.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_spe.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SPE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_suff.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LS_SU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LS_SU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_SU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LS_SU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_SU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_SU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LS_SU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_SU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_suffi.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LS_SUF=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_suf.c"\
	".\Lts\l_uk_suf.c"\
	".\Lts\l_us_suf.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LS_SUF=\
	".\Lts\l_sp_suf.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LS_SUF=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_suf.c"\
	".\Lts\l_uk_suf.c"\
	".\Lts\l_us_suf.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LS_SUF=\
	".\Lts\l_sp_suf.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_SUF=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_suf.c"\
	".\Lts\l_uk_suf.c"\
	".\Lts\l_us_suf.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LS_SUF=\
	".\Lts\l_sp_suf.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LS_SUF=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_suf.c"\
	".\Lts\l_uk_suf.c"\
	".\Lts\l_us_suf.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LS_SUF=\
	".\Lts\l_sp_suf.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_SUF=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_suf.c"\
	".\Lts\l_uk_suf.c"\
	".\Lts\l_us_suf.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LS_SUF=\
	".\Lts\l_sp_suf.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_SUF=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_suf.c"\
	".\Lts\l_uk_suf.c"\
	".\Lts\l_us_suf.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LS_SUF=\
	".\Lts\l_sp_suf.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LS_SUF=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_suf.c"\
	".\Lts\l_uk_suf.c"\
	".\Lts\l_us_suf.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LS_SUF=\
	".\Lts\l_sp_suf.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_SUF=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_suf.c"\
	".\Lts\l_uk_suf.c"\
	".\Lts\l_us_suf.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LS_SUF=\
	".\Lts\l_sp_suf.c"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\Lsa_adju.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_A=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ad1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ad1.c"\
	".\Lts\l_sp_ad1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ad1.c"\
	".\Lts\l_us_ad1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_adju.c"\
	".\Lts\ls_adju1.c"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_A=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_A=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ad1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ad1.c"\
	".\Lts\l_sp_ad1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ad1.c"\
	".\Lts\l_us_ad1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_adju.c"\
	".\Lts\ls_adju1.c"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_A=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_A=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ad1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ad1.c"\
	".\Lts\l_sp_ad1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ad1.c"\
	".\Lts\l_us_ad1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_adju.c"\
	".\Lts\ls_adju1.c"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_A=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_A=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ad1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ad1.c"\
	".\Lts\l_sp_ad1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ad1.c"\
	".\Lts\l_us_ad1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_adju.c"\
	".\Lts\ls_adju1.c"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_A=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_A=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ad1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ad1.c"\
	".\Lts\l_sp_ad1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ad1.c"\
	".\Lts\l_us_ad1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_adju.c"\
	".\Lts\ls_adju1.c"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_A=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_A=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ad1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ad1.c"\
	".\Lts\l_sp_ad1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ad1.c"\
	".\Lts\l_us_ad1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_adju.c"\
	".\Lts\ls_adju1.c"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_A=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_A=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ad1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ad1.c"\
	".\Lts\l_sp_ad1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ad1.c"\
	".\Lts\l_us_ad1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_adju.c"\
	".\Lts\ls_adju1.c"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_A=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_A=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_ad1.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_ad1.c"\
	".\Lts\l_sp_ad1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_ad1.c"\
	".\Lts\l_us_ad1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_adju.c"\
	".\Lts\ls_adju1.c"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_A=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_coni.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\Lts\l_ac_con.c"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_con.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_con.c"\
	".\Lts\l_sp_con.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_con.c"\
	".\Lts\l_us_con.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_consi.c"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\Lts\l_ac_con.c"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_con.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_con.c"\
	".\Lts\l_sp_con.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_con.c"\
	".\Lts\l_us_con.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_consi.c"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\Lts\l_ac_con.c"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_con.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_con.c"\
	".\Lts\l_sp_con.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_con.c"\
	".\Lts\l_us_con.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_consi.c"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\Lts\l_ac_con.c"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_con.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_con.c"\
	".\Lts\l_sp_con.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_con.c"\
	".\Lts\l_us_con.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_consi.c"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\Lts\l_ac_con.c"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_con.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_con.c"\
	".\Lts\l_sp_con.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_con.c"\
	".\Lts\l_us_con.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_consi.c"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\Lts\l_ac_con.c"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_con.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_con.c"\
	".\Lts\l_sp_con.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_con.c"\
	".\Lts\l_us_con.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_consi.c"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\Lts\l_ac_con.c"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_con.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_con.c"\
	".\Lts\l_sp_con.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_con.c"\
	".\Lts\l_us_con.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_consi.c"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\Lts\l_ac_con.c"\
	".\lts\l_com_ph.h"\
	".\Lts\l_gr_con.c"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_la_con.c"\
	".\Lts\l_sp_con.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_uk_con.c"\
	".\Lts\l_us_con.c"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_consi.c"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_fr.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_gr.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_ir.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_it.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_ja.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_main.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_main.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_main.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_main.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_main.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_main.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_main.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_main.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_main.c"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_rtbi.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_R=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_rta.c"\
	".\Lts\l_uk_rta.c"\
	".\Lts\l_us_rta.c"\
	".\Lts\ls_rtabi.c"\
	".\Lts\lsa_rta.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_R=\
	".\Lts\l_sp_rta.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_R=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_rta.c"\
	".\Lts\l_uk_rta.c"\
	".\Lts\l_us_rta.c"\
	".\Lts\ls_rtabi.c"\
	".\Lts\lsa_rta.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_R=\
	".\Lts\l_sp_rta.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_R=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_rta.c"\
	".\Lts\l_uk_rta.c"\
	".\Lts\l_us_rta.c"\
	".\Lts\ls_rtabi.c"\
	".\Lts\lsa_rta.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_R=\
	".\Lts\l_sp_rta.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_R=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_rta.c"\
	".\Lts\l_uk_rta.c"\
	".\Lts\l_us_rta.c"\
	".\Lts\ls_rtabi.c"\
	".\Lts\lsa_rta.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_R=\
	".\Lts\l_sp_rta.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_R=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_rta.c"\
	".\Lts\l_uk_rta.c"\
	".\Lts\l_us_rta.c"\
	".\Lts\ls_rtabi.c"\
	".\Lts\lsa_rta.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_R=\
	".\Lts\l_sp_rta.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_R=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_rta.c"\
	".\Lts\l_uk_rta.c"\
	".\Lts\l_us_rta.c"\
	".\Lts\ls_rtabi.c"\
	".\Lts\lsa_rta.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_R=\
	".\Lts\l_sp_rta.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_R=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_rta.c"\
	".\Lts\l_uk_rta.c"\
	".\Lts\l_us_rta.c"\
	".\Lts\ls_rtabi.c"\
	".\Lts\lsa_rta.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_R=\
	".\Lts\l_sp_rta.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_R=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\Lts\l_gr_rta.c"\
	".\Lts\l_uk_rta.c"\
	".\Lts\l_us_rta.c"\
	".\Lts\ls_rtabi.c"\
	".\Lts\lsa_rta.c"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_R=\
	".\Lts\l_sp_rta.c"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_rule.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_RU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_ru1.c"\
	".\Lts\l_la_ru1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_ru1.c"\
	".\Lts\l_uk_ru1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_ru1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_rule.c"\
	".\Lts\ls_rule1.c"\
	".\Lts\ls_rule2.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_RU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_RU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_ru1.c"\
	".\Lts\l_la_ru1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_ru1.c"\
	".\Lts\l_uk_ru1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_ru1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_rule.c"\
	".\Lts\ls_rule1.c"\
	".\Lts\ls_rule2.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_RU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_RU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_ru1.c"\
	".\Lts\l_la_ru1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_ru1.c"\
	".\Lts\l_uk_ru1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_ru1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_rule.c"\
	".\Lts\ls_rule1.c"\
	".\Lts\ls_rule2.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_RU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_RU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_ru1.c"\
	".\Lts\l_la_ru1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_ru1.c"\
	".\Lts\l_uk_ru1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_ru1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_rule.c"\
	".\Lts\ls_rule1.c"\
	".\Lts\ls_rule2.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_RU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_RU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_ru1.c"\
	".\Lts\l_la_ru1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_ru1.c"\
	".\Lts\l_uk_ru1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_ru1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_rule.c"\
	".\Lts\ls_rule1.c"\
	".\Lts\ls_rule2.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_RU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_RU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_ru1.c"\
	".\Lts\l_la_ru1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_ru1.c"\
	".\Lts\l_uk_ru1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_ru1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_rule.c"\
	".\Lts\ls_rule1.c"\
	".\Lts\ls_rule2.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_RU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_RU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_ru1.c"\
	".\Lts\l_la_ru1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_ru1.c"\
	".\Lts\l_uk_ru1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_ru1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_rule.c"\
	".\Lts\ls_rule1.c"\
	".\Lts\ls_rule2.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_RU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_RU=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\Lts\l_gr_ru1.c"\
	".\Lts\l_la_ru1.c"\
	".\lts\l_sp_ph.h"\
	".\Lts\l_sp_ru1.c"\
	".\Lts\l_uk_ru1.c"\
	".\lts\l_us_ph.h"\
	".\Lts\l_us_ru1.c"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_rule.c"\
	".\Lts\ls_rule1.c"\
	".\Lts\ls_rule2.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_RU=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_sl.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_sp.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_task.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_T=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_task.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_T=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_T=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_task.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_T=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_T=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_task.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_T=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_T=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_task.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_T=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_T=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_task.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_T=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_T=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_task.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_T=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_T=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_task.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_T=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_T=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_task.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_T=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_us.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_util.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSA_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_util.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSA_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_util.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_util.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSA_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_util.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_util.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_util.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSA_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_util.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_UT=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\ls_util.c"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_UT=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsw_main.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_LSW_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSW_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_LSW_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSW_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_LSW_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSW_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_LSW_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSW_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_LSW_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSW_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSW_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSW_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_LSW_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSW_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSW_M=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\Lts\ls_acna.h"\
	".\Lts\ls_char.h"\
	".\Lts\ls_cons.h"\
	".\Lts\ls_data.h"\
	".\Lts\ls_def.h"\
	".\Lts\ls_defs.h"\
	".\Lts\Ls_dict.h"\
	".\Lts\ls_prot.h"\
	".\Lts\lsa_cons.h"\
	".\Lts\lsa_prot.h"\
	".\Lts\mn_char.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSW_M=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\par_ambi.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\par_char.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PAR_C=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_C=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PAR_C=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_C=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_C=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_C=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PAR_C=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_C=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_C=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_C=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_C=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_C=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PAR_C=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_C=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_C=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_C=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\par_dict.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\par_pars.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PAR_P=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_P=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PAR_P=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_P=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_P=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_P=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PAR_P=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_P=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_P=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_P=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_P=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_P=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PAR_P=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_P=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_P=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\Cm_data.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_P=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\par_rule.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\Cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\Cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\Cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\Cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\Cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\Cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\Cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\Cmd\compnoun.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\Cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_aloph.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_AL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_AL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_AL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_AL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_AL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_AL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_AL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_AL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_AL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_AL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_AL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_AL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_AL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_AL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_AL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_AL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_claus.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_CL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_CL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_CL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_CL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_CL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_CL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_CL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_CL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_CL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_CL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_CL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_CL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_CL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_CL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_CL=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_CL=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_draw.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_DR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_dr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_draw1.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_DR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_dr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_draw1.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_DR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_dr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_draw1.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_DR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_dr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_draw1.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_DR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_dr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_draw1.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_DR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_dr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_draw1.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_DR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_dr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_draw1.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_DR=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\dbgwins.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_dr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_draw1.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DR=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_drwt0.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_DRW=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_drwt01.c"\
	".\Ph\ph_drwt02.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DRW=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_DRW=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_drwt01.c"\
	".\Ph\ph_drwt02.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DRW=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_DRW=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_drwt01.c"\
	".\Ph\ph_drwt02.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DRW=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_DRW=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_drwt01.c"\
	".\Ph\ph_drwt02.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DRW=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_DRW=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_drwt01.c"\
	".\Ph\ph_drwt02.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DRW=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_DRW=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_drwt01.c"\
	".\Ph\ph_drwt02.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DRW=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_DRW=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_drwt01.c"\
	".\Ph\ph_drwt02.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DRW=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_DRW=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_drwt01.c"\
	".\Ph\ph_drwt02.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DRW=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_inton.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_IN=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_inton1.c"\
	".\Ph\ph_inton2.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_IN=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_IN=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_inton1.c"\
	".\Ph\ph_inton2.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_IN=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_IN=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_inton1.c"\
	".\Ph\ph_inton2.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_IN=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_IN=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_inton1.c"\
	".\Ph\ph_inton2.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_IN=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_IN=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_inton1.c"\
	".\Ph\ph_inton2.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_IN=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_IN=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_inton1.c"\
	".\Ph\ph_inton2.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_IN=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_IN=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_inton1.c"\
	".\Ph\ph_inton2.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_IN=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_IN=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_inton1.c"\
	".\Ph\ph_inton2.c"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_IN=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_main.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_MA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_MA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_romi.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_RO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_rom.c"\
	".\Ph\p_la_rom.c"\
	".\Ph\p_sp_rom.c"\
	".\Ph\p_uk_rom.c"\
	".\Ph\p_us_rom.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_RO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_RO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_rom.c"\
	".\Ph\p_la_rom.c"\
	".\Ph\p_sp_rom.c"\
	".\Ph\p_uk_rom.c"\
	".\Ph\p_us_rom.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_RO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_RO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_rom.c"\
	".\Ph\p_la_rom.c"\
	".\Ph\p_sp_rom.c"\
	".\Ph\p_uk_rom.c"\
	".\Ph\p_us_rom.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_RO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_RO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_rom.c"\
	".\Ph\p_la_rom.c"\
	".\Ph\p_sp_rom.c"\
	".\Ph\p_uk_rom.c"\
	".\Ph\p_us_rom.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_RO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_RO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_rom.c"\
	".\Ph\p_la_rom.c"\
	".\Ph\p_sp_rom.c"\
	".\Ph\p_uk_rom.c"\
	".\Ph\p_us_rom.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_RO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_RO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_rom.c"\
	".\Ph\p_la_rom.c"\
	".\Ph\p_sp_rom.c"\
	".\Ph\p_uk_rom.c"\
	".\Ph\p_us_rom.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_RO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_RO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_rom.c"\
	".\Ph\p_la_rom.c"\
	".\Ph\p_sp_rom.c"\
	".\Ph\p_uk_rom.c"\
	".\Ph\p_us_rom.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_RO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_RO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_rom.c"\
	".\Ph\p_la_rom.c"\
	".\Ph\p_sp_rom.c"\
	".\Ph\p_uk_rom.c"\
	".\Ph\p_us_rom.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_RO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_setar.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_SE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_st1.c"\
	".\Ph\p_la_st1.c"\
	".\Ph\p_sp_st1.c"\
	".\Ph\p_uk_st1.c"\
	".\Ph\p_us_st1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sttr1.c"\
	".\Ph\ph_sttr2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_SE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_st1.c"\
	".\Ph\p_la_st1.c"\
	".\Ph\p_sp_st1.c"\
	".\Ph\p_uk_st1.c"\
	".\Ph\p_us_st1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sttr1.c"\
	".\Ph\ph_sttr2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_SE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_st1.c"\
	".\Ph\p_la_st1.c"\
	".\Ph\p_sp_st1.c"\
	".\Ph\p_uk_st1.c"\
	".\Ph\p_us_st1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sttr1.c"\
	".\Ph\ph_sttr2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_SE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_st1.c"\
	".\Ph\p_la_st1.c"\
	".\Ph\p_sp_st1.c"\
	".\Ph\p_uk_st1.c"\
	".\Ph\p_us_st1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sttr1.c"\
	".\Ph\ph_sttr2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_SE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_st1.c"\
	".\Ph\p_la_st1.c"\
	".\Ph\p_sp_st1.c"\
	".\Ph\p_uk_st1.c"\
	".\Ph\p_us_st1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sttr1.c"\
	".\Ph\ph_sttr2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_SE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_st1.c"\
	".\Ph\p_la_st1.c"\
	".\Ph\p_sp_st1.c"\
	".\Ph\p_uk_st1.c"\
	".\Ph\p_us_st1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sttr1.c"\
	".\Ph\ph_sttr2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_SE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_st1.c"\
	".\Ph\p_la_st1.c"\
	".\Ph\p_sp_st1.c"\
	".\Ph\p_uk_st1.c"\
	".\Ph\p_us_st1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sttr1.c"\
	".\Ph\ph_sttr2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_SE=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_st1.c"\
	".\Ph\p_la_st1.c"\
	".\Ph\p_sp_st1.c"\
	".\Ph\p_uk_st1.c"\
	".\Ph\p_us_st1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sttr1.c"\
	".\Ph\ph_sttr2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SE=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_sort.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_SO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_sr1.c"\
	".\Ph\p_la_sr1.c"\
	".\Ph\p_sp_sr1.c"\
	".\Ph\p_uk_sr1.c"\
	".\Ph\p_us_sr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sort1.c"\
	".\Ph\ph_sort2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_SO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_sr1.c"\
	".\Ph\p_la_sr1.c"\
	".\Ph\p_sp_sr1.c"\
	".\Ph\p_uk_sr1.c"\
	".\Ph\p_us_sr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sort1.c"\
	".\Ph\ph_sort2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_SO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_sr1.c"\
	".\Ph\p_la_sr1.c"\
	".\Ph\p_sp_sr1.c"\
	".\Ph\p_uk_sr1.c"\
	".\Ph\p_us_sr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sort1.c"\
	".\Ph\ph_sort2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_SO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_sr1.c"\
	".\Ph\p_la_sr1.c"\
	".\Ph\p_sp_sr1.c"\
	".\Ph\p_uk_sr1.c"\
	".\Ph\p_us_sr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sort1.c"\
	".\Ph\ph_sort2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_SO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_sr1.c"\
	".\Ph\p_la_sr1.c"\
	".\Ph\p_sp_sr1.c"\
	".\Ph\p_uk_sr1.c"\
	".\Ph\p_us_sr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sort1.c"\
	".\Ph\ph_sort2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_SO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_sr1.c"\
	".\Ph\p_la_sr1.c"\
	".\Ph\p_sp_sr1.c"\
	".\Ph\p_uk_sr1.c"\
	".\Ph\p_us_sr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sort1.c"\
	".\Ph\ph_sort2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_SO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_sr1.c"\
	".\Ph\p_la_sr1.c"\
	".\Ph\p_sp_sr1.c"\
	".\Ph\p_uk_sr1.c"\
	".\Ph\p_us_sr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sort1.c"\
	".\Ph\ph_sort2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_SO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_sr1.c"\
	".\Ph\p_la_sr1.c"\
	".\Ph\p_sp_sr1.c"\
	".\Ph\p_uk_sr1.c"\
	".\Ph\p_us_sr1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_sort1.c"\
	".\Ph\ph_sort2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_syl.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_SY=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\uk_def.h"\
	".\include\usa_def.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_la_sy1.c"\
	".\Ph\p_sp_sy1.c"\
	".\Ph\p_uk_sy1.c"\
	".\Ph\p_us_sy1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_syl1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SY=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_SY=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\uk_def.h"\
	".\include\usa_def.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_la_sy1.c"\
	".\Ph\p_sp_sy1.c"\
	".\Ph\p_uk_sy1.c"\
	".\Ph\p_us_sy1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_syl1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SY=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_SY=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\uk_def.h"\
	".\include\usa_def.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_la_sy1.c"\
	".\Ph\p_sp_sy1.c"\
	".\Ph\p_uk_sy1.c"\
	".\Ph\p_us_sy1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_syl1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SY=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_SY=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\uk_def.h"\
	".\include\usa_def.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_la_sy1.c"\
	".\Ph\p_sp_sy1.c"\
	".\Ph\p_uk_sy1.c"\
	".\Ph\p_us_sy1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_syl1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SY=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_SY=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\uk_def.h"\
	".\include\usa_def.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_la_sy1.c"\
	".\Ph\p_sp_sy1.c"\
	".\Ph\p_uk_sy1.c"\
	".\Ph\p_us_sy1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_syl1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SY=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_SY=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\uk_def.h"\
	".\include\usa_def.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_la_sy1.c"\
	".\Ph\p_sp_sy1.c"\
	".\Ph\p_uk_sy1.c"\
	".\Ph\p_us_sy1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_syl1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SY=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_SY=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\uk_def.h"\
	".\include\usa_def.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_la_sy1.c"\
	".\Ph\p_sp_sy1.c"\
	".\Ph\p_uk_sy1.c"\
	".\Ph\p_us_sy1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_syl1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SY=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_SY=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\uk_def.h"\
	".\include\usa_def.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_la_sy1.c"\
	".\Ph\p_sp_sy1.c"\
	".\Ph\p_uk_sy1.c"\
	".\Ph\p_us_sy1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_syl1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SY=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_syntx.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_task.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_TA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_TA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_TA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_TA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_TA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_TA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_TA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_TA=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TA=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_timng.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_TI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_tim.c"\
	".\Ph\p_la_tim.c"\
	".\Ph\p_sp_tim.c"\
	".\Ph\p_uk_tim.c"\
	".\Ph\p_us_tim.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_time1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_TI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_tim.c"\
	".\Ph\p_la_tim.c"\
	".\Ph\p_sp_tim.c"\
	".\Ph\p_uk_tim.c"\
	".\Ph\p_us_tim.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_time1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_TI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_tim.c"\
	".\Ph\p_la_tim.c"\
	".\Ph\p_sp_tim.c"\
	".\Ph\p_uk_tim.c"\
	".\Ph\p_us_tim.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_time1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_TI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_tim.c"\
	".\Ph\p_la_tim.c"\
	".\Ph\p_sp_tim.c"\
	".\Ph\p_uk_tim.c"\
	".\Ph\p_us_tim.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_time1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_TI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_tim.c"\
	".\Ph\p_la_tim.c"\
	".\Ph\p_sp_tim.c"\
	".\Ph\p_uk_tim.c"\
	".\Ph\p_us_tim.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_time1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_TI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_tim.c"\
	".\Ph\p_la_tim.c"\
	".\Ph\p_sp_tim.c"\
	".\Ph\p_uk_tim.c"\
	".\Ph\p_us_tim.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_time1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_TI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_tim.c"\
	".\Ph\p_la_tim.c"\
	".\Ph\p_sp_tim.c"\
	".\Ph\p_uk_tim.c"\
	".\Ph\p_us_tim.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_time1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_TI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_tim.c"\
	".\Ph\p_la_tim.c"\
	".\Ph\p_sp_tim.c"\
	".\Ph\p_uk_tim.c"\
	".\Ph\p_us_tim.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\Ph\ph_time1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_vdefi.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_VD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_vdf.c"\
	".\Ph\p_gr_vdf1.c"\
	".\Ph\p_la_vdf.c"\
	".\Ph\p_la_vdf1.c"\
	".\Ph\p_sp_vdf.c"\
	".\Ph\p_sp_vdf1.c"\
	".\Ph\p_uk_vdf.c"\
	".\Ph\p_uk_vdf1.c"\
	".\Ph\p_us_vdf.c"\
	".\Ph\p_us_vdf1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_VD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_vdf.c"\
	".\Ph\p_gr_vdf1.c"\
	".\Ph\p_la_vdf.c"\
	".\Ph\p_la_vdf1.c"\
	".\Ph\p_sp_vdf.c"\
	".\Ph\p_sp_vdf1.c"\
	".\Ph\p_uk_vdf.c"\
	".\Ph\p_uk_vdf1.c"\
	".\Ph\p_us_vdf.c"\
	".\Ph\p_us_vdf1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_VD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_vdf.c"\
	".\Ph\p_gr_vdf1.c"\
	".\Ph\p_la_vdf.c"\
	".\Ph\p_la_vdf1.c"\
	".\Ph\p_sp_vdf.c"\
	".\Ph\p_sp_vdf1.c"\
	".\Ph\p_uk_vdf.c"\
	".\Ph\p_uk_vdf1.c"\
	".\Ph\p_us_vdf.c"\
	".\Ph\p_us_vdf1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_VD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_vdf.c"\
	".\Ph\p_gr_vdf1.c"\
	".\Ph\p_la_vdf.c"\
	".\Ph\p_la_vdf1.c"\
	".\Ph\p_sp_vdf.c"\
	".\Ph\p_sp_vdf1.c"\
	".\Ph\p_uk_vdf.c"\
	".\Ph\p_uk_vdf1.c"\
	".\Ph\p_us_vdf.c"\
	".\Ph\p_us_vdf1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_VD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_vdf.c"\
	".\Ph\p_gr_vdf1.c"\
	".\Ph\p_la_vdf.c"\
	".\Ph\p_la_vdf1.c"\
	".\Ph\p_sp_vdf.c"\
	".\Ph\p_sp_vdf1.c"\
	".\Ph\p_uk_vdf.c"\
	".\Ph\p_uk_vdf1.c"\
	".\Ph\p_us_vdf.c"\
	".\Ph\p_us_vdf1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_VD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_vdf.c"\
	".\Ph\p_gr_vdf1.c"\
	".\Ph\p_la_vdf.c"\
	".\Ph\p_la_vdf1.c"\
	".\Ph\p_sp_vdf.c"\
	".\Ph\p_sp_vdf1.c"\
	".\Ph\p_uk_vdf.c"\
	".\Ph\p_uk_vdf1.c"\
	".\Ph\p_us_vdf.c"\
	".\Ph\p_us_vdf1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_VD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_vdf.c"\
	".\Ph\p_gr_vdf1.c"\
	".\Ph\p_la_vdf.c"\
	".\Ph\p_la_vdf1.c"\
	".\Ph\p_sp_vdf.c"\
	".\Ph\p_sp_vdf1.c"\
	".\Ph\p_uk_vdf.c"\
	".\Ph\p_uk_vdf1.c"\
	".\Ph\p_us_vdf.c"\
	".\Ph\p_us_vdf1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_VD=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\p_gr_vdf.c"\
	".\Ph\p_gr_vdf1.c"\
	".\Ph\p_la_vdf.c"\
	".\Ph\p_la_vdf1.c"\
	".\Ph\p_sp_vdf.c"\
	".\Ph\p_sp_vdf1.c"\
	".\Ph\p_uk_vdf.c"\
	".\Ph\p_uk_vdf1.c"\
	".\Ph\p_us_vdf.c"\
	".\Ph\p_us_vdf1.c"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VD=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_vset.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PH_VS=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VS=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PH_VS=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VS=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_VS=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VS=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PH_VS=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VS=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_VS=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VS=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_VS=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VS=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PH_VS=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VS=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_VS=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VS=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\phinit.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PHINI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHINI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PHINI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHINI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PHINI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHINI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PHINI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHINI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PHINI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHINI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PHINI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHINI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PHINI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHINI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PHINI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHINI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\phlog.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_PHLOG=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\186.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHLOG=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_PHLOG=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\186.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHLOG=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_PHLOG=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\186.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHLOG=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_PHLOG=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\186.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHLOG=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_PHLOG=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\186.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHLOG=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_PHLOG=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\186.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHLOG=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_PHLOG=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\186.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHLOG=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_PHLOG=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\186.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHLOG=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Kernel\services.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_SERVI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SERVI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_SERVI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SERVI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_SERVI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SERVI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_SERVI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SERVI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_SERVI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SERVI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_SERVI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SERVI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_SERVI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SERVI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_SERVI=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SERVI=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\ttsapi.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_TTSAP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_TTSAP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_TTSAP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_TTSAP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_TTSAP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_TTSAP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_TTSAP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_TTSAP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_TTSAP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_TTSAP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_TTSAP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_TTSAP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_TTSAP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_TTSAP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_TTSAP=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\Cm_data.h"\
	".\cmd\cm_def.h"\
	".\Cmd\Cm_defs.h"\
	".\Cmd\Cm_prot.h"\
	".\Cmd\par_bin.h"\
	".\Cmd\Par_def.h"\
	".\Cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_TTSAP=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Kernel\Usa_init.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_USA_I=\
	"..\..\dectalkf.h"\
	".\include\cmd.h"\
	".\include\defs.h"\
	".\include\ger_def.h"\
	".\include\ger_err.tab"\
	".\include\ger_phon.tab"\
	".\include\ger_type.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\la_def.h"\
	".\include\la_err.tab"\
	".\include\la_phon.tab"\
	".\include\la_type.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\spa_err.tab"\
	".\include\spa_phon.tab"\
	".\include\spa_type.tab"\
	".\include\uk_def.h"\
	".\include\uk_err.tab"\
	".\include\uk_phon.tab"\
	".\include\uk_type.tab"\
	".\include\usa_def.h"\
	".\include\usa_err.tab"\
	".\include\usa_phon.tab"\
	".\include\usa_type.tab"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_USA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_USA_I=\
	"..\..\dectalkf.h"\
	".\include\cmd.h"\
	".\include\defs.h"\
	".\include\ger_def.h"\
	".\include\ger_err.tab"\
	".\include\ger_phon.tab"\
	".\include\ger_type.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\la_def.h"\
	".\include\la_err.tab"\
	".\include\la_phon.tab"\
	".\include\la_type.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\spa_err.tab"\
	".\include\spa_phon.tab"\
	".\include\spa_type.tab"\
	".\include\uk_def.h"\
	".\include\uk_err.tab"\
	".\include\uk_phon.tab"\
	".\include\uk_type.tab"\
	".\include\usa_def.h"\
	".\include\usa_err.tab"\
	".\include\usa_phon.tab"\
	".\include\usa_type.tab"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_USA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_USA_I=\
	"..\..\dectalkf.h"\
	".\include\cmd.h"\
	".\include\defs.h"\
	".\include\ger_def.h"\
	".\include\ger_err.tab"\
	".\include\ger_phon.tab"\
	".\include\ger_type.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\la_def.h"\
	".\include\la_err.tab"\
	".\include\la_phon.tab"\
	".\include\la_type.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\spa_err.tab"\
	".\include\spa_phon.tab"\
	".\include\spa_type.tab"\
	".\include\uk_def.h"\
	".\include\uk_err.tab"\
	".\include\uk_phon.tab"\
	".\include\uk_type.tab"\
	".\include\usa_def.h"\
	".\include\usa_err.tab"\
	".\include\usa_phon.tab"\
	".\include\usa_type.tab"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_USA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_USA_I=\
	"..\..\dectalkf.h"\
	".\include\cmd.h"\
	".\include\defs.h"\
	".\include\ger_def.h"\
	".\include\ger_err.tab"\
	".\include\ger_phon.tab"\
	".\include\ger_type.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\la_def.h"\
	".\include\la_err.tab"\
	".\include\la_phon.tab"\
	".\include\la_type.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\spa_err.tab"\
	".\include\spa_phon.tab"\
	".\include\spa_type.tab"\
	".\include\uk_def.h"\
	".\include\uk_err.tab"\
	".\include\uk_phon.tab"\
	".\include\uk_type.tab"\
	".\include\usa_def.h"\
	".\include\usa_err.tab"\
	".\include\usa_phon.tab"\
	".\include\usa_type.tab"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_USA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_USA_I=\
	"..\..\dectalkf.h"\
	".\include\cmd.h"\
	".\include\defs.h"\
	".\include\ger_def.h"\
	".\include\ger_err.tab"\
	".\include\ger_phon.tab"\
	".\include\ger_type.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\la_def.h"\
	".\include\la_err.tab"\
	".\include\la_phon.tab"\
	".\include\la_type.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\spa_err.tab"\
	".\include\spa_phon.tab"\
	".\include\spa_type.tab"\
	".\include\uk_def.h"\
	".\include\uk_err.tab"\
	".\include\uk_phon.tab"\
	".\include\uk_type.tab"\
	".\include\usa_def.h"\
	".\include\usa_err.tab"\
	".\include\usa_phon.tab"\
	".\include\usa_type.tab"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_USA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_USA_I=\
	"..\..\dectalkf.h"\
	".\include\cmd.h"\
	".\include\defs.h"\
	".\include\ger_def.h"\
	".\include\ger_err.tab"\
	".\include\ger_phon.tab"\
	".\include\ger_type.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\la_def.h"\
	".\include\la_err.tab"\
	".\include\la_phon.tab"\
	".\include\la_type.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\spa_err.tab"\
	".\include\spa_phon.tab"\
	".\include\spa_type.tab"\
	".\include\uk_def.h"\
	".\include\uk_err.tab"\
	".\include\uk_phon.tab"\
	".\include\uk_type.tab"\
	".\include\usa_def.h"\
	".\include\usa_err.tab"\
	".\include\usa_phon.tab"\
	".\include\usa_type.tab"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_USA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_USA_I=\
	"..\..\dectalkf.h"\
	".\include\cmd.h"\
	".\include\defs.h"\
	".\include\ger_def.h"\
	".\include\ger_err.tab"\
	".\include\ger_phon.tab"\
	".\include\ger_type.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\la_def.h"\
	".\include\la_err.tab"\
	".\include\la_phon.tab"\
	".\include\la_type.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\spa_err.tab"\
	".\include\spa_phon.tab"\
	".\include\spa_type.tab"\
	".\include\uk_def.h"\
	".\include\uk_err.tab"\
	".\include\uk_phon.tab"\
	".\include\uk_type.tab"\
	".\include\usa_def.h"\
	".\include\usa_err.tab"\
	".\include\usa_phon.tab"\
	".\include\usa_type.tab"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_USA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_USA_I=\
	"..\..\dectalkf.h"\
	".\include\cmd.h"\
	".\include\defs.h"\
	".\include\ger_def.h"\
	".\include\ger_err.tab"\
	".\include\ger_phon.tab"\
	".\include\ger_type.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\la_def.h"\
	".\include\la_err.tab"\
	".\include\la_phon.tab"\
	".\include\la_type.tab"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\spa_err.tab"\
	".\include\spa_phon.tab"\
	".\include\spa_type.tab"\
	".\include\uk_def.h"\
	".\include\uk_err.tab"\
	".\include\uk_phon.tab"\
	".\include\uk_type.tab"\
	".\include\usa_def.h"\
	".\include\usa_err.tab"\
	".\include\usa_phon.tab"\
	".\include\usa_type.tab"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_USA_I=\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Vtm\vtm.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_VTM_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\protos\vtm_fp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vfmd2pol.h"\
	".\Vtm\vfmfiltr.h"\
	".\Vtm\vfphdefs.h"\
	".\Vtm\Vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_VTM_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\protos\vtm_fp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vfmd2pol.h"\
	".\Vtm\vfmfiltr.h"\
	".\Vtm\vfphdefs.h"\
	".\Vtm\Vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_VTM_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\protos\vtm_fp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vfmd2pol.h"\
	".\Vtm\vfmfiltr.h"\
	".\Vtm\vfphdefs.h"\
	".\Vtm\Vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_VTM_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\protos\vtm_fp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vfmd2pol.h"\
	".\Vtm\vfmfiltr.h"\
	".\Vtm\vfphdefs.h"\
	".\Vtm\Vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_VTM_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\protos\vtm_fp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vfmd2pol.h"\
	".\Vtm\vfmfiltr.h"\
	".\Vtm\vfphdefs.h"\
	".\Vtm\Vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_VTM_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\protos\vtm_fp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vfmd2pol.h"\
	".\Vtm\vfmfiltr.h"\
	".\Vtm\vfphdefs.h"\
	".\Vtm\Vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_VTM_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\protos\vtm_fp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vfmd2pol.h"\
	".\Vtm\vfmfiltr.h"\
	".\Vtm\vfphdefs.h"\
	".\Vtm\Vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_VTM_C=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\protos\vtm_fp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vfmd2pol.h"\
	".\Vtm\vfmfiltr.h"\
	".\Vtm\vfphdefs.h"\
	".\Vtm\Vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Vtm\vtmiont.c

!IF  "$(CFG)" == "demostat - Win32 Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

DEP_CPP_VTMIO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_VTMIO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

DEP_CPP_VTMIO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_VTMIO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

DEP_CPP_VTMIO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_VTMIO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

DEP_CPP_VTMIO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_VTMIO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

DEP_CPP_VTMIO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_VTMIO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

DEP_CPP_VTMIO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_VTMIO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

DEP_CPP_VTMIO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_VTMIO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

DEP_CPP_VTMIO=\
	"..\..\dectalkf.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\Audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\Include\L_com_ph.h"\
	".\Include\L_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\Include\L_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\Include\L_us_ph.h"\
	".\include\pcport.h"\
	".\Include\Pipe.h"\
	".\include\port.h"\
	".\lts\l_com_ph.h"\
	".\lts\l_gr_ph.h"\
	".\lts\l_sp_ph.h"\
	".\lts\l_us_ph.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\Ph\ph_data.h"\
	".\Ph\ph_def.h"\
	".\Ph\ph_defs.h"\
	".\Ph\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\vtm\samprate.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtminst.h"\
	
NODEP_CPP_VTMIO=\
	".\api\cpapi.h"\
	".\api\dtmmedefs.h"\
	".\api\speech.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

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

SOURCE=.\include\mulawi.h
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
