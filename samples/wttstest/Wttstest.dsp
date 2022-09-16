# Microsoft Developer Studio Project File - Name="Wttstst" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101
# TARGTYPE "Win32 (ALPHA) Application" 0x0601

CFG=Wttstst - Win32 ALPHA A2ADebug United Kingdom
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Wttstest.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wttstest.mak" CFG="Wttstst - Win32 ALPHA A2ADebug United Kingdom"
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
!MESSAGE "Wttstst - Win32 (ALPHA) A2ADebug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 (ALPHA) A2ARel" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 (ALPHA) A2WDebug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 (ALPHA) A2WRel" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 (ALPHA) W2ADebug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 (ALPHA) W2ARel" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 (ALPHA) W2WDebug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 (ALPHA) W2WRel" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 A2ARel Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel German" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug German" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 ALPHA A2ARel" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 ALPHA A2ARel Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 ALPHA A2ARel German" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 ALPHA A2ARel Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 ALPHA A2ADebug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 ALPHA A2ADebug Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 ALPHA A2ADebug German" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 ALPHA A2ADebug Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 ALPHA A2ARel United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "Wttstst - Win32 ALPHA A2ADebug United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /c
# SUBTRACT BASE CPP /Fr /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ADebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Wttstst__"
# PROP BASE Intermediate_Dir ".\Wttstst__"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\A2ADebug"
# PROP Intermediate_Dir ".\A2ADebug"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /MDd /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /FD /MDd /c
# SUBTRACT CPP /YX
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

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ARel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Wttstst_0"
# PROP BASE Intermediate_Dir ".\Wttstst_0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\A2ARel"
# PROP Intermediate_Dir ".\A2ARel"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /FD /c
# SUBTRACT CPP /YX
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

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WDebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Wttstst_1"
# PROP BASE Intermediate_Dir ".\Wttstst_1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\A2WDebug"
# PROP Intermediate_Dir ".\A2WDebug"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /MDd /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /FD /MDd /c
# SUBTRACT CPP /YX
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

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WRel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Wttstst_2"
# PROP BASE Intermediate_Dir ".\Wttstst_2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\A2WRel"
# PROP Intermediate_Dir ".\A2WRel"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "_S_UNICODE" /FD /c
# SUBTRACT CPP /YX
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

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ADebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Wttstst_3"
# PROP BASE Intermediate_Dir ".\Wttstst_3"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\W2ADebug"
# PROP Intermediate_Dir ".\W2ADebug"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /MDd /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /D "_S_ANSI" /FD /MDd /c
# SUBTRACT CPP /YX
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

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ARel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Wttstst_4"
# PROP BASE Intermediate_Dir ".\Wttstst_4"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\W2ARel"
# PROP Intermediate_Dir ".\W2ARel"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /D "_S_ANSI" /FD /c
# SUBTRACT CPP /YX
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

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WDebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Wttstst_5"
# PROP BASE Intermediate_Dir ".\Wttstst_5"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\W2WDebug"
# PROP Intermediate_Dir ".\W2WDebug"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /MDd /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /FD /MDd /c
# SUBTRACT CPP /YX
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

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WRel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Wttstst_6"
# PROP BASE Intermediate_Dir ".\Wttstst_6"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\W2WRel"
# PROP Intermediate_Dir ".\W2WRel"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /FD /c
# SUBTRACT CPP /YX
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
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

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Wttstst_"
# PROP BASE Intermediate_Dir "Wttstst_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\us\release"
# PROP Intermediate_Dir ".\alpha\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_US" /D "WILLOWPOND" /D "ENGLISH" /D "_AFXDLL" /FR /YX /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_US" /D "WILLOWPOND" /D "ENGLISH" /D "_AFXDLL" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /fo".\build\us\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /fo".\alpha\us\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /subsystem:windows /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Spanish"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Wttstst0"
# PROP BASE Intermediate_Dir "Wttstst0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\sp\release"
# PROP Intermediate_Dir ".\alpha\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "_AFXDLL" /FR /YX /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "_AFXDLL" /D "SPANISH_SP" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /fo".\build\sp\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /fo".\alpha\sp\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\sp\release\wtlkttse.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\wtlkttse\sp\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /subsystem:windows /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel German"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Wttstst1"
# PROP BASE Intermediate_Dir "Wttstst1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\gr\release"
# PROP Intermediate_Dir ".\alpha\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /D "_AFXDLL" /FR /YX /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /D "_AFXDLL" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /fo".\build\gr\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /fo".\alpha\gr\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\gr\release\wtlkttse.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\wtlkttse\gr\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /subsystem:windows /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Latin American"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Wttstst2"
# PROP BASE Intermediate_Dir "Wttstst2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\la\release"
# PROP Intermediate_Dir ".\alpha\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /D "_AFXDLL" /FR /YX /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /D "_AFXDLL" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /fo".\build\la\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /fo".\alpha\la\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\la\release\wtlkttse.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\wtlkttse\la\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /subsystem:windows /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Wttstst3"
# PROP BASE Intermediate_Dir "Wttstst3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\us\A2Adebug"
# PROP Intermediate_Dir ".\alpha\us\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_US" /D "WILLOWPOND" /D "ENGLISH" /D "_AFXDLL" /FR /YX /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_US" /D "WILLOWPOND" /D "ENGLISH" /D "_AFXDLL" /FR /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /fo".\build\us\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /fo".\alpha\us\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /subsystem:windows /debug /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Spanish"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Wttstst4"
# PROP BASE Intermediate_Dir "Wttstst4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\sp\A2Adebug"
# PROP Intermediate_Dir ".\alpha\sp\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "_AFXDLL" /FR /YX /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "_AFXDLL" /D "SPANISH_SP" /FR /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /fo".\build\sp\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /fo".\alpha\sp\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\sp\debug\wtlkttse.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\wtlkttse\sp\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /subsystem:windows /debug /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug German"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Wttstst5"
# PROP BASE Intermediate_Dir "Wttstst5"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\gr\A2Adebug"
# PROP Intermediate_Dir ".\alpha\gr\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /D "_AFXDLL" /FR /YX /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /D "_AFXDLL" /FR /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /fo".\build\gr\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x407 /fo".\alpha\gr\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\gr\debug\wtlkttse.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\wtlkttse\gr\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /subsystem:windows /debug /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Latin American"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Wttstst6"
# PROP BASE Intermediate_Dir "Wttstst6"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\la\A2Adebug"
# PROP Intermediate_Dir ".\alpha\la\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /D "_AFXDLL" /FR /YX /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /D "_AFXDLL" /FR /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /fo".\build\la\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40a /fo".\alpha\la\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\la\debug\wtlkttse.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\wtlkttse\la\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /subsystem:windows /debug /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel United Kingdom"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Wttstst7"
# PROP BASE Intermediate_Dir "Wttstst7"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\uk\release"
# PROP Intermediate_Dir ".\alpha\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /D "_AFXDLL" /FR /YX /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /D "_AFXDLL" /FR /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /fo".\build\uk\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x809 /fo".\alpha\uk\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\uk\release\wtlkttse.lib winmm.lib /nologo /subsystem:windows /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\wtlkttse\uk\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /subsystem:windows /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug United Kingdom"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Wttstst8"
# PROP BASE Intermediate_Dir "Wttstst8"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\uk\A2Adebug"
# PROP Intermediate_Dir ".\alpha\uk\A2Adebug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /D "_AFXDLL" /FR /YX /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /D "_AFXDLL" /FR /FD /MDd /D RTLICENSEKEY="\"WpDec@n1G\"" /c
# SUBTRACT CPP /YX
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /fo".\build\uk\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x809 /fo".\alpha\uk\A2ADebug\link\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\wtlkttse\uk\debug\wtlkttse.lib winmm.lib /nologo /subsystem:windows /debug /machine:ALPHA /SUBSYSTEM:windows,4.0
# SUBTRACT BASE LINK32 /pdb:none /map
# ADD LINK32 ..\..\sapi\alpha\wtlkttse\uk\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /subsystem:windows /debug /machine:ALPHA /SUBSYSTEM:windows,4.0
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
# Name "Wttstst - Win32 (ALPHA) A2ADebug"
# Name "Wttstst - Win32 (ALPHA) A2ARel"
# Name "Wttstst - Win32 (ALPHA) A2WDebug"
# Name "Wttstst - Win32 (ALPHA) A2WRel"
# Name "Wttstst - Win32 (ALPHA) W2ADebug"
# Name "Wttstst - Win32 (ALPHA) W2ARel"
# Name "Wttstst - Win32 (ALPHA) W2WDebug"
# Name "Wttstst - Win32 (ALPHA) W2WRel"
# Name "Wttstst - Win32 A2ARel Spanish"
# Name "Wttstst - Win32 A2ARel German"
# Name "Wttstst - Win32 A2ARel Latin American"
# Name "Wttstst - Win32 A2ADebug Spanish"
# Name "Wttstst - Win32 A2ADebug German"
# Name "Wttstst - Win32 A2ADebug Latin American"
# Name "Wttstst - Win32 A2ARel United Kingdom"
# Name "Wttstst - Win32 A2ADebug United Kingdom"
# Name "Wttstst - Win32 ALPHA A2ARel"
# Name "Wttstst - Win32 ALPHA A2ARel Spanish"
# Name "Wttstst - Win32 ALPHA A2ARel German"
# Name "Wttstst - Win32 ALPHA A2ARel Latin American"
# Name "Wttstst - Win32 ALPHA A2ADebug"
# Name "Wttstst - Win32 ALPHA A2ADebug Spanish"
# Name "Wttstst - Win32 ALPHA A2ADebug German"
# Name "Wttstst - Win32 ALPHA A2ADebug Latin American"
# Name "Wttstst - Win32 ALPHA A2ARel United Kingdom"
# Name "Wttstst - Win32 ALPHA A2ADebug United Kingdom"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=..\ttstest\DLGFINDM.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel German"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_DLGFI=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\sapi\src\Api\guidseg.cpp

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\idec.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\idec.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\idec.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\idec.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\idec.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\idec.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\idec.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\idec.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	".\idec.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	".\idec.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel German"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	".\idec.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	".\idec.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	".\idec.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	".\idec.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	".\idec.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	".\idec.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	".\idec.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_GUIDS=\
	"..\..\microsoft\speech.h"\
	"..\..\sapi\src\Api\ctools.h"\
	"..\..\sapi\src\Api\dtlktts.h"\
	"..\..\sapi\src\Api\stdafx.h"\
	".\idec.h"\
	
NODEP_CPP_GUIDS=\
	"..\..\sapi\src\Api\dectalkf.h"\
	"..\..\sapi\src\Api\tts.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\ttstest\STDAFX.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yc

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel German"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_STDAF=\
	"..\ttstest\stdafx.h"\
	
# ADD BASE CPP /Gt0 /Yc"stdafx.h"
# ADD CPP /Gt0 /Yc"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\ttstest\TABISRCE.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel German"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_TABIS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\ttstest\TTSDLG.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel German"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_TTSDL=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\dlgfindm.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\ttstest\TTSFNC.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
NODEP_CPP_TTSFN=\
	"..\ttstest\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
NODEP_CPP_TTSFN=\
	"..\ttstest\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
NODEP_CPP_TTSFN=\
	"..\ttstest\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
NODEP_CPP_TTSFN=\
	"..\ttstest\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
NODEP_CPP_TTSFN=\
	"..\ttstest\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
NODEP_CPP_TTSFN=\
	"..\ttstest\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
NODEP_CPP_TTSFN=\
	"..\ttstest\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	
NODEP_CPP_TTSFN=\
	"..\ttstest\idec.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel German"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_TTSFN=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\bufcvt.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttsfnc.h"\
	"..\ttstest\ttstst.h"\
	".\idec.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\ttstest\TTSTST.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ADebug"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2ARel"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WDebug"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) A2WRel"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ADebug"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2ARel"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WDebug"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 (ALPHA) W2WRel"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

# ADD BASE CPP /Yu"stdafx.h"
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Spanish"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel German"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel Latin American"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Spanish"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug German"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug Latin American"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ARel United Kingdom"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "Wttstst - Win32 ALPHA A2ADebug United Kingdom"

DEP_CPP_TTSTS=\
	"..\..\microsoft\speech.h"\
	"..\ttstest\stdafx.h"\
	"..\ttstest\tabisrce.h"\
	"..\ttstest\ttsdlg.h"\
	"..\ttstest\ttstst.h"\
	
# ADD BASE CPP /Gt0 /Yu"stdafx.h"
# ADD CPP /Gt0 /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\ttstest\TTSTST.RC
# ADD BASE RSC /l 0x409 /i "\Work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest"
# ADD RSC /l 0x409 /i "\Work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest"
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
