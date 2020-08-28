# Microsoft Developer Studio Project File - Name="wtlkstat" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=wtlkstat - Win32 Debug French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Wtlkstat.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wtlkstat.mak" CFG="wtlkstat - Win32 Debug French"
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
!MESSAGE "wtlkstat - Win32 Release United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Release French" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug French" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath "Desktop"
CPP=cl.exe
RSC=rc.exe

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
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "i386" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /YX /FD /c
# SUBTRACT CPP /Fr
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
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "GERMAN" /YX /FD /Zm200 /c
# SUBTRACT CPP /Fr
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
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# SUBTRACT CPP /Fr
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
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "i386" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR /YX /FD /c
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
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "GERMAN" /FR /YX /FD /Zm200 /c
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
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR /YX /FD /c
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
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /FR /YX /FD /c
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
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /I "..\..\cpanel\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /FR /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
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
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /FR /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# SUBTRACT CPP /Fr
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
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /FR /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "wtlkstat___Win32_Release_French"
# PROP BASE Intermediate_Dir "wtlkstat___Win32_Release_French"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\wtlkstat\fr\Release"
# PROP Intermediate_Dir ".\..\build\wtlkstat\fr\Release\Link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "GERMAN" /FR /YX /FD /Zm200 /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "FRENCH" /YX /FD /Zm200 /c
# SUBTRACT CPP /Fr
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "wtlkstat___Win32_Debug_French"
# PROP BASE Intermediate_Dir "wtlkstat___Win32_Debug_French"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\wtlkstat\fr\debug"
# PROP Intermediate_Dir ".\..\build\wtlkstat\fr\debug\Link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "GERMAN" /FR /YX /FD /Zm200 /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "FRENCH" /FR /YX /FD /Zm200 /c
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

# Name "wtlkstat - Win32 Release Spanish"
# Name "wtlkstat - Win32 Release German"
# Name "wtlkstat - Win32 Release Latin American"
# Name "wtlkstat - Win32 Debug Spanish"
# Name "wtlkstat - Win32 Debug German"
# Name "wtlkstat - Win32 Debug Latin American"
# Name "wtlkstat - Win32 Debug"
# Name "wtlkstat - Win32 Release"
# Name "wtlkstat - Win32 Release United Kingdom"
# Name "wtlkstat - Win32 Debug United Kingdom"
# Name "wtlkstat - Win32 Release French"
# Name "wtlkstat - Win32 Debug French"
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

SOURCE=.\Nt\dbgwins.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\diffuse.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\fixfft32.c
# End Source File
# Begin Source File

SOURCE=.\Nt\formtrak.c
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

SOURCE=.\hlsyn\nasalf1x.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_ambi.c
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

SOURCE=.\hlsyn\reson.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\sample.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\sqrttable.c
# End Source File
# Begin Source File

SOURCE=.\Api\Ttsapi.c
# End Source File
# Begin Source File

SOURCE=.\hlsyn\voice.c
# End Source File
# Begin Source File

SOURCE=.\Vtm\Vtm.c
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
