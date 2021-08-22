# Microsoft Developer Studio Project File - Name="dtdemo" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=dtdemo - Win32 Debug French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "dtdemo.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dtdemo.mak" CFG="dtdemo - Win32 Debug French"
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
!MESSAGE "dtdemo - Win32 Release United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Release French" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug French" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath "Desktop"
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

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
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /I ".\ph" /I ".\include\\" /I ".\nt\\" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /I ".\ph" /I ".\include" /I ".\nt" /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MTd /W3 /GX /O2 /I "api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "DEMO" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MTd /W3 /GX /O2 /I "api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "DEMO" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MTd /W3 /GX /O2 /I "api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "DEMO" /D "SPANISH" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /I "api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "DEMO" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /I "api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "DEMO" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /I "api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "DEMO" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I ".\api" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
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
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /I ".\api" /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
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

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dtdemo___Win32_Release_French"
# PROP BASE Intermediate_Dir "dtdemo___Win32_Release_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtdemo\fr\release"
# PROP Intermediate_Dir ".\..\build\dtdemo\fr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH"
# ADD RSC /l 0x409 /d "NDEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\us\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\build\dtstatic\fr\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dtdemo___Win32_Debug_French"
# PROP BASE Intermediate_Dir "dtdemo___Win32_Debug_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtdemo\fr\debug"
# PROP Intermediate_Dir ".\..\build\dtdemo\fr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH"
# ADD RSC /l 0x409 /d "_DEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\build\dtstatic\us\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 .\..\build\dtstatic\fr\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
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
# Name "dtdemo - Win32 Release United Kingdom"
# Name "dtdemo - Win32 Debug United Kingdom"
# Name "dtdemo - Win32 Release French"
# Name "dtdemo - Win32 Debug French"
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

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release French"

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug French"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\speak.rc
# ADD BASE RSC /l 0x409 /i "\work\rnd\samples\speak" /i "\work\ad\samples\speak" /i "\work\rnd.007\samples\speak"
# ADD RSC /l 0x409 /i "\work\rnd\samples\speak" /i "\work\ad\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak"
# End Source File
# Begin Source File

SOURCE=.\hlsyn\sqrttable.c
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
# Begin Source File

SOURCE=..\..\samples\speak\beautifu.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\bet203a.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\bet203b.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\den203a.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\den203b.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\digital.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\doctorde.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\fra203a.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\fra203b.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\frailfra.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\har203a.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\har203b.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\hugeharr.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\kid203a.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\kid203b.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\kittheki.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\pau203a.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\pau203b.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\pause.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\perfectp.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\play.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\RELOAD.BMP
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\rit203a.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\rit203b.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\roughrit.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_beauti.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_doctor.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_frailf.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_hugeha.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_kitthe.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_pause.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_perfec.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_play.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\S_RELOAD.BMP
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_roughr.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_stop.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_upityu.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\s_wisper.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\speak.ico
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\stop.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\TEAM03.BMP
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\upityurs.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\urs203a.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\urs203b.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\wen203a.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\wen203b.bmp
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\wisperin.bmp
# End Source File
# End Group
# Begin Source File

SOURCE=..\..\samples\speak\speak.pal
# End Source File
# Begin Source File

SOURCE=..\..\samples\speak\TEAM03.PAL
# End Source File
# End Target
# End Project
