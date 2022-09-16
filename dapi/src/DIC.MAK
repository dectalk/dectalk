# Microsoft Developer Studio Generated NMAKE File, Based on dic.dsp
!IF "$(CFG)" == ""
CFG=dic - Win32 ALPHA Debug United Kingdom
!MESSAGE No configuration specified. Defaulting to dic - Win32 ALPHA Debug United Kingdom.
!ENDIF 

!IF "$(CFG)" != "dic - Win32 Release" && "$(CFG)" != "dic - Win32 Debug" && "$(CFG)" != "dic - Win32 Release Spanish" && "$(CFG)" != "dic - Win32 Release German" && "$(CFG)" != "dic - Win32 Debug Spanish" && "$(CFG)" != "dic - Win32 Debug German" && "$(CFG)" != "dic - Win32 Debug Latin American" && "$(CFG)" != "dic - Win32 Release Latin American" && "$(CFG)" != "dic - Win32 ALPHA Release" && "$(CFG)" != "dic - Win32 ALPHA Debug" && "$(CFG)" != "dic - Win32 ALPHA Release Spanish" && "$(CFG)" != "dic - Win32 ALPHA Release German" && "$(CFG)" != "dic - Win32 ALPHA Release Latin American" && "$(CFG)" != "dic - Win32 ALPHA Debug Spanish" && "$(CFG)" != "dic - Win32 ALPHA Debug German" && "$(CFG)" != "dic - Win32 ALPHA Debug Latin American" && "$(CFG)" != "dic - Win32 Release United Kingdom" && "$(CFG)" != "dic - Win32 Debug United Kingdom" && "$(CFG)" != "dic - Win32 ALPHA Release United Kingdom" && "$(CFG)" != "dic - Win32 ALPHA Debug United Kingdom"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dic.mak" CFG="dic - Win32 ALPHA Debug United Kingdom"
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
!MESSAGE "dic - Win32 ALPHA Release" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 Release United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Console Application")
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
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /D "ENGLISH" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /D "ENGLISH" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /D "SPANISH_SP" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /D "WINDIC" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /D "SPANISH_SP" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /D "WINDIC" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /D "LATIN_AMERICAN" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "WINDIC" /D "SPANISH_LA" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release"

OUTDIR=.\..\alpha\dtalkdic\us\Release
INTDIR=.\..\alpha\dtalkdic\us\Release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:ALPHA /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug"

OUTDIR=.\..\alpha\dtalkdic\us\debug
INTDIR=.\..\alpha\dtalkdic\us\debug\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Spanish"

OUTDIR=.\..\alpha\dtalkdic\sp\Release
INTDIR=.\..\alpha\dtalkdic\sp\Release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:ALPHA /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release German"

OUTDIR=.\..\alpha\dtalkdic\gr\Release
INTDIR=.\..\alpha\dtalkdic\gr\Release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:ALPHA /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Latin American"

OUTDIR=.\..\alpha\dtalkdic\la\Release
INTDIR=.\..\alpha\dtalkdic\la\Release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:ALPHA /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Spanish"

OUTDIR=.\..\alpha\dtalkdic\gr\debug
INTDIR=.\..\alpha\dtalkdic\gr\debug\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug German"

OUTDIR=.\..\alpha\dtalkdic\gr\debug
INTDIR=.\..\alpha\dtalkdic\gr\debug\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Latin American"

OUTDIR=.\..\alpha\dtalkdic\la\debug
INTDIR=.\..\alpha\dtalkdic\la\debug\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	

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
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\include" /I ".\dic" /I "..\.." /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH_UK" /D "WINDIC" /D "ENGLISH" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\include" /I ".\dic" /I "..\.." /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_UK" /D "WINDIC" /D "ENGLISH" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release United Kingdom"

OUTDIR=.\..\alpha\dtalkdic\uk\Release
INTDIR=.\..\alpha\dtalkdic\uk\Release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dic.pdb" /machine:ALPHA /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug United Kingdom"

OUTDIR=.\..\alpha\dtalkdic\uk\debug
INTDIR=.\..\alpha\dtalkdic\uk\debug\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("dic.dep")
!INCLUDE "dic.dep"
!ELSE 
!MESSAGE Warning: cannot find "dic.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "dic - Win32 Release" || "$(CFG)" == "dic - Win32 Debug" || "$(CFG)" == "dic - Win32 Release Spanish" || "$(CFG)" == "dic - Win32 Release German" || "$(CFG)" == "dic - Win32 Debug Spanish" || "$(CFG)" == "dic - Win32 Debug German" || "$(CFG)" == "dic - Win32 Debug Latin American" || "$(CFG)" == "dic - Win32 Release Latin American" || "$(CFG)" == "dic - Win32 ALPHA Release" || "$(CFG)" == "dic - Win32 ALPHA Debug" || "$(CFG)" == "dic - Win32 ALPHA Release Spanish" || "$(CFG)" == "dic - Win32 ALPHA Release German" || "$(CFG)" == "dic - Win32 ALPHA Release Latin American" || "$(CFG)" == "dic - Win32 ALPHA Debug Spanish" || "$(CFG)" == "dic - Win32 ALPHA Debug German" || "$(CFG)" == "dic - Win32 ALPHA Debug Latin American" || "$(CFG)" == "dic - Win32 Release United Kingdom" || "$(CFG)" == "dic - Win32 Debug United Kingdom" || "$(CFG)" == "dic - Win32 ALPHA Release United Kingdom" || "$(CFG)" == "dic - Win32 ALPHA Debug United Kingdom"
SOURCE=.\Dic\Dic.c

!IF  "$(CFG)" == "dic - Win32 Release"


"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dic - Win32 Debug"


"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dic - Win32 Release Spanish"


"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dic - Win32 Release German"


"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dic - Win32 Debug Spanish"


"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dic - Win32 Debug German"


"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dic - Win32 Debug Latin American"


"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dic - Win32 Release Latin American"


"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "dic - Win32 Release United Kingdom"


"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dic - Win32 Debug United Kingdom"


"$(INTDIR)\Dic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug United Kingdom"

!ENDIF 


!ENDIF 

