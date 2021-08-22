# Microsoft Developer Studio Project File - Name="Dtsample" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=Dtsample - Win32 Debug Access32 Static French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Dtsample.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Dtsample.mak" CFG="Dtsample - Win32 Debug Access32 Static French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Dtsample - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static German" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static German" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static French" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static French" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Dtsample - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "build\ml\release"
# PROP Intermediate_Dir "build\ml\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# SUBTRACT CPP /Fr
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

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "build\ml\debug"
# PROP Intermediate_Dir "build\ml\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /FR /YX /FD /c
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

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Dtsample"
# PROP BASE Intermediate_Dir "Dtsample"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\us\a32stat"
# PROP Intermediate_Dir ".\build\us\a32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\access32\link/dtaccess.res" /d "NDEBUG"
# ADD RSC /l 0x409 /fo"build\us\a32stat\link/dtaccess.res" /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\us\access32/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\us\access32/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /machine:I386 /out:".\build\us\access32/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\us\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:".\build\us\a32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Dtsampl0"
# PROP BASE Intermediate_Dir "Dtsampl0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\sp\a32stat"
# PROP Intermediate_Dir ".\build\sp\a32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /fo".\build\sp\access32\link/dtaccess.res" /d "NDEBUG"
# ADD RSC /l 0x40a /fo".\build\sp\a32stat\link/dtaccess.res" /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\sp\access32/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\sp\access32/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\sp\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /machine:I386 /out:".\build\sp\access32/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\sp\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:".\build\sp\a32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Dtsampl1"
# PROP BASE Intermediate_Dir "Dtsampl1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\gr\a32stat"
# PROP Intermediate_Dir ".\build\gr\a32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /fo".\build\gr\access32\link/dtaccess.res" /d "NDEBUG"
# ADD RSC /l 0x407 /fo".\build\gr\a32stat\link/dtaccess.res" /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\gr\access32/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\gr\access32/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\gr\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /machine:I386 /out:".\build\gr\access32/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\gr\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:".\build\gr\a32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Dtsampl2"
# PROP BASE Intermediate_Dir "Dtsampl2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\la\a32stat"
# PROP Intermediate_Dir ".\build\la\a32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "SPANISH" /D "LATIN_AMERICAN" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /fo".\build\la\access32\link/dtaccess.res" /d "NDEBUG"
# ADD RSC /l 0x40a /fo".\build\la\a32stat\link/dtaccess.res" /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\la\access32/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\la\access32/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\la\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /machine:I386 /out:".\build\la\access32/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\la\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:".\build\la\a32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Dtsampl3"
# PROP BASE Intermediate_Dir "Dtsampl3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\da32stat"
# PROP Intermediate_Dir ".\build\us\da32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\a32debug\link/dtaccess.res" /d "_DEBUG"
# ADD RSC /l 0x409 /fo".\build\us\da32stat\link/dtaccess.res" /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\us\a32debug/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\us\a32debug/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\us\a32debug/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\us\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\us\da32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Dtsampl4"
# PROP BASE Intermediate_Dir "Dtsampl4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\sp\da32stat"
# PROP Intermediate_Dir ".\build\sp\da32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /fo".\build\sp\a32debug\link/dtaccess.res" /d "_DEBUG"
# ADD RSC /l 0x40a /fo".\build\sp\da32stat\link/dtaccess.res" /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\sp\a32debug/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\sp\a32debug/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\sp\a32debug/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\sp\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\sp\da32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Dtsampl5"
# PROP BASE Intermediate_Dir "Dtsampl5"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\gr\da32stat"
# PROP Intermediate_Dir ".\build\gr\da32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /fo".\build\gr\a32debug\link/dtaccess.res" /d "_DEBUG"
# ADD RSC /l 0x407 /fo".\build\gr\da32stat\link/dtaccess.res" /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\gr\a32debug/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\gr\a32debug/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\gr\a32debug/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\gr\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\gr\da32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Dtsampl6"
# PROP BASE Intermediate_Dir "Dtsampl6"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\la\da32stat"
# PROP Intermediate_Dir ".\build\la\da32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "SPANISH" /D "LATIN_AMERICAN" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40a /fo".\build\la\a32debug\link/dtaccess.res" /d "_DEBUG"
# ADD RSC /l 0x40a /fo".\build\la\da32stat\link/dtaccess.res" /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\la\a32debug/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\la\a32debug/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\la\a32debug/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\la\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\la\da32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Dtsampl3"
# PROP BASE Intermediate_Dir "Dtsampl3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\uk\a32stat"
# PROP Intermediate_Dir ".\build\uk\a32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\access32\link/dtaccess.res" /d "NDEBUG"
# ADD RSC /l 0x809 /fo".\build\uk\a32stat\link/dtaccess.res" /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\us\access32/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\uk\access32/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /machine:I386 /out:".\build\us\a32stat/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\uk\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:".\build\uk\a32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Dtsampl4"
# PROP BASE Intermediate_Dir "Dtsampl4"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\us\da32stat"
# PROP Intermediate_Dir ".\build\uk\da32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\a32debug\link/dtaccess.res" /d "_DEBUG"
# ADD RSC /l 0x809 /fo".\build\uk\da32stat\link/dtaccess.res" /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\us\a32debug/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\uk\a32debug/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\us\da32stat/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\uk\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\uk\da32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Dtsample___Win32_Release_Access32_Static_French"
# PROP BASE Intermediate_Dir "Dtsample___Win32_Release_Access32_Static_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\fr\a32stat"
# PROP Intermediate_Dir ".\build\fr\a32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "ACCESS32" /D "TYPING_MODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo"build\us\a32stat\link/dtaccess.res" /d "NDEBUG"
# ADD RSC /l 0x409 /fo"build\fr\a32stat\link/dtaccess.res" /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\us\access32/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\fr\access32/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /machine:I386 /out:".\build\us\a32stat/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\fr\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:".\build\fr\a32stat/Dtaccess.exe"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Dtsample___Win32_Debug_Access32_Static_French"
# PROP BASE Intermediate_Dir "Dtsample___Win32_Debug_Access32_Static_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\fr\da32stat"
# PROP Intermediate_Dir ".\build\fr\da32stat\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "ACCESS32" /D "TYPING_MODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo".\build\us\da32stat\link/dtaccess.res" /d "_DEBUG"
# ADD RSC /l 0x409 /fo".\build\fr\da32stat\link/dtaccess.res" /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o".\build\us\a32debug/Dtaccess.bsc"
# ADD BSC32 /nologo /o".\build\fr\a32debug/Dtaccess.bsc"
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dtstatic\us\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\us\da32stat/Dtaccess.exe"
# ADD LINK32 ..\..\dapi\build\dtstatic\fr\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /debug /machine:I386 /out:".\build\fr\da32stat/Dtaccess.exe"

!ENDIF 

# Begin Target

# Name "Dtsample - Win32 Release"
# Name "Dtsample - Win32 Debug"
# Name "Dtsample - Win32 Release Access32 Static"
# Name "Dtsample - Win32 Release Access32 Static Spanish"
# Name "Dtsample - Win32 Release Access32 Static German"
# Name "Dtsample - Win32 Release Access32 Static Latin American"
# Name "Dtsample - Win32 Debug Access32 Static"
# Name "Dtsample - Win32 Debug Access32 Static Spanish"
# Name "Dtsample - Win32 Debug Access32 Static German"
# Name "Dtsample - Win32 Debug Access32 Static Latin American"
# Name "Dtsample - Win32 Release Access32 Static United Kingdom"
# Name "Dtsample - Win32 Debug Access32 Static United Kingdom"
# Name "Dtsample - Win32 Release Access32 Static French"
# Name "Dtsample - Win32 Debug Access32 Static French"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\dtsample.c
# End Source File
# Begin Source File

SOURCE=.\dtsample.rc
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\dtsample.h
# End Source File
# Begin Source File

SOURCE=..\..\dapi\src\api\ttsapi.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\dtsample.ico
# End Source File
# End Group
# End Target
# End Project
