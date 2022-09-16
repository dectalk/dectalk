# Microsoft Developer Studio Project File - Name="ttsdtlk" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102
# TARGTYPE "Win32 (ALPHA) Dynamic-Link Library" 0x0602

CFG=ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "ttsdtlkc.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ttsdtlkc.mak" CFG="ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"
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
!MESSAGE "ttsdtlk - Win32 ALPHA Release" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release Access32" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release Access32 German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release Access32 Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release Access32 Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug Access32" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug Access32 German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug Acess32 Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug Access32 Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Release Access32" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Debug Access32" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Release Access32 Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Debug Access32 Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Release Access32 German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Debug Access32 German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Release Access32 Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Debug Access32 Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release Access32 United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug Access32 United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

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
CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 ..\..\dapi\build\dtlkstat\us\release\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\us\release\dtlkttse.dll"
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
CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dtlkstat\us\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\us\debug\dtlkttse.dll"
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /i "z:\inc" /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:"dtlkttse\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\sp\release\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\sp\release\dtlkttse.dll"
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /i "z:\inc" /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:"dtlkttse\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\gr\release\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\gr\release\dtlkttse.dll"
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\us\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:"dtlkttse\us\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\la\release\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\la\release\dtlkttse.dll"
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:"dtlkttse\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\sp\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\sp\debug\dtlkttse.dll"
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:"dtlkttse\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\gr\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\gr\debug\dtlkttse.dll"
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /D "_DEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:"dtlkttse\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\la\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\la\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk_"
# PROP BASE Intermediate_Dir "ttsdtlk_"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtlkttse\us\release"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /I "..\..\dapi\src\include" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\us\release\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\dtlkttse\us\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\us\release\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\dtlkttse\us\release\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk0"
# PROP BASE Intermediate_Dir "ttsdtlk0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtlkttse\us\debug"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /FD /MTd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MDd /c
# SUBTRACT CPP /YX
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
# ADD BASE LINK32 ..\..\dapi\src\dtlkstat\us\debug\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\dtlkttse\us\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\us\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\dtlkttse\us\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk_"
# PROP BASE Intermediate_Dir "ttsdtlk_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtlkttse\sp\release"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /I "..\..\dapi\src\include" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\sp\release\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\sp\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\sp\release\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\dtlkttse\sp\release\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk0"
# PROP BASE Intermediate_Dir "ttsdtlk0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtlkttse\gr\release"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /I "..\..\dapi\src\include" /D "NDEBUG" /D "GERMAN" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\gr\release\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\gr\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\gr\release\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\dtlkttse\gr\release\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk1"
# PROP BASE Intermediate_Dir "ttsdtlk1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtlkttse\la\release"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /I "..\..\dapi\src\include" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\la\release\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\la\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\la\release\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\dtlkttse\la\release\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk2"
# PROP BASE Intermediate_Dir "ttsdtlk2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtlkttse\sp\debug"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "PRINTFDEBUG" /D "SPANISH" /YX /FD /MTd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MDd /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\sp\debug\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\build\dtlkttse\sp\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\sp\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\dtlkttse\sp\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk3"
# PROP BASE Intermediate_Dir "ttsdtlk3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtlkttse\gr\debug"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "PRINTFDEBUG" /D "GERMAN" /YX /FD /MTd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MDd /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\gr\debug\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\build\dtlkttse\gr\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\gr\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\dtlkttse\gr\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk4"
# PROP BASE Intermediate_Dir "ttsdtlk4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtlkttse\la\debug"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "PRINTFDEBUG" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /MTd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MDd /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\la\debug\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\build\dtlkttse\la\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\la\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\dtlkttse\la\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk_"
# PROP BASE Intermediate_Dir "ttsdtlk_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtlkttse\us\access32\"
# PROP Intermediate_Dir ".\..\build\dtlkttse\us\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\us\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\us\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\us\access32\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\us\access32\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk0"
# PROP BASE Intermediate_Dir "ttsdtlk0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtlkttse\gr\access32\"
# PROP Intermediate_Dir ".\..\build\dtlkttse\gr\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "GERMAN" /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\gr\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\gr\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\gr\access32\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\gr\access32\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk1"
# PROP BASE Intermediate_Dir "ttsdtlk1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtlkttse\la\access32\"
# PROP Intermediate_Dir ".\..\build\dtlkttse\la\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "LATIN_AMERICAN" /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\la\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\la\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\la\access32\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\la\access32\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk2"
# PROP BASE Intermediate_Dir "ttsdtlk2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtlkttse\sp\access32\"
# PROP Intermediate_Dir ".\..\build\dtlkttse\sp\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "SPANISH" /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\sp\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\sp\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\sp\access32\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\sp\access32\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk3"
# PROP BASE Intermediate_Dir "ttsdtlk3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtlkttse\us\a32debug\"
# PROP Intermediate_Dir ".\..\build\dtlkttse\us\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\us\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\us\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\us\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\us\a32debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk4"
# PROP BASE Intermediate_Dir "ttsdtlk4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtlkttse\gr\a32debug\"
# PROP Intermediate_Dir ".\..\build\dtlkttse\gr\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "GERMAN" /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\gr\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\gr\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\gr\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\gr\a32debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk5"
# PROP BASE Intermediate_Dir "ttsdtlk5"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtlkttse\la\a32debug\"
# PROP Intermediate_Dir ".\..\build\dtlkttse\la\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "LATIN_AMERICAN" /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\la\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\la\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\la\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\la\a32debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk6"
# PROP BASE Intermediate_Dir "ttsdtlk6"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtlkttse\sp\a32debug\"
# PROP Intermediate_Dir ".\..\build\dtlkttse\sp\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "SPANISH" /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\sp\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\sp\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\sp\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\sp\a32debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk_"
# PROP BASE Intermediate_Dir "ttsdtlk_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtlkttse\us\access32"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\us\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /I "..\..\dapi\src\include" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "_USRDLL" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\us\release\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\us\access32\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\us\access32\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\dtlkttse\us\access32\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk0"
# PROP BASE Intermediate_Dir "ttsdtlk0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtlkttse\us\a32debug"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\us\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /MTd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MTd /c
# SUBTRACT CPP /YX
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
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\us\debug\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\build\dtlkttse\us\a32debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\us\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\dtlkttse\us\a32debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk1"
# PROP BASE Intermediate_Dir "ttsdtlk1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtlkttse\sp\access32"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\sp\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /I "..\..\dapi\src\include" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "ALPHA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\sp\release\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\sp\access32\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\sp\access32\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\dtlkttse\sp\access32\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk2"
# PROP BASE Intermediate_Dir "ttsdtlk2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtlkttse\sp\a32debug"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\sp\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /MTd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "ALPHA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MTd /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\sp\debug\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\build\dtlkttse\sp\a32debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\sp\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\dtlkttse\sp\a32debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk3"
# PROP BASE Intermediate_Dir "ttsdtlk3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtlkttse\gr\access32"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\gr\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /I "..\..\dapi\src\include" /D "NDEBUG" /D "GERMAN" /D "ALPHA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\gr\release\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\gr\access32\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\gr\access32\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\dtlkttse\gr\access32\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk4"
# PROP BASE Intermediate_Dir "ttsdtlk4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtlkttse\gr\a32debug"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\gr\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /MTd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "ALPHA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MTd /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\gr\debug\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\build\dtlkttse\gr\a32debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\gr\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\dtlkttse\gr\a32debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk5"
# PROP BASE Intermediate_Dir "ttsdtlk5"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtlkttse\la\access32"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\la\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /I "..\..\dapi\src\include" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\la\release\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\la\access32\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\la\access32\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\dtlkttse\la\access32\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk6"
# PROP BASE Intermediate_Dir "ttsdtlk6"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtlkttse\la\a32debug"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\la\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /MTd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /MTd /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\la\debug\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\build\dtlkttse\la\a32debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\la\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\dtlkttse\la\a32debug\dtlkttse.dll"
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\us\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\us\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\uk\release\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\uk\release\dtlkttse.dll"
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FR /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\us\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\us\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\uk\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\uk\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk1"
# PROP BASE Intermediate_Dir "ttsdtlk1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtlkttse\uk\access32"
# PROP Intermediate_Dir ".\..\build\dtlkttse\uk\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ACCESS32" /D "TYPING_MODE" /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\us\release\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\us\access32\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\uk\access32\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:I386 /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\uk\access32\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk2"
# PROP BASE Intermediate_Dir "ttsdtlk2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtlkttse\uk\a32debug"
# PROP Intermediate_Dir ".\..\build\dtlkttse\uk\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ACCESS32" /D "TYPING_MODE" /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\us\debug\dtlkstat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\us\a32debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtlkstat\uk\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /debug /debugtype:both /machine:I386 /out:".\..\build\dtlkttse\uk\a32debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk_"
# PROP BASE Intermediate_Dir "ttsdtlk_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtlkttse\uk\release"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /I "..\..\dapi\src\include" /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\uk\release\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\uk\release\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\uk\release\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\dtlkttse\uk\release\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk0"
# PROP BASE Intermediate_Dir "ttsdtlk0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtlkttse\uk\debug"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /MTd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /YX /FD /MTd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\uk\debug\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\build\dtlkttse\uk\debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\uk\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\dtlkttse\uk\debug\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttsdtlk1"
# PROP BASE Intermediate_Dir "ttsdtlk1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtlkttse\uk\access32"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\uk\access32\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /I "..\..\dapi\src\include" /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "ALPHA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\uk\release\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\build\dtlkttse\uk\access32\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\uk\access32\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /out:".\..\alpha\dtlkttse\uk\access32\dtlkttse.dll"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttsdtlk2"
# PROP BASE Intermediate_Dir "ttsdtlk2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtlkttse\uk\a32debug"
# PROP Intermediate_Dir ".\..\alpha\dtlkttse\uk\a32debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /MTd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "ALPHA" /D "ACCESS32" /D "TYPING_MODE" /D "SLOWTALK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /YX /FD /MTd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtlkstat\uk\debug\dtlkstat.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\build\dtlkttse\uk\a32debug\dtlkttse.dll"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtlkstat\uk\debug\dtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /debug /debugtype:both /machine:ALPHA /out:".\..\alpha\dtlkttse\uk\a32debug\dtlkttse.dll"
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
# Name "ttsdtlk - Win32 ALPHA Release"
# Name "ttsdtlk - Win32 ALPHA Debug"
# Name "ttsdtlk - Win32 ALPHA Release Spanish"
# Name "ttsdtlk - Win32 ALPHA Release German"
# Name "ttsdtlk - Win32 ALPHA Release Latin American"
# Name "ttsdtlk - Win32 ALPHA Debug Spanish"
# Name "ttsdtlk - Win32 ALPHA Debug German"
# Name "ttsdtlk - Win32 ALPHA Debug Latin American"
# Name "ttsdtlk - Win32 Release Access32"
# Name "ttsdtlk - Win32 Release Access32 German"
# Name "ttsdtlk - Win32 Release Access32 Latin American"
# Name "ttsdtlk - Win32 Release Access32 Spanish"
# Name "ttsdtlk - Win32 Debug Access32"
# Name "ttsdtlk - Win32 Debug Access32 German"
# Name "ttsdtlk - Win32 Debug Acess32 Latin American"
# Name "ttsdtlk - Win32 Debug Access32 Spanish"
# Name "ttsdtlk - Win32 ALPHA Release Access32"
# Name "ttsdtlk - Win32 ALPHA Debug Access32"
# Name "ttsdtlk - Win32 ALPHA Release Access32 Spanish"
# Name "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"
# Name "ttsdtlk - Win32 ALPHA Release Access32 German"
# Name "ttsdtlk - Win32 ALPHA Debug Access32 German"
# Name "ttsdtlk - Win32 ALPHA Release Access32 Latin American"
# Name "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"
# Name "ttsdtlk - Win32 Release United Kingdom"
# Name "ttsdtlk - Win32 Debug United Kingdom"
# Name "ttsdtlk - Win32 Release Access32 United Kingdom"
# Name "ttsdtlk - Win32 Debug Access32 United Kingdom"
# Name "ttsdtlk - Win32 ALPHA Release United Kingdom"
# Name "ttsdtlk - Win32 ALPHA Debug United Kingdom"
# Name "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"
# Name "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\Api\AboutDialog.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_ABOUT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_ABOUT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\auddest.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_AUDDE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDDE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\audioact.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_AUDIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_AUDIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\audqueue.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_AUDQU=\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_AUDQU=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\BufNotify.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_BUFNO=\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\api\stdafx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\ctools.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_CTOOL=\
	".\Api\Ctools.h"\
	".\api\stdafx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Api\Decstd97.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\DECtalkDialogs.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_DECTA=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DECTA=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\DialogSpeak.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_DIALO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DIALO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\dtlktts.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_DTLKT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\aboutdialog.h"\
	".\Api\Ctools.h"\
	".\api\dectalkdialogs.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\generaldialog.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_DTLKT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\dtlktts.rc
# ADD BASE RSC /l 0x409 /i "Api"
# ADD RSC /l 0x409 /i "Api" /i ".\Api"
# End Source File
# Begin Source File

SOURCE=.\Api\dtlkttsc.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dectalk_mfc.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\dtlkttse.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\crypt2.c"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.c"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\cmd\cm_data.h"\
	"..\..\dapi\src\cmd\cm_def.h"\
	"..\..\dapi\src\cmd\cm_defs.h"\
	"..\..\dapi\src\cmd\cm_prot.h"\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\phonlist.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\samprate.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\Api\Dtlkttse.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_DTLKTTS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\vtminst.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	".\ys\types.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\GeneralDialog.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_GENER=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\api\bufnotify.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\generaldialog.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_GENER=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\guidseg.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_GUIDS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\LexiconDialog.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_LEXIC=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\api\dialogspeak.h"\
	".\Api\Dtlktts.h"\
	".\api\lexicondialog.h"\
	".\api\stdafx.h"\
	
NODEP_CPP_LEXIC=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\mmalloc.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_MMALL=\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\Nt\mmalloc.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\Nt\shmalloc.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_MMALL=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\opthread.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_OPTHR=\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_OPTHR=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Cmd\par_char.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_PAR_C=\
	"..\..\dapi\src\cmd\par_bin.h"\
	"..\..\dapi\src\Cmd\par_def.h"\
	"..\..\dapi\src\cmd\par_def1.h"\
	"..\..\dapi\src\include\ls_lower.tab"\
	"..\..\dapi\src\include\ls_upper.tab"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PAR_C=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\pipe.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_PIPE_=\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Nt\pipe.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\playtone.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_PLAYT=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\sinetab.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_PLAYT=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Kernel\services.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_SERVI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SERVI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Nt\spc.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_SPC_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SPC_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\sync.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_SYNC_=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_SYNC_=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\TranslateDialog.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_TRANS=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\api\translatedialog.h"\
	
NODEP_CPP_TRANS=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\ttsdtlk.def
# End Source File
# Begin Source File

SOURCE=..\..\Dapi\Src\Kernel\Usa_init.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_USA_I=\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\ger_def.h"\
	"..\..\dapi\src\include\ger_err.tab"\
	"..\..\dapi\src\include\ger_phon.tab"\
	"..\..\dapi\src\include\ger_type.tab"\
	"..\..\dapi\src\include\iso_char.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\la_def.h"\
	"..\..\dapi\src\include\la_err.tab"\
	"..\..\dapi\src\include\la_phon.tab"\
	"..\..\dapi\src\include\la_type.tab"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\include\spa_def.h"\
	"..\..\dapi\src\include\spa_err.tab"\
	"..\..\dapi\src\include\spa_phon.tab"\
	"..\..\dapi\src\include\spa_type.tab"\
	"..\..\dapi\src\include\uk_def.h"\
	"..\..\dapi\src\include\uk_err.tab"\
	"..\..\dapi\src\include\uk_phon.tab"\
	"..\..\dapi\src\include\uk_type.tab"\
	"..\..\dapi\src\include\usa_def.h"\
	"..\..\dapi\src\include\usa_err.tab"\
	"..\..\dapi\src\include\usa_phon.tab"\
	"..\..\dapi\src\include\usa_type.tab"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USA_I=\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Api\VoiceDef.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_VOICE=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	".\Api\Ctools.h"\
	".\Api\Dtlktts.h"\
	".\api\stdafx.h"\
	".\Api\VoiceDef.h"\
	
NODEP_CPP_VOICE=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\Api\idec.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\vtm.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_VTM_C=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttserr.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\protos\vtm_fp.h"\
	"..\..\dapi\src\Vtm\vfmd2pol.h"\
	"..\..\dapi\src\Vtm\vfmfiltr.h"\
	"..\..\dapi\src\Vtm\vfphdefs.h"\
	"..\..\dapi\src\Vtm\vtm.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtm_fa.c"\
	"..\..\dapi\src\Vtm\vtm_fdef.h"\
	"..\..\dapi\src\Vtm\vtmfunc.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dapi\src\Vtm\vtmtabf.h"\
	"..\..\dapi\src\Vtm\vtmtable.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTM_C=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\Vtm\vtmiont.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Spanish"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release German"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Latin American"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Spanish"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug German"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Latin American"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 German"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Acess32 Latin American"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Spanish"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Spanish"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 German"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 German"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 Latin American"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 Latin American"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release United Kingdom"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug United Kingdom"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Release Access32 United Kingdom"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 ALPHA Debug Access32 United Kingdom"

DEP_CPP_VTMIO=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\dectalk.h"\
	"..\..\dapi\src\include\defs.h"\
	"..\..\dapi\src\include\dt_abort.h"\
	"..\..\dapi\src\include\esc.h"\
	"..\..\dapi\src\include\fc_def.tab"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\l_com_ph.h"\
	"..\..\dapi\src\include\l_gr_ph.h"\
	"..\..\dapi\src\include\l_la_ph.h"\
	"..\..\dapi\src\include\l_sp_ph.h"\
	"..\..\dapi\src\include\l_uk_ph.h"\
	"..\..\dapi\src\include\l_us_ph.h"\
	"..\..\dapi\src\include\pcport.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\Nt\opmmsys.h"\
	"..\..\dapi\src\nt\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\Nt\playaudd.h"\
	"..\..\dapi\src\ph\ph_data.h"\
	"..\..\dapi\src\ph\ph_def.h"\
	"..\..\dapi\src\ph\ph_defs.h"\
	"..\..\dapi\src\ph\ph_prot.h"\
	"..\..\dapi\src\protos\kernp.h"\
	"..\..\dapi\src\protos\libp.h"\
	"..\..\dapi\src\Vtm\vtm_f.h"\
	"..\..\dapi\src\Vtm\vtminst.h"\
	"..\..\dectalkf.h"\
	"..\..\microsoft\speech.h"\
	
NODEP_CPP_VTMIO=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\fvtm\fvtmasm.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	"..\..\dapi\src\Vtm\samprate.h"\
	

!ENDIF 

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
# End Group
# End Target
# End Project
