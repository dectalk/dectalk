# Microsoft Developer Studio Generated NMAKE File, Based on MLDemo.dsp
!IF "$(CFG)" == ""
CFG=MLDemo - Win32 Release
!MESSAGE No configuration specified. Defaulting to MLDemo - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "MLDemo - Win32 Release" && "$(CFG)" != "MLDemo - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "MLDemo.mak" CFG="MLDemo - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "MLDemo - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "MLDemo - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "MLDemo - Win32 Release"

OUTDIR=.\Build\Release
INTDIR=.\Build\Release\link
# Begin Custom Macros
OutDir=.\Build\Release
# End Custom Macros

ALL : "$(OUTDIR)\MLDemo.exe"


CLEAN :
	-@erase "$(INTDIR)\MLDemo.obj"
	-@erase "$(INTDIR)\MLDemo.pch"
	-@erase "$(INTDIR)\MLDemo.res"
	-@erase "$(INTDIR)\MLDemoDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\MLDemo.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "\work\rnd\dapi\src\api" /I "..\..\dapi\src\api" /I "..\.." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\MLDemo.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\MLDemo.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\MLDemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\release\dectalk.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\MLDemo.pdb" /machine:I386 /out:"$(OUTDIR)\MLDemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\MLDemo.obj" \
	"$(INTDIR)\MLDemoDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\MLDemo.res"

"$(OUTDIR)\MLDemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "MLDemo - Win32 Debug"

OUTDIR=.\Build\Debug
INTDIR=.\Build\Debug\link
# Begin Custom Macros
OutDir=.\Build\Debug
# End Custom Macros

ALL : "$(OUTDIR)\MLDemo.exe"


CLEAN :
	-@erase "$(INTDIR)\MLDemo.obj"
	-@erase "$(INTDIR)\MLDemo.pch"
	-@erase "$(INTDIR)\MLDemo.res"
	-@erase "$(INTDIR)\MLDemoDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\MLDemo.exe"
	-@erase "$(OUTDIR)\MLDemo.ilk"
	-@erase "$(OUTDIR)\MLDemo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\.." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\MLDemo.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\MLDemo.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\MLDemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\debug\dectalk.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\MLDemo.pdb" /debug /machine:I386 /out:"$(OUTDIR)\MLDemo.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\MLDemo.obj" \
	"$(INTDIR)\MLDemoDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\MLDemo.res"

"$(OUTDIR)\MLDemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

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


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("MLDemo.dep")
!INCLUDE "MLDemo.dep"
!ELSE 
!MESSAGE Warning: cannot find "MLDemo.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "MLDemo - Win32 Release" || "$(CFG)" == "MLDemo - Win32 Debug"
SOURCE=.\MLDemo.cpp

"$(INTDIR)\MLDemo.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\MLDemo.pch"


SOURCE=.\MLDemo.rc

"$(INTDIR)\MLDemo.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\MLDemoDlg.cpp

"$(INTDIR)\MLDemoDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\MLDemo.pch"


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "MLDemo - Win32 Release"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "\work\rnd\dapi\src\api" /I "..\..\dapi\src\api" /I "..\.." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\MLDemo.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\MLDemo.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "MLDemo - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\.." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\MLDemo.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\MLDemo.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 


!ENDIF 

