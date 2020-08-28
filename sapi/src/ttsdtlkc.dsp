# Microsoft Developer Studio Project File - Name="ttsdtlk" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=ttsdtlk - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "ttsdtlkc.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ttsdtlkc.mak" CFG="ttsdtlk - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ttsdtlk - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\WinRel"
# PROP BASE Intermediate_Dir ".\WinRel"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtlkttse\us\release"
# PROP Intermediate_Dir ".\..\build\dtlkttse\us\release\link"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 ..\..\dapi\build\dtlkstat\us\release\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\us\release\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\WinDebug"
# PROP BASE Intermediate_Dir ".\WinDebug"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtlkttse\us\debug"
# PROP Intermediate_Dir ".\..\build\dtlkttse\us\debug\link"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /MT /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dtlkstat\us\debug\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\us\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\ttsdtlk_"
# PROP BASE Intermediate_Dir ".\ttsdtlk_"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtlkttse\sp\release"
# PROP Intermediate_Dir ".\..\build\dtlkttse\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /i "z:\inc" /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:"dtlkttse\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\sp\release\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\sp\release\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\ttsdtlk0"
# PROP BASE Intermediate_Dir ".\ttsdtlk0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtlkttse\gr\release"
# PROP Intermediate_Dir ".\..\build\dtlkttse\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /i "z:\inc" /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:"dtlkttse\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\gr\release\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\gr\release\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\ttsdtlk_"
# PROP BASE Intermediate_Dir ".\ttsdtlk_"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtlkttse\la\release"
# PROP Intermediate_Dir ".\..\build\dtlkttse\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\us\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:"dtlkttse\us\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\la\release\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\la\release\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\ttsdtlk1"
# PROP BASE Intermediate_Dir ".\ttsdtlk1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtlkttse\sp\debug"
# PROP Intermediate_Dir ".\..\build\dtlkttse\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:"dtlkttse\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\sp\debug\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\sp\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\ttsdtlk2"
# PROP BASE Intermediate_Dir ".\ttsdtlk2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtlkttse\gr\debug"
# PROP Intermediate_Dir ".\..\build\dtlkttse\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:"dtlkttse\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\gr\debug\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\gr\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\ttsdtlk3"
# PROP BASE Intermediate_Dir ".\ttsdtlk3"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtlkttse\la\debug"
# PROP Intermediate_Dir ".\..\build\dtlkttse\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:"dtlkttse\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\la\debug\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\la\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk_"
# PROP BASE Intermediate_Dir "ttsdtlk_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtlkttse\uk\release"
# PROP Intermediate_Dir ".\..\build\dtlkttse\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\us\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\us\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\uk\release\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\uk\release\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk0"
# PROP BASE Intermediate_Dir "ttsdtlk0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtlkttse\uk\debug"
# PROP Intermediate_Dir ".\..\build\dtlkttse\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FR /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\us\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\us\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\uk\debug\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\uk\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "ttsdtlk - Win32 Release"
# Name "ttsdtlk - Win32 Debug"
# Name "ttsdtlk - Win32 Release Spanish"
# Name "ttsdtlk - Win32 Release German"
# Name "ttsdtlk - Win32 Release Latin American"
# Name "ttsdtlk - Win32 Debug Spanish"
# Name "ttsdtlk - Win32 Debug German"
# Name "ttsdtlk - Win32 Debug Latin American"
# Name "ttsdtlk - Win32 Release United Kingdom"
# Name "ttsdtlk - Win32 Debug United Kingdom"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\Api\AboutDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\auddest.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\audioact.cpp
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\audqueue.c
# End Source File
# Begin Source File

SOURCE=.\Api\BufNotify.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\ctools.cpp
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Api\Decstd97.c
# End Source File
# Begin Source File

SOURCE=.\Api\DECtalkDialogs.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\DialogSpeak.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\dtlktts.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\dtlkttsc.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\dtlkttse.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\GeneralDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\guidseg.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\LexiconDialog.cpp
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\mmalloc.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\opthread.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Cmd\par_char.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\pipe.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\playtone.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Kernel\services.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\spc.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\sync.c
# End Source File
# Begin Source File

SOURCE=.\Api\TranslateDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\Api\ttsdtlk.def
# End Source File
# Begin Source File

SOURCE=..\..\Dapi\Src\Kernel\Usa_init.c
# End Source File
# Begin Source File

SOURCE=.\Api\VoiceDef.cpp
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\vtm.c
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\vtmiont.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\Api\Ctools.h
# End Source File
# Begin Source File

SOURCE=.\Api\Dtlktts.h
# End Source File
# Begin Source File

SOURCE=.\Api\Dtlkttse.h
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\mmalloc.h
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\nt\opthread.h
# End Source File
# Begin Source File

SOURCE=.\Api\VoiceDef.h
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\vtm.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\Api\dtlktts.rc
# ADD BASE RSC /l 0x409 /i "Api"
# ADD RSC /l 0x409 /i "Api" /i ".\Api"
# End Source File
# End Group
# End Target
# End Project
