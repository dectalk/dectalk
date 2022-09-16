# Microsoft Developer Studio Generated NMAKE File, Based on windic.dsp
!IF "$(CFG)" == ""
CFG=windic - Win32 (WCE MIPS) Debug
!MESSAGE No configuration specified. Defaulting to windic - Win32 (WCE MIPS) Debug.
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

!IF "$(CFG)" != "windic - Win32 (WCE MIPS) Release" && "$(CFG)" != "windic - Win32 (WCE MIPS) Debug" && "$(CFG)" != "windic - Win32 (WCE SH4) Release" && "$(CFG)" != "windic - Win32 (WCE SH3) Release" && "$(CFG)" != "windic - Win32 (WCE SH3) Debug" && "$(CFG)" != "windic - Win32 (WCE ARM) Release" && "$(CFG)" != "windic - Win32 (WCE ARM) Debug" && "$(CFG)" != "windic - Win32 (WCE x86em) Release" && "$(CFG)" != "windic - Win32 (WCE x86em) Debug" && "$(CFG)" != "windic - Win32 (WCE ARM) Release German" && "$(CFG)" != "windic - Win32 (WCE ARM) Release Latin American" && "$(CFG)" != "windic - Win32 (WCE ARM) Release Spanish" && "$(CFG)" != "windic - Win32 (WCE MIPS) Release English UK" && "$(CFG)" != "windic - Win32 (WCE MIPS) Release Latin American" && "$(CFG)" != "windic - Win32 (WCE MIPS) Release German" && "$(CFG)" != "windic - Win32 (WCE MIPS) Release Spanish" && "$(CFG)" != "windic - Win32 (WCE SH4) Release English UK" && "$(CFG)" != "windic - Win32 (WCE SH4) Release Spanish" && "$(CFG)" != "windic - Win32 (WCE SH4) Release German" && "$(CFG)" != "windic - Win32 (WCE SH4) Debug Latin American" && "$(CFG)" != "windic - Win32 (WCE SH4) Debug Spanish" && "$(CFG)" !=\
 "windic - Win32 (WCE SH4) Debug " && "$(CFG)" != "windic - Win32 (WCE ARM) Release DLL" && "$(CFG)" != "windic - Win32 (WCE ARM) Release Spanish DLL" && "$(CFG)" != "windic - Win32 (WCE ARM) Release German DLL" && "$(CFG)" != "windic - Win32 (WCE MIPS) Release English UK DLL" && "$(CFG)" != "windic - Win32 (WCE MIPS) Release Latin American DLL" && "$(CFG)" != "windic - Win32 (WCE MIPS) Release Spanish DLL" && "$(CFG)" != "windic - Win32 (WCE MIPS) Release German DLL" && "$(CFG)" != "windic - Win32 (WCE x86em) Release DLL" && "$(CFG)" != "windic - Win32 (WCE SH3) Release DLL" && "$(CFG)" != "windic - Win32 (WCE SH3) Release English UK DLL" && "$(CFG)" != "windic - Win32 (WCE SH3) Release Latin American DLL" && "$(CFG)" != "windic - Win32 (WCE SH3) Release Spanish DLL" && "$(CFG)" != "windic - Win32 (WCE SH3) Release German DLL" && "$(CFG)" != "windic - Win32 (WCE SH4) Release DLL" && "$(CFG)" != "windic - Win32 (WCE SH4) Release English UK DLL" && "$(CFG)" != "windic - Win32 (WCE SH4) Release Latin American DLL" && "$(CFG)" != "windic - Win32 (WCE SH4) Release Spanish DLL" && "$(CFG)" != "windic - Win32 (WCE SH4) Release German DLL" && "$(CFG)" !=\
 "windic - Win32 (WCE ARM) Release Latin American DLL" && "$(CFG)" != "windic - Win32 (WCE x86em) Debug DLL" && "$(CFG)" != "windic - Win32 (WCE x86em) Release Spanish" && "$(CFG)" != "windic - Win32 (WCE x86em) Release Latin American" && "$(CFG)" != "windic - Win32 (WCE x86em) Release English UK" && "$(CFG)" != "windic - Win32 (WCE x86em) Release German" && "$(CFG)" != "windic - Win32 (WCE x86em) Release Spanish DLL" && "$(CFG)" != "windic - Win32 (WCE x86em) Release Latin American DLL" && "$(CFG)" != "windic - Win32 (WCE x86em) Release English UK DLL" && "$(CFG)" != "windic - Win32 (WCE x86em) Release German DLL" && "$(CFG)" != "windic - Win32 (WCE SH3) Release English UK" && "$(CFG)" != "windic - Win32 (WCE SH3) Release German" && "$(CFG)" != "windic - Win32 (WCE SH3) Release Latin American" && "$(CFG)" != "windic - Win32 (WCE SH3) Release Spanish" && "$(CFG)" != "windic - Win32 (WCE SH4) Release Latin American" && "$(CFG)" != "windic - Win32 (WCE ARM) Release English UK" && "$(CFG)" != "windic - Win32 (WCE ARM) Release English UK DLL" && "$(CFG)" != "windic - Win32 (WCE MIPS) Release DLL"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "windic - Win32 (WCE MIPS) Release" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "windic - Win32 (WCE MIPS) Debug" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "windic - Win32 (WCE SH4) Release" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE SH3) Release" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE SH3) Debug" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE ARM) Release" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE ARM) Debug" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE x86em) Release" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE x86em) Debug" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE ARM) Release German" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE ARM) Release Latin American" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE ARM) Release Spanish" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE MIPS) Release English UK" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "windic - Win32 (WCE MIPS) Release Latin American" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "windic - Win32 (WCE MIPS) Release German" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "windic - Win32 (WCE MIPS) Release Spanish" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "windic - Win32 (WCE SH4) Release English UK" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE SH4) Release Spanish" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE SH4) Release German" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE SH4) Debug Latin American" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE SH4) Debug Spanish" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE SH4) Debug " (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE ARM) Release DLL" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE ARM) Release Spanish DLL" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE ARM) Release German DLL" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE MIPS) Release English UK DLL" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "windic - Win32 (WCE MIPS) Release Latin American DLL" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "windic - Win32 (WCE MIPS) Release Spanish DLL" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "windic - Win32 (WCE MIPS) Release German DLL" (based on "Win32 (WCE MIPS) Application")
!MESSAGE "windic - Win32 (WCE x86em) Release DLL" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE SH3) Release DLL" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE SH3) Release English UK DLL" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE SH3) Release Latin American DLL" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE SH3) Release Spanish DLL" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE SH3) Release German DLL" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE SH4) Release DLL" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE SH4) Release English UK DLL" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE SH4) Release Latin American DLL" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE SH4) Release Spanish DLL" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE SH4) Release German DLL" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE ARM) Release Latin American DLL" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE x86em) Debug DLL" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE x86em) Release Spanish" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE x86em) Release Latin American" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE x86em) Release English UK" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE x86em) Release German" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE x86em) Release Spanish DLL" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE x86em) Release Latin American DLL" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE x86em) Release English UK DLL" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE x86em) Release German DLL" (based on "Win32 (WCE x86em) Application")
!MESSAGE "windic - Win32 (WCE SH3) Release English UK" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE SH3) Release German" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE SH3) Release Latin American" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE SH3) Release Spanish" (based on "Win32 (WCE SH3) Application")
!MESSAGE "windic - Win32 (WCE SH4) Release Latin American" (based on "Win32 (WCE SH4) Application")
!MESSAGE "windic - Win32 (WCE ARM) Release English UK" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE ARM) Release English UK DLL" (based on "Win32 (WCE ARM) Application")
!MESSAGE "windic - Win32 (WCE MIPS) Release DLL" (based on "Win32 (WCE MIPS) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release"

OUTDIR=.\build\static\mips\us\release
INTDIR=.\build\static\mips\us\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\us\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Debug"

OUTDIR=.\build\static\mips\us\debug
INTDIR=.\build\static\mips\us\debug\link
# Begin Custom Macros
OutDir=.\build\static\mips\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMTDebug) /W3 /Zi /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "DEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\us\debug\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release"

OUTDIR=.\build\static\sh4\us\release
INTDIR=.\build\static\sh4\us\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "SHx" /D "SH4" /D "_SH4_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\us\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release"

OUTDIR=.\build\static\sh\us\release
INTDIR=.\build\static\sh\us\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\us\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Debug"

OUTDIR=.\build\static\sh\us\debug
INTDIR=.\build\static\sh\us\debug\link
# Begin Custom Macros
OutDir=.\build\static\sh\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMTDebug) /W3 /Zi /Od /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "DEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\us\debug\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release"

OUTDIR=.\build\static\arm\us\release
INTDIR=.\build\static\arm\us\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "ARM" /D "_ARM_" /D "NDEBUG" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\us\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Debug"

OUTDIR=.\build\static\arm\us\debug
INTDIR=.\build\static\arm\us\debug\link
# Begin Custom Macros
OutDir=.\build\static\arm\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /Zi /Od /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "DEBUG" /D "ARM" /D "_ARM_" /D "_MBCS" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "DEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\us\debug\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release"

OUTDIR=.\build\static\x86em\us\release
INTDIR=.\build\static\x86em\us\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\us\release\dtstatic.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Debug"

OUTDIR=.\build\static\x86em\us\debug
INTDIR=.\build\static\x86em\us\debug\link
# Begin Custom Macros
OutDir=.\build\static\x86em\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /Zi /Od /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "ENGLISH_US" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "_DEBUG" /d "x86" /d "i486" /d "_x86_" 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\us\debug\dtstatic.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release German"

OUTDIR=.\build\static\arm\gr\release
INTDIR=.\build\static\arm\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windicStatic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "ARM" /D "_ARM_" /D "$(CEConfigName)" /D "NDEBUG" /D "GERMAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windicStatic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\gr\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windicStatic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Latin American"

OUTDIR=.\build\static\arm\la\release
INTDIR=.\build\static\arm\la\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\la\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "ARM" /D "_ARM_" /D "$(CEConfigName)" /D "SPANISH" /D "SPANISH_LA" /D "LATIN_AMERICAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\la\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Spanish"

OUTDIR=.\build\static\arm\sp\release
INTDIR=.\build\static\arm\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "ARM" /D "_ARM_" /D "$(CEConfigName)" /D "SPANISH" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\sp\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release English UK"

OUTDIR=.\build\static\mips\uk\release
INTDIR=.\build\static\mips\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_UK" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\uk\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Latin American"

OUTDIR=.\build\static\mips\la\release
INTDIR=.\build\static\mips\la\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\la\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "$(CEConfigName)" /D "SPANISH" /D "SPANISH_LA" /D "LATIN_AMERICAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\la\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release German"

OUTDIR=.\build\static\mips\gr\release
INTDIR=.\build\static\mips\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "$(CEConfigName)" /D "NDEBUG" /D "GERMAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\gr\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Spanish"

OUTDIR=.\build\static\mips\sp\release
INTDIR=.\build\static\mips\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\mips\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "$(CEConfigName)" /D "SPANISH" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\mips\sp\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release English UK"

OUTDIR=.\build\static\sh4\uk\release
INTDIR=.\build\static\sh4\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "SHx" /D "SH4" /D "_SH4_" /D "NDEBUG" /D "ENGLISH_UK" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\uk\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Spanish"

OUTDIR=.\build\static\sh4\sp\release
INTDIR=.\build\static\sh4\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D "SPANISH" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\sp\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release German"

OUTDIR=.\build\static\sh4\gr\release
INTDIR=.\build\static\sh4\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "SHx" /D "SH4" /D "_SH4_" /D "$(CEConfigName)" /D "NDEBUG" /D "GERMAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\gr\release\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug Latin American"

OUTDIR=.\build\static\sh4\la\debug
INTDIR=.\build\static\sh4\la\debug\link
# Begin Custom Macros
OutDir=.\build\static\sh4\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windicStatic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /Zi /Od /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "DEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D "$(CEConfigName)" /D "LATIN_AMERICAN" /D "SPANISH" /D "SPANISH_LA" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windicStatic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "DEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\la\debug\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windicStatic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug Spanish"

OUTDIR=.\build\static\sh4\sp\debug
INTDIR=.\build\static\sh4\sp\debug\link
# Begin Custom Macros
OutDir=.\build\static\sh4\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /Zi /Od /Ob1 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "DEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D "$(CEConfigName)" /D "SPANISH" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "DEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\sp\debug\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug "

OUTDIR=.\build\dll\mips\us\release
INTDIR=.\build\dll\mips\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"
	-@erase ".\build\static\sh4\us\debug\link\windicStatic.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /Zi /Od /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "DEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D "ENGLISH_US" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo".\build\static\sh4\us\debug\link/windicStatic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "DEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\us\debug\dtstatic.lib commctrl.lib coredll.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	".\build\static\sh4\us\debug\link\windicStatic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release DLL"

OUTDIR=.\build\dll\arm\us\release
INTDIR=.\build\dll\arm\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "ARM" /D "_ARM_" /D "NDEBUG" /D "ENGLISH_US" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\us\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Spanish DLL"

OUTDIR=.\build\dll\arm\sp\release
INTDIR=.\build\dll\arm\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "ARM" /D "_ARM_" /D "$(CEConfigName)" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\sp\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release German DLL"

OUTDIR=.\build\dll\arm\gr\release
INTDIR=.\build\dll\arm\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "ARM" /D "_ARM_" /D "$(CEConfigName)" /D "NDEBUG" /D "GERMAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\gr\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release English UK DLL"

OUTDIR=.\build\dll\mips\uk\release
INTDIR=.\build\dll\mips\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_UK" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\uk\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Latin American DLL"

OUTDIR=.\build\dll\mips\la\release
INTDIR=.\build\dll\mips\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\la\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "NDEBUG" /D "$(CEConfigName)" /D "SPANISH" /D "SPANISH_LA" /D "LATIN_AMERICAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\la\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Spanish DLL"

OUTDIR=.\build\dll\mips\sp\release
INTDIR=.\build\dll\mips\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "NDEBUG" /D "$(CEConfigName)" /D "SPANISH" /D "SPANISH_SP" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\sp\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release German DLL"

OUTDIR=.\build\dll\mips\gr\release
INTDIR=.\build\dll\mips\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "NDEBUG" /D "$(CEConfigName)" /D "GERMAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\gr\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release DLL"

OUTDIR=.\build\dll\x86em\us\release
INTDIR=.\build\dll\x86em\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\us\release\dectalk.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release DLL"

OUTDIR=.\build\dll\sh\us\release
INTDIR=.\build\dll\sh\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\us\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release English UK DLL"

OUTDIR=.\build\dll\sh\uk\release
INTDIR=.\build\dll\sh\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_UK" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\uk\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Latin American DLL"

OUTDIR=.\build\dll\sh\la\release
INTDIR=.\build\dll\sh\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\la\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "LATIN_AMERICAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\la\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Spanish DLL"

OUTDIR=.\build\dll\sh\sp\release
INTDIR=.\build\dll\sh\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\sp\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release German DLL"

OUTDIR=.\build\dll\sh\gr\release
INTDIR=.\build\dll\sh\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "NDEBUG" /D "GERMAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh\gr\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release DLL"

OUTDIR=.\build\dll\sh4\us\release
INTDIR=.\build\dll\sh4\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "SHx" /D "SH4" /D "_SH4_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\us\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release English UK DLL"

OUTDIR=.\build\dll\sh4\uk\release
INTDIR=.\build\dll\sh4\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "SHx" /D "SH4" /D "_SH4_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_UK" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\uk\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Latin American DLL"

OUTDIR=.\build\dll\sh4\la\release
INTDIR=.\build\dll\sh4\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\la\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "SHx" /D "SH4" /D "_SH4_" /D "_MBCS" /D "NDEBUG" /D "SPANISH" /D "LATIN_AMERICAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\la\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Spanish DLL"

OUTDIR=.\build\dll\sh4\sp\release
INTDIR=.\build\dll\sh4\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "SHx" /D "SH4" /D "_SH4_" /D "_MBCS" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\sp\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release German DLL"

OUTDIR=.\build\dll\sh4\gr\release
INTDIR=.\build\dll\sh4\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\sh4\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "SHx" /D "SH4" /D "_SH4_" /D "_MBCS" /D "NDEBUG" /D "GERMAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\sh4\gr\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Latin American DLL"

OUTDIR=.\build\dll\arm\la\release
INTDIR=.\build\dll\arm\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\la\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windicStatic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "ARM" /D "_ARM_" /D "$(CEConfigName)" /D "SPANISH" /D "SPANISH_LA" /D "LATIN_AMERICAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windicStatic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\la\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windicStatic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Debug DLL"

OUTDIR=.\build\dell\x86em\us\debug
INTDIR=.\build\dll\x86em\us\debug\link
# Begin Custom Macros
OutDir=.\build\dell\x86em\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /Zi /Od /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "ENGLISH_US" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "_DEBUG" /d "x86" /d "i486" /d "_x86_" 
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\us\debug\dtstatic.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Spanish"

OUTDIR=.\build\static\x86em\sp\release
INTDIR=.\build\static\x86em\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "NDEBUG" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\sp\release\dtstatic.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Latin American"

OUTDIR=.\build\static\x86em\la\release
INTDIR=.\build\static\x86em\la\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\la\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "NDEBUG" /D "SPANISH" /D "LATIN_AMERICAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\la\release\dtstatic.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release English UK"

OUTDIR=.\build\static\x86em\uk\release
INTDIR=.\build\static\x86em\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_UK" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\uk\release\dtstatic.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release German"

OUTDIR=.\build\static\x86em\gr\release
INTDIR=.\build\static\x86em\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\x86em\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "NDEBUG" /D "GERMAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\x86em\gr\release\dtstatic.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Spanish DLL"

OUTDIR=.\build\dll\x86em\sp\release
INTDIR=.\build\dll\x86em\sp\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "NDEBUG" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\sp\release\dectalk.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Latin American DLL"

OUTDIR=.\build\dll\x86em\la\release
INTDIR=.\build\dll\x86em\la\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\la\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "LATIN_AMERICAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\la\release\dectalk.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release English UK DLL"

OUTDIR=.\build\dll\x86em\uk\release
INTDIR=.\build\dll\x86em\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_UK" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\uk\release\dectalk.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release German DLL"

OUTDIR=.\build\dll\x86em\gr\release
INTDIR=.\build\dll\x86em\gr\release\link
# Begin Custom Macros
OutDir=.\build\dll\x86em\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "_UNICODE" /D "WIN32" /D "STRICT" /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "NDEBUG" /D "GERMAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d UNDER_CE=$(CEVersion) /d "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\x86em\uk\release\dectalk.lib coredll.lib commctrl.lib /nologo /stack:0x10000,0x1000 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release English UK"

OUTDIR=.\build\static\sh\uk\release
INTDIR=.\build\static\sh\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_UK" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\uk\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release German"

OUTDIR=.\build\static\sh\gr\release
INTDIR=.\build\static\sh\gr\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "NDEBUG" /D "GERMAN" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\gr\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Latin American"

OUTDIR=.\build\static\sh\la\release
INTDIR=.\build\static\sh\la\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\la\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /D "SPANISH" /D "SPANISH_LA" /D "LATIN_AMERICAN" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\la\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Spanish"

OUTDIR=.\build\static\sh\sp\release
INTDIR=.\build\static\sh\sp\release\link
# Begin Custom Macros
OutDir=.\build\static\sh\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "SHx" /D "SH3" /D "_SH3_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH3" /d "_SH3_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh\sp\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Latin American"

OUTDIR=.\build\static\sh4\la\release
INTDIR=.\build\static\sh4\la\release\link
# Begin Custom Macros
OutDir=.\build\static\sh4\la\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "$(CEConfigName)" /D "SHx" /D "SH4" /D "_SH4_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\sh4\la\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release English UK"

OUTDIR=.\build\static\arm\uk\release
INTDIR=.\build\static\arm\uk\release\link
# Begin Custom Macros
OutDir=.\build\static\arm\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase ".\build\static\arm\us\release\link\windicStatic.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "ARM" /D "_ARM_" /D "NDEBUG" /D "ENGLISH_UK" /D "WINDIC_C_STATIC" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo".\build\static\arm\us\release\link/windicStatic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cestatic\arm\uk\release\dtstatic.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	".\build\static\arm\us\release\link\windicStatic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release English UK DLL"

OUTDIR=.\build\dll\arm\uk\release
INTDIR=.\build\dll\arm\uk\release\link
# Begin Custom Macros
OutDir=.\build\dll\arm\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "ARM" /D "_ARM_" /D "NDEBUG" /D "ENGLISH_UK" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "ARM" /d "_ARM_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\arm\uk\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /align:"4096" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release DLL"

OUTDIR=.\build\dll\mips\us\release
INTDIR=.\build\dll\mips\us\release\link
# Begin Custom Macros
OutDir=.\build\dll\mips\us\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "MIPS" /D "_MIPS_" /D "_MBCS" /D "NDEBUG" /D "ENGLISH_US" /D "$(CEConfigName)" /D _WIN32_WCE=$(CEVersion) /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\windic.res" /d "MIPS" /d "_MIPS_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\dapi\build\cedll\mips\us\release\dectalk.lib coredll.lib commctrl.lib /nologo /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\windic.exe" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("windic.dep")
!INCLUDE "windic.dep"
!ELSE 
!MESSAGE Warning: cannot find "windic.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "windic - Win32 (WCE MIPS) Release" || "$(CFG)" == "windic - Win32 (WCE MIPS) Debug" || "$(CFG)" == "windic - Win32 (WCE SH4) Release" || "$(CFG)" == "windic - Win32 (WCE SH3) Release" || "$(CFG)" == "windic - Win32 (WCE SH3) Debug" || "$(CFG)" == "windic - Win32 (WCE ARM) Release" || "$(CFG)" == "windic - Win32 (WCE ARM) Debug" || "$(CFG)" == "windic - Win32 (WCE x86em) Release" || "$(CFG)" == "windic - Win32 (WCE x86em) Debug" || "$(CFG)" == "windic - Win32 (WCE ARM) Release German" || "$(CFG)" == "windic - Win32 (WCE ARM) Release Latin American" || "$(CFG)" == "windic - Win32 (WCE ARM) Release Spanish" || "$(CFG)" == "windic - Win32 (WCE MIPS) Release English UK" || "$(CFG)" == "windic - Win32 (WCE MIPS) Release Latin American" || "$(CFG)" == "windic - Win32 (WCE MIPS) Release German" || "$(CFG)" == "windic - Win32 (WCE MIPS) Release Spanish" || "$(CFG)" == "windic - Win32 (WCE SH4) Release English UK" || "$(CFG)" == "windic - Win32 (WCE SH4) Release Spanish" || "$(CFG)" == "windic - Win32 (WCE SH4) Release German" || "$(CFG)" == "windic - Win32 (WCE SH4) Debug Latin American" || "$(CFG)" == "windic - Win32 (WCE SH4) Debug Spanish" || "$(CFG)" ==\
 "windic - Win32 (WCE SH4) Debug " || "$(CFG)" == "windic - Win32 (WCE ARM) Release DLL" || "$(CFG)" == "windic - Win32 (WCE ARM) Release Spanish DLL" || "$(CFG)" == "windic - Win32 (WCE ARM) Release German DLL" || "$(CFG)" == "windic - Win32 (WCE MIPS) Release English UK DLL" || "$(CFG)" == "windic - Win32 (WCE MIPS) Release Latin American DLL" || "$(CFG)" == "windic - Win32 (WCE MIPS) Release Spanish DLL" || "$(CFG)" == "windic - Win32 (WCE MIPS) Release German DLL" || "$(CFG)" == "windic - Win32 (WCE x86em) Release DLL" || "$(CFG)" == "windic - Win32 (WCE SH3) Release DLL" || "$(CFG)" == "windic - Win32 (WCE SH3) Release English UK DLL" || "$(CFG)" == "windic - Win32 (WCE SH3) Release Latin American DLL" || "$(CFG)" == "windic - Win32 (WCE SH3) Release Spanish DLL" || "$(CFG)" == "windic - Win32 (WCE SH3) Release German DLL" || "$(CFG)" == "windic - Win32 (WCE SH4) Release DLL" || "$(CFG)" == "windic - Win32 (WCE SH4) Release English UK DLL" || "$(CFG)" == "windic - Win32 (WCE SH4) Release Latin American DLL" || "$(CFG)" == "windic - Win32 (WCE SH4) Release Spanish DLL" || "$(CFG)" == "windic - Win32 (WCE SH4) Release German DLL" || "$(CFG)" ==\
 "windic - Win32 (WCE ARM) Release Latin American DLL" || "$(CFG)" == "windic - Win32 (WCE x86em) Debug DLL" || "$(CFG)" == "windic - Win32 (WCE x86em) Release Spanish" || "$(CFG)" == "windic - Win32 (WCE x86em) Release Latin American" || "$(CFG)" == "windic - Win32 (WCE x86em) Release English UK" || "$(CFG)" == "windic - Win32 (WCE x86em) Release German" || "$(CFG)" == "windic - Win32 (WCE x86em) Release Spanish DLL" || "$(CFG)" == "windic - Win32 (WCE x86em) Release Latin American DLL" || "$(CFG)" == "windic - Win32 (WCE x86em) Release English UK DLL" || "$(CFG)" == "windic - Win32 (WCE x86em) Release German DLL" || "$(CFG)" == "windic - Win32 (WCE SH3) Release English UK" || "$(CFG)" == "windic - Win32 (WCE SH3) Release German" || "$(CFG)" == "windic - Win32 (WCE SH3) Release Latin American" || "$(CFG)" == "windic - Win32 (WCE SH3) Release Spanish" || "$(CFG)" == "windic - Win32 (WCE SH4) Release Latin American" || "$(CFG)" == "windic - Win32 (WCE ARM) Release English UK" || "$(CFG)" == "windic - Win32 (WCE ARM) Release English UK DLL" || "$(CFG)" == "windic - Win32 (WCE MIPS) Release DLL"
SOURCE=.\usedic.cpp

!IF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Debug"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Debug"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Debug"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Debug"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release German"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Latin American"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Spanish"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release English UK"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Latin American"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release German"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Spanish"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release English UK"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Spanish"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release German"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug Latin American"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug Spanish"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug "


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Spanish DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release German DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release English UK DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Latin American DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Spanish DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release German DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release English UK DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Latin American DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Spanish DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release German DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release English UK DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Latin American DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Spanish DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release German DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Latin American DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Debug DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Spanish"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Latin American"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release English UK"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release German"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Spanish DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Latin American DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release English UK DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release German DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release English UK"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release German"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Latin American"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Spanish"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Latin American"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release English UK"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release English UK DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release DLL"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\windic.cpp

!IF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Debug"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Debug"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Debug"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Debug"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release German"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Latin American"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Spanish"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release English UK"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Latin American"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release German"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Spanish"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release English UK"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Spanish"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release German"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug Latin American"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug Spanish"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug "


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Spanish DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release German DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release English UK DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Latin American DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Spanish DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release German DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release English UK DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Latin American DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Spanish DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release German DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release English UK DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Latin American DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Spanish DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release German DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Latin American DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Debug DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Spanish"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Latin American"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release English UK"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release German"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Spanish DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Latin American DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release English UK DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release German DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release English UK"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release German"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Latin American"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Spanish"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Latin American"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release English UK"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release English UK DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release DLL"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\windic.rc

!IF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Debug"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Debug"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Debug"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Debug"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release German"


"$(INTDIR)\windicStatic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Latin American"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Spanish"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release English UK"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Latin American"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release German"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Spanish"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release English UK"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Spanish"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release German"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug Latin American"


"$(INTDIR)\windicStatic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug Spanish"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Debug "


".\build\static\sh4\us\debug\link\windicStatic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Spanish DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release German DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release English UK DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Latin American DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release Spanish DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release German DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release English UK DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Latin American DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Spanish DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release German DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release English UK DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Latin American DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Spanish DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release German DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release Latin American DLL"


"$(INTDIR)\windicStatic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Debug DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Spanish"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Latin American"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release English UK"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release German"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Spanish DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release Latin American DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release English UK DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE x86em) Release German DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release English UK"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release German"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Latin American"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH3) Release Spanish"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE SH4) Release Latin American"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release English UK"


".\build\static\arm\us\release\link\windicStatic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE ARM) Release English UK DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "windic - Win32 (WCE MIPS) Release DLL"


"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

