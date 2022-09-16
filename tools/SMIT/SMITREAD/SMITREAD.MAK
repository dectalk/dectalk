# Microsoft Developer Studio Generated NMAKE File, Based on smitread.dsp
!IF "$(CFG)" == ""
CFG=smitread - Win32 Release
!MESSAGE No configuration specified. Defaulting to smitread - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "smitread - Win32 Release" && "$(CFG)" != "smitread - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "smitread.mak" CFG="smitread - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "smitread - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "smitread - Win32 Debug" (based on "Win32 (x86) Console Application")
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

!IF  "$(CFG)" == "smitread - Win32 Release"

OUTDIR=.\build\release
INTDIR=.\build\release\link
# Begin Custom Macros
OutDir=.\build\release
# End Custom Macros

ALL : "$(OUTDIR)\smitread.exe"


CLEAN :
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\smitread.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\smitread.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /I "..\..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "TYPING_MODE" /Fp"$(INTDIR)\smitread.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\smitread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\smitread.pdb" /machine:I386 /out:"$(OUTDIR)\smitread.exe" 
LINK32_OBJS= \
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\smitread.obj"

"$(OUTDIR)\smitread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "smitread - Win32 Debug"

OUTDIR=.\build\debug
INTDIR=.\build\debug\link
# Begin Custom Macros
OutDir=.\build\debug
# End Custom Macros

ALL : "$(OUTDIR)\smitread.exe"


CLEAN :
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\smitread.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\smitread.exe"
	-@erase "$(OUTDIR)\smitread.ilk"
	-@erase "$(OUTDIR)\smitread.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I "..\..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "TYPING_MODE" /Fp"$(INTDIR)\smitread.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\smitread.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\smitread.pdb" /debug /machine:I386 /out:"$(OUTDIR)\smitread.exe" 
LINK32_OBJS= \
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\smitread.obj"

"$(OUTDIR)\smitread.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("smitread.dep")
!INCLUDE "smitread.dep"
!ELSE 
!MESSAGE Warning: cannot find "smitread.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "smitread - Win32 Release" || "$(CFG)" == "smitread - Win32 Debug"
SOURCE=..\..\..\dapi\src\API\CRYPT2.C

"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\smitread.c

"$(INTDIR)\smitread.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

