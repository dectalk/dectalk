# Microsoft Developer Studio Project File - Name="Mailread" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (WCE ARM) Application" 0x8501
# TARGTYPE "Win32 (WCE x86em) Application" 0x7f01
# TARGTYPE "Win32 (WCE SH3) Application" 0x8101
# TARGTYPE "Win32 (WCE MIPS) Application" 0x8201
# TARGTYPE "Win32 (WCE SH4) Application" 0x8601

CFG=MAILREAD - WIN32 (WCE MIPS) RELEASE DLL
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Mailread.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Mailread.mak" CFG="MAILREAD - WIN32 (WCE MIPS) RELEASE DLL"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Mailread - Win32 (WCE x86em) Release" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Mailread - Win32 (WCE x86em) Debug" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Mailread - Win32 (WCE x86em) Debug dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Mailread - Win32 (WCE x86em) Release dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Mailread - Win32 (WCE SH4) Release dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE "Mailread - Win32 (WCE SH3) Release dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Mailread - Win32 (WCE MIPS) Release dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Mailread - Win32 (WCE ARM) Release dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Mailread - Win32 (WCE ARM) Release" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Mailread - Win32 (WCE MIPS) Release" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Mailread - Win32 (WCE SH3) Release" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Mailread - Win32 (WCE SH4) Release" (based on "Win32 (WCE SH4) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath "H/PC Pro 2.11"
# PROP WCE_FormatVersion "6.02"

!IF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "x86emRel"
# PROP BASE Intermediate_Dir "x86emRel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\static\x86em\us\release"
# PROP Intermediate_Dir ".\build\static\x86em\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Yu"stdafx.h" /c
# ADD CPP /nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /Yu"stdafx.h" /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG"
# ADD RSC /l 0x409 /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /machine:I386 /windowsce:emulation
# ADD LINK32 .\..\..\dapi\build\cestatic\x86em\us\release\dtstatic.lib msgstore.lib  /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /windowsce:emulation

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "x86emDbg"
# PROP BASE Intermediate_Dir "x86emDbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\static\x86em\us\debug"
# PROP Intermediate_Dir ".\build\static\x86em\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /Zi /Od /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /Yu"stdafx.h" /c
# ADD CPP /nologo /MTd /W3 /Gm /Zi /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /Yu"stdafx.h" /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "_DEBUG" /d "x86" /d "i486" /d "_x86_"
# ADD RSC /l 0x409 /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "_DEBUG" /d "x86" /d "i486" /d "_x86_"
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /debug /machine:I386 /windowsce:emulation
# ADD LINK32 .\..\..\dapi\build\cestatic\x86em\us\release\dectalk.lib msgstore.lib  /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /windowsce:emulation

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "x86emDebug dll"
# PROP BASE Intermediate_Dir "x86emDebug dll"
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\build\dll\x86em\us\debug"
# PROP Intermediate_Dir ".\build\dll\x86em\us\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /Zi /Od /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MTd /W3 /Z7 /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Yu"stdafx.h" /c
# SUBTRACT CPP /u
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "_DEBUG" /d "x86" /d "i486" /d "_x86_"
# ADD RSC /l 0x409 /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "_DEBUG" /d "x86" /d "i486" /d "_x86_"
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /debug /machine:I386 /windowsce:emulation
# ADD LINK32 .\..\..\dapi\build\cedll\x86em\us\release\dectalk.lib msgstore.lib  /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /windowsce:emulation

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "x86emRelease dll"
# PROP BASE Intermediate_Dir "x86emRelease dll"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\dll\x86em\us\release"
# PROP Intermediate_Dir ".\build\dll\x86em\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Yu"stdafx.h" /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG"
# ADD RSC /l 0x409 /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 $(CEx86Corelibc) /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /machine:CEE /nodefaultlib:"$(CENoDefaultLib)" /subsystem:$(CESubsystem)
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\..\dapi\build\cedll\x86em\us\release\dectalk.lib msgstore.lib  /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /subsystem:$(CESubsystem)
# SUBTRACT LINK32 /pdb:none /incremental:yes

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCESH4Release dll"
# PROP BASE Intermediate_Dir "WCESH4Release dll"
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\dll\sh4\us\release"
# PROP Intermediate_Dir ".\build\dll\sh4\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /Qsh4 /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /Qsh4 /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x409 /r /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /entry:"wWinMainCRTStartup" /machine:SH4 /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\..\dapi\build\cedll\sh4\us\release\dectalk.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH4 /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCESH3Release dll"
# PROP BASE Intermediate_Dir "WCESH3Release dll"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\dll\sh\us\release"
# PROP Intermediate_Dir ".\build\dll\sh\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /M$(CECrtMT) /W3 /O1 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /M$(CECrtMT) /W3 /O1 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x409 /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\..\dapi\build\cestatic\sh\us\release\dtstatic.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /out:".\build\static\sh3\us\release/Mailread.exe" /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\..\dapi\build\cedll\sh\us\release\dectalk.lib msgstore.lib  /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WMIPSRelease dll"
# PROP BASE Intermediate_Dir "WMIPSRelease dll"
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\dll\mips\us\release"
# PROP Intermediate_Dir ".\build\dll\mips\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /M$(CECrtMT) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x409 /r /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\..\dapi\build\cedll\mips\us\release\dectalk.lib msgstore.lib  /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCEARMRelease dll"
# PROP BASE Intermediate_Dir "WCEARMRelease dll"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\dll\arm\us\release"
# PROP Intermediate_Dir ".\build\dll\arm\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clarm.exe
# ADD BASE CPP /nologo /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x409 /r /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\..\dapi\build\cedll\arm\uk\release\dectalk.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /machine:ARM /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\..\dapi\build\cedll\arm\us\release\dectalk.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /machine:ARM /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCEARMRel"
# PROP BASE Intermediate_Dir "WCEARMRel"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\static\arm\us\release"
# PROP Intermediate_Dir ".\build\static\arm\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clarm.exe
# ADD BASE CPP /nologo /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x409 /r /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\..\dapi\build\cedll\arm\us\release\dectalk.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /machine:ARM /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\..\dapi\build\cestatic\arm\us\release\dtstatic.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /machine:ARM /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WMIPSRel"
# PROP BASE Intermediate_Dir "WMIPSRel"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\static\mips\us\release"
# PROP Intermediate_Dir ".\build\static\mips\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /M$(CECrtMT) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /QMRWCE /c
# ADD CPP /nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /QMRWCE /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x409 /r /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\..\dapi\build\cedll\mips\us\release\dectalk.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\..\dapi\build\cestatic\mips\us\release\dtstatic.lib msgstore.lib  /nologo /entry:"wWinMainCRTStartup" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCESH3Rel"
# PROP BASE Intermediate_Dir "WCESH3Rel"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\static\sh\us\release"
# PROP Intermediate_Dir ".\build\static\sh\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /M$(CECrtMT) /W3 /O1 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /M$(CECrtMT) /W3 /O1 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x409 /r /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\..\dapi\build\cedll\sh\us\release\dectalk.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\..\dapi\build\cestatic\sh\us\release\dtstatic.lib msgstore.lib  /nologo /entry:"wWinMainCRTStartup" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCESH4Rel"
# PROP BASE Intermediate_Dir "WCESH4Rel"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\build\static\sh4\us\release"
# PROP Intermediate_Dir ".\build\static\sh4\us\release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /Qsh4 /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /Qsh4 /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Yu"stdafx.h" /c
RSC=rc.exe
# ADD BASE RSC /l 0x409 /r /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x409 /r /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 .\..\..\dapi\build\cedll\sh4\us\release\dectalk.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH4 /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 .\..\..\dapi\build\cestatic\sh4\us\release\dtstatic.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /machine:SH4 /subsystem:$(CESubsystem) /STACK:65536,4096
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ENDIF 

# Begin Target

# Name "Mailread - Win32 (WCE x86em) Release"
# Name "Mailread - Win32 (WCE x86em) Debug"
# Name "Mailread - Win32 (WCE x86em) Debug dll"
# Name "Mailread - Win32 (WCE x86em) Release dll"
# Name "Mailread - Win32 (WCE SH4) Release dll"
# Name "Mailread - Win32 (WCE SH3) Release dll"
# Name "Mailread - Win32 (WCE MIPS) Release dll"
# Name "Mailread - Win32 (WCE ARM) Release dll"
# Name "Mailread - Win32 (WCE ARM) Release"
# Name "Mailread - Win32 (WCE MIPS) Release"
# Name "Mailread - Win32 (WCE SH3) Release"
# Name "Mailread - Win32 (WCE SH4) Release"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\Mailread.cpp

!IF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"

DEP_CPP_MAILR=\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Mailread.rc

!IF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\MailreadDlg.cpp

!IF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"

DEP_CPP_MAILRE=\
	"..\..\dapi\src\api\ttsapi.h"\
	".\Mailread.h"\
	".\MailreadDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_MAILRE=\
	"..\..\dapi\src\api\dtmmedefs.h"\
	".\api.h"\
	".\eapimap.h"\
	".\indbase.h"\
	".\sgstor2.h"\
	".\sgstore.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"

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

SOURCE=.\Mailread.h
# End Source File
# Begin Source File

SOURCE=.\MailreadDlg.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\Mailread.ico
# End Source File
# Begin Source File

SOURCE=.\res\Mailread.rc2
# PROP Exclude_From_Scan -1
# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1
# End Source File
# End Group
# Begin Source File

SOURCE=.\ReadMe.txt
# End Source File
# End Target
# End Project
