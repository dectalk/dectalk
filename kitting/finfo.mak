# Microsoft Developer Studio Generated NMAKE File, Based on finfo.dsp
!IF "$(CFG)" == ""
CFG=Finfo - Win32 ALPHA Debug
!MESSAGE No configuration specified. Defaulting to Finfo - Win32 ALPHA Debug.
!ENDIF 

!IF "$(CFG)" != "Finfo - Win32 Release" && "$(CFG)" != "Finfo - Win32 Debug" && "$(CFG)" != "Finfo - Win32 ALPHA Release" && "$(CFG)" != "Finfo - Win32 ALPHA Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "finfo.mak" CFG="Finfo - Win32 ALPHA Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Finfo - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "Finfo - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "Finfo - Win32 ALPHA Release" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "Finfo - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "Finfo - Win32 Release"

OUTDIR=.\build\release
INTDIR=.\build\release\link
# Begin Custom Macros
OutDir=.\build\release
# End Custom Macros

ALL : "$(OUTDIR)\finfo.exe"


CLEAN :
	-@erase "$(INTDIR)\Finfo.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\finfo.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I "..\.." /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /Fp"$(INTDIR)\finfo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\finfo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\finfo.pdb" /machine:I386 /out:"$(OUTDIR)\finfo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Finfo.obj"

"$(OUTDIR)\finfo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Finfo - Win32 Debug"

OUTDIR=.\build\debug
INTDIR=.\build\debug\link
# Begin Custom Macros
OutDir=.\build\debug
# End Custom Macros

ALL : "$(OUTDIR)\finfo.exe"


CLEAN :
	-@erase "$(INTDIR)\Finfo.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\finfo.exe"
	-@erase "$(OUTDIR)\finfo.ilk"
	-@erase "$(OUTDIR)\finfo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I "..\.." /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /Fp"$(INTDIR)\finfo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\finfo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\finfo.pdb" /debug /machine:I386 /out:"$(OUTDIR)\finfo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Finfo.obj"

"$(OUTDIR)\finfo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Finfo - Win32 ALPHA Release"

OUTDIR=.\alpha\release
INTDIR=.\alpha\release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\finfo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\finfo.pdb" /machine:ALPHA /out:"$(OUTDIR)\finfo.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "Finfo - Win32 ALPHA Debug"

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\finfo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\finfo.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\finfo.exe" 
LINK32_OBJS= \
	

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("finfo.dep")
!INCLUDE "finfo.dep"
!ELSE 
!MESSAGE Warning: cannot find "finfo.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Finfo - Win32 Release" || "$(CFG)" == "Finfo - Win32 Debug" || "$(CFG)" == "Finfo - Win32 ALPHA Release" || "$(CFG)" == "Finfo - Win32 ALPHA Debug"
SOURCE=.\Finfo.c

!IF  "$(CFG)" == "Finfo - Win32 Release"


"$(INTDIR)\Finfo.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Finfo - Win32 Debug"


"$(INTDIR)\Finfo.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Finfo - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "Finfo - Win32 ALPHA Debug"

!ENDIF 


!ENDIF 

