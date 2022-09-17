# Microsoft Developer Studio Project File - Name="CEtalk" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (WCE MIPS) Application" 0x0a01
# TARGTYPE "Win32 (WCE SH) Application" 0x0901

CFG=CEtalk - Win32 (WCE MIPS) Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "CEapi.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CEapi.mak" CFG="CEtalk - Win32 (WCE MIPS) Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release" (based on\
 "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release Spanish" (based on\
 "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release German" (based on\
 "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release Latin American" (based on\
 "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release English UK" (based on\
 "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE SH) Release" (based on\
 "Win32 (WCE SH) Application")
!MESSAGE "CEtalk - Win32 (WCE SH) Release English UK" (based on\
 "Win32 (WCE SH) Application")
!MESSAGE "CEtalk - Win32 (WCE SH) Release German" (based on\
 "Win32 (WCE SH) Application")
!MESSAGE "CEtalk - Win32 (WCE SH) Release Spanish" (based on\
 "Win32 (WCE SH) Application")
!MESSAGE "CEtalk - Win32 (WCE SH) Release Latin American" (based on\
 "Win32 (WCE SH) Application")
!MESSAGE 

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
# PROP WCE_Configuration "H/PC Ver. 2.00"

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WMIPSRel"
# PROP BASE Intermediate_Dir "WMIPSRel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\\cestatic\mips\us\release"
# PROP Intermediate_Dir ".\build\cestatic\mips\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /D "_AFXDLL" /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /MT /W3 /O2 /I "d:\work\ad\dapi\src\API" /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 /d "_AFXDLL"
# ADD RSC /l 0x409 /r /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /subsystem:windowsce,2.0 /windowsce:noconvert
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 d:\work\ad\dapi\build\cestatic\mips\us\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /out:".\build\cestatic\mips\us\release/APItest_us.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT LINK32 /pdb:none /nodefaultlib
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CEtalk__"
# PROP BASE Intermediate_Dir "CEtalk__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\cestatic\mips\sp\release"
# PROP Intermediate_Dir ".\build\cestatic\mips\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /MT /W3 /O2 /I "d:\work\ad\dapi\src\API" /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200
# ADD RSC /l 0x80a /r /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 d:\work\ad\dapi\build\cestatic\mips\us\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /out:".\build\cestatic\mips\us\release/CEtalk_us.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 d:\work\ad\dapi\build\cestatic\mips\sp\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /out:".\build\cestatic\mips\sp\release/APItest_sp.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT LINK32 /pdb:none /nodefaultlib
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CEtalk_0"
# PROP BASE Intermediate_Dir "CEtalk_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\cestatic\mips\gr\release"
# PROP Intermediate_Dir ".\build\cestatic\mips\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /MT /W3 /O2 /I "d:\work\ad\dapi\src\API" /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200
# ADD RSC /l 0x407 /r /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 d:\work\ad\dapi\build\cestatic\mips\us\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /out:".\build\cestatic\mips\us\release/CEtalk_us.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 d:\work\ad\dapi\build\cestatic\mips\gr\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /out:".\build\cestatic\mips\gr\release/APItest_gr.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT LINK32 /pdb:none /nodefaultlib
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CEtalk_1"
# PROP BASE Intermediate_Dir "CEtalk_1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\cestatic\mips\la\release"
# PROP Intermediate_Dir ".\build\cestatic\mips\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /MT /W3 /O2 /I "d:\work\ad\dapi\src\API" /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200
# ADD RSC /l 0xc0a /r /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 d:\work\ad\dapi\build\cestatic\mips\us\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /out:".\build\cestatic\mips\us\release/CEtalk_us.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 d:\work\ad\dapi\build\cestatic\mips\la\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /out:".\build\cestatic\mips\la\release/APItest_la.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT LINK32 /pdb:none /nodefaultlib
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CEtalk_2"
# PROP BASE Intermediate_Dir "CEtalk_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\cestatic\mips\uk\release"
# PROP Intermediate_Dir ".\build\cestatic\mips\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /MT /W3 /O2 /I "d:\work\ad\dapi\src\API" /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200
# ADD RSC /l 0x809 /r /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 d:\work\ad\dapi\build\cestatic\mips\us\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /out:".\build\cestatic\mips\us\release/CEtalk_us.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 d:\work\ad\dapi\build\cestatic\mips\uk\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /out:".\build\cestatic\mips\uk\release/APItest_uk.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT LINK32 /pdb:none /nodefaultlib
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CEtalk__"
# PROP BASE Intermediate_Dir "CEtalk__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\cestatic\sh\us\release"
# PROP Intermediate_Dir ".\build\cestatic\sh\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /MT /W3 /O2 /I "d:\work\ad\dapi\src\API" /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /FR /Yu"stdafx.h" /QMRWCE /c
# SUBTRACT CPP /X
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x409 /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 d:\work\ad\dapi\build\cestatic\mips\us\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\cestatic\mips\us\release/CEtalk_us.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 d:\work\ad\dapi\build\cestatic\sh\us\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\cestatic\sh\us\release/APItest_us.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT LINK32 /pdb:none /nodefaultlib
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release English UK"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CEtalk_0"
# PROP BASE Intermediate_Dir "CEtalk_0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\cestatic\sh\uk\release"
# PROP Intermediate_Dir ".\build\cestatic\sh\uk\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /MT /W3 /O2 /I "d:\work\ad\dapi\src\API" /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0x809 /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x809 /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 d:\work\ad\dapi\build\cestatic\mips\uk\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\cestatic\mips\uk\release/CEtalk_uk.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 d:\work\ad\dapi\build\cestatic\sh\uk\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\cestatic\sh\uk\release/APItest_uk.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT LINK32 /pdb:none /nodefaultlib
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release German"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CEtalk_1"
# PROP BASE Intermediate_Dir "CEtalk_1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\cestatic\sh\gr\release"
# PROP Intermediate_Dir ".\build\cestatic\sh\gr\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /MT /W3 /O2 /I "d:\work\ad\dapi\src\API" /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0x407 /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x407 /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 d:\work\ad\dapi\build\cestatic\mips\gr\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\cestatic\mips\gr\release/CEtalk_gr.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 d:\work\ad\dapi\build\cestatic\sh\gr\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\cestatic\sh\gr\release/APItest_gr.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT LINK32 /pdb:none /nodefaultlib
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release Spanish"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CEtalk_2"
# PROP BASE Intermediate_Dir "CEtalk_2"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\cestatic\sh\sp\release"
# PROP Intermediate_Dir ".\build\cestatic\sh\sp\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /MT /W3 /O2 /I "d:\work\ad\dapi\src\API" /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0x80a /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x80a /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 d:\work\ad\dapi\build\cestatic\mips\sp\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\cestatic\mips\sp\release/CEtalk_sp.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 d:\work\ad\dapi\build\cestatic\sh\sp\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\cestatic\sh\sp\release/APItest_sp.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT LINK32 /pdb:none /nodefaultlib
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release Latin American"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CEtalk_3"
# PROP BASE Intermediate_Dir "CEtalk_3"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\cestatic\sh\la\release"
# PROP Intermediate_Dir ".\build\cestatic\sh\la\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /MT /W3 /O2 /I "d:\work\ad\dapi\src\API" /I "c:\devstudio\wce\mfc\include\wce200" /I "c:\devstudio\wce\include\wce200" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0xc0a /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0xc0a /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 d:\work\ad\dapi\build\cestatic\mips\la\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\cestatic\mips\la\release/CEtalk_la.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 d:\work\ad\dapi\build\cestatic\sh\la\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\cestatic\sh\la\release/APItest_la.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips" /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0
# SUBTRACT LINK32 /pdb:none /nodefaultlib
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY

!ENDIF 

# Begin Target

# Name "CEtalk - Win32 (WCE MIPS) Release"
# Name "CEtalk - Win32 (WCE MIPS) Release Spanish"
# Name "CEtalk - Win32 (WCE MIPS) Release German"
# Name "CEtalk - Win32 (WCE MIPS) Release Latin American"
# Name "CEtalk - Win32 (WCE MIPS) Release English UK"
# Name "CEtalk - Win32 (WCE SH) Release"
# Name "CEtalk - Win32 (WCE SH) Release English UK"
# Name "CEtalk - Win32 (WCE SH) Release German"
# Name "CEtalk - Win32 (WCE SH) Release Spanish"
# Name "CEtalk - Win32 (WCE SH) Release Latin American"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\CEapi.cpp

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release"

DEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish"

DEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German"

DEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American"

DEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK"

DEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release"

DEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release English UK"

DEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release German"

DEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release Spanish"

DEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release Latin American"

DEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CEAPI=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CEapiDlg.cpp

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release"

DEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	{$(INCLUDE)}"wceres.rc"\
	
NODEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish"

DEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	{$(INCLUDE)}"wceres.rc"\
	
NODEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German"

DEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	{$(INCLUDE)}"wceres.rc"\
	
NODEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American"

DEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	{$(INCLUDE)}"wceres.rc"\
	
NODEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK"

DEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	{$(INCLUDE)}"wceres.rc"\
	
NODEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release"

DEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	{$(INCLUDE)}"wceres.rc"\
	
NODEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release English UK"

DEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	{$(INCLUDE)}"wceres.rc"\
	
NODEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release German"

DEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	{$(INCLUDE)}"wceres.rc"\
	
NODEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release Spanish"

DEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	{$(INCLUDE)}"wceres.rc"\
	
NODEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release Latin American"

DEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\ttsapi.h"\
	"..\..\ad\dapi\src\API\ttsfeat.h"\
	".\CEapi.h"\
	".\CEapiDlg.h"\
	".\StdAfx.h"\
	{$(INCLUDE)}"wceres.rc"\
	
NODEP_CPP_CEAPID=\
	"..\..\ad\dapi\src\API\dtmmedefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release English UK"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release German"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release Spanish"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release Latin American"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ENDIF 

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\CEapi.h
# End Source File
# Begin Source File

SOURCE=.\CEapiDlg.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\CEapi.ico
# End Source File
# Begin Source File

SOURCE=.\CEapi.rc

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release English UK"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release German"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release Spanish"

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release Latin American"

!ENDIF 

# End Source File
# End Group
# End Target
# End Project
