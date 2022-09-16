# Microsoft Developer Studio Project File - Name="say" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103
# TARGTYPE "Win32 (ALPHA) Console Application" 0x0603

CFG=say - Win32 Debug Static Latin American
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "say.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "say.mak" CFG="say - Win32 Debug Static Latin American"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "say - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release German" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug German" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 ALPHA Release" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 Release United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 Release Static" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Static Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Static United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Static German" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Static Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static German" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 ALPHA Release Static" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Static German" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Static Latin American" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Static Spanish" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Static United Kingdom" (based on "Win32 (ALPHA) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "say - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\us\release"
# PROP Intermediate_Dir ".\build\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\debug"
# PROP Intermediate_Dir ".\build\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\say___Wi"
# PROP BASE Intermediate_Dir ".\say___Wi"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\sp\release"
# PROP Intermediate_Dir ".\build\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\Release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\say___W0"
# PROP BASE Intermediate_Dir ".\say___W0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\gr\release"
# PROP Intermediate_Dir ".\build\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\Release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\say___Wi"
# PROP BASE Intermediate_Dir ".\say___Wi"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\la\release"
# PROP Intermediate_Dir ".\build\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\say___W0"
# PROP BASE Intermediate_Dir ".\say___W0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\sp\debug"
# PROP Intermediate_Dir ".\build\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\say___W1"
# PROP BASE Intermediate_Dir ".\say___W1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\gr\debug"
# PROP Intermediate_Dir ".\build\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\say___W2"
# PROP BASE Intermediate_Dir ".\say___W2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\la\debug"
# PROP Intermediate_Dir ".\build\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\us\release"
# PROP Intermediate_Dir ".\alpha\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___W0"
# PROP BASE Intermediate_Dir "say___W0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\us\debug"
# PROP Intermediate_Dir ".\alpha\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /YX /FD /MTd /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\sp\release"
# PROP Intermediate_Dir ".\alpha\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "ALPHA" /D "SPANISH_SP" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___W0"
# PROP BASE Intermediate_Dir "say___W0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\gr\release"
# PROP Intermediate_Dir ".\alpha\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___W1"
# PROP BASE Intermediate_Dir "say___W1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\la\release"
# PROP Intermediate_Dir ".\alpha\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___W2"
# PROP BASE Intermediate_Dir "say___W2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\sp\debug"
# PROP Intermediate_Dir ".\alpha\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "ALPHA" /D "SPANISH_SP" /YX /FD /MTd /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___W3"
# PROP BASE Intermediate_Dir "say___W3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\gr\debug"
# PROP Intermediate_Dir ".\alpha\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /D "ALPHA" /YX /FD /MTd /c
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___W4"
# PROP BASE Intermediate_Dir "say___W4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\la\debug"
# PROP Intermediate_Dir ".\alpha\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /YX /FD /MTd /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\uk\release"
# PROP Intermediate_Dir ".\build\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___W0"
# PROP BASE Intermediate_Dir "say___W0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\uk\debug"
# PROP Intermediate_Dir ".\build\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\uk\release"
# PROP Intermediate_Dir ".\alpha\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___W0"
# PROP BASE Intermediate_Dir "say___W0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\uk\debug"
# PROP Intermediate_Dir ".\alpha\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /D "ALPHA" /YX /FD /MTd /c
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 Release Static"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\us\static"
# PROP Intermediate_Dir ".\build\us\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\us\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Release Static Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\sp\static"
# PROP Intermediate_Dir ".\build\sp\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\sp\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Release Static United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\uk\static"
# PROP Intermediate_Dir ".\build\uk\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\uk\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Release Static German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\gr\static"
# PROP Intermediate_Dir ".\build\gr\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\gr\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Release Static Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\la\static"
# PROP Intermediate_Dir ".\build\la\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\la\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\Dstatic"
# PROP Intermediate_Dir ".\build\us\Dstatic\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\us\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\sp\Dstatic"
# PROP Intermediate_Dir ".\build\sp\Dstatic\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\sp\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\uk\Dstatic"
# PROP Intermediate_Dir ".\build\uk\Dstatic\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\uk\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\gr\Dstatic"
# PROP Intermediate_Dir ".\build\gr\Dstatic\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\gr\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\la\Dstatic"
# PROP Intermediate_Dir ".\build\la\Dstatic\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\la\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Wi"
# PROP BASE Intermediate_Dir "say___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\us\static"
# PROP Intermediate_Dir ".\alpha\us\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstaticS\us\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dtstaticS\us\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___W0"
# PROP BASE Intermediate_Dir "say___W0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\gr\static"
# PROP Intermediate_Dir ".\alpha\gr\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstaticS\gr\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dtstaticS\gr\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___W1"
# PROP BASE Intermediate_Dir "say___W1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\la\static"
# PROP Intermediate_Dir ".\alpha\la\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "SPANISH_LA" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstaticS\la\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dtstaticS\la\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___W2"
# PROP BASE Intermediate_Dir "say___W2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\sp\static"
# PROP Intermediate_Dir ".\alpha\sp\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "ALPHA" /D "SPANISH_SP" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstaticS\sp\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dtstaticS\sp\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___W3"
# PROP BASE Intermediate_Dir "say___W3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\uk\static"
# PROP Intermediate_Dir ".\alpha\uk\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH" /D "ENGLISH_UK" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstaticS\uk\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dtstaticS\uk\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ENDIF 

# Begin Target

# Name "say - Win32 Release"
# Name "say - Win32 Debug"
# Name "say - Win32 Release Spanish"
# Name "say - Win32 Release German"
# Name "say - Win32 Release Latin American"
# Name "say - Win32 Debug Spanish"
# Name "say - Win32 Debug German"
# Name "say - Win32 Debug Latin American"
# Name "say - Win32 ALPHA Release"
# Name "say - Win32 ALPHA Debug"
# Name "say - Win32 ALPHA Release Spanish"
# Name "say - Win32 ALPHA Release German"
# Name "say - Win32 ALPHA Release Latin American"
# Name "say - Win32 ALPHA Debug Spanish"
# Name "say - Win32 ALPHA Debug German"
# Name "say - Win32 ALPHA Debug Latin American"
# Name "say - Win32 Release United Kingdom"
# Name "say - Win32 Debug United Kingdom"
# Name "say - Win32 ALPHA Release United Kingdom"
# Name "say - Win32 ALPHA Debug United Kingdom"
# Name "say - Win32 Release Static"
# Name "say - Win32 Release Static Spanish"
# Name "say - Win32 Release Static United Kingdom"
# Name "say - Win32 Release Static German"
# Name "say - Win32 Release Static Latin American"
# Name "say - Win32 Debug Static"
# Name "say - Win32 Debug Static Spanish"
# Name "say - Win32 Debug Static United Kingdom"
# Name "say - Win32 Debug Static German"
# Name "say - Win32 Debug Static Latin American"
# Name "say - Win32 ALPHA Release Static"
# Name "say - Win32 ALPHA Release Static German"
# Name "say - Win32 ALPHA Release Static Latin American"
# Name "say - Win32 ALPHA Release Static Spanish"
# Name "say - Win32 ALPHA Release Static United Kingdom"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\say.c

!IF  "$(CFG)" == "say - Win32 Release"

!ELSEIF  "$(CFG)" == "say - Win32 Debug"

!ELSEIF  "$(CFG)" == "say - Win32 Release Spanish"

!ELSEIF  "$(CFG)" == "say - Win32 Release German"

!ELSEIF  "$(CFG)" == "say - Win32 Release Latin American"

!ELSEIF  "$(CFG)" == "say - Win32 Debug Spanish"

!ELSEIF  "$(CFG)" == "say - Win32 Debug German"

!ELSEIF  "$(CFG)" == "say - Win32 Debug Latin American"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Spanish"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release German"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Latin American"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug Spanish"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug German"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug Latin American"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 Release United Kingdom"

!ELSEIF  "$(CFG)" == "say - Win32 Debug United Kingdom"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release United Kingdom"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug United Kingdom"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 Release Static"

!ELSEIF  "$(CFG)" == "say - Win32 Release Static Spanish"

!ELSEIF  "$(CFG)" == "say - Win32 Release Static United Kingdom"

!ELSEIF  "$(CFG)" == "say - Win32 Release Static German"

!ELSEIF  "$(CFG)" == "say - Win32 Release Static Latin American"

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static"

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static Spanish"

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static United Kingdom"

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static German"

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static Latin American"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static German"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static Latin American"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static Spanish"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static United Kingdom"

DEP_CPP_SAY_C=\
	"..\..\dapi\src\api\ttsapi.h"\
	
NODEP_CPP_SAY_C=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
