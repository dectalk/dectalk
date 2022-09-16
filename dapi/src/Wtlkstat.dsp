# Microsoft Developer Studio Project File - Name="wtlkstat" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (ALPHA) Static Library" 0x0604
# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=wtlkstat - Win32 ALPHA Debug United Kingdom
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Wtlkstat.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wtlkstat.mak" CFG="wtlkstat - Win32 ALPHA Debug United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wtlkstat - Win32 Release Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Release German" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Release Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug German" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 ALPHA Release" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "wtlkstat - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "wtlkstat - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "wtlkstat - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "wtlkstat - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "wtlkstat - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "wtlkstat - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "wtlkstat - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "wtlkstat - Win32 Release United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "wtlkstat - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\wtlkstat"
# PROP BASE Intermediate_Dir ".\wtlkstat"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkstat\sp\Release"
# PROP Intermediate_Dir ".\..\build\wtlkstat\sp\Release\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "i386" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /FR /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\wtlksta0"
# PROP BASE Intermediate_Dir ".\wtlksta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkstat\gr\Release"
# PROP Intermediate_Dir ".\..\build\wtlkstat\gr\Release\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "GERMAN" /FR /YX /FD /Zm200 /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\wtlksta1"
# PROP BASE Intermediate_Dir ".\wtlksta1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkstat\la\Release"
# PROP Intermediate_Dir ".\..\build\wtlkstat\la\Release\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\wtlksta2"
# PROP BASE Intermediate_Dir ".\wtlksta2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkstat\sp\debug"
# PROP Intermediate_Dir ".\..\build\wtlkstat\sp\debug\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "i386" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\wtlksta3"
# PROP BASE Intermediate_Dir ".\wtlksta3"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkstat\gr\debug"
# PROP Intermediate_Dir ".\..\build\wtlkstat\gr\debug\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "GERMAN" /FR /YX /FD /Zm200 /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\wtlksta4"
# PROP BASE Intermediate_Dir ".\wtlksta4"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkstat\la\debug"
# PROP Intermediate_Dir ".\..\build\wtlkstat\la\debug\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\wtlkstat"
# PROP BASE Intermediate_Dir ".\wtlkstat"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkstat\us\debug"
# PROP Intermediate_Dir ".\..\build\wtlkstat\us\debug\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /FR /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\wtlksta0"
# PROP BASE Intermediate_Dir ".\wtlksta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkstat\us\Release"
# PROP Intermediate_Dir ".\..\build\wtlkstat\us\Release\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /FR /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wtlkstat"
# PROP BASE Intermediate_Dir "wtlkstat"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\wtlkstat\us\Release"
# PROP Intermediate_Dir ".\..\alpha\wtlkstat\us\Release\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ALPHA" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /FR /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wtlksta0"
# PROP BASE Intermediate_Dir "wtlksta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\wtlkstat\us\debug"
# PROP Intermediate_Dir ".\..\alpha\wtlkstat\us\debug\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ALPHA" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /FR /YX /FD /MDd /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wtlkstat"
# PROP BASE Intermediate_Dir "wtlkstat"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\wtlkstat\sp\Release"
# PROP Intermediate_Dir ".\..\alpha\wtlkstat\sp\Release\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /FR /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wtlksta0"
# PROP BASE Intermediate_Dir "wtlksta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\wtlkstat\gr\Release"
# PROP Intermediate_Dir ".\..\alpha\wtlkstat\gr\Release\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /FR /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ALPHA" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "GERMAN" /FR /YX /FD /Zm200 /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wtlksta1"
# PROP BASE Intermediate_Dir "wtlksta1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\wtlkstat\la\Release"
# PROP Intermediate_Dir ".\..\alpha\wtlkstat\la\Release\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /FR /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ALPHA" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wtlksta2"
# PROP BASE Intermediate_Dir "wtlksta2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\wtlkstat\sp\debug"
# PROP Intermediate_Dir ".\..\alpha\wtlkstat\sp\debug\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /FR /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "ALPHA" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR /YX /FD /MDd /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wtlksta3"
# PROP BASE Intermediate_Dir "wtlksta3"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\wtlkstat\gr\debug"
# PROP Intermediate_Dir ".\..\alpha\wtlkstat\gr\debug\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /FR /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ALPHA" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "GERMAN" /FR /YX /FD /MDd /Zm200 /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wtlksta4"
# PROP BASE Intermediate_Dir "wtlksta4"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\wtlkstat\la\debug"
# PROP Intermediate_Dir ".\..\alpha\wtlkstat\la\debug\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /FR /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ALPHA" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR /YX /FD /MDd /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wtlkstat"
# PROP BASE Intermediate_Dir "wtlkstat"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkstat\uk\Release"
# PROP Intermediate_Dir ".\..\build\wtlkstat\uk\Release\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /FR /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wtlksta0"
# PROP BASE Intermediate_Dir "wtlksta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkstat\uk\debug"
# PROP Intermediate_Dir ".\..\build\wtlkstat\uk\debug\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /FR /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wtlkstat"
# PROP BASE Intermediate_Dir "wtlkstat"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\wtlkstat\uk\Release"
# PROP Intermediate_Dir ".\..\alpha\wtlkstat\uk\Release\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /FR /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ALPHA" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wtlksta0"
# PROP BASE Intermediate_Dir "wtlksta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\wtlkstat\uk\debug"
# PROP Intermediate_Dir ".\..\alpha\wtlkstat\uk\debug\Link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /FR /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ALPHA" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF 

# Begin Target

# Name "wtlkstat - Win32 Release Spanish"
# Name "wtlkstat - Win32 Release German"
# Name "wtlkstat - Win32 Release Latin American"
# Name "wtlkstat - Win32 Debug Spanish"
# Name "wtlkstat - Win32 Debug German"
# Name "wtlkstat - Win32 Debug Latin American"
# Name "wtlkstat - Win32 Debug"
# Name "wtlkstat - Win32 Release"
# Name "wtlkstat - Win32 ALPHA Release"
# Name "wtlkstat - Win32 ALPHA Debug"
# Name "wtlkstat - Win32 ALPHA Release Spanish"
# Name "wtlkstat - Win32 ALPHA Release German"
# Name "wtlkstat - Win32 ALPHA Release Latin American"
# Name "wtlkstat - Win32 ALPHA Debug Spanish"
# Name "wtlkstat - Win32 ALPHA Debug German"
# Name "wtlkstat - Win32 ALPHA Debug Latin American"
# Name "wtlkstat - Win32 Release United Kingdom"
# Name "wtlkstat - Win32 Debug United Kingdom"
# Name "wtlkstat - Win32 ALPHA Release United Kingdom"
# Name "wtlkstat - Win32 ALPHA Debug United Kingdom"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\Cmd\cm_char.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_CM_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_CM_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_CM_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_CM_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_CM_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CM_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_cmd.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_CM_CM=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_CM_CM=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_CM=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_CM_CM=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_CM=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_CM=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_CM_CM=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_CM=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_CM_CM=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CM_CM=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_copt.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_CM_CO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\cm_copt.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_CM_CO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\cm_copt.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_CO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\cm_copt.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_CM_CO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\cm_copt.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_CO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\cm_copt.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_CO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\cm_copt.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_CM_CO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\cm_copt.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_CO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\cm_copt.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_CM_CO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\cm_copt.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CM_CO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\c_us_cde.h"\
	".\Cmd\cm_cdef.h"\
	".\Cmd\cm_copt.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_main.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_CM_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_CM_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_CM_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_CM_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_CM_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CM_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_pars.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_CM_PA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_CM_PA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_PA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_CM_PA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_PA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_PA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_CM_PA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_PA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_CM_PA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CM_PA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_phon.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_CM_PH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_CM_PH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_PH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_CM_PH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_PH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_PH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_CM_PH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_PH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_CM_PH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CM_PH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_text.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_CM_TE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_CM_TE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_TE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_CM_TE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_TE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_TE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_CM_TE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_TE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_CM_TE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CM_TE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_util.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_CM_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\Cmd\cm_util.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_CM_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\Cmd\cm_util.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_CM_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\Cmd\cm_util.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_CM_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\Cmd\cm_util.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_CM_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\Cmd\cm_util.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_CM_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\Cmd\cm_util.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_CM_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\Cmd\cm_util.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_CM_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\Cmd\cm_util.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_CM_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\Cmd\cm_util.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CM_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\Cmd\cm_util.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\Cmd_init.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_CMD_I=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_CMD_I=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_CMD_I=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_CMD_I=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_CMD_I=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_CMD_I=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_CMD_I=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_CMD_I=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_CMD_I=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CMD_I=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\cmd_wav.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_CMD_W=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\dtmmedefs.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_CMD_W=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\dtmmedefs.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_CMD_W=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\dtmmedefs.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_CMD_W=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\dtmmedefs.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_CMD_W=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\dtmmedefs.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_CMD_W=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\dtmmedefs.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_CMD_W=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\dtmmedefs.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_CMD_W=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\dtmmedefs.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_CMD_W=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\dtmmedefs.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CMD_W=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaud.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\api\dtmmedefs.h"\
	".\Cmd\cemm.h"\
	".\Cmd\dtmmiodefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\Crypt2.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Nt\dbgwins.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\nt\dbgwins.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\nt\dbgwins.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\nt\dbgwins.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\nt\dbgwins.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\nt\dbgwins.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\nt\dbgwins.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\nt\dbgwins.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\nt\dbgwins.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\nt\dbgwins.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\nt\dbgwins.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Nt\formtrak.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_FORMT=\
	".\Nt\formtrak.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_FORMT=\
	".\Nt\formtrak.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_FORMT=\
	".\Nt\formtrak.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_FORMT=\
	".\Nt\formtrak.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_FORMT=\
	".\Nt\formtrak.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_FORMT=\
	".\Nt\formtrak.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_FORMT=\
	".\Nt\formtrak.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_FORMT=\
	".\Nt\formtrak.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_FORMT=\
	".\Nt\formtrak.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_FORMT=\
	".\Nt\formtrak.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\loaddict.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LOADD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LOADD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LOADD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LOADD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LOADD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LOADD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LOADD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LOADD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LOADD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LOADD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_chari.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LS_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LS_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LS_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LS_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LS_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LS_CH=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_dict.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LS_DI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LS_DI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_DI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LS_DI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_DI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_DI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LS_DI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_DI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LS_DI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LS_DI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_homo.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LS_HO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
	".\Lts\ls_homo.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LS_HO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
	".\Lts\ls_homo.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_HO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
	".\Lts\ls_homo.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LS_HO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
	".\Lts\ls_homo.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_HO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
	".\Lts\ls_homo.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_HO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
	".\Lts\ls_homo.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LS_HO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
	".\Lts\ls_homo.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_HO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
	".\Lts\ls_homo.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LS_HO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
	".\Lts\ls_homo.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LS_HO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
	".\Lts\ls_homo.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_math.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LS_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LS_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LS_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LS_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LS_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LS_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_proc.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LS_PR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LS_PR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_PR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LS_PR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_PR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_PR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LS_PR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_PR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LS_PR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LS_PR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_spel.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LS_SP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LS_SP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_SP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LS_SP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_SP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_SP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LS_SP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_SP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LS_SP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LS_SP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_speli.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LS_SPE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LS_SPE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_SPE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LS_SPE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_SPE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_SPE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LS_SPE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_SPE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LS_SPE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LS_SPE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\Lts\l_gr_spe.c"\
	".\Lts\l_sp_spe.c"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_suff.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LS_SU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LS_SU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LS_SU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LS_SU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LS_SU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LS_SU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LS_SU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LS_SU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LS_SU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LS_SU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\ls_suffi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

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
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

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
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

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
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

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
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

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
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

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
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

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
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

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
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

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
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_A=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_A=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_A=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_A=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_A=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_A=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_A=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_A=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_A=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LSA_A=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_coni.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LSA_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_fr.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_F=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_G=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_I=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_IT=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_J=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

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

SOURCE=.\Lts\lsa_rtbi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

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
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

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
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

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
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

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
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

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
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

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
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

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
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

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
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

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
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_RU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_RU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_RU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_RU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_RU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_RU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_RU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_RU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_RU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LSA_RU=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_sl.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_S=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_SP=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_T=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_T=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_T=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_T=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_T=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_T=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_T=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_T=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_T=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LSA_T=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_us.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_LSA_U=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSA_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSA_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSA_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSA_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSA_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSA_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSA_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSA_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSA_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LSA_UT=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Lts\lsw_main.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_LSW_M=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_LSW_M=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_LSW_M=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_LSW_M=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_LSW_M=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_LSW_M=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_LSW_M=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_LSW_M=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_LSW_M=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LSW_M=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\Include\pipe.h"\
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
	".\Lts\ls_dict.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\par_ambi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_A=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\Cmd\par_ambi.tab"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
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

SOURCE=.\Cmd\par_dict.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_D=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PAR_P=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_defs.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PAR_P=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_defs.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_P=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_defs.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PAR_P=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_defs.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_P=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_defs.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_P=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_defs.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PAR_P=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_defs.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_P=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_defs.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PAR_P=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_defs.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PAR_P=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_defs.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\cmd\par_pars1.c"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cmd\par_rule.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\cmd\par_rule1.h"\
	".\Cmd\par_rule2.h"\
	".\include\port.h"\
	".\nt\opatype.h"\
	".\nt\opmmsys.h"\
	".\nt\opthread.h"\
	".\nt\playaudd.h"\
	
NODEP_CPP_PAR_R=\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\Cmd\co_gr_dict.h"\
	".\Cmd\comp_dum.h"\
	".\cmd\compnoun.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\Cmd\par_nws.h"\
	".\Cmd\par_nws1.h"\
	".\Cmd\Par_rule.h"\
	".\cmd\par_rule1.h"\
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

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_AL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_AL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_AL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_AL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_AL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_AL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_AL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_AL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_AL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_AL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_claus.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_CL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_CL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_CL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_CL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_CL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_CL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_CL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_CL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_CL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_CL=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_draw.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_DR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_DR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_DR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_DR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_DR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_DR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_DR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_DR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_DR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_DR=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_drwt0.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_DRW=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_DRW=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_DRW=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_DRW=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_DRW=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_DRW=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_DRW=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_DRW=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_DRW=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_DRW=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_inton.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_IN=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_IN=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_IN=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_IN=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_IN=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_IN=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_IN=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_IN=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_IN=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_IN=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_main.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_MA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_romi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_RO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\ph\p_la_rom.c"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_RO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\ph\p_la_rom.c"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_RO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\ph\p_la_rom.c"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_RO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\ph\p_la_rom.c"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_RO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\ph\p_la_rom.c"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_RO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\ph\p_la_rom.c"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_RO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\ph\p_la_rom.c"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_RO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\ph\p_la_rom.c"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_RO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\ph\p_la_rom.c"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_RO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\ph\p_la_rom.c"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_setar.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_SE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_SE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_SE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_SE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_SE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_SE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_SE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_SE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_SE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_SE=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_sort.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_SO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_SO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_SO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_SO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_SO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_SO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_SO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_SO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_SO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_SO=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_syl.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_SY=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\Include\spa_def.h"\
	".\include\uk_def.h"\
	".\Include\usa_def.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_SY=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\Include\spa_def.h"\
	".\include\uk_def.h"\
	".\Include\usa_def.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_SY=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\Include\spa_def.h"\
	".\include\uk_def.h"\
	".\Include\usa_def.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_SY=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\Include\spa_def.h"\
	".\include\uk_def.h"\
	".\Include\usa_def.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_SY=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\Include\spa_def.h"\
	".\include\uk_def.h"\
	".\Include\usa_def.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_SY=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\Include\spa_def.h"\
	".\include\uk_def.h"\
	".\Include\usa_def.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_SY=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\Include\spa_def.h"\
	".\include\uk_def.h"\
	".\Include\usa_def.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_SY=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\Include\spa_def.h"\
	".\include\uk_def.h"\
	".\Include\usa_def.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_SY=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\Include\spa_def.h"\
	".\include\uk_def.h"\
	".\Include\usa_def.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_SY=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
	".\include\port.h"\
	".\Include\spa_def.h"\
	".\include\uk_def.h"\
	".\Include\usa_def.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_syntx.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_task.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_TA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_TA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_TA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_TA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_TA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_TA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_TA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_TA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_TA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_TA=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_timng.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_TI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_TI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_TI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_TI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_TI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_TI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_TI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_TI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_TI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_TI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_vdefi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_VD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_VD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_VD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_VD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_VD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_VD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_VD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_VD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_VD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_VD=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\ph_vset.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PH_VS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PH_VS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PH_VS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PH_VS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PH_VS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PH_VS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PH_VS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PH_VS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PH_VS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PH_VS=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\phinit.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PHINI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PHINI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PHINI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PHINI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PHINI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PHINI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PHINI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PHINI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PHINI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PHINI=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Ph\phlog.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_PHLOG=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Include\186.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_PHLOG=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Include\186.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_PHLOG=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Include\186.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_PHLOG=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Include\186.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_PHLOG=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Include\186.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_PHLOG=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Include\186.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_PHLOG=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Include\186.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_PHLOG=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Include\186.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_PHLOG=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Include\186.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PHLOG=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Include\186.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\Ttsapi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_TTSAP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_TTSAP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_TTSAP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_TTSAP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_TTSAP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_TTSAP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_TTSAP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_TTSAP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_TTSAP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_TTSAP=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\Api\ttsfeat.h"\
	".\Cmd\cm_data.h"\
	".\Cmd\cm_def.h"\
	".\Cmd\cm_defs.h"\
	".\Cmd\cm_prot.h"\
	".\cmd\par_bin.h"\
	".\Cmd\par_def.h"\
	".\cmd\par_def1.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\Include\pipe.h"\
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
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	".\ys\types.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Vtm\Vtm.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release"

DEP_CPP_VTM_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\Vtm\vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug"

DEP_CPP_VTM_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\Vtm\vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Spanish"

DEP_CPP_VTM_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\Vtm\vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release German"

DEP_CPP_VTM_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\Vtm\vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release Latin American"

DEP_CPP_VTM_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\Vtm\vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Spanish"

DEP_CPP_VTM_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\Vtm\vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_SP"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug German"

DEP_CPP_VTM_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\Vtm\vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug Latin American"

DEP_CPP_VTM_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\Vtm\vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /D "SPANISH_LA"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Release United Kingdom"

DEP_CPP_VTM_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\Vtm\vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 ALPHA Debug United Kingdom"

DEP_CPP_VTM_C=\
	"..\..\cpanel\src\cpapi.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\coop.h"\
	".\api\tts.h"\
	".\api\ttsapi.h"\
	".\Api\ttserr.h"\
	".\include\audioapi.h"\
	".\Include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\fc_def.tab"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_la_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\Include\pipe.h"\
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
	".\Vtm\vtm.h"\
	".\Vtm\vtm_f.h"\
	".\Vtm\vtm_fa.c"\
	".\Vtm\vtm_fdef.h"\
	".\Vtm\vtmfunc.h"\
	".\Vtm\vtminst.h"\
	".\Vtm\vtmtabf.h"\
	".\Vtm\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\api\dtmmedefs.h"\
	".\fvtm\fvtmasm.h"\
	".\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\Include\186.h
# End Source File
# Begin Source File

SOURCE=.\include\audioapi.h
# End Source File
# Begin Source File

SOURCE=.\Include\audiodef.h
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_copt.h
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_util.h
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

SOURCE=.\Nt\formtrak.h
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

SOURCE=.\include\l_com_ph.h
# End Source File
# Begin Source File

SOURCE=.\include\l_gr_ph.h
# End Source File
# Begin Source File

SOURCE=.\include\l_sp_ph.h
# End Source File
# Begin Source File

SOURCE=.\include\l_us_ph.h
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_dict.h
# End Source File
# Begin Source File

SOURCE=.\include\ls_feat.tab
# End Source File
# Begin Source File

SOURCE=.\include\ls_fold.tab
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_homo.h
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

SOURCE=.\Include\pipe.h
# End Source File
# Begin Source File

SOURCE=.\include\port.h
# End Source File
# Begin Source File

SOURCE=.\Include\spa_def.h
# End Source File
# Begin Source File

SOURCE=.\api\ttsapi.h
# End Source File
# Begin Source File

SOURCE=.\Include\usa_def.h
# End Source File
# Begin Source File

SOURCE=.\include\version.h
# End Source File
# Begin Source File

SOURCE=.\Vtm\vtm.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
