# Microsoft Developer Studio Project File - Name="aci_dapi" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=aci_dapi - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "aci_dapi.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "aci_dapi.mak" CFG="aci_dapi - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "aci_dapi - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "aci_dapi - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "aci_dapi - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\Release"
# PROP Intermediate_Dir ".\..\build\Release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\corecode\dapi\src\api" /I "..\corecode\dapi\src\cmd" /I "..\corecode\dapi\src\include" /I "..\corecode\dapi\src\nt" /I "..\corecode\dapi\src\ph" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "aci_dapi - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\Debug"
# PROP Intermediate_Dir ".\..\build\Debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /Z7 /Od /I "..\corecode\dapi\src\api" /I "..\corecode\dapi\src\cmd" /I "..\corecode\dapi\src\include" /I "..\corecode\dapi\src\nt" /I "..\corecode\dapi\src\ph" /D "_DEBUG" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /FD /c
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

# Name "aci_dapi - Win32 Release"
# Name "aci_dapi - Win32 Debug"
# Begin Source File

SOURCE=..\corecode\dapi\src\api\crypt2.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\api\decstd97.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\dectalk.def
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\lts\loaddict.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\nt\mmalloc.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\nt\opthread.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\nt\playaud.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\vtm\playtone.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\kernel\services.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\vtm\sync.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\api\ttsapi.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\vtm\vtm.c
# End Source File
# Begin Source File

SOURCE=..\corecode\dapi\src\vtm\vtmiont.c
# End Source File
# End Target
# End Project
