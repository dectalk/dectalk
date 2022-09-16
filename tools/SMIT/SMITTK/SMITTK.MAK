# Microsoft Developer Studio Generated NMAKE File, Based on smittk.dsp
!IF "$(CFG)" == ""
CFG=smittk - Win32 ALPHA Debug
!MESSAGE No configuration specified. Defaulting to smittk - Win32 ALPHA Debug.
!ENDIF 

!IF "$(CFG)" != "smittk - Win32 Release" && "$(CFG)" != "smittk - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "smittk.mak" CFG="smittk - Win32 ALPHA Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "smittk - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "smittk - Win32 Debug" (based on "Win32 (x86) Console Application")
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

!IF  "$(CFG)" == "smittk - Win32 Release"

OUTDIR=.\build\release
INTDIR=.\build\release\link
# Begin Custom Macros
OutDir=.\build\release
# End Custom Macros

ALL : "$(OUTDIR)\smittk.exe"


CLEAN :
	-@erase "$(INTDIR)\smitrun.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\smittk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /Fp"$(INTDIR)\smittk.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\smittk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\smittk.pdb" /machine:I386 /out:"$(OUTDIR)\smittk.exe" 
LINK32_OBJS= \
	"$(INTDIR)\smitrun.obj"

"$(OUTDIR)\smittk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "smittk - Win32 Debug"

OUTDIR=.\build\debug
INTDIR=.\build\debug\link
# Begin Custom Macros
OutDir=.\build\debug
# End Custom Macros

ALL : "$(OUTDIR)\smittk.exe"


CLEAN :
	-@erase "$(INTDIR)\smitrun.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\smittk.exe"
	-@erase "$(OUTDIR)\smittk.ilk"
	-@erase "$(OUTDIR)\smittk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /Fp"$(INTDIR)\smittk.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\smittk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\smittk.pdb" /debug /machine:I386 /out:"$(OUTDIR)\smittk.exe" 
LINK32_OBJS= \
	"$(INTDIR)\smitrun.obj"

"$(OUTDIR)\smittk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("smittk.dep")
!INCLUDE "smittk.dep"
!ELSE 
!MESSAGE Warning: cannot find "smittk.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "smittk - Win32 Release" || "$(CFG)" == "smittk - Win32 Debug"
SOURCE=.\smitrun.c

"$(INTDIR)\smitrun.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\smittk.c

!ENDIF 

