# Microsoft Developer Studio Project File - Name="Ttstst" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=Ttstst - Win32 A2ADebug French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Ttstst.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Ttstst.mak" CFG="Ttstst - Win32 A2ADebug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Ttstst - Win32 A2WRel" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2WDebug" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 W2ADebug" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 W2ARel" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 W2WDebug" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 W2WRel" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel German" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug German" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug French" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel French" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

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
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 ..\..\sapi\build\dtlkttse\us\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\us\release\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

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
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 ..\..\sapi\build\dtlkttse\us\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\us\A2WDebug\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

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
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\us\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\us\A2ADebug/Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

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
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\us\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\us\release/Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

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
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR /FD /c
# SUBTRACT CPP /YX /Yc /Yu
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dlkttse\us\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

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
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR /FD /c
# SUBTRACT CPP /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dlkttse\us\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

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
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR /FD /c
# SUBTRACT CPP /YX /Yc /Yu
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dlkttse\us\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /debug /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

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
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR /FD /c
# SUBTRACT CPP /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 uuid.lib ole32.lib /nologo /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dlkttse\us\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /machine:I386 /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Ttstst__"
# PROP BASE Intermediate_Dir "Ttstst__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\sp\release"
# PROP Intermediate_Dir ".\build\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\sp\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\sp\release\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\sp\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\sp\release\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Ttstst_0"
# PROP BASE Intermediate_Dir "Ttstst_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\sp\A2ADebug"
# PROP Intermediate_Dir ".\build\sp\A2ADebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\sp\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\sp\A2WDebug\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\sp\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\sp\A2ADebug\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Ttstst_1"
# PROP BASE Intermediate_Dir "Ttstst_1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\gr\release"
# PROP Intermediate_Dir ".\build\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "GERMAN" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\gr\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\gr\release\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\gr\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\gr\release\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Ttstst_2"
# PROP BASE Intermediate_Dir "Ttstst_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\gr\A2ADebug"
# PROP Intermediate_Dir ".\build\gr\A2ADebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "GERMAN" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\gr\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\gr\A2WDebug\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\gr\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\gr\A2ADebug\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Ttstst_3"
# PROP BASE Intermediate_Dir "Ttstst_3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\la\release"
# PROP Intermediate_Dir ".\build\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /D "LATIN_AMERICAN" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\la\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\la\release\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\la\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\la\release\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Ttstst_4"
# PROP BASE Intermediate_Dir "Ttstst_4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\la\A2ADebug"
# PROP Intermediate_Dir ".\build\la\A2ADebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /D "LATIN_AMERICAN" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\la\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\la\A2WDebug\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\la\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\la\A2ADebug\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Ttstst__"
# PROP BASE Intermediate_Dir "Ttstst__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\uk\release"
# PROP Intermediate_Dir ".\build\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x809 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\us\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\us\release/Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\uk\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\uk\release/Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Ttstst_0"
# PROP BASE Intermediate_Dir "Ttstst_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\uk\A2ADebug"
# PROP Intermediate_Dir ".\build\uk\A2ADebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x809 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\us\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\us\A2ADebug/Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\uk\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\uk\A2ADebug/Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug French"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Ttstst___Win32_A2ADebug_French"
# PROP BASE Intermediate_Dir "Ttstst___Win32_A2ADebug_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\fr\A2ADebug"
# PROP Intermediate_Dir ".\build\fr\A2ADebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\gr\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\gr\A2ADebug\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\fr\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /debug /machine:I386 /out:".\build\fr\A2ADebug\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel French"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Ttstst___Win32_A2ARel_French"
# PROP BASE Intermediate_Dir "Ttstst___Win32_A2ARel_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\fr\release"
# PROP Intermediate_Dir ".\build\fr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\gr\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\gr\release\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\build\dtlkttse\fr\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /machine:I386 /out:".\build\fr\release\Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ENDIF 

# Begin Target

# Name "Ttstst - Win32 A2WRel"
# Name "Ttstst - Win32 A2WDebug"
# Name "Ttstst - Win32 A2ADebug"
# Name "Ttstst - Win32 A2ARel"
# Name "Ttstst - Win32 W2ADebug"
# Name "Ttstst - Win32 W2ARel"
# Name "Ttstst - Win32 W2WDebug"
# Name "Ttstst - Win32 W2WRel"
# Name "Ttstst - Win32 A2ARel Spanish"
# Name "Ttstst - Win32 A2ADebug Spanish"
# Name "Ttstst - Win32 A2ARel German"
# Name "Ttstst - Win32 A2ADebug German"
# Name "Ttstst - Win32 A2ARel Latin American"
# Name "Ttstst - Win32 A2ADebug Latin American"
# Name "Ttstst - Win32 A2ARel United Kingdom"
# Name "Ttstst - Win32 A2ADebug United Kingdom"
# Name "Ttstst - Win32 A2ADebug French"
# Name "Ttstst - Win32 A2ARel French"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\DLGFINDM.CPP
# ADD CPP /Yu"stdafx.h"
# End Source File
# Begin Source File

SOURCE=..\..\sapi\src\API\guidseg.cpp
# End Source File
# Begin Source File

SOURCE=.\STDAFX.CPP
# ADD CPP /Yc"stdafx.h"
# End Source File
# Begin Source File

SOURCE=.\TABISRCE.CPP
# ADD CPP /Yu"stdafx.h"
# End Source File
# Begin Source File

SOURCE=.\TTSDLG.CPP
# ADD CPP /Yu"stdafx.h"
# End Source File
# Begin Source File

SOURCE=.\TTSFNC.CPP
# ADD CPP /Yu"stdafx.h"
# End Source File
# Begin Source File

SOURCE=.\TTSTST.CPP
# ADD CPP /Yu"stdafx.h"
# End Source File
# Begin Source File

SOURCE=.\TTSTST.RC
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\Bufcvt.h
# End Source File
# Begin Source File

SOURCE=.\Dlgfindm.h
# End Source File
# Begin Source File

SOURCE=.\Speech.h
# End Source File
# Begin Source File

SOURCE=.\Stdafx.h
# End Source File
# Begin Source File

SOURCE=.\Tabisrce.h
# End Source File
# Begin Source File

SOURCE=.\Ttsdlg.h
# End Source File
# Begin Source File

SOURCE=.\Ttsfnc.h
# End Source File
# Begin Source File

SOURCE=.\Ttstst.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\Ttstst.ico
# End Source File
# Begin Source File

SOURCE=.\Ttstst.rc2
# End Source File
# End Group
# End Target
# End Project
