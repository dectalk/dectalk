# Microsoft Developer Studio Generated NMAKE File, Based on CEtalk.dsp
!IF "$(CFG)" == ""
CFG=CEtalk - Win32 (WCE MIPS) Release
!MESSAGE No configuration specified. Defaulting to CEtalk - Win32 (WCE MIPS) Release.
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

!IF "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Release" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Release" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Release Spanish" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Release German" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Release Latin American" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Release English UK" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Release Spanish" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Release German" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Release Latin American" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Release English UK" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Debug English UK" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Debug Latin American" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Debug German" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Debug Spanish" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) debug" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Debug English UK" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Debug German" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Debug Spanish" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Debug Latin American" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Debug" && "$(CFG)" !=\
 "CEtalk - Win32 (WCE MIPS) Release dll" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Release English UK dll" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Release Latin American dll" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Release German dll" && "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Release Spanish dll" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Release dll" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Release German dll" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Release English UK dll" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Release Spanish dll" && "$(CFG)" != "CEtalk - Win32 (WCE SH3) Release Latin American dll" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Release" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Release dll" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Debug dll" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Release Spanish" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Release Latin American" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Release English UK" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Release German" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Release Spanish dll" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Release Latin American dll" && "$(CFG)" !=\
 "CEtalk - Win32 (WCE x86em) Release English UK dll" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Release German dll" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Debug Spanish dll" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Debug Latin American dll" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Debug English UK dll" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Debug German dll" && "$(CFG)" != "CEtalk - Win32 (WCE x86em) Debug" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Release" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Debug" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Release German" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Release Latin American" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Release Spanish" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Release English UK" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Release dll" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Release German dll" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Release English UK dll" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Release Spanish dll" && "$(CFG)" != "CEtalk - Win32 (WCE ARM) Release Latin American dll" && "$(CFG)" != "CEtalk - Win32 (WCE SH4) Release" && "$(CFG)" != "CEtalk - Win32 (WCE SH4) Release English UK" && "$(CFG)" !=\
 "CEtalk - Win32 (WCE SH4) Release Spanish" && "$(CFG)" != "CEtalk - Win32 (WCE SH4) Release German" && "$(CFG)" != "CEtalk - Win32 (WCE SH4) Release Latin American" && "$(CFG)" != "CEtalk - Win32 (WCE SH4) Release dll" && "$(CFG)" != "CEtalk - Win32 (WCE SH4) Release German dll" && "$(CFG)" != "CEtalk - Win32 (WCE SH4) Release Latin American dll" && "$(CFG)" != "CEtalk - Win32 (WCE SH4) Release English UK dll" && "$(CFG)" != "CEtalk - Win32 (WCE SH4) Release Spanish dll"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Release" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release Spanish" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release German" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release Latin American" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release English UK" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Release Spanish" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Release German" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Release Latin American" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Release English UK" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Debug English UK" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Debug Latin American" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Debug German" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Debug Spanish" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) debug" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Debug English UK" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Debug German" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Debug Spanish" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Debug Latin American" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Debug" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release English UK dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release Latin American dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release German dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release Spanish dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Release dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Release German dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Release English UK dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Release Spanish dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE SH3) Release Latin American dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Debug dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release Spanish" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release Latin American" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release English UK" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release German" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release Spanish dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release Latin American dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release English UK dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release German dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Debug Spanish dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Debug Latin American dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Debug English UK dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Debug German dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Debug" (based on "Win32 (WCE x86em) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Release" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Debug" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Release German" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Release Latin American" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Release Spanish" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Release English UK" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Release dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Release German dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Release English UK dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Release Spanish dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE ARM) Release Latin American dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "CEtalk - Win32 (WCE SH4) Release" (based on "Win32 (WCE SH4) Application")
!MESSAGE "CEtalk - Win32 (WCE SH4) Release English UK" (based on "Win32 (WCE SH4) Application")
!MESSAGE "CEtalk - Win32 (WCE SH4) Release Spanish" (based on "Win32 (WCE SH4) Application")
!MESSAGE "CEtalk - Win32 (WCE SH4) Release German" (based on "Win32 (WCE SH4) Application")
!MESSAGE "CEtalk - Win32 (WCE SH4) Release Latin American" (based on "Win32 (WCE SH4) Application")
!MESSAGE "CEtalk - Win32 (WCE SH4) Release dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE "CEtalk - Win32 (WCE SH4) Release German dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE "CEtalk - Win32 (WCE SH4) Release Latin American dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE "CEtalk - Win32 (WCE SH4) Release English UK dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE "CEtalk - Win32 (WCE SH4) Release Spanish dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release"

OUTDIR=.\build\static\mips\us\release
INTDIR=.\build\static\mips\us\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\us\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /force /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release"

OUTDIR=.\build\static\sh\us\release
INTDIR=.\build\static\sh\us\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\us\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish"

OUTDIR=.\build\static\mips\sp\release
INTDIR=.\build\static\mips\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\sp\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German"

OUTDIR=.\build\static\mips\gr\release
INTDIR=.\build\static\mips\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\gr\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American"

OUTDIR=.\build\static\mips\la\release
INTDIR=.\build\static\mips\la\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\la\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK"

OUTDIR=.\build\static\mips\uk\release
INTDIR=.\build\static\mips\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\uk\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish"

OUTDIR=.\build\static\sh\sp\release
INTDIR=.\build\static\sh\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x80a /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\sp\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German"

OUTDIR=.\build\static\sh\gr\release
INTDIR=.\build\static\sh\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x407 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\gr\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American"

OUTDIR=.\build\static\sh\la\release
INTDIR=.\build\static\sh\la\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0xc0a /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\la\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK"

OUTDIR=.\build\static\sh\uk\release
INTDIR=.\build\static\sh\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x809 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\uk\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug English UK"

OUTDIR=.\build\static\sh\uk\debug
INTDIR=.\build\static\sh\uk\debug\link
# Begin Custom Macros
OutDir=.\build\static\sh\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x809 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\uk\release\CE.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Latin American"

OUTDIR=.\build\static\sh\la\debug
INTDIR=.\build\static\sh\la\debug\link
# Begin Custom Macros
OutDir=.\build\static\sh\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0xc0a /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\la\release\CE.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug German"

OUTDIR=.\build\static\sh\gr\debug
INTDIR=.\build\static\sh\gr\debug\link
# Begin Custom Macros
OutDir=.\build\static\sh\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x407 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\gr\release\CE.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Spanish"

OUTDIR=.\build\static\sh\sp\debug
INTDIR=.\build\static\sh\sp\debug\link
# Begin Custom Macros
OutDir=.\build\static\sh\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x80a /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\sp\release\CE.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) debug"

OUTDIR=.\build\static\sh\us\debug
INTDIR=.\build\static\sh\us\debug\link
# Begin Custom Macros
OutDir=.\build\static\sh\us\debug\ 
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\us\debug\CE.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug English UK"

OUTDIR=.\build\static\mips\uk\debug
INTDIR=.\build\static\mips\uk\debug\link
# Begin Custom Macros
OutDir=.\build\static\mips\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x809 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "DEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\uk\debug\CE.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug German"

OUTDIR=.\build\static\mips\gr\debug
INTDIR=.\build\static\mips\gr\debug\link
# Begin Custom Macros
OutDir=.\build\static\mips\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x407 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "DEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\gr\debug\CE.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Spanish"

OUTDIR=.\build\static\mips\sp\debug
INTDIR=.\build\static\mips\sp\debug\link
# Begin Custom Macros
OutDir=.\build\static\mips\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x80a /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "DEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\sp\debug\CE.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Latin American"

OUTDIR=.\build\static\mips\la\debug
INTDIR=.\build\static\mips\la\debug\link
# Begin Custom Macros
OutDir=.\build\static\mips\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0xc0a /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "DEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\la\debug\CE.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug"

OUTDIR=.\build\static\mips\us\debug
INTDIR=.\build\static\mips\us\debug\link
# Begin Custom Macros
OutDir=.\build\static\mips\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\us\debug\CE.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll"

OUTDIR=.\build\dll\mips\us\release
INTDIR=.\build\dll\mips\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\us\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK dll"

OUTDIR=.\build\dll\mips\uk\release
INTDIR=.\build\dll\mips\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\uk\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American dll"

OUTDIR=.\build\dll\mips\la\release
INTDIR=.\build\dll\mips\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\la\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German dll"

OUTDIR=.\build\dll\mips\gr\release
INTDIR=.\build\dll\mips\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\gr\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish dll"

OUTDIR=.\build\dll\mips\sp\release
INTDIR=.\build\dll\mips\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\sp\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release dll"

OUTDIR=.\build\dll\sh\us\release
INTDIR=.\build\dll\sh\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\us\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German dll"

OUTDIR=.\build\dll\sh\gr\release
INTDIR=.\build\dll\sh\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x407 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\gr\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK dll"

OUTDIR=.\build\dll\sh\uk\release
INTDIR=.\build\dll\sh\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x809 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\uk\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish dll"

OUTDIR=.\build\dll\sh\sp\release
INTDIR=.\build\dll\sh\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x80a /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\sp\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American dll"

OUTDIR=.\build\dll\sh\la\release
INTDIR=.\build\dll\sh\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0xc0a /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH3" /d "_SH3_" /d "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\la\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release"

OUTDIR=.\build\static\x86em\us\release
INTDIR=.\build\static\x86em\us\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\us\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /force /out:"$(OUTDIR)\Dtalk_us.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll"

OUTDIR=.\build\dll\x86em\us\release
INTDIR=.\build\dll\x86em\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\us\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug dll"

OUTDIR=.\build\dll\x86em\us\debug
INTDIR=.\build\dll\x86em\us\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtalk_us.exe"
	-@erase "$(OUTDIR)\Dtalk_us.ilk"
	-@erase "$(OUTDIR)\Dtalk_us.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d "_DEBUG" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\us\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtalk_us.pdb" /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish"

OUTDIR=.\build\static\x86em\sp\release
INTDIR=.\build\static\x86em\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\sp\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American"

OUTDIR=.\build\static\x86em\la\release
INTDIR=.\build\static\x86em\la\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\la\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK"

OUTDIR=.\build\static\x86em\uk\release
INTDIR=.\build\static\x86em\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\uk\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German"

OUTDIR=.\build\static\x86em\gr\release
INTDIR=.\build\static\x86em\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\gr\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish dll"

OUTDIR=.\build\dll\x86em\sp\release
INTDIR=.\build\dll\x86em\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\sp\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American dll"

OUTDIR=.\build\dll\x86em\la\release
INTDIR=.\build\dll\x86em\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\la\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK dll"

OUTDIR=.\build\dll\x86em\uk\release
INTDIR=.\build\dll\x86em\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\uk\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German dll"

OUTDIR=.\build\dll\x86em\gr\release
INTDIR=.\build\dll\x86em\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\gr\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Spanish dll"

OUTDIR=.\build\dll\x86em\sp\debug
INTDIR=.\build\dll\x86em\sp\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"
	-@erase "$(OUTDIR)\Dtalk_sp.ilk"
	-@erase "$(OUTDIR)\Dtalk_sp.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d "_DEBUG" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\sp\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Latin American dll"

OUTDIR=.\build\dll\x86em\la\debug
INTDIR=.\build\dll\x86em\la\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtalk_la.exe"
	-@erase "$(OUTDIR)\Dtalk_la.ilk"
	-@erase "$(OUTDIR)\Dtalk_la.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d "_DEBUG" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\la\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtalk_la.pdb" /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug English UK dll"

OUTDIR=.\build\dll\x86em\uk\debug
INTDIR=.\build\dll\x86em\uk\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"
	-@erase "$(OUTDIR)\Dtalk_uk.ilk"
	-@erase "$(OUTDIR)\Dtalk_uk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d "_DEBUG" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\uk\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug German dll"

OUTDIR=.\build\dll\x86em\gr\debug
INTDIR=.\build\dll\x86em\gr\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"
	-@erase "$(OUTDIR)\Dtalk_gr.ilk"
	-@erase "$(OUTDIR)\Dtalk_gr.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d "_DEBUG" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\gr\release\dectalk.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug"

OUTDIR=.\build\static\x86em\us\debug
INTDIR=.\build\static\x86em\us\debug\link
# Begin Custom Macros
OutDir=.\build\static\x86em\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"
	-@erase "$(OUTDIR)\Dtalk_us.ilk"
	-@erase "$(OUTDIR)\Dtalk_us.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\us\release\dtstatic.lib  /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtalk_us.pdb" /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /windowsce:emulation  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release"

OUTDIR=.\build\static\arm\us\release
INTDIR=.\build\static\arm\us\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\us\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Debug"

OUTDIR=.\build\static\arm\us\debug
INTDIR=.\build\static\arm\us\debug\link
# Begin Custom Macros
OutDir=.\build\static\arm\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"
	-@erase "$(OUTDIR)\Dtalk_us.ilk"
	-@erase "$(OUTDIR)\Dtalk_us.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /Z7 /Od /I ".\..\..\dapi\src\api" /D "_DEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\us\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:yes /pdb:"$(OUTDIR)\Dtalk_us.pdb" /debug /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German"

OUTDIR=.\build\static\arm\gr\release
INTDIR=.\build\static\arm\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\gr\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American"

OUTDIR=.\build\static\arm\la\release
INTDIR=.\build\static\arm\la\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\la\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish"

OUTDIR=.\build\static\arm\sp\release
INTDIR=.\build\static\arm\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\sp\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK"

OUTDIR=.\build\static\arm\uk\release
INTDIR=.\build\static\arm\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\uk\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release dll"

OUTDIR=.\build\dll\arm\us\release
INTDIR=.\build\dll\arm\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\us\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German dll"

OUTDIR=.\build\dll\arm\gr\release
INTDIR=.\build\dll\arm\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\gr\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK dll"

OUTDIR=.\build\dll\arm\uk\release
INTDIR=.\build\dll\arm\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\uk\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish dll"

OUTDIR=.\build\dll\arm\sp\release
INTDIR=.\build\dll\arm\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\sp\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American dll"

OUTDIR=.\build\dll\arm\la\release
INTDIR=.\build\dll\arm\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\la\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release"

OUTDIR=.\build\static\sh4\us\release
INTDIR=.\build\static\sh4\us\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\us\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CEtalk.res"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK"

OUTDIR=.\build\static\sh4\uk\release
INTDIR=.\build\static\sh4\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\uk\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish"

OUTDIR=.\build\static\sh4\sp\release
INTDIR=.\build\static\sh4\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\sp\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German"

OUTDIR=.\build\static\sh4\gr\release
INTDIR=.\build\static\sh4\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\gr\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American"

OUTDIR=.\build\static\sh4\la\release
INTDIR=.\build\static\sh4\la\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\la\release\dtstatic.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release dll"

OUTDIR=.\build\dll\sh4\us\release
INTDIR=.\build\dll\sh4\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_us.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /GX- /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\us\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_us.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_us.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\Dtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German dll"

OUTDIR=.\build\dll\sh4\gr\release
INTDIR=.\build\dll\sh4\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_gr.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_gr.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /GX- /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x407 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\gr\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_gr.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_gr.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\Dtalk_gr.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American dll"

OUTDIR=.\build\dll\sh4\la\release
INTDIR=.\build\dll\sh4\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_la.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_la.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /GX- /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x407 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\la\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_la.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_la.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\Dtalk_la.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK dll"

OUTDIR=.\build\dll\sh4\uk\release
INTDIR=.\build\dll\sh4\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_uk.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_uk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /GX- /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x407 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\uk\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_uk.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_uk.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\Dtalk_uk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish dll"

OUTDIR=.\build\dll\sh4\sp\release
INTDIR=.\build\dll\sh4\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtalk_sp.exe"


CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\Dtalk_sp.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /GX- /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x407 /r /fo"$(INTDIR)\CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\sp\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtalk_sp.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtalk_sp.exe" /subsystem:windowsce,2.0  
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\Dtalk_sp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("CEtalk.dep")
!INCLUDE "CEtalk.dep"
!ELSE 
!MESSAGE Warning: cannot find "CEtalk.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug English UK" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Latin American" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug German" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Spanish" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) debug" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug English UK" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug German" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Spanish" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Latin American" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug" || "$(CFG)" ==\
 "CEtalk - Win32 (WCE MIPS) Release dll" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK dll" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American dll" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German dll" || "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish dll" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release dll" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German dll" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK dll" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish dll" || "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American dll" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug dll" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish dll" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American dll" || "$(CFG)" ==\
 "CEtalk - Win32 (WCE x86em) Release English UK dll" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German dll" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Spanish dll" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Latin American dll" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug English UK dll" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug German dll" || "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Debug" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release dll" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German dll" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK dll" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish dll" || "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American dll" || "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release" || "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK" || "$(CFG)" ==\
 "CEtalk - Win32 (WCE SH4) Release Spanish" || "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German" || "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American" || "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release dll" || "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German dll" || "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American dll" || "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK dll" || "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish dll"
SOURCE=.\CEtalk.cpp

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug English UK"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Latin American"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug German"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Spanish"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) debug"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug English UK"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug German"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Spanish"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Latin American"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Spanish dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Latin American dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug English UK dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug German dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Debug"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish dll"


"$(INTDIR)\CEtalk.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ENDIF 

SOURCE=.\CEtalk.rc

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug English UK"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Latin American"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug German"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Spanish"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) debug"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug English UK"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug German"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Spanish"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Latin American"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Spanish dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Latin American dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug English UK dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug German dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Debug"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish dll"


"$(INTDIR)\CEtalk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\CEtalkDlg.cpp

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug English UK"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Latin American"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug German"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Spanish"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) debug"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug English UK"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug German"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Spanish"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Latin American"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Spanish dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Latin American dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug English UK dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug German dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Debug"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish dll"


"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CEtalk.pch"


!ENDIF 

SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug English UK"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Latin American"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug German"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Debug Spanish"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) debug"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug English UK"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug German"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Spanish"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug Latin American"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Debug"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release English UK dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Latin American dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release German dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release Spanish dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release German dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release English UK dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Spanish dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH3) Release Latin American dll"

CPP_SWITCHES=/nologo /M$(CECrtMT) /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug dll"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Spanish dll"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release Latin American dll"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release English UK dll"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release German dll"

CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Spanish dll"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug Latin American dll"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug English UK dll"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug German dll"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_DEBUG" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Debug"

CPP_SWITCHES=/nologo /MTd /W3 /O2 /I ".\..\..\dapi\src\api" /D UNDER_CE=$(CEVersion) /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Debug"

CPP_SWITCHES=/nologo /MC /W3 /Z7 /Od /I ".\..\..\dapi\src\api" /D "_DEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release dll"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release German dll"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release English UK dll"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Spanish dll"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE ARM) Release Latin American dll"

CPP_SWITCHES=/nologo /MC /W3 /O2 /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release dll"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /GX- /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release German dll"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /GX- /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Latin American dll"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /GX- /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release English UK dll"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /GX- /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH4) Release Spanish dll"

CPP_SWITCHES=/nologo /Qsh4 /MC /W3 /GX- /I ".\..\..\dapi\src\api" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 


!ENDIF 

