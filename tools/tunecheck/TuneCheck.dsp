# Microsoft Developer Studio Project File - Name="TuneCheck" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=TuneCheck - Win32 Debug Italian
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "TuneCheck.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "TuneCheck.mak" CFG="TuneCheck - Win32 Debug Italian"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "TuneCheck - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release German" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug German" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug French" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release French" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug Italian" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release Italian" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "TuneCheck - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\..\dapi\build\dectalk\us\release\"
# PROP Intermediate_Dir ".\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\..\dapi\build\dectalk\us\debug\"
# PROP Intermediate_Dir ".\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /I ".\..\..\dapi\src\vtm" /D "_DEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "TuneCheck___Win32_Release_German"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Release_German"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\..\dapi\build\dectalk\gr\release\"
# PROP Intermediate_Dir ".\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ADVTM" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# SUBTRACT CPP /Fr
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "TuneCheck___Win32_Release_Spanish"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Release_Spanish"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\..\dapi\build\dectalk\sp\release\"
# PROP Intermediate_Dir ".\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ADVTM" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "TuneCheck___Win32_Release_Latin_American"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Release_Latin_American"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\..\dapi\build\dectalk\la\release\"
# PROP Intermediate_Dir ".\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ADVTM" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "SPANISH_LA" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "TuneCheck___Win32_Release_United_Kingdom"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Release_United_Kingdom"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\..\dapi\build\dectalk\uk\release\"
# PROP Intermediate_Dir ".\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "TuneCheck___Win32_Debug_German"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Debug_German"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\..\dapi\build\dectalk\gr\debug\"
# PROP Intermediate_Dir ".\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "TuneCheck___Win32_Debug_Spanish"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Debug_Spanish"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\..\dapi\build\dectalk\sp\debug\"
# PROP Intermediate_Dir ".\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "TuneCheck___Win32_Debug_Latin_American"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Debug_Latin_American"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\..\dapi\build\dectalk\la\debug\"
# PROP Intermediate_Dir ".\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "SPANISH_LA" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "TuneCheck___Win32_Debug_United_Kingdom"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Debug_United_Kingdom"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\..\dapi\build\dectalk\uk\debug\"
# PROP Intermediate_Dir ".\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "TuneCheck___Win32_Debug_French"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Debug_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\..\dapi\build\dectalk\fr\debug\"
# PROP Intermediate_Dir ".\fr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\..\..\dapi\src\api" /I ".\..\.." /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\fr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "TuneCheck___Win32_Release_French"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Release_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\..\dapi\build\dectalk\fr\release\"
# PROP Intermediate_Dir ".\fr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\..\..\dapi\src\api" /I ".\..\.." /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\fr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug Italian"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "TuneCheck___Win32_Debug_Italian"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Debug_Italian"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\..\dapi\build\dectalk\it\debug\"
# PROP Intermediate_Dir ".\it\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /I ".\..\..\dapi\src\vtm" /D "_DEBUG" /D "ITALIAN" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release Italian"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "TuneCheck___Win32_Release_Italian"
# PROP BASE Intermediate_Dir "TuneCheck___Win32_Release_Italian"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\..\dapi\build\dectalk\it\release\"
# PROP Intermediate_Dir ".\it\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "ITALIAN" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /machine:I386

!ENDIF 

# Begin Target

# Name "TuneCheck - Win32 Release"
# Name "TuneCheck - Win32 Debug"
# Name "TuneCheck - Win32 Release German"
# Name "TuneCheck - Win32 Release Spanish"
# Name "TuneCheck - Win32 Release Latin American"
# Name "TuneCheck - Win32 Release United Kingdom"
# Name "TuneCheck - Win32 Debug German"
# Name "TuneCheck - Win32 Debug Spanish"
# Name "TuneCheck - Win32 Debug Latin American"
# Name "TuneCheck - Win32 Debug United Kingdom"
# Name "TuneCheck - Win32 Debug French"
# Name "TuneCheck - Win32 Release French"
# Name "TuneCheck - Win32 Debug Italian"
# Name "TuneCheck - Win32 Release Italian"
# Begin Source File

SOURCE=..\..\dapi\src\NT\opthread.c
# End Source File
# Begin Source File

SOURCE=.\Tunecheck.c
# End Source File
# End Target
# End Project
