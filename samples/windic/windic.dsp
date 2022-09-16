# Microsoft Developer Studio Project File - Name="windic" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=windic - Win32 Debug Static French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "windic.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "windic.mak" CFG="windic - Win32 Debug Static French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "windic - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static German" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static German" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static French" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static French" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "windic - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\ml\release"
# PROP Intermediate_Dir ".\build\ml\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 ..\..\dtalkml\build\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\ml\debug"
# PROP Intermediate_Dir ".\build\ml\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MT /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 ..\..\dtalkml\build\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic__"
# PROP BASE Intermediate_Dir "windic__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\us\wdicstat"
# PROP Intermediate_Dir ".\build\us\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\us\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_0"
# PROP BASE Intermediate_Dir "windic_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\dbgstat"
# PROP Intermediate_Dir ".\build\us\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\us\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic__"
# PROP BASE Intermediate_Dir "windic__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\sp\wdicstat"
# PROP Intermediate_Dir ".\build\sp\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\sp\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic_0"
# PROP BASE Intermediate_Dir "windic_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\gr\wdicstat"
# PROP Intermediate_Dir ".\build\gr\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\gr\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic_1"
# PROP BASE Intermediate_Dir "windic_1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\la\wdicstat"
# PROP Intermediate_Dir ".\build\la\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\la\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_2"
# PROP BASE Intermediate_Dir "windic_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\sp\dbgstat"
# PROP Intermediate_Dir ".\build\sp\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\sp\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_3"
# PROP BASE Intermediate_Dir "windic_3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\gr\dbgstat"
# PROP Intermediate_Dir ".\build\gr\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\gr\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_4"
# PROP BASE Intermediate_Dir "windic_4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\la\dbgstat"
# PROP Intermediate_Dir ".\build\la\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\la\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic_0"
# PROP BASE Intermediate_Dir "windic_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\uk\wdicstat"
# PROP Intermediate_Dir ".\build\uk\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\uk\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_2"
# PROP BASE Intermediate_Dir "windic_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\uk\dbgstat"
# PROP Intermediate_Dir ".\build\uk\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_DEBUG" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\uk\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic___Win32_Release_Static_French"
# PROP BASE Intermediate_Dir "windic___Win32_Release_Static_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\fr\wdicstat"
# PROP Intermediate_Dir ".\build\fr\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "WIN32" /D "_WINDOWS" /D "FRENCH" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\fr\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic___Win32_Debug_Static_French"
# PROP BASE Intermediate_Dir "windic___Win32_Debug_Static_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\fr\dbgstat"
# PROP Intermediate_Dir ".\build\fr\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "WIN32" /D "_WINDOWS" /D "FRENCH" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\fr\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "windic - Win32 Release"
# Name "windic - Win32 Debug"
# Name "windic - Win32 Release Static"
# Name "windic - Win32 Debug Static"
# Name "windic - Win32 Release Static Spanish"
# Name "windic - Win32 Release Static German"
# Name "windic - Win32 Release Static Latin American"
# Name "windic - Win32 Debug Static Spanish"
# Name "windic - Win32 Debug Static German"
# Name "windic - Win32 Debug Static Latin American"
# Name "windic - Win32 Release Static United Kingdom"
# Name "windic - Win32 Debug Static United Kingdom"
# Name "windic - Win32 Release Static French"
# Name "windic - Win32 Debug Static French"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\usedic.c
# End Source File
# Begin Source File

SOURCE=.\windic.c
# End Source File
# Begin Source File

SOURCE=.\windic.rc
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\windic.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\DIGITAL.BMP
# End Source File
# Begin Source File

SOURCE=.\windic.ico
# End Source File
# End Group
# End Target
# End Project
