# Microsoft Developer Studio Project File - Name="say" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=say - Win32 Debug Static French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "say.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "say.mak" CFG="say - Win32 Debug Static French"
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
!MESSAGE "say - Win32 Release United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug United Kingdom" (based on "Win32 (x86) Console Application")
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
!MESSAGE "say - Win32 Release French" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug French" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Static French" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static French" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

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
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

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
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

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
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /YX /FD /c
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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "LATIN_AMERICAN" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD BASE RSC /l 0x40a /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\la\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Win32_Release_French"
# PROP BASE Intermediate_Dir "say___Win32_Release_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\fr\release"
# PROP Intermediate_Dir ".\build\fr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "FRENCH" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\fr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___Win32_Debug_French"
# PROP BASE Intermediate_Dir "say___Win32_Debug_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\fr\debug"
# PROP Intermediate_Dir ".\build\fr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "FRENCH" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\fr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Release Static French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "say___Win32_Release_Static_French"
# PROP BASE Intermediate_Dir "say___Win32_Release_Static_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\fr\static"
# PROP Intermediate_Dir ".\build\fr\static\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "FRENCH" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstaticS\us\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\fr\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "say___Win32_Debug_Static_French"
# PROP BASE Intermediate_Dir "say___Win32_Debug_Static_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\fr\Dstatic"
# PROP Intermediate_Dir ".\build\fr\Dstatic\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "FRENCH" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstaticS\us\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dtstaticS\fr\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

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
# Name "say - Win32 Release United Kingdom"
# Name "say - Win32 Debug United Kingdom"
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
# Name "say - Win32 Release French"
# Name "say - Win32 Debug French"
# Name "say - Win32 Release Static French"
# Name "say - Win32 Debug Static French"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\say.c
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
