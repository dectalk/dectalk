# Microsoft Developer Studio Generated NMAKE File, Based on Mailread.dsp
!IF "$(CFG)" == ""
CFG=MAILREAD - WIN32 (WCE MIPS) RELEASE DLL
!MESSAGE No configuration specified. Defaulting to MAILREAD - WIN32 (WCE MIPS) RELEASE DLL.
!ENDIF 

!IF "$(CESubsystem)" == ""
CESubsystem=windowsce,2.0
!MESSAGE Variable CESubsystem not specified. Defaulting to windowsce,2.0
!ENDIF 

!IF "$(CEVersion)" == ""
CEVersion=200
!MESSAGE Variable CEVersion not specified. Defaulting to 200
!ENDIF 

!IF "$(CEConfigName)" == ""
CEConfigName=H/PC Ver. 2.00
!MESSAGE Variable CEConfigName not specified.  Defaulting to H/PC Ver. 2.00
!ENDIF 

!IF $(CEVersion) < 201
CECrt=L
CECrtDebug=Ld
CECrtMT=T
CECrtMTDebug=Td
CENoDefaultLib=corelibc.lib
CEx86Corelibc= 
!ELSE 
CECrt=C
CECrtDebug=C
CECrtMT=C
CECrtMTDebug=C
CENoDefaultLib=libc.lib /nodefaultlib:libcd.lib /nodefaultlib:libcmt.lib /nodefaultlib:libcmtd.lib /nodefaultlib:msvcrt.lib /nodefaultlib:msvcrtd.lib
CEx86Corelibc=corelibc.lib
!ENDIF 

!IF "$(CFG)" != "Mailread - Win32 (WCE x86em) Release" && "$(CFG)" != "Mailread - Win32 (WCE x86em) Debug" && "$(CFG)" != "Mailread - Win32 (WCE x86em) Debug dll" && "$(CFG)" != "Mailread - Win32 (WCE x86em) Release dll" && "$(CFG)" != "Mailread - Win32 (WCE SH4) Release dll" && "$(CFG)" != "Mailread - Win32 (WCE SH3) Release dll" && "$(CFG)" != "Mailread - Win32 (WCE MIPS) Release dll" && "$(CFG)" != "Mailread - Win32 (WCE ARM) Release dll" && "$(CFG)" != "Mailread - Win32 (WCE ARM) Release" && "$(CFG)" != "Mailread - Win32 (WCE MIPS) Release" && "$(CFG)" != "Mailread - Win32 (WCE SH3) Release" && "$(CFG)" != "Mailread - Win32 (WCE SH4) Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
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
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release"

OUTDIR=.\build\static\x86em\us\release
INTDIR=.\build\static\x86em\us\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\Mailread.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\us\release\dtstatic.lib msgstore.lib  /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Mailread.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Mailread.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug"

OUTDIR=.\build\static\x86em\us\debug
INTDIR=.\build\static\x86em\us\debug\link
# Begin Custom Macros
OutDir=.\build\static\x86em\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Mailread.exe"
	-@erase "$(OUTDIR)\Mailread.ilk"
	-@erase "$(OUTDIR)\Mailread.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /Zi /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\Mailread.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "_DEBUG" /d "x86" /d "i486" /d "_x86_" 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\us\release\dectalk.lib msgstore.lib  /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Mailread.pdb" /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Mailread.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll"

OUTDIR=.\build\dll\x86em\us\debug
INTDIR=.\build\dll\x86em\us\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"
	-@erase "$(OUTDIR)\Mailread.ilk"
	-@erase "$(OUTDIR)\Mailread.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Z7 /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\Mailread.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "_DEBUG" /d "x86" /d "i486" /d "_x86_" 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\us\release\dectalk.lib msgstore.lib  /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Mailread.pdb" /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Mailread.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll"

OUTDIR=.\build\dll\x86em\us\release
INTDIR=.\build\dll\x86em\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\Mailread.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\us\release\dectalk.lib msgstore.lib  /nologo /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Mailread.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Mailread.exe" /subsystem:$(CESubsystem)  
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll"

OUTDIR=.\build\dll\sh4\us\release
INTDIR=.\build\dll\sh4\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\Mailread.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\us\release\dectalk.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Mailread.pdb" /machine:SH4 /out:"$(OUTDIR)\Mailread.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll"

OUTDIR=.\build\dll\sh\us\release
INTDIR=.\build\dll\sh\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O1 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\Mailread.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\us\release\dectalk.lib msgstore.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Mailread.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Mailread.exe" /subsystem:$(CESubsystem) /STACK:65536,4096  
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll"

OUTDIR=.\build\dll\mips\us\release
INTDIR=.\build\dll\mips\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\Mailread.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\us\release\dectalk.lib msgstore.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Mailread.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Mailread.exe" /subsystem:$(CESubsystem) /STACK:65536,4096  
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll"

OUTDIR=.\build\dll\arm\us\release
INTDIR=.\build\dll\arm\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\Mailread.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\us\release\dectalk.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Mailread.pdb" /machine:ARM /out:"$(OUTDIR)\Mailread.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release"

OUTDIR=.\build\static\arm\us\release
INTDIR=.\build\static\arm\us\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\Mailread.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\us\release\dtstatic.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Mailread.pdb" /machine:ARM /out:"$(OUTDIR)\Mailread.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release"

OUTDIR=.\build\static\mips\us\release
INTDIR=.\build\static\mips\us\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\Mailread.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\us\release\dtstatic.lib msgstore.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Mailread.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Mailread.exe" /subsystem:$(CESubsystem) /STACK:65536,4096  
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release"

OUTDIR=.\build\static\sh\us\release
INTDIR=.\build\static\sh\us\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O1 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\Mailread.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\us\release\dtstatic.lib msgstore.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Mailread.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Mailread.exe" /subsystem:$(CESubsystem) /STACK:65536,4096  
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"

OUTDIR=.\build\static\sh4\us\release
INTDIR=.\build\static\sh4\us\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Mailread.exe"


CLEAN :
	-@erase "$(INTDIR)\Mailread.obj"
	-@erase "$(INTDIR)\Mailread.pch"
	-@erase "$(INTDIR)\Mailread.res"
	-@erase "$(INTDIR)\MailreadDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Mailread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\Mailread.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Mailread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\us\release\dtstatic.lib msgstore.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Mailread.pdb" /machine:SH4 /out:"$(OUTDIR)\Mailread.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\Mailread.obj" \
	"$(INTDIR)\MailreadDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\Mailread.res"

"$(OUTDIR)\Mailread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Mailread.dep")
!INCLUDE "Mailread.dep"
!ELSE 
!MESSAGE Warning: cannot find "Mailread.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Mailread - Win32 (WCE x86em) Release" || "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug" || "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll" || "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll" || "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll" || "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll" || "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll" || "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll" || "$(CFG)" == "Mailread - Win32 (WCE ARM) Release" || "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release" || "$(CFG)" == "Mailread - Win32 (WCE SH3) Release" || "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"
SOURCE=.\Mailread.cpp

!IF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"


"$(INTDIR)\Mailread.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ENDIF 

SOURCE=.\Mailread.rc

!IF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"


"$(INTDIR)\Mailread.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\MailreadDlg.cpp

!IF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"


"$(INTDIR)\MailreadDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Mailread.pch"


!ENDIF 

SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /Zi /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Debug dll"

CPP_SWITCHES=/nologo /MTd /W3 /Z7 /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE x86em) Release dll"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release dll"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O1 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release dll"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE ARM) Release"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE MIPS) Release"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH3) Release"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O1 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Mailread - Win32 (WCE SH4) Release"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /Fp"$(INTDIR)\Mailread.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\Mailread.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 


!ENDIF 

