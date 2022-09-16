# Microsoft Developer Studio Project File - Name="dtdemo" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101
# TARGTYPE "Win32 (ALPHA) Application" 0x0601

CFG=dtdemo - Win32 ALPHA Debug United Kingdom
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "dtdemo.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dtdemo.mak" CFG="dtdemo - Win32 ALPHA Debug United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dtdemo - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Release Spanish" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Release German" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Release Latin American" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug German" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "dtdemo - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE "dtdemo - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "dtdemo - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Application")
!MESSAGE "dtdemo - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "dtdemo - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "dtdemo - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Application")
!MESSAGE "dtdemo - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "dtdemo - Win32 Release United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "dtdemo - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "dtdemo - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtdemo\us\release"
# PROP Intermediate_Dir ".\..\build\dtdemo\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /D "ACNA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 .\..\build\dtstatic\us\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtdemo\us\debug"
# PROP Intermediate_Dir ".\..\build\dtdemo\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /D "ACNA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 .\..\build\dtstatic\us\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\dtdemo__"
# PROP BASE Intermediate_Dir ".\dtdemo__"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtdemo\sp\release"
# PROP Intermediate_Dir ".\..\build\dtdemo\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /GX /O2 /I "api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "DEMO" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "DEMO" /d "SPANISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\dtstatic\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\build\dtstatic\sp\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\dtdemo_0"
# PROP BASE Intermediate_Dir ".\dtdemo_0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtdemo\gr\release"
# PROP Intermediate_Dir ".\..\build\dtdemo\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /GX /O2 /I "api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "DEMO" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG" /d "DEMO" /d "GERMAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\dtstatic\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\build\dtstatic\gr\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\dtdemo__"
# PROP BASE Intermediate_Dir ".\dtdemo__"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtdemo\la\release"
# PROP Intermediate_Dir ".\..\build\dtdemo\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /GX /O2 /I "api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "DEMO" /D "SPANISH" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG" /d "DEMO"
# ADD RSC /l 0x40a /d "NDEBUG" /d "DEMO" /d "SPANISH" /d "LATIN_AMERICAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\dtstatic\sp\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\build\dtstatic\la\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\dtdemo__"
# PROP BASE Intermediate_Dir ".\dtdemo__"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtdemo\sp\debug"
# PROP Intermediate_Dir ".\..\build\dtdemo\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /I "api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "DEMO" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "DEMO" /d "ENGLISH_US"
# ADD RSC /l 0x40a /d "_DEBUG" /d "DEMO" /d "SPANISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\dtstatic\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\build\dtstatic\sp\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\dtdemo_0"
# PROP BASE Intermediate_Dir ".\dtdemo_0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtdemo\gr\debug"
# PROP Intermediate_Dir ".\..\build\dtdemo\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /I "api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "DEMO" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "DEMO" /d "ENGLISH_US"
# ADD RSC /l 0x407 /d "_DEBUG" /d "DEMO" /d "GERMAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\dtstatic\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\build\dtstatic\gr\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\dtdemo_1"
# PROP BASE Intermediate_Dir ".\dtdemo_1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtdemo\la\debug"
# PROP Intermediate_Dir ".\..\build\dtdemo\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /I "api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "DEMO" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "DEMO" /d "ENGLISH_US"
# ADD RSC /l 0x40a /d "_DEBUG" /d "DEMO" /d "SPANISH" /d "LATIN_AMERICAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\dtstatic\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\build\dtstatic\la\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtdemo__"
# PROP BASE Intermediate_Dir "dtdemo__"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtdemo\us\release"
# PROP Intermediate_Dir ".\..\alpha\dtdemo\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "DEMO" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ACNA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "DEMO" /d "ENGLISH_US"
# ADD RSC /l 0x409 /d "NDEBUG" /d "DEMO" /d "ENGLISH_US"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\dtstatic\us\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\alpha\dtstatic\us\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtdemo_0"
# PROP BASE Intermediate_Dir "dtdemo_0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtdemo\us\debug"
# PROP Intermediate_Dir ".\..\alpha\dtdemo\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "DEMO" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ACNA" /YX /FD /MTd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "DEMO" /d "ENGLISH_US"
# ADD RSC /l 0x409 /d "_DEBUG" /d "DEMO" /d "ENGLISH_US"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\dtstatic\us\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\alpha\dtstatic\us\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtdemo__"
# PROP BASE Intermediate_Dir "dtdemo__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtdemo\sp\release"
# PROP Intermediate_Dir ".\..\alpha\dtdemo\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG" /d "DEMO" /d "SPANISH"
# ADD RSC /l 0x40a /d "NDEBUG" /d "DEMO" /d "SPANISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\sp\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\alpha\dtstatic\sp\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtdemo_0"
# PROP BASE Intermediate_Dir "dtdemo_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtdemo\gr\release"
# PROP Intermediate_Dir ".\..\alpha\dtdemo\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "NDEBUG" /d "DEMO" /d "GERMAN"
# ADD RSC /l 0x407 /d "NDEBUG" /d "DEMO" /d "GERMAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\gr\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\alpha\dtstatic\gr\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtdemo_1"
# PROP BASE Intermediate_Dir "dtdemo_1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtdemo\la\release"
# PROP Intermediate_Dir ".\..\alpha\dtdemo\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG" /d "SPANISH" /d "LATIN_AMERICAN"
# ADD RSC /l 0x40a /d "NDEBUG" /d "SPANISH" /d "LATIN_AMERICAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\la\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\alpha\dtstatic\la\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtdemo_2"
# PROP BASE Intermediate_Dir "dtdemo_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtdemo\sp\debug"
# PROP Intermediate_Dir ".\..\alpha\dtdemo\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /MTd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG" /d "SPANISH"
# ADD RSC /l 0x40a /d "_DEBUG" /d "SPANISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\sp\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\alpha\dtstatic\sp\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtdemo_3"
# PROP BASE Intermediate_Dir "dtdemo_3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtdemo\gr\debug"
# PROP Intermediate_Dir ".\..\alpha\dtdemo\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "GERMAN" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /MTd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "_DEBUG" /d "GERMAN"
# ADD RSC /l 0x407 /d "_DEBUG" /d "GERMAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\gr\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\alpha\dtstatic\gr\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtdemo_4"
# PROP BASE Intermediate_Dir "dtdemo_4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtdemo\la\debug"
# PROP Intermediate_Dir ".\..\alpha\dtdemo\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /MTd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG" /d "SPANISH" /d "LATIN_AMERICAN"
# ADD RSC /l 0x40a /d "_DEBUG" /d "SPANISH" /d "LATIN_AMERICAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\la\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\alpha\dtstatic\la\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtdemo__"
# PROP BASE Intermediate_Dir "dtdemo__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtdemo\uk\release"
# PROP Intermediate_Dir ".\..\build\dtdemo\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I ".\api" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "DEMO" /d "ENGLISH_US"
# ADD RSC /l 0x809 /d "NDEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\us\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\build\dtstatic\uk\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtdemo_0"
# PROP BASE Intermediate_Dir "dtdemo_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtdemo\uk\debug"
# PROP Intermediate_Dir ".\..\build\dtdemo\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /I ".\api" /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "DEMO" /d "ENGLISH_US"
# ADD RSC /l 0x809 /d "_DEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\us\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\build\dtstatic\uk\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtdemo__"
# PROP BASE Intermediate_Dir "dtdemo__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtdemo\uk\release"
# PROP Intermediate_Dir ".\..\alpha\dtdemo\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG" /d "ENGLISH"
# ADD RSC /l 0x809 /d "NDEBUG" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\uk\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\alpha\dtstatic\uk\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtdemo_0"
# PROP BASE Intermediate_Dir "dtdemo_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtdemo\uk\debug"
# PROP Intermediate_Dir ".\..\alpha\dtdemo\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "ALPHA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG" /d "ENGLISH"
# ADD RSC /l 0x809 /d "_DEBUG" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\uk\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\alpha\dtstatic\uk\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "dtdemo - Win32 Release"
# Name "dtdemo - Win32 Debug"
# Name "dtdemo - Win32 Release Spanish"
# Name "dtdemo - Win32 Release German"
# Name "dtdemo - Win32 Release Latin American"
# Name "dtdemo - Win32 Debug Spanish"
# Name "dtdemo - Win32 Debug German"
# Name "dtdemo - Win32 Debug Latin American"
# Name "dtdemo - Win32 ALPHA Release"
# Name "dtdemo - Win32 ALPHA Debug"
# Name "dtdemo - Win32 ALPHA Release Spanish"
# Name "dtdemo - Win32 ALPHA Release German"
# Name "dtdemo - Win32 ALPHA Release Latin American"
# Name "dtdemo - Win32 ALPHA Debug Spanish"
# Name "dtdemo - Win32 ALPHA Debug German"
# Name "dtdemo - Win32 ALPHA Debug Latin American"
# Name "dtdemo - Win32 Release United Kingdom"
# Name "dtdemo - Win32 Debug United Kingdom"
# Name "dtdemo - Win32 ALPHA Release United Kingdom"
# Name "dtdemo - Win32 ALPHA Debug United Kingdom"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=..\..\samples\speak\Speak.c

!IF  "$(CFG)" == "dtdemo - Win32 Release"

# SUBTRACT CPP /D "ACNA"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug"

# SUBTRACT CPP /D "ACNA"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release German"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug German"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Release"

DEP_CPP_SPEAK=\
	"..\..\samples\speak\resource.h"\
	"..\..\samples\speak\speak.h"\
	".\api\coop.h"\
	".\api\ttsapi.h"\
	
NODEP_CPP_SPEAK=\
	".\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0
# SUBTRACT CPP /D "ACNA"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Debug"

DEP_CPP_SPEAK=\
	"..\..\samples\speak\resource.h"\
	"..\..\samples\speak\speak.h"\
	".\api\coop.h"\
	".\api\ttsapi.h"\
	
NODEP_CPP_SPEAK=\
	".\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0
# ADD CPP /Gt0
# SUBTRACT CPP /D "ACNA"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Release Spanish"

DEP_CPP_SPEAK=\
	"..\..\samples\speak\resource.h"\
	"..\..\samples\speak\speak.h"\
	".\api\coop.h"\
	".\api\ttsapi.h"\
	
NODEP_CPP_SPEAK=\
	".\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Release German"

DEP_CPP_SPEAK=\
	"..\..\samples\speak\resource.h"\
	"..\..\samples\speak\speak.h"\
	".\api\coop.h"\
	".\api\ttsapi.h"\
	
NODEP_CPP_SPEAK=\
	".\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Release Latin American"

DEP_CPP_SPEAK=\
	"..\..\samples\speak\resource.h"\
	"..\..\samples\speak\speak.h"\
	".\api\coop.h"\
	".\api\ttsapi.h"\
	
NODEP_CPP_SPEAK=\
	".\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Debug Spanish"

DEP_CPP_SPEAK=\
	"..\..\samples\speak\resource.h"\
	"..\..\samples\speak\speak.h"\
	".\api\coop.h"\
	".\api\ttsapi.h"\
	
NODEP_CPP_SPEAK=\
	".\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Debug German"

DEP_CPP_SPEAK=\
	"..\..\samples\speak\resource.h"\
	"..\..\samples\speak\speak.h"\
	".\api\coop.h"\
	".\api\ttsapi.h"\
	
NODEP_CPP_SPEAK=\
	".\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Debug Latin American"

DEP_CPP_SPEAK=\
	"..\..\samples\speak\resource.h"\
	"..\..\samples\speak\speak.h"\
	".\api\coop.h"\
	".\api\ttsapi.h"\
	
NODEP_CPP_SPEAK=\
	".\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Release United Kingdom"

DEP_CPP_SPEAK=\
	"..\..\samples\speak\resource.h"\
	"..\..\samples\speak\speak.h"\
	".\api\coop.h"\
	".\api\ttsapi.h"\
	
NODEP_CPP_SPEAK=\
	".\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "dtdemo - Win32 ALPHA Debug United Kingdom"

DEP_CPP_SPEAK=\
	"..\..\samples\speak\resource.h"\
	"..\..\samples\speak\speak.h"\
	".\api\coop.h"\
	".\api\ttsapi.h"\
	
NODEP_CPP_SPEAK=\
	".\api\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\speak.rc
# ADD BASE RSC /l 0x409 /i "\Work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak"
# ADD RSC /l 0x409 /i "\Work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=..\..\samples\speak\speak.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
