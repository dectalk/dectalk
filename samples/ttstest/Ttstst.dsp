# Microsoft Developer Studio Project File - Name="Ttstst" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101
# TARGTYPE "Win32 (ALPHA) Application" 0x0601

CFG=Ttstst - Win32 ALPHA A2ADebug United Kingdom
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Ttstst.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Ttstst.mak" CFG="Ttstst - Win32 ALPHA A2ADebug United Kingdom"
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
!MESSAGE "Ttstst - Win32 (ALPHA) A2ADebug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 (ALPHA) A2ARel" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 (ALPHA) A2WDebug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 (ALPHA) A2WRel" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 (ALPHA) W2ADebug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 (ALPHA) W2ARel" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 (ALPHA) W2WDebug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 (ALPHA) W2WRel" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 A2ARel Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel German" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug German" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 ALPHA A2ARel" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 ALPHA A2ADebug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 ALPHA A2ARel Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 ALPHA A2ARel German" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 ALPHA A2ARel Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 ALPHA A2ADebug Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 ALPHA A2ADebug German" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 ALPHA A2ADebug Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 A2ARel United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 ALPHA A2ARel United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "Ttstst - Win32 ALPHA A2ADebug United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR /FD /c
# SUBTRACT CPP /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR /FD /c
# SUBTRACT CPP /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR /FD /c
# SUBTRACT CPP /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR /FD /c
# SUBTRACT CPP /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ADebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Ttstst__"
# PROP BASE Intermediate_Dir ".\Ttstst__"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\A2ADebug"
# PROP Intermediate_Dir ".\A2ADebug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /MDd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /MDd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /alpha
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:ALPHA
# ADD LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ARel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Ttstst_0"
# PROP BASE Intermediate_Dir ".\Ttstst_0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\A2ARel"
# PROP Intermediate_Dir ".\A2ARel"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /alpha
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WDebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Ttstst_1"
# PROP BASE Intermediate_Dir ".\Ttstst_1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\A2WDebug"
# PROP Intermediate_Dir ".\A2WDebug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /MDd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /YX /FD /MDd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /alpha
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:ALPHA
# ADD LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WRel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Ttstst_2"
# PROP BASE Intermediate_Dir ".\Ttstst_2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\A2WRel"
# PROP Intermediate_Dir ".\A2WRel"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /alpha
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ADebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Ttstst_3"
# PROP BASE Intermediate_Dir ".\Ttstst_3"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\W2ADebug"
# PROP Intermediate_Dir ".\W2ADebug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /MDd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /D "_S_ANSI" /YX /FD /MDd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /alpha
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:ALPHA
# ADD LINK32 ole32.lib uuid.lib winmm.lib /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ARel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Ttstst_4"
# PROP BASE Intermediate_Dir ".\Ttstst_4"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\W2ARel"
# PROP Intermediate_Dir ".\W2ARel"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /D "_S_ANSI" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /alpha
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ole32.lib uuid.lib winmm.lib /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WDebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Ttstst_5"
# PROP BASE Intermediate_Dir ".\Ttstst_5"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\W2WDebug"
# PROP Intermediate_Dir ".\W2WDebug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /MDd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /YX /FD /MDd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /alpha
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:ALPHA
# ADD LINK32 ole32.lib uuid.lib winmm.lib /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WRel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Ttstst_6"
# PROP BASE Intermediate_Dir ".\Ttstst_6"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\W2WRel"
# PROP Intermediate_Dir ".\W2WRel"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /alpha
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ole32.lib uuid.lib winmm.lib /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "GERMAN" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "GERMAN" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /D "LATIN_AMERICAN" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /D "LATIN_AMERICAN" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Ttstst__"
# PROP BASE Intermediate_Dir "Ttstst__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\us\release"
# PROP Intermediate_Dir ".\alpha\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH" /D "ENGLISH_US" /FD /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ..\..\sapi\alpha\dtlkttse\us\release\dtlkttse.lib ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /out:".\alpha\us\release/Ttstest.exe"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Ttstst_0"
# PROP BASE Intermediate_Dir "Ttstst_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\us\A2Adebug"
# PROP Intermediate_Dir ".\alpha\us\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /MDd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH" /D "ENGLISH_US" /FD /MDd /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA
# ADD LINK32 ..\..\sapi\alpha\dtlkttse\us\debug\dtlkttse.lib ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /out:".\alpha\us\debug/Ttstest.exe"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Spanish"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Ttstst_1"
# PROP BASE Intermediate_Dir "Ttstst_1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\sp\release"
# PROP Intermediate_Dir ".\alpha\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /D "SPANISH_SP" /FD /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ..\..\sapi\alpha\dtlkttse\sp\release\dtlkttse.lib ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /out:".\alpha\sp\release/Ttstest.exe"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel German"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Ttstst_2"
# PROP BASE Intermediate_Dir "Ttstst_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\gr\release"
# PROP Intermediate_Dir ".\alpha\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "GERMAN" /FD /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ..\..\sapi\alpha\dtlkttse\gr\release\dtlkttse.lib ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /out:".\alpha\gr\release/Ttstest.exe"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Latin American"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Ttstst_3"
# PROP BASE Intermediate_Dir "Ttstst_3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\la\release"
# PROP Intermediate_Dir ".\alpha\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /D "SPANISH_LA" /FD /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ..\..\sapi\alpha\dtlkttse\la\release\dtlkttse.lib ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /out:".\alpha\la\release/Ttstest.exe"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Spanish"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Ttstst_4"
# PROP BASE Intermediate_Dir "Ttstst_4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\sp\A2Adebug"
# PROP Intermediate_Dir ".\alpha\sp\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /MDd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /D "SPANISH_SP" /FD /MDd /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA
# ADD LINK32 ..\..\sapi\alpha\dtlkttse\sp\debug\dtlkttse.lib ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /out:".\alpha\sp\debug/Ttstest.exe"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug German"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Ttstst_5"
# PROP BASE Intermediate_Dir "Ttstst_5"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\gr\A2Adebug"
# PROP Intermediate_Dir ".\alpha\gr\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /MDd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "GERMAN" /FD /MDd /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA
# ADD LINK32 ..\..\sapi\alpha\dtlkttse\gr\debug\dtlkttse.lib ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /out:".\alpha\gr\debug/Ttstest.exe"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Latin American"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Ttstst_6"
# PROP BASE Intermediate_Dir "Ttstst_6"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\la\A2Adebug"
# PROP Intermediate_Dir ".\alpha\la\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /MDd /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "SPANISH" /D "SPANISH_LA" /FD /MDd /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /alpha
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA
# ADD LINK32 ..\..\sapi\alpha\dtlkttse\la\debug\dtlkttse.lib ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /out:".\alpha\la\debug/Ttstest.exe"

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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel United Kingdom"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Ttstst__"
# PROP BASE Intermediate_Dir "Ttstst__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\uk\release"
# PROP Intermediate_Dir ".\alpha\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /D "_AFXDLL" /FD /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH" /D "ENGLISH_UK" /FD /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x809 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\uk\release\dtlkttse.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /out:".\build\uk\release/Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\dtlkttse\sp\release\dtlkttse.lib ole32.lib uuid.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /out:".\alpha\uk\release/Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug United Kingdom"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Ttstst_0"
# PROP BASE Intermediate_Dir "Ttstst_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\uk\A2Adebug"
# PROP Intermediate_Dir ".\alpha\uk\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /D "_AFXDLL" /FD /MDd /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH" /D "ENGLISH_UK" /FD /MDd /c
# SUBTRACT CPP /Fr /YX /Yc /Yu
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x809 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dtlkttse\uk\debug\dtlkttse.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /out:".\build\uk\A2ADebug/Ttstest.exe" /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\dtlkttse\uk\debug\dtlkttse.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /out:".\alpha\uk\A2ADebug/Ttstest.exe" /SUBSYSTEM:windows,4.0
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
# Name "Ttstst - Win32 (ALPHA) A2ADebug"
# Name "Ttstst - Win32 (ALPHA) A2ARel"
# Name "Ttstst - Win32 (ALPHA) A2WDebug"
# Name "Ttstst - Win32 (ALPHA) A2WRel"
# Name "Ttstst - Win32 (ALPHA) W2ADebug"
# Name "Ttstst - Win32 (ALPHA) W2ARel"
# Name "Ttstst - Win32 (ALPHA) W2WDebug"
# Name "Ttstst - Win32 (ALPHA) W2WRel"
# Name "Ttstst - Win32 A2ARel Spanish"
# Name "Ttstst - Win32 A2ADebug Spanish"
# Name "Ttstst - Win32 A2ARel German"
# Name "Ttstst - Win32 A2ADebug German"
# Name "Ttstst - Win32 A2ARel Latin American"
# Name "Ttstst - Win32 A2ADebug Latin American"
# Name "Ttstst - Win32 ALPHA A2ARel"
# Name "Ttstst - Win32 ALPHA A2ADebug"
# Name "Ttstst - Win32 ALPHA A2ARel Spanish"
# Name "Ttstst - Win32 ALPHA A2ARel German"
# Name "Ttstst - Win32 ALPHA A2ARel Latin American"
# Name "Ttstst - Win32 ALPHA A2ADebug Spanish"
# Name "Ttstst - Win32 ALPHA A2ADebug German"
# Name "Ttstst - Win32 ALPHA A2ADebug Latin American"
# Name "Ttstst - Win32 A2ARel United Kingdom"
# Name "Ttstst - Win32 A2ADebug United Kingdom"
# Name "Ttstst - Win32 ALPHA A2ARel United Kingdom"
# Name "Ttstst - Win32 ALPHA A2ADebug United Kingdom"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\DLGFINDM.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel German"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\sapi\src\API\guidseg.cpp

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel German"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\API\ctools.h"\
	"..\..\sapi\src\API\dtlktts.h"\
	"..\..\sapi\src\API\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\API\dectalkf.h"\
	"..\..\sapi\src\API\idec.h"\
	"..\..\sapi\src\API\tts.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\STDAFX.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel German"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\TABISRCE.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel German"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\TTSDLG.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel German"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Dlgfindm.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\TTSFNC.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel German"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	".\Bufcvt.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttsfnc.h"\
	".\Ttstst.h"\
	
NODEP_CPP_TTSFN=\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\TTSTST.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel German"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Ttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	".\Stdafx.h"\
	".\Tabisrce.h"\
	".\Ttsdlg.h"\
	".\Ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ENDIF 

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
