# Microsoft Developer Studio Generated NMAKE File, Based on envpatch.dsp
!IF "$(CFG)" == ""
CFG=envpatch - Win32 Release
!MESSAGE No configuration specified. Defaulting to envpatch - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "envpatch - Win32 Release" && "$(CFG)" != "envpatch - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "envpatch.mak" CFG="envpatch - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "envpatch - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "envpatch - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "envpatch - Win32 Release"

OUTDIR=.\build\Release
INTDIR=.\build\Release\link
# Begin Custom Macros
OutDir=.\build\Release
# End Custom Macros

ALL : "$(OUTDIR)\envpatch.exe"


CLEAN :
	-@erase "$(INTDIR)\envpatch.obj"
	-@erase "$(INTDIR)\envpatch.pch"
	-@erase "$(INTDIR)\envpatch.res"
	-@erase "$(INTDIR)\envpatchDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\envpatch.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ENV_PATCH" /Fp"$(INTDIR)\envpatch.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\envpatch.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\envpatch.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\envpatch.pdb" /machine:I386 /out:"$(OUTDIR)\envpatch.exe" 
LINK32_OBJS= \
	"$(INTDIR)\envpatch.obj" \
	"$(INTDIR)\envpatchDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\envpatch.res"

"$(OUTDIR)\envpatch.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "envpatch - Win32 Debug"

OUTDIR=.\build\Debug
INTDIR=.\build\Debug\link
# Begin Custom Macros
OutDir=.\build\Debug
# End Custom Macros

ALL : "$(OUTDIR)\envpatch.exe"


CLEAN :
	-@erase "$(INTDIR)\envpatch.obj"
	-@erase "$(INTDIR)\envpatch.pch"
	-@erase "$(INTDIR)\envpatch.res"
	-@erase "$(INTDIR)\envpatchDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\envpatch.exe"
	-@erase "$(OUTDIR)\envpatch.ilk"
	-@erase "$(OUTDIR)\envpatch.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "ENV_PATCH" /Fp"$(INTDIR)\envpatch.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\envpatch.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\envpatch.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\envpatch.pdb" /debug /machine:I386 /out:"$(OUTDIR)\envpatch.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\envpatch.obj" \
	"$(INTDIR)\envpatchDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\envpatch.res"

"$(OUTDIR)\envpatch.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("envpatch.dep")
!INCLUDE "envpatch.dep"
!ELSE 
!MESSAGE Warning: cannot find "envpatch.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "envpatch - Win32 Release" || "$(CFG)" == "envpatch - Win32 Debug"
SOURCE=.\envpatch.cpp

"$(INTDIR)\envpatch.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\envpatch.pch"


SOURCE=.\envpatch.rc

"$(INTDIR)\envpatch.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\envpatchDlg.cpp

"$(INTDIR)\envpatchDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\envpatch.pch"


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "envpatch - Win32 Release"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ENV_PATCH" /Fp"$(INTDIR)\envpatch.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\envpatch.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "envpatch - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "ENV_PATCH" /Fp"$(INTDIR)\envpatch.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\envpatch.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 


!ENDIF 

