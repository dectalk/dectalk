# Microsoft Developer Studio Project File - Name="speak" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=speak - Win32 Debug French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "speak.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "speak.mak" CFG="speak - Win32 Debug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "speak - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Release Spanish" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Release German" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug German" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Release Latin American" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Release United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug NWS_US" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug NWS_LA" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug French" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Release French" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "speak - Win32 Release"

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
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none /incremental:yes /nodefaultlib

!ELSEIF  "$(CFG)" == "speak - Win32 Debug"

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
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /FR /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "speak - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\speak___"
# PROP BASE Intermediate_Dir ".\speak___"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\sp\release"
# PROP Intermediate_Dir ".\build\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG" /d "SPANISH" /d "SPANISH_SP"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /incremental:yes /nodefaultlib
# ADD LINK32 ..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /incremental:yes /nodefaultlib

!ELSEIF  "$(CFG)" == "speak - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\speak__0"
# PROP BASE Intermediate_Dir ".\speak__0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\gr\release"
# PROP Intermediate_Dir ".\build\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG" /d "GERMAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /incremental:yes /nodefaultlib
# ADD LINK32 ..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /incremental:yes /nodefaultlib

!ELSEIF  "$(CFG)" == "speak - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\speak___"
# PROP BASE Intermediate_Dir ".\speak___"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\sp\debug"
# PROP Intermediate_Dir ".\build\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /FR /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG" /d "SPANISH" /d "SPANISH_SP"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "speak - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\speak__0"
# PROP BASE Intermediate_Dir ".\speak__0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\gr\debug"
# PROP Intermediate_Dir ".\build\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /FR /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG" /d "GERMAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "speak - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\speak___"
# PROP BASE Intermediate_Dir ".\speak___"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\la\debug"
# PROP Intermediate_Dir ".\build\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /FR /YX /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /FR /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /d "_DEBUG" /d "SPANISH"
# ADD RSC /l 0x40a /d "_DEBUG" /d "SPANISH" /d "SPANISH_LA"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "speak - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\speak__0"
# PROP BASE Intermediate_Dir ".\speak__0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\la\release"
# PROP Intermediate_Dir ".\build\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /d "NDEBUG" /d "SPANISH"
# ADD RSC /l 0x40a /d "NDEBUG" /d "SPANISH" /d "SPANISH_LA"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\src\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /incremental:yes /nodefaultlib
# ADD LINK32 ..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /incremental:yes /nodefaultlib

!ELSEIF  "$(CFG)" == "speak - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "speak___"
# PROP BASE Intermediate_Dir "speak___"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\uk\release"
# PROP Intermediate_Dir ".\build\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH"
# ADD RSC /l 0x809 /d "NDEBUG" /d "ML" /d "ENGLISH_UK" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none /incremental:yes /nodefaultlib
# ADD LINK32 ..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none /incremental:yes /nodefaultlib

!ELSEIF  "$(CFG)" == "speak - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "speak__0"
# PROP BASE Intermediate_Dir "speak__0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\uk\debug"
# PROP Intermediate_Dir ".\build\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /FR".\build\us\debug\link/" /Fp".\build\us\debug\link/speak.pch" /YX /Fo".\build\us\debug\link/" /Fd".\build\us\debug\link/" /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /FR".\build\us\debug\link/" /Fp".\build\us\debug\link/speak.pch" /YX /Fo".\build\us\debug\link/" /Fd".\build\us\debug\link/" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\debug\link/SPEAK.res" /d "_DEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH"
# ADD RSC /l 0x809 /d "_DEBUG" /d "ML" /d "ENGLISH_UK" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\us\debug/speak.bsc"
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:".\build\us\debug/speak.pdb" /debug /debugtype:both /machine:I386 /out:".\build\us\debug/speak.exe"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:".\build\us\debug/speak.pdb" /debug /debugtype:both /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "speak - Win32 Debug NWS_US"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "speak___"
# PROP BASE Intermediate_Dir "speak___"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\nws_us\debug"
# PROP Intermediate_Dir ".\build\nws_us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /FR /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /D "NWSNOAA" /FR /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH"
# ADD RSC /l 0x409 /d "_DEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dectalk\nws_us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "speak - Win32 Debug NWS_LA"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "speak___"
# PROP BASE Intermediate_Dir "speak___"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\nws_la\debug"
# PROP Intermediate_Dir ".\build\nws_la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "LATIN_AMERICAN" /FR /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /D "NWSNOAA" /FR /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /d "_DEBUG" /d "SPANISH" /d "LATIN_AMERICAN"
# ADD RSC /l 0x40a /d "_DEBUG" /d "SPANISH" /d "LATIN_AMERICAN"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dectalk\nws_la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "speak - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "speak___Win32_Debug_French"
# PROP BASE Intermediate_Dir "speak___Win32_Debug_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\fr\debug"
# PROP Intermediate_Dir ".\build\fr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /ZI /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /FR /YX /FD /c
# ADD CPP /nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "FRENCH" /FR /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH"
# ADD RSC /l 0x40c /d "_DEBUG" /d "ML" /d "FRENCH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 ..\..\dapi\build\dectalk\fr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /debug /debugtype:both /machine:I386
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "speak - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "speak___Win32_Release_French"
# PROP BASE Intermediate_Dir "speak___Win32_Release_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\fr\release"
# PROP Intermediate_Dir ".\build\fr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Ox /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Ox /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "FRENCH" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH"
# ADD RSC /l 0x40c /d "NDEBUG" /d "ML" /d "FRENCH"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none /incremental:yes /nodefaultlib
# ADD LINK32 ..\..\dapi\build\dectalk\fr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none /incremental:yes /nodefaultlib

!ENDIF 

# Begin Target

# Name "speak - Win32 Release"
# Name "speak - Win32 Debug"
# Name "speak - Win32 Release Spanish"
# Name "speak - Win32 Release German"
# Name "speak - Win32 Debug Spanish"
# Name "speak - Win32 Debug German"
# Name "speak - Win32 Debug Latin American"
# Name "speak - Win32 Release Latin American"
# Name "speak - Win32 Release United Kingdom"
# Name "speak - Win32 Debug United Kingdom"
# Name "speak - Win32 Debug NWS_US"
# Name "speak - Win32 Debug NWS_LA"
# Name "speak - Win32 Debug French"
# Name "speak - Win32 Release French"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\SPEAK.C
# End Source File
# Begin Source File

SOURCE=.\SPEAK.DEF
# End Source File
# Begin Source File

SOURCE=.\SPEAK.RC
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\Afxres.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=.\Speak.h
# End Source File
# Begin Source File

SOURCE=.\Winres.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\beautifu.bmp
# End Source File
# Begin Source File

SOURCE=.\bet203a.bmp
# End Source File
# Begin Source File

SOURCE=.\bet203b.bmp
# End Source File
# Begin Source File

SOURCE=.\den203a.bmp
# End Source File
# Begin Source File

SOURCE=.\den203b.bmp
# End Source File
# Begin Source File

SOURCE=.\digital.bmp
# End Source File
# Begin Source File

SOURCE=.\doctorde.bmp
# End Source File
# Begin Source File

SOURCE=.\fra203a.bmp
# End Source File
# Begin Source File

SOURCE=.\fra203b.bmp
# End Source File
# Begin Source File

SOURCE=.\frailfra.bmp
# End Source File
# Begin Source File

SOURCE=.\har203a.bmp
# End Source File
# Begin Source File

SOURCE=.\har203b.bmp
# End Source File
# Begin Source File

SOURCE=.\hugeharr.bmp
# End Source File
# Begin Source File

SOURCE=.\kid203a.bmp
# End Source File
# Begin Source File

SOURCE=.\kid203b.bmp
# End Source File
# Begin Source File

SOURCE=.\kittheki.bmp
# End Source File
# Begin Source File

SOURCE=.\pau203a.bmp
# End Source File
# Begin Source File

SOURCE=.\pau203b.bmp
# End Source File
# Begin Source File

SOURCE=.\pause.bmp
# End Source File
# Begin Source File

SOURCE=.\perfectp.bmp
# End Source File
# Begin Source File

SOURCE=.\play.bmp
# End Source File
# Begin Source File

SOURCE=.\reload.bmp
# End Source File
# Begin Source File

SOURCE=.\rit203a.bmp
# End Source File
# Begin Source File

SOURCE=.\rit203b.bmp
# End Source File
# Begin Source File

SOURCE=.\roughrit.bmp
# End Source File
# Begin Source File

SOURCE=.\s_beauti.bmp
# End Source File
# Begin Source File

SOURCE=.\s_doctor.bmp
# End Source File
# Begin Source File

SOURCE=.\s_frailf.bmp
# End Source File
# Begin Source File

SOURCE=.\s_hugeha.bmp
# End Source File
# Begin Source File

SOURCE=.\s_kitthe.bmp
# End Source File
# Begin Source File

SOURCE=.\s_pause.bmp
# End Source File
# Begin Source File

SOURCE=.\s_perfec.bmp
# End Source File
# Begin Source File

SOURCE=.\s_play.bmp
# End Source File
# Begin Source File

SOURCE=.\s_reload.bmp
# End Source File
# Begin Source File

SOURCE=.\s_roughr.bmp
# End Source File
# Begin Source File

SOURCE=.\s_stop.bmp
# End Source File
# Begin Source File

SOURCE=.\s_upityu.bmp
# End Source File
# Begin Source File

SOURCE=.\s_wisper.bmp
# End Source File
# Begin Source File

SOURCE=.\speak.ico
# End Source File
# Begin Source File

SOURCE=.\stop.bmp
# End Source File
# Begin Source File

SOURCE=.\Team03.bmp
# End Source File
# Begin Source File

SOURCE=.\upityurs.bmp
# End Source File
# Begin Source File

SOURCE=.\urs203a.bmp
# End Source File
# Begin Source File

SOURCE=.\urs203b.bmp
# End Source File
# Begin Source File

SOURCE=.\wen203a.bmp
# End Source File
# Begin Source File

SOURCE=.\wen203b.bmp
# End Source File
# Begin Source File

SOURCE=.\wisperin.bmp
# End Source File
# End Group
# Begin Source File

SOURCE=.\speak.pal
# End Source File
# Begin Source File

SOURCE=.\team03.PAL
# End Source File
# End Target
# End Project
