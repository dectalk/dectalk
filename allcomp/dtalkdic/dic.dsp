# Microsoft Developer Studio Project File - Name="dic" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103
# TARGTYPE "Win32 (ALPHA) Console Application" 0x0603

CFG=dic - Win32 British Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "dic.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dic.mak" CFG="dic - Win32 British Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dic - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release Spanish" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release German" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug Spanish" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug German" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug Latin American" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release Latin American" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 ALPHA Release" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Release Spanish" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Release German" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Release Latin American" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug Spanish" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug German" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug Latin American" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 Profile" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 British Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 British Debug" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "dic - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\us\release\"
# PROP Intermediate_Dir ".\build\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH" /D "ENGLISH_US" /D "WINDIC" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\debug\"
# PROP Intermediate_Dir ".\build\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH" /D "ENGLISH_US" /D "WINDIC" /FR /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\dic___Wi"
# PROP BASE Intermediate_Dir ".\dic___Wi"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\sp\release\"
# PROP Intermediate_Dir ".\build\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\include" /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\dic___W0"
# PROP BASE Intermediate_Dir ".\dic___W0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\gr\release\"
# PROP Intermediate_Dir ".\build\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\include" /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /D "WINDIC" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\dic___W1"
# PROP BASE Intermediate_Dir ".\dic___W1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\sp\debug\"
# PROP Intermediate_Dir ".\build\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\include" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\dic___W2"
# PROP BASE Intermediate_Dir ".\dic___W2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\gr\debug\"
# PROP Intermediate_Dir ".\build\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\include" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /D "WINDIC" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\dic___Wi"
# PROP BASE Intermediate_Dir ".\dic___Wi"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\la\debug"
# PROP Intermediate_Dir ".\build\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\include" /I "dic" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /D "LATIN_AMERICAN" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\dic___W0"
# PROP BASE Intermediate_Dir ".\dic___W0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\la\release\"
# PROP Intermediate_Dir ".\build\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\include" /I "dic" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /D "LATIN_AMERICAN" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dic___Wi"
# PROP BASE Intermediate_Dir "dic___Wi"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtalkdic\us\Release"
# PROP Intermediate_Dir ".\..\alpha\dtalkdic\us\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\include" /I ".\dic" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "WINDIC" /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /O2 /I ".\..\..\dapi\src\include" /I ".\dic" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "WINDIC" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dic___W0"
# PROP BASE Intermediate_Dir "dic___W0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtalkdic\us\debug"
# PROP Intermediate_Dir ".\..\alpha\dtalkdic\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\include" /I ".\dic" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "WINDIC" /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\..\..\dapi\src\include" /I ".\dic" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "WINDIC" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dic___Wi"
# PROP BASE Intermediate_Dir "dic___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtalkdic\sp\Release"
# PROP Intermediate_Dir ".\..\alpha\dtalkdic\sp\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\include" /I ".\dic" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "WINDIC" /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /O2 /I ".\..\..\dapi\src\include" /I ".\dic" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "WINDIC" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dic___W0"
# PROP BASE Intermediate_Dir "dic___W0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtalkdic\gr\Release"
# PROP Intermediate_Dir ".\..\alpha\dtalkdic\gr\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\include" /I ".\dic" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /D "WINDIC" /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /O2 /I ".\..\..\dapi\src\include" /I ".\dic" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /D "WINDIC" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dic___W1"
# PROP BASE Intermediate_Dir "dic___W1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\alpha\dtalkdic\la\Release"
# PROP Intermediate_Dir ".\..\alpha\dtalkdic\la\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I ".\include" /I ".\dic" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /O2 /I ".\..\..\dapi\src\include" /I ".\dic" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "WINDIC" /D "LATIN_AMERICAN" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dic___W2"
# PROP BASE Intermediate_Dir "dic___W2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtalkdic\gr\debug"
# PROP Intermediate_Dir ".\..\alpha\dtalkdic\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\include" /I ".\dic" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "WINDIC" /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\..\..\dapi\src\include" /I ".\dic" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "WINDIC" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dic___W3"
# PROP BASE Intermediate_Dir "dic___W3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtalkdic\gr\debug"
# PROP Intermediate_Dir ".\..\alpha\dtalkdic\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\include" /I ".\dic" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /D "WINDIC" /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\..\..\dapi\src\include" /I ".\dic" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /D "WINDIC" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dic___W4"
# PROP BASE Intermediate_Dir "dic___W4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\alpha\dtalkdic\la\debug"
# PROP Intermediate_Dir ".\..\alpha\dtalkdic\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\include" /I ".\dic" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I ".\..\..\dapi\src\include" /I ".\dic" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "LATIN_AMERICAN" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "dic - Win32 Profile"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dic___Wi"
# PROP BASE Intermediate_Dir "dic___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\prof"
# PROP Intermediate_Dir ".\prof\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "\work\ad\dapi\src\include" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /FR /YX /FD /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /O2 /I "\work\ad\dapi\src\include" /D "_NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /FR /YX /FD /c
# SUBTRACT CPP /u
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /profile /map /debug /machine:I386
# SUBTRACT LINK32 /nodefaultlib

!ELSEIF  "$(CFG)" == "dic - Win32 British Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dic___Wi"
# PROP BASE Intermediate_Dir "dic___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\uk\release\"
# PROP Intermediate_Dir ".\build\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\ad\dapi\src\include" /I ".\dic" /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH" /D "ENGLISH_UK" /D "WINDIC" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 British Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dic___W0"
# PROP BASE Intermediate_Dir "dic___W0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\uk\debug\"
# PROP Intermediate_Dir ".\build\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "\work\ad\dapi\src\include" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /FR /YX /FD /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH" /D "ENGLISH_UK" /D "WINDIC" /FR /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ENDIF 

# Begin Target

# Name "dic - Win32 Release"
# Name "dic - Win32 Debug"
# Name "dic - Win32 Release Spanish"
# Name "dic - Win32 Release German"
# Name "dic - Win32 Debug Spanish"
# Name "dic - Win32 Debug German"
# Name "dic - Win32 Debug Latin American"
# Name "dic - Win32 Release Latin American"
# Name "dic - Win32 ALPHA Release"
# Name "dic - Win32 ALPHA Debug"
# Name "dic - Win32 ALPHA Release Spanish"
# Name "dic - Win32 ALPHA Release German"
# Name "dic - Win32 ALPHA Release Latin American"
# Name "dic - Win32 ALPHA Debug Spanish"
# Name "dic - Win32 ALPHA Debug German"
# Name "dic - Win32 ALPHA Debug Latin American"
# Name "dic - Win32 Profile"
# Name "dic - Win32 British Release"
# Name "dic - Win32 British Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\dic.c

!IF  "$(CFG)" == "dic - Win32 Release"

!ELSEIF  "$(CFG)" == "dic - Win32 Debug"

!ELSEIF  "$(CFG)" == "dic - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "dic - Win32 Release German"

!ELSEIF  "$(CFG)" == "dic - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "dic - Win32 Debug German"

!ELSEIF  "$(CFG)" == "dic - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "dic - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	
NODEP_CPP_DIC_C=\
	".\ascky_gr.tab"\
	".\ascky_sp.tab"\
	".\ascky_us.tab"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	
NODEP_CPP_DIC_C=\
	".\ascky_gr.tab"\
	".\ascky_sp.tab"\
	".\ascky_us.tab"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Spanish"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	
NODEP_CPP_DIC_C=\
	".\ascky_gr.tab"\
	".\ascky_sp.tab"\
	".\ascky_us.tab"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release German"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	
NODEP_CPP_DIC_C=\
	".\ascky_gr.tab"\
	".\ascky_sp.tab"\
	".\ascky_us.tab"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Latin American"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	
NODEP_CPP_DIC_C=\
	".\ascky_gr.tab"\
	".\ascky_sp.tab"\
	".\ascky_us.tab"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Spanish"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	
NODEP_CPP_DIC_C=\
	".\ascky_gr.tab"\
	".\ascky_sp.tab"\
	".\ascky_us.tab"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug German"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	
NODEP_CPP_DIC_C=\
	".\ascky_gr.tab"\
	".\ascky_sp.tab"\
	".\ascky_us.tab"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Latin American"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	
NODEP_CPP_DIC_C=\
	".\ascky_gr.tab"\
	".\ascky_sp.tab"\
	".\ascky_us.tab"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "dic - Win32 Profile"

!ELSEIF  "$(CFG)" == "dic - Win32 British Release"

!ELSEIF  "$(CFG)" == "dic - Win32 British Debug"

!ENDIF 

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\DIC.H
# End Source File
# Begin Source File

SOURCE=.\l_com_ph.h
# End Source File
# Begin Source File

SOURCE=.\l_gr_ph.h
# End Source File
# Begin Source File

SOURCE=.\l_sp_ph.h
# End Source File
# Begin Source File

SOURCE=.\l_uk_ph.h
# End Source File
# Begin Source File

SOURCE=.\l_us_ph.h
# End Source File
# Begin Source File

SOURCE=.\ls_upper.tab
# End Source File
# Begin Source File

SOURCE=.\port.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
