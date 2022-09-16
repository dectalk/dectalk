# Microsoft Developer Studio Generated NMAKE File, Based on DTalkMLCE.dsp
!IF "$(CFG)" == ""
CFG=DTalkML - Win32 (WCE ARM) Debug
!MESSAGE No configuration specified. Defaulting to DTalkML - Win32 (WCE ARM) Debug.
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

!IF "$(CFG)" != "DTalkML - Win32 (WCE MIPS) Release" && "$(CFG)" != "DTalkML - Win32 (WCE MIPS) Debug" && "$(CFG)" != "DTalkML - Win32 (WCE x86em) Release" && "$(CFG)" != "DTalkML - Win32 (WCE x86em) Debug" && "$(CFG)" != "DTalkML - Win32 (WCE SH3) Release" && "$(CFG)" != "DTalkML - Win32 (WCE SH3) Debug" && "$(CFG)" != "DTalkML - Win32 (WCE ARM) Release" && "$(CFG)" != "DTalkML - Win32 (WCE ARM) Debug" && "$(CFG)" != "DTalkML - Win32 (WCE SH4) Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
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
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "DTalkML - Win32 (WCE MIPS) Release"

OUTDIR=.\..\Build\ce\mips\Release
INTDIR=.\..\Build\ce\mips\Release\link
# Begin Custom Macros
OutDir=.\..\Build\ce\mips\Release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WIN32" /Fp"$(INTDIR)\DTalkMLCE.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkMLCE.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=commctrl.lib coredll.lib  /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" /subsystem:$(CESubsystem)  
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE MIPS) Debug"

OUTDIR=.\..\Build\ce\mips\Debug
INTDIR=.\..\Build\ce\mips\Debug\link
# Begin Custom Macros
OutDir=.\..\Build\ce\mips\Debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtMT) /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WIN32" /Fp"$(INTDIR)\DTalkMLCE.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkMLCE.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=commctrl.lib coredll.lib  /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /machine:MIPS /nodefaultlib:"$(CENoDefaultLib)" /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" /subsystem:$(CESubsystem)  
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE x86em) Release"

OUTDIR=.\..\Build\ce\x86em\Release
INTDIR=.\..\Build\ce\x86em\Release\link
# Begin Custom Macros
OutDir=.\..\Build\ce\x86em\Release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fp"$(INTDIR)\DTalkMLCE.pch" /YX /Fo"$(INTDIR)\\" /c 

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
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkMLCE.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=commctrl.lib coredll.lib  /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:IX86 /nodefaultlib:"$(CENoDefaultLib)" /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" /windowsce:emulation  
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE x86em) Debug"

OUTDIR=.\..\Build\ce\x86em\debug
INTDIR=.\..\Build\ce\x86em\debug\link
# Begin Custom Macros
OutDir=.\..\Build\ce\x86em\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

EMPFILE=empfile.exe
CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /Z7 /Od /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /Fp"$(INTDIR)\DTalkMLCE.pch" /YX /Fo"$(INTDIR)\\" /c 

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
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkMLCE.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=commctrl.lib coredll.lib  /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /machine:IX86 /nodefaultlib:"$(CENoDefaultLib)" /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" /windowsce:emulation  
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH3) Release"

OUTDIR=.\..\Build\ce\sh\Release
INTDIR=.\..\Build\ce\sh\Release\link
# Begin Custom Macros
OutDir=.\..\Build\ce\sh\Release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrt) /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WIN32" /Fp"$(INTDIR)\DTalkMLCE.pch" /YX /Fo"$(INTDIR)\\" /c 

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
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkMLCE.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=commctrl.lib coredll.lib  /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" /subsystem:$(CESubsystem)  
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH3) Debug"

OUTDIR=.\..\Build\ce\sh\Debug
INTDIR=.\..\Build\ce\sh\Debug\link
# Begin Custom Macros
OutDir=.\..\Build\ce\sh\Debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

PFILE=pfile.exe
CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrt) /W3 /Z7 /Od /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_DEBUG" /Fp"$(INTDIR)\DTalkMLCE.pch" /YX /Fo"$(INTDIR)\\" /c 

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
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkMLCE.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=libcmt.lib commctrl.lib coredll.lib  /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /machine:SH3 /nodefaultlib:"$(CENoDefaultLib)" /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" /subsystem:$(CESubsystem)  
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE ARM) Release"

OUTDIR=.\..\Build\ce\arm\Release
INTDIR=.\..\Build\ce\arm\Release\link
# Begin Custom Macros
OutDir=.\..\Build\ce\arm\Release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D "WIN32" /D "ENGLISH" /D "ENGLISH_US" /D "UNICODE" /D "_USRDLL" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\DTalkMLCE.pch" /YX /Fo"$(INTDIR)\\" /c 

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
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkMLCE.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=commctrl.lib coredll.lib /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /align:"4096" /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" /subsystem:$(CESubsystem) 
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE ARM) Debug"

OUTDIR=.\..\Build\ce\arm\Debug
INTDIR=.\..\Build\ce\arm\Debug\link
# Begin Custom Macros
OutDir=.\..\Build\ce\arm\Debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /Z7 /Od /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=$(CEVersion) /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_DEBUG" /D "ARM" /D "_ARM_" /D "WIN32" /D "ENGLISH" /D "ENGLISH_US" /D "UNICODE" /D "_USRDLL" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\DTalkMLCE.pch" /YX /Fo"$(INTDIR)\\" /c 

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
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkMLCE.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=commctrl.lib coredll.lib /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /align:"4096" /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ARM /nodefaultlib:"$(CENoDefaultLib)" /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" /subsystem:$(CESubsystem) 
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH4) Release"

OUTDIR=.\..\Build\ce\sh4\Release
INTDIR=.\..\Build\ce\sh4\Release\link
# Begin Custom Macros
OutDir=.\..\Build\ce\sh4\Release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O1 /I "..\..\dapi\src\api\\" /I "..\.." /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "WIN32" /Fp"$(INTDIR)\DTalkMLCE.pch" /YX /Fo"$(INTDIR)\\" /c 

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
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkMLCE.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=commctrl.lib coredll.lib /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /align:"4096" /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" /subsystem:$(CESubsystem) 
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("DTalkMLCE.dep")
!INCLUDE "DTalkMLCE.dep"
!ELSE 
!MESSAGE Warning: cannot find "DTalkMLCE.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "DTalkML - Win32 (WCE MIPS) Release" || "$(CFG)" == "DTalkML - Win32 (WCE MIPS) Debug" || "$(CFG)" == "DTalkML - Win32 (WCE x86em) Release" || "$(CFG)" == "DTalkML - Win32 (WCE x86em) Debug" || "$(CFG)" == "DTalkML - Win32 (WCE SH3) Release" || "$(CFG)" == "DTalkML - Win32 (WCE SH3) Debug" || "$(CFG)" == "DTalkML - Win32 (WCE ARM) Release" || "$(CFG)" == "DTalkML - Win32 (WCE ARM) Debug" || "$(CFG)" == "DTalkML - Win32 (WCE SH4) Release"
SOURCE=.\dtalk_ml.c

!IF  "$(CFG)" == "DTalkML - Win32 (WCE MIPS) Release"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE MIPS) Debug"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE x86em) Release"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE x86em) Debug"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH3) Release"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH3) Debug"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE ARM) Release"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE ARM) Debug"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DTalkML - Win32 (WCE SH4) Release"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 


!ENDIF 

