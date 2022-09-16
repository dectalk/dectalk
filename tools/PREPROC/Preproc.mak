# Microsoft Developer Studio Generated NMAKE File, Based on Preproc.dsp
!IF "$(CFG)" == ""
CFG=preproc - Win32 Release
!MESSAGE No configuration specified. Defaulting to preproc - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "preproc - Win32 Release" && "$(CFG)" != "preproc - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Preproc.mak" CFG="preproc - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "preproc - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "preproc - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "preproc - Win32 Release"

OUTDIR=.\build\Release
INTDIR=.\build\Release\link
# Begin Custom Macros
OutDir=.\build\Release
# End Custom Macros

ALL : "$(OUTDIR)\Preproc.exe"


CLEAN :
	-@erase "$(INTDIR)\Lists.obj"
	-@erase "$(INTDIR)\Preproc.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Preproc.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /Fp"$(INTDIR)\Preproc.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Preproc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\Preproc.pdb" /machine:I386 /out:"$(OUTDIR)\Preproc.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Lists.obj" \
	"$(INTDIR)\Preproc.obj"

"$(OUTDIR)\Preproc.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "preproc - Win32 Debug"

OUTDIR=.\build\Debug
INTDIR=.\build\Debug\link
# Begin Custom Macros
OutDir=.\build\Debug
# End Custom Macros

ALL : "$(OUTDIR)\Preproc.exe"


CLEAN :
	-@erase "$(INTDIR)\Lists.obj"
	-@erase "$(INTDIR)\Preproc.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Preproc.exe"
	-@erase "$(OUTDIR)\Preproc.ilk"
	-@erase "$(OUTDIR)\Preproc.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /Fp"$(INTDIR)\Preproc.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Preproc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\Preproc.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Preproc.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Lists.obj" \
	"$(INTDIR)\Preproc.obj"

"$(OUTDIR)\Preproc.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("Preproc.dep")
!INCLUDE "Preproc.dep"
!ELSE 
!MESSAGE Warning: cannot find "Preproc.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "preproc - Win32 Release" || "$(CFG)" == "preproc - Win32 Debug"
SOURCE=.\Lists.c

"$(INTDIR)\Lists.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Preproc.c

"$(INTDIR)\Preproc.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

