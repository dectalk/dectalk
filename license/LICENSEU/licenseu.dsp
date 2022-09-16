# Microsoft Developer Studio Project File - Name="LicenseU" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101
# TARGTYPE "Win32 (ALPHA) Application" 0x0601

CFG=LicenseU - Win32 ALPHA WP Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "licenseu.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "licenseu.mak" CFG="LicenseU - Win32 ALPHA WP Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "LicenseU - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "LicenseU - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "LicenseU - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "LicenseU - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE "LicenseU - Win32 WP Release" (based on "Win32 (x86) Application")
!MESSAGE "LicenseU - Win32 WP Debug" (based on "Win32 (x86) Application")
!MESSAGE "LicenseU - Win32 ALPHA WP Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "LicenseU - Win32 ALPHA WP Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "LicenseU - Win32 Debug"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\LicenseU"
# PROP BASE Intermediate_Dir ".\LicenseU"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\debug"
# PROP Intermediate_Dir ".\build\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:IX86
# SUBTRACT BASE LINK32 /incremental:no
# ADD LINK32 /nologo /subsystem:windows /debug /machine:IX86
# SUBTRACT LINK32 /incremental:no

!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\License0"
# PROP BASE Intermediate_Dir ".\License0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\release"
# PROP Intermediate_Dir ".\build\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:IX86
# ADD LINK32 /nologo /subsystem:windows /machine:IX86

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "LicenseU"
# PROP BASE Intermediate_Dir "LicenseU"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\alpha\release"
# PROP Intermediate_Dir ".\alpha\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "ALPHA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 /nologo /subsystem:windows /machine:ALPHA

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "License0"
# PROP BASE Intermediate_Dir "License0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\alpha\debug"
# PROP Intermediate_Dir ".\alpha\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /YX /FD /MDd /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "ALPHA" /YX /FD /MDd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:ALPHA
# ADD LINK32 /nologo /subsystem:windows /debug /machine:ALPHA

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "License0"
# PROP BASE Intermediate_Dir "License0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\wbuild\release"
# PROP Intermediate_Dir ".\wbuild\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "WILLOWPOND" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "WILLOWPOND" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:IX86 /out:".\build\release/licu_wp.exe"
# ADD LINK32 /nologo /subsystem:windows /machine:IX86

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "License1"
# PROP BASE Intermediate_Dir "License1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\wbuild\debug"
# PROP Intermediate_Dir ".\wbuild\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "WILLOWPOND" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "WILLOWPOND" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:IX86 /out:".\build\debug\licu_wp.exe"
# SUBTRACT BASE LINK32 /incremental:no
# ADD LINK32 /nologo /subsystem:windows /debug /machine:IX86
# SUBTRACT LINK32 /incremental:no

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "LicenseU"
# PROP BASE Intermediate_Dir "LicenseU"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\walpha\release"
# PROP Intermediate_Dir ".\walpha\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /YX /FD /c
# ADD CPP /nologo /MD /Gt0 /W3 /GX /O2 /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "WILLOWPOND" /D "ALPHA" /YX /FD /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:ALPHA
# ADD LINK32 /nologo /subsystem:windows /machine:ALPHA

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "License0"
# PROP BASE Intermediate_Dir "License0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\walpha\debug"
# PROP Intermediate_Dir ".\walpha\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /YX /FD /MDd /c
# ADD CPP /nologo /Gt0 /W3 /GX /Zi /Od /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "WILLOWPOND" /D "ALPHA" /YX /FD /MDd /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:ALPHA
# ADD LINK32 /nologo /subsystem:windows /debug /machine:ALPHA

!ENDIF 

# Begin Target

# Name "LicenseU - Win32 Debug"
# Name "LicenseU - Win32 Release"
# Name "LicenseU - Win32 ALPHA Release"
# Name "LicenseU - Win32 ALPHA Debug"
# Name "LicenseU - Win32 WP Release"
# Name "LicenseU - Win32 WP Debug"
# Name "LicenseU - Win32 ALPHA WP Release"
# Name "LicenseU - Win32 ALPHA WP Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=..\..\dapi\src\Api\Crypt2.c

!IF  "$(CFG)" == "LicenseU - Win32 Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LicChPwd.cpp

!IF  "$(CFG)" == "LicenseU - Win32 Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

DEP_CPP_LICCH=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dectalkf.h"\
	".\Licchpwd.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

DEP_CPP_LICCH=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dectalkf.h"\
	".\Licchpwd.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

DEP_CPP_LICCH=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dectalkf.h"\
	".\Licchpwd.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

DEP_CPP_LICCH=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dectalkf.h"\
	".\Licchpwd.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Stdafx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LicenseU.cpp

!IF  "$(CFG)" == "LicenseU - Win32 Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

DEP_CPP_LICEN=\
	".\Licenseu.h"\
	".\Liceudlg.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

DEP_CPP_LICEN=\
	".\Licenseu.h"\
	".\Liceudlg.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

DEP_CPP_LICEN=\
	".\Licenseu.h"\
	".\Liceudlg.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

DEP_CPP_LICEN=\
	".\Licenseu.h"\
	".\Liceudlg.h"\
	".\Stdafx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LicenseU.rc
# End Source File
# Begin Source File

SOURCE=.\liceudlg.cpp

!IF  "$(CFG)" == "LicenseU - Win32 Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

DEP_CPP_LICEU=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dectalkf.h"\
	".\Licchpwd.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Liceudlg.h"\
	".\Licreqd.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

DEP_CPP_LICEU=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dectalkf.h"\
	".\Licchpwd.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Liceudlg.h"\
	".\Licreqd.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

DEP_CPP_LICEU=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dectalkf.h"\
	".\Licchpwd.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Liceudlg.h"\
	".\Licreqd.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

DEP_CPP_LICEU=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dectalkf.h"\
	".\Licchpwd.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Liceudlg.h"\
	".\Licreqd.h"\
	".\Stdafx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LicReqd.cpp

!IF  "$(CFG)" == "LicenseU - Win32 Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

DEP_CPP_LICRE=\
	"..\..\dapi\src\api\coop.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Licreqd.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

DEP_CPP_LICRE=\
	"..\..\dapi\src\api\coop.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Licreqd.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

DEP_CPP_LICRE=\
	"..\..\dapi\src\api\coop.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Licreqd.h"\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

DEP_CPP_LICRE=\
	"..\..\dapi\src\api\coop.h"\
	".\License.h"\
	".\Licenseu.h"\
	".\Licreqd.h"\
	".\Stdafx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "LicenseU - Win32 Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

DEP_CPP_STDAF=\
	".\Stdafx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\UpdateRg.c

!IF  "$(CFG)" == "LicenseU - Win32 Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

DEP_CPP_UPDAT=\
	"..\..\dapi\src\api\coop.h"\
	".\License.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

DEP_CPP_UPDAT=\
	"..\..\dapi\src\api\coop.h"\
	".\License.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

DEP_CPP_UPDAT=\
	"..\..\dapi\src\api\coop.h"\
	".\License.h"\
	

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

DEP_CPP_UPDAT=\
	"..\..\dapi\src\api\coop.h"\
	".\License.h"\
	

!ENDIF 

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\Licchpwd.h
# End Source File
# Begin Source File

SOURCE=.\License.h
# End Source File
# Begin Source File

SOURCE=.\Licenseu.h
# End Source File
# Begin Source File

SOURCE=.\Liceudlg.h
# End Source File
# Begin Source File

SOURCE=.\Licreqd.h
# End Source File
# Begin Source File

SOURCE=.\Stdafx.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\licenseu.ico
# End Source File
# Begin Source File

SOURCE=.\Licenseu.rc2
# End Source File
# End Group
# End Target
# End Project
