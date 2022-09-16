# Microsoft Developer Studio Project File - Name="licenin1" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103
# TARGTYPE "Win32 (ALPHA) Console Application" 0x0603

CFG=licenin1 - Win32 ALPHA WP Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "licenin1.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "licenin1.mak" CFG="licenin1 - Win32 ALPHA WP Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "licenin1 - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "licenin1 - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "licenin1 - Win32 ALPHA Release" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "licenin1 - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "licenin1 - Win32 WP Release" (based on "Win32 (x86) Console Application")
!MESSAGE "licenin1 - Win32 WP Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "licenin1 - Win32 ALPHA WP Release" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "licenin1 - Win32 ALPHA WP Debug" (based on "Win32 (ALPHA) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "licenin1 - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\licenin1"
# PROP BASE Intermediate_Dir ".\licenin1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\licenin1\release"
# PROP Intermediate_Dir ".\build\licenin1\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=1 /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "licenin1 - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\licenin1\debug"
# PROP Intermediate_Dir ".\build\licenin1\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=1 /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "licenin1"
# PROP BASE Intermediate_Dir "licenin1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\licenin1\release"
# PROP Intermediate_Dir ".\alpha\licenin1\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D LICENSE_INCREMENT=1 /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D LICENSE_INCREMENT=1 /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "licenin0"
# PROP BASE Intermediate_Dir "licenin0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\licenin1\debug"
# PROP Intermediate_Dir ".\alpha\licenin1\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D LICENSE_INCREMENT=1 /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D LICENSE_INCREMENT=1 /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "licenin1 - Win32 WP Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "licenin1"
# PROP BASE Intermediate_Dir "licenin1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\wbuild\licenin1\release"
# PROP Intermediate_Dir ".\wbuild\licenin1\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=1 /D "WILLOWPOND" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=1 /D "WILLOWPOND" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "licenin1 - Win32 WP Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "licenin0"
# PROP BASE Intermediate_Dir "licenin0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\wbuild\licenin1\debug"
# PROP Intermediate_Dir ".\wbuild\licenin1\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=1 /D "WILLOWPOND" /YX /FD /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=1 /D "WILLOWPOND" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA WP Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "licenin1"
# PROP BASE Intermediate_Dir "licenin1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\walpha\licenin1\release"
# PROP Intermediate_Dir ".\walpha\licenin1\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=1 /D "WILLOWPOND" /D "_MBCS" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:ALPHA

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA WP Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "licenin0"
# PROP BASE Intermediate_Dir "licenin0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\walpha\licenin1\debug"
# PROP Intermediate_Dir ".\walpha\licenin1\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=1 /D "WILLOWPOND" /D "_MBCS" /D "ALPHA" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:ALPHA

!ENDIF 

# Begin Target

# Name "licenin1 - Win32 Release"
# Name "licenin1 - Win32 Debug"
# Name "licenin1 - Win32 ALPHA Release"
# Name "licenin1 - Win32 ALPHA Debug"
# Name "licenin1 - Win32 WP Release"
# Name "licenin1 - Win32 WP Debug"
# Name "licenin1 - Win32 ALPHA WP Release"
# Name "licenin1 - Win32 ALPHA WP Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=..\..\dapi\src\Api\Crypt2.c

!IF  "$(CFG)" == "licenin1 - Win32 Release"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 Debug"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 WP Release"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 WP Debug"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA WP Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\liceninc.c

!IF  "$(CFG)" == "licenin1 - Win32 Release"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 Debug"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA Release"

DEP_CPP_LICEN=\
	"..\..\dapi\src\api\coop.h"\
	

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA Debug"

DEP_CPP_LICEN=\
	"..\..\dapi\src\api\coop.h"\
	

!ELSEIF  "$(CFG)" == "licenin1 - Win32 WP Release"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 WP Debug"

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA WP Release"

DEP_CPP_LICEN=\
	"..\..\dapi\src\api\coop.h"\
	

!ELSEIF  "$(CFG)" == "licenin1 - Win32 ALPHA WP Debug"

DEP_CPP_LICEN=\
	"..\..\dapi\src\api\coop.h"\
	

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
