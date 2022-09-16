# Microsoft Developer Studio Generated NMAKE File, Based on Dtsample.dsp
!IF "$(CFG)" == ""
CFG=Dtsample - Win32 (WCE MIPS) Release
!MESSAGE No configuration specified. Defaulting to Dtsample - Win32 (WCE MIPS) Release.
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

!IF "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Release" && "$(CFG)" != "Dtsample - Win32 (WCE SH3) Release" && "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release Spanish" && "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release English UK" && "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release Latin American" && "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release German" && "$(CFG)" != "Dtsample - Win32 (WCE SH3) Release German" && "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release Dll" && "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release Spanish Dll" && "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release German Dll" && "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release English UK Dll" && "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release Latin American Dll" && "$(CFG)" != "Dtsample - Win32 (WCE SH3) Release Dll" && "$(CFG)" != "Dtsample - Win32 (WCE SH3) Release German Dll" && "$(CFG)" != "Dtsample - Win32 (WCE SH3) Release English UK" && "$(CFG)" != "Dtsample - Win32 (WCE SH3) Release Spanish" && "$(CFG)" != "Dtsample - Win32 (WCE SH3) Release Latin American" && "$(CFG)" != "Dtsample - Win32 (WCE SH3) Release Spanish Dll" && "$(CFG)" !=\
 "Dtsample - Win32 (WCE SH3) Release Latin American Dll" && "$(CFG)" != "Dtsample - Win32 (WCE SH3) Release English UK Dll" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Debug" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Release Dll" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Debug Dll" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Release Spanish" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Release Latin American" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Release English UK" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Release German" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Release Spanish Dll" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Release Latin American Dll" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Release English UK Dll" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Release German Dll" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Debug Spanish Dll" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Debug Latin American Dll" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Debug English UK Dll" && "$(CFG)" != "Dtsample - Win32 (WCE x86em) Debug German Dll" && "$(CFG)" != "Dtsample - Win32 (WCE ARM) Release" && "$(CFG)" != "Dtsample - Win32 (WCE ARM) Release dll" &&\
 "$(CFG)" != "Dtsample - Win32 (WCE ARM) Release Spanish dll" && "$(CFG)" != "Dtsample - Win32 (WCE ARM) Release Latin American dll" && "$(CFG)" != "Dtsample - Win32 (WCE ARM) Release English UK dll" && "$(CFG)" != "Dtsample - Win32 (WCE ARM) Release German dll" && "$(CFG)" != "Dtsample - Win32 (WCE ARM) Release German" && "$(CFG)" != "Dtsample - Win32 (WCE ARM) Release Latin American" && "$(CFG)" != "Dtsample - Win32 (WCE ARM) Release English UK" && "$(CFG)" != "Dtsample - Win32 (WCE ARM) Release Spanish" && "$(CFG)" != "Dtsample - Win32 (WCE SH4) Release" && "$(CFG)" != "Dtsample - Win32 (WCE SH4) Release German" && "$(CFG)" != "Dtsample - Win32 (WCE SH4) Release English UK" && "$(CFG)" != "Dtsample - Win32 (WCE SH4) Release Spanish" && "$(CFG)" != "Dtsample - Win32 (WCE SH4) Release Latin American" && "$(CFG)" != "Dtsample - Win32 (WCE SH4) Release Dll" && "$(CFG)" != "Dtsample - Win32 (WCE SH4) Release German Dll" && "$(CFG)" != "Dtsample - Win32 (WCE SH4) Release English UK Dll" && "$(CFG)" != "Dtsample - Win32 (WCE SH4) Release Spanish Dll" && "$(CFG)" != "Dtsample - Win32 (WCE SH4) Release Latin American Dll"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE SH3) Release" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release Spanish" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release English UK" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release Latin American" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release German" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE SH3) Release German" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release Dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release Spanish Dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release German Dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release English UK Dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release Latin American Dll" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE SH3) Release Dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Dtsample - Win32 (WCE SH3) Release German Dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Dtsample - Win32 (WCE SH3) Release English UK" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Dtsample - Win32 (WCE SH3) Release Spanish" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Dtsample - Win32 (WCE SH3) Release Latin American" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Dtsample - Win32 (WCE SH3) Release Spanish Dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Dtsample - Win32 (WCE SH3) Release Latin American Dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Dtsample - Win32 (WCE SH3) Release English UK Dll" (based on "Win32 (WCE SH3) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Debug" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release Dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Debug Dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release Spanish" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release Latin American" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release English UK" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release German" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release Spanish Dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release Latin American Dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release English UK Dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release German Dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Debug Spanish Dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Debug Latin American Dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Debug English UK Dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Debug German Dll" (based on "Win32 (WCE x86em) Application")
!MESSAGE "Dtsample - Win32 (WCE ARM) Release" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Dtsample - Win32 (WCE ARM) Release dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Dtsample - Win32 (WCE ARM) Release Spanish dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Dtsample - Win32 (WCE ARM) Release Latin American dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Dtsample - Win32 (WCE ARM) Release English UK dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Dtsample - Win32 (WCE ARM) Release German dll" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Dtsample - Win32 (WCE ARM) Release German" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Dtsample - Win32 (WCE ARM) Release Latin American" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Dtsample - Win32 (WCE ARM) Release English UK" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Dtsample - Win32 (WCE ARM) Release Spanish" (based on "Win32 (WCE ARM) Application")
!MESSAGE "Dtsample - Win32 (WCE SH4) Release" (based on "Win32 (WCE SH4) Application")
!MESSAGE "Dtsample - Win32 (WCE SH4) Release German" (based on "Win32 (WCE SH4) Application")
!MESSAGE "Dtsample - Win32 (WCE SH4) Release English UK" (based on "Win32 (WCE SH4) Application")
!MESSAGE "Dtsample - Win32 (WCE SH4) Release Spanish" (based on "Win32 (WCE SH4) Application")
!MESSAGE "Dtsample - Win32 (WCE SH4) Release Latin American" (based on "Win32 (WCE SH4) Application")
!MESSAGE "Dtsample - Win32 (WCE SH4) Release Dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE "Dtsample - Win32 (WCE SH4) Release German Dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE "Dtsample - Win32 (WCE SH4) Release English UK Dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE "Dtsample - Win32 (WCE SH4) Release Spanish Dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE "Dtsample - Win32 (WCE SH4) Release Latin American Dll" (based on "Win32 (WCE SH4) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release"

OUTDIR=.\build\static\mips\us\release
INTDIR=.\build\static\mips\us\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\us\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release"

OUTDIR=.\build\static\x86em\us\release
INTDIR=.\build\static\x86em\us\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\us\release\dtstatic.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release"

OUTDIR=.\build\static\sh\us\release
INTDIR=.\build\static\sh\us\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\us\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Spanish"

OUTDIR=.\build\static\mips\sp\release
INTDIR=.\build\static\mips\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\sp\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release English UK"

OUTDIR=.\build\static\mips\uk\release
INTDIR=.\build\static\mips\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\uk\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Latin American"

OUTDIR=.\build\static\mips\la\release
INTDIR=.\build\static\mips\la\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\la\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release German"

OUTDIR=.\build\static\mips\gr\release
INTDIR=.\build\static\mips\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\gr\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release German"

OUTDIR=.\build\static\sh\gr\release
INTDIR=.\build\static\sh\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\gr\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Dll"

OUTDIR=.\build\dll\mips\us\release
INTDIR=.\build\dll\mips\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\us\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Spanish Dll"

OUTDIR=.\build\dll\mips\sp\release
INTDIR=.\build\dll\mips\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\sp\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release German Dll"

OUTDIR=.\build\dll\mips\gr\release
INTDIR=.\build\dll\mips\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\gr\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release English UK Dll"

OUTDIR=.\build\dll\mips\uk\release
INTDIR=.\build\dll\mips\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\uk\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Latin American Dll"

OUTDIR=.\build\dll\mips\la\release
INTDIR=.\build\dll\mips\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\la\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Dll"

OUTDIR=.\build\dll\sh\us\release
INTDIR=.\build\dll\sh\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\us\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release German Dll"

OUTDIR=.\build\dll\sh\gr\release
INTDIR=.\build\dll\sh\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\gr\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release English UK"

OUTDIR=.\build\static\sh\uk\release
INTDIR=.\build\static\sh\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\uk\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Spanish"

OUTDIR=.\build\static\sh\sp\release
INTDIR=.\build\static\sh\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\sp\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Latin American"

OUTDIR=.\build\static\sh\la\release
INTDIR=.\build\static\sh\la\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\la\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Spanish Dll"

OUTDIR=.\build\dll\sh\sp\release
INTDIR=.\build\dll\sh\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\sp\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Latin American Dll"

OUTDIR=.\build\dll\sh\la\release
INTDIR=.\build\dll\sh\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\la\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release English UK Dll"

OUTDIR=.\build\dll\sh\uk\release
INTDIR=.\build\dll\sh\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\uk\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib" /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug"

OUTDIR=.\build\static\x86em\us\debug
INTDIR=.\build\static\x86em\us\debug\link
# Begin Custom Macros
OutDir=.\build\static\x86em\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\us\debug\dtstatic.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Dll"

OUTDIR=.\build\dll\x86em\us\release
INTDIR=.\build\dll\x86em\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\us\release\dectalk.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Dll"

OUTDIR=.\build\dll\x86em\us\debug
INTDIR=.\build\dll\x86em\us\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\us\release\dectalk.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Spanish"

OUTDIR=.\build\static\x86em\sp\release
INTDIR=.\build\static\x86em\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\sp\release\dtstatic.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Latin American"

OUTDIR=.\build\static\x86em\la\release
INTDIR=.\build\static\x86em\la\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\la\release\dtstatic.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release English UK"

OUTDIR=.\build\static\x86em\uk\release
INTDIR=.\build\static\x86em\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\uk\release\dtstatic.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release German"

OUTDIR=.\build\static\x86em\gr\release
INTDIR=.\build\static\x86em\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\gr\release\dtstatic.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Spanish Dll"

OUTDIR=.\build\dll\x86em\sp\release
INTDIR=.\build\dll\x86em\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\sp\release\dectalk.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Latin American Dll"

OUTDIR=.\build\dll\x86em\la\release
INTDIR=.\build\dll\x86em\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\la\release\dectalk.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release English UK Dll"

OUTDIR=.\build\dll\x86em\uk\release
INTDIR=.\build\dll\x86em\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\uk\release\dectalk.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release German Dll"

OUTDIR=.\build\dll\x86em\gr\release
INTDIR=.\build\dll\x86em\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\gr\release\dectalk.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Spanish Dll"

OUTDIR=.\build\dll\x86em\sp\debug
INTDIR=.\build\dll\x86em\sp\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\sp\release\dectalk.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Latin American Dll"

OUTDIR=.\build\dll\x86em\la\debug
INTDIR=.\build\dll\x86em\la\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\la\release\dectalk.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug English UK Dll"

OUTDIR=.\build\dll\x86em\uk\debug
INTDIR=.\build\dll\x86em\uk\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\uk\release\dectalk.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug German Dll"

OUTDIR=.\build\dll\x86em\gr\debug
INTDIR=.\build\dll\x86em\gr\debug\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\gr\release\dectalk.lib commctrl.lib coredll.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release"

OUTDIR=.\build\static\arm\us\release
INTDIR=.\build\static\arm\us\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\us\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release dll"

OUTDIR=.\build\dll\arm\us\release
INTDIR=.\build\dll\arm\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\us\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Spanish dll"

OUTDIR=.\build\dll\arm\sp\release
INTDIR=.\build\dll\arm\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\sp\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Latin American dll"

OUTDIR=.\build\dll\arm\la\release
INTDIR=.\build\dll\arm\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\la\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release English UK dll"

OUTDIR=.\build\dll\arm\uk\release
INTDIR=.\build\dll\arm\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\uk\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release German dll"

OUTDIR=.\build\dll\arm\gr\release
INTDIR=.\build\dll\arm\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\gr\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release German"

OUTDIR=.\build\static\arm\gr\release
INTDIR=.\build\static\arm\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\gr\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Latin American"

OUTDIR=.\build\static\arm\la\release
INTDIR=.\build\static\arm\la\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\la\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release English UK"

OUTDIR=.\build\static\arm\uk\release
INTDIR=.\build\static\arm\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\uk\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Spanish"

OUTDIR=.\build\static\arm\sp\release
INTDIR=.\build\static\arm\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\sp\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release"

OUTDIR=.\build\static\sh4\us\release
INTDIR=.\build\static\sh4\us\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\us\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release German"

OUTDIR=.\build\static\sh4\gr\release
INTDIR=.\build\static\sh4\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\gr\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release English UK"

OUTDIR=.\build\static\sh4\uk\release
INTDIR=.\build\static\sh4\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\uk\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Spanish"

OUTDIR=.\build\static\sh4\sp\release
INTDIR=.\build\static\sh4\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\sp\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Latin American"

OUTDIR=.\build\static\sh4\la\release
INTDIR=.\build\static\sh4\la\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\la\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Dll"

OUTDIR=.\build\dll\sh4\us\release
INTDIR=.\build\dll\sh4\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\us\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release German Dll"

OUTDIR=.\build\dll\sh4\gr\release
INTDIR=.\build\dll\sh4\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\gr\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release English UK Dll"

OUTDIR=.\build\dll\sh4\uk\release
INTDIR=.\build\dll\sh4\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\uk\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Spanish Dll"

OUTDIR=.\build\dll\sh4\sp\release
INTDIR=.\build\dll\sh4\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\sp\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Latin American Dll"

OUTDIR=.\build\dll\sh4\la\release
INTDIR=.\build\dll\sh4\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\la\release\dectalk.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Dtsample.dep")
!INCLUDE "Dtsample.dep"
!ELSE 
!MESSAGE Warning: cannot find "Dtsample.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release" || "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release" || "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Spanish" || "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release English UK" || "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Latin American" || "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release German" || "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release German" || "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Dll" || "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Spanish Dll" || "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release German Dll" || "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release English UK Dll" || "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Latin American Dll" || "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Dll" || "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release German Dll" || "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release English UK" || "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Spanish" || "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Latin American" || "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Spanish Dll" || "$(CFG)" ==\
 "Dtsample - Win32 (WCE SH3) Release Latin American Dll" || "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release English UK Dll" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Dll" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Dll" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Spanish" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Latin American" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release English UK" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release German" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Spanish Dll" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Latin American Dll" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release English UK Dll" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release German Dll" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Spanish Dll" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Latin American Dll" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug English UK Dll" || "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug German Dll" || "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release" || "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release dll" ||\
 "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Spanish dll" || "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Latin American dll" || "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release English UK dll" || "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release German dll" || "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release German" || "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Latin American" || "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release English UK" || "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Spanish" || "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release" || "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release German" || "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release English UK" || "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Spanish" || "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Latin American" || "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Dll" || "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release German Dll" || "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release English UK Dll" || "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Spanish Dll" || "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Latin American Dll"
SOURCE=.\dtsample.c

!IF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Spanish"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release English UK"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Latin American"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release German"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release German"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Spanish Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release German Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release English UK Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Latin American Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release German Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release English UK"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Spanish"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Latin American"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Spanish Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Latin American Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release English UK Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Spanish"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Latin American"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release English UK"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release German"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Spanish Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Latin American Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release English UK Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release German Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Spanish Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Latin American Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug English UK Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug German Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Spanish dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Latin American dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release English UK dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release German dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release German"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Latin American"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release English UK"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Spanish"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release German"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release English UK"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Spanish"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Latin American"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release German Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release English UK Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Spanish Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Latin American Dll"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\dtsample.rc

!IF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Spanish"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release English UK"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Latin American"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release German"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release German"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Spanish Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release German Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release English UK Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Latin American Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release German Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release English UK"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Spanish"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Latin American"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Spanish Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release Latin American Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH3) Release English UK Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Spanish"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Latin American"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release English UK"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release German"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Spanish Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Latin American Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release English UK Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release German Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Spanish Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug Latin American Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug English UK Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Debug German Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Spanish dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Latin American dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release English UK dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release German dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release German"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Latin American"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release English UK"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE ARM) Release Spanish"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release German"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release English UK"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Spanish"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Latin American"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release German Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release English UK Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Spanish Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH4) Release Latin American Dll"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

