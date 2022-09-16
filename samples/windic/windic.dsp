# Microsoft Developer Studio Project File - Name="windic" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101
# TARGTYPE "Win32 (ALPHA) Application" 0x0601

CFG=windic - Win32 ALPHA Debug Static United Kingdom
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "windic.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "windic.mak" CFG="windic - Win32 ALPHA Debug Static United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "windic - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 Release Static" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static German" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static German" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 ALPHA Release Static" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Release Static Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Release Static German" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Release Static Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug Static" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug Static Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug Static German" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug Static Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 Release Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 ALPHA Release Static United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug Static United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MT /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 ..\..\dtalkml\build\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic__"
# PROP BASE Intermediate_Dir "windic__"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\ml\release"
# PROP Intermediate_Dir ".\alpha\ml\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dtalkml\alpha\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_0"
# PROP BASE Intermediate_Dir "windic_0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\ml\debug"
# PROP Intermediate_Dir ".\alpha\ml\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dtalkml\alpha\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\us\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\sp\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\gr\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\la\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic__"
# PROP BASE Intermediate_Dir "windic__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\us\wdicstat"
# PROP Intermediate_Dir ".\alpha\us\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtstatic\us\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic_0"
# PROP BASE Intermediate_Dir "windic_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\sp\wdicstat"
# PROP Intermediate_Dir ".\alpha\sp\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\sp\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtstatic\sp\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic_1"
# PROP BASE Intermediate_Dir "windic_1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\gr\wdicstat"
# PROP Intermediate_Dir ".\alpha\gr\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /D "GERMAN" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\gr\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtstatic\gr\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic_2"
# PROP BASE Intermediate_Dir "windic_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\la\wdicstat"
# PROP Intermediate_Dir ".\alpha\la\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\la\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtstatic\la\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_3"
# PROP BASE Intermediate_Dir "windic_3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\us\dbgstat"
# PROP Intermediate_Dir ".\alpha\us\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtstatic\us\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_4"
# PROP BASE Intermediate_Dir "windic_4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\sp\dbgstat"
# PROP Intermediate_Dir ".\alpha\sp\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\sp\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtstatic\sp\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_5"
# PROP BASE Intermediate_Dir "windic_5"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\gr\dbgstat"
# PROP Intermediate_Dir ".\alpha\gr\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /D "GERMAN" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\gr\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtstatic\gr\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_6"
# PROP BASE Intermediate_Dir "windic_6"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\la\dbgstat"
# PROP Intermediate_Dir ".\alpha\la\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\la\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtstatic\la\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
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
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_DEBUG" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dtstatic\uk\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "windic_1"
# PROP BASE Intermediate_Dir "windic_1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\uk\wdicstat"
# PROP Intermediate_Dir ".\alpha\uk\wdicstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH" /D "ENGLISH_UK" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\uk\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtstatic\uk\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "windic_2"
# PROP BASE Intermediate_Dir "windic_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\uk\dbgstat"
# PROP Intermediate_Dir ".\alpha\uk\dbgstat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\ /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH" /D "ENGLISH_UK" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\uk\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\alpha\dtstatic\uk\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "windic - Win32 Release"
# Name "windic - Win32 Debug"
# Name "windic - Win32 ALPHA Release"
# Name "windic - Win32 ALPHA Debug"
# Name "windic - Win32 Release Static"
# Name "windic - Win32 Debug Static"
# Name "windic - Win32 Release Static Spanish"
# Name "windic - Win32 Release Static German"
# Name "windic - Win32 Release Static Latin American"
# Name "windic - Win32 Debug Static Spanish"
# Name "windic - Win32 Debug Static German"
# Name "windic - Win32 Debug Static Latin American"
# Name "windic - Win32 ALPHA Release Static"
# Name "windic - Win32 ALPHA Release Static Spanish"
# Name "windic - Win32 ALPHA Release Static German"
# Name "windic - Win32 ALPHA Release Static Latin American"
# Name "windic - Win32 ALPHA Debug Static"
# Name "windic - Win32 ALPHA Debug Static Spanish"
# Name "windic - Win32 ALPHA Debug Static German"
# Name "windic - Win32 ALPHA Debug Static Latin American"
# Name "windic - Win32 Release Static United Kingdom"
# Name "windic - Win32 Debug Static United Kingdom"
# Name "windic - Win32 ALPHA Release Static United Kingdom"
# Name "windic - Win32 ALPHA Debug Static United Kingdom"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\usedic.c

!IF  "$(CFG)" == "windic - Win32 Release"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static"

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Spanish"

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static German"

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Latin American"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Spanish"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static German"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Latin American"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Spanish"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static German"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Latin American"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Spanish"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static German"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Latin American"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static United Kingdom"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static United Kingdom"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static United Kingdom"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static United Kingdom"

DEP_CPP_USEDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\include\audioapi.h"\
	"..\..\dapi\src\include\audiodef.h"\
	"..\..\dapi\src\include\cmd.h"\
	"..\..\dapi\src\include\kernel.h"\
	"..\..\dapi\src\include\pipe.h"\
	"..\..\dapi\src\include\port.h"\
	"..\..\dapi\src\nt\opatype.h"\
	"..\..\dapi\src\nt\opmmsys.h"\
	"..\..\dapi\src\NT\opthread.h"\
	"..\..\dapi\src\nt\playaud.h"\
	"..\..\dapi\src\nt\playaudd.h"\
	"..\..\dectalkf.h"\
	
NODEP_CPP_USEDI=\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\speech.h"\
	"..\..\dapi\src\include\kernp.h"\
	"..\..\dapi\src\include\libp.h"\
	"..\..\dapi\src\nt\dtmmedefs.h"\
	".\ys\stat.h"\
	".\ys\types.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\windic.c

!IF  "$(CFG)" == "windic - Win32 Release"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static"

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Spanish"

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static German"

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Latin American"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Spanish"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static German"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Latin American"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Spanish"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static German"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Latin American"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Spanish"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static German"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Latin American"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static United Kingdom"

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static United Kingdom"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static United Kingdom"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static United Kingdom"

DEP_CPP_WINDI=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\windic.h"\
	
NODEP_CPP_WINDI=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ENDIF 

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
