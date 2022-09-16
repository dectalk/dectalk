# Microsoft Developer Studio Project File - Name="DTalkML" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (WCE SH3) Dynamic-Link Library" 0x8102
# TARGTYPE "Win32 (WCE x86em) Dynamic-Link Library" 0x7f02
# TARGTYPE "Win32 (WCE ARM) Dynamic-Link Library" 0x8502
# TARGTYPE "Win32 (WCE SH4) Dynamic-Link Library" 0x8602
# TARGTYPE "Win32 (WCE MIPS) Dynamic-Link Library" 0x8202

CFG=DTalkML - Win32 (WCE ARM) Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "DTalkMLCE.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "DTalkMLCE.mak" CFG="DTalkML - Win32 (WCE ARM) Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "DTalkML - Win32 (WCE MIPS) Release" (based on "Win32 (WCE MIPS) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 (WCE MIPS) Debug" (based on "Win32 (WCE MIPS) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 (WCE x86em) Release" (based on "Win32 (WCE x86em) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 (WCE x86em) Debug" (based on "Win32 (WCE x86em) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 (WCE SH3) Release" (based on "Win32 (WCE SH3) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 (WCE SH3) Debug" (based on "Win32 (WCE SH3) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 (WCE ARM) Release" (based on "Win32 (WCE ARM) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 (WCE ARM) Debug" (based on "Win32 (WCE ARM) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 (WCE SH4) Release" (based on "Win32 (WCE SH4) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath "Desktop"
# PROP WCE_FormatVersion "6.02"

!IF  "$(CFG)" == "DTalkML - Win32 (WCE MIPS) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "DTalkML_"
# PROP BASE Intermediate_Dir "DTalkML_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\Build\ce\mips\Release"
# PROP Intermediate_Dir ".\..\Build\ce\mips\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY
CPP=clmips.exe
# ADD BASE CPP /nologo /ML /W3 /O2 /I "\work\rnd\dapi\src\api\\" /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /YX /FD /c
# ADD CPP /nologo /M$(CECrtMT) /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WIN32" /YX /FD /c
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
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib commctrl.lib coredll.lib /nologo /dll /machine:MIPS /out:".\..\build\Release/dectalk.dll"
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 commctrl.lib coredll.lib  /nologo /dll /incremental:yes /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\mips\Release/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE MIPS) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "DTalkML_"
# PROP BASE Intermediate_Dir "DTalkML_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\Build\ce\mips\Debug"
# PROP Intermediate_Dir ".\..\Build\ce\mips\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY
CPP=clmips.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "\work\rnd\dapi\src\api\\" /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WIN32" /YX /FD /c
# ADD CPP /nologo /M$(CECrtMT) /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WIN32" /YX /FD /c
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
# ADD BASE LINK32 commctrl.lib coredll.lib libcmt.lib /nologo /dll /incremental:yes /machine:MIPS /out:".\..\build\ce\mips\Release/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 commctrl.lib coredll.lib  /nologo /dll /incremental:yes /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\mips\Debug/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE x86em) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "DTalkML_"
# PROP BASE Intermediate_Dir "DTalkML_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\Build\ce\x86em\Release"
# PROP Intermediate_Dir ".\..\Build\ce\x86em\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
EMPFILE=empfile.exe
# ADD BASE EMPFILE COPY
# ADD EMPFILE COPY
CPP=cl.exe
# ADD BASE CPP /nologo /ML /W3 /O2 /I "\work\rnd\dapi\src\api\\" /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /YX /FD /c
# ADD CPP /nologo /MT /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /YX /c
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
# ADD BASE LINK32 libcmt.lib commctrl.lib coredll.lib /nologo /subsystem:windows /dll /incremental:yes /machine:IX86 /out:".\..\build\ce\mips\Release/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 commctrl.lib coredll.lib  /nologo /subsystem:windows /dll /machine:IX86 /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\x86em\Release/dectalk.dll" /windowsce:emulation
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE x86em) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "DTalkML_"
# PROP BASE Intermediate_Dir "DTalkML_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\Build\ce\x86em\debug"
# PROP Intermediate_Dir ".\..\Build\ce\x86em\debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
EMPFILE=empfile.exe
# ADD BASE EMPFILE COPY
# ADD EMPFILE COPY
CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /YX /c
# ADD CPP /nologo /MT /W3 /Z7 /Od /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /YX /c
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
# ADD BASE LINK32 commctrl.lib coredll.lib /nologo /subsystem:windows /dll /machine:IX86 /out:".\..\build\ce\x86em\Release/dectalk.dll" /windowsce:emulation
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 commctrl.lib coredll.lib  /nologo /subsystem:windows /dll /incremental:yes /debug /machine:IX86 /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\x86em\debug/dectalk.dll" /windowsce:emulation
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH3) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "DTalkML_"
# PROP BASE Intermediate_Dir "DTalkML_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\Build\ce\sh\Release"
# PROP Intermediate_Dir ".\..\Build\ce\sh\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY
CPP=shcl.exe
# ADD BASE CPP /nologo /ML /W3 /O2 /I "\work\rnd\dapi\src\api\\" /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WIN32" /YX /FD /c
# ADD CPP /nologo /M$(CECrt) /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WIN32" /YX /c
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
# ADD BASE LINK32 libcmt.lib commctrl.lib coredll.lib /nologo /dll /incremental:yes /machine:SH3 /out:".\..\build\ce\mips\Release/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 commctrl.lib coredll.lib  /nologo /dll /incremental:yes /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\sh\Release/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH3) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "DTalkML_"
# PROP BASE Intermediate_Dir "DTalkML_"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\Build\ce\sh\Debug"
# PROP Intermediate_Dir ".\..\Build\ce\sh\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
PFILE=pfile.exe
# ADD BASE PFILE COPY
# ADD PFILE COPY
CPP=shcl.exe
# ADD BASE CPP /nologo /ML /W3 /O2 /I "\work\rnd\dapi\src\api\\" /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_DEBUG" /YX /FD /c
# ADD CPP /nologo /M$(CECrt) /W3 /Z7 /Od /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_DEBUG" /YX /c
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
# ADD BASE LINK32 libcmt.lib commctrl.lib coredll.lib /nologo /dll /incremental:yes /machine:SH3 /out:".\..\build\ce\mips\Debug/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 libcmt.lib commctrl.lib coredll.lib  /nologo /dll /incremental:yes /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\sh\Debug/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE ARM) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "DTalkML___Win32__WCE_ARM__Release"
# PROP BASE Intermediate_Dir "DTalkML___Win32__WCE_ARM__Release"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\Build\ce\arm\Release"
# PROP Intermediate_Dir ".\..\Build\ce\arm\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clarm.exe
# ADD BASE CPP /nologo /MC /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /YX /c
# ADD CPP /nologo /MC /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D "WIN32" /D "ENGLISH" /D "ENGLISH_US" /D "UNICODE" /D "_USRDLL" /D "BLD_DECTALK_DLL" /YX /c
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
# ADD BASE LINK32 coredll.lib commctrl.lib /nologo /dll /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\x86em\Release/dectalk.dll" /windowsce:emulation
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 commctrl.lib coredll.lib /nologo /dll /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\arm\Release/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT LINK32 /pdb:none /incremental:yes

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE ARM) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "DTalkML___Win32__WCE_ARM__Debug"
# PROP BASE Intermediate_Dir "DTalkML___Win32__WCE_ARM__Debug"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\Build\ce\arm\Debug"
# PROP Intermediate_Dir ".\..\Build\ce\arm\Debug\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=clarm.exe
# ADD BASE CPP /nologo /MC /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D "WIN32" /D "ENGLISH" /D "ENGLISH_US" /D "UNICODE" /D "_USRDLL" /D "BLD_DECTALK_DLL" /YX /c
# ADD CPP /nologo /MC /W3 /Z7 /Od /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_DEBUG" /D "ARM" /D "_ARM_" /D "WIN32" /D "ENGLISH" /D "ENGLISH_US" /D "UNICODE" /D "_USRDLL" /D "BLD_DECTALK_DLL" /YX /c
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
# ADD BASE LINK32 commctrl.lib coredll.lib /nologo /dll /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\arm\Release/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT BASE LINK32 /pdb:none /incremental:yes
# ADD LINK32 commctrl.lib coredll.lib /nologo /dll /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\arm\Debug/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT LINK32 /pdb:none /incremental:yes

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH4) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCESH4Rel"
# PROP BASE Intermediate_Dir "WCESH4Rel"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\Build\ce\sh4\Release"
# PROP Intermediate_Dir ".\..\Build\ce\sh4\Release\link"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /Qsh4 /MC /W3 /O2 /I "\work\rnd\dapi\src\api\\" /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /YX /c
# ADD CPP /nologo /Qsh4 /MC /W3 /O1 /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WIN32" /YX /c
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
# ADD BASE LINK32 libcmt.lib commctrl.lib coredll.lib /nologo /dll /incremental:yes /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\sh\Release/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT BASE LINK32 /pdb:none /nodefaultlib
# ADD LINK32 commctrl.lib coredll.lib /nologo /dll /incremental:yes /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:".\..\build\ce\sh4\Release/dectalk.dll" /subsystem:$(CESubsystem)
# SUBTRACT LINK32 /pdb:none /nodefaultlib

!ENDIF 

# Begin Target

# Name "DTalkML - Win32 (WCE MIPS) Release"
# Name "DTalkML - Win32 (WCE MIPS) Debug"
# Name "DTalkML - Win32 (WCE x86em) Release"
# Name "DTalkML - Win32 (WCE x86em) Debug"
# Name "DTalkML - Win32 (WCE SH3) Release"
# Name "DTalkML - Win32 (WCE SH3) Debug"
# Name "DTalkML - Win32 (WCE ARM) Release"
# Name "DTalkML - Win32 (WCE ARM) Debug"
# Name "DTalkML - Win32 (WCE SH4) Release"
# Begin Source File

SOURCE=..\..\dapi\src\dectalk.def
# End Source File
# Begin Source File

SOURCE=.\dtalk_ml.c

!IF  "$(CFG)" == "DTalkML - Win32 (WCE MIPS) Release"

DEP_CPP_DTALK=\
	"..\..\..\rnd\dapi\src\api\coop.h"\
	"..\..\..\rnd\dapi\src\api\tts.h"\
	"..\..\..\rnd\dapi\src\api\ttsapi.h"\
	"..\..\..\rnd\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\api\coop.h"\
	
NODEP_CPP_DTALK=\
	"..\..\..\rnd\dapi\src\api\audioapi.h"\
	"..\..\..\rnd\dapi\src\api\cpapi.h"\
	"..\..\..\rnd\dapi\src\api\dtmmedefs.h"\
	"..\..\..\rnd\dapi\src\api\kernel.h"\
	"..\..\..\rnd\dapi\src\api\opthread.h"\
	"..\..\..\rnd\dapi\src\api\playaud.h"\
	"..\..\..\rnd\dapi\src\api\port.h"\
	"..\..\..\rnd\dapi\src\api\speech.h"\
	".\dtmmedefs.h"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE MIPS) Debug"

DEP_CPP_DTALK=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	
NODEP_CPP_DTALK=\
	"..\..\dapi\src\api\audioapi.h"\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\kernel.h"\
	"..\..\dapi\src\api\opthread.h"\
	"..\..\dapi\src\api\playaud.h"\
	"..\..\dapi\src\api\port.h"\
	"..\..\dapi\src\api\speech.h"\
	".\dtmmedefs.h"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE x86em) Release"

DEP_CPP_DTALK=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	
NODEP_CPP_DTALK=\
	"..\..\dapi\src\api\audioapi.h"\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\kernel.h"\
	"..\..\dapi\src\api\opthread.h"\
	"..\..\dapi\src\api\playaud.h"\
	"..\..\dapi\src\api\port.h"\
	"..\..\dapi\src\api\speech.h"\
	".\dtmmedefs.h"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE x86em) Debug"

DEP_CPP_DTALK=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	
NODEP_CPP_DTALK=\
	"..\..\dapi\src\api\audioapi.h"\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\kernel.h"\
	"..\..\dapi\src\api\opthread.h"\
	"..\..\dapi\src\api\playaud.h"\
	"..\..\dapi\src\api\port.h"\
	"..\..\dapi\src\api\speech.h"\
	".\dtmmedefs.h"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH3) Release"

DEP_CPP_DTALK=\
	"..\..\..\rnd\dapi\src\api\coop.h"\
	"..\..\..\rnd\dapi\src\api\tts.h"\
	"..\..\..\rnd\dapi\src\api\ttsapi.h"\
	"..\..\..\rnd\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\api\coop.h"\
	
NODEP_CPP_DTALK=\
	"..\..\..\rnd\dapi\src\api\audioapi.h"\
	"..\..\..\rnd\dapi\src\api\cpapi.h"\
	"..\..\..\rnd\dapi\src\api\dtmmedefs.h"\
	"..\..\..\rnd\dapi\src\api\kernel.h"\
	"..\..\..\rnd\dapi\src\api\opthread.h"\
	"..\..\..\rnd\dapi\src\api\playaud.h"\
	"..\..\..\rnd\dapi\src\api\port.h"\
	"..\..\..\rnd\dapi\src\api\speech.h"\
	".\dtmmedefs.h"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH3) Debug"

DEP_CPP_DTALK=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	
NODEP_CPP_DTALK=\
	"..\..\dapi\src\api\audioapi.h"\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\kernel.h"\
	"..\..\dapi\src\api\opthread.h"\
	"..\..\dapi\src\api\playaud.h"\
	"..\..\dapi\src\api\port.h"\
	"..\..\dapi\src\api\speech.h"\
	".\dtmmedefs.h"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE ARM) Release"

DEP_CPP_DTALK=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	
NODEP_CPP_DTALK=\
	"..\..\dapi\src\api\audioapi.h"\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\kernel.h"\
	"..\..\dapi\src\api\opthread.h"\
	"..\..\dapi\src\api\playaud.h"\
	"..\..\dapi\src\api\port.h"\
	"..\..\dapi\src\api\speech.h"\
	".\dtmmedefs.h"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE ARM) Debug"

DEP_CPP_DTALK=\
	"..\..\dapi\src\api\coop.h"\
	"..\..\dapi\src\api\tts.h"\
	"..\..\dapi\src\api\ttsapi.h"\
	"..\..\dapi\src\api\ttsfeat.h"\
	
NODEP_CPP_DTALK=\
	"..\..\dapi\src\api\audioapi.h"\
	"..\..\dapi\src\api\cpapi.h"\
	"..\..\dapi\src\api\dtmmedefs.h"\
	"..\..\dapi\src\api\kernel.h"\
	"..\..\dapi\src\api\opthread.h"\
	"..\..\dapi\src\api\playaud.h"\
	"..\..\dapi\src\api\port.h"\
	"..\..\dapi\src\api\speech.h"\
	".\dtmmedefs.h"\
	".\port.h"\
	

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH4) Release"

DEP_CPP_DTALK=\
	"..\..\..\rnd\dapi\src\api\coop.h"\
	"..\..\..\rnd\dapi\src\api\tts.h"\
	"..\..\..\rnd\dapi\src\api\ttsapi.h"\
	"..\..\..\rnd\dapi\src\api\ttsfeat.h"\
	"..\..\dapi\src\api\coop.h"\
	
NODEP_CPP_DTALK=\
	"..\..\..\rnd\dapi\src\api\audioapi.h"\
	"..\..\..\rnd\dapi\src\api\cpapi.h"\
	"..\..\..\rnd\dapi\src\api\dtmmedefs.h"\
	"..\..\..\rnd\dapi\src\api\kernel.h"\
	"..\..\..\rnd\dapi\src\api\opthread.h"\
	"..\..\..\rnd\dapi\src\api\playaud.h"\
	"..\..\..\rnd\dapi\src\api\port.h"\
	"..\..\..\rnd\dapi\src\api\speech.h"\
	".\dtmmedefs.h"\
	".\port.h"\
	

!ENDIF 

# End Source File
# End Target
# End Project
