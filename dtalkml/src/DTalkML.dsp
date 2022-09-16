# Microsoft Developer Studio Project File - Name="DTalkML" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102
# TARGTYPE "Win32 (ALPHA) Dynamic-Link Library" 0x0602

CFG=DTalkML - Win32 ALPHA Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "DTalkML.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "DTalkML.mak" CFG="DTalkML - Win32 ALPHA Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "DTalkML - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 ALPHA Release" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath "Desktop"
# PROP WCE_FormatVersion ""

!IF  "$(CFG)" == "DTalkML - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\Build\Release"
# PROP Intermediate_Dir ".\..\Build\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386 /out:".\..\build\Release/DECTALK.dll"

!ELSEIF  "$(CFG)" == "DTalkML - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\Build\Debug"
# PROP Intermediate_Dir ".\..\Build\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api\\" /I "..\.." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386 /out:".\..\build\Debug/DECtalk.dll" /pdbtype:sept

!ELSEIF  "$(CFG)" == "DTalkML - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "DTalkML_"
# PROP BASE Intermediate_Dir "DTalkML_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\Release"
# PROP Intermediate_Dir ".\..\alpha\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP nologo MT Gt0 W3 GX O2 I "\work\rnd\dapi\src\api\\ /D " WIN32" D "NDEBUG" D "_WINDOWS" YX FD c
# ADD CPP nologo MT Gt0 W3 GX O2 I "\work\rnd\dapi\src\api\\ /I " ..\..\dapi\src\api\\ I "..\.." D "WIN32" D "NDEBUG" D "_WINDOWS" YX FD c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /machine:ALPHA /out:".\..\build\Release/DECTALK.dll"
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /machine:ALPHA /out:".\..\alpha\Release/DECTALK.dll"

!ELSEIF  "$(CFG)" == "DTalkML - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "DTalkML0"
# PROP BASE Intermediate_Dir "DTalkML0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\Debug"
# PROP Intermediate_Dir ".\..\alpha\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP nologo Gt0 W3 GX Zi Od I "\work\rnd\dapi\src\api\\ /D " WIN32" D "_DEBUG" D "_WINDOWS" YX FD MTd c
# ADD CPP nologo Gt0 W3 GX Zi Od I "..\..\dapi\src\api\\ /I " ..\.." D "WIN32" D "_DEBUG" D "_WINDOWS" YX FD MTd c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /debug /machine:ALPHA /out:".\..\build\Debug/DECtalk.dll" /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /debug /machine:ALPHA /out:".\..\alpha\Debug/DECtalk.dll" /pdbtype:sept

!ENDIF 

# Begin Target

# Name "DTalkML - Win32 Release"
# Name "DTalkML - Win32 Debug"
# Name "DTalkML - Win32 ALPHA Release"
# Name "DTalkML - Win32 ALPHA Debug"
# Begin Source File

SOURCE=..\..\dapi\src\dectalk.def
# End Source File
# Begin Source File

SOURCE=.\dtalk_ml.c

!IF  "$(CFG)" == "DTalkML - Win32 Release"

!ELSEIF  "$(CFG)" == "DTalkML - Win32 Debug"

!ELSEIF  "$(CFG)" == "DTalkML - Win32 ALPHA Release"

DEP_CPP_DTALK=\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	
NODEP_CPP_DTALK=\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "DTalkML - Win32 ALPHA Debug"

DEP_CPP_DTALK=\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	
NODEP_CPP_DTALK=\
	".\ys\types.h"\
	

!ENDIF 

# End Source File
# End Target
# End Project
