# Microsoft Developer Studio Project File - Name="ttssrv" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101
# TARGTYPE "Win32 (ALPHA) Application" 0x0601

CFG=ttssrv - Win32 ALPHA Debug United Kingdom
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "ttssrv.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ttssrv.mak" CFG="ttssrv - Win32 ALPHA Debug United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ttssrv - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Release Spanish" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Release German" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Release Latin American" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Debug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Debug German" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Debug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Release United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Debug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "ttssrv - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "build\us\Release"
# PROP Intermediate_Dir "build\us\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
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
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "build\us\Debug"
# PROP Intermediate_Dir "build\us\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MT /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
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
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttssrv__"
# PROP BASE Intermediate_Dir "ttssrv__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "build\sp\Release"
# PROP Intermediate_Dir "build\sp\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttssrv_0"
# PROP BASE Intermediate_Dir "ttssrv_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "build\gr\Release"
# PROP Intermediate_Dir "build\gr\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttssrv_1"
# PROP BASE Intermediate_Dir "ttssrv_1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "build\la\Release"
# PROP Intermediate_Dir "build\la\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\sapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttssrv_2"
# PROP BASE Intermediate_Dir "ttssrv_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "build\sp\Debug"
# PROP Intermediate_Dir "build\sp\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttssrv_3"
# PROP BASE Intermediate_Dir "ttssrv_3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "build\gr\Debug"
# PROP Intermediate_Dir "build\gr\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttssrv_4"
# PROP BASE Intermediate_Dir "ttssrv_4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "build\la\Debug"
# PROP Intermediate_Dir "build\la\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttssrv__"
# PROP BASE Intermediate_Dir "ttssrv__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "build\uk\Release"
# PROP Intermediate_Dir "build\uk\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttssrv_0"
# PROP BASE Intermediate_Dir "ttssrv_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "build\uk\Debug"
# PROP Intermediate_Dir "build\uk\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttssrv__"
# PROP BASE Intermediate_Dir "ttssrv__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "alpha\us\Release"
# PROP Intermediate_Dir "alpha\us\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
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
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttssrv_0"
# PROP BASE Intermediate_Dir "ttssrv_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "alpha\sp\Release"
# PROP Intermediate_Dir "alpha\sp\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttssrv_1"
# PROP BASE Intermediate_Dir "ttssrv_1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "alpha\gr\Release"
# PROP Intermediate_Dir "alpha\gr\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttssrv_2"
# PROP BASE Intermediate_Dir "ttssrv_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "alpha\la\Release"
# PROP Intermediate_Dir "alpha\la\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttssrv_3"
# PROP BASE Intermediate_Dir "ttssrv_3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "alpha\us\debug"
# PROP Intermediate_Dir "alpha\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /YX /FD /c
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
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept
# ADD LINK32 ..\..\dapi\alpha\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttssrv_4"
# PROP BASE Intermediate_Dir "ttssrv_4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "alpha\sp\debug"
# PROP Intermediate_Dir "alpha\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept
# ADD LINK32 ..\..\dapi\alpha\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttssrv_5"
# PROP BASE Intermediate_Dir "ttssrv_5"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "alpha\gr\debug"
# PROP Intermediate_Dir "alpha\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept
# ADD LINK32 ..\..\dapi\alpha\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttssrv_6"
# PROP BASE Intermediate_Dir "ttssrv_6"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "alpha\la\debug"
# PROP Intermediate_Dir "alpha\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x40a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept
# ADD LINK32 ..\..\dapi\alpha\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ttssrv_7"
# PROP BASE Intermediate_Dir "ttssrv_7"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "alpha\uk\release"
# PROP Intermediate_Dir "alpha\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_UK" /YX /FD /c
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
# ADD BASE LINK32 ..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 ..\..\dapi\alpha\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:ALPHA

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ttssrv_8"
# PROP BASE Intermediate_Dir "ttssrv_8"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "alpha\uk\debug"
# PROP Intermediate_Dir "alpha\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MT /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_UK" /YX /FD /c
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
# ADD BASE LINK32 ..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept
# ADD LINK32 ..\..\dapi\alpha\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /debug /machine:ALPHA /pdbtype:sept

!ENDIF 

# Begin Target

# Name "ttssrv - Win32 Release"
# Name "ttssrv - Win32 Debug"
# Name "ttssrv - Win32 Release Spanish"
# Name "ttssrv - Win32 Release German"
# Name "ttssrv - Win32 Release Latin American"
# Name "ttssrv - Win32 Debug Spanish"
# Name "ttssrv - Win32 Debug German"
# Name "ttssrv - Win32 Debug Latin American"
# Name "ttssrv - Win32 Release United Kingdom"
# Name "ttssrv - Win32 Debug United Kingdom"
# Name "ttssrv - Win32 ALPHA Release"
# Name "ttssrv - Win32 ALPHA Release Spanish"
# Name "ttssrv - Win32 ALPHA Release German"
# Name "ttssrv - Win32 ALPHA Release Latin American"
# Name "ttssrv - Win32 ALPHA Debug"
# Name "ttssrv - Win32 ALPHA Debug Spanish"
# Name "ttssrv - Win32 ALPHA Debug German"
# Name "ttssrv - Win32 ALPHA Debug Latin American"
# Name "ttssrv - Win32 ALPHA Release United Kingdom"
# Name "ttssrv - Win32 ALPHA Debug United Kingdom"
# Begin Source File

SOURCE=.\ttssrv.c

!IF  "$(CFG)" == "ttssrv - Win32 Release"

# ADD CPP /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug"

# ADD CPP /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release Spanish"

# ADD CPP /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release German"

# ADD CPP /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release Latin American"

# ADD CPP /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug Spanish"

# ADD CPP /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug German"

# ADD CPP /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug Latin American"

# ADD CPP /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release United Kingdom"

# ADD CPP /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug United Kingdom"

# ADD CPP /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release"

DEP_CPP_TTSSR=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\ttssrv.h"\
	
NODEP_CPP_TTSSR=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT BASE CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"
# ADD CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release Spanish"

DEP_CPP_TTSSR=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\ttssrv.h"\
	
NODEP_CPP_TTSSR=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT BASE CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"
# ADD CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release German"

DEP_CPP_TTSSR=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\ttssrv.h"\
	
NODEP_CPP_TTSSR=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT BASE CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"
# ADD CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release Latin American"

DEP_CPP_TTSSR=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\ttssrv.h"\
	
NODEP_CPP_TTSSR=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT BASE CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"
# ADD CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug"

DEP_CPP_TTSSR=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\ttssrv.h"\
	
NODEP_CPP_TTSSR=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT BASE CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"
# ADD CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug Spanish"

DEP_CPP_TTSSR=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\ttssrv.h"\
	
NODEP_CPP_TTSSR=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT BASE CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"
# ADD CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug German"

DEP_CPP_TTSSR=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\ttssrv.h"\
	
NODEP_CPP_TTSSR=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT BASE CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"
# ADD CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug Latin American"

DEP_CPP_TTSSR=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\ttssrv.h"\
	
NODEP_CPP_TTSSR=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT BASE CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"
# ADD CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release United Kingdom"

DEP_CPP_TTSSR=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\ttssrv.h"\
	
NODEP_CPP_TTSSR=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT BASE CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"
# ADD CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug United Kingdom"

DEP_CPP_TTSSR=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	".\ttssrv.h"\
	
NODEP_CPP_TTSSR=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	
# ADD BASE CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT BASE CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"
# ADD CPP /Gt0 /D "OLEDECTALK" /D "BLD_DECTALK_DLL"
# SUBTRACT CPP /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\ttssrv.rc
# End Source File
# End Target
# End Project
