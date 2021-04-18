# Microsoft Developer Studio Generated NMAKE File, Based on dic.dsp
!IF "$(CFG)" == ""
CFG=dic - Win32 Debug French
!MESSAGE No configuration specified. Defaulting to dic - Win32 Debug French.
!ENDIF 

!IF "$(CFG)" != "dic - Win32 Release" && "$(CFG)" != "dic - Win32 Debug" && "$(CFG)" != "dic - Win32 Release Spanish" && "$(CFG)" != "dic - Win32 Release German" && "$(CFG)" != "dic - Win32 Debug Spanish" && "$(CFG)" != "dic - Win32 Debug German" && "$(CFG)" != "dic - Win32 Debug Latin American" && "$(CFG)" != "dic - Win32 Release Latin American" && "$(CFG)" != "dic - Win32 Release United Kingdom" && "$(CFG)" != "dic - Win32 Debug United Kingdom" && "$(CFG)" != "dic - Win32 Release French" && "$(CFG)" != "dic - Win32 Debug French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dic.mak" CFG="dic - Win32 Debug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dic - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release German" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug German" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release French" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug French" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "dic - Win32 Release"

OUTDIR=.\..\build\dtalkdic\us\Release
INTDIR=.\..\build\dtalkdic\us\Release\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\us\Release
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Debug"

OUTDIR=.\..\build\dtalkdic\us\debug
INTDIR=.\..\build\dtalkdic\us\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Release Spanish"

OUTDIR=.\..\build\dtalkdic\sp\Release
INTDIR=.\..\build\dtalkdic\sp\Release\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\sp\Release
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Release German"

OUTDIR=.\..\build\dtalkdic\gr\Release
INTDIR=.\..\build\dtalkdic\gr\Release\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\gr\Release
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Debug Spanish"

OUTDIR=.\..\build\dtalkdic\sp\debug
INTDIR=.\..\build\dtalkdic\sp\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Debug German"

OUTDIR=.\..\build\dtalkdic\gr\debug
INTDIR=.\..\build\dtalkdic\gr\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "_DEBUG" /D "GERMAN" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Debug Latin American"

OUTDIR=.\..\build\dtalkdic\la\debug
INTDIR=.\..\build\dtalkdic\la\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "LATIN_AMERICAN" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Release Latin American"

OUTDIR=.\..\build\dtalkdic\la\Release
INTDIR=.\..\build\dtalkdic\la\Release\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\la\Release
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Release United Kingdom"

OUTDIR=.\..\build\dtalkdic\uk\Release
INTDIR=.\..\build\dtalkdic\uk\Release\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\uk\Release
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Debug United Kingdom"

OUTDIR=.\..\build\dtalkdic\uk\debug
INTDIR=.\..\build\dtalkdic\uk\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Release French"

OUTDIR=.\..\build\dtalkdic\fr\Release
INTDIR=.\..\build\dtalkdic\fr\Release\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\fr\Release
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "NDEBUG" /D "FRENCH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Debug French"

OUTDIR=.\..\build\dtalkdic\fr\debug
INTDIR=.\..\build\dtalkdic\fr\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtalkdic\fr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dic.exe"


CLEAN :
	-@erase "$(INTDIR)\Dic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I ".\nt" /I ".\api" /I "..\.." /D "_DEBUG" /D "FRENCH" /D "_CONSOLE" /D "WINDIC" /D "WIN32" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("dic.dep")
!INCLUDE "dic.dep"
!ELSE 
!MESSAGE Warning: cannot find "dic.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "dic - Win32 Release" || "$(CFG)" == "dic - Win32 Debug" || "$(CFG)" == "dic - Win32 Release Spanish" || "$(CFG)" == "dic - Win32 Release German" || "$(CFG)" == "dic - Win32 Debug Spanish" || "$(CFG)" == "dic - Win32 Debug German" || "$(CFG)" == "dic - Win32 Debug Latin American" || "$(CFG)" == "dic - Win32 Release Latin American" || "$(CFG)" == "dic - Win32 Release United Kingdom" || "$(CFG)" == "dic - Win32 Debug United Kingdom" || "$(CFG)" == "dic - Win32 Release French" || "$(CFG)" == "dic - Win32 Debug French"
SOURCE=.\Dic\Dic.c

"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

