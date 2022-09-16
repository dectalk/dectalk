# Microsoft Developer Studio Generated NMAKE File, Based on vercheck.dsp
!IF "$(CFG)" == ""
CFG=vercheck - Win32 Release
!MESSAGE No configuration specified. Defaulting to vercheck - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "vercheck - Win32 Release" && "$(CFG)" != "vercheck - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "vercheck.mak" CFG="vercheck - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "vercheck - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "vercheck - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "vercheck - Win32 Release"

OUTDIR=.\Build\Release
INTDIR=.\Build\Release\Link
# Begin Custom Macros
OutDir=.\Build\Release
# End Custom Macros

ALL : "$(OUTDIR)\vercheck.exe"


CLEAN :
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\VerCheck.obj"
	-@erase "$(INTDIR)\VerCheck.res"
	-@erase "$(INTDIR)\VerCheckDlg.obj"
	-@erase "$(OUTDIR)\vercheck.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\vercheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\VerCheck.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\vercheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\vercheck.pdb" /machine:I386 /out:"$(OUTDIR)\vercheck.exe" 
LINK32_OBJS= \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\VerCheck.obj" \
	"$(INTDIR)\VerCheckDlg.obj" \
	"$(INTDIR)\VerCheck.res"

"$(OUTDIR)\vercheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "vercheck - Win32 Debug"

OUTDIR=.\build\Debug
INTDIR=.\build\Debug\link
# Begin Custom Macros
OutDir=.\build\Debug
# End Custom Macros

ALL : "$(OUTDIR)\vercheck.exe"


CLEAN :
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\VerCheck.obj"
	-@erase "$(INTDIR)\VerCheck.res"
	-@erase "$(INTDIR)\VerCheckDlg.obj"
	-@erase "$(OUTDIR)\vercheck.exe"
	-@erase "$(OUTDIR)\vercheck.ilk"
	-@erase "$(OUTDIR)\vercheck.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\vercheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\VerCheck.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\vercheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\vercheck.pdb" /debug /machine:I386 /out:"$(OUTDIR)\vercheck.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\VerCheck.obj" \
	"$(INTDIR)\VerCheckDlg.obj" \
	"$(INTDIR)\VerCheck.res"

"$(OUTDIR)\vercheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("vercheck.dep")
!INCLUDE "vercheck.dep"
!ELSE 
!MESSAGE Warning: cannot find "vercheck.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "vercheck - Win32 Release" || "$(CFG)" == "vercheck - Win32 Debug"
SOURCE=.\StdAfx.cpp

"$(INTDIR)\StdAfx.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\VerCheck.cpp

"$(INTDIR)\VerCheck.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\VerCheck.rc

"$(INTDIR)\VerCheck.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\VerCheckDlg.cpp

"$(INTDIR)\VerCheckDlg.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

