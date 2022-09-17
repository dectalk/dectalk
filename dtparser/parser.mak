# Microsoft Developer Studio Generated NMAKE File, Based on parser.dsp
!IF "$(CFG)" == ""
CFG=parser - Win32 Debug
!MESSAGE No configuration specified. Defaulting to parser - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "parser - Win32 Release" && "$(CFG)" != "parser - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "parser.mak" CFG="parser - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "parser - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "parser - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "parser - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\parser.exe"

!ELSE 

ALL : "$(OUTDIR)\parser.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_test.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\parser.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /Ox /Ot /Oa /Ow /Og /D "WIN32" /D "NDEBUG" /D\
 "_CONSOLE" /D "_MBCS" /D "PARSER_STANDALONE_DEBUG" /D "TIMING" /D\
 "SINGLE_PRINT" /Fp"$(INTDIR)\parser.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"\
 /FD /c 
CPP_OBJS=.\Release/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\parser.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\parser.pdb" /machine:I386 /out:"$(OUTDIR)\parser.exe" 
LINK32_OBJS= \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\par_pars.obj" \
	"$(INTDIR)\par_test.obj"

"$(OUTDIR)\parser.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "parser - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\parser.exe"

!ELSE 

ALL : "$(OUTDIR)\parser.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_test.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\parser.exe"
	-@erase "$(OUTDIR)\parser.ilk"
	-@erase "$(OUTDIR)\parser.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "PARSER_STANDALONE_DEBUG" /D "DEBUG" /D "DEBUG2" /D\
 "SANITY_CHECKING" /Fp"$(INTDIR)\parser.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\parser.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)\parser.pdb" /debug /machine:I386 /out:"$(OUTDIR)\parser.exe"\
 /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\par_pars.obj" \
	"$(INTDIR)\par_test.obj"

"$(OUTDIR)\parser.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "parser - Win32 Release" || "$(CFG)" == "parser - Win32 Debug"
SOURCE=.\par_char.c

!IF  "$(CFG)" == "parser - Win32 Release"

DEP_CPP_PAR_C=\
	".\ls_lower.tab"\
	".\ls_upper.tab"\
	".\par_bin.h"\
	".\par_def.h"\
	".\port.h"\
	
CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /Ot /Oa /Ow /Og /D "WIN32" /D "NDEBUG" /D\
 "_CONSOLE" /D "_MBCS" /D "PARSER_STANDALONE_DEBUG" /D "TIMING" /D\
 "SINGLE_PRINT" /D "NO_PRINT" /Fp"$(INTDIR)\parser.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\par_char.obj" : $(SOURCE) $(DEP_CPP_PAR_C) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "parser - Win32 Debug"

DEP_CPP_PAR_C=\
	".\ls_lower.tab"\
	".\ls_upper.tab"\
	".\par_bin.h"\
	".\par_def.h"\
	".\port.h"\
	
CPP_SWITCHES=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D\
 "_CONSOLE" /D "_MBCS" /D "PARSER_STANDALONE_DEBUG" /D "DEBUG" /D "DEBUG2" /D\
 "SANITY_CHECKING" /Fp"$(INTDIR)\parser.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\par_char.obj" : $(SOURCE) $(DEP_CPP_PAR_C) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\par_pars.c

!IF  "$(CFG)" == "parser - Win32 Release"

DEP_CPP_PAR_P=\
	".\par_bin.h"\
	".\par_def.h"\
	".\port.h"\
	

"$(INTDIR)\par_pars.obj" : $(SOURCE) $(DEP_CPP_PAR_P) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "parser - Win32 Debug"

DEP_CPP_PAR_P=\
	".\par_bin.h"\
	".\par_def.h"\
	".\port.h"\
	

"$(INTDIR)\par_pars.obj" : $(SOURCE) $(DEP_CPP_PAR_P) "$(INTDIR)"


!ENDIF 

SOURCE=.\par_test.c

!IF  "$(CFG)" == "parser - Win32 Release"

DEP_CPP_PAR_T=\
	".\par_bin.h"\
	".\par_def.h"\
	".\par_test.h"\
	".\port.h"\
	

"$(INTDIR)\par_test.obj" : $(SOURCE) $(DEP_CPP_PAR_T) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "parser - Win32 Debug"

DEP_CPP_PAR_T=\
	".\par_bin.h"\
	".\par_def.h"\
	".\par_test.h"\
	".\port.h"\
	

"$(INTDIR)\par_test.obj" : $(SOURCE) $(DEP_CPP_PAR_T) "$(INTDIR)"


!ENDIF 


!ENDIF 

