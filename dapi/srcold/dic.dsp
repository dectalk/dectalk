# Microsoft Developer Studio Project File - Name="dic" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=dic - Win32 Debug French
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "dic.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dic.mak" CFG="dic - Win32 Debug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dic - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release German" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug German" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release French" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug French" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath "Desktop"
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "dic - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtalkdic\us\Release"
# PROP Intermediate_Dir ".\..\build\dtalkdic\us\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\nt" /I ".\include" /I ".\dic" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
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
# PROP Output_Dir ".\..\build\dtalkdic\us\debug"
# PROP Intermediate_Dir ".\..\build\dtalkdic\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "_DEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
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
# PROP Output_Dir ".\..\build\dtalkdic\sp\Release"
# PROP Intermediate_Dir ".\..\build\dtalkdic\sp\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\include" /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
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
# PROP Output_Dir ".\..\build\dtalkdic\gr\Release"
# PROP Intermediate_Dir ".\..\build\dtalkdic\gr\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\include" /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "NDEBUG" /D "GERMAN" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
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
# PROP Output_Dir ".\..\build\dtalkdic\sp\debug"
# PROP Intermediate_Dir ".\..\build\dtalkdic\sp\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\include" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
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
# PROP Output_Dir ".\..\build\dtalkdic\gr\debug"
# PROP Intermediate_Dir ".\..\build\dtalkdic\gr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\include" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "_DEBUG" /D "GERMAN" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
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
# PROP Output_Dir ".\..\build\dtalkdic\la\debug"
# PROP Intermediate_Dir ".\..\build\dtalkdic\la\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\include" /I "dic" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "_DEBUG" /D "SPANISH" /D "LATIN_AMERICAN" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
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
# PROP Output_Dir ".\..\build\dtalkdic\la\Release"
# PROP Intermediate_Dir ".\..\build\dtalkdic\la\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\include" /I "dic" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x40a /d "NDEBUG"
# ADD RSC /l 0x40a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dic___Wi"
# PROP BASE Intermediate_Dir "dic___Wi"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtalkdic\uk\Release"
# PROP Intermediate_Dir ".\..\build\dtalkdic\uk\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\include" /I ".\dic" /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dic___W0"
# PROP BASE Intermediate_Dir "dic___W0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtalkdic\uk\debug"
# PROP Intermediate_Dir ".\..\build\dtalkdic\uk\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I ".\include" /I ".\dic" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /YX /FD /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "_DEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "dic___Win32_Release_French"
# PROP BASE Intermediate_Dir "dic___Win32_Release_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\dtalkdic\fr\Release"
# PROP Intermediate_Dir ".\..\build\dtalkdic\fr\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "NDEBUG" /D "FRENCH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "dic - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "dic___Win32_Debug_French"
# PROP BASE Intermediate_Dir "dic___Win32_Debug_French"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\dtalkdic\fr\debug"
# PROP Intermediate_Dir ".\..\build\dtalkdic\fr\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /I ".\nt" /D "_DEBUG" /D "FRENCH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /YX /FD /c
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
# Name "dic - Win32 Release United Kingdom"
# Name "dic - Win32 Debug United Kingdom"
# Name "dic - Win32 Release French"
# Name "dic - Win32 Debug French"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\Dic\Dic.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\Dic\Dic.h
# End Source File
# Begin Source File

SOURCE=.\include\l_com_ph.h
# End Source File
# Begin Source File

SOURCE=.\include\l_gr_ph.h
# End Source File
# Begin Source File

SOURCE=.\include\l_sp_ph.h
# End Source File
# Begin Source File

SOURCE=.\include\l_us_ph.h
# End Source File
# Begin Source File

SOURCE=.\include\ls_upper.tab
# End Source File
# Begin Source File

SOURCE=.\include\port.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
