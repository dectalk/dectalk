# Microsoft Developer Studio Project File - Name="Wttstst" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=Wttstst - Win32 A2ADebug French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Wttstest.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wttstest.mak" CFG="Wttstst - Win32 A2ADebug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Wttstst - Win32 A2WRel" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2WDebug" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 W2ADebug" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 W2ARel" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 W2WDebug" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 W2WRel" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel German" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug German" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug French" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel French" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\WinRel"
# PROP BASE Intermediate_Dir ".\WinRel"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\us\A2WRel"
# PROP Intermediate_Dir ".\build\us\A2WRel\link"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /fo".\build\us\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 ..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\WinDebug"
# PROP BASE Intermediate_Dir ".\WinDebug"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\A2WDebug"
# PROP Intermediate_Dir ".\build\us\A2WDebug\link"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /fo".\build\us\A2WDebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 ..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\A2ADebug"
# PROP BASE Intermediate_Dir ".\A2ADebug"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\A2ADebug"
# PROP Intermediate_Dir ".\build\us\A2ADebug\link"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /fo".\build\us\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\A2ARel"
# PROP BASE Intermediate_Dir ".\A2ARel"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\us\release"
# PROP Intermediate_Dir ".\build\us\release\link"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /fo".\build\us\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\W2ADebug"
# PROP BASE Intermediate_Dir ".\W2ADebug"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\W2ADebug"
# PROP Intermediate_Dir ".\build\us\W2ADebug\link"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /fo".\build\us\W2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\W2ARel"
# PROP BASE Intermediate_Dir ".\W2ARel"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\us\W2ARel"
# PROP Intermediate_Dir ".\build\us\W2ARel\link"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /fo".\build\us\W2ARel\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\W2WDebug"
# PROP BASE Intermediate_Dir ".\W2WDebug"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\W2WDebug"
# PROP Intermediate_Dir ".\build\us\W2WDebug\link"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /fo".\build\us\W2WDebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\W2WRel"
# PROP BASE Intermediate_Dir ".\W2WRel"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\us\W2WRel"
# PROP Intermediate_Dir ".\build\us\W2WRel\link"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /fo".\build\us\W2WRel\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Wttstst_"
# PROP BASE Intermediate_Dir "Wttstst_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\sp\release"
# PROP Intermediate_Dir ".\build\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /fo".\build\sp\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\sp\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Wttstst0"
# PROP BASE Intermediate_Dir "Wttstst0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\gr\release"
# PROP Intermediate_Dir ".\build\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /fo".\build\gr\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\gr\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Wttstst1"
# PROP BASE Intermediate_Dir "Wttstst1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\la\release"
# PROP Intermediate_Dir ".\build\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /fo".\build\la\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\la\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Wttstst2"
# PROP BASE Intermediate_Dir "Wttstst2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\sp\A2Adebug"
# PROP Intermediate_Dir ".\build\sp\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /fo".\build\sp\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\sp\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Wttstst3"
# PROP BASE Intermediate_Dir "Wttstst3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\gr\A2Adebug"
# PROP Intermediate_Dir ".\build\gr\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /fo".\build\gr\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\gr\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Wttstst4"
# PROP BASE Intermediate_Dir "Wttstst4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\la\A2Adebug"
# PROP Intermediate_Dir ".\build\la\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /fo".\build\la\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\la\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Wttstst5"
# PROP BASE Intermediate_Dir "Wttstst5"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\uk\release"
# PROP Intermediate_Dir ".\build\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x809 /fo".\build\uk\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\uk\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Wttstst6"
# PROP BASE Intermediate_Dir "Wttstst6"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\uk\A2Adebug"
# PROP Intermediate_Dir ".\build\uk\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x809 /fo".\build\uk\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\uk\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug French"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Wttstst___Win32_A2ADebug_French"
# PROP BASE Intermediate_Dir "Wttstst___Win32_A2ADebug_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\fr\A2Adebug"
# PROP Intermediate_Dir ".\build\fr\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /fo".\build\gr\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /fo".\build\fr\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\gr\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\fr\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel French"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Wttstst___Win32_A2ARel_French"
# PROP BASE Intermediate_Dir "Wttstst___Win32_A2ARel_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\fr\release"
# PROP Intermediate_Dir ".\build\fr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /fo".\build\gr\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /fo".\build\fr\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\gr\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\wtlkttse\fr\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ENDIF 

# Begin Target

# Name "Wttstst - Win32 A2WRel"
# Name "Wttstst - Win32 A2WDebug"
# Name "Wttstst - Win32 A2ADebug"
# Name "Wttstst - Win32 A2ARel"
# Name "Wttstst - Win32 W2ADebug"
# Name "Wttstst - Win32 W2ARel"
# Name "Wttstst - Win32 W2WDebug"
# Name "Wttstst - Win32 W2WRel"
# Name "Wttstst - Win32 A2ARel Spanish"
# Name "Wttstst - Win32 A2ARel German"
# Name "Wttstst - Win32 A2ARel Latin American"
# Name "Wttstst - Win32 A2ADebug Spanish"
# Name "Wttstst - Win32 A2ADebug German"
# Name "Wttstst - Win32 A2ADebug Latin American"
# Name "Wttstst - Win32 A2ARel United Kingdom"
# Name "Wttstst - Win32 A2ADebug United Kingdom"
# Name "Wttstst - Win32 A2ADebug French"
# Name "Wttstst - Win32 A2ARel French"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=..\ttstest\DLGFINDM.CPP
# ADD CPP /Yu"stdafx.h"
# End Source File
# Begin Source File

SOURCE=..\..\sapi\src\Api\guidseg.cpp
# End Source File
# Begin Source File

SOURCE=..\ttstest\STDAFX.CPP
# ADD CPP /Yc"stdafx.h"
# End Source File
# Begin Source File

SOURCE=..\ttstest\TABISRCE.CPP
# ADD CPP /Yu"stdafx.h"
# End Source File
# Begin Source File

SOURCE=..\ttstest\TTSDLG.CPP
# ADD CPP /Yu"stdafx.h"
# End Source File
# Begin Source File

SOURCE=..\ttstest\TTSFNC.CPP
# ADD CPP /Yu"stdafx.h"
# End Source File
# Begin Source File

SOURCE=..\ttstest\TTSTST.CPP
# ADD CPP /Yu"stdafx.h"
# End Source File
# Begin Source File

SOURCE=..\ttstest\TTSTST.RC
# ADD BASE RSC /l 0x409 /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest"
# ADD RSC /l 0x409 /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=..\ttstest\dlgfindm.h
# End Source File
# Begin Source File

SOURCE=.\idec.h
# End Source File
# Begin Source File

SOURCE=..\ttstest\stdafx.h
# End Source File
# Begin Source File

SOURCE=..\ttstest\tabisrce.h
# End Source File
# Begin Source File

SOURCE=..\ttstest\ttsdlg.h
# End Source File
# Begin Source File

SOURCE=..\ttstest\ttsfnc.h
# End Source File
# Begin Source File

SOURCE=..\ttstest\ttstst.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=..\ttstest\TTSTST.ICO
# End Source File
# End Group
# End Target
# End Project
