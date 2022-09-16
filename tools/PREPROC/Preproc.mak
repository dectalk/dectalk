# Microsoft Developer Studio Generated NMAKE File, Based on Preproc.dsp
!IF "$(CFG)" == ""
CFG=preproc - Win32 ALPHA Debug
!MESSAGE No configuration specified. Defaulting to preproc - Win32 ALPHA Debug.
!ENDIF 

!IF "$(CFG)" != "preproc - Win32 Release" && "$(CFG)" != "preproc - Win32 Debug" && "$(CFG)" != "preproc - Win32 ALPHA Release" && "$(CFG)" != "preproc - Win32 ALPHA Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Preproc.mak" CFG="preproc - Win32 ALPHA Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "preproc - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "preproc - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "preproc - Win32 ALPHA Release" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "preproc - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

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

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /Fp"$(INTDIR)\Preproc.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /Fp"$(INTDIR)\Preproc.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

!ELSEIF  "$(CFG)" == "preproc - Win32 ALPHA Release"

OUTDIR=.\alpha\Release
INTDIR=.\alpha\Release\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Preproc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\Preproc.pdb" /machine:ALPHA /out:"$(OUTDIR)\Preproc.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "preproc - Win32 ALPHA Debug"

OUTDIR=.\alpha\debug
INTDIR=.\alpha\debug\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Preproc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\Preproc.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Preproc.exe" 
LINK32_OBJS= \
	

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Preproc.dep")
!INCLUDE "Preproc.dep"
!ELSE 
!MESSAGE Warning: cannot find "Preproc.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "preproc - Win32 Release" || "$(CFG)" == "preproc - Win32 Debug" || "$(CFG)" == "preproc - Win32 ALPHA Release" || "$(CFG)" == "preproc - Win32 ALPHA Debug"
SOURCE=.\Lists.c

!IF  "$(CFG)" == "preproc - Win32 Release"


"$(INTDIR)\Lists.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "preproc - Win32 Debug"


"$(INTDIR)\Lists.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "preproc - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "preproc - Win32 ALPHA Debug"

!ENDIF 

SOURCE=.\Preproc.c

!IF  "$(CFG)" == "preproc - Win32 Release"


"$(INTDIR)\Preproc.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "preproc - Win32 Debug"


"$(INTDIR)\Preproc.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "preproc - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "preproc - Win32 ALPHA Debug"

!ENDIF 


!ENDIF 

