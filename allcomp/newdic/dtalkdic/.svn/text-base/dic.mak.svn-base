# Microsoft Developer Studio Generated NMAKE File, Based on dic.dsp
!IF "$(CFG)" == ""
CFG=dic - Win32 British Debug
!MESSAGE No configuration specified. Defaulting to dic - Win32 British Debug.
!ENDIF 

!IF "$(CFG)" != "dic - Win32 Release" && "$(CFG)" != "dic - Win32 Debug" &&\
 "$(CFG)" != "dic - Win32 Release Spanish" && "$(CFG)" !=\
 "dic - Win32 Release German" && "$(CFG)" != "dic - Win32 Debug Spanish" &&\
 "$(CFG)" != "dic - Win32 Debug German" && "$(CFG)" !=\
 "dic - Win32 Debug Latin American" && "$(CFG)" !=\
 "dic - Win32 Release Latin American" && "$(CFG)" != "dic - Win32 ALPHA Release"\
 && "$(CFG)" != "dic - Win32 ALPHA Debug" && "$(CFG)" !=\
 "dic - Win32 ALPHA Release Spanish" && "$(CFG)" !=\
 "dic - Win32 ALPHA Release German" && "$(CFG)" !=\
 "dic - Win32 ALPHA Release Latin American" && "$(CFG)" !=\
 "dic - Win32 ALPHA Debug Spanish" && "$(CFG)" !=\
 "dic - Win32 ALPHA Debug German" && "$(CFG)" !=\
 "dic - Win32 ALPHA Debug Latin American" && "$(CFG)" != "dic - Win32 Profile"\
 && "$(CFG)" != "dic - Win32 British Release" && "$(CFG)" !=\
 "dic - Win32 British Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dic.mak" CFG="dic - Win32 British Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dic - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release Spanish" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release German" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug Spanish" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug German" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Debug Latin American" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 Release Latin American" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 ALPHA Release" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Release Spanish" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Release German" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Release Latin American" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug Spanish" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug German" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 ALPHA Debug Latin American" (based on\
 "Win32 (ALPHA) Console Application")
!MESSAGE "dic - Win32 Profile" (based on "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 British Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dic - Win32 British Debug" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "dic - Win32 Release"

OUTDIR=.\build\us\release
INTDIR=.\build\us\release\link
# Begin Custom Macros
OutDir=.\.\build\us\release\ 
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH" /D\
 "ENGLISH_US" /D "WINDIC" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\us\release\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Debug"

OUTDIR=.\build\us\debug
INTDIR=.\build\us\debug\link
# Begin Custom Macros
OutDir=.\.\build\us\debug\ 
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe" "$(OUTDIR)\dic.bsc"

!ELSE 

ALL : "$(OUTDIR)\dic.exe" "$(OUTDIR)\dic.bsc"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\dic.sbr"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dic.bsc"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "_CONSOLE" /D\
 "ENGLISH" /D "ENGLISH_US" /D "WINDIC" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\dic.pch"\
 /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\us\debug\link/
CPP_SBRS=.\build\us\debug\link/

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\dic.sbr"

"$(OUTDIR)\dic.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Release Spanish"

OUTDIR=.\build\sp\release
INTDIR=.\build\sp\release\link
# Begin Custom Macros
OutDir=.\.\build\sp\release\ 
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D\
 "WINDIC" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\sp\release\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Release German"

OUTDIR=.\build\gr\release
INTDIR=.\build\gr\release\link
# Begin Custom Macros
OutDir=.\.\build\gr\release\ 
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /D\
 "WINDIC" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\gr\release\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Debug Spanish"

OUTDIR=.\build\sp\debug
INTDIR=.\build\sp\debug\link
# Begin Custom Macros
OutDir=.\.\build\sp\debug\ 
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "_CONSOLE" /D\
 "SPANISH" /D "WINDIC" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\sp\debug\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Debug German"

OUTDIR=.\build\gr\debug
INTDIR=.\build\gr\debug\link
# Begin Custom Macros
OutDir=.\.\build\gr\debug\ 
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "_CONSOLE" /D "GERMAN"\
 /D "WINDIC" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 
CPP_OBJS=.\build\gr\debug\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Debug Latin American"

OUTDIR=.\build\la\debug
INTDIR=.\build\la\debug\link
# Begin Custom Macros
OutDir=.\.\build\la\debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "_CONSOLE" /D\
 "SPANISH" /D "WINDIC" /D "LATIN_AMERICAN" /Fp"$(INTDIR)\dic.pch" /YX\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\la\debug\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Release Latin American"

OUTDIR=.\build\la\release
INTDIR=.\build\la\release\link
# Begin Custom Macros
OutDir=.\.\build\la\release\ 
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D\
 "WINDIC" /D "LATIN_AMERICAN" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\la\release\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release"

OUTDIR=.\..\alpha\dtalkdic\us\Release
INTDIR=.\..\alpha\dtalkdic\us\Release\link
# Begin Custom Macros
OutDir=.\.\..\alpha\dtalkdic\us\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /Gt0 /W3 /GX /O2 /I ".\..\..\dapi\src\include" /I ".\dic" /D\
 "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "WINDIC" /D "ALPHA"\
 /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\..\alpha\dtalkdic\us\Release\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /pdb:"$(OUTDIR)\dic.pdb" /machine:ALPHA\
 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug"

OUTDIR=.\..\alpha\dtalkdic\us\debug
INTDIR=.\..\alpha\dtalkdic\us\debug\link
# Begin Custom Macros
OutDir=.\.\..\alpha\dtalkdic\us\debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /Gt0 /W3 /GX /Zi /Od /I ".\..\..\dapi\src\include" /I ".\dic"\
 /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "ENGLISH_US" /D "WINDIC" /D "ALPHA"\
 /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\..\alpha\dtalkdic\us\debug\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:ALPHA\
 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Spanish"

OUTDIR=.\..\alpha\dtalkdic\sp\Release
INTDIR=.\..\alpha\dtalkdic\sp\Release\link
# Begin Custom Macros
OutDir=.\.\..\alpha\dtalkdic\sp\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /Gt0 /W3 /GX /O2 /I ".\..\..\dapi\src\include" /I ".\dic" /D\
 "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "WINDIC" /D "ALPHA"\
 /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\..\alpha\dtalkdic\sp\Release\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /pdb:"$(OUTDIR)\dic.pdb" /machine:ALPHA\
 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release German"

OUTDIR=.\..\alpha\dtalkdic\gr\Release
INTDIR=.\..\alpha\dtalkdic\gr\Release\link
# Begin Custom Macros
OutDir=.\.\..\alpha\dtalkdic\gr\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /Gt0 /W3 /GX /O2 /I ".\..\..\dapi\src\include" /I ".\dic" /D\
 "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /D "WINDIC" /D "ALPHA"\
 /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\..\alpha\dtalkdic\gr\Release\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /pdb:"$(OUTDIR)\dic.pdb" /machine:ALPHA\
 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Latin American"

OUTDIR=.\..\alpha\dtalkdic\la\Release
INTDIR=.\..\alpha\dtalkdic\la\Release\link
# Begin Custom Macros
OutDir=.\.\..\alpha\dtalkdic\la\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /Gt0 /W3 /GX /O2 /I ".\..\..\dapi\src\include" /I ".\dic" /D\
 "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "WINDIC" /D "LATIN_AMERICAN"\
 /D "ALPHA" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\..\alpha\dtalkdic\la\Release\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /pdb:"$(OUTDIR)\dic.pdb" /machine:ALPHA\
 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Spanish"

OUTDIR=.\..\alpha\dtalkdic\gr\debug
INTDIR=.\..\alpha\dtalkdic\gr\debug\link
# Begin Custom Macros
OutDir=.\.\..\alpha\dtalkdic\gr\debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /Gt0 /W3 /GX /Zi /Od /I ".\..\..\dapi\src\include" /I ".\dic"\
 /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "WINDIC" /D "ALPHA"\
 /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\..\alpha\dtalkdic\gr\debug\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:ALPHA\
 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug German"

OUTDIR=.\..\alpha\dtalkdic\gr\debug
INTDIR=.\..\alpha\dtalkdic\gr\debug\link
# Begin Custom Macros
OutDir=.\.\..\alpha\dtalkdic\gr\debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /Gt0 /W3 /GX /Zi /Od /I ".\..\..\dapi\src\include" /I ".\dic"\
 /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "GERMAN" /D "WINDIC" /D "ALPHA"\
 /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\..\alpha\dtalkdic\gr\debug\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:ALPHA\
 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Latin American"

OUTDIR=.\..\alpha\dtalkdic\la\debug
INTDIR=.\..\alpha\dtalkdic\la\debug\link
# Begin Custom Macros
OutDir=.\.\..\alpha\dtalkdic\la\debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /Gt0 /W3 /GX /Zi /Od /I ".\..\..\dapi\src\include" /I ".\dic"\
 /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "SPANISH" /D "LATIN_AMERICAN" /D\
 "ALPHA" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\..\alpha\dtalkdic\la\debug\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:ALPHA\
 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 Profile"

OUTDIR=.\prof
INTDIR=.\prof\link
# Begin Custom Macros
OutDir=.\.\prof
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe" "$(OUTDIR)\dic.bsc"

!ELSE 

ALL : "$(OUTDIR)\dic.exe" "$(OUTDIR)\dic.bsc"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\dic.sbr"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dic.bsc"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\link\dic.map"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /O2 /I "\work\ad\dapi\src\include" /D\
 "_NDEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "WINDIC" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\prof\link/
CPP_SBRS=.\prof\link/

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\dic.sbr"

"$(OUTDIR)\dic.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /profile /map:"$(INTDIR)\dic.map"\
 /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 British Release"

OUTDIR=.\build\uk\release
INTDIR=.\build\uk\release\link
# Begin Custom Macros
OutDir=.\.\build\uk\release\ 
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe"

!ELSE 

ALL : "$(OUTDIR)\dic.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "NDEBUG" /D "_CONSOLE" /D "ENGLISH" /D\
 "ENGLISH_UK" /D "WINDIC" /Fp"$(INTDIR)\dic.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\uk\release\link/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\dic.pdb" /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dic - Win32 British Debug"

OUTDIR=.\build\uk\debug
INTDIR=.\build\uk\debug\link
# Begin Custom Macros
OutDir=.\.\build\uk\debug\ 
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dic.exe" "$(OUTDIR)\dic.bsc"

!ELSE 

ALL : "$(OUTDIR)\dic.exe" "$(OUTDIR)\dic.bsc"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dic.obj"
	-@erase "$(INTDIR)\dic.sbr"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dic.bsc"
	-@erase "$(OUTDIR)\dic.exe"
	-@erase "$(OUTDIR)\dic.ilk"
	-@erase "$(OUTDIR)\dic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "_CONSOLE" /D\
 "ENGLISH" /D "ENGLISH_UK" /D "WINDIC" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\dic.pch"\
 /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\uk\debug\link/
CPP_SBRS=.\build\uk\debug\link/

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dic.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\dic.sbr"

"$(OUTDIR)\dic.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)\dic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dic.obj"

"$(OUTDIR)\dic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "dic - Win32 Release" || "$(CFG)" == "dic - Win32 Debug" ||\
 "$(CFG)" == "dic - Win32 Release Spanish" || "$(CFG)" ==\
 "dic - Win32 Release German" || "$(CFG)" == "dic - Win32 Debug Spanish" ||\
 "$(CFG)" == "dic - Win32 Debug German" || "$(CFG)" ==\
 "dic - Win32 Debug Latin American" || "$(CFG)" ==\
 "dic - Win32 Release Latin American" || "$(CFG)" == "dic - Win32 ALPHA Release"\
 || "$(CFG)" == "dic - Win32 ALPHA Debug" || "$(CFG)" ==\
 "dic - Win32 ALPHA Release Spanish" || "$(CFG)" ==\
 "dic - Win32 ALPHA Release German" || "$(CFG)" ==\
 "dic - Win32 ALPHA Release Latin American" || "$(CFG)" ==\
 "dic - Win32 ALPHA Debug Spanish" || "$(CFG)" ==\
 "dic - Win32 ALPHA Debug German" || "$(CFG)" ==\
 "dic - Win32 ALPHA Debug Latin American" || "$(CFG)" == "dic - Win32 Profile"\
 || "$(CFG)" == "dic - Win32 British Release" || "$(CFG)" ==\
 "dic - Win32 British Debug"
SOURCE=.\dic.c

!IF  "$(CFG)" == "dic - Win32 Release"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 Debug"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

"$(INTDIR)\dic.obj"	"$(INTDIR)\dic.sbr" : $(SOURCE) $(DEP_CPP_DIC_C)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 Release Spanish"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_sp_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 Release German"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 Debug Spanish"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_sp_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 Debug German"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 Debug Latin American"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_sp_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 Release Latin American"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_sp_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	
NODEP_CPP_DIC_C=\
	".\opthread.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	
NODEP_CPP_DIC_C=\
	".\opthread.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Spanish"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	
NODEP_CPP_DIC_C=\
	".\opthread.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release German"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	
NODEP_CPP_DIC_C=\
	".\opthread.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Release Latin American"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	
NODEP_CPP_DIC_C=\
	".\opthread.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Spanish"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	
NODEP_CPP_DIC_C=\
	".\opthread.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug German"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	
NODEP_CPP_DIC_C=\
	".\opthread.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 ALPHA Debug Latin American"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	
NODEP_CPP_DIC_C=\
	".\opthread.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 Profile"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_gr_ph.h"\
	".\l_sp_ph.h"\
	".\l_uk_ph.h"\
	".\l_us_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	
NODEP_CPP_DIC_C=\
	".\opthread.h"\
	

"$(INTDIR)\dic.obj"	"$(INTDIR)\dic.sbr" : $(SOURCE) $(DEP_CPP_DIC_C)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 British Release"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\l_com_ph.h"\
	".\l_uk_ph.h"\
	".\ls_upper.tab"\
	".\port.h"\
	

"$(INTDIR)\dic.obj" : $(SOURCE) $(DEP_CPP_DIC_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dic - Win32 British Debug"

DEP_CPP_DIC_C=\
	".\DIC.H"\
	".\dic_comm.c"\
	".\ls_upper.tab"\
	".\port.h"\
	

"$(INTDIR)\dic.obj"	"$(INTDIR)\dic.sbr" : $(SOURCE) $(DEP_CPP_DIC_C)\
 "$(INTDIR)"


!ENDIF 


!ENDIF 

