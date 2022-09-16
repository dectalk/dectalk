# Microsoft Developer Studio Project File - Name="vercheck" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101
# TARGTYPE "Win32 (ALPHA) Application" 0x0601

CFG=vercheck - Win32 ALPHA Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "vercheck.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "vercheck.mak" CFG="vercheck - Win32 ALPHA Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "vercheck - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "vercheck - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "vercheck - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "vercheck - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "vercheck - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Build\Release"
# PROP Intermediate_Dir "Build\Release\Link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
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
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "vercheck - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "build\Debug"
# PROP Intermediate_Dir "build\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "vercheck - Win32 ALPHA Release"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "vercheck"
# PROP BASE Intermediate_Dir "vercheck"
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "alpha\Release"
# PROP Intermediate_Dir "alpha\Release\Link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
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
# ADD BASE LINK32 /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 /nologo /subsystem:windows /machine:ALPHA

!ELSEIF  "$(CFG)" == "vercheck - Win32 ALPHA Debug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "verchec0"
# PROP BASE Intermediate_Dir "verchec0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "alpha\debug"
# PROP Intermediate_Dir "alpha\debug\Link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /YX /FD /MDd /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /YX /FD /MDd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept
# ADD LINK32 /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept

!ENDIF 

# Begin Target

# Name "vercheck - Win32 Release"
# Name "vercheck - Win32 Debug"
# Name "vercheck - Win32 ALPHA Release"
# Name "vercheck - Win32 ALPHA Debug"
# Begin Source File

SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "vercheck - Win32 Release"

!ELSEIF  "$(CFG)" == "vercheck - Win32 Debug"

!ELSEIF  "$(CFG)" == "vercheck - Win32 ALPHA Release"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "vercheck - Win32 ALPHA Debug"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\VerCheck.cpp

!IF  "$(CFG)" == "vercheck - Win32 Release"

!ELSEIF  "$(CFG)" == "vercheck - Win32 Debug"

!ELSEIF  "$(CFG)" == "vercheck - Win32 ALPHA Release"

DEP_CPP_VERCH=\
	".\stdafx.h"\
	".\VerCheck.h"\
	".\VerCheckDlg.h"\
	

!ELSEIF  "$(CFG)" == "vercheck - Win32 ALPHA Debug"

DEP_CPP_VERCH=\
	".\stdafx.h"\
	".\VerCheck.h"\
	".\VerCheckDlg.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\VerCheck.rc
# End Source File
# Begin Source File

SOURCE=.\VerCheckDlg.cpp

!IF  "$(CFG)" == "vercheck - Win32 Release"

!ELSEIF  "$(CFG)" == "vercheck - Win32 Debug"

!ELSEIF  "$(CFG)" == "vercheck - Win32 ALPHA Release"

DEP_CPP_VERCHE=\
	".\stdafx.h"\
	".\VerCheck.h"\
	".\VerCheckDlg.h"\
	

!ELSEIF  "$(CFG)" == "vercheck - Win32 ALPHA Debug"

DEP_CPP_VERCHE=\
	".\stdafx.h"\
	".\VerCheck.h"\
	".\VerCheckDlg.h"\
	

!ENDIF 

# End Source File
# End Target
# End Project
