# Microsoft Developer Studio Generated NMAKE File, Based on smitgen.dsp
!IF "$(CFG)" == ""
CFG=smitgen - Win32 Release
!MESSAGE No configuration specified. Defaulting to smitgen - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "smitgen - Win32 Release" && "$(CFG)" != "smitgen - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "smitgen.mak" CFG="smitgen - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "smitgen - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "smitgen - Win32 Debug" (based on "Win32 (x86) Console Application")
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

!IF  "$(CFG)" == "smitgen - Win32 Release"

OUTDIR=.\build\release
INTDIR=.\build\release\link
# Begin Custom Macros
OutDir=.\build\release
# End Custom Macros

ALL : "$(OUTDIR)\smitgen.exe"


CLEAN :
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\smitgen.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\smitgen.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /I "..\..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "TYPING_MODE" /Fp"$(INTDIR)\smitgen.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\smitgen.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\smitgen.pdb" /machine:I386 /out:"$(OUTDIR)\smitgen.exe" 
LINK32_OBJS= \
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\smitgen.obj"

"$(OUTDIR)\smitgen.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "smitgen - Win32 Debug"

OUTDIR=.\build\debug
INTDIR=.\build\debug\link
# Begin Custom Macros
OutDir=.\build\debug
# End Custom Macros

ALL : "$(OUTDIR)\smitgen.exe"


CLEAN :
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\smitgen.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\smitgen.exe"
	-@erase "$(OUTDIR)\smitgen.ilk"
	-@erase "$(OUTDIR)\smitgen.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I "..\..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "TYPING_MODE" /Fp"$(INTDIR)\smitgen.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\smitgen.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\smitgen.pdb" /debug /machine:I386 /out:"$(OUTDIR)\smitgen.exe" 
LINK32_OBJS= \
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\smitgen.obj"

"$(OUTDIR)\smitgen.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("smitgen.dep")
!INCLUDE "smitgen.dep"
!ELSE 
!MESSAGE Warning: cannot find "smitgen.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "smitgen - Win32 Release" || "$(CFG)" == "smitgen - Win32 Debug"
SOURCE=..\..\..\dapi\src\API\CRYPT2.C

"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\smitgen.c

"$(INTDIR)\smitgen.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

