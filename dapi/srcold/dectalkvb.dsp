# Microsoft Developer Studio Project File - Name="dectalkvb" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=dectalkvb - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "dectalkvb.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dectalkvb.mak" CFG="dectalkvb - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dectalkvb - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "dectalkvb - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "dectalkvb - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dectalkvb___Win32_Release"
# PROP BASE Intermediate_Dir "dectalkvb___Win32_Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dectalkvb\us\release"
# PROP Intermediate_Dir ".\..\build\dectalkvb\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "DECTALKVB_EXPORTS" /YX /FD /c
# ADD CPP /nologo /Gz /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 .\..\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386

!ELSEIF  "$(CFG)" == "dectalkvb - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dectalkvb___Win32_Debug"
# PROP BASE Intermediate_Dir "dectalkvb___Win32_Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dectalkvb\us\debug"
# PROP Intermediate_Dir ".\..\build\dectalkvb\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "DECTALKVB_EXPORTS" /YX /FD /GZ /c
# ADD CPP /nologo /Gz /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "DECTALKVB_EXPORTS" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 .\..\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "dectalkvb - Win32 Release"
# Name "dectalkvb - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\vb\dectalkvb.c
# End Source File
# Begin Source File

SOURCE=.\vb\dectalkvb.def
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\vb\dectalkvb.h
# End Source File
# Begin Source File

SOURCE=.\API\TTSAPI.H
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
